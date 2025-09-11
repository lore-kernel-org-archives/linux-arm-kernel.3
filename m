Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E26CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TILGav/HixDTdJ1xvLR8IQkqUG0/8UgAsJHUiQoTT1k=; b=2At/e1236+1pyB108SBR+5H4Z2
	r/BcRU65LO2NNTtYYwVWEcvQ7FFf3Kk+lUOiqEhaMPITagvbXEkWkDu+HeQqRYgb83T76CL7xDw0p
	q9laNurft1VWjWGuFltSE0YGJcEeazJy861eJPEtC+js4qTLXBdpK4GlEIz8gryIWWlqGF7RH9Mfb
	+VYwVWpXoDUmfo3aqLqtipxkD+JTYBQAS8DpZnaS5cWkI7Bkd/HBdawszqrIHjxRfNgrN+waIv3ZA
	HRTCs7HPzhqJuPgTEp0smx8JtbF7CaLDF2/IVzJkS4oGXitdp2ThiL7xPboaWaexm9aKJvzfOFRm2
	93CQjGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjgD-000000042Zz-3cUO;
	Thu, 11 Sep 2025 15:57:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjfy-000000042BO-1SFY;
	Thu, 11 Sep 2025 15:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757606250;
	bh=sKradN4hrPLBamEcgVbncnL2328TDnqxw+EAoEE13DU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LBqbaRvVoCT5HxikVs99b2Vpp/Y43wAVEtPNK2dYruWkcJpViO3FhXKiWedvSmpt/
	 s0BtO0HyXHffiJXtW7Lfd0F5N8mhbfoKo8RP7gFXOqglKttSJYdUBgDwinE7PlKKJW
	 synSVnIgYEG90e3C2xB7Q5Pg+KkByOOoxwFC94ZEszUs2PZ2p947h1CEY1jgLfZIFd
	 jmECAjfXU120BnBsc6fc4LDFIQNy98qAe2xrEHqGlEBvCxJLzMeLTIdnimavYP7Uz4
	 N3Shzy8KETSqCiAeehpKbR5eWO0g9V1jarqCySbweksiYmA+beiM/nnMqYU36B4lDK
	 JBoPwvP3w8Jbw==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36e5:357f:56a7:54dd])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B3DF17E12B8;
	Thu, 11 Sep 2025 17:57:30 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v9 7/7] arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588
Date: Thu, 11 Sep 2025 17:57:17 +0200
Message-ID: <20250911155720.180465-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_085734_629773_BA13B371 
X-CRM114-Status: UNSURE (   8.36  )
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
index 58f87d09366c..04547bcc904b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1470,6 +1470,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_VSI_IOMMU=m
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
-- 
2.43.0


