Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E573C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 10:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Chwy6zHqzcjOuh9P0U+j7Wzw4TJ81zsinn+jmnn0fj8=; b=gpaDAZuLx0hKPql8F2Vb5r63Oy
	sL4CLxcdtQ1haM1r8+71/hq5WE7k6+sTyahJjoYc690SCuYmIOEZpUIvHEjtUAH4PHFSI2vZ9ZLU+
	3zgtL1ixHc1KurGnJTgA2UWdekr0kFgHpCJhtN4RWCeUVL8+3IzF8/VPexlnBi5Yt7R/blqGs7JVm
	GvzmO9GLa76cjVWtreZqiGiGJ0k4OEbg9LinNwIR4dHkgVCKPRnbBA19IoVrAE/fBT5mjtu1XUtYB
	G2qddxlz2GdNvvyS4i8lOuz80SZP37y/mi+1TeVPq4kQmzPx1dtpjAP7fGhvSpIZuDFL0ZEam6iRa
	84bzX8uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttlIO-000000003DA-3cp3;
	Sun, 16 Mar 2025 10:32:40 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttlDN-000000002Y3-48Uq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 10:27:33 +0000
Received: from fedora.intra.ispras.ru (unknown [10.10.165.7])
	by mail.ispras.ru (Postfix) with ESMTPSA id 94C7446361D2;
	Sun, 16 Mar 2025 10:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 94C7446361D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1742120845;
	bh=Chwy6zHqzcjOuh9P0U+j7Wzw4TJ81zsinn+jmnn0fj8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UoLzowEBeTotIiaOI+SxYzi30FBh+lVfYeaWZ0KVY2g1IIcxJfcs8tKj+cWseLR3A
	 +5LRV66RYWoHMxWSOO3NsJeyKKmtneInLnY4CQE0/coQGEOjzC7Gbiwt7NR0Imm5uJ
	 26quxrm4x1qf3d+kDnTRG5bdeDRlnwQntEWGhWZg=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Peter Chen <peter.chen@kernel.org>,
	Frank Li <Frank.li@nxp.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Sebastian Reichel <sre@kernel.org>,
	Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/3] usb: chipidea: ci_hdrc_imx: fix call balance of regulator routines
Date: Sun, 16 Mar 2025 13:26:55 +0300
Message-ID: <20250316102658.490340-3-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316102658.490340-1-pchelkin@ispras.ru>
References: <20250316102658.490340-1-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_032730_589143_7F454FCF 
X-CRM114-Status: GOOD (  15.27  )
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

Upon encountering errors during the HSIC pinctrl handling section the
regulator should be disabled.

Use devm_add_action_or_reset() to let the regulator-disabling routine be
handled by device resource management stack.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 4d6141288c33 ("usb: chipidea: imx: pinctrl for HSIC is optional")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
v2: simplify the patch taking advantage of devm-helper (Frank Li)

It looks like devm_regulator_get_enable_optional() exists for this very
use case utilized in the driver but it's not present in old supported
stable kernels and I may say those dependency-patches wouldn't apply there
cleanly. So fix the problem first, further code simplification is a
subject to cleanup patch.

 drivers/usb/chipidea/ci_hdrc_imx.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 619779eef333..d942b3c72640 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -336,6 +336,13 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
 	return ret;
 }
 
+static void ci_hdrc_imx_disable_regulator(void *arg)
+{
+	struct ci_hdrc_imx_data *data = arg;
+
+	regulator_disable(data->hsic_pad_regulator);
+}
+
 static int ci_hdrc_imx_probe(struct platform_device *pdev)
 {
 	struct ci_hdrc_imx_data *data;
@@ -394,6 +401,13 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 					"Failed to enable HSIC pad regulator\n");
 				goto err_put;
 			}
+			ret = devm_add_action_or_reset(dev,
+					ci_hdrc_imx_disable_regulator, data);
+			if (ret) {
+				dev_err(dev,
+					"Failed to add regulator devm action\n");
+				goto err_put;
+			}
 		}
 	}
 
@@ -432,11 +446,11 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 
 	ret = imx_get_clks(dev);
 	if (ret)
-		goto disable_hsic_regulator;
+		goto qos_remove_request;
 
 	ret = imx_prepare_enable_clks(dev);
 	if (ret)
-		goto disable_hsic_regulator;
+		goto qos_remove_request;
 
 	ret = clk_prepare_enable(data->clk_wakeup);
 	if (ret)
@@ -526,10 +540,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	clk_disable_unprepare(data->clk_wakeup);
 err_wakeup_clk:
 	imx_disable_unprepare_clks(dev);
-disable_hsic_regulator:
-	if (data->hsic_pad_regulator)
-		/* don't overwrite original ret (cf. EPROBE_DEFER) */
-		regulator_disable(data->hsic_pad_regulator);
+qos_remove_request:
 	if (pdata.flags & CI_HDRC_PMQOS)
 		cpu_latency_qos_remove_request(&data->pm_qos_req);
 	data->ci_pdev = NULL;
@@ -557,8 +568,6 @@ static void ci_hdrc_imx_remove(struct platform_device *pdev)
 		clk_disable_unprepare(data->clk_wakeup);
 		if (data->plat_data->flags & CI_HDRC_PMQOS)
 			cpu_latency_qos_remove_request(&data->pm_qos_req);
-		if (data->hsic_pad_regulator)
-			regulator_disable(data->hsic_pad_regulator);
 	}
 	if (data->usbmisc_data)
 		put_device(data->usbmisc_data->dev);
-- 
2.48.1


