Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D312AC531E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 22:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=081DBHJ9byQhuCIF18IP6rSG8pXIUMsZt7o8E3vwHTM=; b=EhfmEQJnQfxeEQaYdrfaNYglDI
	VLlF5JToGw6Zo6wcB8ewQJHVNw1ZHSSMb4Nq3MBkUasEJFLfN4P7EHYpWPVtDKDYXQMp7KTQC8ZCS
	jHgA1Bc9RGXMfeVeb5S7JWsAK4jWxUjMMnmdYNrUlZqUPxrhfOtFd49ObL384DSmlOv7yK8trCPVn
	ky+w6nhVGifFAsEkb+HY8sT6X71XPKXjcDrIut2jiXyqwLDG1yNj+bWOJWBHZs1n88mBF7GsaMZk4
	eeiCG+8DWEHiAirzk8NKEg/Wk7Nn8Ljn0Vwn6ZMokVBSOCd8UaKIMs0fuEaQL63vN0/y7ToYWyXeF
	FP49FtUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCwC-0000000CEQs-3Pli;
	Thu, 19 Feb 2026 22:56:00 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCw8-0000000CEHn-0CHF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 22:55:58 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7d4c9537f90so991780a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 14:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771541755; x=1772146555; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=081DBHJ9byQhuCIF18IP6rSG8pXIUMsZt7o8E3vwHTM=;
        b=bWL3JfDdmJLm37Rhhg7Ud+WbBYgE3ogx4E1dyqPoPLqwrylO+WVX/QCNbvpb1W0hUA
         gqU2qsnSSiwFAt8f8jTseWANLAO83Rt+Ax7Uw8VGgRasHupoWVFghQ8dbiX53RYedjzE
         9bQk7gKg/zcy7oeA1idXMtVuKiX1BcxPgmmvixknUi5foiO4ho1QmYEgjZ9Nf/F1WCwG
         kSDfmIBXym+w78yUWaaJwM92elzBmO8OTwYGupc3MrUvpvKPicZKvscD+MzPPobSiCBF
         6ncwJV+NaQZ8TYuToeDESz6tavj/yFS4DOSrE0k2Q17gARkJ6U7DINWFW99gyN3S27xh
         2poA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771541755; x=1772146555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=081DBHJ9byQhuCIF18IP6rSG8pXIUMsZt7o8E3vwHTM=;
        b=soDJsRBpw1XWwrgnoc+ORB6u1qsPKIypIzOG0pD2RA3F8+hhUdNlnHcXQMEGeL0J+7
         lVL5UM6eFhtP3KTl1XmVnhabUVR4EI06DC/U/3KBOsoxcnaawxWZcbdoEzXG6x2LD4M7
         XpR1lNDeWjSWXkc7SI4qa47QcR0NYTDKVfnoBYQSfi1dbk15ztJxT5kc2kArveIZYcko
         +Dt89qX3GglFS+9+PWIGuJ8DFHEXJgFQKi5KkCN8hJTwknId+zvDasFr98JrXVFM4zgH
         suAYIFl/AVYBs4rhExaSPEOZW7gEVI8R3YotuUWQiX6NTBSSgHKPITUb1CLsNfnLBEwQ
         nkng==
X-Forwarded-Encrypted: i=1; AJvYcCXkbe/6ciCfs9Z7mNSzwMUC3pwoHif2bLI+gbTF8E4kHj6qhwYxc2y/gRT60m69r2LfSAy8InIXBZ/moOwtDU+L@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6/m83OtJ5yBf1rHkc8IGu97GaHcr7ZQQyxRPGuzfjr9ZWA3yW
	eYw3AUlr/x8DmhGEgl9rh0INLV6yOUhjasxmCLVKksZOO9/tfVomUs+mnmiNL9yr/TI=
X-Gm-Gg: AZuq6aJqfpts8M6MD4g+hYvT+CmELsKXY1xIjaCX/I4NHuMzL9Z/bOGceJZMHzGqt5U
	s5AdWIXHLZJtMnyUwI9CSsh2cSSEu4z4wM8lGTOcDHvgR4tNneeuiiv/B6NLYBQYOZSduSySVGb
	OpW5HZ5V791lQxyfN4VxeUOWM7LEbIKxhQW2FbTU2j58x+evgC1CumqYbb8XVYkdubEwOJ+CG/e
	TQpmUDa9cis8HDYNAFCvh0LHxPX5LF7OU88j5kDNWKzCtRB0dMluHOkHgbYY5N9M8I/WT3WTnzw
	WgshlhuckjnqJglVTXEl5BV4B8Qyt4sznjbmt5xj6FAPNTfQihrKlQTuVjtXQJ3hnbKcx+xXRvF
	5ZdFwKzMempShtNQmqpU49KY2uTyF7lntLfqSqZWd8MOm1bYSHPm9//nPNCLjQ+cQ8zVWTnjtgH
	QtgZyaaMMHcoEfzrOI6EChYCHnOkAPsBsIWue+
X-Received: by 2002:a05:6830:2a0a:b0:7c6:9eac:2385 with SMTP id 46e09a7af769-7d505db43admr4518064a34.5.1771541755291;
        Thu, 19 Feb 2026 14:55:55 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a7720a95sm20565585a34.29.2026.02.19.14.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 14:55:54 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 19 Feb 2026 16:55:29 -0600
Subject: [PATCH 1/2] arm64: dts: mediatek: mt6359: give regulators unique
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-mtk-mt6359-fix-regulator-names-v1-1-ee0fcebfe1d9@baylibre.com>
References: <20260219-mtk-mt6359-fix-regulator-names-v1-0-ee0fcebfe1d9@baylibre.com>
In-Reply-To: <20260219-mtk-mt6359-fix-regulator-names-v1-0-ee0fcebfe1d9@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=xXiKD4lBzQGOHXS63TgwS//+Jh77xLfimj0o5Ix5Ov8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpl5TszZbjrmAd5pml3aXjip8WgoYU3VpfTDz+K
 O3loN2g4biJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaZeU7AAKCRDCzCAB/wGP
 wJ4+B/0Q41N9GaCv2pSsvORzYWEFvNeBrjIpaCnJbMMNs9538cNjdcZIoKbtOvqDRlK3pdzRGkr
 qJiDG/+z/Y75ZYoEPAdNrsPbbEhZ168oPvvI7A1JYCtSfktpQD2VdDeNB5d2/olYEn1n/wzi43O
 WXECxwu5beRFL3NYDQ/fv5gcb1UVuLJXUNnn8eotmG8qNiTy1j4/+vMjloUvA2bgCwzrAPV8ak3
 r0pGlFN7aZdd2fZp0HVnl95LJr+3OCThwD31UttQ7FhZ69VYO6R9ct2/p5F6ryW37ySEQDsAHgz
 lkiUqoB+yFYfT0gz3RVpi0U9xl0Qxxx/U54FbRka77olKgMg
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_145556_105045_A2F3A377 
X-CRM114-Status: GOOD (  12.98  )
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

Change the regulator-name properties to be unique for all regulators.
U-Boot cannot handle duplicate names.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 467d8a4c2aa7..45ad69ee49ed 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -205,7 +205,7 @@ mt6359_vrfck_ldo_reg: ldo_vrfck {
 				regulator-max-microvolt = <1700000>;
 			};
 			mt6359_vrfck_1_ldo_reg: ldo_vrfck_1 {
-				regulator-name = "vrfck";
+				regulator-name = "vrfck_1";
 				regulator-min-microvolt = <1240000>;
 				regulator-max-microvolt = <1600000>;
 			};
@@ -227,7 +227,7 @@ mt6359_vemc_ldo_reg: ldo_vemc {
 				regulator-max-microvolt = <3300000>;
 			};
 			mt6359_vemc_1_ldo_reg: ldo_vemc_1 {
-				regulator-name = "vemc";
+				regulator-name = "vemc_1";
 				regulator-min-microvolt = <2500000>;
 				regulator-max-microvolt = <3300000>;
 			};

-- 
2.43.0


