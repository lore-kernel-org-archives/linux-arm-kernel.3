Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE59FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RXVKOfA9hd4RcZO7gsoOEE/4S45norFi3L5vJ3qAUhw=; b=KnZjPDnasHGsE8GjEQmya/58FN
	wiw+1oGiI8xpBggfg7BwqHv66W1KGaZId1oHiCahCXFPK6xO51SSg1MB/7wGx708XD7AVwcDQecXA
	L6j7tqAi5FwQKNkj8X63YZjCDY+/FDC7N1eJ6gfo68QHT/z1ZECJuvjyI/xySxkd3/EPJ/0IIjwyh
	Is+n1GgfwJfAO+ZedKsfXjJHxUCxmzuPPSm4Uh8Od0QHxIkviStW7F38Xpqr+foVZT0T0cayUMsAB
	id+DoHlzt3HvpgIhI0N9RH+Z72IBSTWZnC4S7E3kcXPOQWp5drt7eq1MEq96eZAqmURa1AhJIWnVq
	FSAleTPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDvb-0000000F4ed-1diB;
	Mon, 29 Jun 2026 15:29:43 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDvY-0000000F4dJ-1gl8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:29:41 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-664a09bc459so3150562d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782746979; x=1783351779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXVKOfA9hd4RcZO7gsoOEE/4S45norFi3L5vJ3qAUhw=;
        b=RGIm+PlyXqMzGVCe2w/zHxGsZYWBT0r+LOzNDmrE9BEzW3NtwRawa9u5huJnlH/GUF
         MHekvMD5uliNWuk7Xc/93OWrYRsfeLGJ1gKBfnB8Pbpflav9fq1gkYBx9hcNO0PYoZ5n
         kaDRoDlXHe59D+CuyGxEISoXGLgs26BUvhW+3xk89qswtf9MZLwxxn0WVT0joUA7zApt
         w4cp6XLID4UoT6UdVzoos7Rdopji36ne7tqtGz28escYZrjvD+GWZOlhZf0KPtmmp9Jz
         yGn9sqK6YCqgK6600jB9UTQkOn87WrsJK7X5tiYCA8/MW/VpCtLcLmnoF688KivUfj9Z
         Oiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746979; x=1783351779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXVKOfA9hd4RcZO7gsoOEE/4S45norFi3L5vJ3qAUhw=;
        b=UjZqjAEbm54gCkTmExXV/ESdprKUPGbssfaju/oX6GVztn1E9Lp+Tv5zF5z4kxpq8T
         rXuVpTePUSznhFKowgca0cYnr6p6GHOBh8jpabVMD7HiFboj4LDf2t2TMWjqzZIy3Ko+
         /w4zfDw5EURxksHLjeTMPUw038VX6F0Kum4AGRpokQa8sBcEhQUvcZeTLogoNCS143d3
         8EalESC0ZAfl1GoAu9fYCBDuVtrcWn+y7gAUvSV4dJthSrrscHWRqAD7/wMKgaOC3tIW
         mdk8K9o39fSkVUvwlvZb7bPeEVq4zhAM90z5k9WY8r6spMsizlQNqP+8AC7k1oEN63Mn
         MKjw==
X-Forwarded-Encrypted: i=1; AHgh+RomQc4RRyImhp+7JJQ+rFEZmZxd2cYkHD9j2K2gPJ4ACRkKzeYoPwqt6j7SAFh4k7k6oUSUdRkPhFsXcHp7a+D4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2qXQ3h000ean82tJNu2Ec8aFQXaZaoWBNKEs5xUxcfVrFgzjw
	+mnEopIDIUECifiTf74Exs2f9N1e5W/7C80TDn08mT6xGGdY9EgoIf5N
X-Gm-Gg: AfdE7cmNm3KVQy1r+eoHsBoHTFTMyj41FUTLb2lz53euNCxwU1L63EUgAocGvxoKPe6
	q39RxTngvZXaLyjECvOR/YIn6dIA7MB+Wb8sjwmO0MERmrrehpQsHYW2FE3nByJ+6e3Ygp+9o0U
	2b8E5iUOD77xCLYyMn0eoGUSEHaqTchtAkldZUgNxWaFv1F66zb7XWOwf0RCZ6dWHygKbPBEcvh
	/WhwD4k6MkbpcdyU0e8TmUVRVukOZ+BHAcshjqb+/euPdnZPNlEq3VmAe9HthI7NmN3ccEQZ1wi
	19VFng09YhBl8Pf/O3bUvC/Q7+gsoIAsSDURP7Ah2dVAlVNj3ZURv9X8IvAmseiPZGvUjzxfBKc
	Hmwf1BJfcGQe9w91GCB/3wCG0CaHQnznZ+S7VosymEABGSxYNCNaa99aWxXoYzlK9Bap7WWg7ei
	cGHeNS98nO1CgnXcDdq6kdmJLqcw==
X-Received: by 2002:a05:690e:1c2:b0:663:1af9:a2f5 with SMTP id 956f58d0204a3-664f974fd0amr106919d50.10.1782746978730;
        Mon, 29 Jun 2026 08:29:38 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-664afe7c1dfsm4289812d50.10.2026.06.29.08.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:29:38 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH v2] misc: xilinx_sdfec: validate LDPC code register offsets
Date: Mon, 29 Jun 2026 17:28:57 +0200
Message-ID: <20260629152857.13553-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_082940_451233_22563728 
X-CRM114-Status: GOOD (  13.87  )
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

The LDPC code register helpers check the target MMIO address after
adding code_id * XSDFEC_LDPC_REG_JUMP to the register base. code_id is
supplied through the ioctl path, so the multiplication and addition can
wrap before the bounds check.

Validate the code_id against the register window size before computing
the final address, then write using the checked address.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
Changes in v2:
- Guard against swapped high/base constants before subtracting.
- Preserve debug output and include offset/base/high in the message.

 drivers/misc/xilinx_sdfec.c | 74 +++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 40 deletions(-)

diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index 3135ba3a58ee..e73a139f3ffc 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -456,10 +456,25 @@ static int xsdfec_get_turbo(struct xsdfec_dev *xsdfec, void __user *arg)
 	return err;
 }
 
+static int xsdfec_ldpc_reg_addr(struct xsdfec_dev *xsdfec, u32 base, u32 high,
+				u32 offset, u32 *addr)
+{
+	if (high < base || offset > (high - base) / XSDFEC_LDPC_REG_JUMP) {
+		dev_dbg(xsdfec->dev,
+			"LDPC register offset %u outside space 0x%x-0x%x",
+			offset, base, high);
+		return -EINVAL;
+	}
+
+	*addr = base + offset * XSDFEC_LDPC_REG_JUMP;
+	return 0;
+}
+
 static int xsdfec_reg0_write(struct xsdfec_dev *xsdfec, u32 n, u32 k, u32 psize,
 			     u32 offset)
 {
 	u32 wdata;
+	u32 addr;
 
 	if (n < XSDFEC_REG0_N_MIN || n > XSDFEC_REG0_N_MAX || psize == 0 ||
 	    (n > XSDFEC_REG0_N_MUL_P * psize) || n <= k || ((n % psize) != 0)) {
@@ -476,17 +491,11 @@ static int xsdfec_reg0_write(struct xsdfec_dev *xsdfec, u32 n, u32 k, u32 psize,
 	k = k << XSDFEC_REG0_K_LSB;
 	wdata = k | n;
 
-	if (XSDFEC_LDPC_CODE_REG0_ADDR_BASE + (offset * XSDFEC_LDPC_REG_JUMP) >
-	    XSDFEC_LDPC_CODE_REG0_ADDR_HIGH) {
-		dev_dbg(xsdfec->dev, "Writing outside of LDPC reg0 space 0x%x",
-			XSDFEC_LDPC_CODE_REG0_ADDR_BASE +
-				(offset * XSDFEC_LDPC_REG_JUMP));
+	if (xsdfec_ldpc_reg_addr(xsdfec, XSDFEC_LDPC_CODE_REG0_ADDR_BASE,
+				 XSDFEC_LDPC_CODE_REG0_ADDR_HIGH, offset,
+				 &addr))
 		return -EINVAL;
-	}
-	xsdfec_regwrite(xsdfec,
-			XSDFEC_LDPC_CODE_REG0_ADDR_BASE +
-				(offset * XSDFEC_LDPC_REG_JUMP),
-			wdata);
+	xsdfec_regwrite(xsdfec, addr, wdata);
 	return 0;
 }
 
@@ -494,6 +503,7 @@ static int xsdfec_reg1_write(struct xsdfec_dev *xsdfec, u32 psize,
 			     u32 no_packing, u32 nm, u32 offset)
 {
 	u32 wdata;
+	u32 addr;
 
 	if (psize < XSDFEC_REG1_PSIZE_MIN || psize > XSDFEC_REG1_PSIZE_MAX) {
 		dev_dbg(xsdfec->dev, "Psize is not in range");
@@ -510,17 +520,11 @@ static int xsdfec_reg1_write(struct xsdfec_dev *xsdfec, u32 psize,
 	nm = (nm << XSDFEC_REG1_NM_LSB) & XSDFEC_REG1_NM_MASK;
 
 	wdata = nm | no_packing | psize;
-	if (XSDFEC_LDPC_CODE_REG1_ADDR_BASE + (offset * XSDFEC_LDPC_REG_JUMP) >
-	    XSDFEC_LDPC_CODE_REG1_ADDR_HIGH) {
-		dev_dbg(xsdfec->dev, "Writing outside of LDPC reg1 space 0x%x",
-			XSDFEC_LDPC_CODE_REG1_ADDR_BASE +
-				(offset * XSDFEC_LDPC_REG_JUMP));
+	if (xsdfec_ldpc_reg_addr(xsdfec, XSDFEC_LDPC_CODE_REG1_ADDR_BASE,
+				 XSDFEC_LDPC_CODE_REG1_ADDR_HIGH, offset,
+				 &addr))
 		return -EINVAL;
-	}
-	xsdfec_regwrite(xsdfec,
-			XSDFEC_LDPC_CODE_REG1_ADDR_BASE +
-				(offset * XSDFEC_LDPC_REG_JUMP),
-			wdata);
+	xsdfec_regwrite(xsdfec, addr, wdata);
 	return 0;
 }
 
@@ -529,6 +533,7 @@ static int xsdfec_reg2_write(struct xsdfec_dev *xsdfec, u32 nlayers, u32 nmqc,
 			     u32 max_schedule, u32 offset)
 {
 	u32 wdata;
+	u32 addr;
 
 	if (nlayers < XSDFEC_REG2_NLAYERS_MIN ||
 	    nlayers > XSDFEC_REG2_NLAYERS_MAX) {
@@ -563,17 +568,11 @@ static int xsdfec_reg2_write(struct xsdfec_dev *xsdfec, u32 nlayers, u32 nmqc,
 	wdata = (max_schedule | no_final_parity | special_qc | norm_type |
 		 nmqc | nlayers);
 
-	if (XSDFEC_LDPC_CODE_REG2_ADDR_BASE + (offset * XSDFEC_LDPC_REG_JUMP) >
-	    XSDFEC_LDPC_CODE_REG2_ADDR_HIGH) {
-		dev_dbg(xsdfec->dev, "Writing outside of LDPC reg2 space 0x%x",
-			XSDFEC_LDPC_CODE_REG2_ADDR_BASE +
-				(offset * XSDFEC_LDPC_REG_JUMP));
+	if (xsdfec_ldpc_reg_addr(xsdfec, XSDFEC_LDPC_CODE_REG2_ADDR_BASE,
+				 XSDFEC_LDPC_CODE_REG2_ADDR_HIGH, offset,
+				 &addr))
 		return -EINVAL;
-	}
-	xsdfec_regwrite(xsdfec,
-			XSDFEC_LDPC_CODE_REG2_ADDR_BASE +
-				(offset * XSDFEC_LDPC_REG_JUMP),
-			wdata);
+	xsdfec_regwrite(xsdfec, addr, wdata);
 	return 0;
 }
 
@@ -581,20 +580,15 @@ static int xsdfec_reg3_write(struct xsdfec_dev *xsdfec, u8 sc_off, u8 la_off,
 			     u16 qc_off, u32 offset)
 {
 	u32 wdata;
+	u32 addr;
 
 	wdata = ((qc_off << XSDFEC_REG3_QC_OFF_LSB) |
 		 (la_off << XSDFEC_REG3_LA_OFF_LSB) | sc_off);
-	if (XSDFEC_LDPC_CODE_REG3_ADDR_BASE + (offset * XSDFEC_LDPC_REG_JUMP) >
-	    XSDFEC_LDPC_CODE_REG3_ADDR_HIGH) {
-		dev_dbg(xsdfec->dev, "Writing outside of LDPC reg3 space 0x%x",
-			XSDFEC_LDPC_CODE_REG3_ADDR_BASE +
-				(offset * XSDFEC_LDPC_REG_JUMP));
+	if (xsdfec_ldpc_reg_addr(xsdfec, XSDFEC_LDPC_CODE_REG3_ADDR_BASE,
+				 XSDFEC_LDPC_CODE_REG3_ADDR_HIGH, offset,
+				 &addr))
 		return -EINVAL;
-	}
-	xsdfec_regwrite(xsdfec,
-			XSDFEC_LDPC_CODE_REG3_ADDR_BASE +
-				(offset * XSDFEC_LDPC_REG_JUMP),
-			wdata);
+	xsdfec_regwrite(xsdfec, addr, wdata);
 	return 0;
 }
 
-- 
2.54.0

