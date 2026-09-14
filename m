Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB03C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=; b=JczP5VsPAGwgbQ05kmV+KBf6N6
	/D5epksQbjxOF7GZ0caPHpt1Znv6s4ENhcrN4CYRisjde3S8OAIS8s2ErxNd44iYeQFGasegFF6nn
	ylAD/XXLzbD8c9Phb/YH+6oBzLdaOLMpP7qYEktI2BVQiFR/LY2NcYYHsovr4r8e1qJIhDHZy9Fn+
	98b+WECp6nprz6oxLIvdNEHAo7QiLTMqbLfxskQGvT/mQ11z+AKiBKuSNpJJMrWtjM1i/R3cw436U
	M2VEQHTU7uyfOk1akFNGCR+Alwgjna6WdurbHbxgaTNGPp+VlGaFx+BPu67+R2sGP58c668lPkyg7
	APj87y5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wx8-00000002CnZ-2rjP;
	Mon, 14 Sep 2026 03:01:54 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wwz-00000002Ccm-0m4H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:46 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 46e09a7af769-80527255583so409291a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 20:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354904; x=1789959704; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=Q4vzQv6pWUOrfnty1o/mXybynBRHyaVbr4gdlrvDCmd8xQmPi2YUm8j9/A3GDODtWi
         6eK/Io/2fSJ0wZ5ISvEdRWfzT4+ew4gcLsFe1UX63DY+cK24mqhy/un+PJMbWPo18kME
         g3Fge0f7C/jXkqpKkaN+gcvEkWxMWJYNC9VD3EfOnqmcDrKU7CRubX8CZDM0ksg5e8LH
         Gc61FZdtB5d92a3ZsGDCqHpJUc2w3lHo/VBjZa1gHiReIcVgwuTi5gSRHBQltSpenEXa
         UN5gGk3fOhTL10Zgj8bj5D+Q4g2Nw6x71Qge8ngiIkgoyp77c+GzLOA/fUatZfVVSzmK
         AKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354904; x=1789959704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tiLR7FZzQsyTOBW2MGeS5ZnHrzID+Jy7EEHyMHP5gI=;
        b=T6m1Q4d3uIiwW9o8J2S4+cMXbX4PJ6/Nr2UsikFf7CJyGQ7VAL0BzToFIjxxgIvk+g
         lyLUZirfMOqtJhzGZxCoVcH+tei3ORn0NyVIth+gKcwUKYz5XunV1r5CQ7qt4ELIQp2p
         RrQWmttgZ4fHUVZ3znRqzsTXR8PN+xNfNpdo0rvchvyV82m7rw0ym4y1VaaluQUcIkBw
         kiYmeQQI4I3XJZLp+qFZfET9vZIbNAcg0P5gktJvHJLKlNb7rQAz/rgV4on8cmv6cOC9
         o+qULakyhmNt85AU5qMYVidjbo6BD9fAbkyBr9j5Vl3W8EkHxhfbWuLr6JZQQu1/i8LR
         05Pg==
X-Forwarded-Encrypted: i=1; AKwUvBxwDz4SfVpBA1TDbSM6dbSc0jYICouaa1n84tTJNZMCCviA6OMJQO+p3xt7T3J66VxyMOIfdBSe39ZVjTw3hnr6@lists.infradead.org
X-Gm-Message-State: AFuF++lvaBU3N/ZmOi2urdm0YPLKM7E3/qPX0RbcIO+NjmKFSdsM2UFt
	g0yjvgWMXQcxMlRzYjKXAz3tC1gbhRiToX/eCPzAGDRNQQX8Dlb6tYDl
X-Gm-Gg: AYBFou0mbhF6/51XTerlYQyIPPsaYdQwxLaCvmcC1YxQTMUi0a4/hFiph/V/fYdIXBV
	dlvtcBO+qLYKFHlg/9OnnA7ngxgF+s9IgbUILCZNvN/+m/E29rqMcRaJTmj9n1fP0nsS7fwJrhr
	DDGkyUVHVkKiph/k2r2jwCj6iU5FuPLaFg1R9r15Vq7d6CTP/MN/KG4KUxkvTaL7nr1/7UnYKMx
	0aJkrExoa1q+ICOOPHif+IPa+EvgCJHbmFHtCR9gOR7imp66/++Ag4igmy6kTR46SOIOWigtppx
	cgWFyt+w8ubVqhVfUVyx9ii5WN0ZqBMkNPjoZ3oLr1v3sr8Wv7GY58nuJJ4UhdetnjJBBNxPNvt
	Oz2bSEOGE97Bz8Qqqppmg9f67uBi+oc0GwZBWJw9JHMBN6cZTOwvYtaYynDHFyyDnCaom3Plwka
	4TmknfziUctMbMGI2gWQekeuFixKIUCi4oGtmTL0m2CcIsr1808APSQDnLli7zi2edoTpWpX6Pj
	GJQZL64P/NmoJDU3d40HtobmmSUoi8YK/bCL234SeV47Ga8xOrHuML7UMZYQzHGaPFtO9XpP3Cx
	31fIYqOcF2AG2YIRxad6XNQR9Dus/dSOtLHUtQRfteiChyBZr3ZHzQT76tcZ9/8B3uQS2LNb0X4
	O6bpI1SyaBSP1vC3FzTN/wqQyg4vwBQ==
X-Received: by 2002:a05:6830:67d9:b0:7f4:eb76:8820 with SMTP id 46e09a7af769-80897e81b85mr306525a34.13.1789354904353;
        Sun, 13 Sep 2026 20:01:44 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:11 -0600
Subject: [PATCH v5 05/18] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-5-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200145_320513_81045AA9 
X-CRM114-Status: GOOD (  14.34  )
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

The pattern ID register has one bit per hardware ECC step, distinguishing
all-zero from all-ones data. The correction helper checks the current
step's pattern-found bit but always reads pattern ID bit zero.

PIO reuses hardware step zero, so this works there. DMA processes several
steps at once: a later all-ones step can be filled with zeros and reported
as a successful read if pattern ID bit zero is clear. Conversely, a later
all-zero step can be treated as erased when bit zero is set.

Use the current hardware step's pattern ID bit, matching the error and
pattern-found bits already checked by the helper.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5d88ad3b8f70..3f506d0666a1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1117,7 +1117,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0


