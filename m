Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73B2CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pz/nVAWEjhH+yEbbmvQvaD59U0TyZ0ixuJn/itcHlaE=; b=Q21zv7wU2oeTciweVxsfQqalAY
	H2D6KVGvMLIzPnViunDfH0xyxab0g/W4lX33EXYRI5mvMZnO2DJxuLSZQNvRQho+gDx1S122dJdPc
	FvLXvjmXOehXUvCYUiEBjdoTcgD0fItnFRr7XxzIvN+hw7lMYVul8mUqUYVlUH3EWELYnXzTuWcHT
	nDMPsqYejfpOTjNJsQIYGCiaR3gxbcEsfi5LbuOzJEJEaLMJHPGrXwsOgmrwJK1oBqxszXKMSnG3k
	rgnqcsQJM4AXIBX9BnGfteuIQ9SnJAVctWniXqwGhtGoUHTeaoq9LKV55xehTmDZDBY4Iaage4WR5
	jTe08IBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9wb-0000000H4jf-1QDK;
	Tue, 18 Nov 2025 00:51:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9wV-0000000H4dk-0wZg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:51:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B1A560258;
	Tue, 18 Nov 2025 00:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DDCC4CEF5;
	Tue, 18 Nov 2025 00:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427094;
	bh=abw3WyBlH0LdVJ/qIAAe2kgPCAjhL8NOjxt6Yr6wl4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bg1KhUKZpfzoAoxC1bueX15q0RQckG7lKlski2DfUPEs+ldrPVfCF939PKLNUvt/x
	 4l+cZd0/Ti0jY89zlOIe6iRqVuGcccnXowBvZn3Gd6c63lweOb+MDzU7brSscPOwLe
	 Vyk2XNLFc0cJRdj0T1aHrM/Pxt1xvCSsG+Z7lfgE6m0Lg6i0s4RRUvbiZcUZGkmW46
	 opDwsuGVAXVUpr5xWevv1r0NAXRPWNGS2VCODXcXnY3bupdbeGoF4uB9/nUA66wxxL
	 SVUYD6yjtoZ+6cb7tvnF1kV0+Ydoy88zC2QIOHnuH4+Z0t4/FPDKzs4ELyy7fNewwO
	 f/6drP/pku9lw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v2 13/15] gpio: xgene: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:27 +0800
Message-ID: <20251118003229.26636-14-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118003229.26636-1-jszhang@kernel.org>
References: <20251118003229.26636-1-jszhang@kernel.org>
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

Use the modern PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/gpio/gpio-xgene.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 4f627de3f56c..809668449dbe 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -130,7 +130,7 @@ static int xgene_gpio_dir_out(struct gpio_chip *gc,
 	return 0;
 }
 
-static __maybe_unused int xgene_gpio_suspend(struct device *dev)
+static int xgene_gpio_suspend(struct device *dev)
 {
 	struct xgene_gpio *gpio = dev_get_drvdata(dev);
 	unsigned long bank_offset;
@@ -143,7 +143,7 @@ static __maybe_unused int xgene_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int xgene_gpio_resume(struct device *dev)
+static int xgene_gpio_resume(struct device *dev)
 {
 	struct xgene_gpio *gpio = dev_get_drvdata(dev);
 	unsigned long bank_offset;
@@ -156,7 +156,7 @@ static __maybe_unused int xgene_gpio_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(xgene_gpio_pm, xgene_gpio_suspend, xgene_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(xgene_gpio_pm, xgene_gpio_suspend, xgene_gpio_resume);
 
 static int xgene_gpio_probe(struct platform_device *pdev)
 {
@@ -204,7 +204,7 @@ static struct platform_driver xgene_gpio_driver = {
 		.name = "xgene-gpio",
 		.of_match_table = xgene_gpio_of_match,
 		.acpi_match_table = ACPI_PTR(xgene_gpio_acpi_match),
-		.pm     = &xgene_gpio_pm,
+		.pm     = pm_sleep_ptr(&xgene_gpio_pm),
 	},
 	.probe = xgene_gpio_probe,
 };
-- 
2.51.0


