Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82089C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ef3lKA0rLNLP/xT8R6zae0u50qaptXQISSyjVmsZXKA=; b=0PpalFk34kHJioNIxVZv0lC7fv
	c8q0P57bKl5YNJj6XUI0qiuKUdAltuPSwpk0aLm8+aiJ6MarvFNI7cNzK7xhVOyQZk1XcRl6cdfI9
	ikjJJH31hoyX78K0GG6HesLAsDe+/8vQrcb90VGjcbl42f/nHv4h6ws0zif9q19JUNmbwGp3p4J1w
	e7jZEg/DnnmMkaav8lhUk9Fdl+TFlG1GrgYm55iCerloQ0TKag/4uR7zLAYMjmzIH8EqREdliUXtb
	MGW5ZiUc0uh5mpFsi/oVINsoQOro6Ux7/ATuii76E0+F/NeSu1ZeeeTmNbqg4eE44OB124HthLZtc
	Pd/mwK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJ8V-00000002Xr4-3Ke0;
	Mon, 27 Jul 2026 11:04:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJ8T-00000002XqE-4AEl;
	Mon, 27 Jul 2026 11:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785150278;
	bh=QM/K8aOc5Up2gdGT9i+OHNKgkTN1erLCWtsav788hrY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nx1sxHrM4Gt9yN4Ces1O83GaplTN8qv4vVmwOAKihOgOgmvoI8rPtVh4RuLuVfjnH
	 VyWjXMbLiBzhZAukMWSSh+ZIhbufyfp3ODsIYNvJQCVmCGpV5gHNOuUt1jnJ1nmjcw
	 LpojVlFqmmGlp6IBOulOA4c966bFCYfP0P9J58wSxQHMIhEF+F1AbbKFI9GEw+0jdW
	 4eUX6JDZB6kOwMAzCeiTO2hJawrrgkDUjDLq5fQdoNdynszoEOS/CVSPnmGZXw0ThP
	 k35BrqEGIinPrZ8jEZ2i3NyIs2AJUxT5NJ03QI0Pt5PckKDuUAQc/egjgcC8ak2XyV
	 Fl1Ap1TqcbEBw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A990C17E001F;
	Mon, 27 Jul 2026 13:04:37 +0200 (CEST)
Message-ID: <3130633c-fbff-4b1a-a127-bd4eb678c3f6@collabora.com>
Date: Mon, 27 Jul 2026 13:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pmdomain: mediatek: Fix MT8183 hang on boot
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
 <CAPx+jO-1_ZpYcnPtoYxRn5vv34tiP7TXnjKZ3SaWkEzdeTfXpA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAPx+jO-1_ZpYcnPtoYxRn5vv34tiP7TXnjKZ3SaWkEzdeTfXpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_040442_186290_3A734B1B 
X-CRM114-Status: GOOD (  28.32  )
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

On 7/24/26 17:01, Ulf Hansson wrote:
> On Wed, Jul 22, 2026 at 3:28 PM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> Depending on firmware, part of the MFG domains may be left ON at boot
>> leaving only some MFG cores powered, to let the ACP to prefetch the GPU
>> region when the display controller is brought up. This doesn't play well
>> with an eventual delay in probing Panfrost when the display controller is
>> fully set up, as that would make genpd's sync_state() to power off the
>> domain while ACP tries to prefetch: this is causing an AXI stall,
>> effectively freezing the AP indefinitely. In order to prevent this from
> 
> I haven't made any detailed investigation, but to me, it sounds like
> there is a missing consumer somewhere.
> 
> Should the ACP/panfrost devices be a consumer of the MFG domains as
> well? Or perhaps, if the ACP/panfrost should rely on the display
> controller to be probed and powered-on, to be able to probe?
> 

This is about how the bootloader is leaving the display controller, the ACP,
and the MFG registers before booting the kernel.

The kernel drivers themselves will reset this weird state when the HW gets
to full probe so there won't be any more issue(s) from that point onwards.

Actually, there would be A LOT to say about this, but I'll be very brief...

Basically, before booting the kernel, the bootloader is leaving a half-assed
setup to potentially support continuous splash functionality, but without it
being actually used on the device(s) that we're talking about here...

Again, I should put a remark on every word of that last paragraph, but this
is the gist of it.

If you're curious or need more information, of course I can expand a bit,
there's no secret involved here, it's just that I'm avoiding to write a wall
of text around that...

P.S.: We've been discussing that internally and chasing this issue for months
before deciding to "solve" it like this.

Cheers,
Angelo

>> happening, the sync_state() functionality must be obliterated on all of
>> the MFG domains: while this guarantees a power leakage if the bootloader
>> boots the kernel with MFG PDs partially powered on, this is the only way
>> to ensure stable operation of the SoC during boot on devices with such
>> firmware because, of course, those will never officially receive a
>> firmware update.
>>
>> Fixes Kappa Chromebook hanging during system boot.
>>
>> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
>> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> Kind regards
> Uffe
> 
>> ---
>>   drivers/pmdomain/mediatek/mt8183-pm-domains.h | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pmdomain/mediatek/mt8183-pm-domains.h b/drivers/pmdomain/mediatek/mt8183-pm-domains.h
>> index 3742782a2702..5e33b8628e85 100644
>> --- a/drivers/pmdomain/mediatek/mt8183-pm-domains.h
>> +++ b/drivers/pmdomain/mediatek/mt8183-pm-domains.h
>> @@ -47,7 +47,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
>>                  .pwr_sta2nd_offs = 0x0184,
>>                  .sram_pdn_bits = 0,
>>                  .sram_pdn_ack_bits = 0,
>> -               .caps = MTK_SCPD_DOMAIN_SUPPLY,
>> +               .caps = MTK_SCPD_DOMAIN_SUPPLY | MTK_SCPD_KEEP_DEFAULT_OFF,
>>          },
>>          [MT8183_POWER_DOMAIN_MFG] = {
>>                  .name = "mfg",
>> @@ -57,7 +57,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
>>                  .pwr_sta2nd_offs = 0x0184,
>>                  .sram_pdn_bits = GENMASK(8, 8),
>>                  .sram_pdn_ack_bits = GENMASK(12, 12),
>> -               .caps = MTK_SCPD_DOMAIN_SUPPLY,
>> +               .caps = MTK_SCPD_DOMAIN_SUPPLY | MTK_SCPD_KEEP_DEFAULT_OFF,
>>          },
>>          [MT8183_POWER_DOMAIN_MFG_CORE0] = {
>>                  .name = "mfg_core0",
>> @@ -67,6 +67,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
>>                  .pwr_sta2nd_offs = 0x0184,
>>                  .sram_pdn_bits = GENMASK(8, 8),
>>                  .sram_pdn_ack_bits = GENMASK(12, 12),
>> +               .caps = MTK_SCPD_KEEP_DEFAULT_OFF,
>>          },
>>          [MT8183_POWER_DOMAIN_MFG_CORE1] = {
>>                  .name = "mfg_core1",
>> @@ -76,6 +77,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
>>                  .pwr_sta2nd_offs = 0x0184,
>>                  .sram_pdn_bits = GENMASK(8, 8),
>>                  .sram_pdn_ack_bits = GENMASK(12, 12),
>> +               .caps = MTK_SCPD_KEEP_DEFAULT_OFF,
>>          },
>>          [MT8183_POWER_DOMAIN_MFG_2D] = {
>>                  .name = "mfg_2d",
>> @@ -85,6 +87,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
>>                  .pwr_sta2nd_offs = 0x0184,
>>                  .sram_pdn_bits = GENMASK(8, 8),
>>                  .sram_pdn_ack_bits = GENMASK(12, 12),
>> +               .caps = MTK_SCPD_KEEP_DEFAULT_OFF,
>>                  .bp_cfg = {
>>                          BUS_PROT_WR(INFRA,
>>                                      MT8183_TOP_AXI_PROT_EN_1_MFG,
>> --
>> 2.54.0
>>

