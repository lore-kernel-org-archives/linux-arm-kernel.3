Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1406ACC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 04:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzQcb2tw5a4i/pk86YXUJlRkyNKtc4irBMv9ftSpeS8=; b=L3/V/TS0GmoIuETRTzo4HQ/uic
	3tpXwnfLN7mgaaAUoPpsi89tuTqVbfStjiweSIm0MwCyVI6od9ikDtAwRYMLqvflNFHo+dnsW4G5w
	Ff+BZP8dqIp5gjjjahJMvSf+zxsCoL5mBUpMhBaNhyLFVDddyRv8uJAWqdPP73VMrkxnJHvWAqatW
	hSYQPeGRCeJrINvXVJVb6Gv0zuucz8ecQMVswGFkgbUW1yvv4iQnXFWqCcVBClEF/yyEAPK7PW9dI
	iNPUM9zCqugNBbmZ1wLCR91B/r5SJ846Zwu/z5iGdJcXw6eSMlWDCRuXU12AxseFQIl5yfPHmrlF1
	WhF8qPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtT-00000001t5x-0jFu;
	Fri, 16 Oct 2026 03:46:07 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtE-00000001sdL-3za6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:55 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-8198a3a54d7so687036a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 20:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122352; x=1792727152; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzQcb2tw5a4i/pk86YXUJlRkyNKtc4irBMv9ftSpeS8=;
        b=TDuoh/z45boEMS0NNdkRXShxscS1Nm3tNAsSXTIIy09d5hftE3DpdM6pC+bbLdbp+E
         lx9Fg9Fug4qgIm18iztRJB+/slfsDvxUWp2DqOEzsUxxdULW7tSiVM73P8MjqvdOfwi8
         Phi7qdAmaXwAs9trkw3fNS089/dZKeg+Pv3+b6MZT9GY6voxdrusnVs9hD+Nsp4CQNvM
         2AKIGGMnwIJPAuAz27Xt+um0v0RquLrZaXpvDEnD5Y3jqnO6o2X+V8Jh1nCYTDfXJOKe
         LB+YZBQl3jtdDmjU4TRxMc9DnxtKPSpVGZgfVuagjRHm9tfY4nVySSrqww9/H2MMF71d
         3PJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122352; x=1792727152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VzQcb2tw5a4i/pk86YXUJlRkyNKtc4irBMv9ftSpeS8=;
        b=kAb7u/f+Tq+g/6ZPebtqUt17X+4HPS6/pOu2erfl1rhxtMgTSytm8eENJdfUYCmVqQ
         M5sT2WvzhQ4vjK4MmlaAMNq3GNMPhWOqg/tgUqjCCiIKlpqTUcoP8diezJ+wOpDMddiM
         Mr+y2AoJTZTOsaVROg9GIoemG0E7WeSKYT7m/OYmyFn65+bYVCnsxtthF+4SoTtLnzSf
         fP7wIQIE+CxglZ2o3cI1ak/IvxJ+SKofxoqfvRaJgP8RRilVrYmw7EcWBmeiP0wAAj9S
         dsDzgV+O5fKiWfInRBad4Bf5PD37+I3bCSHt9pKAQcswErRhnM31+t3HxuF6Ak7xxjDN
         XlyA==
X-Forwarded-Encrypted: i=1; AKwUvBxRtZrVKgckZFvwuR7Zs12jrCuUzXEimDGzArqcmJzmtgQFB/S0bmegDfFXwPmWcP1xlHlaajXOb/A+7k6VP6Ji@lists.infradead.org
X-Gm-Message-State: AFq9FYIQsn026JQJHNt9eom+u+OGbFWn8GktMqulkh/gVw/gxXOj5KDA
	iD2BNCoo2RZssgr+pa1MwMGA5xBc3O9TlXiJwtX0fAWpTI4Nus8caoaR
X-Gm-Gg: AYBFou0jm5shUOyiW7ovPHUqVhixe0SS8pGw1/yRrcuwqkR8hQjR00et83Bv5OX6Kwr
	CM3+Qc2ssWXLGJQK47ncH+snNAMbSojrOfi9iLM1ThGCOoKpFu1D1531VGBmjbwAzf4IbAZz2mY
	K7gxAncYQpr+cTa1PwLmQ3i66cpK+JFuyM4xI4OmO37GD/jjhJbed6W90lmZPb6kcUQLFr1CZiw
	oDQy7keOudl5+E9W7l5XlH3pNIkuxp9L44lfCaG6xetPhve5GDc8OGKUsO6RPcJj1AJHsIq8Hk5
	4b2QUhatEkiggxior2jfCclhmJtt32yag8h9dbzkuqp7w3j31NH6YKNz4bhCiWpoN4JK2meGYFX
	El63xO+CRdCYWew2RcJ2BLxP1TYG8ooKjUpdh9bW/I/rt6LEzauoGHyPqV8z69msm17uRNx2vDi
	qUkqWOhICY/CgEefricB39fWfTQxC7zTBvEfHhmJeSdMkeAg6JS4ITq+17/EOliOoASe8RBwlCE
	QRcTGMo6pgqFu66+5XFYHgPuvrZRAe1lwkikxKFpQemxSCnN8JZcb47bh3RHB3tBUCIRODOoHei
	DC1wKH1Gy6xS+XNH/GUsELiVWNj8lEFARr7gNaRzuyK46R0Yz9jU6bv9VO8MEs98Js3H1Qw2uhW
	TENgd5FEZitOyeEQyfwYuXg==
X-Received: by 2002:a9d:6241:0:b0:843:39a0:7a8e with SMTP id 46e09a7af769-84339a08521mr158641a34.21.1792122352163;
        Thu, 15 Oct 2026 20:45:52 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:29 -0600
Subject: [PATCH v8 14/17] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-14-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
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
X-CRM114-CacheID: sfid-20261015_204554_177296_7B8026AC 
X-CRM114-Status: GOOD (  12.70  )
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
index dfb2a64c6b50..2a9fe89b1ba5 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1650,8 +1650,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1677,8 +1675,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1704,8 +1700,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1734,8 +1728,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1759,8 +1751,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1804,8 +1794,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0


