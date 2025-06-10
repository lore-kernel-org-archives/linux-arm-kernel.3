Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E74C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 06:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9s3bFxA/iUmk6qSfJ/+0ju+9AuK7egSHjY2rer4xcAU=; b=WI7PWQRYebjb3swItQ0tmRjQo3
	nwgcPzc7TPHYoEePY3cplKy5Hlr5w4w0QsLgHZziCVn8WD1tHGaTEG1iZIzIwCa3o0me4nDPobr+e
	NX5MzBG9rDqCyT+hwqpGsTTJ2wnOtHrcHcfzC5FQu6MbicubnhpkwD3bdD7Qj3QCYEa6U7UfACKC8
	VBl/jum10jWEVhAzfHUXIgt1+/5YHXupddq7I6XVvvKgxhTSn20wVwFksiTmukwFKN6HAyd7uAATq
	ybdz3c3i1ulj7/xa8fsF8XpTVyUsK48vAH0PEdDWYDktXvKUzwaj55BGErtWhNciHKoY/KUVuAHrM
	D9yW9SJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsfe-00000005x1l-0970;
	Tue, 10 Jun 2025 06:41:18 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsZL-00000005wOi-0yqU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 06:34:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-234c5b57557so46725785ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 23:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749537286; x=1750142086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9s3bFxA/iUmk6qSfJ/+0ju+9AuK7egSHjY2rer4xcAU=;
        b=kGNVbqOqQctLmRC0F/ftMaXcj4TjRTk9/IH7VcB3K7lTQKYaroHVfmhBjKCpR1YEga
         7Elknxa/5uWIX77LSaWij+bmFQZg4fpVVWGvbauKjY6KzbuS9Djv1lmWQ08HRPmnmESi
         ciWivw84j5WGDcXllEIMXqhsf5ccuQgA01u1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749537286; x=1750142086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9s3bFxA/iUmk6qSfJ/+0ju+9AuK7egSHjY2rer4xcAU=;
        b=A0ZOME5JENi4RREO8+kpbT8DAldtQNwMIJR3Tw//yb391W2JkbKIs3kv4LKKq38hIY
         gPJyEtoIwsQ34S3R/uILLY0V083KoHO6Hvy6KqqbQVeKLa+8xyGkPpNnuMDYEzD45tgy
         VaHiit4TJzbTd5LGqPKlQ70zKNrd3zAxDQ1SCfx7aOdr/3HMbgdqD/m0zZzMLtMDUVCf
         3Kr/FVBU9ZSfhwtQQeywFhgPWBdy6Py5zoqyDqKLRUSXrDGQRGSm6ueg5BDcZgnTLhB/
         nr1K03JJW22lt6ZLBDroT/8ybk/FHxgO5Jx5+mQOPDLMYW5ERivxea9e+UFmo6pifghU
         E34A==
X-Forwarded-Encrypted: i=1; AJvYcCXkfhcluwPmPOho18YSFd+wFSFs+Y+YBJg5mlXW6iehcSEbvKgBSI7h/OpmIuoSmgaLPxBusYZpSA+Xf+Z7318a@lists.infradead.org
X-Gm-Message-State: AOJu0YzucggNwri7honQbj/krCkuUBic4hq7+gTtTKUypRkn81SobdYu
	WABFOsHAMpMJaqwhx9N+ItlDWl59ayl0MkdUW+u8/rtEKXn5FLN1QtBXh9eAGAyXxg==
X-Gm-Gg: ASbGncvDLo+OF5962bL3boRu/1rS7ueh5MZFMnkcd75cfZFFNGgNBXW9YeudG9YPEfe
	zaTIWxOucT3+dUF4EYhzvCkznk3vhY0TboPh1nkdJyfLTrCg1fFuncgBreIaIZ9lLQiq12J3nki
	MW8stxjVkXEOJWzFdZgSlMlrYA3swGgm/t0/B8N2jFbUQDbJ1t90bWz7HHNuIa/SgIIWwht787S
	3owcFoIzMNQD4dwYYy3Tzbsnz/WChkDSTSTlKKRh1kiqARFJOWOXYAsMWG/4sir7uOa/UUPR/4p
	9sAC9pAVnXC5E20Dfn8Mo9ZlKUrwcyPMgSWTfEnsJCHjiZLKe4eLmhqY1w2cNWapWnv1+bD/FNW
	M4f5tk9IFTQKuhJo=
X-Google-Smtp-Source: AGHT+IFSfenrPgpYS8YpG+M5+osrGMDb3jGStM+tUH+0iHwn7+BobeG4OBWi4Cm0UHiMF1nHBAIopg==
X-Received: by 2002:a17:902:d58b:b0:235:eca0:12d4 with SMTP id d9443c01a7336-23601dcd1f1mr210895915ad.53.1749537286555;
        Mon, 09 Jun 2025 23:34:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2826:ada4:efac:14e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092ee2sm64596765ad.82.2025.06.09.23.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 23:34:46 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8188: Change efuse fallback compatible to mt8186
Date: Tue, 10 Jun 2025 14:34:30 +0800
Message-ID: <20250610063431.2955757-3-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
In-Reply-To: <20250610063431.2955757-1-wenst@chromium.org>
References: <20250610063431.2955757-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_233447_389584_417F92D1 
X-CRM114-Status: GOOD (  14.31  )
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

The efuse block in the MT8188 contains the GPU speed bin cell, and like
the MT8186 one, has the same conversion scheme to work with the GPU OPP
binding. This was reflected in a corresponding change to the efuse DT
binding.

Change the fallback compatible of the MT8188's efuse block from the
generic one to the MT8186 one. This also makes GPU DVFS work properly.

Fixes: d39aacd1021a ("arm64: dts: mediatek: mt8188: add lvts definitions")
Fixes: 50e7592cb696 ("arm64: dts: mediatek: mt8188: Add GPU speed bin NVMEM cells")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 202478407727..90c388f1890f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2183,7 +2183,7 @@ imp_iic_wrap_en: clock-controller@11ec2000 {
 		};
 
 		efuse: efuse@11f20000 {
-			compatible = "mediatek,mt8188-efuse", "mediatek,efuse";
+			compatible = "mediatek,mt8188-efuse", "mediatek,mt8186-efuse";
 			reg = <0 0x11f20000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


