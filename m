Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CCED65C7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBsTBcVtZ52Xc7+liwX/QWMHum7rwn6gjjvyLUqjbLE=; b=jX8VMq9f0yJjUr0Eg2bOIEDGyp
	5t9g63ENHfMWCZosQksxcMlsiNCDJi21HAqX6/tHgtU9ZQEJ4WSokcSMT7BM1mEb2dw0wgII13bKU
	zkaugwHbBUf8HmLxo/vcm705TFDwi2Bkbua6K8XYZCvmI8iiYXo6WPZlx2lj8L1qUkrSYfSYl5xh2
	9bOgwQgEAt7JX6/zoj27O5smefB/CjY18lY06TEwe/IF4kx9Ta7Buf1yskSCAOQZR11K+7hi4jPfo
	SFKy1SjTp4R2sbDewAMRZ79biXsKOuUlcG98ZSC5q/EDtoTrLjatHw0g0myDuuTG9km7cTy1Xw3LJ
	FXNVseIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKT-000000074jw-2oeL;
	Wed, 17 Dec 2025 16:24:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKQ-000000074id-3vMm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:24:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a1022dda33so30702105ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988682; x=1766593482; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBsTBcVtZ52Xc7+liwX/QWMHum7rwn6gjjvyLUqjbLE=;
        b=Kgph8I73BU0S0t447pg4L9J2JbA8yu/sxdYxOU95Ycs93KyPboCtDnDr28h1BY/Zp8
         q5WCy7JnMy+S/vijWeoG6MPk5VbcBgoEJh0d6UsMo191SI1+xQkHCbnd6btlwYVnKjST
         6HoLNM4U4AJXs4a1Q7MbTGNA5o7k0MZWxQaQpf8DUTYOFIXELSZJn8mJVkbrd/qx+9sY
         g3MGKl84/9nYqKIimESianpBU2ukogUwBGfs1zzaH67REUIrS/edhL6vvFumunYGOEA2
         wjcsZ7PMHwIV/5SauwSOoR4qAf57P8CUiB2n0tLwy1rvUhglQz5lL1Nq5LXp4a7ar+O7
         1TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988682; x=1766593482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CBsTBcVtZ52Xc7+liwX/QWMHum7rwn6gjjvyLUqjbLE=;
        b=w4dzmvZuDvaASeaLyVZ1sLE/M5Eqf4t+Yo/13I4Z/PDZxezr+euvl9HbLia1/0cK6B
         tZgtP8+lvob2tgJ+q7vh2oLHbcLYotNUUk1Gf/S2GRyOk7AOJ4QZ3KZEu/Gts5XJOFnY
         Dj5Vg0rPON5u7cj2pqltPqQ0q97UNE3JoGjHm2W9SrmiMbusi+rIvqLJvIj2zoGaOIhi
         i3g8/5UfmzuM44JnNcwzbpIBO/Qr8bTob/lyHgX3d6TOP6h1Okq30zv4pnn1ng5xSATk
         wzid3b3TG8RNG4nsYR4kkuJVAo5Bmmiiaz4nly3phFaruWQ1IOUrY1DQRkfl++8REf4v
         hx9A==
X-Forwarded-Encrypted: i=1; AJvYcCUX0nTy+pWOnTnue0IH7a7eNmXYXKBVBlARDpPkBajdv3I90sg+3sK40i4Ld5ec6XxgaOLgP2QSHcW6fjKxhZs8@lists.infradead.org
X-Gm-Message-State: AOJu0YwZPSpxmjcfhq3pVeMjUwDUyyvy/gFrC6cxZap1M3CoxPJunxpF
	OLyOi7gu18NY0hWX1s8a8G0QmcPOoAMPiOv85b0eyVR1h46Expez5syt
X-Gm-Gg: AY/fxX7+tc71Wsq+y31MEv+f7eEnOGbHnD3Oubs4Ir68hz2LbA7qpKxfZnp0z9bYysg
	E9v40ssDOYVAMBFcoR46tEBQV/kNILr3XC7PznqMHrmnrN7/96Dsg9X9hsCEZtWlCRQWtKj2sWc
	xEh4pJEOlI+g370J9jzSYjCMLrP07rLJy19bJp7suaHsfGusLUZE4ghKxgF2x038UrM1aO//VPe
	OyjvMnWOwkOFPmdzxepflm8biPqmvugh9gYnnQ4tJ0oOstMQTF/qixXtnMCeaES8pFpCB8xnHKB
	0YD2u+1htuN7rLZNiIPVgGVNry+eXCLnCYw7xLF/3OgkHnpfwwS9S6vPmwWZivAubNkB+OHVUox
	OBtX1rM3Fmf/GA9azCRArYhDJ3kBCDm3zD0D8LnT9L7xF/g7jfoXje4ahYXtfm96cI72Q1LPc2M
	+bXe1hKmcRhq2n
X-Google-Smtp-Source: AGHT+IHerJ40FopgnOq9crZZQAG5AvJv+BI6Pdff7E5Aip3DS5jCH8CIcKubc8M48Ss2JNmpxKhZYg==
X-Received: by 2002:a17:902:f789:b0:29f:2734:6ffb with SMTP id d9443c01a7336-29f27347628mr180428125ad.22.1765988682146;
        Wed, 17 Dec 2025 08:24:42 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:24:41 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:14 +0800
Subject: [PATCH v9 01/21] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-1-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=07n0zpGM1mcRCjmEoORnP+p4Tv6Nx9ryjVOY1OMyuiY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtk/vxtAppGPRI3gSWnHu4Hgsj14l3noyd1EW
 dyQk74BBouJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZPwAKCRABygi3psUI
 JFiAD/0WRDI1uvHw5wnu/YUvKRrNw/aC/10n7dU4nlOOgz+dT2KXA7o+S0CfTGh2NUVNhRrpuoT
 kiFY0DSNFkJ1kJg2hA+mEg2UGBT8OGcCZB6CZOJo3YseuW989tPXypTy38ESuklM3Tz/XkzyiDs
 civ3Rx5FQqHxTNS+wm9nYxtKh4U/2boicojfE9ehPkgcQUXXG66QdjjyXyWK1z6wcyJR3wWPOLr
 leGpDrNP+ObKEOLJIBLDoUiCGWzMqWfDQsSl6dRBtgmNXtFbMukuXkDFDteotZWcTDmh39+2ZEn
 U7zE8lTV9jRgCuh0RKG6oe4CTRdjtaxgygKITh35fCATqjJUhTpc355eJOuJyFi/OmtiAFSAfEw
 YA1+50N9Pd4JbRYFovGZSc78FrPMz/Wwx+I9lGOyDf6j3QFnS0zrMB6/06ZMj6HTtPABNlXvzWi
 qOTBig7MI72khRcL+fEsKZ+yiLg1FryCsvaJZf0CRNQEAocCmCjzcPE8S6QiKVqZQEhICQ+6NTc
 ZQiZYlal8uS2Z6CNF6LxR3NX8WG6l8DlcNCkft6Lp5NdTMmHdd/cd0u/FefQykKx9TvnButGA04
 WwGNHnq04CsmWXXfX0rO+QBhYTbLw2LwCN6FA8HkCXH9fLFB/tY4FDFm5VLA3OgLrbjb7OYAq6J
 sGEJf5OdJIkDI4w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082442_979715_9E0AAB8A 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index f47baaefcdacfd37472926ec6994c33603163a44..97800a991f208448aa4bc8dd59b45df2ff35b400 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.52.0


