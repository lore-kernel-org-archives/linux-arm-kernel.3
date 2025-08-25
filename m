Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB38CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 16:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5VZe7nyeMDy9zhuwvSDDD5KplMvGN4Q6jGPMVY5NU8=; b=E51IEdk7jIBtt+ZfOKjXYmBKMl
	fhqXnANga3wzsAFyX6VG+fjwJpItd8DbTOi+9gEsllMKIkEVw3IlJE6HOrC8cNnfrBMlqRJsipY8N
	Acu7C6o+tRUHkYi/gmJ3mWPmFHSb+YN9zgoS9Fs5ScbaU0+CdKr109aIlz/xPtoOuUGwLhjUnbwcb
	BNrx+tdt08s3XgTuFAHtdxVgl4vwrjf/DK0Vd5MpDljGXNKBxjJcejl/cJKGOfic7EQcRduw7f8sz
	5UcbRgBiLhLSYQ05+LPA2wF5aQkUK9gSBttSHu6XlhMuxUgoUICuxSLHVqJrxlJZz8DksSJxIadzF
	W8u78VyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqa6U-00000008fPa-3JIP;
	Mon, 25 Aug 2025 16:31:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZDp-00000008XBF-3D5g;
	Mon, 25 Aug 2025 15:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756136100;
	bh=VZpxXp1Jtzbp9ZUOGZItTruBz4DIlQiezPNirCtZH9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j/08ylrY+Db2hGxduhX/mwuJ5EBmKAmUt0Q49EXbG7FDU+NOcfyxrCVEpQYhh5D/C
	 Ho6+3mamprwWtZXSR01Rns/vw0UB10PC4l1LPBL1ZFZ7d08p2985ZvRdDu+iqD5aWI
	 uxNZN4puOsukeSzwx+te86y6/BRmc23Q9/lx644Wod5/yiurkRcsyfpt8twggNa9vf
	 90Jhv1X1AJpJlnkQ01M19wBLKuc7xKaB0tWjG6a29C7pgOuCXPsm5MtX+8YsJU0bKB
	 xWNuEi8FUSkdIOgVL/1/Umdq9nnIvAg0UzPdwBiW+W2vKE9HH+58KIU8FCjWmsX6xi
	 an4zfzCyerTjw==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f39:d9a9:8ef1:f69a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9260F17E0A28;
	Mon, 25 Aug 2025 17:34:59 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
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
Subject: [PATCH v7 6/6] arm64: defconfig: enable Verisilicon IOMMU
Date: Mon, 25 Aug 2025 17:34:45 +0200
Message-ID: <20250825153450.150071-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_083501_950045_C5770751 
X-CRM114-Status: UNSURE (   7.82  )
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


