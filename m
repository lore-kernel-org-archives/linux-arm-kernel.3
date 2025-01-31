Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C298C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPvMYgrTTXfl/4a/sMQAc/M5TAnYMP1h9gbwf8tJM9E=; b=23eaYOOwfwRKGQvcb93Cvayeqp
	/fhFG8z/OUs2Otcvx4qduODT1Q6Bo68LonmSL3XTdBPPSSKd4kHfu3gssJS/vCFKtgceH/1HFeZoI
	dZb+WkIQcy94U1iEoermIK/aDrETh/5Cvcz599p5ZtlKoozEspUrKfXOkRVa9aAOJYYtpPsVHl+yW
	z//1+QpRDJvruxF7mRdMeZgmyxMij3ZdQEDXb/NvzrRplH6aLSDWiY8OO0cCWQ023o57kW5Y/k98S
	nL5iu/DyU/EDhn2KXZMY18B5ZJor8ILSuvn6VT4UNPblD4IAVwrL0lFqRIZnd3a+ZvCfIfz1Yf7r6
	0TjG27+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdsZT-0000000Ao7l-49Xv;
	Fri, 31 Jan 2025 15:04:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdsY9-0000000AntI-208i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 15:03:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E983497;
	Fri, 31 Jan 2025 07:03:42 -0800 (PST)
Received: from [10.1.32.52] (e122027.cambridge.arm.com [10.1.32.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 996973F694;
	Fri, 31 Jan 2025 07:03:13 -0800 (PST)
Message-ID: <d6265f8e-51bc-4556-9ecb-bfb73f86260d@arm.com>
Date: Fri, 31 Jan 2025 15:03:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 3/3] net: stmmac: Specify hardware capability value
 when FIFO size isn't specified
To: Andrew Lunn <andrew@lunn.ch>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Yanteng Si <si.yanteng@linux.dev>,
 Furong Xu <0x1207@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
 <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
 <07af1102-0fa7-45ad-bcbc-aef0295ceb63@arm.com>
 <fc08926d-b9af-428f-8811-4bfe08acc5b7@lunn.ch>
 <f343c126-fed9-4209-a18d-61a4e604db2f@arm.com>
 <a4e31542-3534-4856-a90f-e47960ed0907@lunn.ch>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <a4e31542-3534-4856-a90f-e47960ed0907@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_070317_567479_70227446 
X-CRM114-Status: GOOD (  12.92  )
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

On 31/01/2025 14:47, Andrew Lunn wrote:
>>> I'm guessing, but in your setup, i assume the value is never written
>>> to a register, hence 0 is O.K. e.g. dwmac1000_dma_operation_mode_rx(),
>>> the fifosz value is used to determine if flow control can be used, but
>>> is otherwise ignored.
>>
>> I haven't traced the code, but that fits my assumptions too.
> 
> I could probably figure it out using code review, but do you know
> which set of DMA operations your hardware uses? A quick look at
> dwmac-rk.c i see:
> 
>         /* If the stmmac is not already selected as gmac4,
>          * then make sure we fallback to gmac.
>          */
>         if (!plat_dat->has_gmac4)
>                 plat_dat->has_gmac = true;

has_gmac4 is false on this board, so has_gmac will be set to true here.

The DT compatible is rockchip,rk3288-gmac

Steve

> Which suggests there are two variants of the RockChip MAC.
> 
> 	Andrew


