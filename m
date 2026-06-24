Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FFECDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 19:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LGb+JhB64d0RGvLH+Gy+gftrzBh3+GzIkvGBLcFoPV0=; b=pceefgbmRnAzQoWnJ6YovekVLh
	0C6sF27ct2Gg4+Xgi7i/1AhUJmV75HI0QQ2y38cQi3vThZ02Rm95cIhAYYTJw3h5GL35xX7Bgq9KO
	nEuD2wDFQA/VKtbcR7tOWuK5RUmDRM2kg8PgXunwGxK2MHCXrCBVzzAMHurkqSZ8W1lTk75rl/jm7
	0WepGhcTY52jXrz3TFVMQhHZfN/un648hg55uChvWvBfKa2lv0DAHenHF0hJBVN2XGzI0rttafnc1
	0xXVHnoC+Cxf2hF+4QwrtHjPS5PuYdNM3mG+e9pNbpC8vEiL/KjywN2o7LA+2c/NEO8e8xBZqfhqv
	G4Ygfp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcSxY-00000008FK3-3DLA;
	Wed, 24 Jun 2026 19:08:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcSxW-00000008FJ8-1evt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 19:08:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4629d80fa08so1297248f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782328103; x=1782932903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LGb+JhB64d0RGvLH+Gy+gftrzBh3+GzIkvGBLcFoPV0=;
        b=mjsNGGH2f38xmuEm2W/jmV0BqTIpS9WTuvPs76FKtDF0YlOcpgCQZ5g2pqsrZns1U7
         iJ+SeS1e/NH0JJIwy85n/Mhhl+0kvTer40+Ld/MVFyDxEQuGKOEfHugcoAAb2M38aYZA
         ku5rVq2A0K8/osxRSDZ4Y4hF4qILU9w7r3R54+51bTX25cZrMfKaqkSBJS7D0KSnHCZH
         j27XWEpDwckuzEq2/5MvX65wFrDMpxalCu4NtYYzC4XNJi8cxFmNo6rPRH6iNvG8eMN0
         +IrmZx9XgZAf6xoVDbI/cSSkisFmd8OhEVTo00jdCPJqTIPsnCpRSeMXoLIsd6hWCLEk
         aUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328103; x=1782932903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGb+JhB64d0RGvLH+Gy+gftrzBh3+GzIkvGBLcFoPV0=;
        b=h0GTB07dVof0x2qC82Gi49HNUBt4lz+edLDRunLluBzn/YVYh+Q/T0wYafhzfvQbBG
         02kTNRrQHjppawCTXn4q1hUA3ECwnSARmHoWhBboH49XqlHKgxueaGYk3Awf8hBfGG2c
         XDixBiEuLY2WgmBsu7tX4HRz8s7L2ygaReHKzCEhdXaNWLQzpKVJzaH5+p6fBNQlrGOx
         V0nmZpmtLXruV5hRiVD0+QvkYHqc3X/2NFzFhp/0hUydkIVPmTkOYjytwVzR6yOLYiZg
         0OQnLL3npDEoBhQddzkOfFpDS+IGhGBrgY/Y9eWZaFrrHwxKWkdnzi2yyFuqi0l56s1g
         leoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPoorQPGp+ww85MDM+7CNiWFwbWp43v27kt+Hbs25t+qoQ/grFurQt3yW1xTAg89b09lKPPVFoMyiVef9W1cXK@lists.infradead.org
X-Gm-Message-State: AOJu0YykR2Ym33f5WE6UFmGvFgUi9sxKS7vU8+8iWshjv5sFu/ZDr92X
	55tNm7iWEsNndM1MN3SsbnjMgoVAMofMDgwk0kQCrzQmtNRu3Uma6SUX
X-Gm-Gg: AfdE7ck0DIiqVR/hUu9I8+gsKrY1XdEZHvCy3di1fq53vlfLyqqGVmsrmHu3elU35EB
	llZ3rffcmBQAvJ58qkf7XpovQmx4zuAPCCwirhN/F4MrNkxpvxlJQzrww2dFf5jAh1DDXXSE/D9
	U1Ee2t9RWa8d0JXkSYoHPRgn4SFjat/CMikwG5ZVHSTwDpb+IlLf7IfNzqmlvjMjjRqLgWTosr0
	oFjzVEzjdgWj97vEI8FV1BGl9+8Tt5FrYJTpNcHMd8SRGlhPaozuHlDwyuG7op3jxD0Tb/rxAft
	poINHTXR4QuFYZKIBeLKNMqZR9AZspcHIzr49IBKyWhWNGOUg3JLMdfKn0wEHmEoClSRSyQyIum
	VQeaZRZ8zE3tBrfM+7MAsda4IIhP7Db0hbrGqC6+zbsNBdddlGlFlCR2Fm2klcgZfXJOBEx72xN
	9DDrTThBMUHx11IfUY6QXTa2bjTw==
X-Received: by 2002:a5d:5c11:0:b0:46c:d441:da63 with SMTP id ffacd0b85a97d-46cd441dc98mr4130346f8f.40.1782328102615;
        Wed, 24 Jun 2026 12:08:22 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c22b73badsm9222414f8f.33.2026.06.24.12.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:08:22 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] misc: xilinx_sdfec: validate LDPC code register offsets
Date: Wed, 24 Jun 2026 21:08:12 +0200
Message-ID: <20260624190812.3075-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_120826_471082_95F5714E 
X-CRM114-Status: GOOD (  13.27  )
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

The LDPC code register helpers check the target MMIO address after adding
code_id * XSDFEC_LDPC_REG_JUMP to the register base. code_id is supplied
through the ioctl path, so the multiplication and addition can wrap before
the bounds check.

Validate the code_id against the register window size before computing
the final address, then write using the checked address.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/xilinx_sdfec.c | 72 +++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 40 deletions(-)

diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index 3135ba3a5..63f0eb2bd 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -456,10 +456,23 @@ static int xsdfec_get_turbo(struct xsdfec_dev *xsdfec, void __user *arg)
 	return err;
 }
 
+static int xsdfec_ldpc_reg_addr(struct xsdfec_dev *xsdfec, u32 base, u32 high,
+				u32 offset, u32 *addr)
+{
+	if (offset > (high - base) / XSDFEC_LDPC_REG_JUMP) {
+		dev_dbg(xsdfec->dev, "Writing outside of LDPC register space");
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
@@ -476,17 +489,11 @@ static int xsdfec_reg0_write(struct xsdfec_dev *xsdfec, u32 n, u32 k, u32 psize,
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
 
@@ -494,6 +501,7 @@ static int xsdfec_reg1_write(struct xsdfec_dev *xsdfec, u32 psize,
 			     u32 no_packing, u32 nm, u32 offset)
 {
 	u32 wdata;
+	u32 addr;
 
 	if (psize < XSDFEC_REG1_PSIZE_MIN || psize > XSDFEC_REG1_PSIZE_MAX) {
 		dev_dbg(xsdfec->dev, "Psize is not in range");
@@ -510,17 +518,11 @@ static int xsdfec_reg1_write(struct xsdfec_dev *xsdfec, u32 psize,
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
 
@@ -529,6 +531,7 @@ static int xsdfec_reg2_write(struct xsdfec_dev *xsdfec, u32 nlayers, u32 nmqc,
 			     u32 max_schedule, u32 offset)
 {
 	u32 wdata;
+	u32 addr;
 
 	if (nlayers < XSDFEC_REG2_NLAYERS_MIN ||
 	    nlayers > XSDFEC_REG2_NLAYERS_MAX) {
@@ -563,17 +566,11 @@ static int xsdfec_reg2_write(struct xsdfec_dev *xsdfec, u32 nlayers, u32 nmqc,
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
 
@@ -581,20 +578,15 @@ static int xsdfec_reg3_write(struct xsdfec_dev *xsdfec, u8 sc_off, u8 la_off,
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


