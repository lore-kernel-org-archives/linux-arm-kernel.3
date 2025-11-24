Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E84FCFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nUeM9ZFkWyG7h37QJsRJE4GmsiVwQIeT8yI+58vSd0=; b=jRHewbbQnG4GAecanF+Q33CSWV
	oP07kTV0NBmtJjZYs/wlSb6R1+OvhaZR9Y/XjGh4wZlXz2Wz/JyJwSBUwXO4Uzkda4AKlp40eixoF
	TSuygPk4PHP6iUVs/PneyLTNbEp3xj+wSgY4Va0Z5j67EiS8UGC+R+6V4VsT5bEVyl4g3N9bnE+0m
	D4nj5cVAYkQIxb031ZQmAa7hgcNBmCec0fB9vZAPK91UGC1o/BLKAIsdZmlDSD58ETA07CMO4qtns
	8OMM2mlMLPiWYPdyX1Je66TKttSdvF8svV3n+BAw68bATf0JaTTmGW5F5AsnZGqUZt4IzfET3aD4O
	xisTZTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVNJ-0000000Bbn0-21kU;
	Mon, 24 Nov 2025 12:08:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVNC-0000000BbkI-1IYK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Nov 2025 12:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0nUeM9ZFkWyG7h37QJsRJE4GmsiVwQIeT8yI+58vSd0=; b=PCC5ERlt8a/g5M9sQmfnREdNJN
	yCl954+sH4r4pEQwL0i/KRv9aoWP30uQ8sDZlCRtKdwAz/sHP9p5hBJyez0rsUJToTqfGGsgsUNZp
	vO/5KT/h8/il6fOD0YLJRoR0/17Ej1Qq6kZjXhvIytb1WsTwpct3p53jFLpMEkzF5Nzcw0UMJLxKC
	WwUEOxsXa0P6Fv4mwHiksOqKHwZOcadnE9YqUqazRLnYTnJWI/zHAwD5hWcHsbyqA7flyrY4yaSRy
	hHOAX4/1jb+pOMa1G4zKdOmpyJ97Try9Ry/zGuAc78kh1CHFQHmJ4LIzxv6BDOW3FQ+wlDRCkwBBl
	7y5r1ObQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUVX-00000003bf3-1chR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 11:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763986125; x=1795522125;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=7Q6o540U0MuKX4LmXYnikYcnzquX+vLmRlmwknsSgHA=;
  b=axA8g5VJfyc1AwQK+yXfUUY/n0gJG60HPopZhlinKjs3ps1CaiU2MU1y
   b6H6j3mU77pHmGfpaIGX8rhkcZgbhuv+xRqia+t/J2KXz3PtYdOrgmUbS
   o0CVo+lo61l6FRcgrccOYDIGydTLVsZivCZx/JQnkO9FK21FoNr6drTHp
   YI7B2dUpMzZWk0/v9y1KCsNieIka3uKNBCuL70+V9wWq7y1NLJzxzbl8Q
   v3vBsNyGpu42Ipca1uUgWOLHKjtS4YpIMVBIVOk1pvuSQlbjfRe9AVQcz
   fX8K1QnmoZze4ctM0kWcAvOmAbW4YY3nSP/LKfz/oPruXPRehbQ0nuSeQ
   Q==;
X-CSE-ConnectionGUID: YHrtvy5xRn+N01J9f5nEwg==
X-CSE-MsgGUID: z6BBmk9ZRhaoewgnd8BOdw==
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="280948042"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Nov 2025 05:08:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 24 Nov 2025 05:08:19 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 24 Nov 2025 05:08:16 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Mon, 24 Nov 2025 13:07:21 +0100
Subject: [PATCH v3 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251124-cpitchen-mainline_gfx2d-v3-5-607f8c407286@microchip.com>
References: <20251124-cpitchen-mainline_gfx2d-v3-0-607f8c407286@microchip.com>
In-Reply-To: <20251124-cpitchen-mainline_gfx2d-v3-0-607f8c407286@microchip.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Cyrille Pitchen <cyrille.pitchen@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=751;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=7Q6o540U0MuKX4LmXYnikYcnzquX+vLmRlmwknsSgHA=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ6aK17wXh5Zl3zBcn1Mxs97opsptS3eZbZLvHrQ9msbBZ
 h0swqnfUcrCIMbFICumyHLozdbezOOvHtu9EpWCmcPKBDKEgYtTACbScICR4bsA83OOd3vsuiMY
 DY6Werx/6Dz3RPyu3T/zQ4O9tjAIX2H4zZZtKVA+afXKgNvdt9fseiH15VWHk/anQOs0Zl4fc4Y
 WXgA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_111323_813189_52217E97 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

The GFX2D GPU is embedded in both SAM9X60 and SAM9X75; enable the
driver to use it.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index ff13e1ecf4bb9545d6d2210b2f3059e6807779a0..85e9b52152aec6746f660dd0c299cd5aa12ce2ea 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -144,6 +144,7 @@ CONFIG_VIDEO_OV2640=m
 CONFIG_VIDEO_OV7740=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
+CONFIG_DRM_MICROCHIP_GFX2D=y
 CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y

-- 
2.51.0


