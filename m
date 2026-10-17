Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F9ACCF2CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 19:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcmdGAknSlSB095s7l2UZ1pCIYoSMNB0vG29+Hnkm4I=; b=k/TBr4kHX9vKZm0F6iQeg73RdP
	YKkAoo8b5keVDWzOi5sCc028dSVMSheSTXJNArCE/S4pG0xnOGir5wh+8MtWrJQwCL3I9oYT53V1T
	KdNgvva/BbY9ekoxeldAWf82ja84QV16tReB+grX+M6vzitalOWL/z2vFcrhKmMsOcGfuiVauHSSx
	r3eymewuPJt4/VizyTfg6hVA+QEGg4boKJLJmebBS0ZOwlHzXkHOfIN9SO+J3fss5x5IEiUrvhMq+
	ptvvJUd3YH+ACMYtK+ESc52yrq8ocq97aQ3vlMbTBQzv13tpwDt93kufO5giFJnu550mlW05qvgEA
	7XRf+JWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIATN-00000005B5k-1BTT;
	Sat, 17 Oct 2026 19:53:41 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIATJ-00000005B1j-2KfG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 19:53:39 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-825b40f8a26so355457a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 12:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266816; x=1792871616; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xcmdGAknSlSB095s7l2UZ1pCIYoSMNB0vG29+Hnkm4I=;
        b=ezS7oE6ITsYRBujks+uDeFLVymHiH9/QHfd85gfzJtGQlEIv5OeDLJa0ie9ktynQO+
         ZN7+J5v+wc4wIhQVV5M2QkRvdkucimzrPYxO2noQgk9B+B2V+twunG0eOJqsAF8YJ8u0
         3F5Fxd8LhHZoC6OOnL3EXzZGGxn/eyRDEIrQtzVnGSkc99Kno3Uw3JNGF3okQ7hDWYYB
         3ZMideQjeuj3E2f0dgn/3TIk8Mi0+12dMDGRPHbzzaZ2iIX/q40K6M6b6Mt76StgMpvv
         bCsX6OKT+suvfh8iwtKObm+HQGX8rngC3WSio//lPaTgHwth40R5gvpqligSbooKp9I/
         erxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266816; x=1792871616;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcmdGAknSlSB095s7l2UZ1pCIYoSMNB0vG29+Hnkm4I=;
        b=0+uNYHJNNFk9gRlqNb1SmiGwE5Zj+L3FQML8LQyxbQR27Qd9s7AtmiqsSfjYbYP+id
         bJaX/niCI55WAwPB7UcwmtTN++cCWWkrSCnfiVqlhQbp08MRBRo0vNCEf7c69+wJLstD
         40Isz9VeFRwlF6cNU7QTrwzRfo2j1fnOeWpAq+OMWwn1NJ2WHZSgf//70e9G4T9joPRd
         /3PW6LGegcTB1694+Osqla1+zDp9IAahclg10SrpQcDsILPnscEXrBBLognBtoRu2kKK
         NfnDrjcBK2BpOoghq1sBcVTmHrycJkwQXOJAPfIX6eDGfG+fQ3focFkv0FdvRMOEmLd6
         rP0Q==
X-Forwarded-Encrypted: i=1; AKwUvByW9v7SZ17Fk+cl4JUWEkyY9SnVvX2rQE6uilhhRasjZWcLmI8frF8sWGfnIgEg4tziSPvykzsd0BGxryyLNW8V@lists.infradead.org
X-Gm-Message-State: AFq9FYJOjeaw+IRVQbMuU//8UVpPdMOHwmW9IaV8NRyhOjXxNClK37zc
	O06qlmB3cXOxt9xtg9b5NhDLphD7XskZup9+hL7cX93CtWly4jmY/fRv
X-Gm-Gg: AYBFou2zfZoID8Vp4332QSyCZ1VplkcCKvJyaZRhPgnB07Afmr45oSj4KtnYAJCtZff
	zh7WR6BDQpo7Z7jzeSZVfUaTGR2jIGxJ7tF4UDDVKfoA93cBrFserO535rEibPC4H43bOmm7z/g
	fVemOwdpkrKIl1qUKTJBqG3b19ONsbdm5Aclq9lTW45gdn8FCZL9yba+hTPl3SCy7HcvPEezDm/
	TsbSxwvnz5ycs4f7BQHgwWmY/8Ox8nJv2LJNnOgFKsyrH11hwa8cUvmOy5iF0pGRoatQLM9uf2T
	KcpomcRydo1/qVK6jM4jEAPCNmJN4CDiF7Bv5B3MrHhGaNZ1W+G3iBZswQmQQ4u50QrS/cAdAFG
	aQ7dZvuOdorPWNNbw9LT++56PJp0FQEiDasYzAVyzNWY+h/f6wAkdwnzHLBa4sqRRATQ404YIw8
	rr5xlnk5l+bOyIjuOyblWhJRAJOn7pHIGyudlGM34u4CE6S87kOG81M12+CcqBLMQiHfoQADOKm
	0F+2IBSIoSwM+NquwT4uIuBQsGGY5c6HzW7Y9R3q1RFkXwLoXrcC26nsy0YPM6t53YIHQfiynZP
	tBK7ZCqiidVcxHpszLNE9K+CA+MWvXJztHrXdiYwShDQRRaQmu+zCy4ulg9yAEf9hIJdT0BzrKD
	eJORHyFD0/ejo2i67DSj0RJZLLj8Fo4afOIG+8dhP8a00TGid/fQRwA==
X-Received: by 2002:a05:6830:4129:b0:83c:2a05:c65d with SMTP id 46e09a7af769-844ff4249d6mr3801148a34.18.1792266816507;
        Sat, 17 Oct 2026 12:53:36 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-845b9e280dbsm2212064a34.19.2026.10.17.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:53:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v9 15/18] mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
Date: Sat, 17 Oct 2026 13:53:04 -0600
Message-ID: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-15-5af9a1be16ef@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_125337_607252_2E49EE7A 
X-CRM114-Status: GOOD (  12.03  )
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

sunxi_nfc_select_chip() programs chip selection, timing and the
spare-area base. The page-read callbacks and PIO page/subpage writers
call it directly, then immediately call nand_read_page_op() or
nand_prog_page_begin_op(). Those helpers dispatch through
sunxi_nfc_exec_op(), which performs the same selection before executing
the command. No controller access between the two selections needs the
first one.

Remove the duplicate calls from those callbacks. Keep selection in the
DMA writer: it accesses registers and prepares DMA before program-begin,
so it cannot rely on the later exec_op() call. This removes redundant
setup only; selection still runs for each executed operation, with no
new cached state to invalidate after resets or chip switches.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 993e2efcee04..45172175d4e6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1685,8 +1685,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1712,8 +1710,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1739,8 +1735,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1769,8 +1763,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1794,8 +1786,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1839,8 +1829,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0


