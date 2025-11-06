Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB70CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5w8hxKvRTGPo6IVAgTGxIFQbqEmNhRknqABWcJ9Jzg=; b=NwKyNNNf+cEyqQPxhwb0VKPG1K
	goas56V/wv/kQr1EyTWyXNI1bwAJBzEslfv6Xu+W3ekWiySa6AezAtILGlQUIo53PoK2zp7dGuzZO
	etdIUILfeXKV9SywcvOPltN9tHO0MZVgWgqpPjVkneQGHCm3NDg32AK09XkS/S5VsEExH7rMGjkDe
	Iq3MPf1jaLWdb33QZbf6Jdya3watFH4i4XcaK4VOqh0AkNZJ+8MjXCHnYukuEQ5deJqVEZAZCY31n
	ixnSsxT+TMiE3iMICJAt3oCok6sk8TKyv51Q5DZa0cEn/ITFbyUspvPi5l1KlhMdcS0lsAKeyQYqD
	b3mUPpbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2uJ-0000000Fw15-0NiK;
	Thu, 06 Nov 2025 16:32:19 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2uD-0000000Fvuc-2Zbb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:32:16 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-640ed7f26b0so184422a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762446732; x=1763051532; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5w8hxKvRTGPo6IVAgTGxIFQbqEmNhRknqABWcJ9Jzg=;
        b=tp3cDSQdzU5J45P1dVbIZUZmC/BgoDHgTGyiVeWrlSUeveBlZTh0epeCHQi2TToGJD
         /esifHGnYcYyk7jakbRBYym6yZhI7zUpIW8732nPZtex/yoSvsIlG2015qPcuFhoaCef
         qH6nImt8O9foNq0BozkXis5g7v9E1JpeH3lV/SOh+diWhssVrQa8XUfcDWKCyH1KoCpo
         /NfxuJ5gle4n9oB78/FKtQxEapliO2HIcZ5nWhu3Z36KBsQZO9wd3bu4op5eBAY5fcsh
         6ojFljTv2zLQXAc/rpBu2h6BWJKbKndFd5uqVDj463oDxxrVvzRPXfVrAprpQbS2rWuu
         ct/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446732; x=1763051532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5w8hxKvRTGPo6IVAgTGxIFQbqEmNhRknqABWcJ9Jzg=;
        b=KMsWKx9YlyPFQ0NomW81nOQJN5+R4fXTKc72CtB/xv6EZMHzoS/LjCw+FtKIqCzZZl
         ZQjhpqXlK4fVuJclf1hb3e3vVZX387+iIJutV6xj3hlGq3ElT08xcg30+E6h6BI05nja
         z4rtmHeyFOP8dk43KCtf/xwEvJAUpQ0f3UR4PIkNOh0F71WIAXZdTlXKfzHbE08hSVh/
         sZ87Sf1qivEETUMFnRSCakjh+pDk5WNd5eVl5xHzGWbe0IISU7w/6BHagWdrrUWhsM1k
         Gv4iS7BC+eFLKrBwX9WUJPbWavtaHNNmaHi81SZf+1Ef+rFkJCieJk13pzz8r99IFAH4
         Cs6g==
X-Forwarded-Encrypted: i=1; AJvYcCXGdyZf9Lz5CHw1lp2HqZBEAwRI0B4Z0DX4uS9uQ8Sm/KwjL75C8AFfH7py7I55C56QzcDgt5gaGON84yrlFBrV@lists.infradead.org
X-Gm-Message-State: AOJu0YytPntn0nlf9ttl73Yo/LLvwlfzT53DrGkqHjR2AGNEkfbVWAIo
	uWE7Q8c8QEpw3mPpeXOulyfh0w7CqkImYuBtDkSYszdKZoNC7tO+3/wxdS4rXO4swHY=
X-Gm-Gg: ASbGnctAr0Ew2Y4RTWnX/+8O2l9Tdx2mH18h8QGDDy8bfhcoudxWnCwDC2GEMvnLlIb
	ob09U8JUwY4V6Ofv9d280JVyz2pzkdP4AKh94gQshaRy3Z6+dySrf68Ih8iwUX8x8Ue0ih+olst
	MqR4k2Dcq3Yg4zS2A0Ec+XkqHVorWwPD7wCzfTknXkITq3K3fvyi71sNrI5cKU0C/jpMMIyqgyx
	1Id9508H6yOePfiafLpT9fAPzqZcNa1E7t9w9JonlrxB/KZw61ER9rzdShIDE4TJ2PIGIHnHZXx
	0XQwkpARxuqdjvOBnBykUqbtPOe4CHuy0I2qhJoT0ZJC+5CT2PCi2GNHX+6GB1IZSpY/5UibX5X
	dLwjm/bY+ObHQm2SsunGelkhWTpfSSzc9SkTiiKaoOjzAvv2BL1pJukM9ttT41uK2tUug44zYna
	qXgDHrro3h9A0qse11HyLlHGAHXHw=
X-Google-Smtp-Source: AGHT+IE9h1lVDXWHqHj++HSZUT/NFsSiE1jYUZHNmeLSFQNvfG4uP3f+jidAfY0g2Kf4kE3sf0UIzQ==
X-Received: by 2002:a17:906:7312:b0:b72:5d4a:45d4 with SMTP id a640c23a62f3a-b726529529amr440381766b.3.1762446731609;
        Thu, 06 Nov 2025 08:32:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7289682544sm249625566b.53.2025.11.06.08.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:32:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 17:31:57 +0100
Subject: [PATCH 5/6] crypto: ccp - Simplify with of_device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-crypto-of-match-v1-5-36b26cd35cff@linaro.org>
References: <20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org>
In-Reply-To: <20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org>
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, 
 Srujana Challa <schalla@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>
Cc: linux-crypto@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@axis.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=L3Ng/aC4fiC+veLj0saleTuVV2+DCXLKDn5kGqHtuy0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDM1/OKTMp82LpfdWbmimej/PbfwdV/l181iXL
 aSDDQ45vi6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzNfwAKCRDBN2bmhouD
 180yD/9YhNT1mZl/Gz0eu9cIi6GLKX/FcdI1PNrXMl8bw7s4vs1hVt9p9r/kUMoST9QyDOIwnYw
 XS+PuirEFbK+HmBlGgfxdA91pX+AGFO+J23YE6atRjfNOAsGSTc2sVRgv6DKDXKeSbqKs/Dm1j4
 ecZuoXXG4FuC1khyhcp8YVQrVNRvseXzEISg7jolnlwq1siSSf0hYONVx6Y8hVU78dn5y7RZJyJ
 E6NgvHZcWxzARm5BDGGMr2wJ8oa4lyyIl2a1xtzArRjQmabZLTEAV9EZ0E28DHRJ13d56NnkYmV
 iNmFJyL5F3U24cBwn0VSm1L8J7VtUXp6zGw3effQ5wk95PP8SSbIDNMOSfjdljfXTEswYxZmWPa
 dfBnAr8LBBy5iIn/QpvVuVIYde3WjRgY/vjxv6YdzZ+fwqlJgu9NSXMB3S8UB+66t8Ll9VhQW/Z
 2HSHHYJwZjmqYy/4D13eV/bLfalQcFfPA5ihUnKCpzSqTNXT0ojLLosi1LNXvjQIllwogaqqvUR
 x9jzgeU6hQiUO4ZPa5e224D8zDWDp3d5QrbMm/B/GDeAmd8NI3xy2yb4wykagxyd31YQ9Xnpzum
 Cd7LO4hFlWXOYgMoFeSFgqjOjkhsNe1S+TNtM/hqg6jwNt14Rg0LLrm5VOJErM5swlNr2EhgKZK
 awaGOcR/fI5C97w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_083213_722993_52C331D7 
X-CRM114-Status: GOOD (  13.19  )
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

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/crypto/ccp/sp-platform.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/crypto/ccp/sp-platform.c b/drivers/crypto/ccp/sp-platform.c
index de8a8183efdb..3f9843fa7782 100644
--- a/drivers/crypto/ccp/sp-platform.c
+++ b/drivers/crypto/ccp/sp-platform.c
@@ -52,17 +52,6 @@ static const struct of_device_id sp_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sp_of_match);
 
-static struct sp_dev_vdata *sp_get_of_version(struct platform_device *pdev)
-{
-	const struct of_device_id *match;
-
-	match = of_match_node(sp_of_match, pdev->dev.of_node);
-	if (match && match->data)
-		return (struct sp_dev_vdata *)match->data;
-
-	return NULL;
-}
-
 static const struct sp_dev_vdata *sp_get_acpi_version(struct platform_device *pdev)
 {
 	const struct acpi_device_id *match;
@@ -123,7 +112,7 @@ static int sp_platform_probe(struct platform_device *pdev)
 		goto e_err;
 
 	sp->dev_specific = sp_platform;
-	sp->dev_vdata = pdev->dev.of_node ? sp_get_of_version(pdev)
+	sp->dev_vdata = pdev->dev.of_node ? of_device_get_match_data(&pdev->dev)
 					 : sp_get_acpi_version(pdev);
 	if (!sp->dev_vdata) {
 		ret = -ENODEV;

-- 
2.48.1


