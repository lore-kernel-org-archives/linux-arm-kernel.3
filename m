Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5B4C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GbECqTLc9hkL2flK0QE57LZGXpZua63SU3JKDn7QVHs=; b=smdD0pERvdUIRfzNQAcBtHYEkF
	INQJLDOUfwSAxbiOUuuZtdGNLN1Tq9ENtCPOuopn8A9ky55zILlZp4amC/pJoZdGdP+8HxWiD2zQB
	PSp9sBuuHjPsZs5W47dRQsNZZSvs0O91U9UlsCdIoPHSfUkoA/3LpgDab3Xb+oArAq/BJ9+g05ywa
	RjgkqPYlLYgbXnLG5KuMzsknOdnyrb9InAOSMryIEOt9wWznnVi5YEXWoSuOLctqEkmCPe2Pb/2l8
	h93IdptIe5WDwgW9x91rIzAwOHIn8CD5eVGkz6q6SMrmvryF9p+0bzvmlHTDr2VXXV6WzSEjHUapW
	u1qJmV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjnG-0000000BIoA-0Fpx;
	Mon, 05 Jan 2026 12:34:42 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjnD-0000000BInn-1Kcs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:34:40 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b7a6e56193cso2195442666b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 04:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767616477; x=1768221277; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GbECqTLc9hkL2flK0QE57LZGXpZua63SU3JKDn7QVHs=;
        b=u2g6GIhLEpSzyygbhu/8HzOhElaovBRcJF4vweygZeNl1W1hbXLPKOXGAMtu7AHaxF
         RVaQhUKaWtykIgABgTvboKLQA0K4WgrIHsa2Wv4u6aIWAHQeEuYvZKO2BVuLmH1CWIJr
         +RmyqgRvC4XK/uhAI9LGMPAQnV+7UbeujclvcDYm1xjszRO/l+af2rEpjKSb//Ob8fjA
         jF1vndVAg3RUziP2AVrrqIRAMNAXXtB8dpmHMM+vPqQUd3UTPfNLs0SHIJs57qA3w2Eo
         OXjZxXPu983otjEoTqY0aXhpo9eL9I8DGMk+brbKKHFP5/c7fGyN2ff6FW0+WJ1CuIbk
         lAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616477; x=1768221277;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbECqTLc9hkL2flK0QE57LZGXpZua63SU3JKDn7QVHs=;
        b=Vwa77CQOe9Hx13k61Ylf6I1OiwS5Q1QK0uIN8pPDQoxJ4gLzZebADXyg1qiExTln/n
         bn6H/k8PrtuV6l26clWL1DpgM9DzqBnhazdI3r9rFejTBEXg9eCaJCFHLjn6H22ErJE2
         HCANeXATFE+AeNNPan6admvY88Jj4r3Y/p9AUpO02a2EchXBYoZCE9yZqhA2a4NyH1TA
         b1UO9PfqwcSygOPKQMOzyrzsTkp/M6VMwk6yGyikZQvW+9YlT3BlyGPpxbSFcV+chaAm
         KU7c/Kv8e14PrsahTKkP/o+Jg+ev1t2MkotOdovSIY1eqOhT99w8kGYikiqtWVZ7xJ02
         01XA==
X-Forwarded-Encrypted: i=1; AJvYcCUE/13FyICZSM4LX72K2FhmAm3We/EboS3wfWmOpU3DR7vaqrKPgqEr3QP62P8dpSsZxkJ6cXVWNvDBakPdKrMR@lists.infradead.org
X-Gm-Message-State: AOJu0YyvSVByZJpPZzLUoSe2/ALl8Wk+0kWzmfR1bOX7pKm1jigFC/mK
	LhBH0EtMG/rqbPZ8K9s+gT2Nv/bcbXR8kRpl6f9Qi9Uo+G64t/JePSYFG0BpyzK3R14=
X-Gm-Gg: AY/fxX7DJqu9nJPsd4Op3nJ1ZbRyA9t0rpAQTtL82VI0Yn9py1NqnfdiWIXkl5OuZaH
	vO2/f4TR9/4ZtR6llVjxE6R13hPHUFwI4j2RooGINFmBoTlzylSBTlhe9PIC5v/Dm9fPDhi6syH
	yFAeJPkavRkbrJgz8AAvVhvTsTuniUir2Kw0EtaRuBoQkZmZHDflP5YABYlV0WQZsVRhT9XK9ek
	dcgA9NVBMUPCD5EPkFD3NFVNmepif1f2s9QA1G7A74HMCpx0w6W19Bl9pVM4BQDVXpvFs737WzY
	ag4f2rD7tglDXTrxTgHOuFYgipJBeyonGrfvOmUe4NB3kwplokKS4W6UDELUfM36O2Q/dzuHJGi
	Y4tPe3hC1N+6lV0GWy2HcyNXqKVHhyw/WawnzkC3gSqavOXswofyMl347OQpmbOtu525NogS7a5
	2G8c1YTjRKoh5VxkQ2TIRySS+qIi4OuWhyuZrOhtjDq70PwSibuOU8Fqy67EEl3X1m/970j2Hih
	TSA3w==
X-Google-Smtp-Source: AGHT+IE5r/KAj2uaww+sm4UEQ/vQ6irilbY4I/Rj/25jmRhewjMrD+2mfDGapwoYYRdj/y/4boYlFQ==
X-Received: by 2002:a17:907:7fa5:b0:b76:d548:f85b with SMTP id a640c23a62f3a-b8036f2d2demr4611141266b.11.1767616476813;
        Mon, 05 Jan 2026 04:34:36 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b803d3cea32sm5371678066b.34.2026.01.05.04.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:34:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 12:34:35 +0000
Subject: [PATCH] mailbox: exynos: drop unneeded runtime pointer (pclk)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-mailbox-acpm-pclk-ptr-v1-1-8474de8c4584@linaro.org>
X-B4-Tracking: v=1; b=H4sIANqvW2kC/x3MSwqAMAwA0atI1gZqtYJeRVzUGDX4K62IULy7x
 eVbzEQI7IUDtFkEz7cEOY+EIs+AFnvMjDImg1a6VoUyuFvZhvNBS25HR9uK7vJI2lDTjJaGsoL
 UOs+TPP+369/3A4d8qktnAAAA
X-Change-ID: 20260105-mailbox-acpm-pclk-ptr-c25c99dacb34
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_043439_381188_F7055840 
X-CRM114-Status: GOOD (  12.70  )
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

pclk is not needed past probe(), just drop it. This saves a little bit
of runtime memory.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mailbox/exynos-mailbox.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index 2320649bf60c86980c0e8554f2d5fd32af218a6d..5f2d3b81c1dbec8d1a15353769b4b3a1d6ebdf21 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -35,12 +35,10 @@
  * struct exynos_mbox - driver's private data.
  * @regs:	mailbox registers base address.
  * @mbox:	pointer to the mailbox controller.
- * @pclk:	pointer to the mailbox peripheral clock.
  */
 struct exynos_mbox {
 	void __iomem *regs;
 	struct mbox_controller *mbox;
-	struct clk *pclk;
 };
 
 static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -100,6 +98,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	struct exynos_mbox *exynos_mbox;
 	struct mbox_controller *mbox;
 	struct mbox_chan *chans;
+	struct clk *pclk;
 	int i;
 
 	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
@@ -119,9 +118,9 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	if (IS_ERR(exynos_mbox->regs))
 		return PTR_ERR(exynos_mbox->regs);
 
-	exynos_mbox->pclk = devm_clk_get_enabled(dev, "pclk");
-	if (IS_ERR(exynos_mbox->pclk))
-		return dev_err_probe(dev, PTR_ERR(exynos_mbox->pclk),
+	pclk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(pclk))
+		return dev_err_probe(dev, PTR_ERR(pclk),
 				     "Failed to enable clock.\n");
 
 	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;

---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20260105-mailbox-acpm-pclk-ptr-c25c99dacb34

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


