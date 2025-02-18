Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3172C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2Mmqb1Mk7iE4u/cA5jv4vjZ4vx0m26FAwwSyjZdlAQ=; b=IuWbj5Rz5ZRmfJ09AI0dHhLL7C
	S8bUEDwKhXJQUevhd373hLctzs2FOxvwxQseklsQU26cWwGL+l6VUcU/RY0txvtM7NbtBQJRjrmQL
	tiBojtKeTpI5Z8Q5tTwzdZERniG/lCUxktPFiBUC7D0TlcG6hnWyMBwBHmOfVxQFqgUf2fVeX8K5n
	SlmklGW1tHW+qNP/DPggzkdzrUSs/NR9xeA8sjZ1CEk/u/NMBU1KTJO1bFJzPJeG/oiYaEgtSI89r
	beNINIz7aIfpgNARkpGjgU/0XUJ7Svd8XeiTFrwEb3IQY9vVMTxjq7kCTLBF9bta/WdwQ20muOjUv
	6he0A/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMkK-000000089XW-3rI6;
	Tue, 18 Feb 2025 12:30:41 +0000
Received: from mta-65-226.siemens.flowmailer.net ([185.136.65.226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMf0-000000088OW-1ivX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 12:25:12 +0000
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025021812250313399ded4408aba238
        for <linux-arm-kernel@lists.infradead.org>;
        Tue, 18 Feb 2025 13:25:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=diogo.ivo@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=G2Mmqb1Mk7iE4u/cA5jv4vjZ4vx0m26FAwwSyjZdlAQ=;
 b=LYnOnoVzgyvt12BzEBe4VCAtllZyzgApaONlStzl87LQ29SrPPal3so2Kv7HmCgq4Ld9S7
 4JEn/o4WmOcWz+1JMdwklNEOfmMGoLAEo0dAXatefHPXGhGsjnkKkJwuGIsgGd55oQKOGXRC
 RQm6nZI5WWfQBog8RYiB8xQ8xaXWnR1aNkCA/4UKRLB7xWOVrYVerS8q3NSW93NU2X97sB9+
 mcf1JZorJoE2dRh9W2+YgEea0iz23kjFC4C/IuOyhvRyKzjQxNQ8UBlqQDSaSBuVP+umSias
 BDTLqrMQfDqhz26QVFYf9tFU4sJqmeozUU5VMjiYWgCqPol3D0wtN8Kg==;
Message-ID: <c8bdd93d-5690-4b8a-819f-853756b57a71@siemens.com>
Date: Tue, 18 Feb 2025 12:24:59 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 1/3] net: ti: icssg-prueth: Use page_pool API
 for RX buffer allocation
To: "Malladi, Meghana" <m-malladi@ti.com>, Roger Quadros <rogerq@kernel.org>,
 danishanwar@ti.com, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 u.kleine-koenig@baylibre.com, krzysztof.kozlowski@linaro.org,
 dan.carpenter@linaro.org, schnelle@linux.ibm.com, glaroque@baylibre.com,
 rdunlap@infradead.org, jan.kiszka@siemens.com, john.fastabend@gmail.com,
 hawk@kernel.org, daniel@iogearbox.net, ast@kernel.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, diogo.ivo@siemens.com
References: <20250210103352.541052-1-m-malladi@ti.com>
 <20250210103352.541052-2-m-malladi@ti.com>
 <152b032e-fcd9-4d49-8154-92a475c0670c@kernel.org>
 <615a2e1f-5ee5-4d80-a499-8ff06596a2fc@ti.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@siemens.com>
In-Reply-To: <615a2e1f-5ee5-4d80-a499-8ff06596a2fc@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328357:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_042511_027937_3973D1EA 
X-CRM114-Status: GOOD (  13.65  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Meghana,

On 2/18/25 10:10 AM, Malladi, Meghana wrote:
> On 2/12/2025 7:26 PM, Roger Quadros wrote:
>> Can we get rid of SKB entirely from the management channel code?
>> The packet received on this channel is never passed to user space so
>> I don't see why SKB is required.
>>
> 
> Yes I do agree with you on the fact the SKB here is not passed to the 
> network stack, hence this is redundant. But honestly I am not sure how 
> that can be done, because the callers of this function access skb->data
> from the skb which is returned and the same can't be done with page (how 
> to pass the same data using page?)
> Also as you are aware we are not currently supporting SR1 devices 
> anymore, hence I don't have any SR1 devices handy to test these changes 
> and ensure nothing is broken if I remove SKB entirely.

I have some SR1 devices available and would be happy to test these
proposed changes in case they are feasible.

Best regards,
Diogo

