Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340F4CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBLghRpDnKN0bEo3TKQupICpm0Ote+xiP5+E9br8q0Y=; b=x/xFClvba+/tDyKoiGRoZwrCOU
	+eMkkIzxz7BM0uj1bK6cVlg1Ic+Fj8K/CihFJ2/LWOEib7J0SahrKQX0z4u0YLaosy36MSfkov3VG
	1tx9KIALmHET0bJPOrZsZKEkIMJvgh1f9BerKiqEmwLoZVkIV7Y6M5OgL0e66Vw6w/TqojUBeaKrc
	9HFdgpAsScOnQEh5NGpHEcBcP3R/zgNRx9lbR90ll1wXIB/0LsChNiUI82+RNMnT7TN5ygwGNgRdT
	YeecDBW1Y7Ae7xDSCXNhydGPl+mnOgwTFERAqVaJdum7uiW7euOYSGW2EZ9/DGcTs1mJfYauEr251
	mNl+kNGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphrf-000000046zG-3Tw4;
	Sat, 23 Aug 2025 06:36:35 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTbt-000000030E5-0JKt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:23:22 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MFNDLW754277;
	Fri, 22 Aug 2025 10:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755876193;
	bh=VBLghRpDnKN0bEo3TKQupICpm0Ote+xiP5+E9br8q0Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TXKpmGyNM/uEgtR/FgNT1eyTAgohzC8a0+t3WtH1M+Lonyf8qw4QaIwjX1sAcA+0n
	 DgdLthlfRL+3SOyGBP/GnTDuO05NUOTKNsG7bONu3Tir7cpqZO/eHIROJ5sKCW1GMQ
	 AWfqUHFzQ1ApqFB6aeZ2J7QhQDCCdYPzMAspzGV0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MFNDMG2793766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 10:23:13 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 10:23:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 10:23:13 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MFNDV33741978;
	Fri, 22 Aug 2025 10:23:13 -0500
Date: Fri, 22 Aug 2025 10:23:13 -0500
From: Nishanth Menon <nm@ti.com>
To: Michael Walle <mwalle@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter
 Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla
	<srini@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v1 0/7] Initial Kontron SMARC-sAM67 support
Message-ID: <20250822152313.vjzjtzik2q5ek5kq@sadly>
References: <20250822131531.1366437-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_082321_272394_AEA9382B 
X-CRM114-Status: GOOD (  21.60  )
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

On 15:15-20250822, Michael Walle wrote:
> Now that the PMIC support is there, we can finally, upstream the
> support for this board. Besides the usual device tree, this
> patchset contains the support for the on-board house keeping MCU. It
> make extensive reuse of the drivers for the former SMARC-sAL28
> board. Besides different hwmon sensors, all the dt binding patches
> will just add a board specific compatible (in addition to the old
> sl28 compatible) to make any future board specific quirks possible.
> 
> I'm aware that there is a patch [1] which moves the sl28cpld MFD
> schema to a different directory. Once that patch is merged, I'll
> repost this series. But I already want to get some early feedback.
> 
> [1] https://lore.kernel.org/r/20250822075712.27314-2-krzysztof.kozlowski@linaro.org/
> 
> Michael Walle (7):
>   dt-bindings: arm: ti: Add bindings for Kontron SMARC-sAM67 module
>   dt-bindings: mfd: sl28cpld: add sa67mcu compatible
>   dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
>   dt-bindings: watchdog: add SMARC-sAM67 support
>   dt-bindings: nvmem: sl28cpld: add sa67mcu compatible
>   hwmon: sl28cpld: add SMARC-sAM67 support
>   arm64: dts: ti: Add support for Kontron SMARC-sAM67

Since this goes through multiple maintainers, may I suggest the
following strategy?

for this window:
* send dts and board binding changes dropping the nodes that are yet to
 be upstream
* send the compatible changes to each of the maintainers

Next window:
* add the nodes based on acceptance of the driver bindings

This removes multiple maintainers needing to give me immutable tags etc.

What do you think?
> 
>  .../devicetree/bindings/arm/ti/k3.yaml        |    1 +
>  .../hwmon/kontron,sl28cpld-hwmon.yaml         |    1 +
>  .../bindings/mfd/kontron,sl28cpld.yaml        |    7 +-
>  .../nvmem/layouts/kontron,sl28-vpd.yaml       |    7 +-
>  .../watchdog/kontron,sl28cpld-wdt.yaml        |    7 +-
>  arch/arm64/boot/dts/ti/Makefile               |    6 +
>  .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1092 +++++++++++++++++
>  .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   19 +
>  .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   24 +
>  drivers/hwmon/sl28cpld-hwmon.c                |   76 +-
>  10 files changed, 1234 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso
> 
> -- 
> 2.39.5
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

