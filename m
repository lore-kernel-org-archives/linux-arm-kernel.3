Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621CBC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Y8ZddL9dHiRh8qGBH1XBVf3Fk4YPspd9rKTcsO7FCo=; b=D8P9oTdetbowCyfPemS2me0NIh
	lph7hc6SG1vJP/46Yn2q7Ugo0GsJyLluLewauX1M8L0JsmHIcHoS3ylWkZMGCxrPHQeshWd08LKXK
	QZ/P7DH+7cUpAzZhmfEiHj/l53GEMB65+GlY3CWwlt67Gwf6Fvl6iq2b2vBDLhzSBIv5RjtVPDKEi
	RCI9nvzIA5cw2Kg86AlV/hGZJmHvKsNyRGSSbSTWU7a89DYk494S8dXY425BKxZ/0+oJ4MiQu2Mxb
	usdsS2Uvp6j6G0tN10raQ44UUK6hqVes7hFED/HpyLO0U9TS6iF2WEEs8dXpEqelpdHqr6Kfl3QOG
	Q4Fz7nUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Diy-0000000B7M9-1HhQ;
	Wed, 09 Sep 2026 08:32:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Di7-0000000B6VL-29S9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1Y8ZddL9dHiRh8qGBH1XBVf3Fk4YPspd9rKTcsO7FCo=; b=CS22lvd4K+124rDy1vr9mgAtdL
	ASiIOrsv0H9ouhASMPH1Bxy4OISsOJclTDTV8GF9akf5wNRCPMNHgBxDRytD1twMPdkyTalcvXZIm
	57QjWfBzFoAytjjacrJauxndIBog2Z7/nANSVV/HUwQOgTDlvwrxTwkJPXV6uYLhzqJY/pNiC2Yw0
	ugq2b9nlB4WSzSLJvU9mhBm/uWs1UyghqnPdgr7cDgEH0WQft//zuHpXgbidEV3ymGDF6Fx5h9ik+
	NgJHndbTGPQ5mhpvXjvBUXrVyHfUjSD0UNazt2gBOIoEMFZ5VepsdxYNNpfy1zq1JzpKOAuoRvOHd
	blAKT0WQ==;
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Dhw-00000000ulE-2wDO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:11 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-8009036d745so1101835a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 01:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942662; x=1789547462; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Y8ZddL9dHiRh8qGBH1XBVf3Fk4YPspd9rKTcsO7FCo=;
        b=a2c0PYCDZTbzwUEcaJGDtUsb/c6+P7DeSNZCG8RVCsjmdgWNlWvkGefcKh3/W4pUgA
         0LRcEzHmFfEBZtcSVyLw4huL1KZWZlUQw/55/fLVZB3jRv/eF7m/u9AwSjshCKHef6ZN
         dOEhc1/T9YATkGij3ja+PazSVGwdO5PPQBElYexUCphwLutU4qhL7LyEPAiO0MPWnbTY
         6VfX1kAmA6R84+gfWD7CbvUxJaYdE9cQ3UmjYDmKOBvaYfw0Mb5xwkEXumDSYNFyfZ/B
         q5b3FiY+bVZsaTQcawFGQUHX4isM411lAuqom1XJl3TGor3ucCnvEfHaz37z9f7kXRyw
         CGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942662; x=1789547462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Y8ZddL9dHiRh8qGBH1XBVf3Fk4YPspd9rKTcsO7FCo=;
        b=sFHsPLGc0JM9fxrIoNEQz9GbQhn+YzQBmQJZl2ULqAU76fFPWtwSjhbBSB8CUXfAMi
         cCr7Ff3uZ7W4cACPdq2hrPIym099cWNcRto4CLnDSOub7+owoVPUDFkk68hC9giY+xSV
         cEVnX3zsS1IvZUtleGV++rDXazVbrmWmUeQUMTrla4B0++IDoIIHVim85zhcBqfOcJA6
         UtC9c2QTgKpf6FBenDOcnTS7iej1MXWfF0jH/y/jhpngvkVr7ptmUnPDDKslmI1WVZh7
         CDd5FAcVlR0S4TUV4u8hxGg3VTy2yT9HqJJ+ITRgs37YNQEc+HfWlMeKdjbovDuewgq7
         bRdQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8EucIoGdNvOZKG499nmdJNvUdWvuhUWgNUH3DXQVPYz0epnMX1LP93PiTvJL32E3lYQMSlVkD/E0rivUM3XSB@lists.infradead.org
X-Gm-Message-State: AFuF++kKjls94Q3Ts7UBtccatE5GBretoaIYP/h9LZwaOB4Fhi7Ln1nJ
	bBXfOLmP3s6wdoEROayyyvAHnrmcgxAALRRzVMvIOQNq3rrDFFbQ7bXF
X-Gm-Gg: AYBFou3aL/w2WqCw/i7nZp5sldSgkvsq3HDYo7KUGvr54FzZYSHBIcZuP2NntZwDXlS
	jCuz0GrIrBcA8yHjxo3Bn2HOX5sBZDBl0FZb0PgcqCCNagvbav6eKDQIHrJv39JKHr4jhaAaAEf
	k4/SqzRRVV/r87uioXOawnylFt9Tx6GP/D2EdOMKQNFWtHMD+CFQKeCsnOK2fRzLSfHXjr2w4ml
	yG4FDd+9sMd0SB7YFJYUIGklwU9mf4c0MSBVAxMEhDY5/YRDMHF94C6GWQQv0e5dgBr90b1EVjq
	xe5qUSQ6axQVptVKduljXeQYXsoHnpaSTJzKQyCD8n3eZgB5Bo180xoFr5TKWpqY+MWgD6sz0Cw
	c0au/G5cn3MUkwb39A+OBwXO3LlYH8WJdHGptdivNoiUF5711qytwDdieiWfJuppiiD3Jgx54U/
	dmlGJRSu5b7cVPb2N9WiFqZCt4s6IRnSUTy279+5ir+vBg8GX5vvq9iJJPdkRjzoFdylJD6BDPI
	iUtT5JfpgEvXr+Nb96YUDCVyWV6crLpDsKcEwBGxNMuoqvqVK4dmYva6ftWeEj/k/COihBFX/9i
	c/moajkXZO6XO7evnoflVj08MkkFgoZ1awHylzfibWD1GMh/cShwL5eR6zcL09fPt69XWT6wt9I
	qeliqO8IhChd0ywpFipTke2TJp1tU
X-Received: by 2002:a05:6820:162b:b0:6b6:f16d:d672 with SMTP id 006d021491bc7-6b6fdfb6581mr30282006eaf.16.1788942662447;
        Wed, 09 Sep 2026 01:31:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:40 -0600
Subject: [PATCH v3 07/15] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-7-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093106_234526_F60FA134 
X-CRM114-Status: GOOD (  16.78  )
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

The PIO write loop tracks the absolute NAND column in cur_off, while the
extra-OOB helper computes an offset relative to the start of OOB. Comparing
these values directly always requests a column change, even when the last
ECC step has already left the cursor at the start of the extra OOB bytes.

Include the page size in the comparison, matching the extra-OOB read
helper. Keep the explicit column change when the caller does not track the
cursor, as in the DMA path, or when the current column differs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 545da54b8908..16b2b39524a7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1497,7 +1497,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0


