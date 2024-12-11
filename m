Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F3DE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 05:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jun60MmpzFO+KyxqgW/fdFZZGJL7nbsZCnl87/9ABDo=; b=MqrXc4k6CJAUOZq14uej8B/Y1H
	NZT39eUB7O+FEL85YKtYFOJW6UqJoUJ6+2s1lIDgzwLkUhfKsSYTFIGF8JzU1IjLurh+JcawDFZBe
	VDn1qhr1DsgqmQ5ZvdYPYAu1RHIgiU/dP64O/QkV3HkxZ2cUdtG61apMHd6j/qg5ot1nRtg1llreU
	Tzweaf/XQIlWmTI/7jLCNhs+TXMA3wgVMgCRVDZD9QAefa+0LBnOmLRsReOr3wG1usnodQIuAOSUG
	Q3/xvz5JfRGmoCwDRCVGSbwCawWZEjJlUooiTmszxXCjvDNK97eG7WEq/kmrSCYpmt3AE90yAtEDg
	pNMjoLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFFF-0000000Dpc9-0zzG;
	Wed, 11 Dec 2024 05:26:45 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFDC-0000000Dp2u-076q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 05:24:39 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-728e78c4d7bso271413b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 21:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733894677; x=1734499477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jun60MmpzFO+KyxqgW/fdFZZGJL7nbsZCnl87/9ABDo=;
        b=lO0rmazp5TKs25tg6u8oSKqs1pxHm8tGfCp9wOeYzjT4Fi0H1EHZ43ExTjOfxjMzLx
         U7NJXQDM0m4Z+yymmMcFhB1O1SdOjyR05LbNfFE75jm1kKTrQgJgc7P9Wz6e9r+VpQBo
         nx5gnaSB4ypkGw+YDZKRbRgZ+w/2Pyd7l2d44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733894677; x=1734499477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jun60MmpzFO+KyxqgW/fdFZZGJL7nbsZCnl87/9ABDo=;
        b=QoszZbLZc2nyNbG2499WrgjyeN258WA/sag7wlg6yVvqEt2n2Wt2oxvH/3r6+UW0FD
         2NbDvNSphX8UsnFmO8wbuqq4lTTS8wJWeCXHzwiSrvljDCCi3qiIE0yhyB16q5Q7ORmZ
         vHS7oXh0J5yyUMPmIoOv7e2ZCHxV+Iq7+5LV+m/hdLGA/VvcK2KAgWyItzTg+hemVx+x
         PzXRSx4ujLSlNZPBCdWqtZkAz+I8r+vf0if+tVcf6woMaZNRwwDA5Y7lMA+RQiVweGoL
         bw3SC6o8ryj/AAQ/MdQNXAJCHiF9L7hAH7KyCFxmToTNMMJZ2+EaT6HT81gOhhrLvmTh
         ck2w==
X-Forwarded-Encrypted: i=1; AJvYcCVX7tgHEVtQbTMd+yvgRLONEJrxDY7pT7ftp5R14VMf0LHBXfGc4blyT+0yihJVRtX3aVeJoz/SkotDaZFMxvfU@lists.infradead.org
X-Gm-Message-State: AOJu0YyTdf2cCp6BMNj/S866A97RHoRF3wb7PgAMJSS0YhpuxfRQQ0I5
	cABu7a9dvuZavSbCqt6F8kIfXnQVaMgmSZyqyaHkh1mycZ0T28snaDmeaFdCvw==
X-Gm-Gg: ASbGncsHtakFwbMz1O+ur4GD58CZoZZ0Pk0t/FnQYaXm27oZ7GjydjATarQtrjPSIyb
	XQZVXs52wQMYfr0Bcdo6VOWqYdUVOgYE5wX/rLjptuS7W6ed+AnIvHWRQSMokBH6NvDgG1DAui+
	K9DKHmQRexsxMFiijf7t1jdLpwE6oYHdp+rh2+bPKcOlPgAHVdXWve7vLo7QmMdGo8mLteFP09H
	/8yaaepOd568wmPe/Z5LHxXFPq5JAWQ/c+rFADpoMf208/LVrWaklbplkejF/xu8A9uU6a5
X-Google-Smtp-Source: AGHT+IGbqDRc3+clit5iH+/2d79c7sSOb6z0W5OMm5yS5wDnwt6aR/KeI2oLsBGyyaqwf97b+Km3wg==
X-Received: by 2002:a05:6a00:3cc8:b0:725:4a1b:38ec with SMTP id d2e1a72fcca58-728edb5c343mr2486433b3a.3.1733894677079;
        Tue, 10 Dec 2024 21:24:37 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e66801e2sm5397702b3a.160.2024.12.10.21.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:24:36 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] regulator: dt-bindings: mt6315: Drop regulator-compatible property
Date: Wed, 11 Dec 2024 13:24:19 +0800
Message-ID: <20241211052427.4178367-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241211052427.4178367-1-wenst@chromium.org>
References: <20241211052427.4178367-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_212438_065755_12CF23C5 
X-CRM114-Status: GOOD (  10.88  )
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

The "regulator-compatible" property has been deprecated since 2012 in
commit 13511def87b9 ("regulator: deprecate regulator-compatible DT
property"), which is so old it's not even mentioned in the converted
regulator bindings YAML file. It should not have been used for new
submissions such as the MT6315.

Drop the property from the MT6315 regulator binding and its examples.

Fixes: 977fb5b58469 ("regulator: document binding for MT6315 regulator")
Fixes: 6d435a94ba5b ("regulator: mt6315: Enforce regulator-compatible, not name")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/regulator/mt6315-regulator.yaml     | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
index cd4aa27218a1..fa6743bb269d 100644
--- a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
@@ -35,10 +35,6 @@ properties:
         $ref: regulator.yaml#
         unevaluatedProperties: false
 
-        properties:
-          regulator-compatible:
-            pattern: "^vbuck[1-4]$"
-
     additionalProperties: false
 
 required:
@@ -56,7 +52,6 @@ examples:
 
       regulators {
         vbuck1 {
-          regulator-compatible = "vbuck1";
           regulator-min-microvolt = <300000>;
           regulator-max-microvolt = <1193750>;
           regulator-enable-ramp-delay = <256>;
@@ -64,7 +59,6 @@ examples:
         };
 
         vbuck3 {
-          regulator-compatible = "vbuck3";
           regulator-min-microvolt = <300000>;
           regulator-max-microvolt = <1193750>;
           regulator-enable-ramp-delay = <256>;
-- 
2.47.0.338.g60cca15819-goog


