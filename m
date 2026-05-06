Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9CDCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 11:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hq+r+ui6AdgiIfyUgPR+5nEHwOM+a2J0haQufQDNVuw=; b=KKf6GycQTLLvx1MNl90M1ORscW
	1LdK3ZHVREjiYNPhn5eWmGdXbi4P6boOrIiJGY+cEA3eqUAZXGZolPl+unx5afBRqdIlkL+RFZFKS
	CEkJIwpc61C5K7ojg4mlfCWGGc7WfmfajuCnVkq7TWlIFhvmUrcYlRzTHLUhsOvsAd73o5LQEXaIk
	iEnZ1DYMYQZzon5hadaQkgVFUj2W4TqqmkUTO1vgNqi4ymkqSp8ao6mESkMQiYDQsgxZ9+44/sLB8
	8c3va1c7pYhrAuWx6rhc71Chvp8V+hM4dtUCjJFQetZMtn7vRt/3Hl9e5Xj0D1U+Z7ZYYOJybp1R+
	5uoUaqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKabA-00000000eQ0-3k3A;
	Wed, 06 May 2026 11:39:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKab6-00000000eNA-47zg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 11:39:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-448528f4e69so3768313f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 04:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067563; x=1778672363; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hq+r+ui6AdgiIfyUgPR+5nEHwOM+a2J0haQufQDNVuw=;
        b=B3sNePV9jURBL6yEUMfqD/3hGDnrxdHI9X4+6UQiRV2wMrjVvzq0C7vsv23iV/NK56
         rzJnYsBXZy9P891JYG1+xeCbTt05+/31aypYcpipV2GtolCunY8cpPqE+MPJ9OCCS8Xp
         PWlf36aBa93fCDMCGNQeBMGJ8uCGHu6JLZpCIpqkBrcmr30m6Fjbi4Hp6XEJzoHF14+o
         vQXWGRs1Qv3d22lzVqOYTemj0VAHLRlNEcNBVCpv4io46mGxP5hEH1qPBOXrdgUsyB2e
         EehMG75kOrhv15JaUTZl98zc/qvGuVf+fXjytejgmrrfSUKKAQ7yDLq8gHcYWhNep9FW
         g7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067563; x=1778672363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hq+r+ui6AdgiIfyUgPR+5nEHwOM+a2J0haQufQDNVuw=;
        b=qvjwi9NGXn151WEGYJERAs6khoB3O0hDP4QcMF5OUACoJdVFm5zWZAYDDbvmdJMs9x
         ASmw/Kk8McAcufGQuCbdd7kBi5Ut+ojH9aQdpwtCX7yV7MahqZpZRqHTTGXpVYA1b5n1
         x9lodN17B9BBFtR4Wc+G4pe8t6UcKhUr9QAoYTf9FXYD0LT/tkuSb4CNPbtvncG5uVTi
         u0cz36f2oh5F4P3fEXnrvA6BMS+zmbkWb812HJvZVwCYed1ru5lVuAwP+2fl1xDcbfn4
         wSeSsvDHY4MO6gv8Mu4xrz6P58pFE29q9125hT3oEFL7V53XBP7QdKTs2Dy7952pW37i
         GZrA==
X-Forwarded-Encrypted: i=1; AFNElJ+alND4Itc7ICSgqwH+9sGdP1nKD8JqBu0OWxrNJww4RqFpS/QHngr3WlhEKOSdiVA8g/HYa2eOnAJDh4drP+Wg@lists.infradead.org
X-Gm-Message-State: AOJu0YyNDhemWQo0wHansutdc2cCDXGvR+uBp4y8vPAsb5HRBlO9wbzS
	CalK93jM2mRCiTIyPbVFmGb4RN8XykHFdsmz9vI/RC93hsI++qDPi+lMSY6TLMU96mg=
X-Gm-Gg: AeBDieuXPr+0HsnBH1efJO6JNPTS4DHolfeFV7Wu7mwIVPLisT0Fa1TLwihQXJQc7Hj
	7hKqLY1wcbXBM1f3z8AmcdobbDAFKsUdgzull2cRFMilTZxi362+ARY9z4AWlnElSfCFBCC6vnW
	Q1iemyW4zrW3xsL2Nyz78BqI3jZRZi0QpP730WE7Jkh1RqRyltOGKhDb1nWoQJpmVblm148HnbQ
	cg0iJ2J6dHPS3R1dJ9ImZBcdxCi4zgEojxHs5dU8fMicZcgzIjlp3qSrrvB7ardUaEkWQHFL81E
	73AOJ4YV80vzM6Vg4HVlO46CsiErHcmlRmj2vwIe2WtEysS/+qDklpJzbe2Hm6WklEE2D3144cT
	2i54oTsNBWYbzE/xEH5U0T4UqWCOECz3tFOR3pa733Cs9oi4E17EwkmVMFd5vMhd2Ws2kYp40/D
	Wf67+uBqpe90Dag+OOEqOHsdiePT6qROYlngSQl2B9kUgY/ctZyzArghq8h3Z/5EYuB3t6JCZfx
	KiSSJFobaQxwYN9Jw==
X-Received: by 2002:a5d:5f82:0:b0:43d:775b:c9bd with SMTP id ffacd0b85a97d-4515b42ec0emr5288317f8f.10.1778067562509;
        Wed, 06 May 2026 04:39:22 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:22 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 06 May 2026 11:39:03 +0000
Subject: [PATCH 1/6] firmware: samsung: acpm: Consolidate transfer
 initialization helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-acpm-tmu-helpers-v1-1-a9cd5daf8355@linaro.org>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=7114;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=naSA/b8vmDt1R7gpuyFrHyOUwxvQ1EhD/2Hft+vc8Lg=;
 b=RbK1DyoIZvVW8EbQjVaIsE5FjeKyL1pUqWpXgJ22BCLWZLFP1+O9Wu5Q69rNe7oxj9XZ3+RdR
 djY+aRBcVayD/lqiL/FR20B3ZmivMWJ0KG7uPbV/HXcvUPgq2ncoEMe
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_043925_073527_B32202D9 
X-CRM114-Status: GOOD (  17.70  )
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
2.54.0.545.g6539524ca2-goog


