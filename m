Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471B7F47CD0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcA4dGEpWdmHw4cn/b0YaR4yqWgiR2CVpGOd1+AB5JA=; b=KF9Rehlh+7PrG+RMck6LlgKYhb
	v+Rtaumak6JLmFGaJ7Vl0KRxUA1JtpGTvYmhS4u4oObUBAQp6HdqhKmu6cUxwj2frnvJH9mE96lgT
	+w9jsOLEDHn473UWrWF+kF0Btv2v556Vh5gjloTZLtuvRl70/4iS1JIh7GDppe7OkG7ePcsAnOULL
	nwpQtu296w1lXHjb9iVHLq4IsCSPrBIvpXCarsR6YT9bIcRbbVnHGwzmArH8EUjMEdmW2ug7XIz6C
	Q5KL7iet9asAvwD9I3RaAhBqIeFaFG0AMUd154jSmKnGp99TAY3gzVojt/Go5pNHHtwZPjxQjNZfH
	erZFqSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFrQ-00000002YQp-3bL4;
	Thu, 05 Mar 2026 21:03:56 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFrL-00000002YLf-3BU4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:03:53 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-46413b2c3d8so3410230b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772744631; x=1773349431; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcA4dGEpWdmHw4cn/b0YaR4yqWgiR2CVpGOd1+AB5JA=;
        b=U3Ph/uV7YjHgNok5PPbWZpB7TPH9mqk45rniGjDBLOns6ZiJSUKyo31dToGa5PJ0nK
         6GMCAd/Kvw8RR+qkHPI0Z+Fw5ihSlD4uvkpmyWo06sk+w2TKKKLh2J/kLv836ALwctXT
         mWGxNeLyH7jbwfSVz2aH2xdJ4vn56g4/0Ev4w5yuNCcB0qn4UDDZ+aZKrQXeZymArDJN
         qr0Rz/bBXqR1uMSAW/wO8p8OpTHEYUh8Cnerm7yAc4kugycp49+pYerBjWin0iprQpI6
         YSAiUkHkxsh60s3GKu/kfwp0koWB/OCtvN/x2su0XID2SaA4vGysStJ168BRcdFDXOH/
         NSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772744631; x=1773349431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UcA4dGEpWdmHw4cn/b0YaR4yqWgiR2CVpGOd1+AB5JA=;
        b=W39VSXREHcIh4/MrfQoO8vVEgla2dZ73wVOHQzRZDQpWX3oGK93kBg1YOr6SeathkJ
         z6ER9LUhlPqMCZlipQtqHf7a7mf93DDbbOK97yQXMgm3MvBfqP6/knV/bBenxuEcD1rG
         aE5yqL1mWGpCSd/okomISyY6CxatDBsO2obRppjzQ69df+tmzBPTP8UjUW5zzy1DWzBM
         Tz3po/0//B4H/7ge74Y9EaV3ghp/w9fdpEhNlKrwRVQaDbhT6o5D0NilW0mmTF5TnzE8
         dLdM5fB/oqg9jW83G0S9EXWcydlJGmvzAseTMjiGi6OYHrrh0whZJJaNDgLFgS2W1V6K
         EiJA==
X-Forwarded-Encrypted: i=1; AJvYcCXjpPvwOT8rrYfoozxKSrbFz4SeZBPhxJkPTyZ5nJ/FdSCNAXli6GiYSGBl9HZ9jIs3uiLJdkzbKE/RbndAyzLo@lists.infradead.org
X-Gm-Message-State: AOJu0YxZHjMFEjz1S97pKE7ZeFjcF/zxRJr39SjUO1NSVNuZgsZKnk5s
	HSUu2eyMa8+cQfcQyw5q8xUTRawfN4GopO0VQ1nlEaFsSuGAjmTt4iaR23yK0Vh+Q+g=
X-Gm-Gg: ATEYQzzFz7MvBoglj0g5uiqDQOsWWjvWef0t85xX26xckPpgQmIIuuB4qTpdfLgShW8
	FEOb56H8RYL4jqAW0PIk9Lsk9ilH+ls2z1atNq2+jvFEYaOe4AytsDDZ/W0cG49blQJDVfzH+QD
	i8pTmRaNz9ue/Aih/lVSWAyz4kKDHi9j3eAhivO1EBBivZg+v3V07Yx3dyVmf/O9YPlnIE4YaV6
	SghZFMaH//3aaE6whM4TwWYFInMKeWrkI/37pFZyy2VF70y2DuNnqAfIm5wergL5EAimp8pIw/t
	mBgQeu1xoc/9tZ1VB+XefGcv1GRd6sSHEGmTE2f1hAvyTW2lcvHrAFGpevyt2uBBuRScuCqgZo6
	P+XrYjvaqC1j94nyh4U7s8RqILyaICVVJBezUmSSKTMwlI9GeW/6di6tqdcW7jHqYiSwftPBrV2
	TD9OyC1YPVubfi33erQA7BeemQjgNi
X-Received: by 2002:a05:6808:3a1b:b0:45a:770c:d77b with SMTP id 5614622812f47-466d868336cmr549783b6e.35.1772744630984;
        Thu, 05 Mar 2026 13:03:50 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:874e:e775:4f67:b3a5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb5d0a8csm13729227b6e.14.2026.03.05.13.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:03:49 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 05 Mar 2026 15:03:17 -0600
Subject: [PATCH v2 2/3] arm: dts: mediatek: mt7623: fix pinctrl controller
 node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-mtk-fix-mt7623-pinctl-name-v2-2-a68854a51065@baylibre.com>
References: <20260305-mtk-fix-mt7623-pinctl-name-v2-0-a68854a51065@baylibre.com>
In-Reply-To: <20260305-mtk-fix-mt7623-pinctl-name-v2-0-a68854a51065@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=748; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=eCmJ2QYY/pzXcaJOToFECzaVPUqi4rn0enxXy1DnBG8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpqe+keeDzlj/E9xT/ACGFnG7mZ1wqlrX2M/rwS
 3c+QMzSXkOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaanvpAAKCRDCzCAB/wGP
 wPkSB/9rDXk0Atd75mMJ7zGgLiDNplnqqhch8xpKQT3e9Hrrvm4iPLGSt+OGOW205Azmy+tC/wI
 V02tpJATSjdnLprbEYQvZwXlAyJ6AxL7C4EQJO55whtjDwp96tVdYsdOq37NizfgirQDCONMJoI
 P63sli4TVU1sOfExOxVoKxV7i9KfdxuGEWYsLIwPew6A2tX7waOgNQB2JQT33CSnNFaxbQISdTC
 U0HHTprNfh8M069tJGkqrS0uYLUY0DeY68TgBMwIbquiB1J6K0ZTJpXBwxLUCeMc/wB1QvVzU+W
 aYD8s63dWpUxCzNW7hbBKeH573kI4/JE+9A07USkrsXZPLnm
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_130351_827233_F2E257A5 
X-CRM114-Status: GOOD (  12.18  )
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

Correct the pinctrl controller node name to use the same address as the
reg property.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index f34f60cde594..aa42377b47da 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -249,7 +249,7 @@ pericfg: syscon@10003000 {
 		#reset-cells = <1>;
 	};
 
-	pio: pinctrl@10005000 {
+	pio: pinctrl@1000b000 {
 		compatible = "mediatek,mt7623-pinctrl";
 		reg = <0 0x1000b000 0 0x1000>;
 		mediatek,pctl-regmap = <&syscfg_pctl_a>;

-- 
2.43.0


