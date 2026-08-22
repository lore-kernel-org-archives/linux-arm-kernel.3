Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178D7C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3DjOJK7xDoaF8DBdXDTvBpCyBMM9nbKuBHTtDt30EA0=; b=Uhvf/2SptPxFjo3VXMZvZ/DQhs
	lztuuqT0rnMzQaIt7iHuhTcbLzXd6Ixe/EsfR2vR8Fz9bYSXlFjsLlfZrdTltpZq8KtX1pxeuepzJ
	cipGhRbtE23zFB0FAD2CIL/6qXcsKP4BlKN79T1LHzPqxBabpUldgtEDFLeqKWJVmFr3Cn1e48Yzh
	0gSZn34mUuPPL/vIFf3S9+DXWTCERrt/pgZqgOw71wrnn67k/XD1xn+xzApOtavdhFcEwmnCD2YJu
	6Lu5dZBe8AEIQH7w4iHbxMWhmQfBHZSRYRfhDOcxMMRyG9+XtGENhXl23xnNFMfubrUw4Ygj2m9sT
	Ar5hXuCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiNw-0000000ER8U-0vFs;
	Sat, 22 Aug 2026 09:51:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiNt-0000000ER86-3MQW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 09:51:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d049069377so16579435ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 02:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787392288; x=1787997088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3DjOJK7xDoaF8DBdXDTvBpCyBMM9nbKuBHTtDt30EA0=;
        b=g5xm52c1mu0rVm4WJ42hI0cetCUH742xJmiS42bzKH8KACCUxq7TAcyCMcJAJPg7zt
         d2QZQh7kYwfW3Fn5YuwbpiVF6NoSiUQsHWhQWAR6S2xhwZQRJDsHN0YH6UOPTdBXTvqH
         UtzBFdDweBGyVLU6h3Xmdpt0VYJribgMuoIKrtAOVaDyT4C8Kumh+juWpR5KtnXyPPzi
         vy9T6nZSx22GeKt8NwCupLFN2YHTM//luR8+EivKOrbzIT8JAiS2uCWPBIx4Txo3L9TY
         kblyM9gzimT2WKaf0zRcG8k1fHz4eUytkBPxNyG/kbGhX0ohxgtNzD0QTsp1ToGGGoQK
         GOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787392288; x=1787997088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DjOJK7xDoaF8DBdXDTvBpCyBMM9nbKuBHTtDt30EA0=;
        b=P0GoN+9rYmELZHN5VQMakSvQHalf/38/UcHY864+g4Fej0YALKbtHZQro9+xsSOkFA
         ojjfAlZNnPeb9VoqRg+PeIin3QvESKm8rUqX/50IFcvwMA3gJ1uBTwiG6FX6JIyUJLHz
         annMeqKaOdNaKjAbxZ0fsybgW+Jdf0wRhMiDye4TSOoY3LR8XIMBZXrtO2UCDvCpxIUD
         DRbV0sAfgpRE9wSzPD3K1XEM5+lLfvTZyc+xWOqa9YZJ4jA8sXwdqknuYFahzG/Qmdvv
         pJ8QgRrvC1uOkk2vC6nE0ZZekQikNUytc8UnNg6Ohq7a7bpD6+q8w2AY5cZYsl+y983E
         oZJw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4GV9+scevGbu3IA37fS8ZeBK4SSnBqnuxUsnJFb1KwHZCrY2aRB5IeSSEd/xVLLi9kAmuVKC8YbUTSPc4PiLZ@lists.infradead.org
X-Gm-Message-State: AFuF++nxnE7Js+M7G4UAH2kw2738aww867RK95i5EZ5ir6MzkN6X0xBe
	OyAEirJVRSQUA8VODfi1iCXZKtUhq7DoJG00106FzAbejIsK4YWcoDKc
X-Gm-Gg: AR+sD10yLzSmcYaw9mko7WRqIuFBY9vIrratmmcDhQdtebBcCMOZfqPGHmuoAugoveX
	bPvtLXEfoTzqxBzVkMxOx2ej6fTQ6Ii645UJZV4XtHeWzln8Sv3epaTPzelGXLhrOhABjaiDhun
	TG/M5buKm8MbjnOZ5XMs5/i4WEwJLCTrOei9ussWgt4pzbtuzPoW5Kaafyib6f2RDWYpYooVpzH
	+2fQ7q7NN2qY4veNR8fLZBif4HFGvMU5RqdFtk8k7hZXw8IA0MV5ZvaghzK7GVVUfi949P4K0Hl
	joWuEOYL9stzQ4EeLN8xlSebqQtMozLsJy/YUgYf75dYLxzoqXf5ixQ6lmbx+10Q0t7R5lHFZF2
	u7GWYFPB+qEZ3nIemnTX3W3UJ9bWtV5/S11yPzedy8mhmun4CRJ2ForgciRPYSsq1ajUpTE8Jma
	l4EuIznila37XimH6X7alxLRHklGmskx9kkENqzd7y6agh1RVdtRuMqcZ9SZLjUMmnMBznD8yu+
	Pw09CwslzpJiSwO/jr8Z1woZIAA/yHRd2aRyBUMh6RkkDtSS5to5VDYdljSnXBLCXMjQDguztWN
	w+vXY6Wj7K9DHy3w12fmQ2SOOFMfVzTbST1/hlD8KsghnrfrI+OFfKAd2f55n5VP+BqX5VSYKUK
	tXoKvx3coAt25eSloODfV2QTKm0KLKHzCGaYXRje2il9V7m6x1drdwFqQzg==
X-Received: by 2002:a17:903:b07:b0:2d0:cc92:f7a9 with SMTP id d9443c01a7336-2d64add1daamr229443285ad.4.1787392288034;
        Sat, 22 Aug 2026 02:51:28 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm5244881eec.17.2026.08.22.02.51.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 02:51:27 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] soc: apple: rtkit: bound syslog copies to the shared buffer
Date: Sat, 22 Aug 2026 15:36:21 +0545
Message-ID: <20260822095121.53451-1-acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_025129_868952_D51FE3F1 
X-CRM114-Status: GOOD (  16.38  )
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

apple_rtkit_syslog_rx_log() copies a log entry out of the coprocessor
shared-memory ring using an index and layout that the coprocessor
itself chose (SYSLOG_INIT n_entries / msg_size, plus the 8-bit idx in
the LOG message). Those values are never checked against
syslog_buffer.size, so a compromised or buggy RTKit firmware can make
the kernel memcpy_fromio()/memcpy() past the DMA mapping.

SYSLOG_INIT also accepted msg_size == 0. kzalloc(0) returns
ZERO_SIZE_PTR, which is non-NULL, and strnlen(..., msg_size - 1) then
wraps to SIZE_MAX.

Treat n_entries as a count (reject idx >= n_entries), reject a zero
message size, and refuse shared-memory copies that do not fit in the
buffer. Rate-limit the new OOB warning so a coprocessor cannot flood
the kernel log.

Fixes: 9bd1d9a0d8bb ("soc: apple: Add RTKit IPC library")
Cc: stable@vger.kernel.org
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 drivers/soc/apple/rtkit.c | 73 ++++++++++++++++++++++++++++++---------
 1 file changed, 56 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index a3fdac8f6f06..63b85d082a7a 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -348,14 +348,28 @@ static void apple_rtkit_free_buffer(struct apple_rtkit *rtk,
 	bfr->is_mapped = false;
 }
 
-static void apple_rtkit_memcpy(struct apple_rtkit *rtk, void *dst,
-			       struct apple_rtkit_shmem *bfr, size_t offset,
-			       size_t len)
+static bool apple_rtkit_shmem_ok(struct apple_rtkit_shmem *bfr, size_t offset,
+				 size_t len)
 {
+	return offset <= bfr->size && len <= bfr->size - offset;
+}
+
+static int apple_rtkit_memcpy(struct apple_rtkit *rtk, void *dst,
+			      struct apple_rtkit_shmem *bfr, size_t offset,
+			      size_t len)
+{
+	if (!apple_rtkit_shmem_ok(bfr, offset, len)) {
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
+	return 0;
 }
 
 static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
@@ -384,9 +398,10 @@ static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
 	 */
 	bfr = kzalloc(rtk->crashlog_buffer.size, GFP_KERNEL);
 	if (bfr) {
-		apple_rtkit_memcpy(rtk, bfr, &rtk->crashlog_buffer, 0,
-				   rtk->crashlog_buffer.size);
-		apple_rtkit_crashlog_dump(rtk, bfr, rtk->crashlog_buffer.size);
+		if (!apple_rtkit_memcpy(rtk, bfr, &rtk->crashlog_buffer, 0,
+					rtk->crashlog_buffer.size))
+			apple_rtkit_crashlog_dump(rtk, bfr,
+						  rtk->crashlog_buffer.size);
 	} else {
 		dev_err(rtk->dev,
 			"RTKit: Couldn't allocate crashlog shadow buffer\n");
@@ -422,10 +437,29 @@ static void apple_rtkit_ioreport_rx(struct apple_rtkit *rtk, u64 msg)
 
 static void apple_rtkit_syslog_rx_init(struct apple_rtkit *rtk, u64 msg)
 {
-	rtk->syslog_n_entries = FIELD_GET(APPLE_RTKIT_SYSLOG_N_ENTRIES, msg);
-	rtk->syslog_msg_size = FIELD_GET(APPLE_RTKIT_SYSLOG_MSG_SIZE, msg);
+	size_t n_entries = FIELD_GET(APPLE_RTKIT_SYSLOG_N_ENTRIES, msg);
+	size_t msg_size = FIELD_GET(APPLE_RTKIT_SYSLOG_MSG_SIZE, msg);
 
-	rtk->syslog_msg_buffer = kzalloc(rtk->syslog_msg_size, GFP_KERNEL);
+	kfree(rtk->syslog_msg_buffer);
+	rtk->syslog_msg_buffer = NULL;
+	rtk->syslog_n_entries = 0;
+	rtk->syslog_msg_size = 0;
+
+	/*
+	 * msg_size == 0 would make kzalloc() return ZERO_SIZE_PTR (non-NULL)
+	 * and later strnlen(..., msg_size - 1) wrap to SIZE_MAX.
+	 */
+	if (!msg_size) {
+		dev_warn(rtk->dev, "RTKit: syslog msg_size is zero\n");
+		return;
+	}
+
+	rtk->syslog_msg_buffer = kzalloc(msg_size, GFP_KERNEL);
+	if (!rtk->syslog_msg_buffer)
+		return;
+
+	rtk->syslog_n_entries = n_entries;
+	rtk->syslog_msg_size = msg_size;
 
 	dev_dbg(rtk->dev,
 		"RTKit: syslog initialized: entries: %zd, msg_size: %zd\n",
@@ -441,10 +475,11 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 {
 	u8 idx = msg & 0xff;
 	char log_context[24];
-	size_t entry_size = 0x20 + rtk->syslog_msg_size;
+	size_t entry_size;
+	size_t offset;
 	int msglen;
 
-	if (!rtk->syslog_msg_buffer) {
+	if (!rtk->syslog_msg_buffer || !rtk->syslog_msg_size) {
 		dev_warn(
 			rtk->dev,
 			"RTKit: received syslog message but no syslog_msg_buffer\n");
@@ -462,17 +497,21 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 			"RTKit: received syslog message but no syslog_buffer.buffer or syslog_buffer.iomem\n");
 		goto done;
 	}
-	if (idx > rtk->syslog_n_entries) {
+	if (idx >= rtk->syslog_n_entries) {
 		dev_warn(rtk->dev, "RTKit: syslog index %d out of range\n",
 			 idx);
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
+			       sizeof(log_context)))
+		goto done;
+	if (apple_rtkit_memcpy(rtk, rtk->syslog_msg_buffer, &rtk->syslog_buffer,
+			       offset + sizeof(log_context),
+			       rtk->syslog_msg_size))
+		goto done;
 
 	log_context[sizeof(log_context) - 1] = 0;
 
-- 
2.51.2


