Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35DCE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 18:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3Km+T89oY9vmo43Z5zKrwDWzM7jbfOIjaTIrh6UkOs=; b=dpyuKywry0diqNhqW5pHqImSX1
	mmfx7wE9iCMJYpCxmpimlw7t28iQDWsfa8kwOn9e5p98vZGjPUnc7zNjV3py7KDDwqBFtkF1A/Uow
	9AtLzdFOz2EqlrscMmfs2ZqiTR5uTxy0NKJ70pb/OvjlMX8FhAJmKJZK1YsrGjzAv9R9ToQ7jKWYH
	Zjz449YZjEW6Rq8EAaBmBdKkxtllap+X+2BOPMUAEkgZmxdX/JJe6hWPeB1MYPKElMRsZDTLi3x2H
	u2WXOcfrBmQxwGQl6+OnS5WutyM6ayYtfDfQBAMcSa32kFZFadqX0dIinUMDDhppmx/o9hJ/jdVXo
	zQO8CPeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgWo-00000001GeT-2iWF;
	Sat, 11 Jan 2025 18:48:10 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgS2-00000001Fcs-1Z7s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 18:43:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-385e0d47720so236740f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jan 2025 10:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736620993; x=1737225793; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3Km+T89oY9vmo43Z5zKrwDWzM7jbfOIjaTIrh6UkOs=;
        b=O596ah4KdnP3KzVPai7ven1Hcnaa4FdL/hZABm5lP+emMVkTFddfpsuDHecBiQBajT
         epTjUsp/5e4UJ2UV48Ap7IPuueK0ZS/CsBHrXwZhdcMruoyHZzGAtrg6Sa8EbuqxOZ9W
         NymOzxZkcJgZYkFcvMLwT5OHweXUFgR1yh7SerckSvQ8g6XDIaKT4bzibArdUoFF41iE
         qz4OWp98lSXSFwwjDyBrCDh6hPKLkZTRfTqH8reNG8qR8b9yzVJ0S4oGfJZT3WU9TqKE
         U/ZUCgMAoIkp4VQDWjmS1D4tepOraZAhWAgcrwNhVdDHZrlBozmP3uyEAr6jvyz/AGCL
         GMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736620993; x=1737225793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3Km+T89oY9vmo43Z5zKrwDWzM7jbfOIjaTIrh6UkOs=;
        b=I6LDdYIy/FvB19TrMjHoALD/hdyMekXOawB/QjFD/6tLoNT1C5PCKelz7i7ci/+Emo
         iLtQyzybadqq22Cfew1kBNCQll2oYybiStdSzyV8NGT8jfU73G6CAGcI+VGwYU2JnsQC
         m2LoVurJmtrDLvVMTC2Mard6YUOqGLvvf2fnsye36RWBqQdA9MRMtNtESX3jFflnQ0On
         Rbod9QlybsfrS2FSSdEcOPi2izVZbx6ENxKQHn++Ve9ye5JjkevF1ZcUKwWaURBRT6zg
         jJTfvlAManOjz40KacjRoc92hqIS64rg7413mS8X7E0VA67OixcmJ0V3FjFN9bbc7OB0
         g13g==
X-Forwarded-Encrypted: i=1; AJvYcCXolDYK79q0JJVWr+1SvmOWH1X1wCPC9iKqnqwnhF3h+Ugq7SVNM+MaJp9SWgob11qU2Mx5PC6muHKQZ+itYsRt@lists.infradead.org
X-Gm-Message-State: AOJu0YzoszMVLJCcjtYrkc/rTi53QJ6N2Jbj1GDfr5CSXJcHfwCWAx7A
	SjMBqiSQF1ohlVRLVNEDil4FO1yPDWPu5QJDg7qnF8eqp+J+71AxI53ySuGsrr4=
X-Gm-Gg: ASbGncv0F5bPgjC78xLwO/CjRoieGup2h8E9lkORgBrFF3RHx+7DmSV/d1QabfdopKK
	WqO7U9vwNl7xFvZ6zfMLv23WggI3+utUdaoVE5rRAouzabjFLPvETj6jOJhfEIXkkiqQT/ryUrM
	hwnCd3ON42KZ4fX95ZyaU4NotwQsxSs75g0GL430CF8/3CZIcnPzNGbDy63dFQwsF6T5kFUxnck
	PoviBBHAwPPB2ge+0cE7choMhFUZlopxKtPJebglJ30qOVIFvq6tZJ7ny5naiIERTqjontE
X-Google-Smtp-Source: AGHT+IFOZCMJmwI0mKSBTGO+GGfe7sUCWdu9ZR22iWmk7CbqEsFGVHW41bP+rkVwowcZhYbO3Uyrfw==
X-Received: by 2002:a05:600c:3c97:b0:42c:b55f:f4f with SMTP id 5b1f17b1804b1-436e2713e51mr60257065e9.6.1736620992728;
        Sat, 11 Jan 2025 10:43:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm205885e9.22.2025.01.11.10.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:43:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 11 Jan 2025 19:42:51 +0100
Subject: [PATCH 3/5] remoteproc: st: Simplify with dev_err_probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-b4-syscon-phandle-args-remoteproc-v1-3-73ed6fafa1e3@linaro.org>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3905;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5hQwmG91Ny83OGrGpyg9rnn+O+Mb6UT4EEhVO4UsBiQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBngruzVyM+eBg/b9r6/4HF8jM/uBdD/yIqy3mh8
 ZBsd9VqFNWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4K7swAKCRDBN2bmhouD
 16VmD/9hiE1rSyjUYGDc/ePnUA6hW+ruXaGZLpyxcxO2CKr7SF8SIGsQ1RKzG08lItOtHksuV0m
 A45F8P7kF3WW1qUZaiciVfJjcL2UVXkbTg6HfQprvZyyxghUeEu6PMM78tkvgBv7m/R2nPEcJld
 SRIF37gBt0GhuzDnV08MavNlkikaXY12VMEONl7HBAFVtfwcMKGOMs4wm2XL/bo3/SYRECKdpm/
 ef09tBL/Nv6L2bP0BptVKYgy2owH4DcdzbL/3w30bku866XdxQF/1k4Rg7j9qkweY9IMFowGmV8
 uvVw7tuvSt+vd7Zi5FlmoK4NxYwzLDjkvKLBjW8Z9PdnLnhTSzRwiomr/tOHTf1VxjRbyQvNTkc
 LYhWVaV1YpCBoGsEsmxO5W7WWyTy86lR/mC976UM7di0tkRFkeZjp2azcC1ulaLoDEDoqpOqIem
 8ubMRIg3s+fdQks0IGvIH2Mad/VxiMRp1I0mDuR3YYfeQXQokC5zmWDFUTuUyzCEtiksczSFmLw
 fBfuxd0eeWjBto8u+J7pBdOafbqbQb5yVB49FHc6WP1/LLoqwK8ClrmsBHnXveTAzxgLoMV8cAq
 VylA4W5iouI6+VEIQVhggp9q2HHdTpdaHL5FGkdrW9nhWpot9Ln2HgvqlU+P1ZFp27pcAZUvrFZ
 HimcEVkeFyrM1LQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_104314_416188_DE016680 
X-CRM114-Status: GOOD (  11.71  )
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

Use dev_err_probe() to make error code handling simpler and handle
deferred probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/st_remoteproc.c | 44 +++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index 5df99bae7131a832c0c03c9bf8619812d9eb570d..d1f35e8a83ba525613ed4e54d2269b7e9f427e46 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -290,26 +290,23 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
 	if (ddata->config->sw_reset) {
 		ddata->sw_reset = devm_reset_control_get_exclusive(dev,
 								   "sw_reset");
-		if (IS_ERR(ddata->sw_reset)) {
-			dev_err(dev, "Failed to get S/W Reset\n");
-			return PTR_ERR(ddata->sw_reset);
-		}
+		if (IS_ERR(ddata->sw_reset))
+			return dev_err_probe(dev, PTR_ERR(ddata->sw_reset),
+					     "Failed to get S/W Reset\n");
 	}
 
 	if (ddata->config->pwr_reset) {
 		ddata->pwr_reset = devm_reset_control_get_exclusive(dev,
 								    "pwr_reset");
-		if (IS_ERR(ddata->pwr_reset)) {
-			dev_err(dev, "Failed to get Power Reset\n");
-			return PTR_ERR(ddata->pwr_reset);
-		}
+		if (IS_ERR(ddata->pwr_reset))
+			return dev_err_probe(dev, PTR_ERR(ddata->pwr_reset),
+					     "Failed to get Power Reset\n");
 	}
 
 	ddata->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(ddata->clk)) {
-		dev_err(dev, "Failed to get clock\n");
-		return PTR_ERR(ddata->clk);
-	}
+	if (IS_ERR(ddata->clk))
+		return dev_err_probe(dev, PTR_ERR(ddata->clk),
+				     "Failed to get clock\n");
 
 	err = of_property_read_u32(np, "clock-frequency", &ddata->clk_rate);
 	if (err) {
@@ -318,10 +315,9 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
 	}
 
 	ddata->boot_base = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
-	if (IS_ERR(ddata->boot_base)) {
-		dev_err(dev, "Boot base not found\n");
-		return PTR_ERR(ddata->boot_base);
-	}
+	if (IS_ERR(ddata->boot_base))
+		return dev_err_probe(dev, PTR_ERR(ddata->boot_base),
+				     "Boot base not found\n");
 
 	err = of_property_read_u32_index(np, "st,syscfg", 1,
 					 &ddata->boot_offset);
@@ -395,32 +391,32 @@ static int st_rproc_probe(struct platform_device *pdev)
 		 */
 		chan = mbox_request_channel_byname(&ddata->mbox_client_vq0, "vq0_rx");
 		if (IS_ERR(chan)) {
-			dev_err(&rproc->dev, "failed to request mbox chan 0\n");
-			ret = PTR_ERR(chan);
+			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
+					    "failed to request mbox chan 0\n");
 			goto free_clk;
 		}
 		ddata->mbox_chan[ST_RPROC_VQ0 * MBOX_MAX + MBOX_RX] = chan;
 
 		chan = mbox_request_channel_byname(&ddata->mbox_client_vq0, "vq0_tx");
 		if (IS_ERR(chan)) {
-			dev_err(&rproc->dev, "failed to request mbox chan 0\n");
-			ret = PTR_ERR(chan);
+			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
+					    "failed to request mbox chan 0\n");
 			goto free_mbox;
 		}
 		ddata->mbox_chan[ST_RPROC_VQ0 * MBOX_MAX + MBOX_TX] = chan;
 
 		chan = mbox_request_channel_byname(&ddata->mbox_client_vq1, "vq1_rx");
 		if (IS_ERR(chan)) {
-			dev_err(&rproc->dev, "failed to request mbox chan 1\n");
-			ret = PTR_ERR(chan);
+			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
+					    "failed to request mbox chan 1\n");
 			goto free_mbox;
 		}
 		ddata->mbox_chan[ST_RPROC_VQ1 * MBOX_MAX + MBOX_RX] = chan;
 
 		chan = mbox_request_channel_byname(&ddata->mbox_client_vq1, "vq1_tx");
 		if (IS_ERR(chan)) {
-			dev_err(&rproc->dev, "failed to request mbox chan 1\n");
-			ret = PTR_ERR(chan);
+			ret = dev_err_probe(&rproc->dev, PTR_ERR(chan),
+					    "failed to request mbox chan 1\n");
 			goto free_mbox;
 		}
 		ddata->mbox_chan[ST_RPROC_VQ1 * MBOX_MAX + MBOX_TX] = chan;

-- 
2.43.0


