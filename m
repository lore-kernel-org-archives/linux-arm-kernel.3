Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C60C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KN+zGCwqnRr77YLBHNGCvv6ivP6Fw2MCgfq05HPwV4M=; b=ec1+rJ8+T2I6OW
	yl6LygNFgKHnN2kU7PC7NxiMz3Gamr4hVcLZMJAZ8NjhE8S4csE1+NpXf/KnBUo6wHQsF7Nti6MmI
	kODSxZjeKOJE4mint3404j2Ox+/n6vuZUC4CTdF6ZTTlyLPkbaF5GgOCBGMLOR3Ub9V3+nB0kuxHJ
	5q4+e1Ss+7Mk1daTUWildyzdbRQGeefkzO4Xz9ChdY8ZfyAULeniMhhS451jmN4bd2CgPrRJCbn2B
	b1oBk88YxWZ/9bwxPUMB8rA9PgHskmJhnyGHUrROUNCEazjvKZyZmNv7AunXRKG2occDF7+i0v+U2
	Y+Nlr1o7QJkoKbpChGeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWd0-0000000B2An-05L9;
	Tue, 14 Jul 2026 06:28:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWcx-0000000B2AJ-2EVJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:28:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cc73e322dbso45461095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010502; x=1784615302; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KN+zGCwqnRr77YLBHNGCvv6ivP6Fw2MCgfq05HPwV4M=;
        b=RNd+PDCQNSEHVxLvnACUQfrPMReUUZSdoX9R3E5ywhsnHe8Nk0gxMcXUnpcWHItV1V
         Spk2gVcdfHXlQbSf7iEKxTzNpQcsCGeHaVk6ZPeavGGemPP5mLITJaqYFewJzIbHT//P
         MMGQZmtKKuUQ1pcqez8BePY0YRYCp0fA2K/+oEVI7F/OuqqCpYD07Egigfa27qQTjaTy
         dtjqk6L1TZ0PM7Rf6rwlOPdn6s8jGPiJYbGsG69KnzrqWxFu/NbEpVhBtAE8So0++Ud4
         H6gkxtYUntLNPs3Btj8XQ7q6ciPsLw6GskhUV3ssHdo0JWC7ASVb5DiIO1Zu2pHuTB3s
         vH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010502; x=1784615302;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KN+zGCwqnRr77YLBHNGCvv6ivP6Fw2MCgfq05HPwV4M=;
        b=MkJQthxYrgOfFEweV5JRkQ3V5ghvn05xBxRxBC4SL1tx6nYfup/Ts/ygllXbdNYS0E
         cM6SlcjGweSLjVVWU24Pft0WPynmlCe0Ni8fw4jdpSNKPA4gVFf9/1Nfe1sWRLqsniLN
         5pVtPFRaaIZDHrSF+KsaEfVqki36kHFMH80H4pedPiE4B8U50W6DOXFGNHeIaYpL77hv
         57xf/mWJrhgjLbqdM/CZVICWVXEPQ62bVf284H7A0Qxob7oOwYeb4NkJYKb/64vgCZGo
         fvMsOxO7FTlA3SV2JRPzY9lCAflj556hDJTKxkPFbjh2RlZwl5PYEZkvCCWhDLIxADsX
         gPlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrrl77HRC5RMDVFAXvvuxKurbFVam1/LrhFeMy7sTwDsPUikxnNv78rDFWpw/R2QuH9Ukzk7hXDfTP4Efez47fE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9m7bTIZ5ZChjg/CZEfqZIEiD4QyluU2fWyXQfNckmjUX+hdcN
	O69vLXlfwhisphCDKoMuQz3WMV8U/GnR+54GWIj25YJ5ZvH4SVE+91Rx
X-Gm-Gg: AfdE7cnBAwQtg0JpHZUfCtwJzMYJKci274goh5QsWxf7Y+wi4tDs1ZJcE7OLsiIp+xg
	vpH0yQuakFjgl1m81qVNHzY6M/fPrd5qiNx48Q+jfXPsEAw5qQ95Q9ZG35DacoBn1pA9lVM9dOO
	VyXU5GybSCb8hyL8hLl5rxoywZZpYznkf7umi9P7BkKa83pKC1shEohyER6Aem0ByFcl6tG1rX9
	ZjUo/Y+vMhCXkt5DzZ36/XzHd0ElEWep+lq4aNRTbIu02d5lICjSDiFVW6Cr0EYDXFDps26qvHw
	vTpsmdKv4D/ODmlY2e98ocSFhpCvqiHTnLk5is4ghw7PPEYY/09qdKc0qtZjMpXjhZLJ8d7pXaV
	Ar4ZII/9wtsfVD2fPPfXtOpTSsDIchSCFJEoN01zHpZGmuHmrGndM58i3WWrw1qAhksVeiiHHeX
	4ZmptQSvzjNkOSLwlqCCBGmcCtRoB+c+ZwPbAzIkvZd1LHFNfVP1NL2jGTBP4bBxmOC4kc7eWHo
	AUL9V+OC9NhZpJHGutn3Z0grXfbywPZox67a1+ohp0yt6ouIgmfGf55ivbDRgEb
X-Received: by 2002:a17:902:f605:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2ce9eab85f7mr116798135ad.13.1784010502236;
        Mon, 13 Jul 2026 23:28:22 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:21 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 00/12] arm64: dts: apple: Add SMC hwmon nodes
Date: Tue, 14 Jul 2026 16:28:07 +1000
Message-Id: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2jHTKm3iyv8wLLAdYIw80mKjI
 fy7BdcuT3LuuQtEDsIRLsUCgZNEGYcM+lCA6+qhZRSfGTRpQ1ZpjL3D+Lp7TuhnJFefLRldatV
 A3kyBG3nvvVv14yw/2M1bZDM6ifMYPvthUpv3r50UElprTkTGl9bZa9vX8jy6sYdqXdcvU+5WB
 7wAAAA=
X-Change-ID: 20260712-smc-subdev-dt-0ca47062521f
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5470;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=M0eRETR/rM4kRQsJzoAQ0bq/TtjH3de46IG5ZXvH01A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1/7wfGyQCeixe5ykE2YjmPf+GPu3ZPHj13K8VsQ8n
 VD3VPhBx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKoZ2Bn++2jMU27IMtfi+56cPKHKJdSc+em3U+Z1Mx3kN6jf/yezleGf6bfj39b
 lNC+/vtttxaaV9x+xf75jfCMuXti+ZEWzhcsENgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_232823_584719_3DA36973 
X-CRM114-Status: GOOD (  18.30  )
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
Changes in v2:
- Fix M2 series Mac Studio fan includes
- Link to v1: https://patch.msgid.link/20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com

To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

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


