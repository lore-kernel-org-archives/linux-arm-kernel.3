Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76B9FC0340
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 15:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpUZgWWTaSsaq1LDjiiiQmFNF42FiKaOIWpuF73h/84=; b=ttOSiGwvjephbkS1poYsJeS+f/
	WgGnzn/TzK1cPCNpmfmhQZ2XJvnU6CFplB8DGuWonoyVMqvh42N/veYih4hCIU9+f1BRLgrISmaxI
	fq/bmGLBldl7t3fX2Epz9XXexw/o99ijzyN+aJT02HcQ5xCOZ8/Aiah0grBfYr+iSpA4KjWBO5y6+
	zsXZ2AvN6groeMhnO9VvDbmLERGcj3WHnv1OZpQSEZahE+kBoY4M/rAc/Z1ACHtd2sxm21QQU4s8a
	YwzoMyfEH0lVrxcfJNc42mMNlZzwcVCKK/0pNEiOxOcW6UfTvzy2nBuLS8By3XSGAz345tU2P7af9
	V15wHsEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvtT-0000000BsXD-05MH;
	Thu, 23 Apr 2026 15:23:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvtO-0000000BsTq-02J7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 15:23:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so31783075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957780; x=1777562580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpUZgWWTaSsaq1LDjiiiQmFNF42FiKaOIWpuF73h/84=;
        b=P4Jslpt9W4nP1uq8ffySRCIGfywtcfOAtYmGFo27Ptr35lTTSwCmU+kLs3WiYkKVXq
         0tKCHeGhOpsLnde2gvvo95gJlWC1wskFQY2023xix0Gb7fj0zYagj3mJ3v6pv4W+A4Ec
         SXv370F28scoA2kyCDmWeDhjYk/9MCPipsqjK5JuNg9Qe/OKwDDaaF6RPoKSX5R8lvn8
         dyp0hs8m9zo6Kg1NQE+yYj5heQMw2TerCn56YZw9BwrEk+tq/dkB8yUqjljHvqgYFUU2
         HihxgoeD2blUEMCOnA+BDEBxdESvQ+BP5Qqy4MaZcutYvRNAaroiMnZBb5l1VM6JbdnR
         kd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957780; x=1777562580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QpUZgWWTaSsaq1LDjiiiQmFNF42FiKaOIWpuF73h/84=;
        b=bqVjO7h7zdBJEwf0Vj1uhgfDEaS2HB2q3s/+NEaTeO8BjID2wMpASmgEsd43crskuS
         eokKcp58AwBF22OMEn3v9ib+TckhWOs1+w+HCEFNGqhn9w5/A2v9lUZu6+fyivlwlzYG
         YR7hyBjIKcHwILRD1L33jrRKJs8mrDNuJ6+eQRvYqJjeN115oo6Kj1C7U3bhW+xJqAgB
         KdgzK/zeBtUxEB9aEh5cnY27R/MQ5f0VT5ykc/CXFZ8cvRdi6pXhy/iox9qpmMRIrw/w
         qX5h/hioM0/ukTqXxtpJsE1NJAxR6X5a/g0hX+XUXLwn9nH5Mi08+Co+xcye8E+G0bpj
         Gt6w==
X-Forwarded-Encrypted: i=1; AFNElJ9f4fC/oWpn6nCGi2YxliYB1zEUKfsQGPEZkj3P3JwXomRYbbrZKu8+86ax4HKG97ZsSgC4MCGuelPz30wCmgr6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5QrEKXXnDx8oMFpWQFf7NOb71WHLmEj2E0IGLh0hLqF5LMVgA
	G1g65rYcEJ4ZyihHtQtw1RL1GmCXkpaknzbc9NFdAWuEgbgA7HbpltH9ZVfltLEC8yY=
X-Gm-Gg: AeBDies0nKikmoiH53qpsSsezeFwP/SuX19wjIE8D7W6ZyutgjItU14TmQIN8XbPWmo
	vkRtW45N4raii5uZLVfbPaAEVWaHowk5so64TVYdIyOl5notHcr2L4m/EZl7pI6w3b7SME2sIh4
	IV7kCfXEpM88NV5q7K/++ai1bvc1GxEe6yw7OHbmHDbJt3sS/69h+dhhxy9qs62uRIhrSa3R57y
	KV2ZWrPm3WXFMdm9t3qg5kh0irNkVnECJiMY+u5DKAio2MKMhwEk89BtmqPefhaNqn7xfVz/U2f
	I9QPrqaRPcV34jj9Pnzb9UVqSvVJOgwmxSnNaHbXH1H4+hb5+sGiKpj+o8I3j6+ytCI8nDt8HOl
	9L/iBDD4sOUbp8vBcadSSYrOcCWCCXOOVE7kdU8FmDwOIsTsbd6J2PgydWMLca5CgWEURMWqHEz
	/2J3SurPuToE4DgXzWA3F9d8eUhYJbXgxbVDPByfffnZgaVBtLubLM0asPYVDRVPHH+D4Ezt2bk
	aZfQaihCVeEQYPGcA==
X-Received: by 2002:a05:600c:19d3:b0:48a:55ec:c007 with SMTP id 5b1f17b1804b1-48a55ecc113mr154907315e9.15.1776957780309;
        Thu, 23 Apr 2026 08:23:00 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:00 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:50 +0000
Subject: [PATCH v4 02/11] firmware: samsung: acpm: Consolidate transfer
 initialization helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-2-8b59f8548634@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=6750;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=WSYPY9iqE8C0uGE7CEj3pZ+0q6CdfpIesN0FucLaxbs=;
 b=7YhVrYTYppr/evYne8g7qkOgpDwx34xpUSaTTqSDFBzt4lFPktjNyWA2+EUcMTV5g3RxkXQJ4
 nPs/BdLeqbdD1F05RWvKaogUsG4uavx2s/80A9eAke9FL0aQsWP04bx
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_082302_103695_50980BC7 
X-CRM114-Status: GOOD (  17.10  )
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

Both the DVFS and PMIC ACPM sub-drivers implement their own identical
local helper functions (acpm_dvfs_set_xfer and acpm_pmic_set_xfer) to
initialize the acpm_xfer structure before sending an IPC message.

Move this logic into a single centralized helper, acpm_set_xfer(),
in the core ACPM driver to reduce boilerplate and code duplication.
In addition to cleaning up the DVFS and PMIC implementations, this
centralized method will also be utilized by the upcoming Exynos ACPM
Thermal Management Unit (TMU) driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c | 20 ++------------------
 drivers/firmware/samsung/exynos-acpm-pmic.c | 20 +++++---------------
 drivers/firmware/samsung/exynos-acpm.c      | 26 ++++++++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h      |  2 ++
 4 files changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index fdea7aa24ca0..7266312ef5a6 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -21,22 +21,6 @@
 #define ACPM_DVFS_FREQ_REQ		0
 #define ACPM_DVFS_FREQ_GET		1
 
-static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
-			       unsigned int acpm_chan_id, bool response)
-{
-	xfer->acpm_chan_id = acpm_chan_id;
-	xfer->txcnt = cmdlen;
-	xfer->txd = cmd;
-
-	if (response) {
-		xfer->rxcnt = cmdlen;
-		xfer->rxd = cmd;
-	} else {
-		xfer->rxcnt = 0;
-		xfer->rxd = NULL;
-	}
-}
-
 static void acpm_dvfs_init_set_rate_cmd(u32 cmd[4], unsigned int clk_id,
 					unsigned long rate)
 {
@@ -54,7 +38,7 @@ int acpm_dvfs_set_rate(struct acpm_handle *handle,
 	u32 cmd[4];
 
 	acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
-	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
 
 	return acpm_do_xfer(handle, &xfer);
 }
@@ -74,7 +58,7 @@ unsigned long acpm_dvfs_get_rate(struct acpm_handle *handle,
 	int ret;
 
 	acpm_dvfs_init_get_rate_cmd(cmd, clk_id);
-	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 0c50993cc9a8..f032f2c69685 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -58,16 +58,6 @@ static inline u32 acpm_pmic_get_bulk(u32 data, unsigned int i)
 	return (data >> (ACPM_PMIC_BULK_SHIFT * i)) & ACPM_PMIC_BULK_MASK;
 }
 
-static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
-			       unsigned int acpm_chan_id)
-{
-	xfer->txd = cmd;
-	xfer->rxd = cmd;
-	xfer->txcnt = cmdlen;
-	xfer->rxcnt = cmdlen;
-	xfer->acpm_chan_id = acpm_chan_id;
-}
-
 static void acpm_pmic_init_read_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan)
 {
 	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
@@ -86,7 +76,7 @@ int acpm_pmic_read_reg(struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -119,7 +109,7 @@ int acpm_pmic_bulk_read(struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -159,7 +149,7 @@ int acpm_pmic_write_reg(struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -199,7 +189,7 @@ int acpm_pmic_bulk_write(struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -229,7 +219,7 @@ int acpm_pmic_update_reg(struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 896fbdc2700e..c4aca61a63e4 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -470,6 +470,32 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
 	return acpm_wait_for_message_response(achan, xfer);
 }
 
+/**
+ * acpm_set_xfer() - initialize an ACPM IPC transfer structure.
+ * @xfer:	pointer to the ACPM transfer structure that is being initialized.
+ * @cmd:	pointer to the buffer containing the command to be transmitted
+ *              to the ACPM firmware.
+ * @cmdcnt:	length of the command in 32-bit words.
+ * @acpm_chan_id: mailbox channel identifier.
+ * @response:	boolean flag indicating whether the kernel expects the ACPM
+ *              firmware to send a reply to this specific command.
+ */
+static void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
+			  unsigned int acpm_chan_id, bool response)
+{
+	xfer->acpm_chan_id = acpm_chan_id;
+	xfer->txcnt = cmdcnt;
+	xfer->txd = cmd;
+
+	if (response) {
+		xfer->rxcnt = cmdcnt;
+		xfer->rxd = cmd;
+	} else {
+		xfer->rxcnt = 0;
+		xfer->rxd = NULL;
+	}
+}
+
 /**
  * acpm_chan_shmem_get_params() - get channel parameters and addresses of the
  * TX/RX queues.
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
index 5df8354dc96c..708f6b0102ac 100644
--- a/drivers/firmware/samsung/exynos-acpm.h
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -17,6 +17,8 @@ struct acpm_xfer {
 
 struct acpm_handle;
 
+void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
+		   unsigned int acpm_chan_id, bool response);
 int acpm_do_xfer(struct acpm_handle *handle,
 		 const struct acpm_xfer *xfer);
 

-- 
2.54.0.545.g6539524ca2-goog


