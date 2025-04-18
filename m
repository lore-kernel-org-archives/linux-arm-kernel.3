Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE60C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 11:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RhKKzOTavQSyVncFCb3AgWCcG0eXDV8j6b9vH+lBEeA=; b=rUP04ampI6g+n49pkjZJmr9WqW
	vV63R3jlhk3TNIGHy5C8M734ji20GHU1t4dy3NizTE9cgbU2Qbu4PJ/nirL+PLPt6y76gQb5TVbaj
	/aaB5bajBZWAlFINorYKUUXKFLl/sznLm61EDegx49nw2Yv9uo660DgIFJwdHTPxZolPeend18GM/
	3vQNQDr+AN+Bh4+WQwgB+qAFaD5ViXOuVMsXuwL22TD9jNQCGfkDEskfL2gW56XJRz2IsbKKoi2Gq
	DtOCQVJ60l5E5BVylZmYbGIgkSudMjOKngYXFM4wgwyUZ8EIa2M6SACo1WGJRIr7ouedeB6CnjbNm
	iWk6Tgug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5jw8-0000000Fypw-3k89;
	Fri, 18 Apr 2025 11:31:12 +0000
Received: from smtp-18.smtpout.orange.fr ([80.12.242.18] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5jt9-0000000FySm-3pqh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 11:28:10 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 5jt3uIpWSETiN5jt6uVhXy; Fri, 18 Apr 2025 13:28:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1744975684;
	bh=RhKKzOTavQSyVncFCb3AgWCcG0eXDV8j6b9vH+lBEeA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VMdEVWS2hqlZxDo0TKNCxl3joZjhxZ5dBS7jxMf3Ig2oLFcedqURf035X+Jw176ZQ
	 QcsWaiXrLT8X5xmmDrjRQYF2ImTuhZ+VMWlUGkk/Mwl7ck6Gv7cp8wiTan9TvMxRWk
	 ERm0gI5Vrr/96HQVBSu44t5mHNziyqFa4Jg5ddIW69TfzUTgddT8Ju8VD/okA5wfv6
	 4gZlT5pA6eIbzwrR0wG7RNeWSL9Uze7pujd56A3Mur39GyaOsqWIE99ykQ5N08Hfs3
	 Wv4hg3yq+TMbTHpEnLoIPgPWakRcLRKzS1ytgYg4Tr9o9LURl4djvDBVsZJICso9yW
	 4AhmuJ7XVYN7Q==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 18 Apr 2025 13:28:04 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] spi: stm32-ospi: Fix an error handling path in stm32_ospi_probe()
Date: Fri, 18 Apr 2025 13:27:53 +0200
Message-ID: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_042809_157407_E7B81B41 
X-CRM114-Status: UNSURE (   9.31  )
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

If an error occurs after a successful stm32_ospi_dma_setup() call, some
dma_release_channel() calls are needed to release some resources, as
already done in the remove function.

Fixes: 79b8a705e26c ("spi: stm32: Add OSPI driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/spi/spi-stm32-ospi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 668022098b1e..9ec9823409cc 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -960,6 +960,10 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 err_pm_enable:
 	pm_runtime_force_suspend(ospi->dev);
 	mutex_destroy(&ospi->lock);
+	if (ospi->dma_chtx)
+		dma_release_channel(ospi->dma_chtx);
+	if (ospi->dma_chrx)
+		dma_release_channel(ospi->dma_chrx);
 
 	return ret;
 }
-- 
2.49.0


