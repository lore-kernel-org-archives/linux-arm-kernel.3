Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23201093190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDGOglO7IMqYnkwgfR6oUN6v8rO29Is2tHBRv7dt4O0=; b=ibiTywDJGsMmrGHD7bOo/D1Wnf
	hkYEIA4NhLtPBrJ/x0TGQ9xnbMud8EyUgfcgK8GtVw+U5D3wQMQoef+Rfzfx0lOiFcFRGGbcSOp2n
	fVTz7Vi5D9qWDEwV8hViqDu1hCIQtr2zb22IWxOL8hht/pdyVC/Nf2JtyNMIOJaVi5RDfo6d2go8S
	5Pp7QPLVH3Bo1DQlpMI+PRbMcDkTOHTiZg7opGrrY3SVQVOzT/W7ts8SOVOF3jBULhcG3I5kFXunJ
	VpBd8jljfZWGohI12Ll6IUHKib6bNaFOOT1N32BdMPATE4SCniLNLkPfzV11u+6LFXne/JHVt6Vu7
	iPWKNj6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VTK-0000000COKC-0Dfs;
	Fri, 20 Mar 2026 08:44:46 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSx-0000000CNsF-1LVG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:24 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-359f35dfef6so213202a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996262; x=1774601062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDGOglO7IMqYnkwgfR6oUN6v8rO29Is2tHBRv7dt4O0=;
        b=flYFCkTPBdmml9BIVxYwV+YN398YpwoxHk1YLb0SSCV1BSwFFfcbGzvOmLTXxQcu1u
         SEklUhfBX/DcPq/r09/qFIBMk5L0DksmX3Iq4J1rpzz5oXKGOem4b+S85TUxS+7PPXqh
         Q6KvQWoPY/pfiNEPQvV3jH+nfSDTv9yURQg/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996262; x=1774601062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qDGOglO7IMqYnkwgfR6oUN6v8rO29Is2tHBRv7dt4O0=;
        b=JwIEg+aFn0+JgYCJKlvnpz/kfuVgvnOMNejwsftyzmJZU5ypaX4uI2QC4YtMFpZ5FX
         tRgh9SjrMtnRVGpaeb7O2yG734tZ6twTNOk+IhqytBZjpQjmwtVkiYUNFgoZNZA5KsMx
         fQJySBU4sromrAs3PNlJBr3DSkAfRmWesxzx5O8EPh64O4A/M+5RfyRnp89tG2UHhWQG
         nlOPQjhKkY07OGMGuwGYt2P+wKULUfgs6EINiHvuILJ7/dgXMnIJ/rwZJ+xjvVyaLnMC
         msNA7tG9yB9gORnpqdV3Mw12YzMdYMff5sP99KyZ3YHPokxfTQtIehwTs+dijAe+qi7m
         NO3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+T977Bb/UbFo79rQ0PYGdTWZd3CuhPo/ZP6iUFcegxqjcImpduGI3z7KgtY9cpXapGzIqc8xKaT8t0JT8dgie@lists.infradead.org
X-Gm-Message-State: AOJu0YyqLLhIGEEAwbCKRBybS5MAl3Z6SH3qLT5mxPX1vb/+zJGQV9hR
	ND5udvwcXKuX0ETd2OJ7ZFKR6PKmkQJ5kfYvq4Ou1bNE37ggyh1T56zGtNRdcAZDiCgbO3uoLkN
	IuaQ=
X-Gm-Gg: ATEYQzz+ZfVIXz2cECS8wPveoeO2addNZTw/3vJvVrLAVUTWgMUnYBDnbxbq17CZ0Jh
	mSPNm51jEKXgIF2Xq4R3wXfq7th3/NXftG36IADRcPaP0/q1GjhF/YbrsGz4oI5tjjFg3aUqNC3
	yqATsjfAAJbn+a//oX9Q6ro8gdnVwKJaAyheKRsaUzJuxSXV26bjQDQPq4EmXtuVmCndvSc27Zd
	pQsvCTeoGSCYDEwP6lX2nRy7RMCBz8P0YM6iaH7tZO6nL6Y8ENehkdowpplfiK0W7Ugq9L08N5R
	jGB8mXRVkzh/qi4abhlWucSS1Jt7qnKDl9fWqAgigYnio53W1D+31rZKhYjiSZHWcWMBZ5aIx5C
	ucQEO3F6gn6opuQ6NBW+jpDo/A63at2b07Bjbmmqoeaa2IXmoTTnxY6CQLQSmRdU3Kao32ufcqu
	+B/FN3uuCqWsNnU9D0e09PLHQmC+bqssPSiX402/6ST6D1oIukhkbh3nAI84tAnnXO3We6ta4wK
	LrAs/9DxllSAqBY3ps=
X-Received: by 2002:a17:903:1b6b:b0:2ae:bf92:5acc with SMTP id d9443c01a7336-2b0826ff359mr19764785ad.3.1773996262311;
        Fri, 20 Mar 2026 01:44:22 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:21 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/13] arm64: dts: mediatek: mt8195-cherry: Add MT6315 PMIC supplies
Date: Fri, 20 Mar 2026 16:43:42 +0800
Message-ID: <20260320084351.2461060-11-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014423_381492_C6F9BC31 
X-CRM114-Status: GOOD (  11.69  )
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

The MT8195 Cherry design has two MT6315 PMICs. One has 4 outputs ganged
together; the other has 2 outputs ganged together, and the other two
unused.

Add supplies for these two PMICs. Since the outputs are ganged together,
just add the supply for the first one.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index b53e602659a7..ca747531629d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1478,6 +1478,8 @@ mt6315@6 {
 		reg = <0x6 SPMI_USID>;
 
 		regulators {
+			pvdd1-supply = <&pp4200_z2>;
+
 			mt6315_6_vbuck1: vbuck1 {
 				regulator-name = "Vbcpu";
 				regulator-min-microvolt = <400000>;
@@ -1495,6 +1497,8 @@ mt6315@7 {
 		reg = <0x7 SPMI_USID>;
 
 		regulators {
+			pvdd1-supply = <&pp4200_z2>;
+
 			mt6315_7_vbuck1: vbuck1 {
 				regulator-name = "Vgpu";
 				regulator-min-microvolt = <400000>;
-- 
2.53.0.959.g497ff81fa9-goog


