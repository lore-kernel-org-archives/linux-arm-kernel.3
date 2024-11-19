Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F9DD6007B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 08:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rfRPeJv9b+5MklHMVSrCiVgH+hmaDNicfWnfjxpRi08=; b=OvtEoPtuFxZn1weQW+7cXtEm21
	W/UC4a3qgM8NBi9AsEz5s7F0yEIPr9Yy3M62TfSHseAGpAUJG7hPPXRkAcKiKS+w2RqI5Vx5Iav3U
	OOhaK2GDy6SKkaz808OEyu+jS0p6JblzELlTlXIAxs7VNdlfgoq6SLGtAUhLbvqiZGt4mKVKwdpB4
	dO1kC73YcS2FrCCEa65PEyTRbD0QiosWujx/A+W6sHqOgZ9f1v89bIhCSCOX24bWDj9Rg37vUP2fM
	n509lGqpPBi7Oyg1qsfKedO557eHqVFb0+5ABkB8nyZ4PCY2bnh/jwEaTmoj3P/l/A+DNG/bvCIF9
	fDYowFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJR5-0000000BjSc-0gO2;
	Tue, 19 Nov 2024 08:18:11 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJQ7-0000000BjJ3-3s0n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 08:17:14 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-382411ea5eeso1318012f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 00:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732004230; x=1732609030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rfRPeJv9b+5MklHMVSrCiVgH+hmaDNicfWnfjxpRi08=;
        b=0Nsm/IpyQuL2p6iLCm1KoBDrn4A8tOMEyjTT8fFeF6uHiErbGL0Nc3wrzM8tgSZ0ys
         7Y4Jav+nDZjUrumSzvsxgbWCwM/rSKFsC7UZcGLuErogT6fNWPCYKM9xVmpHV/2lUA3k
         BcpEwZ7MLA5dt2m5gsTjtVSMOJiPMqA1SDpE9Wq5yCE+jZHDu531C0+tU7oZKzkK2efG
         jlVpuLOk1tSb+3Itvoa5fXmJ5M3YdfRMf8bdjiLkxSOIub7MzMOHXMte3f1Uh+m8cJxS
         Mxhngv4Q1qqiLhcq6V2OwoZkbO+Q4hMs2bfVPB1ioIS4m0vZbuUIoKOzT0Jym4luUEGq
         vNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732004230; x=1732609030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfRPeJv9b+5MklHMVSrCiVgH+hmaDNicfWnfjxpRi08=;
        b=RU3BujGhhdsK2jo6QbcOpdJL1r8ZldPXBUQwecBHL17HrKG3qkNyiRa/YFY/bXYAxK
         S3xQZak31WrHJx0xrCfI92uDSK/onTnLwjXiht+KXvI5DVX+0aLS9DigQpLM/DS5t3Eh
         X1dON2b40z34Ji9Pkr2VTo2KHI58TxBUdS5nTQyi9oQCxmTrleqefMQqbZht/DK6a7xb
         w2OWbS2+oAFT0zVDMiMItrKjQNYZpNgodKmz+/q/izKfyiQumXhNV1rQmEP9FO07NHqA
         Cbrz1jZYmrVxgoHJjei5v17Dww6Y5TNmzbzsGC7r3ngAIVZJMO+DS7bkjte+PRjzqsGF
         uuzg==
X-Forwarded-Encrypted: i=1; AJvYcCVpQOPNfpXuL/2nk7/qdAZtiWGwL3inJBrEmnvYubPzyKcDnT8pyne9XodtneSv9MppAqxcwyKl53DLVxOhdpVE@lists.infradead.org
X-Gm-Message-State: AOJu0YyockJvoNHMZ7NQJCADw3jEyLaO9Q3e+wqxXCcLWlRPktjNxu3V
	xr6NDEHip56xCrnnE5dAJY1aoTpCmiM5nItPBNi6ZEVDxyTiwO6Kl/wDmPfJL6o=
X-Google-Smtp-Source: AGHT+IE8UC5xo/EXauIpi30O/6QpEs3dvAFOyd1qOQ9SCqrRP4JGzhvWxQ0rNGF/bwnRQGTw1YZ6JQ==
X-Received: by 2002:a5d:6d82:0:b0:382:484d:45da with SMTP id ffacd0b85a97d-3824cb30e81mr1673211f8f.6.1732004228585;
        Tue, 19 Nov 2024 00:17:08 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:9b70:ed4b:d274:54e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38244220183sm6495288f8f.99.2024.11.19.00.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 00:17:08 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: [PATCH] mailbox: Switch back to struct platform_driver::remove()
Date: Tue, 19 Nov 2024 09:16:51 +0100
Message-ID: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7380; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=BnCPo5Jv3ffjYxxYM7XQApvz+ShJZ5fwcjW9lNQ732I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnPEl0l82yWH4cD9PUDIPfKIE/RnbW2FKHwIBNo NRXP1KykqyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZzxJdAAKCRCPgPtYfRL+ ToaTCACO97vvz1RQ3OfeVhaCoF9jIByuwurbxrlo/e4TXGjXh2MD85LTlsW7X/pdlEpXrP7LStP rubeC1o9FEsFEJDpzNVhMoNb2mBLHniaqeivaaIITO1C7iOgf/7l6bUdNF6szQsgsyIOa7eK+h4 6Evgz1M3LBYLhtZcwyCg8pysblUX/f+7Bpgdzo1ijgQjhinFHE0K8ep6xD7n3F0gZTUEt/9QWEa fgoFuQD5sY05UOOOvRjFNRAkpP+8qV6HYJ8eSFoFVoVvAsSuYcnfHR1oaeC82Zdgm4c4nHE4sye cAgefJza5W4P8GCaVvE9A7L2tHfGs7DQoQm1AUVXBMxOcDDU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_001712_232195_A2AC9D61 
X-CRM114-Status: GOOD (  21.42  )
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

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/mailbox to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Make a few indentions consistent while touching these struct
initializers.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/mailbox. While I usually prefer
to do one logical change per patch, this seems to be overengineering
here as the individual changes are really trivial and shouldn't be much
in the way for stable backports. But I'll happily split the patch if you
prefer it split.

This is based on today's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend.

Best regards
Uwe

 drivers/mailbox/bcm-flexrm-mailbox.c    | 2 +-
 drivers/mailbox/bcm-pdc-mailbox.c       | 2 +-
 drivers/mailbox/imx-mailbox.c           | 2 +-
 drivers/mailbox/mailbox-test.c          | 4 ++--
 drivers/mailbox/mtk-cmdq-mailbox.c      | 2 +-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
 drivers/mailbox/qcom-ipcc.c             | 2 +-
 drivers/mailbox/stm32-ipcc.c            | 2 +-
 drivers/mailbox/sun6i-msgbox.c          | 4 ++--
 drivers/mailbox/tegra-hsp.c             | 2 +-
 drivers/mailbox/zynqmp-ipi-mailbox.c    | 2 +-
 11 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mailbox/bcm-flexrm-mailbox.c b/drivers/mailbox/bcm-flexrm-mailbox.c
index b1abc2a0c971..41f79e51d9e5 100644
--- a/drivers/mailbox/bcm-flexrm-mailbox.c
+++ b/drivers/mailbox/bcm-flexrm-mailbox.c
@@ -1675,7 +1675,7 @@ static struct platform_driver flexrm_mbox_driver = {
 		.of_match_table = flexrm_mbox_of_match,
 	},
 	.probe		= flexrm_mbox_probe,
-	.remove_new	= flexrm_mbox_remove,
+	.remove		= flexrm_mbox_remove,
 };
 module_platform_driver(flexrm_mbox_driver);
 
diff --git a/drivers/mailbox/bcm-pdc-mailbox.c b/drivers/mailbox/bcm-pdc-mailbox.c
index a873672a9082..406bc41cba60 100644
--- a/drivers/mailbox/bcm-pdc-mailbox.c
+++ b/drivers/mailbox/bcm-pdc-mailbox.c
@@ -1618,7 +1618,7 @@ static void pdc_remove(struct platform_device *pdev)
 
 static struct platform_driver pdc_mbox_driver = {
 	.probe = pdc_probe,
-	.remove_new = pdc_remove,
+	.remove = pdc_remove,
 	.driver = {
 		   .name = "brcm-iproc-pdc-mbox",
 		   .of_match_table = pdc_mbox_of_match,
diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index f815dab3be50..9889e4d0d9da 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -1120,7 +1120,7 @@ static const struct dev_pm_ops imx_mu_pm_ops = {
 
 static struct platform_driver imx_mu_driver = {
 	.probe		= imx_mu_probe,
-	.remove_new	= imx_mu_remove,
+	.remove		= imx_mu_remove,
 	.driver = {
 		.name	= "imx_mu",
 		.of_match_table = imx_mu_dt_ids,
diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index 3386b4e72551..c9dd8c42c0cd 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -441,8 +441,8 @@ static struct platform_driver mbox_test_driver = {
 		.name = "mailbox_test",
 		.of_match_table = mbox_test_match,
 	},
-	.probe  = mbox_test_probe,
-	.remove_new = mbox_test_remove,
+	.probe = mbox_test_probe,
+	.remove = mbox_test_remove,
 };
 module_platform_driver(mbox_test_driver);
 
diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 4bff73532085..bac5b8eaa665 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -796,7 +796,7 @@ MODULE_DEVICE_TABLE(of, cmdq_of_ids);
 
 static struct platform_driver cmdq_drv = {
 	.probe = cmdq_probe,
-	.remove_new = cmdq_remove,
+	.remove = cmdq_remove,
 	.driver = {
 		.name = "mtk_cmdq",
 		.pm = &cmdq_pm_ops,
diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 7d91e7c016ba..f0d1fc0fb9ff 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -167,7 +167,7 @@ MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
 
 static struct platform_driver qcom_apcs_ipc_driver = {
 	.probe = qcom_apcs_ipc_probe,
-	.remove_new = qcom_apcs_ipc_remove,
+	.remove = qcom_apcs_ipc_remove,
 	.driver = {
 		.name = "qcom_apcs_ipc",
 		.of_match_table = qcom_apcs_ipc_of_match,
diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index d537cc9c4d4b..14c7907c6632 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -346,7 +346,7 @@ static const struct dev_pm_ops qcom_ipcc_dev_pm_ops = {
 
 static struct platform_driver qcom_ipcc_driver = {
 	.probe = qcom_ipcc_probe,
-	.remove_new = qcom_ipcc_remove,
+	.remove = qcom_ipcc_remove,
 	.driver = {
 		.name = "qcom-ipcc",
 		.of_match_table = qcom_ipcc_of_match,
diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
index 1442f275782b..4f63f1a14ca6 100644
--- a/drivers/mailbox/stm32-ipcc.c
+++ b/drivers/mailbox/stm32-ipcc.c
@@ -379,7 +379,7 @@ static struct platform_driver stm32_ipcc_driver = {
 		.of_match_table = stm32_ipcc_of_match,
 	},
 	.probe		= stm32_ipcc_probe,
-	.remove_new	= stm32_ipcc_remove,
+	.remove		= stm32_ipcc_remove,
 };
 
 module_platform_driver(stm32_ipcc_driver);
diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbox.c
index 3dcc54dc83b2..6ba6920f4645 100644
--- a/drivers/mailbox/sun6i-msgbox.c
+++ b/drivers/mailbox/sun6i-msgbox.c
@@ -307,8 +307,8 @@ static struct platform_driver sun6i_msgbox_driver = {
 		.name = "sun6i-msgbox",
 		.of_match_table = sun6i_msgbox_of_match,
 	},
-	.probe  = sun6i_msgbox_probe,
-	.remove_new = sun6i_msgbox_remove,
+	.probe = sun6i_msgbox_probe,
+	.remove = sun6i_msgbox_remove,
 };
 module_platform_driver(sun6i_msgbox_driver);
 
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 19ef56cbcfd3..8d5e2d7dc03b 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -951,7 +951,7 @@ static struct platform_driver tegra_hsp_driver = {
 		.pm = &tegra_hsp_pm_ops,
 	},
 	.probe = tegra_hsp_probe,
-	.remove_new = tegra_hsp_remove,
+	.remove = tegra_hsp_remove,
 };
 
 static int __init tegra_hsp_init(void)
diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 521d08b9ab47..91365acd334d 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -1015,7 +1015,7 @@ MODULE_DEVICE_TABLE(of, zynqmp_ipi_of_match);
 
 static struct platform_driver zynqmp_ipi_driver = {
 	.probe = zynqmp_ipi_probe,
-	.remove_new = zynqmp_ipi_remove,
+	.remove = zynqmp_ipi_remove,
 	.driver = {
 		   .name = "zynqmp-ipi",
 		   .of_match_table = of_match_ptr(zynqmp_ipi_of_match),

base-commit: 414c97c966b69e4a6ea7b32970fa166b2f9b9ef0
-- 
2.45.2


