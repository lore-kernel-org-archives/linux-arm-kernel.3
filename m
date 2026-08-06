Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8C2C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 23:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bByA5tzpJTMFYPvaOtMt5JHJJTkEHrdfwgPmDZ1jMOs=; b=JdasO6ReAcYkuTj1yGfimS7QYd
	2rge4+pfcdMWRV1yHFqeJcX8/RLzmXvg4vs7x4oFlwoJOVWKL/AxfbUI73Jx+AmFStuviShOBlpR4
	FGws6vi8WpueRT249qTWyziGekeWQlNSLSIbkBDBd/bWiD4UjjHsLMrXhydZzlVjgCA9qYTSgP0nl
	uHeZK+ORF/Z4wSXTc3V33HNdLlSDXg6R2kbbOSRYFOPW6ADrqynY47QnWZP8ZVYnloYwR4VTnItj0
	2nAJIkxoAq8/UfnAxGGHFdJFZKzgjd30qdSU4hMURvfQAplsShWmWNxUgnIO6XzWxAVd5BIjQMnR+
	oOUERTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws7Zn-00000006rA5-0NDP;
	Thu, 06 Aug 2026 23:32:39 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws7Zl-00000006r9g-0ElO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 23:32:38 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-8efcef23d21so18382646d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 16:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786059155; x=1786663955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bByA5tzpJTMFYPvaOtMt5JHJJTkEHrdfwgPmDZ1jMOs=;
        b=oIT0kkPJ+JtV1/Va57XGtGT3vEySIgyaPO81I+JVvgZu80bHFKeRG5or0cftBgcqgf
         iCoY+nWZ8/csmPdpAGsYMJyZ8t/MBLhaPoYJiH3eFx0r0gNlWdjRWxd6hLrax614cjQb
         YWdkE4las5oIlPC+ZexnAqivgTKmADr6ATtUpWXfGnyf86u3SIEPPSx627dvdFWabJHS
         xwDpjwzFLdPIo6ycrYcndlVYnKkw/oEJrca1stgvX86ISmt1+Vp+5Np6N1Ks6sPikHKk
         oLI+RSDjf4vc+lUxy2/mxdfrmWTx1BDTt43ChlyzLd2k4jalWXHA603w1ufZ+moz7FZX
         NAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059155; x=1786663955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bByA5tzpJTMFYPvaOtMt5JHJJTkEHrdfwgPmDZ1jMOs=;
        b=TTHn+psF2l0oI5bLlb4A3WPO53KwrxIcuprB1UOc69S7bENEw3McOu4/+Ed1vqgFLv
         S1pYkDKeYBga+Dh9cBynlqfVW7soSNywQobT5ChEbcucEgApE8KCCzyFZuL8rnNlOoQB
         KaJ84LbGASRbYEGRfxKwArvQNnbCzSiAgvK9/8FRY+BVzUZzrxtRRAtRbJ5LPUEzNgZ9
         oJjgXHmRZFy2TFO2/ol0qc92w5VU0p8sV+BHC8ug0+KW7X0P8CPL484zy2h/Sg/nkSIW
         s9HYCoulEFQEpEOtnPlShuIJGvgOsIrRCXtHcgl3ASLoe08oe7ZhtWLQJ2C8MDjTnuai
         exTA==
X-Forwarded-Encrypted: i=1; AHgh+RpsPQqu5xy80LaGHbCBkxKlD/KRh+IVMgAZHb+1Bhi5e4pal+yzz2q8GuWKoptutKr5DniuFBI81V1WmrbPzE0o@lists.infradead.org
X-Gm-Message-State: AOJu0YwtvAKFxa/N2dCHM7O68SS2wBhcrCGGl/U1lyVjZga1KShMtzTU
	Wt8Zt5sRa8GgvK/2YHz1AKRsejGYPHMVQBAp4MnkFpljGIV6EDnsR4cZ
X-Gm-Gg: AR+sD11/7B5i8FViqcNMuvnvCstauGQRhq43u/uvRr1bSAh2y8vuVcxtjoUQNM/fpt8
	A28d8fKOvZQGzzkK71zXhp7ytXHCOkzND8uo0WUExa3pDi+AthUdw0y2NUz3ttXccnA9+RYBtmL
	E84MCn4u8oYZUzUwDw18DCZf7XuQRTnlvaGemRo7kU+srrt9UOXLVb/9Udxe3DiHK0wmQ+cowxR
	YF+2znF80jyvp7hNG91wRC3Ib8g4agxrUeJsrsTIVj/TpeO7neixNHGrBiu+EFxnYD0SNrjyM4F
	EKXYNO3CvIGx3EA1s5W8jgmHLBVLPWGwHyaOjiqlW0H2tHFEIO2DcaDBBYmmE79NU6SNGuexniY
	NyrhNITrVAoTnEXgoqFUvOCxdKRVEJA+gn/ZWwK3w/PhIVB7+OPE94DPrmcW6qM0CF3rkGw8dNT
	OEsHRMZtiA9ifSvOPVooa9VmvT/L+1v8HX4XCX5FNtX09WPYOhXZiEPLKoTpoaGxE0OVJ4tMMcC
	G/5pmv65Gv+ZM2PqD4m6ep4ED3jcFhERpIuekgnVv02zKcZKSFim9LaExFGEeYZSqoxT1rEMynd
	qsUADZxOH35piAx4i/nuogKG6itj5FKJAuDmQiu3TPdETzfJ
X-Received: by 2002:a05:620a:628b:b0:92e:f0a5:ac3e with SMTP id af79cd13be357-936490ebca7mr2066666285a.28.1786059155042;
        Thu, 06 Aug 2026 16:32:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e09dc07sm24753185a.15.2026.08.06.16.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 16:32:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: xilinx: formatter_pcm: pass aud_drv_data to irq handlers
Date: Thu,  6 Aug 2026 16:32:31 -0700
Message-ID: <20260806233231.30631-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_163237_105540_A295A02D 
X-CRM114-Status: GOOD (  16.48  )
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

The irq handlers take a struct device pointer and call
dev_get_drvdata() to obtain the driver data.  However, the driver
data is only set at the end of probe, after devm_request_irq(),
so an interrupt taken in between causes the handlers to pass a
NULL pointer to readl() and crash.

Pass the private data directly as the devm_request_irq() argument
instead of the device pointer, matching what the handlers expect.

Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 7eba3a0205f1..b50306b0fc06 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -280,8 +280,7 @@ static irqreturn_t xlnx_mm2s_irq_handler(int irq, void *arg)
 {
 	u32 val;
 	void __iomem *reg;
-	struct device *dev = arg;
-	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(dev);
+	struct xlnx_pcm_drv_data *adata = arg;
 
 	reg = adata->mmio + XLNX_MM2S_OFFSET + XLNX_AUD_STS;
 	val = readl(reg);
@@ -299,8 +298,7 @@ static irqreturn_t xlnx_s2mm_irq_handler(int irq, void *arg)
 {
 	u32 val;
 	void __iomem *reg;
-	struct device *dev = arg;
-	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(dev);
+	struct xlnx_pcm_drv_data *adata = arg;
 
 	reg = adata->mmio + XLNX_S2MM_OFFSET + XLNX_AUD_STS;
 	val = readl(reg);
@@ -636,7 +634,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 		}
 		ret = devm_request_irq(dev, aud_drv_data->mm2s_irq,
 				       xlnx_mm2s_irq_handler, 0,
-				       "xlnx_formatter_pcm_mm2s_irq", dev);
+				       "xlnx_formatter_pcm_mm2s_irq", aud_drv_data);
 		if (ret) {
 			dev_err(dev, "xlnx audio mm2s irq request failed\n");
 			goto clk_err;
@@ -663,7 +661,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 		ret = devm_request_irq(dev, aud_drv_data->s2mm_irq,
 				       xlnx_s2mm_irq_handler, 0,
 				       "xlnx_formatter_pcm_s2mm_irq",
-				       dev);
+				       aud_drv_data);
 		if (ret) {
 			dev_err(dev, "xlnx audio s2mm irq request failed\n");
 			goto clk_err;
-- 
2.55.0


