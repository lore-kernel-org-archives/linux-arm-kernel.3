Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD4EEF99FB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 09:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxQjMXQRMdWAqPnPHc+6ZE86rFVn0xpsqO+4IG780SE=; b=ySfDq9JdEg+2tvbCYoWcMx4g8k
	S4tg2Ai7H/a9zwYv0eWcONi2QoLAHKcJfCvcTuzmneFQdLIBGekOKc6sBNrmL5XbmqYlS67F+SnHX
	ORpV263RYJV8OUuLZKP6xMLc6FfdGWykLEz177UhdGgG6+eJT9DtC6fXwZCrvOq1zTtOjT1qCzzMZ
	wbncf/QC/Nu+4hFi9CYp9/EmqDlZyreiHv3YF5W9v+KDdcQ6av3IlNOOxfJYX718p24Ch/ES6C177
	ZJAS2y7WuYHwV/Fv146L/JKvUyYLUbypGx9mUGsnD2CcE9iN+G+H6wbwyS/9pUex80oA9TDQFP6Fc
	LmOm1QNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrvGr-00000006Io4-43PT;
	Mon, 16 Feb 2026 09:52:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrvGl-00000006Igq-3tBp;
	Mon, 16 Feb 2026 09:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771235513;
	bh=CHZfT/IKJiZGFKtOYY/Mprmvkw7BEC5CrXJh3PS9lyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PCBD6VJv2YXp5qEMazNlob6GdFUXneSzRGBeeO+E5ksEi7nvx+1PZW6MJzuE6N4c9
	 Ek8HpumCSGmIJIPMEsC4uRHPDnunwfFrqWLWJCmwu679g/CCNoV3tesA16diN7V30F
	 8RcB61p/Q18pq7z/Rbl3keAlEKAl5kSGXlrGuxohrkp05YhW2rCd3VMZbliHLH68AE
	 8OWPrOfLTn1svT6jQJXQvApZo8x1RAdswivIeY0hK2jJDZygkRFpuzIWuYHfYyNrHP
	 Uiy1LFI1att9e12gkMqLU+cm0Wl4Vn7SwVQIQXV2xtNK6HR4Di29qgvhgMe2ZBe032
	 IMJXhrueb+14A==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f6d2:8ed9:560e:4f27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 27F3B17E35C9;
	Mon, 16 Feb 2026 10:51:53 +0100 (CET)
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v13 6/6] arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588
Date: Mon, 16 Feb 2026 10:51:38 +0100
Message-ID: <20260216095144.107356-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216095144.107356-1-benjamin.gaignard@collabora.com>
References: <20260216095144.107356-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_015156_118498_38CE1164 
X-CRM114-Status: UNSURE (   7.87  )
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
index 35e9eb180c9a..b56e666acf63 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1524,6 +1524,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_VSI_IOMMU=y
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
-- 
2.43.0


