Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2D7C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 12:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W53+ozmmytCKTsz87hYJRPt8O2Llloot50egnShiA6I=; b=PejI4bWYDv/gDB
	YO38a81oSEWU3/wVuv1eQMKFnQu23GEguu6XFj2W80YH1UhIwUWPLm2G9NxF7R/UJcGfgh4X1sWyE
	YH7BRx16mq6dHSP272Xuk+g4A7fR4sQBs5HwUDokcFnm6AJwF4Gvz2OSC9X4OfyplthZaaFTW4TAA
	OMezg6EmY0LlgeOyaL7UHktdXLLXhaqDT352Uw7ShY6seWQFKHme/+FwFlyzWoXwjE2mhaoZI3i6M
	mG2Vc51Tgk6BcyGIWyx8OpmZhPr03Ofn9mcD57lal/PPQcasiQT6ZxGXroxytwTcH3SUjtF53bU13
	jvhZAM0UKMY9n/BL+acA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCs5-00000002RVw-0u5i;
	Wed, 26 Aug 2026 12:36:49 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCrv-00000002RSb-1g4P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 12:36:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so8293065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 05:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747797; x=1788352597; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W53+ozmmytCKTsz87hYJRPt8O2Llloot50egnShiA6I=;
        b=HLwZ6cUNxV+0JY31KlMXXAPxmr02ohzge+Wnw8QQGS3F7A5Xgd6HI0J+NNGtvoSmP5
         K97QfA8nD3bQWM+5Wcn1KItwxjR0PUGPsLwBb8p6yQsavu0+YBsRSMu/p9vcFn6JKMrk
         eeynwxyeXa3vQ0mMtJlKUH/FbdXKndlREBNqJKeUjHDB32gggjnkmJM4E7ulMxOYlB2+
         FqYzB9gTHsQcDXCdtE+EbIZmh2YydF1oiO/MlreR2jl1vD+XLGtIbHL69DtYO+KzBlT1
         GfDgPEY1inl6sjSQA6GkIpd8u7TAyc6tGh4GQnhc1M1v0v2bj/LwiUcALoxECQkm82dG
         5/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747797; x=1788352597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W53+ozmmytCKTsz87hYJRPt8O2Llloot50egnShiA6I=;
        b=Ufd1IE683Ahm8inh5pp05I0+QC7jC5CTBsewx3RBlokx3hMmbgA0A+74laTcKyttwK
         eZipRBORgd4AHLPc814UM0L6uBQ+xf06kPyC3rW+EAwEkSb1uzZJyG5S+irCUAmOajCd
         0ADyfW3TB7njMgdWrHyo6hDmQgK/OIdUm1dXXk6H6WvxW5KTo+ceGg3G//TtNnuDjy6Y
         dHd9m1NkkHvisieank3ravjjLFm6vosqnUdzvMX6w7CxXut/hdbpIjvCa8cp/vfQhzaS
         ckzXOcIec5uS/TPAX4Bdrc9Lr/l5gDm5R+P6a5bW1RzDyTlAisAdYX1cm4hIYunNV+Hu
         9HrA==
X-Forwarded-Encrypted: i=1; AHgh+RoGuiraooW9pp94XqsZbiEKCplt31+QFrYZx34nRkz/l5IDu7Pf7Aap374A4TUfUZxPaOR10OkxL2+nyDKBIlY1@lists.infradead.org
X-Gm-Message-State: AFuF++nLGFfjcTti0J+vNxZq8bSMd1whQgRhIi6uRjMwZ4yn7c5ijY8g
	A+5nMJ1tx+CGk6dRmmekiAn8tBUdYevSauYpfy9x5x8Y9gyGwdJIRIkveC5O0w==
X-Gm-Gg: AR+sD13md3dq1TEeYg8BpMp9/MT70vL3705ZUEgHtDb5NKnVNc2ZBQfpDDSv32s+VTY
	7T7AIq7Azo8xVb5k9mfTeLKuX6cDFUgizCO0kfK7UDxDtLiSRknSXdOtq97i9P2VcjF0I7USo4S
	R0lKPU1fNZbgkF1psKfSpAw0lqbEqT1CC04+wsoo5msY5TkIDHz7YW4S8jG4sZB/vjzuWdt0UB1
	lePBLMPuPV4lNQyNl/gBX4UkjdiUEw+eZej/a5hE2yzcpbfoxmeaV0mexlomBirITP2ryd1l30X
	v8926Dz9hVdixUvTapE0nyJalO75wFy1hb/VFbDbLgDfii730tGwGfoSfuS6iTm/hq5Zqg3M00A
	QDZNQCjQAjvlUZ1oUhqB5FNdwHgdPHmBbnk9D0IrPrxkKxGB6GVH9RfTrH763+4YNRIKvTQ6oXV
	IBB7vt2zzlKQBZYvnj49jCDhYVdTZpYjZEdwVNgdhIhfDWrQ33vSSYpnT9cYkeyPAZHqnG8vcIZ
	OKH79My0Gq8BWgRs3FQ0cX5tCw9F0GFkNIVXXx1iN19eqM=
X-Received: by 2002:a05:600c:4503:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-499dc6f6856mr63320205e9.4.1787747796976;
        Wed, 26 Aug 2026 05:36:36 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc977692sm26009465e9.6.2026.08.26.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:36:36 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH 0/2] Add MIPI CSI-2 receiver support for RK3576
Date: Wed, 26 Aug 2026 14:33:48 +0200
Message-Id: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACzdjmoC/0WNQQ7CIBBFr9KwdpIyMAV7FeOiwKBo1Aq10RjvL
 loTly/5/72nKJwTF9E3T5F5TiVdzhXkqhF+P5x3DClUFthi11ok8CUBQvYzhKmAMRJdsEoH7kT
 9jJljun99m+3C5eYO7KeP5LfIfL3V0LTM/p2+WSpyDfmoyHQQxv0DULU6Wm1Rkutn+ZG4oTD4y
 +mUpr5xgaK2FFWsb0RytiOjmGg9xNYZJM1RS6vF9vV6A70FmTnwAAAA
X-Change-ID: 20260825-csi-2-rcv-dts-7712bd834de6
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787747795; l=1518;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=bZCTslaMfY2yHuls00yoeNHJSejBPMWhnKOx5GZU7Pk=;
 b=D5SZuHOEZFLq4kV/bI0disa6qhctUgipBPOTdKl3tjbmw47te+DHUq8yqwhgqFIQKWdbWjzoB
 vOdGow0S2mZD2zoH8t894Bq5c5ei5wyPao485qKRl2S+x7izKKzRIWf
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_053639_448678_3B645678 
X-CRM114-Status: GOOD (  11.86  )
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

This series adds the device tree binding and the SoC nodes for the
MIPI CSI-2 receiver units of the Rockchip RK3576. The receiver is the
same Synopsys DesignWare IP as in the RK3568 and the register map is
identical, so the existing driver is used unchanged via a fallback
compatible.

Only the two receivers fed by the Innosilicon D-PHYs in full mode
(MIPI1 and MIPI3) are added; see patch 2 for the details.

This series depends on the RK3576 CSI D-PHY series [1], which provides
the csi_dphy0/csi_dphy1 nodes referenced here.

[1] https://lore.kernel.org/r/20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
Amin Gattout (2):
      media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3576 compatible
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3576

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  1 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260825-csi-2-rcv-dts-7712bd834de6
prerequisite-change-id: 20260819-rk3576-dphy-2304f848215b:v1
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: aca697161c21e19fe3a7f62f208da0f6c3b666e1
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>


