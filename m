Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E08C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 05:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgsA375lt/C9JoBeIh+flIPjgZNxw7BBlg6E3CmnWA0=; b=MW8JGPeCENm6E1JFvkeprpaoou
	vtmyMo1Z7pMJvTyDPpYyDFHJqD+A+lanZeKgRbo1K4us3rZWJUcoJc2c0NC72GlICIuIHmbntM3Cg
	euYq/9itwb59vVJ4oV52ZQg6HFg8YX6N1MlKt813JWmpz7ZuTfDB2Nhq9Ao8o0jEJyqlirJi5Y+gg
	fOKvi5QLJXNNT2YDuHeTHCKolXNoPIZYCHiMmFFSC+jk/T/3Leb6P5hkVZa1JrK0nuCOkBqtPRMiL
	eCrC0O+Bzefsn2erT2HxeWeEssWHH0wm4eoYXV4EmkrUgWyFVTj9Q6g5GHU2PGQnXfvqTvJ6xgROS
	mQhYSD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tumBe-000000084r4-1Ljr;
	Wed, 19 Mar 2025 05:41:54 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tum8J-000000084ZW-20wC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 05:38:28 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so9526556a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 22:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742362706; x=1742967506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgsA375lt/C9JoBeIh+flIPjgZNxw7BBlg6E3CmnWA0=;
        b=mKYPoUGLwXDNs7HIUn2MfSUJAin4BlACA2PGqxV6+fuD8IJpa2SbQj2kk8fnWamfoQ
         BH7lERRxZFYrdWkkzSkTLxrmtlqJRr0oyMsGa6IDHLnHz5P3gH68I7Rd3tGfAO2hAxa5
         vBSsOrtfQ886OPGKOlDinvgonAmmqBpoDbbcpPqWhfl/OcKkX1uLspNO2wXo43Gv4tHE
         EqVYK/guOZOgoWUrlcLeqblEyT63gNNWq52uhIvFaTZqVwJhWb2LIlx7v2zvcX/dqhp5
         JNAueywSt+9oV5qwTEsCoTrvvkoL5u5DpaXYmZghhvOT9NkRQQLvsjBtXL/cQCIpnlme
         fXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742362706; x=1742967506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgsA375lt/C9JoBeIh+flIPjgZNxw7BBlg6E3CmnWA0=;
        b=tnBtsOqW+ucpd84zNvCn0ZYlZhKhvmvPUrjLo/fqBPPlxliz+h3fHFDrYcJGMMeumK
         hi0r2uJP5bdWsKfwQ1KYAkER3/iGqkw4UR5sZUMKfyAYFH7N4VQVk6F5IEAHajWToKuA
         fUnUVyjQ3UstkxAzACpd0d/o0mkfTXfRPSHFV3fRRwHhYkZQ/x0BzA3ALIc0Q/YzTMdj
         WAQK96IqmcMIQ2fanr4jlWWaz4NjO9WSztZu/tdpkFVB5yG2/qMxW4tlokQqGx+7lJJy
         hq/vfyuX9JIIt4WYjsQ/1UeMrXr2vBzFzqKjKOd7tC7/7NJEQzMDSYSiKWpLDlhjauje
         nXkw==
X-Forwarded-Encrypted: i=1; AJvYcCVzs+V9M7lq+2fMlZnQ5XY0bZ8UnG/Vo5FGXUg6nhgbRUvmpE7O8vTlVSS3BW+QM3EiEs7lx286/yLTxPU8c6Kx@lists.infradead.org
X-Gm-Message-State: AOJu0YwbSvZcXTLCV5r3MTix1POjBredRdBAOSw8zXYau68sJdV23jgs
	XR3OK0g9Ai/pkUx+lNcAhSd/2kJpVX1i8VEoFpJE3RwVwCQ2R44Z27oY5faUaGE=
X-Gm-Gg: ASbGncsS5IOZ+pyWiJSsH+uzZvW2nWbJPjn3T7VFqA8RUcVD5cCNEWDPLBcPEkgQ3fm
	c8OoCPtqMbK13ecKnn5Ktt0COJLyKSHgcihiBHp30bcqWwD9/xJV1lUiOcKswyLqooefGpWrWE/
	Oz9y567f2JMfpUbz8gxjTyCPI5dJQw4yJsV4d2HLwtFERhbXdecDyFnd9H2rkuPpCroEp/MmytH
	R5z2GYCPAiogi8Vk+D+D+F5lclaUIAX4rFbkDoNkBC0jkuTclFJBQ5xgBicXYj6YRDDAfTWTIkk
	NKnH2riZd6P/oyHVCmMobzEQ30Yaa99nFaUPI3szYldBasufI9TO9m1AmdttNCefoI/TC3dH0+B
	7n7n4YxLWhxh8Ccj4ZAgNLKE8HUZ9
X-Google-Smtp-Source: AGHT+IG3tuVguXn8VMgCu6sKWPV/ocanlmbBg3hUDHZimmGHiNDmeLkru9JZ3Nv+KSAa/KV/eaCfAw==
X-Received: by 2002:a05:6402:35d3:b0:5e7:8be5:d189 with SMTP id 4fb4d7f45d1cf-5eb80ca9ce2mr1398560a12.4.1742362705701;
        Tue, 18 Mar 2025 22:38:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e6d4sm8511817a12.9.2025.03.18.22.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 22:38:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 19 Mar 2025 05:38:23 +0000
Subject: [PATCH v2 1/2] firmware: exynos-acpm: fix reading longer results
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250319-acpm-fixes-v2-1-ac2c1bcf322b@linaro.org>
References: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
In-Reply-To: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_223827_520489_D5EFA4BF 
X-CRM114-Status: GOOD (  15.98  )
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

ACPM commands that return more than 8 bytes currently don't work
correctly, as this driver ignores any such returned bytes.

This is evident in at least acpm_pmic_bulk_read(), where up to 8
registers can be read back and those 8 register values are placed
starting at &xfer->rxd[8].

The reason is that xfter->rxlen is initialized with the size of a
pointer (8 bytes), rather than the size of the byte array that pointer
points to (16 bytes)

Update the code such that we set the number of bytes expected to be the
size of the rx buffer.

Note1: While different commands have different lengths rx buffers, we
have to specify the same length for all rx buffers since acpm_get_rx()
assumes they're all the same length.

Note2: The different commands also have different lengths tx buffers,
but before switching the code to use the minimum possible length, some
more testing would have to be done to ensure this works correctly in
all situations. It seems wiser to just apply this fix here without
additional logic changes for now.

Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
issue is in linux-next only afaics at this stage, as driver is not
merged into Linus' tree yet
---
 drivers/firmware/samsung/exynos-acpm-pmic.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 85e90d236da21ed76f7adba59caec165138ad313..39b33a356ebd240506b6390163229a70a2d1fe68 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -43,13 +43,13 @@ static inline u32 acpm_pmic_get_bulk(u32 data, unsigned int i)
 	return (data >> (ACPM_PMIC_BULK_SHIFT * i)) & ACPM_PMIC_BULK_MASK;
 }
 
-static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd,
+static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 			       unsigned int acpm_chan_id)
 {
 	xfer->txd = cmd;
 	xfer->rxd = cmd;
-	xfer->txlen = sizeof(cmd);
-	xfer->rxlen = sizeof(cmd);
+	xfer->txlen = cmdlen;
+	xfer->rxlen = cmdlen;
 	xfer->acpm_chan_id = acpm_chan_id;
 }
 
@@ -71,7 +71,7 @@ int acpm_pmic_read_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -104,7 +104,7 @@ int acpm_pmic_bulk_read(const struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -144,7 +144,7 @@ int acpm_pmic_write_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -184,7 +184,7 @@ int acpm_pmic_bulk_write(const struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -214,7 +214,7 @@ int acpm_pmic_update_reg(const struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
-	acpm_pmic_set_xfer(&xfer, cmd, acpm_chan_id);
+	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)

-- 
2.49.0.rc1.451.g8f38331e32-goog


