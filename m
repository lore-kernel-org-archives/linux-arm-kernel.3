Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4303CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aU3ckHK9dgiwiJ1SDtj2Q9mmUFDa+cikTDpXLmxraq0=; b=Zw+ouY7SDeeEFPygePYvxEvRED
	RH5DOaX5BGRvlbRI+SzEcFieqxQeio+gZWEV2GPjpLfAk7lB8qWYeFFVZeUKcMyqtzJE9/AOadKSc
	LPVXx6DMi9gGc8mw752opexL2B3OiKdYsFhlCkODE2MioSCQafhIN7REx6n+GOHFbCp5/OchBPUGT
	JZpG4tQrC+hmXkw6+ZMOwg/3b9VsB90EbF3cL82tWVlP1GU2qNaS0Xcfx2ABJaCD8pyi1PSZMJ6ZT
	n28ZV0Uwx6jPwPbPJQpdC9J1pREa7UNIu/h7xrPOq7VBX7rNdsgd76x0xEGYqVKea94BDuoN2zzt/
	QYGuUwXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHe2-0000000GqyJ-1XVw;
	Fri, 07 Nov 2025 08:16:30 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHdy-0000000Gqt6-0KpA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:16:27 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-429c5e0f94eso22927f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 00:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762503384; x=1763108184; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aU3ckHK9dgiwiJ1SDtj2Q9mmUFDa+cikTDpXLmxraq0=;
        b=ptGW9eoJ8r6cPa9E0TbG1VVq65QTM0vN5nNeEx6kh47zlaCHrZ0+JFVBU1+m+aSSYj
         g/iiCTlztgZtAflgNXUa8igxes8OvLbmYXFmmBM9itxk00u9sdt2hpgvWO5tvy04QxIN
         GzhRQPFjOq83oiRu/04ZAyOnjJGy18ZQ4LCVI7neIMIpahsKiCyTyJOOM3dkt77mtQ8A
         fjs6YU9JBG8MWiHleksInqWMyURn6ewGrpfw76Qtxicm1eHET2ajvBlNxAZ1tmdva8nW
         DbmQG0zzi6sr+Vh+3ubSR20LT3dOca4xjvJHeRi66MsKTRVAOX0VfGih1UrMpSNJqDDp
         3F4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503384; x=1763108184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aU3ckHK9dgiwiJ1SDtj2Q9mmUFDa+cikTDpXLmxraq0=;
        b=IGpaRXpPnCkNUbGqJB72sTQIm/O34L6HMFuzXZsUAwY4iN4q3oMHNCLvi2sI5/IYKu
         ns0toihm7RYl5+MaopQXECXQFRX/UTQySehHNExuTlvYIaVYzRmtcI+5N59OrOhgOkBm
         cv92wO+JO1EWXrE0Q6LQpufCVtu1ThkQikuTswtwUGYmW/1N4YhN+tLCSs/SEFWZiq7z
         MRVvqVO+xtHHQ0QgMRSct1Jiil6QZet5gRMgb7sPYCvNTNMWApsx19SBNIYK8PszMDNV
         P9ebUJNcfI/dO1ATHRfg4Fyo2Pz7XeI7acrbjj+WcR5bUpqBaS2UpzpCPgXw7ZhD9h6P
         IWNA==
X-Forwarded-Encrypted: i=1; AJvYcCXINtP4loXHtEWc6j7xhAGN7miJxLTe6b/wVsNcwSGToawkZabGw+kqawjRr4fCdwoU8/zQ2QzwiQQCbEQW6dy2@lists.infradead.org
X-Gm-Message-State: AOJu0YwXxPTPvoTt0DAEgCVp1u5SiBDvr/GOdKlpZjzjba5p45WDJN/6
	ygm/4+S4PGDh2WLtJtbrJApIHNhR05YrdyO5tgxzpvuVVmidNzVvXT5Ea8uYCZA8r50=
X-Gm-Gg: ASbGncvJZKNQck7hyyZu3u0zlJgsdTC4m8kQMDztcjIybWFx43FGI+Sy+sSr8CpovHk
	qKpwxCAMTDIZ/o4W14dw2Bb6OLHg5EvyF8J+CO3wsPklLgESzdI4GTpAk9U0PAVxUHVpdDjEZag
	D3I6iulUwzWub60EglUFvoXTIYfmEVXoMYKao3eWdFdf4J562Qhst0QEkK6X7Sh9f1svurLUmBJ
	F5TY3SK9p8ss9DQSDVbueeEqhvj/3dVhKPmfJ5AS9pSjJJnvAmwvpGSdyFrfD4LjgR77B+/36m3
	mxuTzZCbX9a7QciOKhprgz9ds6PYKZowma/iOtwGY09nHYtGbDQHB7l4U0LEtNIGHn+xwgzYgCr
	vVCLpeQdv8a4xfh4XC7U9dDo3PUMqMhuKM2C4nWCq4V0mS81Hc26j9QJFQfgz/x9wwBl4GaZKXU
	ia8y59DNwBo7Wyn+kQ
X-Google-Smtp-Source: AGHT+IH/RG0uxXiS/Bad3Qza1ZSpzCt5mxPh4pMV3zd/0zfxxfO/oX4SzRHF7EYOxVilfXSfENyJNA==
X-Received: by 2002:a05:6000:1848:b0:429:b751:7922 with SMTP id ffacd0b85a97d-42ae5aeaef9mr862850f8f.8.1762503384161;
        Fri, 07 Nov 2025 00:16:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d544sm4058381f8f.46.2025.11.07.00.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:16:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 07 Nov 2025 09:15:50 +0100
Subject: [PATCH v2 3/6] crypto: artpec6 - Simplify with
 of_device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-crypto-of-match-v2-3-a0ea93e24d2a@linaro.org>
References: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
In-Reply-To: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=DQmjxDQk3FjHige1OE8Ou8+bJv85dK/Lal/Y6klcg5k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDarNuKezPIUCrc4hA8Jc267ky7kEGrYSaIA8q
 xzBceHykJGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQ2qzQAKCRDBN2bmhouD
 1yXbEACApfTnmc9QitQZ7XSNkCS4VPyfKF/yLOgWiI3obDxmie7No/brRdIf5LMnNazuIyPCZF3
 cFWq/lMz/XGuXHwd6JfKiB/7CaeiEGhSVesqCG6xiLwn9swYpTXCRAkfkSfvLUJ1zw6Dqh79+nm
 RcWi4MkYDvpv05EKstpdQAc0p93wcuPKRkneKXx+eaPyUE/Lh37ne4zR3Ct8U+21S0sLADr6CoN
 cEwOiG5d3LIphAp78Y3xCT7+UqZKyQfKVrF04V5E3jF4bAbL9KiZhgHxfr6u1Ymtoigbvr75tHF
 rrjHned89Lt/e4LJnp716ojV8vi8qBD0fziwotfbBGbZc9WCPWIddPJKbtcD6JEGZSBGptebElN
 q5XqPkiqkSa4aWdQrwmi/H/uZ7aefqryw156F+Bj5DQwnJTuw+6tA4vFnB0N2caGA1hNIAoqvJQ
 QS1fmrXafW0XOKw2lvkL5EJSix7d5URiz8RrEq6geM1aajgUHhypvhCFmUw3Pg1Zs0rp01uWCRd
 CHkS0/IfDTayW/vN1mHLSqv81WjvP1xoesX5Vico0Y4V07eB8RwSIC8cGNs+0A2EgDPy6mJyacY
 bQ/pElgAalP6edLqPZQS5dRVAwQA6cVRgw2JqSebY+zuOKUJwlNxGqWvYZbjVPpq/nQp8yVweXr
 9i4P/m1X/ZKL/bg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_001626_226648_76B5AA27 
X-CRM114-Status: GOOD (  15.18  )
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

Driver's probe function matches against driver's of_device_id table, so
of_match_node() can be simplified with of_device_get_match_data().

This requires changing the enum used in the driver match data entries to
non-zero, to be able to recognize error case of
of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/crypto/axis/artpec6_crypto.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/axis/artpec6_crypto.c b/drivers/crypto/axis/artpec6_crypto.c
index 75ee065da1ec..b04d6379244a 100644
--- a/drivers/crypto/axis/artpec6_crypto.c
+++ b/drivers/crypto/axis/artpec6_crypto.c
@@ -252,7 +252,7 @@ struct artpec6_crypto_dma_descriptors {
 };
 
 enum artpec6_crypto_variant {
-	ARTPEC6_CRYPTO,
+	ARTPEC6_CRYPTO = 1,
 	ARTPEC7_CRYPTO,
 };
 
@@ -2842,7 +2842,6 @@ MODULE_DEVICE_TABLE(of, artpec6_crypto_of_match);
 
 static int artpec6_crypto_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	enum artpec6_crypto_variant variant;
 	struct artpec6_crypto *ac;
 	struct device *dev = &pdev->dev;
@@ -2853,12 +2852,10 @@ static int artpec6_crypto_probe(struct platform_device *pdev)
 	if (artpec6_crypto_dev)
 		return -ENODEV;
 
-	match = of_match_node(artpec6_crypto_of_match, dev->of_node);
-	if (!match)
+	variant = (enum artpec6_crypto_variant)of_device_get_match_data(dev);
+	if (!variant)
 		return -EINVAL;
 
-	variant = (enum artpec6_crypto_variant)match->data;
-
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);

-- 
2.48.1


