Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34091EFB811
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 07:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G/Mt3Ra+5yhEMXBUYKmVnriP9LLAY3r66sMCycefNDI=; b=VMW0Q7a6lRwY7Dr8++CETLmGhW
	xF+EOBGM+RFnO32iWiCghbhUCiTylJ6+p6EKOiBzsusaQKHH/KJLShJ2O9+YmbMWkT1XCiM+TJXmk
	gXDWTWAchVsaOZp1vNcraSSBCey4GGKTyn2fIEwNqwSqFNm0qM7+89Bms3X481edULKZ82yE/8QbI
	FygIJUGfBYgJ1JGkdq68x2+5EK6WFUrbPqztLiOTzcfy+pIB85+1Q0dsRrcall6V9E+3osmsN0umA
	OnMj3Idg3Q7KHJILqRffvEqQrZtiV1EYIkpfIrQ5lCT+jfA8HGKyeMWQ7p/aXfBFjYadi590dhY6Y
	IPIgP+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumS1-00000001YW9-1Xcd;
	Tue, 24 Feb 2026 07:03:21 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumRy-00000001YVU-3T9z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 07:03:19 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-824a829f9bbso2688494b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 23:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771916597; x=1772521397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G/Mt3Ra+5yhEMXBUYKmVnriP9LLAY3r66sMCycefNDI=;
        b=U4t9G+yViEnf35xDRFPPY55dSq5m8p+4JWG3XgJtJwaXomssg4kqB6cOTbmBtRvsEI
         9+pS1EYOp5Xyh9zLsRriEfnci8dDNPOa8aRXY8NPWERAUpr39GPtZPVuBJPWA77YzQ5Q
         c170D4jxeQMvhw9ZXrYcWSWW/3Ffhks7g8J3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771916597; x=1772521397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/Mt3Ra+5yhEMXBUYKmVnriP9LLAY3r66sMCycefNDI=;
        b=aJQhFZV9hj87a4aVE9FfNyoKt68jt4PMvPlAwqQ+VqykM3cwjgv7HC7AFoyl+vpN6X
         3yij4/cStvz0kXr4MGgCm1X5sMjBmhKBLZT0YkJBoN1vdzC65R1fvjpTp4htN3+QOiYV
         cCLnbztYg024gjl7j+Cv1ckyB1QWqAhg/KY3X7TE4qPHAHgI+Rb/ImJeywSac/Ct0LDR
         6fvWE5qcPuU0qSn+JQIN2cVTPxTtVqt4i8HsljZSu+93Org0sOWG4XPWH4eauAoARzEH
         Hyn0iCcxqEK5ApLoKQPtwZDxNbh4ycfkeCQiKC6fKbZcb/H1ZMtlahUym1c7K/fHVN6B
         7ULQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi9y+rt1CLIjmFpjJCp+sPchUT5a15ozaEtm9QWokcL3Nup1SjMnp/1MCFjYa85k3C/WUj4IX8Bi8EgmUPcEhU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6vtVOCkGH9nU7cq+ZsHdGuZjA1dJS1u20vEO/KLxVWZhTL70Y
	rTNLNCl6YvZuCwa9Y//ieUeDkLBEKc40UONBHNoqd7rGAOYjsUntVqhH9bEI/J1W8A==
X-Gm-Gg: ATEYQzz27sR4ISVhVATklNVlh5Z4LZ/scqElS+4giNFL6nV4Brg8dcSaKkzC/iDvMDZ
	kBbruKipFCX1RK6VdZYjJhqarQqiYg4GCLcQo4fpNxRB8RnRFvFQ12BEgcGNr2LJGRn4JVZynrF
	EtaT8u9UijZyycXe9E1inKJDWQF+SegRY5lJEWi/m7KkazxJ7JUobmK7CunVZms0vk0v+VR5CXa
	jowQqa/+mht5UGYcKIGxBEcwTx0mSZYWHcoLyF1gd4pmRK6RNgB0LxMY4qaxNFhEmLGs6kfR/Ul
	PwB5uREG56APUQHHHm5LBst+BrRqWAPrRPdItttj6gZzl6F5ksu2TqZlCiZscqXh2UHQeeiV5LG
	ETHhs2fa53ih0a0il4XWDOy/6SSoZzfv7wM92oDRXNiUbZ9dPLT6l/1ooxRvy1NcLqVXlNoMN8h
	MptBLo+Ms7YQ6saAXQaMeZ4L1jVX73huSMxaLI0UD/3LTriySBQPFY43s3HzxpTD0WNNJ1NJVhO
	4aTkTNw
X-Received: by 2002:a05:6a00:330a:b0:81f:9986:9205 with SMTP id d2e1a72fcca58-826daab0281mr12440056b3a.57.1771916597314;
        Mon, 23 Feb 2026 23:03:17 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:752d:3fd0:786d:ab57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd873263sm10007748b3a.33.2026.02.23.23.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 23:03:16 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8195-cherry: Disable xhci1 completely
Date: Tue, 24 Feb 2026 15:03:05 +0800
Message-ID: <20260224070306.2650182-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_230318_953868_FBDD8565 
X-CRM114-Status: GOOD (  10.59  )
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

There is nothing connected to xhci1 in this design, nor in the actual
end devices.

Disable xhci1. Keep the USB PHY enabled, as it is a shared PHY and used
for pcie1.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index b3761b80cac7..6e99122c65ac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1495,6 +1495,7 @@ &u3phy0 {
 };
 
 &u3phy1 {
+	/* shared between xhci1 and pcie1. */
 	status = "okay";
 };
 
@@ -1563,16 +1564,6 @@ &xhci0 {
 	vbus-supply = <&usb_vbus>;
 };
 
-&xhci1 {
-	status = "okay";
-
-	phys = <&u2port1 PHY_TYPE_USB2>;
-	rx-fifo-depth = <3072>;
-	vusb33-supply = <&mt6359_vusb_ldo_reg>;
-	vbus-supply = <&usb_vbus>;
-	mediatek,u3p-dis-msk = <1>;
-};
-
 &xhci2 {
 	status = "okay";
 	vbus-supply = <&usb_vbus>;
-- 
2.53.0.371.g1d285c8824-goog


