Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6010C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2khEECovfca18HsEnd2rATuHpO1VYqgGWGgT+k6yyKQ=; b=RQSP1AYcRi8XmOQAHciYa/JoB0
	yZbsbWEGuVCRhlT9FDyX7ZQgNkpI1rlYE54Ozt3wygNz6pq1jkEkI0e4W4SqpjmHo0zGZ+3U6nTmF
	O8y+ob2nyefn8LLydYvSzk7Pj9wnqrw2hUr8L6/sMdZBwJfY79XncAyR7Iy7VyBt5MLEdMpaIeY79
	ADOcM2e3Mr7IaAj5TivEz2Xc5q9CeFCUC3nHE2HaqwSg7E1jmoJlWSdxzmBdzV+bZuru1nIhUWGRG
	9nGWoVCs1elost9fSshtb1jCUJW07YGYsklOG149buBZN52ZPEKIYDUDd1iurqqCfDhDzSs114gB0
	yjxCr0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JG6-0000000BASQ-2lpp;
	Tue, 01 Sep 2026 07:50:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JG4-0000000BAPJ-1wcI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:50:17 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d8f265cbe6so5266265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 00:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249016; x=1788853816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2khEECovfca18HsEnd2rATuHpO1VYqgGWGgT+k6yyKQ=;
        b=aIFm35Y2fQioAolG/LxHNxb5TINjWX+R6bnX2VlfWJG7SmAhBTuVp48meHW02Ffmme
         e8dqDVEce3Mmba3rIl63rvMPkw9rTh1jeVOrF4gIAGGqKAN3JR8YP8lPmW6UgncTOYn9
         KjfOez17e1rMdRKWHL/YqysQAkB6vG+YVUdYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249016; x=1788853816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2khEECovfca18HsEnd2rATuHpO1VYqgGWGgT+k6yyKQ=;
        b=k1AfcJ4xXny0ACshRT9KR3BG/uFS5jTER3TA9h09TBg2e1coL9g9ufn/2E/b8tjeQb
         dwejoYBDpqF6o8PBsV81dFiJzjsuwIdrgIm0Kn9VTPvrCZEvOjUis6bNJim2YbPfeESj
         MsylWtiuoF4MMSTfbbzyInamRkLhj6vtsRnMQ/+Ddffyhc6GSiBJG81pVT5p0qVMBPN6
         E1pa3y9WRy6CcyF4vgMeZS3wrWh67Od3BfZ+HTswvzqH67OqMS7J/NHX3bCGyvIPSJfB
         E2rKj+WWp0zkMbCkyS3gU6H/mpeJc1tofjyWYMohB9qFDF7KjOMFImr57z5kuxi6hKLZ
         Gdjw==
X-Forwarded-Encrypted: i=1; AHgh+RpWQOTjIo4LuvEOp9QR3yZlprKuax9yI/zNPH2+pQ8XeVkB7xZZWFamoUMKVv6zT3+zSmrC11Ovdn7mtJpxAMAY@lists.infradead.org
X-Gm-Message-State: AFuF++nT3S04rQi9eNBzB4R2DGLNBGqMTRwh9MTHy2T/Pvt0o1WEpq6B
	Nk4arpES0afD5jSQ12XvFaeTJVTdbpfNbyVIKxfLREZct2oON0liTaFBrj229TrmwA==
X-Gm-Gg: AYBFou22a5GyNPEpGdGuSveuH0qbxyfCy3eFaTEZDipdYlUbjpoFqK/rlhnisLKmoNv
	qs3zCSlqj0e/tIO1wR+mPgnqgKP/pku5P+FHcFYN7kviOohcdqe1cQMynGzqRKNxDesOTOeCHKS
	zL6ZWR7eO8zfWMsLV0Shj4Bob1zJm3Un7kX7TCqGVv78BYi8/EbSzV3masq+dakBt8cFUd4f00F
	lekWsMejvNQAfHiKJVyvhoVf94hqrla/9lnor8otmRtZ9Otr3oSTFVg6w87E90Ov2r7kyM+NWpk
	my+FkaKZEhitgKK9yfXYJRqETb5hMwmZmLv2/GMXaZMay/VU7HkaOnhf0z9T6R2I1WsZIkP8jq+
	MHNQMqSK+1KqJAdCRm0H9En+hjBkHIhb7X2YvpfBlrorX1nFp1b0OOOHEjVf8S2v4FSByIQA/4I
	YQvDvrtF+wcJJ8LUV03lFMTcvrfgvCUvLEzyEmGL7brVb77LUlIHypQmrLo1CxX1qQGZPfJXV3+
	NAI30wG+RA2duVPO781EM8T99Qz4zOcBBf6RVycHOZFjw==
X-Received: by 2002:a17:903:324c:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2d74df1c634mr532551805ad.14.1788249015708;
        Tue, 01 Sep 2026 00:50:15 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v6 7/8] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue,  1 Sep 2026 15:49:25 +0800
Message-ID: <20260901074930.764550-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_005016_523808_4FA1D83A 
X-CRM114-Status: GOOD (  18.86  )
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

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power up, with
opportunistic skipping of the delay when the regulator was originally
on. The I2C HID driver gained similar opportunistic delay skipping.
So has the I2C OF component prober library.

Now fix the device tree to have the regulator not be always on, and
let the I2C HID device have the correct post-power-on delay time.

Cc: <stable+noautosel@kernel.org> # needs matching driver changes
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added noautosel tag
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 +-------
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 1004eb8ea52c..b9e311fcd9a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -62,13 +62,7 @@ trackpad2: trackpad@2c {
 		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
-		/*
-		 * The trackpad needs a post-power-on delay of 100ms,
-		 * but at time of writing, the power supply for it on
-		 * this board is always on. The delay is therefore not
-		 * added to avoid impacting the readiness of the
-		 * trackpad.
-		 */
+		post-power-on-delay-ms = <100>;
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
 		status = "fail-needs-probe";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..6b9f47f515c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1093,7 +1093,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <218>;
-				regulator-always-on;
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-- 
2.55.0.897.gb25b4bd76c-goog


