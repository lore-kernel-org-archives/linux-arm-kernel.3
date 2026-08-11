Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3B7C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PQogJxVcWHF2/s1gpFEzMjsDacnUmvO1LDzMrn00kZM=; b=fTs8rEoZJMHz7CaZ1d2eCqP7R0
	KTkU4wP7/WuoQYzeydjNKcP5IoJzVMs/r8gCT7E6ohhk9TH46EZcO/kDKRH7aXfC0v3QdKpajIx8i
	FQKug3a+O4SpiFVIe1gigF/woF4K8H9Dfl2DXamwi16QvCaXq4sCkbpFdk2f8RcsHNFDx/V4Vw7bR
	uB9BtROfxEVIUnJoYGscTqv+wzA17Xv9G5rY9Sd+rxBK6fZe3DoEtgppG77SWDkE4hgxhV2kKasSv
	R5N4J/l4R653QAwL8lXAXAwsU6YPduCCqqtlKzjrwXXgQ6xwxiWWyQEG4GmJxz9vtcJBRcdxuIkrl
	uxEFd0sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfdq-0000000DNkp-0jjo;
	Tue, 11 Aug 2026 06:07:14 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfdn-0000000DNjm-2gkI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:07:12 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-43b7e186a0cso790041fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 23:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428430; x=1787033230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PQogJxVcWHF2/s1gpFEzMjsDacnUmvO1LDzMrn00kZM=;
        b=OTcgwUnvdxeBMZ1Gi4OR4+PCJfwbb5NK6Y4Sbs3W1+qFCtxld1Nm1mZZKUsTCE1z2z
         0EmiUkiGmlptvatw1n3Yh224US6qug3gsLQif5OYenGX52sw8M8QOcxKddoHwiNJVqQt
         Uy9xVzdvky965Qt6Kro35l2MeHSRlIACVhg1yrlPrXet6DY5juCRs/oTPAJ0RtKbC5b5
         qQCShZSw79AjfJIWSJ08zeu8N3CDbeSN7YD5p7pmgSQUi4awz0Hb42JdxSKXiFo2q3Hv
         QizqHLaPL3z+dViyZfs1+mFQgxVc0Sz6yBfEjzxFy2cMIjDtmsyFbGF5lrWyJL3OWznl
         OWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428430; x=1787033230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQogJxVcWHF2/s1gpFEzMjsDacnUmvO1LDzMrn00kZM=;
        b=bxPUJQAe7fufbVYHRFAHk2BAqbvbHS5Ae6gDW3nGpdrb4NgS75wkB+azud8Ap3VuDO
         3cbKvvQxf9OBAUGpt4i73sKkb5ed5kpFPagC39L6V6SDa+HNxBYdcZqmlC9FI6ssIisr
         PCVgWRMIeJLpPSNPaxheX0oeBHgzqy2F0czQCfYtgw+DFwoT1b82jAvmbj021z52SWPI
         NVnw0r38+SlZthGM0B3UJG/B7hwqARK3i64gTZ+vAxVvSa7+L4YcVNiD8mfJQcIct2fx
         dsg049upTxGIQ+EgzsivSCZj15fLlA0P9ixojaY+uW6FkLuoOYxm+43h5iOOaobkjuWO
         te2A==
X-Forwarded-Encrypted: i=1; AHgh+RqdHnJBtHFBUHamNlxTnxll01EprhRtl9rbjpzE4329ByhYMgFhGafBP9cIXfYjs+HOEaJMe87k7WmuWmaQgsPg@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp9lDRITtGGXvQHaC34DErrRRK0Au9GWmOp0FquNB6UIZg5OyM
	oeLhQqJ7i0IBbkCa/Q/2idgj0aIM+GoTteM94WmpLUpYKcNK6GZ5CbVo
X-Gm-Gg: AR+sD13OAhztycpon5Aff+NCRmrVEj1u61ZyyLUjOoLjvZwtimob5EsgKzaJ8eS0c79
	tOyfY7FxSkVfYDDesCWrvmuHhpzeHFZOuBOQMj7sEvbDJp0hUnLJZyFjELDVYnruOvx3ooeVzhi
	wXR6Jvwh0yk1X3tABHfJR6i2XIJlyVN/P5u01acK9HD+uExX5aBNwsWpKqnPDyJ7tmenRllFxXo
	zgvIfjJxpZxh+IFFddbYbmGoiZO93zsqxaE+3zDPEA+Wuiz+FiM98VH6Trq/QVSSJxUk2Lz/eZd
	/c4CfYOnFvmEtTBScCGmzGhIjzIYFAFtOv0B3IoJf78s6Fldhk48s2wvtRYX7lO9iP5GGvEpodG
	0heuMBgiZX48bs8ZeLQ/J9hsJ4soHjlxiY0mUyEZbp3YrqhOsxLJUmZZgsgbocOSQiKu7KHENjo
	yILKHcgw/pTuG1eyIoWoUjwjvZvAulBtSmQ26ZL6faWnWxMu93+rOiBsy+gTlJDty8qi/w50FN3
	855bwoqMwVorn6wDOPXIhHbtanA/OO8EzP2UV5tFwp0qhpDuwjZHLB6A7fVxpHuvcJdspfz1E4P
	+o6st+6XVQfVjhxXo6/Ec++IPS/fbtEx3ci3brkZ+QIugg3pf+pSDRF0pAZdfzAcEKu3WYrgdOM
	Kl9JdLZZ7HyuBETUKCU5LFNnpak/l0pSgnJCOYw==
X-Received: by 2002:a05:6808:f01:b0:496:2b3:ae71 with SMTP id 5614622812f47-4b1fd9d2e1amr577795b6e.18.1786428430385;
        Mon, 10 Aug 2026 23:07:10 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2001331d2sm98211b6e.11.2026.08.10.23.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:07:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: James Hilliard <james.hilliard1@gmail.com>,
	stable@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Boris Brezillon <bbrezillon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: sunxi: reject invalid ECC step sizes
Date: Tue, 11 Aug 2026 00:06:48 -0600
Message-ID: <20260811060651.227431-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_230711_677488_BDA27F14 
X-CRM114-Status: GOOD (  16.32  )
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

ECC maximization forces a 1024-byte ECC step and divides the
available OOB bytes by the number of steps. A NAND with a smaller
page therefore produces zero steps and a division by zero.

An explicitly configured ECC step which is larger than, or does not
divide, the page also produces an unusable step count before the NAND
core can diagnose the configuration.

Validate the step size at both points where the driver derives the
number of sectors and reject invalid geometries.

Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 45ccbce91551..ad314c0e30b2 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2032,6 +2032,15 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
 	sunxi_nand->user_data_bytes = NULL;
 }
 
+static int sunxi_nfc_ecc_steps(struct mtd_info *mtd, unsigned int step_size)
+{
+	if (!step_size || mtd->writesize < step_size ||
+	    mtd->writesize % step_size)
+		return -EINVAL;
+
+	return mtd->writesize / step_size;
+}
+
 static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize,
 					int ecc_bytes, int nsectors)
 {
@@ -2078,7 +2087,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		int bytes = mtd->oobsize;
 
 		ecc->size = 1024;
-		nsectors = mtd->writesize / ecc->size;
+		nsectors = sunxi_nfc_ecc_steps(mtd, ecc->size);
+		if (nsectors < 0)
+			return nsectors;
 
 		if (!nfc->caps->reg_user_data_len) {
 			/*
@@ -2163,7 +2174,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	/* HW ECC always work with even numbers of ECC bytes */
 	ecc->bytes = ALIGN(ecc->bytes, 2);
 
-	nsectors = mtd->writesize / ecc->size;
+	nsectors = sunxi_nfc_ecc_steps(mtd, ecc->size);
+	if (nsectors < 0)
+		return nsectors;
 
 	/*
 	 * The rationale for variable data length is to prioritize maximum ECC
-- 
2.53.0


