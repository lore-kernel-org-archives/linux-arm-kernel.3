Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981BDC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=flXIHxP55T3td3EAF+4UDOtvTJ+j4gzcSAMkRD2rGz8=; b=GyjsrWw9LnKKgLhR7n2o6lxIUV
	L/A1l5+h9C/EV9BTrYn8bbcu2WkfthIbUTBh6w2DRDjTEWRE8db3/CEu2IMY8OyWc8/emH8WURlvJ
	6wfDvYTuzg8A854ooQ32BCbWXCTd8S5frko7ACSzoxoEOGA5rs5jsaJbbLi0gRxK4FJQgEKFaSQSo
	lFDI4/qHeiT5JWEkAFCfruUPf3qGgSbKx5V5yfbd2ooM7RYx9oL+kx4l52OynRECGpbGcoux2dQBF
	R7RCvALaTXhD54027uv3uPlDfLtSvSeZeO92EK/mvig7NzbbcLCYxWOpUhDl6ZqkkXUR05zdqdaBl
	TFhBJVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZMs-00000006vfv-1FZO;
	Mon, 07 Sep 2026 13:26:38 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZMp-00000006vds-38ws
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:26:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c197e7e4e94so571579366b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787594; x=1789392394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=flXIHxP55T3td3EAF+4UDOtvTJ+j4gzcSAMkRD2rGz8=;
        b=J+O+Y0ivbVZYG1vIHj7cnZpZMHOUI5qAO1oYSheqX48KrlPQVkqMJZoKmsf0lD+Hlz
         wx5BgGazKNLnDxfth+9VYbmnGh8ysx/9OGy5XwF6t4Ie3RO8REXZBuMcRbYTadlkwueA
         9qDmv8hqmzJJuqb/EAm1kMvrvNF5pczFp7CdNIo8WrNa8RmZ/VQd8D+8CEziFPbCaHSt
         Yl7/Bh1MxOXioP9uhntAsEw8a9uGVuQ2UH7hr8zXXAiH/v6HKP5PvzRcny4fgiPzNmOO
         FgTS54VUjfYKD1TJKVFJzXjW92AUEa/5sqV4v5L3P+YQXuGkt1cKrN/Ne+m5tGfEOiRi
         pHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787594; x=1789392394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flXIHxP55T3td3EAF+4UDOtvTJ+j4gzcSAMkRD2rGz8=;
        b=Us/6gUcdYiHzndNalLQQM2elH9PehwQaDL7s3NLOIc5j5r1jnSkEeLZ/V+xFzNx+Xm
         isIx0jd9Q3O9YUI3GSGtH7usLnlMvqZ4HuCWG3vpa7UdwqNGjaxKekojBIc19ex2bwMj
         9t0DkC/qpYjREsbVrN3DyuBqmUJ6dRXt4GvkuSfpPWTG69dljAaDITbzjS6jWdEzEjIY
         N6A+pnx9KWqZbYbuVsYtfH2US5WH8opn4Tw2iDRkJ454N/uPUBXFzHsV/hmLtLfIisb5
         5zueadsdkKTA/ZJLaY004BkS5lKspBRmbErreFkkH/TylAHqGwe3nfpL5RPeO3AdtVdg
         KcKQ==
X-Forwarded-Encrypted: i=1; AKwUvBynGu5gljP/o+oc1ihidzzuSUFJyh11SCszvO7fitihAS+IoxM8ScN30XeUs1zmtzFdeJxUDh1BZHwMYkxoA+cD@lists.infradead.org
X-Gm-Message-State: AFuF++ks/5Zm7nz0v6muMZoJe3m4rM5TnnDa+/I+j9XRnI0yV09mvrl4
	oXdm2s83dhuTXMPKoy4WJohI/qfSSB0vDqmI7m8vkuaqR6KT1ZDhmcW9e40rKPWPbqE=
X-Gm-Gg: AYBFou1GSt+nqgG0riDNOtOAQ5/dMPU5zEOBddGBZCf7QrmrLYtx8oHc6kVj3TzzX6P
	kn8Qm98HaDvLLBl8UKczM6TswD9kNymn1wyEybe9YAfO8AmwUL9AsQHhMNnTvB0iTu9z1akowcY
	Sa0Z5BnvKHw/Sc/UHTNX9zE8rg/f9MwKMCOHWBfX8Vp+hWJMKyVaTEn+RPWfL10p6vyzfcRCIIZ
	ypZub9ocgjk10V0a6LO8hSFhfKKbqbj27IdQFBG9eCXlD1oZIS5IW0yaoajLMtjQ31pV5CtgHLN
	1324g3qiyYy/qiu0XRyPlKiu25yzZ4SvoclKMIjkmJjBMgLXBQYLz4fpnYeq3kvmPqa1WgUdFlR
	vCcOrdXPNu+uTgC3cMawux/9JXgK/JSGB+F2smAxCErIv/0xGe97cLxXbdV+mKJsMxKHrG7cSsV
	HMei3x7kicZHASc59kKJ4uIcwHoH+XZM1zhNtZe+10vICCi5c9jhKxuWR3r2vbUWQDaW3aBvwvF
	lpSLWDp2gBW6hroHlBYhCiPDp/pLN7CdC0gslEyPoXOJEny8gR+Nbx+n9ypiXIZYb523OOiCYWN
	GgjL3xJ6BK0eTK5fTnyoH/ookV51pMLt/awuNw==
X-Received: by 2002:a17:907:198d:b0:c29:5b1:d530 with SMTP id a640c23a62f3a-c2905b24a92mr30863966b.15.1788787589057;
        Mon, 07 Sep 2026 06:26:29 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:28 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 0/6] mmc: sdhci-of-at91: add LAN969x support
Date: Mon,  7 Sep 2026 15:25:28 +0200
Message-ID: <20260907132617.1198548-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_062635_832507_66582027 
X-CRM114-Status: GOOD (  11.54  )
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

This series adds support for the two SDMMC controllers in the Microchip
LAN969x family. It also enables the onboard QSPI NOR and eMMC storage on
the EV23X71A evaluation board.

The LAN969x SDMMC controller uses the same internally generated base clock
layout as SAM9X60. However, gating its clocks during runtime suspend leaves
the controller unable to complete software resets or stabilise its internal
clock. Add a generic SoC data option for keeping clocks enabled, while
keeping capability and preset restoration independent from clock
enablement. LAN969x then selects this option through its match data.

Describe both controllers using the fabric clock for the bus interface and
their respective generated clocks for the controller core. Use clock rates
suitable for the supported SD and eMMC modes, including 8-bit eMMC DDR on
the EV23X71A.

The QSPI enablement is retained from v1 so both onboard non-volatile
storage devices are described by this series.

Tested on LAN969x hardware with an 8-bit eMMC operating in DDR mode.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Changes in v2:
* Add driver support for the LAN969x SDMMC controller.
* Add a preparatory option for controllers that must keep clocks enabled.
* Restore capabilities and presets without unbalancing clock enable counts.
* Use the fabric clock for the SDMMC bus interface clock.
* Configure SDMMC1 with an exact 50 MHz generated clock.
* Keep the SDMMC nodes ordered by unit address.
* Remove the unnecessary maximum-frequency property.
* Retain Conor Dooley's Acked-by on the binding patch.
* Rebase onto next-20260904.

Robert Marko (6):
  dt-bindings: mmc: atmel,sama5d2-sdhci: add LAN969x compatible
  mmc: sdhci-of-at91: add option to keep clocks enabled
  mmc: sdhci-of-at91: add LAN969x support
  arm64: dts: microchip: lan969x: add SDMMC nodes
  arm64: dts: microchip: ev23x71a: enable QSPI
  arm64: dts: microchip: ev23x71a: enable eMMC

 .../bindings/mmc/atmel,sama5d2-sdhci.yaml     |  1 +
 arch/arm64/boot/dts/microchip/lan9691.dtsi    | 24 ++++++++++
 .../boot/dts/microchip/lan9696-ev23x71a.dts   | 25 ++++++++++
 drivers/mmc/host/sdhci-of-at91.c              | 47 ++++++++++++-------
 4 files changed, 81 insertions(+), 16 deletions(-)

-- 
2.55.0

