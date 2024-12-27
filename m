Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70758E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+aVcM9v3TNGbuFeqCMbEPfxEC3QzdL9gjWHd99xPEg=; b=dfjRxhRy+va5xXWe53AlaevsdK
	i6c9hPkxo+IOHWRkwjI9CeQRTObUVdvcBWmNtB5gS5ejZpTj36QhFcVWniz/9FsaMTzRdoxGLAU8F
	Mbvfkt/YrpAF3MTqG/wtAcPkjYnb7U0M+7O2SI19rliA/LrELEoPa10jWPPRH7/JHaHwVL2cniMRY
	ffoCj1Vvaut6kG9TOWlQW5baXcmYhtImqXJAEfa8ik9ysG1/BRdqIkzFG1MmNkeAvaEtETm+bVcsE
	Z8jr/YTCj+g4tpyhpzGMENuT6hqd3l6T4cHZHHIlGGdXyp9gSPkjlqV5fRptap5CI1kpuM4rhdFeE
	1mLhVHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRE80-00000000ik7-2SqF;
	Fri, 27 Dec 2024 17:28:00 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDpX-00000000gWf-2vky;
	Fri, 27 Dec 2024 17:08:57 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1735319333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+aVcM9v3TNGbuFeqCMbEPfxEC3QzdL9gjWHd99xPEg=;
	b=eKCauRBIFjWdhQRTKcWc34askPCgFz+/QKBbL9VFE3Xw9osf4GyHzpH6oZ+0TfW7tWmBHZ
	LcLNZgo3NzmNalz+TyxcFPOSLN/OxRc1L82X8CaA+2tfOqT878hisB9g5f4tH8HhzKnQis
	kx2LxlHV6EYSlHSC01/PNqeVRKtz/M6O+k6CEYa+UaYOftUJVGyDTzr2Y8kFHdLiSAkB+g
	6uOJY8OC8vxwEn35a8jL+l9NHaztpL0b28LlD013SAedVySmi5yTIiEpImiBlhXu8ZWB56
	/6lrON+YT/Xm0e2nARpCt8QIcr7L0D0DsiwEh7HhfoEDo00xFgQOKECMUAd0/A==
Date: Fri, 27 Dec 2024 18:08:53 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: [PATCH 2/2] irqchip/gic-v3-its: Make "dma-noncoherent" preferred
 for RK358x errata
In-Reply-To: <87bjwxoyzo.wl-maz@kernel.org>
References: <cover.1735313870.git.dsimic@manjaro.org>
 <1382cd99ec213b5fb6f3b23d4e895f078f587b8f.1735313870.git.dsimic@manjaro.org>
 <87bjwxoyzo.wl-maz@kernel.org>
Message-ID: <f90c39e7637eebb6e021e3a9754eaa4b@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_090856_044038_9DB49B92 
X-CRM114-Status: GOOD (  25.05  )
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

On 2024-12-27 17:46, Marc Zyngier wrote:
> On Fri, 27 Dec 2024 15:42:24 +0000,
> Dragan Simic <dsimic@manjaro.org> wrote:
>> 
>> The preferred way to denote hardware with non-coherent DMA is to use 
>> the
>> "dma-noncoherent" DT property, [1] instead of relying on the 
>> compatibles. [2]
>> Alas, older versions of the Rockchip RK3588 and RK3588S SoC dts(i) 
>> files
>> failed to specify this DT property, which means that checking the 
>> compatibles
>> remains required for backward SoC dts(i) compatibility.
>> 
>> Let's have the Rockchip 3588001 hardware errata handled the preferred 
>> way,
>> with newer versions of the Rockchip RK3588, RK3588S and RK3582 SoC 
>> dts(i)
>> files that properly specify the "dma-noncoherent" DT properties at 
>> both the
>> GIC redistributor and the GIC ITS levels, while falling back to 
>> checking the
>> compatibles for backward RK3588 and RK3588S SoC dts(i) compatibility.
>> 
>> [1] 
>> Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
>> [2] 
>> https://lore.kernel.org/linux-rockchip/86msgoozqa.wl-maz@kernel.org/
>> 
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: FUKAUMI Naoki <naoki@radxa.com>
>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> ---
>>  drivers/irqchip/irq-gic-v3-its.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>> 
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c 
>> b/drivers/irqchip/irq-gic-v3-its.c
>> index fdec478ba5e7..982dcbb30f39 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -4747,6 +4747,18 @@ static bool __maybe_unused 
>> its_enable_rk3588001(void *data)
>>  {
>>  	struct its_node *its = data;
>> 
>> +	/*
>> +	 * The preferred way to denote hardware with non-coherent DMA is to 
>> use
>> +	 * the "dma-noncoherent" DT property, which the older RK3588 SoC 
>> dts(i)
>> +	 * files failed to specify, relying on the compatibles instead.
>> +	 *
>> +	 * Thus, check for the presence of "dma-noncoherent" DT property 
>> first,
>> +	 * to let the hardware quirk be handled the preferred way, and fall 
>> back
>> +	 * to checking the compatibles for backward dts(i) compatibility.
>> +	 */
>> +	if (!of_dma_is_coherent(to_of_node(its->fwnode_handle)))
>> +		return false;
>> +
>>  	if (!of_machine_is_compatible("rockchip,rk3588") &&
>>  	    !of_machine_is_compatible("rockchip,rk3588s"))
>>  		return false;
>> 
> 
> I'm sorry, but this patch serves no purpose. We already have a
> workaround in place, and we don't need to handle it *twice*.

Thanks for reviewing this series so quickly!

Regarding handling the workaround twice, I agree that this patch
is somewhat redundant, but without this patch and with the "dma-
noncoherent" DT properties in the proper places we'll actually
end up with some kind of double hanling.

More precisely, RDIST_FLAGS_FORCE_NON_SHAREABLE will be set twice,
which doesn't do any harm, but it's something that made me twitch
a bit and produce this patch.

> Worse, it is actively harmful. A DT that would only advertise the
> property on the ITS would result in a broken system, while it would
> work correctly with the current code.

Indeed, that possible issue bugged me as well.  Though, we can
probably rest assured that the RK3588 dtsi files are changed to
include the "dma-noncoherent" DT properties correctly.

> Additionally, look at what of_dma_is_coherent() does, and how it will
> fetch a property that is potentially completely unrelated to the GIC
> node, or eventually return some random default. The binding documents
> the dma-noncoherent property as part of the relevant nodes, and not
> anywhere else.

That's a possibility, but I think that the same argument about the
RK3588 dtsi correctness may also apply here.

> In the end, this is just dead code, and potentially worse. So while
> I'm rather supportive of your first patch in this series as it allows
> OSs other than Linux to *maybe* avoid this hack, the Linux driver
> doesn't need any change.

I'm happy to drop this patch, but I just wanted to describe the
rationale behind it, as explained above.

