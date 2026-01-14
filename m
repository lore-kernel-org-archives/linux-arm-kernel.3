Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5105CD29DC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALumBkGddtKvNohcCnsa7ZVOi9b8CPlq1/XdAqXopd8=; b=xKYIYa85gi50VsxnCuEVj5DbP+
	yeodNB7/CoEfYFr5HjoIbziz6i9+NkbCsvbLdvXPznfQXSlSQsCCWud51B9nFCO8tB5Pv2NT0kEQt
	PKE+zQl1pPAyHOKnppbzB8A9yNjLgP3A2w9UXWWtArRSLbZ3BEr6Sg0kymhxSYTq5bAM+ANk+f135
	9IfGsigoaJiiImef5gKSsvqyr72L1GXVPmYgubS81jjhTLdB3roViepRBzz7StCF2si6z9J1iZ77p
	8OHcRDE/Ok7kO/mLevTpFWdsOdXzgEjozH950/WgYJn/k9938C23Hm4RiW2HVJfoNsnylTbo1/mUQ
	UeOnt8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxoq-00000008heX-33AE;
	Wed, 14 Jan 2026 10:09:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxol-00000008hYI-2HRM;
	Wed, 14 Jan 2026 10:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768385371;
	bh=kfoyO6mLrJT+5jwg7vHiUeoqvatV7KVxcH5i/FCsdRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IhnVViitxQ0X37IQlOUJcltVqn1USTYsKeU+mV4NKl6qBFJaR2LuYrl2B7J4Dw2c8
	 Ov0gO5HpqE1I0MnnVzeZRNGr5WC4jTnQVaskpcGTAvb4dOtoyyqDEQsgJ51KOA8RWU
	 KaStQfxiGLua5E/qy0oaavf75KM0lI6Gagc5kddo3WfqaK4mb++ZN1ekxdhmvDXtYN
	 LQltGJpP0MByFPRT4gOsLIxEnmwFguBttWQ+SpWqPptx0SK8Ymx+OFFVEUY/oePjsu
	 TjZ7MlyOJTiD+aXeNT+eFlNwavQuN+7a0uJs3Y9HlqF65JOyALCUPBgSBe3YRoFs+R
	 OZgq3EMJaqULA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:1dad:60e8:7174:bd20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 04E6C17E1525;
	Wed, 14 Jan 2026 11:09:30 +0100 (CET)
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
Subject: [PATCH v12 6/6] arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588
Date: Wed, 14 Jan 2026 11:09:18 +0100
Message-ID: <20260114100922.149187-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
References: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_020935_730779_45ECA4B7 
X-CRM114-Status: UNSURE (   7.77  )
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
index 45288ec9eaf7..4751f7fa8bb0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1525,6 +1525,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_VSI_IOMMU=y
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
-- 
2.43.0


