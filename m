Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA65CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iimSDWzY+fnbg7kLgqgMGtE7NPwiRHmQcfgUGJwUrmQ=; b=NnBeAcYvvQeKi01Qbw2MSZg3zQ
	fVgQecmANkQcDrU2WP3Phq1RVYKaKhD4Ka86Y5qEgVpDGhfKckod31Em4kVWmO7nfyjTNMAAZ4jZS
	ENQ6clUI+Yc4MFJdqqVXjOnZdGaAICuBwZTmzUBwN2ZP2vjPLPz8Qz1+NAUBmCCRlhtamngfZSIf8
	YlTZwD6f6iGxp/LMat7vTzwX8T30d0SLKFwCa6JIG3p+vhNH/e/ferhe6Xa9rD8JnpHaHkAdAbmXU
	bjnUeIZj+0qFdpQHZDXIIcqRDuOWeN/XFydSlYo3iIaOddvVIiqSZpx1kTO5BaAxA5qbfgUVlMT8I
	PrS+eEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNouI-00000007toC-0sL1;
	Fri, 15 May 2026 09:32:34 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNouG-00000007tmQ-1Qla
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:32:33 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-38eab6cf7d8so64553921fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837550; x=1779442350; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iimSDWzY+fnbg7kLgqgMGtE7NPwiRHmQcfgUGJwUrmQ=;
        b=SaJFus7CeRVAYqbYA4GN9pSbJvDhi1gaNeS3nibLX+Obis4jbSAXm4TMN2Aj8w0V41
         OIMGltzmTRdD7TKbm90sunXZjZJZoIgD61ybszrMj11HLCwGA5fg/Z8m/V0zw7Vb0LpT
         9wT6od7nrKvJNg4xO9clIp3YkJyNa8o6iUjBjgBb2KxdNCAqDQbphCnO0BHghizVOiia
         mY6K1T5qeAF2ZuKtPzDHtERX0zl5uzyYtGKwwOigJsPn2zD8k/SG6QIr/unpY0sBd8Mp
         n9g9+OepbShvtEQ8N8Ve7+Yuo1hg4AIL+d24tt9NjdIKNPerWdYvQGhDRWyhoj7F3oaE
         UhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837550; x=1779442350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iimSDWzY+fnbg7kLgqgMGtE7NPwiRHmQcfgUGJwUrmQ=;
        b=T1VlBc/7hWREoDKmLWpADD12uWuKwwG96IzC1sloUnsqfccHLkcjx4WFfNJ5YUDY0w
         zDPWoDqwkRutmMCVQ5RcRZ8W5b+wzGw56e/5/uyC1WWGCLVFpf208lDGAlOqB/A/EsHs
         eR9ANjCcGWgvgr6/v9/CQtE8EZoWwP+n7Y0H7qJ++PRkSCyM32bHzBPidOkz4zJX3SgU
         XmzgkaM00axtSXMW+DEucZOuLJv9cXTxDSGPr21w2ybwINTyEtZlUUcjLQ8s6pJHOLcd
         ErXp+djByQKd0e854pYeXL7djExNUuXBdM3L+qNwO2VOrVC41GRfFNY3FuyRMD/F0B2k
         VnbQ==
X-Forwarded-Encrypted: i=1; AFNElJ94MD+vXC7P533L5lw7+FUTL6EV2L9oHGIE4jGSuEJA7L2pChOmjY1ZOidMD50koZ75en7UOvXhOSo1EGqyDrIQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyQntIb5/CTpiFUH/guzYVhR/gL3weEpoaxhjvnQvOlULA+PSdX
	corpAPgbXnzkbsrKFQa5lILsWOzV2Da7J5/HjMx34I055slilU8kFQq94jz+yZ5k6DdtW+dUHJP
	WvwfHk0M=
X-Gm-Gg: Acq92OHVi4hRcbz+eQtq/DQl8444RutbePepmBr3TOnjSOGUXCALlfMw53ObNUU0xwq
	tEgwcyO6QV7VNw2BuwnIQ0ukF/1L7QuE1pw2tYTNJE8UOom2D9vsrZM98KwBNRNPoNOhNmJpHLA
	oEZCtACep+FpnO+jC3tfHVno/VXF/AfKkXd2wPTa6u2hC3OIByDmhM54jjy7eCIKFG+0xBXt9uH
	/mkkHYwsrHDsXWxwx5MNiK/jeSs/TwACMc6SeA4MLPMpTHApg/0aA1iedLOLiS3R6cvPKmXcbQS
	k4YmOF6VCQDxCsM069hc2CSQSkj6ZBCAgPFPA+Tz4D9jeWSiyYZD346yStPwf5xsczwZnMcyapF
	h+THVUf3TqQHGPAnj1bww8ab0X0kPABSgBr8dnCRgIji9QR7+pJTsMTM2mkfA7AL6mn6i+F+Oda
	iv4yjcwwHdirkc9vbb4l/7YuCK5E5zX0j5Uk6LI81nxOz6MmSgNHMi09yEiEe1NoB/X8m95TXmE
	mnGa+g4
X-Received: by 2002:a05:6512:3095:b0:5a8:d7d4:4948 with SMTP id 2adb3069b0e04-5aa0e7641e9mr929129e87.33.1778837550053;
        Fri, 15 May 2026 02:32:30 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:29 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 09:32:25 +0000
Subject: [PATCH v2 1/6] firmware: samsung: acpm: Consolidate transfer
 initialization helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-acpm-tmu-helpers-v2-1-8ca011d5a965@linaro.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=7169;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=jwYXw5BAfk6Wwc1RRtCbUDORFsnTrrPUfiaaNQ4rLTM=;
 b=SlE20QOBytwbp3of5WbmmWd+4J6dOEPga4fPKIXHKFGYRAzADXNBgjaKAL0nDVmeSDb1n4VD4
 62tQKwKN+zxBkKrwsfkML4jNh2/rMvlITenFe86NuddLacLH/IgKw+w
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_023232_435569_F265EEBD 
X-CRM114-Status: GOOD (  17.76  )
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

Both the DVFS and PMIC ACPM sub-drivers implement similar local helper
functions (acpm_dvfs_set_xfer and acpm_pmic_set_xfer) to initialize the
acpm_xfer structure before sending an IPC message.

Move this logic into a single centralized helper, acpm_set_xfer(),
in the core ACPM driver to reduce boilerplate, eliminate code
duplication, and prepare for the upcoming ACPM TMU helper sub-driver
which will also utilize this method.

Note that there is no change in underlying functionality. While the old
acpm_pmic_set_xfer() unconditionally assigned the RX buffer parameters
(xfer->rxd and xfer->rxcnt), the new unified helper introduces a
'response' boolean. All updated PMIC call sites now explicitly pass
'true' for this argument. This ensures the unified helper takes the
'if (response)' branch, performing the exact same assignments and
preserving the original PMIC behavior.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
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
index a2cac913b2bd..88a06842753d 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -517,6 +517,32 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
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
+void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
+		   unsigned int acpm_chan_id, bool response)
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
2.54.0.563.g4f69b47b94-goog


