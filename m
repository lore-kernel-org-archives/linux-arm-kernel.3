Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CCACCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 19:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0p7Kisx6irolstjhcUjO1VMqHlDNV2glsnd/sNiGR4E=; b=Ajbyf1EZWV0aQBWy1pJtQP3P33
	xFUmyBsiOiyeiCx6yOc+enPAJ01RzXvQuiw50sPCxo6YMn7x+fLyondpQwXloNyg6nS6o2kWIch+M
	jFcbSUMGr1w1JuWHAI+bT1M5dBm0rnrOLoYnSDt6YDe79xNq6/pKmYQHePl40Vb/tr55QU3n0+6xU
	U1MtD3YWi7SuGYCr5lWIxLNyG9Dk0HntYNFb2gnVU5zr3gmK7J+TwWKCKzCNNRtDFObERbvitAxXP
	AcoCDWYnAlaJm9ptS0hZ5O3tPD0rdxrx6PGPNB/d2FKFgm6Vh4e8e3OLujJI5GiBMQrxhwjV5aTDC
	8xkaYrxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMJ-000000058x3-49lq;
	Sat, 17 Oct 2026 19:46:24 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMA-000000058p0-3d1y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 19:46:17 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-53ec2cc397aso390714b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 12:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266374; x=1792871174; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0p7Kisx6irolstjhcUjO1VMqHlDNV2glsnd/sNiGR4E=;
        b=JtGzyQ1Agsxx1bvVp6gogL3FmIi2spRWTxfDH6+2FRPzhf1GmWdzqnilQ8ctXhuk3F
         oI874Aanq6bHI8Kh6yW/HdZ0sugtPqPbicQ7hTtfGOMuYIEDNdveKviNqV8VAwuwgujU
         kz0fuTBSHIjdmFm8PJSqQs7w5J5qlPO95tV47SVttKcsMKTo2LhtLVj3HqkYKzO8F57Z
         EGVhFed4qaF8wmuyxM/GOULP2uwDxIysXdLHOmXrBTwAGqTH9emAqhAIk+iHgwpBaHbN
         aeM5oDLh7tnhNLXAREcs82C4SdLP7wnUS/RECUyeLh/zrZl5HAjuAGTKTedAQY1f6f3u
         ufLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266374; x=1792871174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0p7Kisx6irolstjhcUjO1VMqHlDNV2glsnd/sNiGR4E=;
        b=stFOqHtDg5sE8XoR9SHU8fPc5A+zGIp490YdLV2f/o4YhO8FA2nocR5S9Rj3OHKxjU
         BE+Q2Q27gvY0YnJpjUyIoNlMo6NcRfEbW85CQeXhqW3i/HcEqCVYvMkeH+ZGcMFOlp32
         xpenQaNKMKUGATgZ3vkQCGHSHGxBExP42XRSBUQ0f3GGdgUC7Zowuy/bq0gy0gnOGkyZ
         2465MgSnR7b9X0ACK3MBoXXxvWa4KHfQ7Xj4xtqayDbKr3979xuq7+K4XolUzXmyv8xN
         by2UnbSCGOo5t12O4ICBFXH/IHCFmmEF5Z7VdDRDclLHKIBApEboR01Cp9IKWJSbh4+u
         JPwA==
X-Forwarded-Encrypted: i=1; AKwUvBwgEWsYI9zHMw79hJbcx0YGiDc04XngsAuoAZT+DXrLqpoW1Ahe/zEL01uUrnJNcW/fZGPiIxD6Od0/0myzMz1k@lists.infradead.org
X-Gm-Message-State: AFq9FYJ9oCDWA4vQ9dhZBLQ+Oy9ZDcB2DozCa4VfgzXyUxDs8d4O3g4h
	PZHdK5nfc3Q73jZ0saKVn07ysRDeQoXgnAARN5vlxV05KjyqpSpcthyZ
X-Gm-Gg: AYBFou3N6bAFPOpscq3vNG9HLQPbYrMpbJs5IM3IoVnDSJDwSnt0jxVVGm1/osOGSse
	hxpoImmKdzubZiEAvK8zzGwoi7IIaEBOKLcr2W05r9N8LlOxKfht/5k1qcYRzQQlO+92B3z4VDO
	AVgLv2Z2LPggs7BxOVP/K+9KdFb3pxejKWPncry2tJ9k1VD8tjQ69QRwFHoQsdq52EylkwQSJeX
	Qtvcl7zSvWy97CnY4hUFEBVfifU3d8Ai8THPS6gWnVJx+eb6frKLPKkuPu69ByaLLNWRBBu4AVI
	/7olH1DExsEAwf4PUPa5qtDjJpGPKNFbauNASj6iLH7AIllPcdzsp2QsQt4WuLrtuQOYAF/DPy7
	e1C6+YCH794pipfxvJNl1UeNuzk+CTWKWbvzDVaGrlDTqunZVS25JY1CA3oC724KKBjsGd2gEeP
	hR8XOx2YMPTSb6JncQ4yMTqirX0G5Bp82nLWUJ9BKE/tUqiKT8EiGin7tGzjYzv3Ws04OGQzcOh
	xjyRb4iVv5vgoGDaE10lHz8lCCMtvmNT4REaiRlQ8CTIgZmvcEN2ZSwQuG3bOpd5tHWmXkBgonC
	ioFRXwZznIOw9q+FTLoVnoEDugegYCroO2bfZ52YI2kL09zGNtS/3+G4h+iAQDl1RH13KWXaz/U
	FU54+rEM72R5t+xB3L9qY
X-Received: by 2002:a05:6808:30a1:b0:4f0:a3f9:9f89 with SMTP id 5614622812f47-53ccaf1dc47mr3423128b6e.18.1792266373854;
        Sat, 17 Oct 2026 12:46:13 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:45:57 -0600
Subject: [PATCH v9 02/18] mtd: rawnand: sunxi: reject pages exceeding the
 ECC step limit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-2-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
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
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_124615_602178_70199316 
X-CRM114-Status: GOOD (  14.08  )
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

The controller has 16 ECC status slots on A10/A23 and 32 on H6/H616.
Hardware-ECC setup checks the strength and available OOB space, but does
not check that the page fits those slots. NAND identification can supply
a larger page size, and the NAND core does not enforce this
controller-specific limit.

If enough OOB space is available, an unsupported geometry can pass attach
and reach DMA code that indexes status and user-data registers by ECC
step. H6/H616 also represent enabled data blocks with a 32-bit mask. The
number of steps must fit the controller even when their user data fits
the register bank.

Reject excessive step counts before allocating user-data lengths or
installing the hardware-ECC callbacks. Check the final step size, after
strength maximization and the conversion from 512-byte to 1-KiB steps,
so valid geometries retain their existing layout. This also keeps PIO
fallback from accepting a page that the controller cannot handle.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-173724@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 80006d1a33d6..bd2193d7259d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2230,6 +2230,11 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->bytes = ALIGN(ecc->bytes, 2);
 
 	nsectors = mtd->writesize / ecc->size;
+	if (nsectors > nfc->caps->max_ecc_steps) {
+		dev_err(nfc->dev, "unsupported number of ECC steps: %d (max %u)\n",
+			nsectors, nfc->caps->max_ecc_steps);
+		return -EINVAL;
+	}
 
 	ret = sunxi_nand->oob_ops->init_user_data(nand, nsectors);
 	if (ret)

-- 
2.53.0


