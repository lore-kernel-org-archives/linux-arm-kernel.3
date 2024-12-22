Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEA2E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 18:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6HHZqHUNdVtJlOPyBhOIVZSJXQ5Yu5vErJJFMSA9nk=; b=CZn1pq3hGc7OAg7v/k+06RFrjL
	gL+Quf7fIWlqLVitQ8lBAFAcMxMKcF7pFbUs4c7GrnkeY+EeSJhxBpjMSEQA3Iy5mKvlJiivuNQgm
	HV2eEPyAAsBisMhVraUNm8GUXT9OQzM/L7RuyoFireR3i7Ve3zuHqVfP9kKMvfjEUS/Nq95UYbFx+
	8zVblCeEkmgl7ejh8FaQ4d3vH0YvH3Bz97r7KD4TOzYcU4EkpTRclhPgSufxVNa9g8+gU8k3lLFiB
	cAtePvE93jiVgF7YZPxncX2X43QBYfnsv6czqGod3XRAAHzhhDpf5ZfflMgz1ibmJtD5O2m6gSHx0
	YRbqrVpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQej-00000008hek-33wI;
	Sun, 22 Dec 2024 18:26:21 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPQdX-00000008hc8-3Jy9;
	Sun, 22 Dec 2024 18:25:09 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1734891904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N6HHZqHUNdVtJlOPyBhOIVZSJXQ5Yu5vErJJFMSA9nk=;
	b=DeJZxdG4Hy4iOrkXhJUxhoikUNyS8J6aPoaQxkcCx/aiREhoPibwMEKvgNUy5fHsVrzVUi
	nzCu5Jizs83gqciozYDkZvsac6BLAka3HeiB4ICV6uhCXdBTPdHNegrn5NcJp4qBKMz8ie
	jF3N+l/LbkyVtx84PZfMcxtHLMgJ4y87nmIQ7AMwiJ0WDWCt3Rsm2zPOlRcOsJhIL0S3I7
	m4na8aXg/FcbQl8xgvED+SPCxneL3Jgo1TEU3S6L+cxK6Q4IWbf14oYcqzaeGlq4WxxwQp
	pNmfWxFiMM/uBhLpui+tFAz2BSqQBERiH5uFTU9/XIoGAvHobplQm8ZxKj5cPg==
Date: Sun, 22 Dec 2024 19:25:02 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: FUKAUMI Naoki <naoki@radxa.com>, heiko@sntech.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, tglx@linutronix.de,
 jonas@kwiboo.se, macromorgan@hotmail.com, andyshrk@163.com,
 liujianfeng1994@gmail.com, dmt.yashin@gmail.com, tim@feathertop.org,
 marcin.juszkiewicz@linaro.org, michael.riesch@wolfvision.net,
 alchark@gmail.com, sebastian.reichel@collabora.com, jbx6244@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/3] irqchip/gic-v3: Enable Rockchip 3588001 erratum
 workaround for RK3582
In-Reply-To: <86msgoozqa.wl-maz@kernel.org>
References: <20241222030355.2246-1-naoki@radxa.com>
 <20241222030355.2246-2-naoki@radxa.com> <86msgoozqa.wl-maz@kernel.org>
Message-ID: <f93b3bfb5151e4b617b1c99c91b4956f@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_102508_291011_810CBC24 
X-CRM114-Status: GOOD (  17.50  )
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

Hello Marc,

On 2024-12-22 10:04, Marc Zyngier wrote:
> On Sun, 22 Dec 2024 03:03:53 +0000,
> FUKAUMI Naoki <naoki@radxa.com> wrote:
>> 
>> Rockchip RK3582 is a scaled down version of Rockchip RK3588(S). Apply
>> Rockchip 3588001 erratum workaround to RK3582.
>> 
>> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
>> ---
>>  drivers/irqchip/irq-gic-v3-its.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c 
>> b/drivers/irqchip/irq-gic-v3-its.c
>> index 92244cfa0464..c59ce9332dc0 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -4861,7 +4861,8 @@ static bool __maybe_unused 
>> its_enable_rk3588001(void *data)
>>  {
>>  	struct its_node *its = data;
>> 
>> -	if (!of_machine_is_compatible("rockchip,rk3588") &&
>> +	if (!of_machine_is_compatible("rockchip,rk3582") &&
>> +	    !of_machine_is_compatible("rockchip,rk3588") &&
>>  	    !of_machine_is_compatible("rockchip,rk3588s"))
>>  		return false;
>> 
> 
> Please use the relevant property for that purpose ("dma-noncoherent")
> at the distributor and ITS levels. We're not adding extra compatibles
> for this anymore, and you might as well fix the core dtsi to expose
> such property.

Thanks for your response.

After a more detailed look into drivers/irqchip/irq-gic-v3-its.c,
it seems that relying on the "dma-noncoherent" DT property may not
be equivalent to adding another compatible check.  Here are a few
quotations from irq-gic-v3-its.c, to illustrate this better:

4746 static bool __maybe_unused its_enable_rk3588001(void *data)
4747 {
4748         struct its_node *its = data;
4749
4750         if (!of_machine_is_compatible("rockchip,rk3588") &&
4751             !of_machine_is_compatible("rockchip,rk3588s"))
4752                 return false;
4753
4754         its->flags |= ITS_FLAGS_FORCE_NON_SHAREABLE;
4755         gic_rdists->flags |= RDIST_FLAGS_FORCE_NON_SHAREABLE;
4756
4757         return true;
4758 }
4759
4760 static bool its_set_non_coherent(void *data)
4761 {
4762         struct its_node *its = data;
4763
4764         its->flags |= ITS_FLAGS_FORCE_NON_SHAREABLE;
4765         return true;
4766 }

4814 #ifdef CONFIG_ROCKCHIP_ERRATUM_3588001
4815         {
4816                 .desc   = "ITS: Rockchip erratum RK3588001",
4817                 .iidr   = 0x0201743b,
4818                 .mask   = 0xffffffff,
4819                 .init   = its_enable_rk3588001,
4820         },
4821 #endif
4822         {
4823                 .desc   = "ITS: non-coherent attribute",
4824                 .property = "dma-noncoherent",
4825                 .init   = its_set_non_coherent,
4826         },

As visible above, using the "dma-noncoherent" DT property results
in not setting the RDIST_FLAGS_FORCE_NON_SHAREABLE flag, which the
its_enable_rk3588001() function does.  In other words, it doesn't
seem that "dma-noncoherent" is a "drop-in" replacement for adding
yet another compatible for the RK3582.

Modifying the current behavior of the "dma-noncoherent" DT property
doesn't seem like an option, because it's already used in a couple
of board dts(i) files.  Should we introduce another DT property,
perhaps "dma-noncoherent-rdist" or something similar?

Could you, please, advise on how to move forward with this?  I'm
willing to implement the required patches, but I'd prefer to reduce
the possible back-and-forth on them, to save everyone's time.

