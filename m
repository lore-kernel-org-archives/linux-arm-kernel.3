Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD74CA0FFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGOJ+qYHNfBC89ZpHzrpelsa3iFN1t3N/utT57zE4ps=; b=1qmLf59wkYcpSaYuIKLQgT1VP9
	FYvsCK1425EwmTBCtltewpC9ixu6RjxPonFpZxf/ijieru66wpmkbP99HMiLp3vgeAehTZnjiZTFd
	hxm9X8DxRJYE51St+TAxNGywkynJGm8FrFR4mJNMcyVfsLU15z1Joja0LAtNqjHo9knyfakE/kiS+
	LQ4OdPdUSaXKvfWiH50kewHiDGsR9MhrMqtoz8OtjCxnoJUTDR0I/J8kCql/YRariomC2udiUbFQq
	cpxA/cksX9qDcquP7raaq6mTOE+0G77BUBINRX1x6/rSG+t7re8y6im/hpkI4u7gBptcbIDdkaJis
	4yz1Y5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDzj-0000000F9r8-1JAM;
	Wed, 27 Aug 2025 11:07:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urC8i-0000000EmvR-4BWq;
	Wed, 27 Aug 2025 09:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756285699;
	bh=7oF5B1NcfXS5Ejllve18Lu8CkCdO1s4cDKW0kAkJT9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BYls46lpujxTxM7N/tSNSzrIau2E1ZcS7Rlv2EV0UrWJl1zAnWsTF8Ru+y0rUPMC4
	 LBWM1xfAQ3sJfEhKAuWjcXW+bb0BlVDBtMZaT5FAkU4f/1e6xZ10leiQ0N0InwHadA
	 fWn8dpB8xlIJ8gGPgbxz7PR97zniRWXmzOpZiFWjFE9DcRrqrjSctqrft2vw2sCU5f
	 hmME174if+hz7l14Wd2rp8ZMu1ZvlLUQ3wLrrlSy9ktWxF3wBm3w1rouyx7yGG7Zl/
	 4YqH7CxlqFwvax2NjS9qzZMXYodnZiGJs0dnQQw7BRy99tbige2KcqmHcuZej1ocgJ
	 FfDGmAUp5Fwpw==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4be:99b9:5069:3bef])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 264D917E10F3;
	Wed, 27 Aug 2025 11:08:19 +0200 (CEST)
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
Subject: [PATCH v8 7/7] arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588
Date: Wed, 27 Aug 2025 11:08:03 +0200
Message-ID: <20250827090809.34555-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827090809.34555-1-benjamin.gaignard@collabora.com>
References: <20250827090809.34555-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_020821_177949_BF5DA764 
X-CRM114-Status: UNSURE (   8.33  )
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
changes in version 8:
- Include board name in defconfig patch commit message

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


