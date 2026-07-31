Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02B1C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LonlxyNI/UROq/7FsvfLYFpLarTm2H6nAAjtd6tWp9A=; b=KqT4IyO/XGYuEH4ygalMPC2ta7
	i0Eoj88nn7IP2jlguzWQ7RxcafH0sIThMDbKuxyjDG6XuU65O6BIxWw4GEbr2iiNzWQLWbPneeHNQ
	BHv5VZy3nzcyDk+LvNyxKn+AjGs24AitrjONB8W09CjuQ7nts97YMqPHpUi5lHK07h+Suw6s9bAqz
	+4tDmXJHDrzZhXqA2dZb2zYlJJE+4s2o3uI8NzJGkxIcwmUHL0sKuijXQW8oFI7j1a0csaf0dn/tv
	H8wX+ZPgHQ4vWcVFTMJhAbIvFR+YAl+56vO4kRRV3Y/2rEfSYdgccb3hqOCPJ/Y2gaGg/dYTYM17n
	qLMI1IPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqTp-0000000DBWg-3JF3;
	Fri, 31 Jul 2026 16:53:05 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqTn-0000000DBWL-2Dtj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:53:04 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ccdce28edeso1264765ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 09:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785516781; x=1786121581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LonlxyNI/UROq/7FsvfLYFpLarTm2H6nAAjtd6tWp9A=;
        b=c9lSThlxNLPjqO9DJHMiuZUTL4MRTqmosj9b0D8UP/4zecneIeXLviyus1eCuPYugL
         hgBCDEyS4KxwILTJK+oa4eTpmuhvauKqXD/iOxYnVHWOUhGdwv0ZvxT0rq3LZnlhVnmZ
         kr2KzFfH8hHMcwzkhaTCoFI0dasiD+SI55MaxmyQOZ0nQ/7XsQQUXrSIj15fXmd8j06b
         JDht/g9ZZhxCxRGus+zyC/6thmyBFHCeYIqJztvr/kluQgzXSgztJ1yEQ6LzF/+0ImIx
         oMGz8CdPJzQ5iChq9bX76iG1InAxPAO7p5oydQpM67M2f3HgiPq5DsosBk9VWwHd5aHC
         Dy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785516781; x=1786121581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LonlxyNI/UROq/7FsvfLYFpLarTm2H6nAAjtd6tWp9A=;
        b=FlF9ZhHtllwO+dRFvAPXjZeQCn9jMs5cS9YQYQXJxmNtnYjgdUs5Jpl316kY9zu0EN
         bPdqOSYgxBm0xdMBR9rdF9KxhSEYJ5w/SOCzG4+ERMdCddjSO5XEJmitSls70Vv8A6bB
         lX/yWsYeVt3gLe8JAak+bVoavgnYbahinqUK20HlQEjd4wr4P61SolCnvQT/u6LID4BZ
         zpVI2A3/48jbOcrnHUH7yFbWST/lsowdQsSRaDZ71thejIKEepD8h/LkBsOXrN7uoYov
         pJeCG126wOz4SBJTeDiWTjTkeTBXJzpSKQzo3yVuiTajeApENwJUOsD6er1RjZPFCtjC
         ckHA==
X-Forwarded-Encrypted: i=1; AHgh+RpUmxXfqfgZKCSMfiIjYy79H8ImW/nkiO7lczUBm1nkzJCO4g7Ql2yV9PwxWeuugJ2XZvoTrevulWlmzycmdbp+@lists.infradead.org
X-Gm-Message-State: AOJu0YxhOZzJ13O59IWHdrWwGIypBlwn7JYUNKMion+neuBBXY96Sp0S
	nlPdyJ015TUCDBx3k9gaRlHn58WWpc0OhRs98aV/FAmKm329dLCHGGaV
X-Gm-Gg: AR+sD12HVJSZvywA44Qefh8cAqnYKX07U92twBael9wAYoXPGLVlNfKAsbtlhN4OISC
	mxU7QjbGkr4mraYiBjUcbQjQxlaPu8Sn56M3BIUOGHOZ4ddFlSlvQ2IoYi1/wFiUPbMbj6GgXAJ
	4itGEiUILbjp31DnKaFY2AdFGX2vBs2wzRQDcLAjabdiDkGSvPV0E2OtP4Q8XOpiQkNcecciCTm
	Xtetw1mRX2Xhi+kvBEXgxbtH+6kUs4k2Pw049kzPPcwvbAwREDhKFsPlyJYMmbVYRyBke6SYu62
	IJU0tShz2InRC+i8shcbQDe6qp+4jtQesgLwoBEE5Kc4AnWa/G1i6FSzTbcZnKVWhmnPFU7epRf
	5VaAH2aGYhL8DFGFZ62M2X3/H7P0ZJn74uQX3+aoprVedgQyK3MySiLasjOuSItV1dj4ZCi3v8y
	Hch1GURlj0K6gir6Pzpdemd33YXwhnwL00uJvsCr529hBbCZpM7K0K4g==
X-Received: by 2002:a17:902:ced1:b0:2c9:fbde:ab68 with SMTP id d9443c01a7336-2d0523c0f5emr9691545ad.3.1785516781082;
        Fri, 31 Jul 2026 09:53:01 -0700 (PDT)
Received: from kali ([2402:e280:3d7c:a2:536a:b505:93f5:9d5d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddda5d9sm10399096eec.13.2026.07.31.09.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:53:00 -0700 (PDT)
From: Pavitra Jha <jhapavitra98@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pavitra Jha <jhapavitra98@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] soc: apple: rtkit: fix OOB reads in crashlog parser
Date: Fri, 31 Jul 2026 12:52:10 -0400
Message-ID: <20260731165210.113227-1-jhapavitra98@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_095303_672119_A1A9DE07 
X-CRM114-Status: GOOD (  19.49  )
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

apple_rtkit_crashlog_dump() parses a binary blob copied from a shared
memory region populated by the RTKit coprocessor after a crash. The
blob is treated as trusted structured data, but four distinct bugs
allow a malicious or compromised coprocessor to trigger out-of-bounds
reads against the kernel heap:

1. Section header read without tail-space guard
   The main loop is guarded by (offset < size), but the section header
   occupies bytes [offset, offset+16). A section starting within the
   last 15 bytes of the buffer causes the memcpy at offset+12 to read
   past the end of the allocation.

2. section_size not validated against remaining buffer space
   section_size is a u32 read verbatim from the coprocessor blob.
   It is passed directly to each handler as the 'size' argument without
   checking offset + section_size <= size. Every handler therefore
   operates on memory past the end of the shadow buffer. Additionally,
   section_size == 0 causes an infinite loop because offset never
   advances.

3. dump_mailbox: size_t underflow when section_size < 28
   n_messages = (size - 28) / sizeof(entry) performs size_t arithmetic.
   If the coprocessor reports section_size < 28, the subtraction wraps
   to ~0UL, n_messages becomes enormous, and the subsequent memcpy loop
   reads and dev_warn-logs arbitrary adjacent slab memory, constituting
   a kernel heap info-leak.

KASAN confirmed (kernel 7.1.0, QEMU/x86_64, kasan_multi_shot):

  BUG: KASAN: slab-out-of-bounds in apple_rtkit_crashlog_dump.cold
  Read of size 24 at addr ffff88800469f08c by task insmod/60

  Call Trace:
    kasan_check_range
    __asan_memcpy
    apple_rtkit_crashlog_dump.cold
    rtkit_poc_init

4. dump_version and dump_str: bare %s with no NUL guarantee
   dump_version() ignores its size argument entirely and passes bfr+16
   directly to dev_warn() as a %s argument. If section_size places the
   section end before a NUL byte, dev_warn walks arbitrarily past the
   allocation. dump_str() has the same issue in its else branch: memchr
   correctly bounds the search, but the resulting pointer is then passed
   to dev_warn() as %s without a NUL guarantee within the real buffer.

Fix:
- Check offset + 16 <= size before reading each section header.
- Reject section_size < 16 or offset + section_size > size before
  dispatching, ensuring every handler receives a size bounded by the
  real buffer. This also eliminates the infinite-loop case.
- Add an explicit size < 28 guard in dump_mailbox() to prevent the
  size_t underflow regardless of the outer check.
- Replace bare %s with %.*s in dump_version() and the else branch of
  dump_str(), using the (now validated) size argument as the bound.

Attacker model: any entity able to influence RTKit coprocessor firmware
or crash-log shared memory (coprocessor compromise, DMA-capable
peripheral on the same interconnect) can trigger these bugs against any
Linux system running Asahi Linux on Apple Silicon hardware.

Fixes: 9bd1d9a0d8bb ("soc: apple: Add RTKit IPC library")
Cc: stable@vger.kernel.org
Signed-off-by: Pavitra Jha <jhapavitra98@gmail.com>
---
 drivers/soc/apple/rtkit-crashlog.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/apple/rtkit-crashlog.c b/drivers/soc/apple/rtkit-crashlog.c
index 8319e3651..3af17c31d 100644
--- a/drivers/soc/apple/rtkit-crashlog.c
+++ b/drivers/soc/apple/rtkit-crashlog.c
@@ -81,8 +81,8 @@ static void apple_rtkit_crashlog_dump_str(struct apple_rtkit *rtk, u8 *bfr,
 			*newline = tmp;
 			ptr = newline + 1;
 		} else {
-			dev_warn(rtk->dev, "RTKit: Message (id=%x): %s", idx,
-				 ptr);
+			dev_warn(rtk->dev, "RTKit: Message (id=%x): %.*s", idx,
+				 (int)(end - ptr), ptr);
 			break;
 		}
 	}
@@ -91,7 +91,12 @@ static void apple_rtkit_crashlog_dump_str(struct apple_rtkit *rtk, u8 *bfr,
 static void apple_rtkit_crashlog_dump_version(struct apple_rtkit *rtk, u8 *bfr,
 					      size_t size)
 {
-	dev_warn(rtk->dev, "RTKit: Version: %s", bfr + 16);
+	if (size < 17) {
+		dev_warn(rtk->dev, "RTKit: Version section too small: 0x%zx",
+			 size);
+		return;
+	}
+	dev_warn(rtk->dev, "RTKit: Version: %.*s", (int)(size - 16), bfr + 16);
 }
 
 static void apple_rtkit_crashlog_dump_time(struct apple_rtkit *rtk, u8 *bfr,
@@ -112,6 +117,11 @@ static void apple_rtkit_crashlog_dump_mailbox(struct apple_rtkit *rtk, u8 *bfr,
 
 	memcpy(&type, bfr + 16, 4);
 	memcpy(&index, bfr + 24, 4);
+	if (size < 28) {
+		dev_warn(rtk->dev, "RTKit: Mailbox section too small: 0x%zx",
+			 size);
+		return;
+	}
 	n_messages = (size - 28) / sizeof(entry);
 
 	dev_warn(rtk->dev, "RTKit: Mailbox history (type = %d, index = %d)",
@@ -206,8 +216,20 @@ void apple_rtkit_crashlog_dump(struct apple_rtkit *rtk, u8 *bfr, size_t size)
 	offset = sizeof(header);
 
 	while (offset < size) {
+		if (offset + 16 > size) {
+			dev_warn(rtk->dev,
+				 "RTKit: Crashlog section header out of bounds at 0x%zx",
+				 offset);
+			break;
+		}
 		memcpy(&section_fourcc, bfr + offset, 4);
 		memcpy(&section_size, bfr + offset + 12, 4);
+		if (section_size < 16 || offset + section_size > size) {
+			dev_warn(rtk->dev,
+				 "RTKit: Crashlog section size out of bounds: %u at 0x%zx",
+				 section_size, offset);
+			break;
+		}
 
 		switch (section_fourcc) {
 		case APPLE_RTKIT_CRASHLOG_HEADER:
-- 
2.53.0


