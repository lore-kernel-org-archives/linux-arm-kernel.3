Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E72E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 05:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToTdfUFmfxqqBVuM594sv5/lAPTiIQZKFHPkEQ17A1c=; b=yUBG/6x/LUzcSZo1HwfTvRfDL5
	Jj+f+nJMiEWlf/dqR1fsP1SOZXZ67AbsKF4ylVuusoUeX8/RRBSVntbO1wm9oVzcHRHkrqnxjCGaV
	TGWdsGn5J0T3Mv8pj7zBrLW33CgPJVEvzDdwNc0RiRH1qb/wvIbU7EkGmvPYc6ia/J9Xf9cV321aC
	Dyo1kEO2uFs5v/dmwQt2dcavWEw2k1i7Kk/yFOls2PFRu8Oj63f6l8OeX6XjhoYAM/PGGSA8FY+l6
	4yMMzNRKTAOocsBUEeBpJdN9a5NAH+wpTnbzRUei4NMr88U6ir/WTFtVGnqLEiXm2foRUKUDNFPTD
	Et9K7bDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFLO-0000000DqXX-1NrJ;
	Wed, 11 Dec 2024 05:33:06 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFDR-0000000Dp9g-1kn4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 05:24:55 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7273967f2f0so2419043b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 21:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733894693; x=1734499493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToTdfUFmfxqqBVuM594sv5/lAPTiIQZKFHPkEQ17A1c=;
        b=DUdXVVQhleKihfU0/9dNdZ+lSwMs51jH1xNmj5a/pH7WapHGQ7twtNegZXXjccQS8f
         PyDZqRHrzosXWrDseHb3RzelG1ay9vCRxun+hT7urWg7U/4Vuky0Z6BwgseR/jac4K8Z
         +X0OEOGoqZ85YTaUQFIJLZLwjtsY+XVljKxFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733894693; x=1734499493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToTdfUFmfxqqBVuM594sv5/lAPTiIQZKFHPkEQ17A1c=;
        b=CvmBJHJrXnfx9Vd7phIq5yYc8SiA4gqxSGeaoOnEt/GUa+bUKJyuCHln+D76AVt/Ph
         6EyrdllHj169/AZxG8NcHS1oBJ6g2t1V3DMQ26QY+K0YVlgHyviLBWHz6nt6igxoLh8a
         3VxY71hdWyurMYQzgDC0YirYBS/Dlt6RoxjMRh3x/3OuaTI8t2vwWYrV5d+/EUM2YkSY
         uUVidWCbAgepeNima/jbs8bfaM8J4lLjUULUDMPbu/ki++rigjuXFZQ0r7ACFo1/bUuj
         7Yc0bv8MmosdbCXH1fQFd+5BL3HHzpmC+jQbtiaUG5CqXhHY64QckhpLEJGtcxYSCKCO
         fPVA==
X-Forwarded-Encrypted: i=1; AJvYcCV/nlmibiKQPbnDaECyBhhCJ0aknAgCpLZWqxlac9eH/cnavfg1WGsPkkrJuWkzqPJgi45YmBe0PR8iWwMNkuO9@lists.infradead.org
X-Gm-Message-State: AOJu0YwNZh+yMtBOAj2+Imgxazn8Gp5GtM+bdCu4qTW2cQzN0PrtXCEY
	wWFaoeXX0SY4qevOQKlFfRL9nTgJy17LoJRtZU7Gj0UKPVU4wvI8HFU7FlElMQ==
X-Gm-Gg: ASbGncvmAT7WKOSMyMb6/Q9yaFFAL93AjJzqVPkto2wHoN0Eq8S5AZ+vi4Oi1UG+dhy
	91HUnhZ+OxzuuQIbgCF2dhPG87pwWeGSa13kZPeD+XzMXPACdYxWxOfdfaDqSMRCIFJuF4vula7
	9otWoI6AMXIKjEdo+VI78zhcmm3kb1PyczXYfzKTjoxWcWvhd/BADNJl9RzPRS3TSe8fPBaOZXd
	Bbf8gPvRhx4lTEaVgnk2Gu+f3YRcZVMvx1m0m0LTz4YLecTvcpWVDVqZK0iZY3FTS8fZ5jx
X-Google-Smtp-Source: AGHT+IGlSrx9j4anjyHnvyNo1U+TCm1tsOqFjYIOo+mjUoxzwUz0kLYufreA4nXpiCewnzAxgBLNnA==
X-Received: by 2002:a05:6a21:99a0:b0:1e1:a06b:375a with SMTP id adf61e73a8af0-1e1c1380cd4mr2924903637.35.1733894692966;
        Tue, 10 Dec 2024 21:24:52 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e66801e2sm5397702b3a.160.2024.12.10.21.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:24:52 -0800 (PST)
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
Subject: [PATCH 7/8] arm64: dts: medaitek: mt8395-nio-12l: Drop regulator-compatible property
Date: Wed, 11 Dec 2024 13:24:25 +0800
Message-ID: <20241211052427.4178367-8-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241211052427.4178367-1-wenst@chromium.org>
References: <20241211052427.4178367-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_212453_449175_5E5C607E 
X-CRM114-Status: GOOD (  12.55  )
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

Drop the "regulator-compatible" property from the board dts. The
property values are the same as the node name, so everything should
continue to work.

Fixes: 96564b1e2ea4 ("arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 14ec970c4e49..41dc34837b02 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -812,7 +812,6 @@ mt6315_6: pmic@6 {
 
 		regulators {
 			mt6315_6_vbuck1: vbuck1 {
-				regulator-compatible = "vbuck1";
 				regulator-name = "Vbcpu";
 				regulator-min-microvolt = <300000>;
 				regulator-max-microvolt = <1193750>;
@@ -829,7 +828,6 @@ mt6315_7: pmic@7 {
 
 		regulators {
 			mt6315_7_vbuck1: vbuck1 {
-				regulator-compatible = "vbuck1";
 				regulator-name = "Vgpu";
 				regulator-min-microvolt = <300000>;
 				regulator-max-microvolt = <1193750>;
-- 
2.47.0.338.g60cca15819-goog


