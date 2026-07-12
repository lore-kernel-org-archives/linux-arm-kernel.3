Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60429C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 09:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rPmXWzvpcr2U5us8E3wSwDjB0cnRDNPHHdHK0WpIwuA=; b=etT7RCfFL5qwjI
	MH0Hkl7qZUCSgfGjcsHtQxCCo5B4CzkoSLh/HYN8fiQCdLe6xcBvjiwewXYGyerxsl8MKtmGLXcXe
	rRtz5sPTcfo1cZdtfxFDJbNYPMYhDIPe+/+chdlqmhRaY7DJ++g+Mh3VAYG/wRZVnyNMBlseRB4fH
	dkfoevk2eZseAp9qYKd0ZSiGcCwol2frl008ddCDbCe+gjQrzX6Z5IhuoweIj9t86H9mD10YwHFu4
	H7IpcSB5TXO2jh0mwwaERzU0FzUXhU6REUl0JWPmPwe6xfjbIc9iEzkjwc7/Tm8Jfe3kfEWQmitud
	hbp+mIk+gaObZYnBLwBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjO-00000007J8y-0TXT;
	Sun, 12 Jul 2026 09:44:14 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjL-00000007J8d-3KWD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 09:44:13 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so2495498a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849450; x=1784454250; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rPmXWzvpcr2U5us8E3wSwDjB0cnRDNPHHdHK0WpIwuA=;
        b=DeqjvlcHVpj2WQTyzAo8XBgeOffwvIS0ZuJdAgTJiBWr4ebCX6njXZAOzYwFXSyZI8
         +0no3Wjvhn3OQxsi86TrNnK7t5a1Hex8v/Y4DsDn6HcopVNwnGzlcSwJZubgSJo9jbzU
         uhFFUUPQ5ZUV/r9d2c/hPCLCNAFxRKa+NvEVLM1UgF3WTowD8F8tlnyPSuOcELMSzHV0
         Huo25an6GlFyYz3HM4KGHR5moqXKgqWruDmBxADoFLWs/WZ+8edtlbROtHUaFz5Bmxjd
         vgkN14VSqHlW2FwVbkhxGzydoJkOuPuMtdBp1UZ8X5oO9j4lOLwWsI+kvXhIyOIEl5VS
         mMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849450; x=1784454250;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rPmXWzvpcr2U5us8E3wSwDjB0cnRDNPHHdHK0WpIwuA=;
        b=fcPaNxSrBFv6zEnkk23gI+MwkFAqmijV2D/wti4TpdfhG5VoHkChKmQPROAuS8JXrZ
         tdIU7KNVbuUaNXU0wDVx82XD0rZRMdeTM256A5t4XjEUNO7g4N1OYUhcghGM55iS3NAv
         VLzDlJKzQf293uSKHrJ6dFjmjWwJl3A9GTN3kKL+Dsx/CmX7S5LkiOM98GXPMnauD2hH
         OzMwLz2DfPzmqHFuLm2W298ZHgM1H1iHMnQUFJRY9I36z4I39T4PVNUBDbPdVQBbkt6y
         fC2vQxsO40CnErCbC15nTvG1SZ2AE7H0ssI6r9zlVD7e4NTgOoQT8fkt2hhcuLpEJKeD
         6zNA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7NtVMkTqm8+iT7J/GniJ1KIiuWv7Ii5JHus7rEslKq9lfg6GsHNXEs8ReVobMjyr37znmadPTdKDOZpqZS0xp@lists.infradead.org
X-Gm-Message-State: AOJu0YxAWwOCNOyIBK8Uz18MmFvcrHKIXcIE/+zrrk7vyWnzzAm5c3iE
	mXkopQez9SbIipRCe7q4x9x16DdTJ8oUO1aDKkVaJ58T5dOAIfWn1ax0
X-Gm-Gg: AfdE7ck5KmzcECnJsYuDrXxu6uGsVutPFlPH4otV/P8KyobnBqawKQ61lLRg1gA3Y3F
	AQ3Cn1VYfsOm8isM8B8OhNp82VbhVE039zdY0VhV9DMjhiYoGFyQV/lyWq2QZIpynvJxWD/5bLM
	DaSZsUyxGRHSdtMK2Rf7Em05XrQK0R+jcTAmEDgaT+jeD2NHAFzQ8NnRAO+24AUl+H9PusSJN9a
	oi62RFIsF909LU4vIpUkViqDBaetz63UrOhZEos0jHcCLsSNe4W+y2J8Aztuv7NvQbC+/gXctZp
	RiP1df9dtItyrx7SfMzGfL3nVBaXkF+9m7KAGhAOGa7fO2tZUHdW0/dMcRH6Av9Fs9HHU5NWvKS
	DrdOb6UgG1YBjwSOmlwajBOZnZps+RDmlAFwF6rpGkcUNgiOQDOl1kU+nZGJPhw9OMbMqBUV55J
	MfspyQ6xnesc/gEMKO6C2mPg9vphhPo2MbOt5Dk/6p9Um2hiPcOkE+fYPonkxBfXUvD0iDa80vi
	1Ukfw9Vw38P/joD2w+0dAiwYYeuW1U4CN4bIv9hOc9fWeI1712CEx8RVwLW3Feh
X-Received: by 2002:a17:90b:3911:b0:369:7f25:cec0 with SMTP id 98e67ed59e1d1-38dc72b44c6mr5259932a91.0.1783849450298;
        Sun, 12 Jul 2026 02:44:10 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 00/12] arm64: dts: apple: Add SMC hwmon nodes
Date: Sun, 12 Jul 2026 19:43:19 +1000
Message-Id: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Mj3eLcZN3i0qSU1DLdlBJdg+REE3MDMyNTI8M0JaCegqLUtMwKsHn
 RsRA+UHFWanIJyBCl2loAYoy1bXEAAAA=
X-Change-ID: 20260712-smc-subdev-dt-0ca47062521f
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4957;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=YNi+KaL09fSqJUFhYIm9Pv1YZHlYeYppyCtgEVXaTS0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/eKAhPs7t7/lyq706ND7fYvWe6iLJu0/t0bjtTj
 2HezxeqHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKlmX8jI0HxEMYLHwVl16YH/Rd2nXkemhFX5r1Wcxe67+Ml6T88XxxkZ5hg4vev
 jrbwWlvhNxD6le3fgZ0Hu0rP+IT7/zm57sOU+JwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_024411_876428_CEFDC0B3 
X-CRM114-Status: GOOD (  17.13  )
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

Hi folks,

Following on from the series which added SMC hwmon driver[1], this
series spins out and adds the Devicetree nodes required for the hwmon
driver to operate. These were missed back in December.

The System Management Controller on Apple Silicon devices exposes
the temperature, voltage, power and fan speed data from numerous
(potentially hundreds) of sensors scattered about the SoC and
device at large. Unfortunately there is very little rhyme or reason
to how Apple expose these using the SMC firmware's FourCC key-value
system. Some sensors are reliably common across all devices and
all SoCs, like PSTR which measures the total platform power consumption.
Others are specific to a class of device, like the fan control
keys, which are only present on devices with fans. Some are specific
to a single SoC, and others still are specific to a single device.
To complicate matters further, some SoCs are not even consistent
across devices; the application core temperature sensors for a
given SoC are read from different keys depending on the device
that SoC is in...

Trying to express all of this in every device's Devicetree is a fool's
errand. To eliminate duplication, we instead use .dtsi files to
compose a set of sensors for each device in a saner way:
    - Sensors empirically proven to exist on all SoCs for all devices
      go in hwmon-common.dtsi
    - Sensors empirically proven to exist on all devices with a given
      SoC can go in a SoC-specific hwmon-${soc}.dtsi file, much as we
      do with PMGR and GPIO currentlyo
    - Sensors empirically proven to exist on all devices of a specific
      class go in hwmon-${class}.dtsi (e.g. hwmon-laptop.dtsi)
    - Fan control endpoints are reliably common across all devices
      with fans, which will #include hwmon-fan-*.dtsi
    - Sensors specific to one device only can be expressed in that
      device's specific .dts file

This series introduces some basic sensors we know about to get the ball
rolling. As you can imagine trying to find every valid sensor on every
device and figure out what it's actually measuring is a tedious and
labour intensive process, so expect more sensors at some point in
the future.

Regards,
James

[1] https://lore.kernel.org/asahi/20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com/

---
James Calligeros (12):
      arm64: dts: apple: t8112: Add SMC hwmon node
      arm64: dts: apple: t8103: Add SMC hwmon node
      arm64: dts: apple: t600x: Add SMC hwmon node
      arm64: dts: apple: t602x: Add SMC hwmon node
      arm64: dts: apple: Add common SMC hwmon infrastructure
      arm64: dts: apple: t8103: Add common SMC hwmon sensors
      arm64: dts: apple: t8112: Add common SMC hwmon sensors
      arm64: dts: apple: t600x: Add common SMC hwmon sensors
      arm64: dts: apple: t602x: Add common SMC hwmon sensors
      arm64: dts: apple: t8103: jxxx: Add device-specific SMC hwmon sensors
      arm64: dts: apple: t8112: jxxx: Add device-specific SMC hwmon sensors
      arm64: dts: apple: t60xx: jxxx: Add device-specific SMC hwmon sensors

 arch/arm64/boot/dts/apple/hwmon-common.dtsi    | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi  | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi       | 17 +++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-laptop.dtsi    | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-mini.dtsi      | 16 ++++++++++++++++
 arch/arm64/boot/dts/apple/t6001-j375c.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6001.dtsi           |  2 ++
 arch/arm64/boot/dts/apple/t6002-j375d.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6002.dtsi           |  2 ++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi      |  4 ++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6020-j474s.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6021.dtsi           |  2 ++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6022.dtsi           |  2 ++
 arch/arm64/boot/dts/apple/t602x-die0.dtsi      |  4 ++++
 arch/arm64/boot/dts/apple/t8103-j274.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts       |  3 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8103.dtsi           |  5 +++++
 arch/arm64/boot/dts/apple/t8112-j413.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts       |  3 +++
 arch/arm64/boot/dts/apple/t8112.dtsi           |  5 +++++
 26 files changed, 186 insertions(+)
---
base-commit: 44696aa3a489d2baf58efa61b37833f100072bee
change-id: 20260712-smc-subdev-dt-0ca47062521f

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>


