Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D724CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 01:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vV+y+As1/xEWZJVIUOnWi1zmF397GSE51b2dM1xKJWs=; b=mt/xMXUvnTXbhSVd2q+/VT2bg+
	UI8AMCeQatpZJoueSIIl6Q2chILhJZS0ne4B5GTtb3Xj3V5OR/gh4fTCYinkyf5PCIwMHvy1zk9xu
	YKAObX1VtVcavj3twSOnBnEeZWeO8frR9ERhKSqXt452UQUS7XDYMaXwxBDmeZimdvc+fozxz18EG
	wKD9Jw7/eHZWU5v3vSngRW1YlIuRgHaO0h3mxhYB+HuslVYDunQIKS0VrslONWj8Q5d/BdNu0duwJ
	9syb16uylj3P91qw+V79WIaI/QH8HFaAcuOK52NASYRpowjc6C4yd1zMXCPGcGjOvxJ1pc40OcFMV
	CFifue6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMZ-0000000GYLy-0ydC;
	Thu, 15 Oct 2026 01:34:31 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMR-0000000GYCB-07qq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:24 +0000
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6de1fd5f572so2116988eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 18:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028062; x=1792632862; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vV+y+As1/xEWZJVIUOnWi1zmF397GSE51b2dM1xKJWs=;
        b=gZN/a7+abz+7BjZoY8qeDsa+zaQqvccgPqLXCfSNio/8gVmglSDyesAtOxmoZ0cv4n
         enFIw2GUGtu4pZ2Xztw+FYiuKCbmQyIi4m3e9hNNbK0uETze9GA8em/UXHX00MXhbPj3
         9ibpKdje7hbhfNj8M6M5UgAfV7DeSOEdP8E3rSSG8kAskMh6UcxSsgHkHNKaWzOrVJcW
         0ZqRTEwch26M33eHZj7y2BrF8GkZDxzXacwJMl9idreWW0GLnOaAWRhFXJFJbMWkeS6x
         XNZ/HIo0Lw2d0bnkSap8qGzp3GeCRjaDbtCq25MlN9YimTrH6gjOcjfTOpMvekdMZFEi
         tctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028062; x=1792632862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vV+y+As1/xEWZJVIUOnWi1zmF397GSE51b2dM1xKJWs=;
        b=oYNiQ3PmtGJW6fW4WcKOSuTodcw3pTH39eoZxAYnbm7lXktA60vnjLWzF9Sku7BZir
         D2jcKdmsG29TttPBv12VOiRejxG9JTJu8AF2PBvmGtuHtHtkewNpLz6jg60ZCs2f/WNs
         alxG/qLiXA1Ze1l8DLcVLUCmMYEGCYChJAXomwbways152fvS7mYond+myooWttaVNu9
         pdeVB05lgMOgZVd45Ci1ZCahpGs3JUCxffS1ev8dkQcQzc+M96WZatZ4Hi0f4hj0oUum
         qvNsRO4m0R9yc1ib9qHXwObn8XwXkfwcA20W6zhP6Pafs1BSZVNVedZBbC5gDHzwcY33
         vxkA==
X-Forwarded-Encrypted: i=1; AKwUvBxYt93/cdaPHy1Ik+YM35DXqOEzRstJSSkSl4q6eTqwwLMV6Vfe1usjZ/Yz4voXiGnGG8xj2sB0hekPQ+aa2NxL@lists.infradead.org
X-Gm-Message-State: AFq9FYLyEWgi/Pfr1PMGD7+eS/tBETHjq9Ith/MYO0Vn9yAq3VIAvFSP
	oYQG87R4bIYuvswDTc4i4N1/M+mNPlNCYcIZJ/5Jtjjvvv8kAcvvGM35
X-Gm-Gg: AYBFou2M7xVS9h/tdlIoySzC9eyJVC7toFpCkHT51wYacvkB+ru6cZEU7fFMXi6DiVs
	79/hGbU0QBjyaU5F4oxwREeua+pUtes+4A6SAgtxoDJG3dujuKWvEnRFy7ZBMguteZ95mzex07i
	u3iKs3slxy9B0WHV/q2LTblmElgTF7Iv1y2YSBJbVgPqq4z3xKpGIR6TPSe8Iq1WU/LmmYCXCAQ
	oMSuic4epPIaAPpbFHETU6QvlyWA+oVW4XQ22FgjUfNHjSMCgVFccCanmqqDtk1mwQliyYDwx6o
	XFTRqr1//nUAcdeHcFwTsgYmOorx0UH9I5lze2ZyxAZV48AuQYS1CfUkuG0lAKO+6n/ss4HrpD9
	9zBsldt/nVGSpWG8Ig9DcDVuGRSVtPvqaQQINaq6so6nkCX4lNHuctvJkHI1LAtxZlHiz7YCnaR
	vmLigBwJJod92++eqxD2m/zLCwK/sr8fhFyzqndxaNKneoDtEt3ig4dA+pF9qnKRkdKfXZRi1Rq
	+HSqf+yfv6IOGhBA4fP13Dzo6saXCk+wYIWDype2mQX7yIidB/DVEP+XGpLr1q5KK+HtEA82Dzf
	1NYJKbaodZlQdtrD20dyo2sZqq4lNxKN7Q9uzLgOvdEi4VVczD754A6rmmUU8x0B3FNGHqa60Ur
	jxeMG3hbnLJIHFODI2cPV
X-Received: by 2002:a05:6820:1517:b0:6cd:3fdc:a936 with SMTP id 006d021491bc7-6ef1144ff66mr12723501eaf.83.1792028061915;
        Wed, 14 Oct 2026 18:34:21 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:53 -0600
Subject: [PATCH v7 06/16] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-6-5d3fc6ad2da1@gmail.com>
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
X-CRM114-CacheID: sfid-20261014_183423_092083_0AF66528 
X-CRM114-Status: GOOD (  15.43  )
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

ECC exception mode recognizes physical all-zero and all-ones data
blocks. For each hardware ECC step, a pattern-found bit says whether
this happened and the corresponding pattern-ID bit distinguishes zero
from 0xff. The correction helper checks the current step's pattern-found
bit but always reads pattern-ID bit zero.

PIO processes one step at a time in hardware slot zero, so it is
unaffected. DMA processes several steps at once. For example, if step
one is all 0xff but pattern-ID bit zero is clear, the helper treats step
one as all zero. On scrambled DMA reads it fills that step's main data
with zeros and reports success. Requested OOB is also filled using the
wrong pattern. Conversely, a zero step can be classified as erased when
bit zero is set.

Test BIT(step) in the pattern-ID register, matching the error and
pattern-found bits already selected for that hardware step.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 57df88099206..8256982d1d56 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1101,7 +1101,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0


