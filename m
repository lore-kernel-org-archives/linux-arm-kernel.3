Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8B4E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 05:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRYLo1XVsoZcdIe8JMdl8StALXaXVo/fdHv6b61KhZg=; b=sPwUq1pcl/aWjc9zdIjYzEDp6i
	CLX/0fZTYPAtH5HYccbuOb0p1aLPJj0A6pMlSDxtw4mDjySvsvm4QueseXPMNa6Bie5OTcA1/8kB5
	B6DD30TC2AdXpqZFCBL5IqTfvculjy73/d5B6U5muNk+NnzKE4Nz4PNQqSW3dmU50x4Dyjg60juIl
	KESofAFSJgoKYXIkDxpuUOmhuJtbDFKteofZxGo0iLVVlIFFoy7HP9zkXWhnmT6IEYfhlXBCNPRWz
	QGkVxZE6mIFvrIXglBCSMPxVyEPW2iC8P9TKsfPSZNUiVIFZjezZBKJCr1wh4flSns4ScF7oWabFS
	N/uLIVQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFMP-0000000Dqkg-0r7p;
	Wed, 11 Dec 2024 05:34:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFDU-0000000DpAy-1kur
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 05:24:57 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-728f1525565so134594b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 21:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733894695; x=1734499495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRYLo1XVsoZcdIe8JMdl8StALXaXVo/fdHv6b61KhZg=;
        b=etpK22ujyWGhHho6th+4fkkiXJXyO09JPEfVZD3/2SNnWRZ6jkBoOVF0OPrF9D8r+B
         x78ywlnGchqr9hAoyDSzmyDUUS0HbbM//LdT5NdDRR0P2Lt1hwBEMocWZP2tLPaSG83G
         Sw8ZV5WCJS+acg0fRIKZ8WWnrCgWpsUqeymDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733894695; x=1734499495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRYLo1XVsoZcdIe8JMdl8StALXaXVo/fdHv6b61KhZg=;
        b=gEiR+PBySXaTJSysm8VzDdOQ8h1VbflW1wbuohtvjYjZ51tGLjZPIL+IfGh/008tKG
         Lw2OyXj7IaHHCFqG5ak9xVGKgfxYOtylX19lp/cxJqomWSC280l7ArTPSPyN1U9TRZio
         FAlR3KhtYJzFm4A/VX5LislogtMtlnR3CCtGaNtgrLe+UvpQjEDztmjJvh7DYEnFDexp
         8+5RVdiME2pawOR5eJU0ucKsUi2uuHWb8DupehtaH8ZGVyPcdQ6FivjIK85whEN/AR0x
         UdaqLW7L0LkXTylLt/iUeI7R1ivK/3fNeEhJzEBqPccEQnhSsb5gnbj2MgU8Lqea42qe
         p0iQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2AkU+esskrIF73QmeIK+j1/RTMFA3mqoas0MQfcLrDqrx+1ScU4oD/sDFGjXlQp/8rprT70PP8+568x1V8nIA@lists.infradead.org
X-Gm-Message-State: AOJu0YwnQqMd7fLvPmTmtxUVKUvUEYQ0oE1A36ZyvcHSzCZrW7C8H+LM
	Mxp7QlmlVr17gPmthVtmO0rHDqZj8Isrrc2O7nO77QHmvwNkQmvpcKw9ZmFseg==
X-Gm-Gg: ASbGnctEVO8dKKXoOyMK5bxkNb8CPK7pF0HCAcW+e9BPkVLV2RJByA7nu/0FrMwsBWn
	XhADKltTUBdOEy+e1SWVt/VLfSiNJbEjLBojWtuJllBhW578lWeWDq2qMyZOAhPkyzOhzcmH+qv
	MrwJJNVGxaCx61RpdKxxf4rB1cOPrJCP6TCw7VPAiZqUQF3TgWY2s6gtAd6j5qxJXghw4TTnj0a
	PVyKgAP/GyIAnmdOpydtRHKGEGUcAVfrXNXF1HetmkAdgGEe2/SKQ3gV4a3jpdvS/y1ujkE
X-Google-Smtp-Source: AGHT+IGcmT3GR4NnAQIsxi7y5dgBXEJxX3Yf6AWVmokkpdMshwchaRs79fYSgZNuL4uxCYG7JeSC7w==
X-Received: by 2002:aa7:88c7:0:b0:725:ab14:6249 with SMTP id d2e1a72fcca58-728ed1bb30bmr2871732b3a.2.1733894695561;
        Tue, 10 Dec 2024 21:24:55 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e66801e2sm5397702b3a.160.2024.12.10.21.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:24:55 -0800 (PST)
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
Subject: [PATCH 8/8] arm64: dts: mediatek: mt8395-genio-1200-evk: Drop regulator-compatible property
Date: Wed, 11 Dec 2024 13:24:26 +0800
Message-ID: <20241211052427.4178367-9-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241211052427.4178367-1-wenst@chromium.org>
References: <20241211052427.4178367-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_212456_453432_D6F0E76B 
X-CRM114-Status: GOOD (  12.66  )
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

Fixes: f2b543a191b6 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index 5f16fb820580..5950194c9ccb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -835,7 +835,6 @@ mt6315_6: pmic@6 {
 
 		regulators {
 			mt6315_6_vbuck1: vbuck1 {
-				regulator-compatible = "vbuck1";
 				regulator-name = "Vbcpu";
 				regulator-min-microvolt = <300000>;
 				regulator-max-microvolt = <1193750>;
@@ -852,7 +851,6 @@ mt6315_7: pmic@7 {
 
 		regulators {
 			mt6315_7_vbuck1: vbuck1 {
-				regulator-compatible = "vbuck1";
 				regulator-name = "Vgpu";
 				regulator-min-microvolt = <546000>;
 				regulator-max-microvolt = <787000>;
-- 
2.47.0.338.g60cca15819-goog


