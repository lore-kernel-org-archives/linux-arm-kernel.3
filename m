Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FCBC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btaVHXBJUsZY+WA6Dwj9aDIrkiH20xUrs2ycxjXp8J0=; b=mq//NmUwRCP938XjtjR59eFfc6
	gldKbvNKirawbK2ChPQrVI90tHHcfxlZMU2xCutB1oFjffwGxHuHYWcLrSfYxHSk65pPuXc0ZKrms
	NhiNk8jtNk/IjTCH79HCkaofaIGAk34yQPmYCqQqLw1+JLATEFlKc0iR251JGb5+Dxi6oKPMlTTpK
	Jn9ICZR2nr8547GN+H7uY9iokDeNQlvhj3mJtMChKFnc7Sp1dmpLzYNrydnvB0LbnKoKJ8LDG7VwY
	EjmKC04aWYvYsiXTNAzCRPut/Pg1ov1oMcaPqSFJqDJa5IORALQvp69prqho0HyXhFeQnbepNay0o
	NPoilX3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZntY-0000000BNsd-2NV9;
	Thu, 10 Jul 2025 09:48:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmaS-0000000BA5K-3NrJ;
	Thu, 10 Jul 2025 08:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752135898;
	bh=QYXHcCL2Vs79N2X0jF3tLL5lpOOl+YSA52sVaeKfUeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nHNDQfAm4FeDmZOdE1oe11s+h5sMBYNc0tdZiWYMWI9mZmlLLAAeOtCYpv84T8G23
	 N76pxcUbeSLEMj18WBcCRtuqn0aVT2ci0KJm2zbHzFWSPQtXGlTlfizXdjUQpDVBS5
	 tOtdGN5PfPLG91BpFeGC3OF0R2REZN+jlqMyfvHqYDkgfZtwG5mmUPYea6RYJ5JVGt
	 /tzOQRjw4s8BVLQh8HG615nzBr1lKUuv58pdcik2yQDtAqHdvnPRgONIwMqlaNWRlm
	 tx1fJLyOrfun38+34jt1wnX/Vz7gLftnCzWczkLlrqxlA/eQ+ZPT/1JrIs5qEn6p7y
	 8nhEGIS7vXycQ==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9f5a:8ea0:8d89:78d4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D551517E10D0;
	Thu, 10 Jul 2025 10:24:57 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v6 5/5] arm64: defconfig: enable Verisilicon IOMMU
Date: Thu, 10 Jul 2025 10:24:46 +0200
Message-ID: <20250710082450.125585-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710082450.125585-1-benjamin.gaignard@collabora.com>
References: <20250710082450.125585-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_012501_028418_A0E7B721 
X-CRM114-Status: UNSURE (   7.64  )
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

Enable Verisilicon IOMMU used by RK3588 AV1 hardware codec.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7e04a2905ce4..a639388298e7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1451,6 +1451,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_VSI_IOMMU=m
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
-- 
2.43.0


