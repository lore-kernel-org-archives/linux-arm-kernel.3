Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A37D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 08:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agOMdDvt6Qyyf3v7ij9aAcdTHrUkP6ckw1YcXFJBEl4=; b=ODbewK5PqRN9aADNyQ8shSS4Fa
	KFjAFpeDHV6z+VJNO2dRjFNT14SsCo8NRPuOWDB2aQtmbQK3pf7HfawrRYSHdsAG5IW3TPVhExSL7
	gG5glfTjiBaFzqckge/Ks6258IeXviaqdD/hByBjGdkve7eHwoJ5AdypJv8N5bsP1Ejfyxp4tl2OV
	TnxAaR+VFM4Y+sag62OadqFCgFDziDW+iiINsermvp+HQEFoSb1T1yFEXBikb0INLr2p5LUS0ktbJ
	4is1GAiovso6zloTcYIh6b00zr76ad3CKteWboOcWG3C6iGrPVn9FUcYXYA5l/lk1WcWhXR9BZJFn
	YrUADObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4LG-00000003J76-2Vr2;
	Mon, 15 Dec 2025 08:54:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4LC-00000003J0b-0d01;
	Mon, 15 Dec 2025 08:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765788839;
	bh=Uk/Av2ffrv0/89lUgGqQUjclRzRpB0kJUN/ec67ruho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nPty4pRQ9msOHveRYQGlAVJ0KTKQkRlItdiDb1+rSO5N4XRooq6m3087IznV6WtNV
	 /jeXJygWF2agbrqxkENgocvzo6RbZB0QGZ4xyYgO8sTVWquIZ6MG5bmgk/T5gSmbae
	 2iE+g7gXldPpD6CCuv70Eotqy45TOvhq73RXpYNabPpz8CpnxLdB31ICbI0x4RS9fj
	 1r9UZT/aCyhXvz5aT+kGLioXZS0czrqWT4wNfpGQdprBNsurD4ejQdHrOnYoBV0PQ1
	 3HRuLXaCNx/U0u3s4vv8ZOuNLLQGIhbWBBPe4sphVI6JtSy6iU5oOPdSOOJQ6eY/aR
	 uoJIM7VwS0M2g==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c17e:135b:5095:83a8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4D14D17E151E;
	Mon, 15 Dec 2025 09:53:59 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v10 7/7] arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588
Date: Mon, 15 Dec 2025 09:53:44 +0100
Message-ID: <20251215085349.10155-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215085349.10155-1-benjamin.gaignard@collabora.com>
References: <20251215085349.10155-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_005402_335412_48CC7E3B 
X-CRM114-Status: UNSURE (   8.00  )
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

Enable Verisilicon IOMMU used by Rockchip RK3588 AV1 hardware codec.
This hardware block could be found in Radxa Rock 5B board.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..0106bf1935f8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1525,6 +1525,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_VSI_IOMMU=m
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
-- 
2.43.0


