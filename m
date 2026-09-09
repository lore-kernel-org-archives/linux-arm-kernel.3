Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935E1C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fr9GqqlcZjpJ8b9Wsl+mydOW8kr4IAMiGLW3BSwW8ho=; b=cIE1O2Ra3sRhuvtLWmApZNPm78
	5trzVNqW+Z6n8ayluPG5V6lVGT7UYRoN24s9YpixszKSpSZBGcDTi6OQrLJ1DIn26eglon+rOcnB+
	dv9uuJqmNlQY182KLE4SEfZ19S+IM08jCcWm/cb4+XKN4ctDlFjGP9ptsruhxHt8Sxl+DWFX1Sohs
	c8xvXBiuU3LgwsOXwcrS/q7FXU5HPxJUA8BIHZekdc24lg4bx9U/TsMdFcEXGX7WGhsYCYk0FnhIW
	hiMjzQfAq8sQ7sePkafMcmU4MmhD9bdLEHzjAxs1399lcaSOWs6CcTTEZe3fO01ZsHtUnnHwESG3F
	VHjq8LnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dhy-0000000B6RA-0U76;
	Wed, 09 Sep 2026 08:31:06 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dhr-0000000B6Jx-1Zg4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:00 +0000
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4be6057c9c1so1686896b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 01:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942658; x=1789547458; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fr9GqqlcZjpJ8b9Wsl+mydOW8kr4IAMiGLW3BSwW8ho=;
        b=fPYbb/rttgNTA6UcQCiWQbLnEELbIal//fij4oduB65xDZFsznoFrIl8nNeeXloz9c
         R3Z0fQmUANFKQpys1joBIsQZ1VOb7cjKFWRTlwYvjg/S9fELbFihdrb3UdzstkDEA7Wa
         xe5CNUZvnKEyTDXz4V/9tJMCQ/cu7RLntSL3h2FOH9Pz2PYmt8i/9ImUyrCbumvoOArq
         RTPiwZeI2u9qkz7289ao4voSf68boypwioz3T4057SI5vU/Tyi3RZE3Tn7RFYi95Leeo
         mFSW2pbdPq0CoPLeVSNWOVOU79w2xf2Gt4y+pGiRa0/bxpts8gZNuO9o9QOJQmj0wWnn
         g6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942658; x=1789547458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr9GqqlcZjpJ8b9Wsl+mydOW8kr4IAMiGLW3BSwW8ho=;
        b=DdyUa6HWjodoN6+s4GSRNs8I9K/+d7IPIQksYSSmxMAMs1+wCJIAo6alTqX9XS6utS
         nzxrmN5qAEnc1cv45EHOYIL5hyqAYYdA73avI0iGw8DN3SHYvmefQexQaY36xi+azMIC
         pUumvUlYD8pL5GHUNiObe604aU0yncw40AwBUUpen3TeeI5bJIn3vL/Kmr++7qa3e3r/
         D6byYiPOgepv7HoA0rianOwR1WuoToptpMuqzaGVL1t4dvZMziHBskLsNHmBrv3OLf3z
         1lXfTlEJiEU6ZsvstxwItqGu+7VVLscz7R6K5SAXQoupvq942TR2IIpCa6XArKIQvqIk
         Nwxg==
X-Forwarded-Encrypted: i=1; AKwUvBxAQw50PcFP6/8Vt6vUopXPOCNk+GT5IjHroFDWZUzezxKqPCYtth1gIqviWb+byxK6Tj060wXoKn3flodKYakH@lists.infradead.org
X-Gm-Message-State: AFuF++nS9E+R1YPzgDVhU/ATVsyXMNQ25TfORiUjxGrzN1jGlv8aQhra
	stnpblUdXGp28/a15tn8Gsaaooqgk0EFV7knwQm/h1+S87FMskbx4fqj
X-Gm-Gg: AYBFou1Vt5mdqqmmYzTfA68Wel+jTFRJ5x/0jY7VE8VCxmw0/5JDUH2bahkGjrEUYEx
	1vRNc95DPK1aUMyymS6/DofNgwuO0z45/QzoncU6mT32X+K8i6nUKFuUAIpL6FnkzajitaEWMRj
	dstxAZAiOXMBeRSFHfGsXb++xWer5zIpXVF6iSOdnuLrTdURKvPywF8uibfN3vLBWWT5UkU21RQ
	zckWisjlLDygzNwLsgk2tMhJy6K4NHT6DnKUR3/HVpr6lNB4evreV52aOmTaBbIrz+o+9GTAUpM
	bnxXTvnjoG7Wyri9Dl6GvH6aanwQqZ1jagiD71Buj6VtZI7dlwTKxROkLD+nr9/a/eL8QEIbacR
	3XtC1liyJQlE2i8meveA5yfVj8HCCnplhtOgqjY6vIPX9bvXuJVe4gWmD+2IOO7DcosF22l7tub
	bgG0FmqT99iam9AJA/o4vic4NbxPX1cHuXKP92kvo3mQm1prh/d53+o4GkVxSJTgah858CJNcUh
	CEj+HUvqYBp9xjnKoMrG9CHnNl6qpT8XU1YyMUQ7I1zTO51PCfwrrS2sLe5R6L0ZzTN8MiIfx/x
	lgOBdLbIYgh7+YdMXA6+M4tYTO4DeMwK8BHg+LBmb2xQ33UEqopIpo8JLE3LBNdGbuBOg7FKx5u
	8BYSwe1g3GvN4VvFH6nFuOksmilge
X-Received: by 2002:a4a:e914:0:b0:6b2:69bf:c8d7 with SMTP id 006d021491bc7-6b6fb3df17emr20147370eaf.10.1788942657854;
        Wed, 09 Sep 2026 01:30:57 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:37 -0600
Subject: [PATCH v3 04/15] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-4-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_013059_517194_939C4BB7 
X-CRM114-Status: GOOD (  14.72  )
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
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index af8ba2d9f7a0..1bc94565e9e8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1105,7 +1105,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0


