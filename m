Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA08C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ykwNTPa96xH7D5B69cdYs89EmbSHISfkJ+wiG4Ge8w=; b=wg3pPiiSDl4om0iwBMoXs5m5eo
	WlPp04QLnKcJ/rzSjnQUogrfzb2eEo9EWGl+UlS1wKW8Z8DY4aypkaqkiNuL8uf0Jxp7ik6myw0Q2
	P+Kpp3WMym9rMbhrr1TcYiY9PYY9lhC4Wf2C9hrmwr4PnNqMUdaI0jEnbKP7ykwy31od7rYZtR3L8
	nz5lERIxVcVA9myU7V2TlAMb53/NRdVnEsGOwqDRkudC05Y95u9exuOPLAdPdOd63QyWWpHfKvFNR
	O2Svsjy4coEXLlfQFA6wWWAL1YUVU9m9BEY9Q8Vz1rHBJ2PB1AJ31IyV5fe2hzoRtbzIyun9gbEoc
	+aWBMe9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQ9a-00000008tTq-0etl;
	Tue, 18 Feb 2025 16:08:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQ3v-00000008s2X-3Bi5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 16:03:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E23FEA41279;
	Tue, 18 Feb 2025 16:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65627C4CEE2;
	Tue, 18 Feb 2025 16:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739894586;
	bh=Qb2ewoBBdIkfatXZOY9Up8MK8RjKWh6vf/e+Ck7LFYc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eKBVKgvPP5Cy1fgizplgS1AY2aj41oZ85GgtO14QskHv5mzh3yo8vmQo+EfhBOQaf
	 WsIM7eA2JOW8ZEMfZN+tPw6lUAXr1wuDoh+P77aTERJ6x3db9LqcjJZD/oLCsQ4AwB
	 CuflV6yS5nlvj0GlVJNh27JnrHW/xIx+dvPjLmvHBckedMhwNJwlxgW51i+zrzjaxU
	 ViO63I8XxAJZfKxKqNAO+mKiW4lfZlQhU6VvvAvrDfsT7Tszujpgxd786CU+MrKUCr
	 /Ba3sG/AtA+MUBuYJf0DtbHLWchnHSQV7U7ZgBvHdayMrWJz1z/f3ALrWFxh9EU5QY
	 902l45aMr4ISQ==
Message-ID: <285d1541-6af4-4dc3-bdcd-720bfc1f9aa4@kernel.org>
Date: Tue, 18 Feb 2025 17:02:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/3] Add native mode XDP support
To: Meghana Malladi <m-malladi@ti.com>, rogerq@kernel.org,
 danishanwar@ti.com, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 u.kleine-koenig@baylibre.com, krzysztof.kozlowski@linaro.org,
 dan.carpenter@linaro.org, schnelle@linux.ibm.com, glaroque@baylibre.com,
 rdunlap@infradead.org, diogo.ivo@siemens.com, jan.kiszka@siemens.com,
 john.fastabend@gmail.com, daniel@iogearbox.net, ast@kernel.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20250210103352.541052-1-m-malladi@ti.com>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <20250210103352.541052-1-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_080307_862175_19C6EF25 
X-CRM114-Status: UNSURE (   6.75  )
X-CRM114-Notice: Please train this message.
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


On 10/02/2025 11.33, Meghana Malladi wrote:
> This series adds native XDP support using page_pool.

Please also describe *what driver* to adds XDP support for.

This cover letter will (by netdev maintainers) be part of the merge
commit text.  Thus, please mention the driver name in the text.

This also applies for the Subject line.  It should either be prefix with
"net: ti: icssg-prueth:" like you did for other patches, or be renamed
to e.g.: "Add native mode XDP support for driver ti/icssg-prueth".

Thanks,
--Jesper

