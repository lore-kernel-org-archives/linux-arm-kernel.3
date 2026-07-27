Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBA2C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 17:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlghdMSPRSKxNMLTzFWRIhkpB12QpHhqkaaliOsTKx0=; b=EIPgOCcgyMpf5Z5CKIVtvdvt1r
	F9TvxLPHZ6nhAlQmZ19pm+T7YCcDMq+Aik8xfdlmt+tYFFVzQTGFPxfgSJ/8CAcafGiw08yyDSkMm
	QG8XZFggEPeTPlH5JuH6uLL7uBTYKU8GXsMZIUlCf5hvA7HWcQKzm1RKqKUQ/tzcoZTF2IzMAhvIC
	Gah3sJbGc7XkYYtfkY9yx0ACOXGdtXHCqlCxjZ9pnLyR0DzEDYIMB6hI2eLX8w7Hr1M8YGfp4n35v
	wmTgKDRO4nPoMvxiW2MUSLooz2olCNhDqUlqbUh9swsXBzhToP4A+nW5WuvwwTTQQL3bXwD2CEQ4N
	7dfiJKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPIF-00000003XWk-36BE;
	Mon, 27 Jul 2026 17:39:11 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPID-00000003XVb-2WEW;
	Mon, 27 Jul 2026 17:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1785173935; bh=jlghdMSPRSKxNMLTzFWRIhk
	pB12QpHhqkaaliOsTKx0=; b=Ra5ittPi8dRSqrDpBF3Y/IHUbUD6X7UOQQe+mTo21LoI1XtlIS
	5pfUJZNzDfFf4WXjmVfuDWrep2ikzdiRb6UbCU7E+1mfq+g3b6Q8RMg3lbAOZOXnGR8XHDlatee
	Fy/Xh5UC8kXuJ1QpTlNH3sG3LTAOjcrow5XxC0x4sbMLJ5Db/MG52iQPlrnDS1mO/l1pOFH7mvl
	dVZZXWy3V3jZc5bWF+B4ES9Fq3rklQ2MfFYvSl586zt5IKL783FZxUpK7Sz8ryUMQUzXXFiKToY
	0LQztGcSVpMY0ncLU1L2ca1Wcon6Ykh9CX+uODer2vkVv1/6mCRmG5T9lx3KqrcblHA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1785173935; bh=jlghdMSPRSKxNMLTzFWRIhk
	pB12QpHhqkaaliOsTKx0=; b=gA9BP3fVyhwXADcop3RZSAWLSz/Exti9QWx6M174+8nHqZRF8m
	g/Db60xKwCO56OHgO4lfnDm2Bl35I4bS6TDQ==;
Message-ID: <847c99d4-6fae-4984-b6d9-e1f8bf46b300@mainlining.org>
Date: Mon, 27 Jul 2026 13:38:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pmdomain: mediatek: Fix MT8183 hang on boot
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
 <fe909054-5c9d-42f5-bbc1-66ca0ace72de@mainlining.org>
 <dd1e30ae-46fd-4083-a306-98e2d23be120@collabora.com>
Content-Language: en-US
From: Brady Norander <brady.norander@mainlining.org>
In-Reply-To: <dd1e30ae-46fd-4083-a306-98e2d23be120@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_103909_808269_CF8B3ACB 
X-CRM114-Status: GOOD (  31.25  )
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

On 7/27/26 06:57, AngeloGioacchino Del Regno wrote:
> On 7/25/26 07:11, Brady Norander wrote:
>> On 7/22/26 09:27, Dmitry Osipenko wrote:
>>> Depending on firmware, part of the MFG domains may be left ON at boot
>>> leaving only some MFG cores powered, to let the ACP to prefetch the GPU
>>> region when the display controller is brought up. This doesn't play well
>>> with an eventual delay in probing Panfrost when the display 
>>> controller is
>>> fully set up, as that would make genpd's sync_state() to power off the
>>> domain while ACP tries to prefetch: this is causing an AXI stall,
>>> effectively freezing the AP indefinitely. In order to prevent this from
>>> happening, the sync_state() functionality must be obliterated on all of
>>> the MFG domains: while this guarantees a power leakage if the bootloader
>>> boots the kernel with MFG PDs partially powered on, this is the only way
>>> to ensure stable operation of the SoC during boot on devices with such
>>> firmware because, of course, those will never officially receive a
>>> firmware update.
>>>
>>> Fixes Kappa Chromebook hanging during system boot.
>>
>> I also saw this same issue on my MT8192 Hayato Chromebook, and I also 
>> saw an issue on my MT8183 and MT8186 Chromebooks where the audio was 
>> broken. I fixed all of those issues by setting the 
>> GENPD_FLAG_NO_STAY_ON flag on all domains. I held off from submitting 
>> that change as I was unsure if it was the "correct" way to handle it, 
>> but perhaps it is. Either way, this issue is not specific to only MT8183.
> 
> Audio is something a bit different I believe.
> 
> For MFG on MT8183 specifically (and potentially same generation or even 
> slightly
> older) there's an issue that is very specific and described in the 
> description
> of this commit.
> 

I do believe that the issue I'm seeing on MT8192 is very similar to the 
issue described on MT8183. On my MT8192 Hayato, I get the following 
sync_state warnings due to these two display components not having 
drivers which bind to them:

   [   25.828186] mtk-power-controller 10006000.syscon:power-controller: 
sync_state() pending due to 1400d000.postmask
   [   25.838380] mtk-power-controller 10006000.syscon:power-controller: 
sync_state() pending due to 1400e000.dither

This device boots just fine up until I reach the point where my display 
manager starts, where I get a full SoC hang. If I disable my display 
manager from starting at boot, the device boots to a shell just fine. 
While MT8192 doesn't have ACP to prefetch anything from the GPU, the 
display manager (which uses 3D accel) still appears to trigger an AXI 
stall (I don't know how to verify this is actually what happens, but it 
seems likely) and I would assume the bootloader also leaves the MFG 
domains partially enabled on MT8192 based on this behavior.

> So, specifically for audio, I think that there may be something else 
> that is
> wrong if you're seeing such a behavior - as in, some dependencies may be 
> missing
> from somewhere (some devicetree node), or something else.
> 

The audio issues I see on MT8183 and MT8186 also seem to have the same 
root cause, the bootloader leaving domains partially enabled. On my 
MT8183 krane I get these warnings:

   [   21.705672] mtk-power-controller 10006000.syscon:power-controller: 
sync_state() pending due to 14005000.dma-controller
   [   21.705677] mtk-power-controller 10006000.syscon:power-controller: 
sync_state() pending due to 14006000.mdp3-wdma
   [   21.705688] mtk-power-controller 10006000.syscon:power-controller: 
sync_state() pending due to 14012000.dither

And I get this error when attempting to play audio:

   [  217.282793] mt8183-audio 11220000.audio-controller:mt8183-afe-pcm: 
mtk_afe_pcm_pointer hw_ptr err

In both the MT8192 GPU case and the MT8183/8186 audio case, the issue 
was fixed with the following diff to not use the sync_state system to 
keep domains powered on:

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c 
b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 9c9323c8c93a..b0868e24e241 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -639,6 +639,7 @@ generic_pm_domain *scpsys_add_one_domain(struct 
scpsys *scpsys, struct device_no

  	pd->genpd.power_off = scpsys_power_off;
  	pd->genpd.power_on = scpsys_power_on;
+	pd->genpd.flags |= GENPD_FLAG_NO_STAY_ON;

  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
  		pd->genpd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;

What isn't clear to me is why leaving display domains powered on is 
preventing audio from working. Maybe there is some dependency that isn't 
clear to me? The other thing which isn't clear to me is why I never 
experienced the boot hang on MT8183. Either way, I'm experiencing issues 
on multiple SoCs which are fixed by allowing the domains to power off 
and back on.

> In any case, I'm always open for discussion, of course.

