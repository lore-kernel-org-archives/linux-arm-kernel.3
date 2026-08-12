Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5572C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVOkunoRXosC1p6vhKI/AuCkdMNvZR5OdAPkS17pMJ8=; b=Tmg9bvju/aT2etwPZvja7/4Kqa
	EqejbMDurhQtWXtPvjwFV43BK+A5pLTTbjQoQ5MLvf2VQgPK+myUfi/ZUzXHwX05RKdXME35XIKp0
	r3vHiHMAUKu4ZpJwFEfjYVaoo5RVEkp6xOpa5Cd+2TnOPELgeKiMwXsDhW6oq6DAwIAqpJ91++g7d
	TMWf5Tin7DiIECuljND9H0eOytEckHiWxx1YbOyuYeosG2tc8d/oyCBk7i7HJVDLUrx6WvKNxH3/v
	ac8xdqLxlcDtc/rDLsX65VcubmHwmYI7HTbCwUhQmN2pPU4BlGY907dUTBXWOeOm9WOPIkk5yeE7h
	2o7O7WIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu926-0000000GHkQ-05Wx;
	Wed, 12 Aug 2026 13:30:14 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu920-0000000GHgu-3Avx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:30:10 +0000
Received: from francesco-nb.. (93-33-22-216.ip42.fastwebnet.it [93.33.22.216])
	by mail11.truemail.it (Postfix) with ESMTPA id CC7371FE07;
	Wed, 12 Aug 2026 15:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786541407;
	bh=jVOkunoRXosC1p6vhKI/AuCkdMNvZR5OdAPkS17pMJ8=; h=From:To:Subject;
	b=qDuiVMWhztqZCF0H7ezmP870ZSCXfeKdv61mwFLsKxrrJorgtz0NywDME435F3ssP
	 x0wYA6TxS8msDrjHNZASpTI93a/QMUzvqRTFVS+tnFg8Tv/R7lFJ0Pas2wpmIa0dMT
	 xAzLnm4hgRa/mdJdpAJHFh0fDpHpk7wzWpOIet6P9ZaMCVsb8U+HwlNPphQQDS5jYD
	 HcJWGF0SaZspmbIWZEX7NusuKPJGEvBtHmSlExjYJOBacc7xwzvbWr2Q57BYeageTB
	 hMwikeJznLkM/c5CL+6POSHcMhJ/t/ixFyRZnKzIR5iPphN3EpAM+m9ka7e4FldduD
	 8d03oTbUQ6Erw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] ARM: dts: imx7-colibri: Set LCDIF bus-width
Date: Wed, 12 Aug 2026 15:29:52 +0200
Message-ID: <20260812132954.148571-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812132954.148571-1-francesco@dolcini.it>
References: <20260812132954.148571-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_063008_972230_42B11AC9 
X-CRM114-Status: UNSURE (   8.29  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The lcd DPI interface on colibri imx7 uses a 18-bit width bus, set
the bus-width property accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v3: no changes
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index 8666dcd7fe97..c4088d3c5ab1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -537,6 +537,7 @@ &lcdif {
 
 	port {
 		lcdif_out: endpoint {
+			bus-width = <18>;
 			remote-endpoint = <&lcd_panel_in>;
 		};
 	};
-- 
2.47.3


