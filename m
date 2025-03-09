Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80324C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tjb3sdTt+sV+fmJ3kLauDsvPMMI/JK6LCRHEJH7ZeKQ=; b=RFAVnX40dhq/3UxaQLuXsPlQAZ
	sSivTVhHFhmywVNcNmqVUb7ImX05p1eGZtc8IeO1pdf16XvFwcEyYhAToItGf4NEpnSEW/V8J5E5m
	H+H+beYnFjoEF65DlWjFj5Ivklj+qcSGwVRURSLPp60h26UA60ln3iqe7TFDIUV89CLq6dYQaE+Ns
	fObjjc92vpJldBmI9syemnltUBWIM1h9MBSXpiTXUHluWg/24LLzF532hg+YQa1/OakYq/7BvX5Nl
	4lBX9JOFZPCEyFyolcrWcHMiJ9OYfe37nC+2IVX/xWL4zY4uiHjqy9ng3+eFA4Wercuwt2bieHa1L
	9TbM5QLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trL71-00000000wEf-208o;
	Sun, 09 Mar 2025 18:10:55 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKuw-00000000uDG-3xVk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 17:58:29 +0000
Received: from fedora.intra.ispras.ru (unknown [10.10.165.2])
	by mail.ispras.ru (Postfix) with ESMTPSA id 83D3140CE1B9;
	Sun,  9 Mar 2025 17:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 83D3140CE1B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1741543101;
	bh=Tjb3sdTt+sV+fmJ3kLauDsvPMMI/JK6LCRHEJH7ZeKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y7rEUn8ua3iAhXsU2TcVOuAZo0VdZ6PwteD4r69ZofP1rIcnfjN0wtvBoVuAyOFDu
	 bRH9Hr9CQwRDe+HcFKSSVmXIHwGf+S7Z6MSIhu2rfrqVLiMvwQ9eVeuLOmTDRBl++x
	 h1F5f7KRg6MUexg6ehWIYe5J2nquIJNo4SjLJbQU=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Peter Chen <peter.chen@kernel.org>
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
Subject: [PATCH 2/3] usb: chipidea: ci_hdrc_imx: disable regulator on error path in probe
Date: Sun,  9 Mar 2025 20:57:58 +0300
Message-ID: <20250309175805.661684-3-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309175805.661684-1-pchelkin@ispras.ru>
References: <20250309175805.661684-1-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_105827_563751_1C0A6F7D 
X-CRM114-Status: GOOD (  12.94  )
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

After the above-stated changes it is possible to jump onto
"disable_hsic_regulator" label without having added the CPU latency QoS
request previously. This would result in cpu_latency_qos_remove_request()
yielding a WARNING.

So rearrange the error handling path to follow the reverse order of
different probing phases.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 4d6141288c33 ("usb: chipidea: imx: pinctrl for HSIC is optional")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 619779eef333..3f11ae071c7f 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -407,13 +407,13 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 				"pinctrl_hsic_idle lookup failed, err=%ld\n",
 					PTR_ERR(pinctrl_hsic_idle));
 			ret = PTR_ERR(pinctrl_hsic_idle);
-			goto err_put;
+			goto disable_hsic_regulator;
 		}
 
 		ret = pinctrl_select_state(data->pinctrl, pinctrl_hsic_idle);
 		if (ret) {
 			dev_err(dev, "hsic_idle select failed, err=%d\n", ret);
-			goto err_put;
+			goto disable_hsic_regulator;
 		}
 
 		data->pinctrl_hsic_active = pinctrl_lookup_state(data->pinctrl,
@@ -423,7 +423,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 				"pinctrl_hsic_active lookup failed, err=%ld\n",
 					PTR_ERR(data->pinctrl_hsic_active));
 			ret = PTR_ERR(data->pinctrl_hsic_active);
-			goto err_put;
+			goto disable_hsic_regulator;
 		}
 	}
 
@@ -432,11 +432,11 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 
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
@@ -526,12 +526,13 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	clk_disable_unprepare(data->clk_wakeup);
 err_wakeup_clk:
 	imx_disable_unprepare_clks(dev);
+qos_remove_request:
+	if (pdata.flags & CI_HDRC_PMQOS)
+		cpu_latency_qos_remove_request(&data->pm_qos_req);
 disable_hsic_regulator:
 	if (data->hsic_pad_regulator)
 		/* don't overwrite original ret (cf. EPROBE_DEFER) */
 		regulator_disable(data->hsic_pad_regulator);
-	if (pdata.flags & CI_HDRC_PMQOS)
-		cpu_latency_qos_remove_request(&data->pm_qos_req);
 	data->ci_pdev = NULL;
 err_put:
 	if (data->usbmisc_data)
-- 
2.48.1


