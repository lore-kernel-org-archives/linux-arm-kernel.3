Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD12DCA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ObWleL9TA7UPO+YvdXrGwmMNTs1BuFhMK+d7zLOGlOo=; b=AK0yYUmt2nAb1KaBdTPK0AuM9D
	X+N+GBDJd67FIVYdUfBXMH2GSvAO5XggGJjMWD9+3WW9zj00Nu+1iyufmTDxI+E+sSCnTgLNmFQN+
	z8QtgjzdGhYlHcyDfi//9Q/y9CimagGCgzHr0CJXJ4p5WuO/DSscmtdjrw5sGvUPGV7lhOJ10eLBK
	cczHAHe6ytQzZ1U9FWWT3YC+oGdKWcmu1gteGjkv2JOOOh2G5fI/Hd0J4Wza6E19pyAiLn3EMZFy/
	NLo5e9oJ9WAw6Z4yjq91pXykLGeqyXRj/oQXh1B+VoIpvE55abXLQVf6YbXRxeJS/DWwwlD7WF3DS
	bSm+ExcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ76-00000009bHe-28za;
	Thu, 01 Oct 2026 15:54:28 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ73-00000009bDh-2p13
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:54:27 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso20313085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 08:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870063; x=1791474863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObWleL9TA7UPO+YvdXrGwmMNTs1BuFhMK+d7zLOGlOo=;
        b=JmIaqLzmUAO47s2nPq7JV/7sMtPcs5ew+t8iyqLqxHXB0svGRXa3FJ66ZzKuNUuNg1
         ModarqHoiRTNpOavmS+BkoV7cU24IUPYBq+4bC4KGd//fpNLoJueWPPmLF7fpiseLGG5
         yWI1/gPftLWqUi+YGKluty/mrH2oUB4VKfzqXVrVhnHjPx5FDnZV1VsQNoqcJfYJVBAC
         xe3V4L0y0tFw6xLtlm2ThBEbQLb5YmuOEzTQytzrPzT9rBULqlgObuxQlmamlxcZ90U+
         3dTCNsjq/FWLUWu5ez7zi355WBXHizVKeeJxReGh5fOD9/tBqZvIIBkR+ahNTTyJ7fVy
         JYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870063; x=1791474863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObWleL9TA7UPO+YvdXrGwmMNTs1BuFhMK+d7zLOGlOo=;
        b=KkcPMZxg3Hxl/KYHIdl3QQ+jPZ2rQ9lHTArVTx4IbDtVtRAj6qhfgUXVJUDRN6PP5M
         oi8471unl4AsLeDB/GAX5c4jMFu9Quy4N4gy0V/mqudIy9FHp5UVP1u+aBYLfyTPm0VI
         S9h7vQI6aGWpjXWtsC4fUYSPrRRMSZ8V6HHCr2JPqJ6MEcGLq2cqIqcCu9S3VA/WLO53
         H0LaQFcK0xI8guc2KDnQBHyMeo5+KL2/t9iVYB5qNjqZkfFxQfkKTgNwnhpJvF5g1yJQ
         3/3Xx3hG5r6+kaxtdZ2Xv7APEBj6b2VOwhQzSUb6O+1ZT1C2BOY97oJBjMiJRqNvweAZ
         sVww==
X-Forwarded-Encrypted: i=1; AKwUvBzY9Az7PAev2zlpHciutZQ2RBjmhEat9j0irPx/zb9d7MAqo1L/pXqPRv1j/fIWXivgq9CyfC3ljyNnpgDjGnSi@lists.infradead.org
X-Gm-Message-State: AFuF++mgCcBjt675gPmTKHZ5hdtyuU3e+YNSIG8Utvszpve7aOdWonEp
	hkTLSm882iwfOTuo3Cl/Pfgg94wg9FU4NnAYd29mhgDoHpKFTHwWNbae
X-Gm-Gg: AYBFou2sQB94s6Cce7NursLoEyuxtbJwcTI7DJSbmGhx2FMJE512MSMBhewRixRredT
	Mgp9KiCUTlP2DWx1Ts7MtbRyX4DQ1mfCHS7Cvb/2hsgh6p37SJE5qoav5ajhiYRL2yjFfC35K3j
	weUvn2rxgm++6t+ef9wsXfRJ/cxTDbikR9PkHvZr5S+F1bDNrEI0oJ/UUeEEOvWuhXn/RWWKf6B
	T9i6sZo+lwF5jtq0m3v48D7QZE7qof/ZBOY6heuMnXNBZJMiWwAEx30ucuI/codpBxBP/uUj6Gf
	emPiK4HJ4j6uBYFLv2U5aTStQaJiVLOceg0I9LvJMssT9IuSW3jBoXM0KtVGVrTdct6UrY5A+tE
	O5cIzqyfTGQ8sEWepxZNmfPJ2du8/ko0aKPBzB5spUaTsnBwwSj2Lj8TemzJVxXZFnIN1PBYnIW
	kSTR00uC/HX0a8UWcsHHa8kVaLt++3LHBm5ar3pSS/22ZP+MFlhpbT2WCptywQRQ3+5QDz0BNrL
	iaiIwCVIaKWBJtqQ40KNKjFMACSr1a8UlINASKPrnPV9JQAPyCR817TFGsLXP0WaIGQ/W+cWYed
X-Received: by 2002:a05:600c:4e4b:b0:4a0:263b:1f77 with SMTP id 5b1f17b1804b1-4a0276a1f28mr643585e9.8.1790870062454;
        Thu, 01 Oct 2026 08:54:22 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:22 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] ARM: dts: Add Apalis iMX6 overlays
Date: Thu,  1 Oct 2026 12:52:50 -0300
Message-ID: <20261001155412.3177428-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_085425_749378_4B54F7C6 
X-CRM114-Status: GOOD (  10.98  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

This series adds device tree overlays for the Apalis iMX6 SoM. The
overlays cover HDMI, parallel and LVDS displays, audio configuration and
OV5640 CSI camera modules.

The series adds support for:

- HDMI Displays
- Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive and Resistive Touch 7" Parallel Displays
- NAU8822 Bridge Tied Load configuration on the Apalis Evaluation Board V1.2
- Toradex OV5640 CSI camera variants with 27 MHz and 24 MHz oscillators

The Makefile entries build the standalone overlays as DTBOs, and add
ready-to-use composed DTBs for selected carrier boards and accessory
combinations, for build-time coverage.

Leonardo Costa (7):
  ARM: dts: imx6q-apalis: Add HDMI Overlay
  ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power regulator
  ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 10.1"
    LVDS
  ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 7"
    Parallel
  ARM: dts: imx6q-apalis: Add Toradex Resistive Touch Display 7"
    Parallel
  ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied Load
  ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI Cameras

 arch/arm/boot/dts/nxp/imx/Makefile            | 87 +++++++++++++++++++
 .../imx6q-apalis-eval-v1.2-nau8822-btl.dtso   | 15 ++++
 .../boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso   | 13 +++
 .../dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts   |  7 ++
 .../boot/dts/nxp/imx/imx6q-apalis-ixora.dts   |  7 ++
 .../nxp/imx/imx6q-apalis-ov5640-24mhz.dtso    | 17 ++++
 .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 +++++++++++++++
 .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 ++++
 ...6q-apalis-panel-cap-touch-10inch-lvds.dtso | 53 +++++++++++
 ...apalis-panel-cap-touch-7inch-parallel.dtso | 34 ++++++++
 ...apalis-panel-res-touch-7inch-parallel.dtso | 30 +++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 86 ------------------
 12 files changed, 349 insertions(+), 86 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso


