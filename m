Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF48C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dgt/50QF/JqAiUR0QT0950rpV9eyWAU1dWz6lsV+G/U=; b=3ofEJwh0Id080H6yoAXMHlioC4
	4Nnc8KRlHP7NZJxyq0g228CMARuZ1cI8pGuQGEAcONonIOsOssr1TfwH34LpYnQ4JsztFA7xrygTA
	smg+gkdllUO+aPXrEKuzLe7ZFdZTYjZi3xjztC33x+oquqhgw/6K+FRn+i3xOwTP+d6BIYvrrXn1u
	T0mnsq3GgHDLxpHVVRHrzJD6821qrJQPt2G8CjKfCMP6dSaxXPTSZxiD1MZ0DTtQhwNuxw1I0Oil9
	NUsXNCLIcMIdgvNUYnjCc3yRp9g91RG+ADpybh23t+zl8sfEXLq5FxDDu78IuvdI+WMauS1jXzj6A
	LbNXbIWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQANX-0000000HVgr-37Tq;
	Fri, 13 Jun 2025 19:47:55 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQAJN-0000000HUAp-4A1j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 19:43:39 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ade750971f2so309972066b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 12:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749843816; x=1750448616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dgt/50QF/JqAiUR0QT0950rpV9eyWAU1dWz6lsV+G/U=;
        b=QOBpVCCShUelawxE3HSWsR4OrNv/Pv9A+6Oo9vzFRCaGAGxhdyBE1xKCLBjTOnGuje
         I5ahBr5ZbHs3+c4735jTbVQ2Thg3ce01QDRvrsyHLSxRY6Av2CC27KyVeWJa3s+puRKI
         Tx/WnzGkKxBLvdWUq4xPKrLKoHb/EnGgEJQFCVPIuZ2ZaDHb6rS7avEtFEUsqssdXS4r
         nMn/eGJXTzQ2uAC978hU/SareBAHk4/BYICV3K/7RbJuJTCJKkPtqgk2FK9kaZiaQBT1
         LSB9OJi13dsjC5ewa85K/ydVhD4U1cCXTjdlqMDzpY+1AHLqSBx5N3MbspV7XXm1WNL6
         W1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843816; x=1750448616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgt/50QF/JqAiUR0QT0950rpV9eyWAU1dWz6lsV+G/U=;
        b=jlyUusumM2QjHJd/PLjKs9gFHGKCwvtjeI8W+QZgZymrCziwo7p/pYpROLvaWtZ/8y
         z0wko0XEmEorLNw43HxZqb1YKFAO+F1ZBqUCXAckthx/evf3c3iZQRkc0J8BYTzeWF6h
         qHrqt8HBlrLbkQQJeEH3TdkkcDfjr0snZry4w7611WLdBc72PTsv4i/+03tacpWftDZs
         SUvT1rbYEaOWDIyFWoU5gjwspmbcZ1SfvuoQLYxY4DSCJybVCbYFVrl4ySHEFNFJFmfm
         D3Qz/3vSKIVC0XjC3QKp78bXT86iOcrO5laRe6BzPS+lISEiqts+gnI5I4/WA+bm/tsY
         n1/g==
X-Forwarded-Encrypted: i=1; AJvYcCVGzTH1wAQZbD3wmYqPokxZsAVMRjbm8W0nZcxk/c76HJi051vhGsSVv/J2sUtdQuEste8jFW+Bww1DdkxomRlG@lists.infradead.org
X-Gm-Message-State: AOJu0YzDNvw4MJ85agTCLI+xZn/L9EgV39faacXCuy895zGCLZGaOuyJ
	ELOihgThAq5EiKEDHII6pdyVFuG6z1bATgtormNMBwxe+WbXh938+yLq
X-Gm-Gg: ASbGncvqPzvDWXFedNyWb1JFLQwZoY8kR4mr8T/tsYIqYN0oQk5gil2631DgBli0pdy
	iBQ28ZCxGwk2jO/u57BybX4vNG6iD9zO7jHJDrEuqxFQkJLWGpZKNHQI6H/9KK/A9Jkx+tkMBy7
	WTAckcXRO24yrri/EZYazoVHgrBAsBJyY/3Mq+s758wJGZihcw3Hsqix7cubxjbLQi44+p0XnnM
	qUwwahs9FMhzkRdL793RZfQ0B4YJnXq3FDMaDconYIydBNbrnNULHsjWtNdKA1dZsuo77gMvKVv
	3aBXlWrNi/VlIPgP5Pg7jXqA4XX4aUcA436fcxez+gSri939WOWvE2LynDmIvTDepSD9lFbxpEX
	33Yt53q3xv8perCZZX++eps0=
X-Google-Smtp-Source: AGHT+IFpVmmbzidAFPH6s1at1uCKqw6CJ9ipqwmnxcHj1rMJRNOo8Y5nrc4qCBez3R9Guw5kAWM57w==
X-Received: by 2002:a17:907:785:b0:ade:7512:d9ba with SMTP id a640c23a62f3a-adfad358c88mr43903366b.26.1749843815851;
        Fri, 13 Jun 2025 12:43:35 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8159e24sm176836466b.34.2025.06.13.12.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 12:43:35 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: imx8: add core shutdown operation for imx8/imx8x
Date: Fri, 13 Jun 2025 15:43:10 -0400
Message-Id: <20250613194310.1128733-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_124338_027191_67818BCD 
X-CRM114-Status: GOOD (  14.87  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Currently, the DSP core from i.MX8QM/i.MX8QXP is able to operate while the
firmware image is being loaded. Because of this, the DSP may change the
content of the firmware data just after it was loaded, thus leading to the
data having unexpected values when the DSP is reset (via run()).

Fix this by implementing the core_shutdown() operation that will put the
DSP in stall during suspend(). The stall will be removed during the run()
opertion, thus guaranteeing that the DSP core will not be able to run
while the firmware image is being loaded.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index a40a8047873e..b73dd91bd529 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -40,6 +40,19 @@ struct imx8m_chip_data {
 	struct reset_control *run_stall;
 };
 
+static int imx8_shutdown(struct snd_sof_dev *sdev)
+{
+	/*
+	 * Force the DSP to stall. After the firmware image is loaded,
+	 * the stall will be removed during run() by a matching
+	 * imx_sc_pm_cpu_start() call.
+	 */
+	imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, false,
+			    RESET_VECTOR_VADDR);
+
+	return 0;
+}
+
 /*
  * DSP control.
  */
@@ -281,11 +294,13 @@ static int imx8_ops_init(struct snd_sof_dev *sdev)
 static const struct imx_chip_ops imx8_chip_ops = {
 	.probe = imx8_probe,
 	.core_kick = imx8_run,
+	.core_shutdown = imx8_shutdown,
 };
 
 static const struct imx_chip_ops imx8x_chip_ops = {
 	.probe = imx8_probe,
 	.core_kick = imx8x_run,
+	.core_shutdown = imx8_shutdown,
 };
 
 static const struct imx_chip_ops imx8m_chip_ops = {
-- 
2.34.1


