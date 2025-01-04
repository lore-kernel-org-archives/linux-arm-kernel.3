Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE01E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 21:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5tKgeyFg00MgtfGaAYBuFBjwqBNpORNVJY5iBPqbW0=; b=2MILaAC72xOqBN7iCHsRpHhp+m
	wwGUJgCiXSEC7nQJARU3OHPDUods/D8fPpdHjKGoj/x+T9m5xqx9V4OkldRAzFgr5x7DIsU/7W+Ua
	rjLnQn9AoRG6f1lLIixJYdLKeKUXc4OvDT6tklyKViTo+vWImBIExmQBnnNTnoAouV3i9W74ZQYeB
	7BSI2qvwxxgLS1kCTsuLYV95weI9JSsOjqUbDxyWWGvd73w1FrTAp84vmgtc4cbnum4+08878/UoB
	Am1ZZzQ4peFs5G4+tiSZFnDJ8vOkT0mN43GvbxfkGy3lCIb86OC3EGpgPIr+DcAm+B5VPFgXBPr75
	a/MMfaXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBHH-0000000Fbst-05JM;
	Sat, 04 Jan 2025 21:01:47 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBAW-0000000Faid-1A47
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 20:54:49 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa6647a7556so241511066b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 12:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736024086; x=1736628886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5tKgeyFg00MgtfGaAYBuFBjwqBNpORNVJY5iBPqbW0=;
        b=aFHhnW81pNMrojdmZN1sgDNjGK0zLA9MHEQbKtxnct1rZSUjOCpiTKIaRUk+GwwKNU
         ek3jv1boQrnO2tmurbp0NYtCsj3o8NmcJcZqpe78n56Ky9ePb8WJnjvFYswb9tOnhsD0
         h4StQ+6YhaDQJSDqrH4p/2FWzybBm6q6chn/ltx3bsAVB+DdlIUgRt3jtiekviCt+xYi
         +VbpU7fp7trdEyZ+4J/Tj0TRqE2V21A7C7Kg3bcWB9Ug2PEK+jsLN6LqeklvMMPBFI92
         BkPV9dn9WXsqpKY4aSPHTrQpTE/yTABCxqEI3It89NEjWxwP1Mnc98vjS34AXtlb9y39
         c7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736024086; x=1736628886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5tKgeyFg00MgtfGaAYBuFBjwqBNpORNVJY5iBPqbW0=;
        b=CHtiH+u2MiK07SrN7OsKaHfMNquwJBCujwCUgsFD4LWD1cHXsVaTb7w4Bzc7dVLoGG
         vFvLmVZhpu9RI2VrabtUsL7wyjPBsuxGMJqTeamFluQO+u0Hqa+MAZiSSbUsfG5aBpd2
         Q61HsjdnNCu2LA0lNyo4aPsfDNQxQBtWme512o3EcCsPkgd+Cb9OvhHHmLH0jws9pbdH
         2DjEh/Ptw8HDKMhdPUjJRQWFEHscYObA9GfBoEvYrRzaOHbqpfojmS76XVdGx7NCK5Lb
         Hd9eTbXBhb8zIkBf3lgxGO7zqwS3jXHk9Ru+KVfAvxtJom1mpyPC9rEt62J+x+IxnkIx
         fz/g==
X-Forwarded-Encrypted: i=1; AJvYcCUr2QceshLtpN6VTNZXGkeT9jct0sSwCiaLktkw18I01JcDHSzPrvtOKRwNsHQrmyPUotWCMgIn0TMvRTSj3F2h@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy/Kvz7p72TJdgitu9DBCDc0U8ijV/S8eGPPG5zXhsszwOnYjv
	+bmOutEXSsykACW0TZlyBml7n3csfXdNSWXo+/bpoZUtg4wbg014PftdwD8FBauRBzVpSdPaQ0u
	F
X-Gm-Gg: ASbGncu4hxz7jpAaUm9l7NaQE31KTOYrA0p6A3ceGmcbS/jW3OImPuScM7kGJCO5Wp2
	o4FNRZ1d4NRB6C5FguLFEClFk9YPDp6TjDCtU3BMM0A5FMBbjTsZZuW/+DJbtFU7tMpAhU8ve81
	0J3dKjmTOoBAJAIC6oB/els5NTYEjXQOoSHgcEPc5kfMdK9Mi92g3qm5mO7mlc+w2bZsgMNqL8E
	NHlNQK+DMNW10BGjggHS7DZVYOfHP/LGISV33a6w9yDB0vw75vAvFlYLjWFD1tCX6SDznE=
X-Google-Smtp-Source: AGHT+IFYBTBJPclwUSGwCj06Or/uq4VGv6lfISakgOmL+cPEXrHfIpLkbx2RfKlkxwiJ7dN0dGBBQQ==
X-Received: by 2002:a05:6402:2349:b0:5d0:214b:96b4 with SMTP id 4fb4d7f45d1cf-5d81dd5a17dmr16470255a12.1.1736024086537;
        Sat, 04 Jan 2025 12:54:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf4a841749sm839666666b.137.2025.01.04.12.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 12:54:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] spi: cs42l43: Make handling missing spk-id GPIOs explicit
Date: Sat,  4 Jan 2025 21:54:36 +0100
Message-ID: <20250104205437.184782-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
References: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_125448_314922_4FE1E823 
X-CRM114-Status: GOOD (  14.16  )
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

gpiod_get_array_optional() for spk-id GPIOs can return NULL, if they are
missing, so do not pass the value to PTR_ERR but instead explicitly
treat NULL as acceptable condition.  The old code was correct, but
misleading because PTR_ERR usually is used on errors.

Reported by Smatch:
  drivers/spi/spi-cs42l43.c:241 cs42l43_get_speaker_id_gpios() warn: passing zero to 'PTR_ERR'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-cs42l43.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cs42l43.c b/drivers/spi/spi-cs42l43.c
index ceefc253c549..90180662c4c2 100644
--- a/drivers/spi/spi-cs42l43.c
+++ b/drivers/spi/spi-cs42l43.c
@@ -237,7 +237,9 @@ static int cs42l43_get_speaker_id_gpios(struct cs42l43_spi *priv, int *result)
 	int i, ret;
 
 	descs = gpiod_get_array_optional(priv->dev, "spk-id", GPIOD_IN);
-	if (IS_ERR_OR_NULL(descs))
+	if (!descs)
+		return 0;
+	else if (IS_ERR_OR_NULL(descs))
 		return PTR_ERR(descs);
 
 	spkid = 0;
-- 
2.43.0


