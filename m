Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D03FC97F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IefxdwdaNENTe3ijrHdpPLezHBD/mzIOjWzh1r0qkT8=; b=qBupxPGCxUfTWoOg5ViE9hUAXV
	P+cqwI7pJmIDuKQvSDuDRpO2mEOBj+pF1ywWQzPq9KXqwVU2VSj06EtLAWpzHZUaK+v0EZ/9Mp3iL
	vojdU2nPO8dk4pFxo4hATJIQjAVva8oufkK9DjOEAfzOyO3P/EX/SCw02xFP/BB739lxMhwcbbX6E
	cVJIN1wse+qXrZKX7tv0fgg69XYcH5K24sYlhnX+CSgLZis+AtfXM+fr7IGl5yysJEsvloO2Y1mpF
	/t40CAhXwtKcciKtcDWQZGz9ZWlfezx8J3L5FHYzEmsgaWqgk1Ap/gFW2uGdBRfpbVmdXD9MQyGAT
	k1ErU5dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7E8p-0000000BXTD-3p9C;
	Mon, 30 Mar 2026 15:02:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7E8n-0000000BXSi-2Y1J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 15:02:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486fda2a389so37364315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 08:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774882975; x=1775487775; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IefxdwdaNENTe3ijrHdpPLezHBD/mzIOjWzh1r0qkT8=;
        b=YN2oVzWZcXUcvisYDtiKhqNpI1arBBAxoRrsm7Qom1RxBwLo7t0F1h7Fvfr4o28jvh
         UWdWj7tp5B+Q13VIDKA/WJDfy5arisCircNrppX8tQ5WDoL2quN1oCKO3EN/Y+fXalMI
         rVmYjxE6JelJQgdNHWXDS/dpbX/yqntyG+bqSRZtm73FBTrnGCrOMR8rzTRKt/oGQHIG
         3by2mLrieJKHl+JJqr8Mu+XK9yytz+h4e0hVddGWglGw+xug0BIwYa/rzwQM6KPfZvlL
         NeDZzG/oZ82i/KMzurV58CgsY1X0H9HY0BWpOtzSooCimZZfLcSSVMEIjhOBrFXtD1kF
         XpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882975; x=1775487775;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IefxdwdaNENTe3ijrHdpPLezHBD/mzIOjWzh1r0qkT8=;
        b=GrgMdPkWv9JDrdn0oSKe/Cb7J0dMHHCKAnMCfgeKrN7R2jeE2TQ0gh/lrhZUB4mH17
         HBahEBgIo9MfGU5f4B9MV9POWRkH5rFOGXk3YQv/EMUS4qIUSvzYYv14BEQ7e1Wo3gJ+
         U83ALzP+pzXgmRRREPxnm6LOgmQ/FphSVXog0aJHbZlruwbGpRg6eRwlmsHGzFPbKBaF
         2WU4WhCnAeAVJMOf3vOhkSRGAhBovNIogCsyV6bNXV7nNO7bN/maXZoZuAvpzUD5WUhA
         3WLygTrECEkbPcQJMDmSjouc07enNsL+95+5RUpjnX5jwV1FJqiKKxNjByZuBDoeCd+F
         +8gg==
X-Forwarded-Encrypted: i=1; AJvYcCWSIKcM3YKEpL4AR8lYRRJjEWYwnsJA/0RUXkW7/jvg8LYqFCBOXZKbVDw1/Fy7D2+af2u94XSlDrL5ZChrZLF7@lists.infradead.org
X-Gm-Message-State: AOJu0YzuTN18lGB2fzT55ORGJW50GI69F6b0cOL8C3TU4F2dWk5luVBq
	n9Za7A34Na1pKkmzJeR6dlVy/5PpLIZXSvvmUg/Iop139cZZj9vJpKMr
X-Gm-Gg: ATEYQzy6uidXgTdWaqxpL5kvSLoAwkDToZl+lJKha2rlVMzbqgNclvnvnNgzzhV30BV
	lOWwmlFtPDLY3Wdpz1YklN2+gENmiprTO4v/0McVkxX7nnxBui2kH+V1Flv2H6yO2RrlkshruQ/
	Nj3jwpNhTNxKPi8EtjhERVASzf6wvKEV251JhT00ZIlCd7/Ik8+lVhjimM8Cre/lpZ54Rs+dffp
	l9RRVBhqruq5LYWF3vb/OMfio0WqIua1YH5oiKHS7tBbCtBvzWByOgseCWQGBoEhlBmdGowf3LE
	CpwfbkURQoiSG8tPLfzBZPlmxb7kn/ysHjE0ZGO/ko59dibwRPZjXLHUWFnyIsvRpelqkls4Vya
	arHC9iqrzU6mu3iNCzUiKdDvjw5tT2tf+WBzwGbYlJVUMI8SoBWzDmAh31WjK81rX7BJIWj6WOc
	8axE6B/ArT3zjiF3zWfZZZmazWSdmlhczsw8OS1oPXGSkbjfF3Hmlt
X-Received: by 2002:a05:600c:4e15:b0:485:2ce2:4c8a with SMTP id 5b1f17b1804b1-48727d67a21mr205698365e9.1.1774882974762;
        Mon, 30 Mar 2026 08:02:54 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm18711796f8f.29.2026.03.30.08.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:02:53 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 30 Mar 2026 17:02:42 +0200
Subject: [PATCH] usb: core: avoid double use of 'usb3-phy'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-usb-avoid-usb3-phy-double-use-v1-1-d2113aecb535@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ5AMBBA0avIrE1SHVFcRSzQwSSi0oYQcXdl9
 9/m3xDYCweokxs8HxLErRFZmsAwd+vEKDYatNKFIl3hHnrsDif2K8JtvtC6vV84mtFwXpVkSBk
 aID42z6Oc/79pn+cFd3WL428AAAA=
X-Change-ID: 20260329-usb-avoid-usb3-phy-double-use-7e498373073c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Stanley Chang <stanley_chang@realtek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_080257_758017_7BF725A7 
X-CRM114-Status: GOOD (  19.27  )
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

Commit 53a2d95df836 ("usb: core: add phy notify connect and disconnect")
causes double use of the 'usb3-phy' in certain cases.

Since that commit, if a generic PHY named 'usb3-phy' is specified in
the device tree, that is getting added to the 'phy_roothub' list of the
secondary HCD by the usb_phy_roothub_alloc_usb3_phy() function. However,
that PHY is getting added also to the primary HCD's 'phy_roothub' list
by usb_phy_roothub_alloc() if there is no generic PHY specified with
'usb2-phy' name.

This causes that the usb_add_hcd() function executes each phy operations
twice on the 'usb3-phy'. Once when the primary HCD is added, then once
again when the secondary HCD is added.

The issue affects the Marvell Armada 3700 platform at least, where a
custom name is used for the USB2 PHY:

  $ git grep 'phy-names.*usb3' arch/arm64/boot/dts/marvell/armada-37xx.dtsi | tr '\t' ' '
  arch/arm64/boot/dts/marvell/armada-37xx.dtsi:    phy-names = "usb3-phy", "usb2-utmi-otg-phy";

Extend the usb_phy_roothub_alloc_usb3_phy() function to skip adding the
'usb3-phy' to the 'phy_roothub' list of the secondary HCD when 'usb2-phy'
is not specified in the device tree to avoid the double use.

Fixes: 53a2d95df836 ("usb: core: add phy notify connect and disconnect")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/usb/core/phy.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
index 4bba1c2757406a35bf19eb7984a2807212374d18..4d966cc9cdc9510147041df7875ad9e48a9ea3af 100644
--- a/drivers/usb/core/phy.c
+++ b/drivers/usb/core/phy.c
@@ -114,7 +114,7 @@ EXPORT_SYMBOL_GPL(usb_phy_roothub_alloc);
 struct usb_phy_roothub *usb_phy_roothub_alloc_usb3_phy(struct device *dev)
 {
 	struct usb_phy_roothub *phy_roothub;
-	int num_phys;
+	int num_phys, usb2_phy_index;
 
 	if (!IS_ENABLED(CONFIG_GENERIC_PHY))
 		return NULL;
@@ -124,6 +124,16 @@ struct usb_phy_roothub *usb_phy_roothub_alloc_usb3_phy(struct device *dev)
 	if (num_phys <= 0)
 		return NULL;
 
+	/*
+	 * If 'usb2-phy' is not present, usb_phy_roothub_alloc() added
+	 * all PHYs to the primary HCD's phy_roothub already, so skip
+	 * adding 'usb3-phy' here to avoid double use of that.
+	 */
+	usb2_phy_index = of_property_match_string(dev->of_node, "phy-names",
+						  "usb2-phy");
+	if (usb2_phy_index < 0)
+		return NULL;
+
 	phy_roothub = devm_kzalloc(dev, sizeof(*phy_roothub), GFP_KERNEL);
 	if (!phy_roothub)
 		return ERR_PTR(-ENOMEM);

---
base-commit: f50200dd44125e445a6164e88c217472fa79cdbc
change-id: 20260329-usb-avoid-usb3-phy-double-use-7e498373073c

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


