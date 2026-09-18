Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49586C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXzJLAY9j5odxKClr8BsLGTEU4HkCb/vEygnN5tSKcI=; b=OC1tzyAhvtDJJbRT9UNNYy0LU3
	vIQTVlV1QVLuACIwbZqaJsgfza+OYJsZy9r1HUTXkdaz3zQI+ITQDF4iGVfMWkHIEIYbZxz4Io8O8
	jhoKD+1FFiCT5nPQUQF95wtkq56Fsed4BmDkonId2sUqz0+Z2I8csJww9InLHwVAISWaRIOjR7oWB
	FY2G0PTK8bp9KH/b8CWWaO0w5/hAt+aCDocF6v81+89QNOmAkx7Vw7sIHPku5CGKvlXpogUSlINhW
	IWUt21JurH2HpA7QysyKJn7n+j5LU6rwwv9rlv1DXWlSd9w2dlCG18XV43i+9zC9zzePBkDy+sVVF
	Xom28MUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bkY-0000000F4u2-0fWN;
	Fri, 18 Sep 2026 16:47:46 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bkS-0000000F4rI-17bf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:47:41 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cc147d86bebso963902a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750059; x=1790354859; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXzJLAY9j5odxKClr8BsLGTEU4HkCb/vEygnN5tSKcI=;
        b=o+xaIwYZHI971mvkVrXopBZr4nLaTfWIRdC8DmHxNZfbYTU1oi2OawEwdu98dJ45VR
         OuebSoFaF5yIzknmY158vlCf20j+dLsCFCP2vXftE/9PDJiW+o9xw8Dhfm7Bw9lLtY+c
         3A1M2I7zp8EiALs+gY6Hj0jmifaYwWGf+AtkyRU1Do2XZ3jQW3xkqrE0Qp97OgXaiNq0
         /q/q+UQisxmKO4miaFZXUbjU20udd0sbQk8AxHKCgmnmjN9S/2KFQOw4DG6ZjKTuR+KL
         1bCvVhJ7tAIHiuCZWSM6rPtipcKeWpB11w1k7wUMWbGGFRzCAOHSvvYH8+RalKI//1je
         TMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750059; x=1790354859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXzJLAY9j5odxKClr8BsLGTEU4HkCb/vEygnN5tSKcI=;
        b=zyjHwwZRQeclXrwmUatlR9GcQCy73x9uUCtmFV4hShgbDzLlv5bgp7sN1of8zCElPn
         0T919ggIDiFfnpWH+ebpVixBFq1T0Kfi0H0bdyMu0qNIPtJHgQkRR7kmEwf4FpW1mZiX
         Wou2WjRds299rtvWItDb/3kd3hRGHN91Lvg75YI8wN4SrtEoubD63Hdarnqdo3VWosgW
         XB6tIKJWt52I6F9HJya+oELIY1Hfl1thqZ02e2DbRI3/n0TvXrhbTFwwbH8mQq3eB+fv
         cg5qIRrskqNMJT9ndlfeui2dP8lApkP1XB+wO6H0XpzIrmbQT70I4ITDbMo0oYKMwvUK
         6aSg==
X-Forwarded-Encrypted: i=1; AKwUvByYjWAf1fgTA+EVhri0WQQmpUctiWUzIaPcrzTfeZbDFQRg+DUYMFoEEBXiCoo2+9kytB2Oz8PLP8dSzCnWqAd6@lists.infradead.org
X-Gm-Message-State: AFuF++nOoEjzXKBQq2keQJp1PeBRyWfE3CKgnvwAirdNtTuYHk2wpV1J
	ULIL25cA/+VYQnb0gGu/8HbVgA7EVyL+hiMkPFUCg/lx9D5jZ/2qHXWM
X-Gm-Gg: AYBFou0AkfgxJyVuAUBp+3xJ4bpD9Uh0kVEf1JWX+C23NcYR5Viej+2VHLbn6fcDHzM
	vnI/tyeVka4zrgs8V+IBJM8SXnnwh8xUxlKhyJczXTjreIaVO3eJ+DAoXvDiTAdE0byaLdNpNpk
	Q6NEOsDGDKDIDvqgvQLiwMM8GQBt+/BCHZNK8LKTLqRB4vwB2T2/yzOCX4hPyvR2meVFBthFNXo
	110jym3kZWYaTFfWkHhEH/Irxu2lq6SltcDd2v3bfkh1ZvtFnE+Ordv46N3xn0KHJimENUCupLH
	6RaVEVIm+6jLwo8TjoS6XGTRMPgk0yQu5uM3upndw1VrApkcZ25nHZ/7FTMcItfkAzuNq7h+OIS
	2B47mi+C9F1mfOY6eck6eHXLxDgUC7Dh+jEX7RNzKka2OGCDPjE7ZBLFbDli/DVAtyOFfZUvPD6
	qSSnnFllW5RtrlUT8yDSWX1H2Y8y53bEgcy+2xOTQ0K+V9ixDwhgwoj3XshJPiTqgvbP+VNg7r
X-Received: by 2002:a05:6a00:4099:b0:842:3c77:5996 with SMTP id d2e1a72fcca58-87341085fd4mr10175647b3a.1.1789750059163;
        Fri, 18 Sep 2026 09:47:39 -0700 (PDT)
Received: from [127.0.1.1] ([223.122.38.120])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-877a8dfe201sm50514b3a.18.2026.09.18.09.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:47:37 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 19 Sep 2026 00:47:03 +0800
Subject: [PATCH 1/2] soc: apple: rtkit-crashlog: rename 'Crg8' section from
 regs to aarch64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-rtkit-armv7-crashlog-v1-1-f4a671ea453c@gmail.com>
References: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
In-Reply-To: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4600; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=T5ePlaPWKKBlTLSmPKKBLXleGmVB5tFWU+61peT575U=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqrWskADcmCOtokPCqj1yGNH6q8CXYa2yckF60P
 9FNoYp3liiJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaq1rJAAKCRABygi3psUI
 JE/OD/9Fop6CLfJ+FGs1WPvP0YASFDiEJBUsmpWiWlsK1im1oxn7BYgcc2POZWxDKIp79qhz6YL
 U/CXIDQrU7agwe/cHOJRGXCBW5VgfUkxkgIfIX3DTg5UPPZ1c5uXTYE8l4HRm+/WRXLsRVS6f/Y
 27Oog1lG/01iZtYCsrtTV3AA82LxWldSykRyuVvPdqTCZdZjR9SYS2mWU7lsAvyU1KRjFab/vaB
 qthXOQSIihlpyVv3c5b8pLOnx0boPZ1zR36FgEpYJuS5DfxuqLBFTEaCalWpjdZo+m+Y38lHM3y
 ol08sA27qnwsK3EjduTpllJjDb/YzodiMlBUsAAj2U7UYoUPff0v2G8N+BInwTs1jkTuhZtFaZi
 Fef9+cjD0m0hT+IjC4mE4zpqRZl+1aT6RS6xXZo3HMbwgdVPwIQmrcBnFpozNvwYxP+fiaPKpiF
 Bs06tSqQ/PETttfAjFgKt59qxkx2K6TlK1O0EgLibTytDnwmY+YzrPUhBRkNlr0d0iGeO5oSKlc
 eTjNHjH5B9M3lRJdE2HVwIKc6zM1mZJqvCYzl7aQDkmsIGn0phgpHiQgb2PW+7JojlzfZGxy2NV
 g6SAHeu8NWlULXW6X36e2WWTGZtBxCMHXGpHDYA8b69OzeNQlpCMPIK7NJ81RkmsgFklgUIQtiQ
 0+TOUrIY/+70KIg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_094740_339103_37B71A07 
X-CRM114-Status: GOOD (  14.14  )
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

This section contains AArch64 CPU state of the IOP when the exception
occurred, including register information. Rename this section to be clear
about the CPU architecture as support for crashlog section with AArch32
CPU state will be added.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/soc/apple/rtkit-crashlog.c | 43 +++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/apple/rtkit-crashlog.c b/drivers/soc/apple/rtkit-crashlog.c
index 8319e365110b..6a8273e81e61 100644
--- a/drivers/soc/apple/rtkit-crashlog.c
+++ b/drivers/soc/apple/rtkit-crashlog.c
@@ -13,7 +13,7 @@
 #define APPLE_RTKIT_CRASHLOG_VERSION FOURCC('C', 'v', 'e', 'r')
 #define APPLE_RTKIT_CRASHLOG_MBOX FOURCC('C', 'm', 'b', 'x')
 #define APPLE_RTKIT_CRASHLOG_TIME FOURCC('C', 't', 'i', 'm')
-#define APPLE_RTKIT_CRASHLOG_REGS FOURCC('C', 'r', 'g', '8')
+#define APPLE_RTKIT_CRASHLOG_AARCH64 FOURCC('C', 'r', 'g', '8')
 
 /* For COMPILE_TEST on non-ARM64 architectures */
 #ifndef PSR_MODE_EL0t
@@ -42,7 +42,7 @@ struct apple_rtkit_crashlog_mbox_entry {
 };
 static_assert(sizeof(struct apple_rtkit_crashlog_mbox_entry) == 0x18);
 
-struct apple_rtkit_crashlog_regs {
+struct apple_rtkit_crashlog_aarch64 {
 	u32 unk_0;
 	u32 unk_4;
 	u64 regs[31];
@@ -58,7 +58,7 @@ struct apple_rtkit_crashlog_regs {
 	u64 esr;
 	u64 unk_Z;
 } __packed;
-static_assert(sizeof(struct apple_rtkit_crashlog_regs) == 0x350);
+static_assert(sizeof(struct apple_rtkit_crashlog_aarch64) == 0x350);
 
 static void apple_rtkit_crashlog_dump_str(struct apple_rtkit *rtk, u8 *bfr,
 					  size_t size)
@@ -123,21 +123,22 @@ static void apple_rtkit_crashlog_dump_mailbox(struct apple_rtkit *rtk, u8 *bfr,
 	}
 }
 
-static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
-					   size_t size)
+static void apple_rtkit_crashlog_dump_aarch64(struct apple_rtkit *rtk, u8 *bfr,
+					      size_t size)
 {
-	struct apple_rtkit_crashlog_regs *regs;
+	struct apple_rtkit_crashlog_aarch64 *state;
 	const char *el;
 	int i;
 
-	if (size < sizeof(*regs)) {
-		dev_warn(rtk->dev, "RTKit: Regs section too small: 0x%zx", size);
+	if (size < sizeof(*state)) {
+		dev_warn(rtk->dev, "RTKit: AArch64 section too small: 0x%zx",
+			 size);
 		return;
 	}
 
-	regs = (struct apple_rtkit_crashlog_regs *)bfr;
+	state = (struct apple_rtkit_crashlog_aarch64 *)bfr;
 
-	switch (regs->psr & PSR_MODE_MASK) {
+	switch (state->psr & PSR_MODE_MASK) {
 	case PSR_MODE_EL0t:
 		el = "EL0t";
 		break;
@@ -160,11 +161,11 @@ static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
 
 	dev_warn(rtk->dev, "RTKit: Exception dump:");
 	dev_warn(rtk->dev, "  == Exception taken from %s ==", el);
-	dev_warn(rtk->dev, "  PSR    = 0x%llx", regs->psr);
-	dev_warn(rtk->dev, "  PC     = 0x%llx\n", regs->pc);
-	dev_warn(rtk->dev, "  ESR    = 0x%llx\n", regs->esr);
-	dev_warn(rtk->dev, "  FAR    = 0x%llx\n", regs->far);
-	dev_warn(rtk->dev, "  SP     = 0x%llx\n", regs->sp);
+	dev_warn(rtk->dev, "  PSR    = 0x%llx", state->psr);
+	dev_warn(rtk->dev, "  PC     = 0x%llx\n", state->pc);
+	dev_warn(rtk->dev, "  ESR    = 0x%llx\n", state->esr);
+	dev_warn(rtk->dev, "  FAR    = 0x%llx\n", state->far);
+	dev_warn(rtk->dev, "  SP     = 0x%llx\n", state->sp);
 	dev_warn(rtk->dev, "\n");
 
 	for (i = 0; i < 31; i += 4) {
@@ -172,12 +173,12 @@ static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
 			dev_warn(rtk->dev,
 					 "  x%02d-x%02d = %016llx %016llx %016llx %016llx\n",
 					 i, i + 3,
-					 regs->regs[i], regs->regs[i + 1],
-					 regs->regs[i + 2], regs->regs[i + 3]);
+					 state->regs[i], state->regs[i + 1],
+					 state->regs[i + 2], state->regs[i + 3]);
 		else
 			dev_warn(rtk->dev,
 					 "  x%02d-x%02d = %016llx %016llx %016llx\n", i, i + 3,
-					 regs->regs[i], regs->regs[i + 1], regs->regs[i + 2]);
+					 state->regs[i], state->regs[i + 1], state->regs[i + 2]);
 	}
 
 	dev_warn(rtk->dev, "\n");
@@ -229,9 +230,9 @@ void apple_rtkit_crashlog_dump(struct apple_rtkit *rtk, u8 *bfr, size_t size)
 			apple_rtkit_crashlog_dump_time(rtk, bfr + offset + 16,
 						       section_size);
 			break;
-		case APPLE_RTKIT_CRASHLOG_REGS:
-			apple_rtkit_crashlog_dump_regs(rtk, bfr + offset + 16,
-						       section_size);
+		case APPLE_RTKIT_CRASHLOG_AARCH64:
+			apple_rtkit_crashlog_dump_aarch64(rtk, bfr + offset + 16,
+							  section_size);
 			break;
 		default:
 			dev_warn(rtk->dev,

-- 
2.55.0


