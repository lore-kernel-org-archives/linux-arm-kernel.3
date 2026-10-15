Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA9DCC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 01:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oafE3Y1G60hqD5AuR17ZSRtdy2A1IL7jrwTpft1hiNc=; b=3dV5EilGAt1ZfKsKNZ+z3kejd7
	2RGx6gWzx4JCFDkEYzKpF9je0lHSYa5oVqrBLvXVMaqpw9grbV7ZtUyZmGTRn3KCQVdAXK6pqVRUB
	R/ZCoCo7PS8sCOBvTWp4ytxyr0PqNEea8KUGrGaX9xyCfhPWAq1ygDVI2/9oYOGfBFTdajP8WwkcP
	3OKU9ogv2aiejHxBF4d16ZwPQeJ+trx3rWyodC//kyKFMcbg7IMdrDxCRkBKTyYP2fLtv0nK57kwS
	/5zG1RZkSGY1ixClDiN1Us8T4HrZ36hEc2FfhYB4r6fNz1Ul6JAFz3C4T0tu1JBbyNYS6tpUOsaGn
	DD1U00eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAN0-0000000GZDj-1RXq;
	Thu, 15 Oct 2026 01:34:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMj-0000000GYaG-25WH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 01:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oafE3Y1G60hqD5AuR17ZSRtdy2A1IL7jrwTpft1hiNc=; b=JQ27Tke/GzaQQ7WghQdahr2u0Y
	skF49G1HcWK6meXzS4p/eukz3JM7mNPj8jJuaq3SvoGdm4FfcehNPPC0PHPGQ8v936szijRxlaRG0
	vVWOJyqwmyf+YC7eZ+W+CUiY1y7NizAvqStouUdCc3vq8ugHXYG2JbXxq+HTYqpRWSoJLE704rMu7
	IM6UkmlrUzJOhVMOKbEX3UwXNN0171VKrxFhj/aAZzxvN+UbovYy/OoMDAyaAz+F+KcSkyMQkFq1s
	mf1hghewcRfZ92UUGQKgFgLNRHg3zXro/p4c7DNHKNSLtWyW/TSSK1ptqWtbyqSK9MGOPhhq0mTG8
	KxoxHQLQ==;
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHAMf-0000000HLa9-36rc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:39 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-49dee4c5427so410902fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 18:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028076; x=1792632876; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oafE3Y1G60hqD5AuR17ZSRtdy2A1IL7jrwTpft1hiNc=;
        b=G92dtwMHrgpIMONeAHFfXrrB0VdHDOr9oxbsZ8QCq2Q6Fyb3Bywp4vLTpn+H/Th0Mh
         wP/NBPI3lQ503Kqe46LAd1667h1Pjdfi2mKRipkXLQr1VFIJVuh1Fq+DLEd8Uo9DvbO/
         qWQvTtAso0SWWUBVuhKBQl4nHYfNRUZmRbDNRSOM+YDDjLtAJJa5Io+8giKYlelXZC4y
         j0uLnvwmnIAuDX+/InQv4QK3fWtB0rIxGqbj78wuW0j1wmX3HgiYZbeuF/X14E8tKqlZ
         mMHh4qJhYWaTwDXi0lQh840DDJJ9+Wo33YcnQUqaqy2oRKZsDBe3oBPTNBrbPGGSBKY+
         FSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028076; x=1792632876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oafE3Y1G60hqD5AuR17ZSRtdy2A1IL7jrwTpft1hiNc=;
        b=xhxh799Bpd6VCx5445QHS8sH+dNKGcH7ZnbIuL5c1Pp1vOfbgTqvhPZthkrgP06CEz
         CIuyv1LpK5XHO7RNiPRtwAvqbbq7/FP2T8L/TNneDieBu8aCYMKqb80mvu68e1/PXRDe
         rCEI8LyCc2NA+Zf2eMs/4YrWu1h4bNzg1GvjWso6fDuGr80GxQDlwXSi65fpobVdtIIU
         f/zQ4KeF8t75S1k89SOMjX+7vv6HCqUBDK4RryDxcC8bx3AGUTgJ1MyETKZkkqYMy/Go
         ueDEixrGmheSNHPSx04x8ww7qrg03qIdKXZogGEEnuHgpARkaHD4DesvfrlMUjHpfHb7
         /83Q==
X-Forwarded-Encrypted: i=1; AKwUvBxppFTw9jeZcMHmWkMe8QE+t9FeG4SKrfbz6fVwe8rwkafhPt4JwLA2ReetdTc+8ISjWvwJYN95Uy+mt8FGbRFd@lists.infradead.org
X-Gm-Message-State: AFq9FYLWVVHpsGC/oEFV3g1oVdWGHPDEMURKLDkL1Nt3JQ13yk7+CNO/
	y/DGqaT4KE1eALpJnNTFewaahBJ2D87Z+gDCHEx+y1LGUmhYJNO/WxOp
X-Gm-Gg: AYBFou1GFXcV4K5xcKHCsOlIOFUupvFF+bg5GQy0t3CO4SvyZDBL0pd0bUCeRFAcV1P
	5SC1thoSJRJGrK4wKhfI8eRZLdWjeooJj8q9C4zU9pLIcKIBTCNIcdC1k9ZhCRE/CUE1/m7+lFM
	6p2de61aG9wrzQVSBGIrb92cgxD5R8YeGf9VmROGSGUX6uR4KB8/J1VRjdltKfEkCo3huCaKULB
	aoXumNHFgQvnhRvKZ4yCiVNK1Z2/QGkhljSJpIDBj7O/ZQ6fWUarjt1xGxzo059unkGY4rKCdTG
	+67ymBmi4+mxgA93pg9/g3LbqnAyBQ8Q4rtp7MzXzwBoDjjGxNlUIZhRrzu0JWaHhde+o3gOpZ0
	YwNfbz8z/KpCyfExpy3ndfV/VjZLzb8YlYhalP3mYE9ZMLMtUWzfd/19ItqeUK3qtUXfjxDSYnn
	26xT31OPvF3T+tnN0t73lvSzr/BpGjhmr1HNvOqZ1GibaG0CvyhPgEBOmJw/L9nkAuv7rH+BXfE
	xoI2pRXpcmzb0BLBuHK+PeItqak0U6obgamqIzWgX6l5+VktZyn7OdQYPKcn5RUs0BeTcXttA1L
	8ztolUZf3scfiK/mzAKrB3zdhMLL3whXSUHD+bolqFDjeuaKiDev56fLl8CuOqEueP13Ik9i5UP
	IzK2wccTfc3hqrbsD9vin
X-Received: by 2002:a05:6871:722:b0:48f:e0f6:bd5f with SMTP id 586e51a60fabf-4a2a8b0964amr15694991fac.48.1792028075784;
        Wed, 14 Oct 2026 18:34:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:34:00 -0600
Subject: [PATCH v7 13/16] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-13-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_023438_415229_02D99BFA 
X-CRM114-Status: GOOD (  13.46  )
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
index 74fdca27ba10..4e6fcf1e7aaf 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1642,8 +1642,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1669,8 +1667,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1696,8 +1692,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1726,8 +1720,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1751,8 +1743,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1796,8 +1786,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0


