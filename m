Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A0ECA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 20:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uc6m/QNpalNv4a9wmqg9O0BMMr47ojwjmucGyrpTpAA=; b=IH/vc7MANdtYnmAlbXtF87a163
	iNvx+N1vw62Onw/9CToh5+xcqgTu7OV/dLZ80Y4H//w0/FLWkwWeQ0RhpmbGBCvzGt4+mNwqy+PHs
	UmPXu+USBYpPiJz5u2LvJA+SJQFzf/Cg/+H5ey4Oj4ovjoS8Z9e0CGy6Ro3JUuucIVdHDlE6N/Q0T
	YhHHzC4667fIJ/uOcKtM0uJ00Rv+mT7ayhdDGksSGdHSCLQ2SZ6MuvkmXYGnPhEvNakXjjNrmEfTe
	HILOlfaerKkQlv8hiLjV9TrUl1z1NzUotpEJPTU0IV5iXOdYOhGRuA/Ieqp8fzDaR4KhMT/ZRGMfa
	+/mEjmgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeZp-00000004Vw5-3Wke;
	Tue, 29 Sep 2026 20:37:25 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeZn-00000004Vva-39NJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 20:37:24 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48af5ae31d8so908317f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 13:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790714241; x=1791319041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uc6m/QNpalNv4a9wmqg9O0BMMr47ojwjmucGyrpTpAA=;
        b=ZTYJO1xIGRvjhgEmwhSrFAO79cXM5Lo7CjgAHunw5BSESejp5NCEO32VFA99Mvlvi8
         84GFELUxoHt9bkF50c2bI3GCIqUczOmEC6n0zRzlGY1Pr9Q2pGW0rdfCWddYDMkhcQN4
         Rf1syCR2z4JoLCYXz/LjOM3qx176PGwTDkmx3C3H1bXq44bAqkCugKLSlAQEE8YkhYAT
         GHcneHOMYNY+3VG4MPz9nNzWDnoAfLVs6kBx95xtxeywblYAhUcotOLNUYDiRaAjhhSP
         pbMp9wj9Gu9LQIdEUKw2C5zlCQwA7PL01epgC+yMVquBGXay/DeWlx151KycpuAGeZgg
         5iOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790714241; x=1791319041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uc6m/QNpalNv4a9wmqg9O0BMMr47ojwjmucGyrpTpAA=;
        b=Ee95Zg7ZlZmssJyiug17hxrMZAgghCoC/yNoEEgx0evnZy6ccMo76sJwwlKQh+00WW
         OZnuCCLzjuvf5eQYBkeBz8+ue2b/RcxxKIEKcVS1mrPEvceuWUgY6LlBDFbn7mNjn4jn
         QyuB4H9biVnElA4emsNz+n/1zqJgKwJsX6ts8jU/17q/BGpRN19Yh8JIl0vW3jg2Rrmb
         7dtIVwYoMSbYINQIA4OLma9bahz9xRapf5oarm6owIakLRcHI3IUBKn8Dl4y4kG6b4ey
         iWS78rpi7apsdDTUQqWzUla1yznOptNf7M0kFT+pprjL+hI5k6JR+LcqyiHZd7dA3T2l
         IEJg==
X-Forwarded-Encrypted: i=1; AKwUvByJaOuYhC0uhcv17iggI+hqP27Mf3jfIifXHZFIzGqdS8RaqqEu8i/Snt/z8zTKdV4LKRaYBjwMya9bvZ5+o0c/@lists.infradead.org
X-Gm-Message-State: AFq9FYKCLqzfM1TfTltTmKshy38wy4BevDL32tssH2FJyCjbzQOahDBR
	UTshNZIqncLOuODD2vxZATFOMHJ/EqeGgWrlDfDl/YjIB5bQg6G/QV9P
X-Gm-Gg: AYBFou0gdI8VT/jQYSYeXTdbiUgn0E0IpnbhUaNB+/CwoYqI2a7VLSiFG4Lfv0fCEtb
	SVMh+GJWDaAnum5wHBRdmFreaONDx2ukZbyBiZYMnbldK6Q9UZBtBWC4/IXBKMf6yfCdNAQpu8E
	vqjzpGozc8B5d2XtMweeK1d7ZC5MpygrARjNLv+RFum98+8R8EyDs58Mkfp9I/1ZYAZR4aIDkXv
	g9MW53hmk8iJkjSFhYHTfo3YlSLbqehcPsZjSYqT0DvlS1SPCaZB/XC4Ti4gjt6ADOeo5L4BTSS
	/R4AqTeQIzeutD2JySJnJ4IL4I1pW3ixT3EjgVNOvdV6cJUeYzgPf6iscOgbcQkPE4qTvrbfGgv
	yTPDB/rhqutGUn5FgsCgKNQ5yFqJfW+11vr40p6KfU2zJeyHRN906OrW1pkJ6nmKq8YbZdjs6Rq
	+DnJSlIzG01sgBdHkJQREjXfG9RHjBvdIxq3uSLWTN1efNnYReTqwA925Gu47zReuG/1yyxEy1/
	bFfIjXzY5zG4c98hj5YMnpnuRgXr+KAY9FTcJX73+ND
X-Received: by 2002:a05:6000:381:b0:487:27f9:83d with SMTP id ffacd0b85a97d-48afe782c3amr766701f8f.50.1790714241257;
        Tue, 29 Sep 2026 13:37:21 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48afe6a9624sm1237578f8f.24.2026.09.29.13.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:37:20 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Tue, 29 Sep 2026 21:36:34 +0100
Message-ID: <20260929203634.32998-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_133723_803316_1B22DE37 
X-CRM114-Status: GOOD (  15.05  )
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

prepare_function_table() assumes the first pin is in bank 0. On the
A523, which has no PA pins, every IRQ bank is numbered one too high:
the last bank writes past the end of irq_array, and interrupts are
looked up at the wrong offsets.

Count the IRQ banks from the first bank that has interrupts.

Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..9c5eb21a86a5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -208,7 +208,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * The extra functions will be filled in later.
 	 */
 	irq_bank = 0;
-	last_bank = 0;
+	last_bank = -1;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
 		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
@@ -221,16 +221,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 		func[1].muxval = 1;
 
 		if (irq_mux) {
-			if (bank > last_bank)
+			if (last_bank >= 0 && bank > last_bank)
 				irq_bank++;
 			func[lastfunc].muxval = irq_mux;
 			func[lastfunc].irqbank = irq_bank;
 			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
 			func[lastfunc].name = "irq";
-		}
-
-		if (bank > last_bank)
 			last_bank = bank;
+		}
 
 		pin->functions = func;
 
-- 
2.53.0


