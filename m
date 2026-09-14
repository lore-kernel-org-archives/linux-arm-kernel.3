Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524FDC88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=; b=lG6S03G/vaKwEiXsn9tjI5v3Su
	faUo3yCrIoX5Z+SZp4xnZaMZP629KhGqNXfaGE89hFy+zf4Q+bN8vcmyBrgAEtqe6RdqaJ5XV7DAo
	dWyrk8QwmLZ+OZubm9R66i/Xkv/81YtimcYe0RYDsv43D5FEJCTjaiCCbdt7Css1xfejt1VG8VHXk
	UxaxZdPXtbs6MwV4BXYrh8YPhoVAgFM0hIuOAKHu2v5KjoUpxAzJhOnLiS2DhGLPe7dKBTfIv9fKq
	46azb8x+p5BqkJeTWoG7Ji0TQSvChFqX0+aWkUsysdSlvxA1XB3X5j+zqH8MoLUEW0qQjPeIDV7iT
	tfOQBVtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxC-00000002CuX-0p6L;
	Mon, 14 Sep 2026 03:01:59 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wx4-00000002Cin-2KQk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:51 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466cc9b2f1dso1214185fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 20:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354910; x=1789959710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=Vu96ig3We0iOCK8J2+85vMgJAogV/f6oiwyPglE+4XRMNT/6MOkL5qCHdiFnxyI6Xo
         yaeYf/NOa085M+RFgcY8tEf0wJaeKhP1OGulYw/SPWYAMWIieaB1sG9cDinRX9Xr1y9y
         /o+KaTljQ0/Zv27cqnySQaTArKWHlfMsfJT0zB+GTXzpxyMbO00XpD/S2YKM4JjtOwym
         STgpOPnhgXWVS2qckNGHdZzqegsYugg//c51ChFe7ELCrn9C60B/BPLrk5mLKObXzWuQ
         lUhVR6YAB3WMSg1PAIGS88QBSo3QWz0STv7BT20ECM+xsPq8PeDY4LGsycGz7XAWhXOu
         ZCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354910; x=1789959710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=aGyIOIPcMM9pEtVkfVEH/zIuzy2M0rT3grxiXfh0ppPqWq8HFGv2u2s9ZUl4+C86nH
         w34hGg/iZTrzeiZAzXHl63pr0x8uOU+3Cm1pam7kck1c6ipNaldaO6hsOpTwh8VDk170
         07Ja/9NjlYg/9cMWvdbQAh+i6YibZJ7EvagO7ej/vgaCVyHYBuFjAXv4DJup/0jODMeZ
         NhI5sioMQ3XdiCLSktq6qE9y0jUBomPlzF0wr1pEXfbX6kFv9xSUtVx4owKIPKcnX6LJ
         lHPjT8u7byb2TGuwoIDmvDuf2rKlXsT+Yf7S9TNIWzr+gUPxWYCHAISqc208OorBBjvf
         EN9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzeMleXYkwvRUEiiV1RHSsaW1cSFI3IsUTKh4JEejmqO8nqN3TePn6alutlZKwDA8mOFg3jA26YWKoXevr7bCaO@lists.infradead.org
X-Gm-Message-State: AFuF++nMCBgE5rzdrEjfT9xjemjRNz/z9er3WmX4TtsFeHfylO8CO+LJ
	5qFoOTYPAVX/gmHgH+wOEcGMlpFcOnlCigeVmlwDvxBMEHkZWzHrzFGl
X-Gm-Gg: AYBFou36csXFGxTd17KoY710MH7D0mOhfjSZtjmUUWb3C85aiKw/PCI7XYvLZpPVEyE
	eeXcX+fRdLRqWK9xCTLOFMgSNqv9wuWpi9IR7c8deKID/OsfvQ/eidVisnk4jA7Lq0Vsy6EQotG
	kTpD98J4BJSMEqggyOpyqn+BdiK4pQqCsjId9IYfgOzo0K/67tTnrxrGoUHl9eloqZ1Tlp/Scsc
	L0F3nwYmkz68OP9WLJOKa4Lc+t7vS7B0oQx4GBFzVHfOqV4CXbUuLY+3ubH7OYRKquuNUZYOL1o
	12wE/yqr7ODJNTX751uYsgG+LSR0/oy1RLXR39wTArrxKME2juMJCtKWi4H8YLtGUoseJVra58m
	cjGuoC542R6nf1C7aGGDkkwlem8CvzBqvVeMhAgTHTCNlEs+x4sKc+s2PwHLW8u8cx1p6JcLSTg
	IgjN3j7/S+1aHJJYemaFVhffxqRettNeXsb18FNXTXBWjs1kHuBMc3cOCogUw/YTXSp53Biguf3
	Mz2HPTPs8VYhBJkWPp1lWFp0NH5B5YLNtDP1QIxjiEQQtPAssQF+hJaf7olaF78zX8W3LS0enzE
	NHNxCW4jA6TOOrBlxt6whHPS6QkURmKMB+mwXSrOtaVxBI9dMrvC01cYrag9Efel5PUi0saPte2
	ZC3h0DymjzRR1u5DIydZ46m4mAkWj07uIRhxC4urN3g==
X-Received: by 2002:a05:6830:4486:b0:7f9:555:1def with SMTP id 46e09a7af769-808863d0ac9mr310838a34.11.1789354909720;
        Sun, 13 Sep 2026 20:01:49 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:14 -0600
Subject: [PATCH v5 08/18] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-8-7d711076a6f7@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200150_606372_1D6DFC6C 
X-CRM114-Status: GOOD (  16.55  )
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
index 41d6560d7df7..13dc0af56eb3 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1509,7 +1509,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0


