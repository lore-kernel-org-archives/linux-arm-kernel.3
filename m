Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAB1E85372
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWTR6rblr2fx5wm1rQ9MFyWeL459JHJEvbHasb5FYls=; b=MTKSZBnyrZLZd6obCrsilFa4Pv
	CnQH6ISmlLuHsOPhNXjXfQn6Aidab6pm+lnFGQy4l2rqFFqBEFNcHZULwo5eTj86PThaqwz+2jifQ
	FYoDr515yyzyxiduX3f97GrciHwuC8vfjji1/Ha79mGwfjCfj88TOgbsIbiYOJTz1tiiLc+PLeVIF
	DtRmHpj56pBE/qqPBagOdmHd1Z0RmVZ1wecI8Udp5qnOIBuyq31VnYOTKbeLWpJq+ixBv+0zqFHda
	tV08qwdaPuG+QMA2Ol74GdLOtvk/vCGrh9ukznCkUKKaB1RQUd3koEx6fn3XXOGL6YJ31XybUg/jD
	/Xb7qHfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fiy-00000002AG5-2SzG;
	Fri, 03 Apr 2026 14:42:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fiv-00000002AFK-365C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:42:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso19899175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 07:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775227331; x=1775832131; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LWTR6rblr2fx5wm1rQ9MFyWeL459JHJEvbHasb5FYls=;
        b=vG0oYnvodJ7dnXI2wTIFU/nvvhONJUW24Q5T2RistF2h5POWyqA1k53zQpyFy8eg/d
         zEP3hsuGZaTCV4rMvRxnhtkhbz3DuJ66LjBhKdOjpW/A+EuIfIc8rYCCtDg58ROzdUaJ
         lpdy5KduPv/GIuCIVGbZztkS6pHmcR7ZITcXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775227331; x=1775832131;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWTR6rblr2fx5wm1rQ9MFyWeL459JHJEvbHasb5FYls=;
        b=kM4Trn75/bD6jznAAED6mCoSZzBnrceOTcWrIaI58Chw/ngDkR6+nOqpZAsjsoPbWw
         VDLKoeVOyP4QWhkYrRGAfvqScWPTtH6OHG/RS3IbLANjrf65/TXDubWLYlSntzYqQViN
         mD9bMh4L9P3JFHOQABmsUOEOEvMCxq0OWuWL0UbwbJz/Nkj3ORpOceEDUPWm7M4Hb9B6
         I40uPE8uZIf7u0rYdVRCBB2A/yDqIAOO0jNlKwgZn0XZO3/EC7hVPDwueiYQnxlRvvY3
         xGJR/kKxN6CSPb5AJuKjbyoeS9aDAZmIeku2PWroFT4fFCeCYbHZQThrOfMuL28wFvMW
         CIpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcJwMMKMg9YbZAeMt09lzmo3Cs7kKBX5F/TWfkhfWSrFE2X2iFbivNltU0WVTrTBC7znUmMmKae7FcoH85tKQX@lists.infradead.org
X-Gm-Message-State: AOJu0YzjNhKtGfoNwUh0UWBsr7WgJYMdTBP5uvvGbAu6i/1JmSj7+b2f
	FiAb+v7SBNX7hoSa3lxD0XFO5+0JbbCTi9OaZDGY6OUVwkDyg/fgfLmkSkCO30UL4yVeeCMEFpC
	hNmWuO9Q=
X-Gm-Gg: ATEYQzyomoHPbFMLmzBuX6zo5g9WjMyi+d7v0G2qRXwPq5r559Vs6gsxFT6MyxTZhG1
	9VD6Ct2wRllTlUqY1QCUaDFtRxDWZUfh2SwTHJhxNDfELpKDsWZAqHMMk4CFCmZiCOl7bzsLi8A
	lpBtmKUFv3kwjb06UZns4zx0fGGryMRjf204losoiSMtsbbp/knQd+zXxEHJdseVFcNr2DjE2RG
	suuyWdo/4DgkoBQw2Q39gUykRf0wJCXcSD/JK81OqG89R/iaImh7Fw0GcQNQ8BTTKR2X2pcwx4U
	/8VLt043BhVEtbdFpaiF2D9HG3EfjMTE0AUu0tiiHSsRalG2A/h224odRJTBc3A4Th2PF6UNDpo
	3Te3gyKGAlD/PKogKvdXhfReM0X0y5LrjoIDjw8qrKkefpgNiHgOqGOvLKuhG6TQuC/JstBM091
	aolvs4A71F2Fdkjkp/lltC0FabSYtLjxWRvtHslSFnqsGFkf5iBf83677B0oRzQeVTrfqaVfDnY
	mcbilJGjnI0fkt4KDqxTURzxmk4GYjfMzg5h3g8FPcgh8UzGuDrIlKyaRNHiRcIZA==
X-Received: by 2002:a05:600c:4e14:b0:483:6a8d:b2f9 with SMTP id 5b1f17b1804b1-488996afed9mr53212995e9.5.1775227330527;
        Fri, 03 Apr 2026 07:42:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a? (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr. [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4889cb46adcsm45021385e9.4.2026.04.03.07.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 07:42:10 -0700 (PDT)
Message-ID: <5725f03b-2750-428f-ae66-5f1a24dd0714@smile.fr>
Date: Fri, 3 Apr 2026 16:42:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-main: Update delay select values
 for MMC1/2 subsystems
To: Moteen Shah <m-shah@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 kristo@kernel.org, vigneshr@ti.com, nm@ti.com, stable@vger.kernel.org
References: <20260218203823.1825554-1-romain.naour@smile.fr>
 <8d4a2839-5b1e-479e-a462-dbbc3d016020@ti.com>
From: Romain Naour <romain.naour@smile.fr>
Content-Language: fr, en-US
In-Reply-To: <8d4a2839-5b1e-479e-a462-dbbc3d016020@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_074214_162832_A92CE30D 
X-CRM114-Status: GOOD (  21.00  )
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

Hello Moteen, All,

Le 31/03/2026 à 14:19, Moteen Shah a écrit :
> Hey Romain,
> 
> Thanks for the patch
> 
> On 19/02/26 02:08, Romain Naour wrote:
>> The previous SPRSP36J datasheet recommends to set ti,otap-del-sel-sd-hs
>> value to 0 for MMC1 and MMC2 interfaces. These values were updated in
>> kernel 6.5. As a result we have some occasional regression with ultra
>> high speed DDR50 SDXC cards while mounting the rootfs:
> 
> This error shouldn't be limited to just DDR50, were you seeing similar behavior
> with other speed modes?

I have a followup patch to enable back the SDR104 support with j721e SoC (SR 1.1
and 2.0) and I noticed the same behavior with some "specific" SDcards.

The J721e SR 1.0 doesn't support SDR104 due to an errata.
Nowadays, even the TI J721e EVM board revA (reference board) uses a SR1.1 SoC.

See the post on TI forum with further analysis:

https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1626659/dra829j-q1-mmcsd-ultra-high-speed-uhs-modes-issues

It turnout that the kernel is not able to detect UHS speed with some SDcards
vendors after uboot initialized them with UHS speed (SDR104). I'm not sure why.

Still, the datasheet was updated with a new set of timing values for HS and
legacy speed.

Maybe I should remove the part about SD card initialization issues, it may be
related to another issue.

>>
>>    mmc1: error -110 whilst initialising SD card
>>
>> A similar issue may occur with u-boot after a reboot while
>> initialising the SD card:
>>
>>    mmc_init: -110, time 67
>>
>> Update the delay values for legacy and high speed modes, based on
>> the latest revised datasheet SPRSP36K released in April 2024 [1].
>>
>>    (MMC1/2 - SD/SDIO Interface): Updated/Changed the
>>    "OTAPDLYENA, DELAY ENABLE" and "OTAPDLYSEL, DELAY VALUE" for the
>>    Default Speed and High Speed modes from "0x0" to "0x1"
>>
>> [1] Table 6-86. MMC1/2 DLL Delay Mapping for All Timing Modes, in
>> https://www.ti.com/lit/ds/symlink/tda4vm.pdf,
>> (SPRSP36K – SEPTEMBER 2021 – REVISED APRIL 2024)
>>
>> Cc: stable@vger.kernel.org # 6.5+
>> Fixes: af398252d68e ("arm64: dts: ti: k3-j721e-main: Update delay select
>> values for MMC subsystems")
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> ---
>>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/
>> ti/k3-j721e-main.dtsi
>> index d5fd30a01032..418e6010ef1f 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> @@ -1643,8 +1643,8 @@ main_sdhci1: mmc@4fb0000 {
>>           clocks = <&k3_clks 92 5>, <&k3_clks 92 0>;
>>           assigned-clocks = <&k3_clks 92 0>;
>>           assigned-clock-parents = <&k3_clks 92 1>;
>> -        ti,otap-del-sel-legacy = <0x0>;
>> -        ti,otap-del-sel-sd-hs = <0x0>;
>> +        ti,otap-del-sel-legacy = <0x1>;
>> +        ti,otap-del-sel-sd-hs = <0x1>;
>>           ti,otap-del-sel-sdr12 = <0xf>;
>>           ti,otap-del-sel-sdr25 = <0xf>;
>>           ti,otap-del-sel-sdr50 = <0xc>;
>> @@ -1671,8 +1671,8 @@ main_sdhci2: mmc@4f98000 {
>>           clocks = <&k3_clks 93 5>, <&k3_clks 93 0>;
>>           assigned-clocks = <&k3_clks 93 0>;
>>           assigned-clock-parents = <&k3_clks 93 1>;
>> -        ti,otap-del-sel-legacy = <0x0>;
>> -        ti,otap-del-sel-sd-hs = <0x0>;
>> +        ti,otap-del-sel-legacy = <0x1>;
>> +        ti,otap-del-sel-sd-hs = <0x1>;
>>           ti,otap-del-sel-sdr12 = <0xf>;
>>           ti,otap-del-sel-sdr25 = <0xf>;
>>           ti,otap-del-sel-sdr50 = <0xc>;
> 
> 
> Reviewed-by: Moteen Shah <m-shah@ti.com>

Thanks!

Best regards,
Romain

> 
> Regards,
> Moteen
> 


