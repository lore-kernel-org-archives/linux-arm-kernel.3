Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91AAFC0348
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JCThqhLH7NqPNtx6lIFMXhC0R0ZENSripHC9ZQYy5U=; b=Z0j7DjQCq6k7r30Gfn8A6ZhRaV
	/uDdvtHlW1C0UeF/JMCucQnc2h5IoEuz4QCaXyZJMs6hpOxP6LXRrni49QQa1T9w6gmIe6c/3+OLt
	0zJS3DrF9ltgBD7FNTY9iIsZ1+eNX65eIYWhoRXgkH8zFHvyFJcTnNoTn7tH7aeCTNVfiaBfEwyTS
	I7AVHIA+nzORjS1ZTQZ27KIDpBd7w7rbvK3VFtv6It+fMuYzM1zlAByjcFGdbL8G+/26Ps9UkJ5cS
	QEQgmizyJShusC1byW9/uhKVkghb00BXYqIJexIm0NclZqcU6p/8XL+KywuTnANr31RvcBkgTJY4j
	mkiF27PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvtT-0000000BsYC-2qe0;
	Thu, 23 Apr 2026 15:23:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvtO-0000000BsU4-3P05
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 15:23:04 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48374014a77so88947385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 08:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957781; x=1777562581; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5JCThqhLH7NqPNtx6lIFMXhC0R0ZENSripHC9ZQYy5U=;
        b=EUDZZHvy5FW9aXvuA5q4a7dWFqNQ4DMVUJRtnmmBGJppXszcFA+QPg9Wo/E0NWKj20
         W4+nBgXFnIHveuamYp0KO7HAn2uivxhAreGRAPIiYTeQeCmZWk2fXRTGfubP35kpNsox
         Fw29j7E19qgpy2xRQdUJUSn4aJwzcNbnbTr9mVTquDKCygGjXtpPuTFHgvf6e4ozzN2+
         rn8bumWw/bDlKhFQQ0B5iafNikZqhaMmihfodNOP6xBDbxb54bgfJp5D3ss3/qSoz/XE
         k3lmxStW0Foa46cAFEDkAAlHuu7aoRax0VJVEgKSKSTufZJYj1Xg/mDFXo86yWWvcekW
         GUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957781; x=1777562581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5JCThqhLH7NqPNtx6lIFMXhC0R0ZENSripHC9ZQYy5U=;
        b=jPcnJD56HKkCFK4LUqPk524klUWA9gjDZiM1NX4VY4BgsJ9Ckpi5+M0Bp0P9bQVrDW
         ld6yfd52gNi47H1Pl24CP7FxWxQ0Rwsd1pDrkDXi7RKKbWzDkSK7L9dYREcwj5MUpgNe
         gKrchRIeL8JHvS1FY96UXfOqzmSwBLUMQdGn/YObcbsumhB+QDBiyf0YWgqA3wgS49qi
         kstj7PY2L55UijOkRwd1AwUIWp3WGgkYAVbCiJ6L2MF7DNU5h7zxpt98WrPuNH/xB7Sm
         D9t0uKsR/SztqotvB/6ieJksMQlYCjg/BYDgcFFUumN0J8dEAjL1Y/PIb2TaR2o+axgz
         tI7Q==
X-Forwarded-Encrypted: i=1; AFNElJ80O1vwOQwm03flIx9Q03+fPAZfoIL+auZq45kdhsXA0+Gcwnc4p5ZjThf3NREvh3zF/SGRxqtlQZvvv36yHGcr@lists.infradead.org
X-Gm-Message-State: AOJu0YxkLEH5YyKWJ5UQbVPXR8h6wffDG6oOVCOnISroOx2MLzl8C1wi
	ppHyJhfbwhXg1SxKS5l9DZv4CyorVi10hY5kcINevO+CnHavem2zjjbHOck1YHDIyKo=
X-Gm-Gg: AeBDiet41NsNDWR6V1iMgd2MAAT724HnUmZAbUrUdHe815aXX6aEL7n6sfuhzu9GIVN
	Kx9ynEVyIfJX96F+iacwj1KeLgPr8ydkhY4XQhVN3k1DsU+VimmMgqMIKygBrnyRdMyzuy+au14
	dUKaIfFx7HJpPpj2kNNFBHcZ9p2UGeAnAnjiedFoEEkmqOSC93DBW2mxPMxRHKI4+XVWmnQa52h
	qYxfrlUC98AjkLNNDS/i3MirRBHscoBrgdumc/dTaSHA6PqsWOfr/zXr+7gbkUxXasdmy5/vBUx
	fzFiRcJqz91qYwTdEzgvhkbXPnk6iPdJz8rbDSj7LyB4ffey0Jjz6MzWzb/KUrm3fvSIAA3BWQu
	yfcs68l1FSxtaIwkywA49WNUWSVv476XKLYXRTCyrWBi3JDSXcCnawWpxRAmNP7F/SK2lxiqiW8
	BkqY2gKVUgcOqXarJAM6ybDjcpYCAn7T3e0+SmveMJTY8rIX6de0Xw5qKaCmUodkW8mFpy718MK
	4RoxdbhROCzw65nJQ==
X-Received: by 2002:a05:600c:8717:b0:48a:568f:ae6d with SMTP id 5b1f17b1804b1-48a568faffemr168084565e9.8.1776957780945;
        Thu, 23 Apr 2026 08:23:00 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:00 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:51 +0000
Subject: [PATCH v4 03/11] firmware: samsung: acpm: Annotate rx_data->cmd
 with __counted_by_ptr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-3-8b59f8548634@linaro.org>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=2360;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=gury5o9fYQVnz5W9CUhyVTJ47BHUwb3hn+iE10aL2Hg=;
 b=rnq8EwtbRM8Uo4+EdwheI9WJInqZ2Ii7f76t+qs1T0eX1VEh7VaHRXuo3uQIS5mJhWB2Hl3W3
 K9JwcPUFqrTCwdeRp4V5y5l9W2cA/B6S/kY9D29yeAnF06612VjIT9V
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_082302_890261_AB4DAB95 
X-CRM114-Status: GOOD (  16.34  )
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

Rename the `n_cmd` member of `struct acpm_rx_data` to `cmdcnt` to
maintain consistent nomenclature across the driver (aligning with
`txcnt`, `rxcnt`, and transfer helpers).

With the member renamed, annotate the dynamically allocated `cmd`
pointer with the `__counted_by_ptr(cmdcnt)` macro to improve runtime
bounds checking.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index c4aca61a63e4..e5c85d769d0a 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -103,12 +103,12 @@ struct acpm_queue {
  * struct acpm_rx_data - RX queue data.
  *
  * @cmd:	pointer to where the data shall be saved.
- * @n_cmd:	number of 32-bit commands.
+ * @cmdcnt:	allocated capacity of the @cmd buffer in 32-bit words.
  * @rxcnt:	expected length of the response in 32-bit words.
  */
 struct acpm_rx_data {
-	u32 *cmd;
-	size_t n_cmd;
+	u32 *cmd __counted_by_ptr(cmdcnt);
+	size_t cmdcnt;
 	size_t rxcnt;
 };
 
@@ -384,7 +384,7 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
 
 	/* Clear data for upcoming responses */
 	rx_data = &achan->rx_data[achan->seqnum - 1];
-	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
+	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->cmdcnt);
 	/* zero means no response expected */
 	rx_data->rxcnt = xfer->rxcnt;
 
@@ -537,19 +537,19 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
 {
 	struct device *dev = achan->acpm->dev;
 	struct acpm_rx_data *rx_data;
-	size_t cmd_size, n_cmd;
+	size_t cmd_size, cmdcnt;
 	int i;
 
 	if (achan->mlen == 0)
 		return 0;
 
 	cmd_size = sizeof(*(achan->rx_data[0].cmd));
-	n_cmd = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
+	cmdcnt = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
 
 	for (i = 0; i < ACPM_SEQNUM_MAX; i++) {
 		rx_data = &achan->rx_data[i];
-		rx_data->n_cmd = n_cmd;
-		rx_data->cmd = devm_kcalloc(dev, n_cmd, cmd_size, GFP_KERNEL);
+		rx_data->cmdcnt = cmdcnt;
+		rx_data->cmd = devm_kcalloc(dev, cmdcnt, cmd_size, GFP_KERNEL);
 		if (!rx_data->cmd)
 			return -ENOMEM;
 	}

-- 
2.54.0.545.g6539524ca2-goog


