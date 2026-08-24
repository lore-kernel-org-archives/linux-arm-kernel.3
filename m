Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C428DC5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 08:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPN5BIwUDTeW7sBnIZ7PXhoHkYcvuxUpMJtfpBrosOg=; b=gu2MIacpeGYHC5ncUjTOiv4F9r
	T1hs28HNq96tjcPEtIuEr3nKyHy8HB2ZiOes9Z/IegYrZPvXAl3oE9pB6wHuMlsnhwdkPdjYpRBET
	/dccdwJIid8w1B7LrPde2MwYshANHKPSUCuxw8B998uBXSuiRWWBW5hFSwX5pILtE/M4fe2Q+mMUj
	PY41yK1UBl7dkbS8SBl8iGMAQXKhLV0mQT6SPsPgypCHtqJAKIRuBnZnNfLGEfDkNdlMh2QCJdAWN
	/RXa5+kmO96HOxOT3BSeDCGnUcQ5sRWetiTOnrYFYnJDbvXG2g4TlxJVleJiHgwzHQkohFD4WVqm8
	sxrrfM5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQ1L-0000000GCZg-04km;
	Mon, 24 Aug 2026 08:27:07 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQ1D-0000000GCWF-13Gm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 08:27:00 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cbeea240819so1812106a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 01:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787560018; x=1788164818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPN5BIwUDTeW7sBnIZ7PXhoHkYcvuxUpMJtfpBrosOg=;
        b=DFfTQc8JS/bBaUtpi5qB8iEFOX2kxFGVesscsGOsBk7tU36wfY98PNjYuquWDkcpzJ
         Tomew/C+rS+1INDAVKtkg9ovh3SESv8V7JHVgFnQCtoGr7NVdCAiXr60mOhB5PzVNBHX
         2nMXpISISepCQw7YIZ8/MZNlJTQR1TWedmvVQZgXDk5NnBdXQPJt5BfvjpJlsVBr5xhD
         WxFcm5BOXTmw73VbDgO45xbjfPvXgZlhLG3GP9DgGsRP5cWY/CTkXKc1s94gIy56RHqI
         ntjN1gS8KkfSzOaW11MdTJgu5iSmWykCJuMubreV8eUMNW/YAE3zcWWjG5lLxm8J+Bsg
         hZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560018; x=1788164818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPN5BIwUDTeW7sBnIZ7PXhoHkYcvuxUpMJtfpBrosOg=;
        b=daaKHHbHPsZEsozRDpeAqWBttQ1H/9XYGFa0/Ap3qak4d9eFjDgsyJo46N04mo0qMu
         RX8pKDw24/SWxnihOur/5sBMNmpNeHqweJWEGfZ4c2GAU06V+sux5jLgACJVtRHHdrit
         t0jDjZAowtUwn4GuKLzodJftYpekRJ2dGdiMT5OJ0o1/WVY8JzusWJ5MyCHWfJ1/LvCn
         ajt2zJBr9/O/6y7FDnrblm9tlryGTLjQElQ2Mb5x/yeC47FBsD5auc99WeO5CO3loabA
         clq12ouA5Z6eKnFoXpH8tJcwcnJaySJX/n6zYZA4G8TYRq7aorDeW4PMwQF8iJBqRMdR
         4I2w==
X-Forwarded-Encrypted: i=1; AHgh+RoX6z0ck9kgpHJe6HsticYTrA+yVBVme9wC+x/90rE671MrLpSb07v4hsKTlluZCe5CYJPUZjlPKxeM4usi8ENy@lists.infradead.org
X-Gm-Message-State: AFuF++nttafRhQMbO9J+sFI7Kr+2DgXiG3e+bcrMvEsd9NLUMXmeaMkL
	iy5EkSSdhvUMjb3uP2qgKkEPNaU2U464aY5TVFBhlfqHDCXMDE613pFx
X-Gm-Gg: AR+sD11GDrDFpD6qcUkgN/lcpEslfCeUaKB+qedhJTJuk1olNCOZYDv3uxe9XaPN+FO
	xj2VyN/qgJEtT5RY/16+cWRbVZ+6GBVvcsx0vsNCn5yo6Xms8nDWNBoWrC1BX3bUpDLCjnKVuiK
	jW6VvqBSLKppVmTi/eQzh9J8HNTpXQPgJ8l7RyIpcuUc1BCHZQ1HHr2hzRTerEo8mcPkCVOihnT
	E2/TinBiI7YpJiaDgaTZib9IrEHT1w1PKQB8zpsXXmUumliVRSriys/T6MtMblJYq6b+lHB6uaD
	dWr6/ZUua5TlxQBsPGqCzsycjY1vJw4wfhTl0tNBHinLQiltdhcSF/cviWsQU6KuT7nuttxxigZ
	cG3b0G77K38/DXbMpN2J6eKCCjtGSRxyF+b0byLF+a+QZjQMyR3734ItWtFZVcZ4rFu45y1GSC7
	opbslgORUSLgIkc0D+EZa9rH8eoHIzVzzs5sbkbvQtYrleNZ54aEp9sw1on44Ru3A8Ys/BITDqK
	xsxeFDczLnP1kfq+MTDx2Ta9Gc9F8EGWjQWmSbTMzz0hdg5ipwAM25BesiO55rV9W4M02uNr+1p
	MOFmhAzFPyM6PZa5kmPxGk7kbMpIx2SQzuQVYLL265Vr5hnDIjQfd75dewVye85Ci0zJVG0HjQz
	vWN2UFfYjQXYucPKI3mj+KdJ1I5GqKbvSVCjZmm10MY23H6s=
X-Received: by 2002:a05:6a20:d70f:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3cd2fea6574mr50727838637.5.1787560018294;
        Mon, 24 Aug 2026 01:26:58 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0dd3sm25994595eec.7.2026.08.24.01.26.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Aug 2026 01:26:57 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] soc: apple: rtkit: bound syslog copies to the shared buffer
Date: Mon, 24 Aug 2026 14:11:38 +0545
Message-ID: <5575a09569af52fa7d8d66a217ca846824ef2745.1787559303.git.acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1787559303.git.acharyalaxman8848@gmail.com>
References: <cover.1787559303.git.acharyalaxman8848@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_012659_328017_616515F5 
X-CRM114-Status: GOOD (  16.76  )
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

apple_rtkit_syslog_rx_log() copies a log entry out of the
coprocessor shared-memory ring using an index and layout chosen by the
coprocessor. These values are not checked against syslog_buffer.size,
so buggy firmware can make memcpy_fromio() or memcpy() read past the
DMA mapping.

SYSLOG_INIT also accepts a zero message size. kzalloc(0) returns
ZERO_SIZE_PTR, which is non-NULL, and the later strnlen() size wraps
from zero to SIZE_MAX.

Reject zero-sized messages and make apple_rtkit_memcpy() refuse copies
that do not fit in the shared buffer. Rate limit the bounds warning so
the coprocessor cannot flood the kernel log.

Fixes: 9bd1d9a0d8bb ("soc: apple: Add RTKit IPC library")
Cc: stable@vger.kernel.org
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 drivers/soc/apple/rtkit.c | 49 ++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 1886f7eba77d..2e62f9b3c948 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -348,14 +348,23 @@ static void apple_rtkit_free_buffer(struct apple_rtkit *rtk,
 	bfr->is_mapped = false;
 }
 
-static void apple_rtkit_memcpy(struct apple_rtkit *rtk, void *dst,
-			       struct apple_rtkit_shmem *bfr, size_t offset,
-			       size_t len)
-{
+static int apple_rtkit_memcpy(struct apple_rtkit *rtk, void *dst,
+			      struct apple_rtkit_shmem *bfr, size_t offset,
+			      size_t len)
+{
+	if (offset > bfr->size || len > bfr->size - offset) {
+		dev_warn_ratelimited(rtk->dev,
+				     "RTKit: shared-memory copy out of bounds (off 0x%zx len 0x%zx size 0x%zx)\n",
+				     offset, len, bfr->size);
+		return -EINVAL;
+	}
+
 	if (bfr->iomem)
 		memcpy_fromio(dst, bfr->iomem + offset, len);
 	else
 		memcpy(dst, bfr->buffer + offset, len);
+
+	return 0;
 }
 
 static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
@@ -384,9 +393,10 @@ static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
 	 */
 	bfr = kzalloc(rtk->crashlog_buffer.size, GFP_KERNEL);
 	if (bfr) {
-		apple_rtkit_memcpy(rtk, bfr, &rtk->crashlog_buffer, 0,
-				   rtk->crashlog_buffer.size);
-		apple_rtkit_crashlog_dump(rtk, bfr, rtk->crashlog_buffer.size);
+		if (apple_rtkit_memcpy(rtk, bfr, &rtk->crashlog_buffer, 0,
+				       rtk->crashlog_buffer.size) == 0)
+			apple_rtkit_crashlog_dump(rtk, bfr,
+						  rtk->crashlog_buffer.size);
 	} else {
 		dev_err(rtk->dev,
 			"RTKit: Couldn't allocate crashlog shadow buffer\n");
@@ -428,6 +438,11 @@ static void apple_rtkit_syslog_rx_init(struct apple_rtkit *rtk, u64 msg)
 	rtk->syslog_n_entries = FIELD_GET(APPLE_RTKIT_SYSLOG_N_ENTRIES, msg);
 	rtk->syslog_msg_size = FIELD_GET(APPLE_RTKIT_SYSLOG_MSG_SIZE, msg);
 
+	if (rtk->syslog_msg_size == 0) {
+		dev_warn(rtk->dev, "RTKit: syslog msg_size is zero\n");
+		return;
+	}
+
 	rtk->syslog_msg_buffer = kzalloc(rtk->syslog_msg_size, GFP_KERNEL);
 
 	dev_dbg(rtk->dev,
@@ -444,10 +459,11 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 {
 	u8 idx = msg & 0xff;
 	char log_context[24];
-	size_t entry_size = 0x20 + rtk->syslog_msg_size;
+	size_t entry_size;
+	size_t offset;
 	int msglen;
 
-	if (!rtk->syslog_msg_buffer) {
+	if (!rtk->syslog_msg_buffer || rtk->syslog_msg_size == 0) {
 		dev_warn(
 			rtk->dev,
 			"RTKit: received syslog message but no syslog_msg_buffer\n");
@@ -471,11 +487,16 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 		goto done;
 	}
 
-	apple_rtkit_memcpy(rtk, log_context, &rtk->syslog_buffer,
-			   idx * entry_size + 8, sizeof(log_context));
-	apple_rtkit_memcpy(rtk, rtk->syslog_msg_buffer, &rtk->syslog_buffer,
-			   idx * entry_size + 8 + sizeof(log_context),
-			   rtk->syslog_msg_size);
+	entry_size = 0x20 + rtk->syslog_msg_size;
+	offset = (size_t)idx * entry_size + 8;
+	if (apple_rtkit_memcpy(rtk, log_context, &rtk->syslog_buffer, offset,
+			       sizeof(log_context)) < 0)
+		goto done;
+	if (apple_rtkit_memcpy(rtk, rtk->syslog_msg_buffer,
+			       &rtk->syslog_buffer,
+			       offset + sizeof(log_context),
+			       rtk->syslog_msg_size) < 0)
+		goto done;
 
 	log_context[sizeof(log_context) - 1] = 0;
 
-- 
2.51.2


