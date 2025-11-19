Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E53CF2588
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cHO3B1sEJLSasU2B2qHUUhTLyILqynKrs3iWjmaWkgc=; b=LzjHxE78wUcD51PyM/PFaqRNlK
	w1jHG7DuaNpCFZImO5nG+8dSsB/+rTuvNb+mFCrGz+UnRXdG3DhpTKAINeCYR+MSZSbAoVyHNs5ZE
	m7tKke1TW6ayqBT4qMDwLB2LoMk4wBypp+dhEebZ9+NVAZ1cDs5MS0fcFVxp+SxVLzXZrmPd/Z0xT
	q3kJCs3UutaIqjEktnfmSCngDZ8M5gMNWH+NlSrl1FcRer7AL4hfjLXueIOfNZf9g+tfPLRqnUiUH
	aOfL3ZSqygBsvaguZoVVZzt28KAgHoJt/YQiYXIQFcQ0h/R/AU312GAvY38z2cf01fFKt0Zn1i8ph
	jxI+5SYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcDK-00000002fLf-3SAu;
	Wed, 19 Nov 2025 07:02:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcDH-00000002fKa-3l9L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 07:02:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-297d4a56f97so72361535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 23:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763535767; x=1764140567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cHO3B1sEJLSasU2B2qHUUhTLyILqynKrs3iWjmaWkgc=;
        b=O7TVq9FXJZssls5NfBfRrdN8rY1zI7u0Ny2AFT5Zsm/qXfQZx/ZWYgPxMiwYFgiPwD
         61GHNifnOardPuEQLilcZv0x89KevULfUnhXv0GIU+RAzaVuFeGGL3GcNeb9XgLrAsr4
         TIlBATmHQU7nb0/1RzBCozd8IzlNKOIRCMKlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763535767; x=1764140567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHO3B1sEJLSasU2B2qHUUhTLyILqynKrs3iWjmaWkgc=;
        b=kBVJAgva9AW2tWLD0TkKL9ya8M53wLMJbLC90iYTFS0M/ajIn1fPorW/22FceFAAzu
         QIY9JK2WuaSm2NzlDjnAiPTq2sMCsKOEd9FlEOUibuMWOlUxw7zaQ2KAatJFBMkRywgB
         jNc4G8NdiLBmjLGtv4CgeKDwGpRLVz8wWppLYO/mRyohcbOvUh637Evl4zQ997AHPBsD
         H/4nEF/EeJ1/NZs4Y7aTcExQCVS6Bay+wx9G7Wuk4knRwd7oFRoI2jKNVLN15XGO+fCd
         3t9fNXHQ6yZB72ehjGJNQWwPMneDe5xLrKGDMn0CtAUJ0Oyz/iIsYSmT8x1STY1SLJH2
         3q9g==
X-Forwarded-Encrypted: i=1; AJvYcCVe3uHBimgMb+Z4tCbiZ9yyS1eHB0gRe86J1e8FYXxn2LS0UZjRSFXGmrrq30foZK6RWZDGSIZ3omSWptcyXrAo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjs2e+w4A9ykWhB70nVWuKkPEowDHwlOWUENvem9CA0l01h9cf
	N+C2cFlwzWkw9cywAofszOGK9ZMjDGGtWdrm3GVQ4wZU4V/QSbGSWHtK5G3g5ykYfA==
X-Gm-Gg: ASbGnctxaGNYc/6ashsWpEOoO7lUMufuPMWtQKYm8EGsM8Yq5+abxr5/Qwegx2Ng1qa
	OfSa3UMC3XrRGhJTc47QH2FVMojX0qQKI+rg39FQ9I9ZUOgLW9JlEEzXsIgGK+rzsNgOpSfweTk
	V0VIyGlgNqDI6PyXUi8Yz+CgJkvzgmiv4Mmt7OLf8X45f1uWr0igNXZ4dc93ylKK1Sx/3uVthFg
	tJkOGU/zsUtHK3j1BQJ11JJUrgtieQbhJLPUHRH2V1WXWZZ8uwVmi8Wr5YR9wI/TibzlsCtrxnh
	QexiPR3lJm36ozdNVTzkwTkuFtWpo5ghRDN3Oy5oJL3o21gTLxOmT8C7cFszK8JsdVU7d8y5xzv
	4nAVlE0Y6zCm3hSweuMsNjO8LX/ioAEEZCVV0Lg0G2Ik1XfdC73QfinzLCKOKFPWEEl5TMv+YAf
	3POZGAbPwhUA6xB1BoQTUhYi9WcudW7AP3CTZb9U5udom9Nh6QfjC7c+1tm17mAASwI0dm
X-Google-Smtp-Source: AGHT+IEHSsONT3fw6JCDF1q8w06ko0cndsjR25Hy6eqz8yH+NAuJ24UBek6Rk04rDVhhz02rEcFHkw==
X-Received: by 2002:a17:903:3503:b0:295:54cb:16ac with SMTP id d9443c01a7336-2986a6be3dbmr253974785ad.18.1763535767083;
        Tue, 18 Nov 2025 23:02:47 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:d42c:6a2b:5251:a121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345bc250312sm1529456a91.12.2025.11.18.23.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:02:43 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8188-geralt: drop firmware-name from first SCP core
Date: Wed, 19 Nov 2025 15:02:29 +0800
Message-ID: <20251119070230.1716418-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_230248_221641_0C38B44A 
X-CRM114-Status: GOOD (  11.71  )
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

Arnd pointed out that having firmware-name in the device tree is wrong.
Drop it.

Fixes: e36be19823f0 ("arm64: dts: mediatek: mt8188-geralt: Enable first SCP core")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 7fedbacdac44..8e423504ec05 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -1166,7 +1166,6 @@ &scp_cluster {
 &scp_c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&scp_pins>;
-	firmware-name = "mediatek/mt8188/scp.img";
 	memory-region = <&scp_mem_reserved>;
 	status = "okay";
 };
-- 
2.52.0.rc1.455.g30608eb744-goog


