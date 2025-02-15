Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363B9C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wEV1ADnqQWD8L1k/XFokDETvht2ffBYSspDwjyPN8g=; b=ttxPemjqU7ci1v2njLupQCDBdX
	OSzdmiqJXlQNnY8gR6QnxkR+bCNBuHobYOXIIPzI7cYbVi6UedCK0pFBQhLzqSGju2vDjyLt/8ktv
	chql2sT8oqWPykvpftvX6jYohQdK6zBeRML2qKZPMGYRXXDUQs60R0Ay27kW9pYn2Blhhq8yHHaG9
	t5aBNOBVNj30PrIgavAxLpxybl7I4CKJGhIiXbfijaUGv+tmk9ijLICWNXSrz0kvay48PaidqoL23
	roLFhPpPnAFYckuasDNOIPW+skRAcjaz2d5BjnwsJMHd/oFcWfN4L3UDOkKGXhBBQUSfcbRp1mGXv
	PvVtuB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjIc8-00000000BNQ-1Nyj;
	Sat, 15 Feb 2025 13:53:48 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjIag-00000000BEa-1pik
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 13:52:19 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38f32c1c787so654191f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 05:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739627537; x=1740232337; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4wEV1ADnqQWD8L1k/XFokDETvht2ffBYSspDwjyPN8g=;
        b=AiG2jJGDoDedZZErOL9mnpuWyBP7fwNroJ0Cg7NqFWfGXxzEfzOfJos+PoDOPudoRV
         /J3H39/yg/fU6UhupqDMdvfzN78uNTUo5QLB1sjzHAI0p5HSSxLcKUP8cQoRDrLw+otC
         CJkipg/fO83BvrmkW9v0vakxf+IRhPY4DYK4ODiBKol2qWtpsP+GwsDucTnSMR+iPC86
         3/6zNPmkF1n/36F29J5KdSes4YtCx88miNGPmprcLN8nRuhJVG8MbKwDQ8PaoSqPOZ+k
         1+BBmS46Kf4IbHBYp7bjWRlgQuQWmy1CNNaLO60gkfyQma25TCPc2P0Xq024v0Pzpcgy
         yNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739627537; x=1740232337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4wEV1ADnqQWD8L1k/XFokDETvht2ffBYSspDwjyPN8g=;
        b=ejGIpb0DRbDw4M8V61VmGsgS0OS8nrhy9g7DGJe82kcctYDCRKNKNr9BlaAwCGK3UR
         OXPaC+PiKhzqscKhE1wV81xMpCkyPS6frKb/yYBIeti17lIHIaJ0Qmeoh78jzqcVCtFl
         UGX/p3xuzozU+TUndY2+iQyWDN+zLdl2x4NAW262A3MSHoAXjGZLDPrLbwYKr/L57Hyj
         UOXyaYFShhN+nEToIbAru8ps1HopKKBH6ZeA25dfJn3eCOlHWZOdf1xsszUI9K77jZQB
         4phIkLNn17/H1VsKK1a5eo3XYqs5cHMQ4Yhv24WcKAEDJ2AKw21+qOUQoClManmkhJj3
         lVGg==
X-Forwarded-Encrypted: i=1; AJvYcCXNsNSIveX2CzxTUt3u3Wnx8TH4rzMa+Z4BsEGoz104mLt0xBgOO6HUkZTQZfXXqlfc/SYtASdDWtROnITIt9aX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz690b4+CwPfz/MYXgWyp6Q8EhGTf+eVIPtlqHKamQb7CLcj4NF
	QQXKYNtQDzM2nkgUFekE9pFdahthWSV3sFMqthIN+eZ1S2QTMG8b
X-Gm-Gg: ASbGncuuwTmvssicvlTD9BD14hCOfKBEo8SHlT+pOwM5K1yuo0eftT9T0ThfQAN7g0l
	AD2BvOoL9AEwTQ9v7V91wE+QlNBRNYvtxsX+Sp5UxLDO6Aiw367wfeOkBDT1asFwHhwLL8ysAOv
	gLmcRPxhk9dSdGXz6Od2/7awE12faHcSYQ6vhbN4ezOS4KNtCLZ3giSPIWEIz9z+qGZgdX65kLF
	JDwFdsfZhf5QGGN3spQn+3nCvFKPI2I7Hom8C+zywsUuSlQaRXGAyXFNZdkU6mb+6PjD5u1CsjI
	k1fw2idDPop9t5poe4tvUQIxb2aobQJ8P3C63c+Zo9wT42JVL8GSa64J8xLAFI99zdwu6Q==
X-Google-Smtp-Source: AGHT+IHUH/PSZrSEvYPRf7g1ThAvmE/rux13z69XbwZo1Qmd9SlXptEtu6drLDmn4VEdSVQBss2m8Q==
X-Received: by 2002:a5d:64cc:0:b0:38d:e707:f312 with SMTP id ffacd0b85a97d-38f33f53f95mr3614339f8f.46.1739627536424;
        Sat, 15 Feb 2025 05:52:16 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7df2sm7291484f8f.84.2025.02.15.05.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2025 05:52:15 -0800 (PST)
Message-ID: <8bcf7557-dff3-4017-84b1-184b20e028bf@gmail.com>
Date: Sat, 15 Feb 2025 15:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: exynos: update all samsung,mode constants
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>
References: <20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com>
 <173920411901.476943.11749535762195189252.robh@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <173920411901.476943.11749535762195189252.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_055218_483915_B5C51038 
X-CRM114-Status: GOOD (  19.55  )
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

On 2/10/25 18:22, Rob Herring (Arm) wrote:
> On Sun, 09 Feb 2025 15:20:43 +0200, Ivaylo Ivanov wrote:
>> Update all samsung,mode property values to account for renaming USI_V2
>> constants to USI_MODE in the bindings.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>> Patch picked from [1] and rebased on linux-next
>>
>> [1] https://lore.kernel.org/all/20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com/
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 14 +++---
>>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 48 +++++++++----------
>>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |  2 +-
>>  .../dts/exynos/google/gs101-pixel-common.dtsi |  4 +-
>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  2 +-
>>  5 files changed, 35 insertions(+), 35 deletions(-)
>>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.

Please note that this is happening because the bot didn't account for
header changes in the previous USIv1 patchset. Should be safe to apply
since the latter is in linux-next now (if it even merges).

Best regards,
Ivaylo

>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com:
>
> Error: arch/arm64/boot/dts/exynos/exynos850.dtsi:654.20-21 syntax error
> FATAL ERROR: Unable to parse input tree
> make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos850-e850-96.dtb] Error 1
> make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
> make[2]: Target 'arch/arm64/boot/dts/exynos/exynos850-e850-96.dtb' not remade because of errors.
> make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynos850-e850-96.dtb] Error 2
> Error: arch/arm64/boot/dts/exynos/exynosautov920.dtsi:309.20-21 syntax error
> FATAL ERROR: Unable to parse input tree
> make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb] Error 1
> make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
> make[2]: Target 'arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb' not remade because of errors.
> make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynosautov920-sadk.dtb] Error 2
> Error: arch/arm64/boot/dts/exynos/exynosautov9.dtsi:445.20-21 syntax error
> FATAL ERROR: Unable to parse input tree
> make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb] Error 1
> make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
> make[2]: Target 'arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb' not remade because of errors.
> make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynosautov9-sadk.dtb] Error 2
> Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:828.20-21 syntax error
> FATAL ERROR: Unable to parse input tree
> make[4]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb] Error 1
> make[3]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos/google] Error 2
> make[3]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
> make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
> make[2]: Target 'arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb' not remade because of errors.
> make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/google/gs101-oriole.dtb] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> make: Target 'exynos/exynos8895-dreamlte.dtb' not remade because of errors.
> make: Target 'exynos/exynos850-e850-96.dtb' not remade because of errors.
> make: Target 'exynos/exynos7885-jackpotlte.dtb' not remade because of errors.
> make: Target 'exynos/exynos990-x1slte.dtb' not remade because of errors.
> make: Target 'exynos/exynos5433-tm2.dtb' not remade because of errors.
> make: Target 'exynos/exynos990-r8s.dtb' not remade because of errors.
> make: Target 'exynos/exynos7-espresso.dtb' not remade because of errors.
> make: Target 'exynos/google/gs101-oriole.dtb' not remade because of errors.
> make: Target 'exynos/exynosautov920-sadk.dtb' not remade because of errors.
> make: Target 'exynos/exynosautov9-sadk.dtb' not remade because of errors.
> make: Target 'exynos/exynos990-c1s.dtb' not remade because of errors.
> make: Target 'exynos/exynos9810-starlte.dtb' not remade because of errors.
> make: Target 'exynos/exynos990-x1s.dtb' not remade because of errors.
> make: Target 'exynos/exynos5433-tm2e.dtb' not remade because of errors.
>
>
>
>
>


