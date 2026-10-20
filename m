Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBE1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TA7eSrSl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4fS8JsWi87lgCJfrvj9ZOh/iM3TaVnYX1NFeiZcZli4=; b=TA7eSrSlw6/sOkr1EmE1+WOg0T
	R1zbIBjaWpro+r5r9HiEwYlFQh5hl/6rzTqiaraiqkjGTYSQc39C1Mrcc1i+9OLuA6/08c5wkOPh7
	023w3+0XXSYMO2v1EoJSjCQoiQXWgUqlSCDajQw2ymAOdLDjKgUAHKxbmJdUTWMdKAUuCzEsVKfrN
	zDR23eQ9AoXhOdyGnJF1NLa7pB9XS2kLXzm44psOfMGYipcCQxH6IM6Crnys/4ee2WOdsgMUPQLA7
	Q0024XEKjXRRrQObbs4F+K8CQ6twsRs/AAHcKe2gNxJMhPIprYL/vunBMhV9WkkNZud366MoUc2N2
	Xf6A0/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8wg-00000009f87-3cQ6;
	Tue, 20 Oct 2026 12:27:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8wf-00000009f7I-3vVq;
	Tue, 20 Oct 2026 12:27:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F0A8C60052;
	Tue, 20 Oct 2026 12:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DBF1F000C6;
	Tue, 20 Oct 2026 12:27:54 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Joy Chakraborty <joychakr@google.com>,
	Roy Luo <royluo@google.com>,
	Naveen Kumar <mnkumar@google.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
Date: Tue, 20 Oct 2026 14:27:51 +0200
Message-ID: <90a172c2980073a09b4f01c21a251c3d0d2d6fe5.1792499240.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Google Tensor SoC USB PHY is only present on Google Tensor G5
(Laguna) SoCs.  Hence add a dependency on ARCH_GOOGLE, to prevent asking
the user about this driver when configuring a kernel without Google
Tensor SoC support.

Fixes: cbce66669c82ee9a ("phy: Add Google Tensor SoC USB PHY driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - ARCH_GOOGLE exists as of commit cf3df78629f24b40 ("arm64: dts:
    google: Add dts directory for Google-designed silicon") in
    soc/for-next.
---
 drivers/phy/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 105fbe408aa25b35..d151c05297d7e57a 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -93,6 +93,7 @@ config PHY_ECONET_PCIE
 
 config PHY_GOOGLE_USB
 	tristate "Google Tensor SoC USB PHY driver"
+	depends on ARCH_GOOGLE || COMPILE_TEST
 	select GENERIC_PHY
 	depends on TYPEC
 	help
-- 
2.43.0


