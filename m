Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C00C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZajkPB/F/xijLaqshMyCM8xoDw+ArhkQ6yHFXccOwEg=; b=B+nq6o3NRl7OXWQ6h0L9QBBLZ5
	lDBYfOuflAR7PnjP4d+FJCLZqAOXSZN97c/qlx1y+Pl04PLOXBNLKjTMy/J5/6UVHTRCkF89GF1TY
	grtvX0xWmWZa5AXEUIRjcCuUBX5M16TbsdBzXAedb9BC8Se7GIZaoXYKbczj9qUiEam40CBviSVHw
	m0j0C08znwnPAy2YKDLe7i5wXdBTnJyDdqqrd9Xv2rwqD/Sbhhg+IQWvkX0LQAh3Bhj+jBwHyyuqQ
	xRDthqIQn9IMSYNeCWurrS5ChNYudh42agPMwHBPEVt8j/wwocHGJ7m72RPoSYIpLO8bZq0mfaamg
	RIqjOqSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvRc-00000005Yx7-2xFb;
	Thu, 06 Aug 2026 10:35:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvRb-00000005YvX-12ZB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:35:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 150DA42A67;
	Thu,  6 Aug 2026 10:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403691F00A3D;
	Thu,  6 Aug 2026 10:35:18 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: QCOM interfaces should depend on ARCH_QCOM
Date: Thu,  6 Aug 2026 12:35:15 +0200
Message-ID: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The various Qualcomm firmware interfaces are only present on Qualcomm
systems.  Hence add dependencies on ARCH_QCOM, to prevent asking the
user about them when configuring a kernel without Qualcomm SoC support.
Make QCOM_PAS invisible instead, as it is already selected by its users
when needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I wondered whether QCOM_SCM should be made invisible, too, as it seems
to be selected by its users? But apparently commit 5c1a2975d23c51c0
("firmware: qcom_scm: Migrate to generic PAS service") in net-next/main
and soc/for-next made it visible on purpose?
---
 drivers/firmware/qcom/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index c7f8413ab996cf12..691db0ded8e8cf63 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -7,7 +7,7 @@
 menu "Qualcomm firmware drivers"
 
 config QCOM_PAS
-	tristate "Qualcomm generic PAS interface driver"
+	tristate "Qualcomm generic PAS interface driver" if COMPILE_TEST
 	help
 	  Enable the generic Peripheral Authentication Service (PAS) provided
 	  by the firmware. It acts as the common layer with different TZ
@@ -16,6 +16,7 @@ config QCOM_PAS
 
 config QCOM_PAS_TEE
 	tristate "Qualcomm PAS TEE interface driver"
+	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_PAS
 	depends on TEE
 	depends on !CPU_BIG_ENDIAN
@@ -26,6 +27,7 @@ config QCOM_PAS_TEE
 
 config QCOM_SCM
 	tristate "Qualcomm PAS SCM interface driver"
+	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_PAS
 	select QCOM_TZMEM
 	default y if ARCH_QCOM
-- 
2.43.0


