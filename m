Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEB2D41D6E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qJl6gQahQ6INKrNHbk0dBjtN96KRkbwEjYWLmPhvKrg=; b=3NSZzGRQh71qT37KIJhZRjEPUa
	hHQlzo/PArXS64l97uno//ezAm4odcd7V7+4oSlzU1IlYG3TXHuapATQFPGr46NGIeseIR5dBWz2Q
	tKBvrUP3aytOuoMqLV4P1ByQCqIOol6GG6BJ5CwrzlaLMgpRDSVmILiWis185ilyEqYi2GHWiA4Dj
	bNsQbC7Qzoe6T2LAQ296H4DWlRZmYKhKyD8wH23J4jRqNydSzEXE0lY9OGSYPOoDaLHR3DwmZ5Imm
	b8at6n33UV8sgE0d9Pnv3sZH3l55Y/NEKLsf0qr3Cdrsiiw/3MbWWbXyFUMyxWPLg1EAwSDJtg4qv
	qgO5trCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmQw-00000002fNx-3LpP;
	Tue, 12 Nov 2024 08:39:34 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmNP-00000002ef2-2si4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 08:35:57 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so4137676f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 00:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731400554; x=1732005354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJl6gQahQ6INKrNHbk0dBjtN96KRkbwEjYWLmPhvKrg=;
        b=I6S2iPSfvfHgGY9Ev2VY9DeZWTuuwBHFrr1YmhGebjYEYw0R8X6Uh3WwnRCwCvtK4d
         Lx7v2Lur3GfB3cnI5jahBxUd0UassSNPp3zUw/XGfaowK8LjBYGgsN6IN6kqmpIAOhoO
         y67WDDTeoQxlcfw35LxR0ap1+ptzoGF2zEjX3tEUKlBc4gGEeaVr8ZBxf2IjC44d7dim
         fWH+YQdxJi8Vhj53zUg9hrIWvZeLItego/+OY/3qKONlu6m6iaPB5JEpulKn38BlNqzW
         ostmRp/PHHP2XFIcbeAiSJvg6O204W3se3VxZyjSNU1talBGnqymJxYUFP4WQY/Xy3K1
         qDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400554; x=1732005354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJl6gQahQ6INKrNHbk0dBjtN96KRkbwEjYWLmPhvKrg=;
        b=omsv3j53C0P7KqMpZTb7c6WkPTtGfN2zQ8iSdKB0IjBQOwv9yN+iaJGQ+sEYAW/d6b
         yvX0WIkSkupMsbKVQAjRDRIjxiphJ57LF/4DauY1aQVGhqI6vk5OXSsX/W84LPIH3UHH
         upYmrXEvxYoCMnr+cx+YGE0MmhCyYrdQswSCZANR4dEIus50WI4Nt0ghVUFOG9XDat2N
         KgBUSZu17hHM9rRHYC51MBkEdwnYdKx8XEqylvTbGjPqD0TwpoyS3Qd/I/keVn+dFJE+
         RTVks8bpu8F+N232ISD3xIqn9ioMvis6dZ7VCpaXpSoAfKwWFZ77IwoqUjTLQ7lzfkm7
         Gp8w==
X-Forwarded-Encrypted: i=1; AJvYcCUFaroQgympIkaNvgXaALK0ugmDO1QEzL+/jBYYvaYu3/ntO5zTEmYUAjUbJ+1xdhh0H3g4VCDQcFuh7iFKy1a8@lists.infradead.org
X-Gm-Message-State: AOJu0YwPuYIDmY4DreMcqYNIg1YobC0b98fapgvzN6rOTzfbRtuKkQ6i
	7nleGB2jwEKUJQvqxNV25+bLzerA9Yf0MOsmrCycKmbxVCNdhJTS0ah6RRrdAJQ=
X-Google-Smtp-Source: AGHT+IGc0QiVA+jVnUwTo6TMUTaOQP8dwxrO1h8wUeEf48cEcgf/wVeBxK6XAbl4jJoqNqJWMj+z9g==
X-Received: by 2002:a5d:5889:0:b0:37d:48ec:547 with SMTP id ffacd0b85a97d-381f17255c8mr15078629f8f.29.1731400553962;
        Tue, 12 Nov 2024 00:35:53 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05e5871sm202196645e9.37.2024.11.12.00.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:35:53 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Jay Fang <f.fangjian@huawei.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andre Przywara <andre.przywara@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Zhang Zekun <zhangzekun11@huawei.com>,
	"Ricardo B. Marliere" <ricardo@marliere.net>,
	Sean Young <sean@mess.org>,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH] bus: Switch back to struct platform_driver::remove()
Date: Tue, 12 Nov 2024 09:35:19 +0100
Message-ID: <77ef3031ad2d27f4ae695245cf7f62b3f9dda859.1731397206.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8332; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=rgLboLCaUdlJWjcAhhH52j9nJn/G65xEOruyM378a48=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnMxNVqYnKYsfMQYFqk+WxukXoIil0oOuioJU68 rc4Lnvd5h2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZzMTVQAKCRCPgPtYfRL+ Tk8sB/0aNAqsBtbPSP+Lj7YIcg4DYUH0S8Kqu7f/eS/cA0InWB6J2mcYPq2uv9DlsTgwK78O7QT cfETM/MRIpzCqXJlq6a8NsUrX1yhAdWpV0eYbgory/mSdNsNP1kypKWIFZqsDR1o5bQNfnyEod4 bzUOUK+g1lAuuVcG1I7V0j9u6zaOHQRNljBrlhbIvFrr9hlZk2WUil97+6y+ucmR98Y9Z0J8f4J o+r4fDsFdsR1ewqoFCYiTnGXaMxuGDJG3Hmjeqctqqg/3VwRh0RmXe+vp73pv72CpvnQzyh2Sci N6YYg4E9YDcBegCIZxWRPuxwCszNsJRwiNtU2TArRMENAfLQ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_003555_752775_0EAEA99D 
X-CRM114-Status: GOOD (  21.04  )
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

Convert all platform drivers below drivers/bus to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/bus. While I usually prefer to
do one logical change per patch, this seems to be overengineering here
as the individual changes are really trivial and shouldn't be much in
the way for stable backports. But I'll happily split the patch if you
prefer it split. Also if you object the indentation stuff, I can rework
that. There is no dedicated maintainer for drivers/bus, maybe Arnd can
merge this via armsoc?

This is based on yesterday's next, if conflicts arise when you apply it
at some later time and don't want to resolve them, feel free to just
drop the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 drivers/bus/fsl-mc/fsl-mc-bus.c  | 2 +-
 drivers/bus/hisi_lpc.c           | 2 +-
 drivers/bus/omap-ocp2scp.c       | 2 +-
 drivers/bus/omap_l3_smx.c        | 2 +-
 drivers/bus/qcom-ssc-block-bus.c | 2 +-
 drivers/bus/simple-pm-bus.c      | 2 +-
 drivers/bus/sun50i-de2.c         | 2 +-
 drivers/bus/sunxi-rsb.c          | 2 +-
 drivers/bus/tegra-aconnect.c     | 2 +-
 drivers/bus/tegra-gmi.c          | 2 +-
 drivers/bus/ti-pwmss.c           | 2 +-
 drivers/bus/ti-sysc.c            | 2 +-
 drivers/bus/ts-nbus.c            | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 930d8a3ba722..2916d1333649 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -1210,7 +1210,7 @@ static struct platform_driver fsl_mc_bus_driver = {
 		   .acpi_match_table = fsl_mc_bus_acpi_match_table,
 		   },
 	.probe = fsl_mc_bus_probe,
-	.remove_new = fsl_mc_bus_remove,
+	.remove = fsl_mc_bus_remove,
 	.shutdown = fsl_mc_bus_remove,
 };
 
diff --git a/drivers/bus/hisi_lpc.c b/drivers/bus/hisi_lpc.c
index 09340adbacc2..53dd1573e323 100644
--- a/drivers/bus/hisi_lpc.c
+++ b/drivers/bus/hisi_lpc.c
@@ -689,6 +689,6 @@ static struct platform_driver hisi_lpc_driver = {
 		.acpi_match_table = hisi_lpc_acpi_match,
 	},
 	.probe = hisi_lpc_probe,
-	.remove_new = hisi_lpc_remove,
+	.remove = hisi_lpc_remove,
 };
 builtin_platform_driver(hisi_lpc_driver);
diff --git a/drivers/bus/omap-ocp2scp.c b/drivers/bus/omap-ocp2scp.c
index 7d7479ba0a75..e4dfda7b3b10 100644
--- a/drivers/bus/omap-ocp2scp.c
+++ b/drivers/bus/omap-ocp2scp.c
@@ -101,7 +101,7 @@ MODULE_DEVICE_TABLE(of, omap_ocp2scp_id_table);
 
 static struct platform_driver omap_ocp2scp_driver = {
 	.probe		= omap_ocp2scp_probe,
-	.remove_new	= omap_ocp2scp_remove,
+	.remove		= omap_ocp2scp_remove,
 	.driver		= {
 		.name	= "omap-ocp2scp",
 		.of_match_table = of_match_ptr(omap_ocp2scp_id_table),
diff --git a/drivers/bus/omap_l3_smx.c b/drivers/bus/omap_l3_smx.c
index ee6d29925e4d..7f0a8f8b3f4c 100644
--- a/drivers/bus/omap_l3_smx.c
+++ b/drivers/bus/omap_l3_smx.c
@@ -273,7 +273,7 @@ static void omap3_l3_remove(struct platform_device *pdev)
 
 static struct platform_driver omap3_l3_driver = {
 	.probe		= omap3_l3_probe,
-	.remove_new     = omap3_l3_remove,
+	.remove         = omap3_l3_remove,
 	.driver         = {
 		.name   = "omap_l3_smx",
 		.of_match_table = of_match_ptr(omap3_l3_match),
diff --git a/drivers/bus/qcom-ssc-block-bus.c b/drivers/bus/qcom-ssc-block-bus.c
index 5931974a21fa..85d781a32df4 100644
--- a/drivers/bus/qcom-ssc-block-bus.c
+++ b/drivers/bus/qcom-ssc-block-bus.c
@@ -373,7 +373,7 @@ MODULE_DEVICE_TABLE(of, qcom_ssc_block_bus_of_match);
 
 static struct platform_driver qcom_ssc_block_bus_driver = {
 	.probe = qcom_ssc_block_bus_probe,
-	.remove_new = qcom_ssc_block_bus_remove,
+	.remove = qcom_ssc_block_bus_remove,
 	.driver = {
 		.name = "qcom-ssc-block-bus",
 		.of_match_table = qcom_ssc_block_bus_of_match,
diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 50870c827889..5dea31769f9a 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -128,7 +128,7 @@ MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
 
 static struct platform_driver simple_pm_bus_driver = {
 	.probe = simple_pm_bus_probe,
-	.remove_new = simple_pm_bus_remove,
+	.remove = simple_pm_bus_remove,
 	.driver = {
 		.name = "simple-pm-bus",
 		.of_match_table = simple_pm_bus_of_match,
diff --git a/drivers/bus/sun50i-de2.c b/drivers/bus/sun50i-de2.c
index 3339311ce068..dfe588179aca 100644
--- a/drivers/bus/sun50i-de2.c
+++ b/drivers/bus/sun50i-de2.c
@@ -36,7 +36,7 @@ static const struct of_device_id sun50i_de2_bus_of_match[] = {
 
 static struct platform_driver sun50i_de2_bus_driver = {
 	.probe = sun50i_de2_bus_probe,
-	.remove_new = sun50i_de2_bus_remove,
+	.remove = sun50i_de2_bus_remove,
 	.driver = {
 		.name = "sun50i-de2-bus",
 		.of_match_table = sun50i_de2_bus_of_match,
diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index a89d78925637..7a33c3b31d1e 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -832,7 +832,7 @@ MODULE_DEVICE_TABLE(of, sunxi_rsb_of_match_table);
 
 static struct platform_driver sunxi_rsb_driver = {
 	.probe = sunxi_rsb_probe,
-	.remove_new = sunxi_rsb_remove,
+	.remove = sunxi_rsb_remove,
 	.driver	= {
 		.name = RSB_CTRL_NAME,
 		.of_match_table = sunxi_rsb_of_match_table,
diff --git a/drivers/bus/tegra-aconnect.c b/drivers/bus/tegra-aconnect.c
index de80008bff92..90e3b0a10816 100644
--- a/drivers/bus/tegra-aconnect.c
+++ b/drivers/bus/tegra-aconnect.c
@@ -104,7 +104,7 @@ MODULE_DEVICE_TABLE(of, tegra_aconnect_of_match);
 
 static struct platform_driver tegra_aconnect_driver = {
 	.probe = tegra_aconnect_probe,
-	.remove_new = tegra_aconnect_remove,
+	.remove = tegra_aconnect_remove,
 	.driver = {
 		.name = "tegra-aconnect",
 		.of_match_table = tegra_aconnect_of_match,
diff --git a/drivers/bus/tegra-gmi.c b/drivers/bus/tegra-gmi.c
index f5d6414df9f2..9c09141961d8 100644
--- a/drivers/bus/tegra-gmi.c
+++ b/drivers/bus/tegra-gmi.c
@@ -303,7 +303,7 @@ MODULE_DEVICE_TABLE(of, tegra_gmi_id_table);
 
 static struct platform_driver tegra_gmi_driver = {
 	.probe = tegra_gmi_probe,
-	.remove_new = tegra_gmi_remove,
+	.remove = tegra_gmi_remove,
 	.driver = {
 		.name		= "tegra-gmi",
 		.of_match_table	= tegra_gmi_id_table,
diff --git a/drivers/bus/ti-pwmss.c b/drivers/bus/ti-pwmss.c
index 4969c556e752..1f2cab91e438 100644
--- a/drivers/bus/ti-pwmss.c
+++ b/drivers/bus/ti-pwmss.c
@@ -44,7 +44,7 @@ static struct platform_driver pwmss_driver = {
 		.of_match_table	= pwmss_of_match,
 	},
 	.probe	= pwmss_probe,
-	.remove_new = pwmss_remove,
+	.remove	= pwmss_remove,
 };
 
 module_platform_driver(pwmss_driver);
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 270a94a06e05..f67b927ae4ca 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -3345,7 +3345,7 @@ MODULE_DEVICE_TABLE(of, sysc_match);
 
 static struct platform_driver sysc_driver = {
 	.probe		= sysc_probe,
-	.remove_new	= sysc_remove,
+	.remove		= sysc_remove,
 	.driver         = {
 		.name   = "ti-sysc",
 		.of_match_table	= sysc_match,
diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index b8af44c5cdbd..2328c48b9b12 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -336,7 +336,7 @@ MODULE_DEVICE_TABLE(of, ts_nbus_of_match);
 
 static struct platform_driver ts_nbus_driver = {
 	.probe		= ts_nbus_probe,
-	.remove_new	= ts_nbus_remove,
+	.remove		= ts_nbus_remove,
 	.driver		= {
 		.name	= "ts_nbus",
 		.of_match_table = ts_nbus_of_match,

base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
-- 
2.45.2


