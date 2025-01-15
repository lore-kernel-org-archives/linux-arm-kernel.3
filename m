Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47898C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 21:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ms9IEBzpyk/XVKoMAGsaOzSpnjjWL2vmcBPCCTvooQ0=; b=0e2pBtOby84GFj73GfQL6iuzyP
	ROnmO7pvNyxv91Gi0RAwZwJxGPMwmZ/nKvbUp6Hmi5CcFvlMbeCr4VtFmsGIZnrQUV88jfF1CmTXv
	yZqjF7IXXBhxbaB8AnBGCqJfoHQs0Rl46Ue0zU6Z39gRcmGJrMmiLxpIj4WgDaJKZQciNnNBbFtzM
	XRQOjkEXdVXE/+HezqGMquAIp429ECsqCs0HF8WvCBc5hHISLUh68Wx+1f5c1UdNrB905jAa0oPBW
	mySfKFt35wECABXEPLjaL5soW5E93gKhITdgXJGEvBtTvwoxVsrcculGjak/Xtxpn3OXugh51KUsO
	1eEWVfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAnB-0000000D8g7-3jH8;
	Wed, 15 Jan 2025 21:19:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAl5-0000000D88d-49Za
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 21:17:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43637977fa4so189495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 13:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736975822; x=1737580622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ms9IEBzpyk/XVKoMAGsaOzSpnjjWL2vmcBPCCTvooQ0=;
        b=LJh1pnsX4haIX5ie9IEFKJC+hTyjEs5DaVWHY7yFuse4E+63o8srAW/JaZf5liFbdc
         MKj8HkXGxuwrj+jspKfrpe8fWcRVGr35ZeoiHUfjWV4i5GAuq83DdDi1txPJitdalYsC
         gN2J6gqG0CcZEavHt0ZComSeU8XLwFfSXOcpFSZqO8KX9jQxv4Hbfu1h/dC4fRChaY9B
         /kVqT8Gzr0eT0mWYaWMMoBAw1BNU+qak2eYFkMIUrw169Lw1YxAiJef0jiGOQn65pMlB
         RVkBBPouboymg4pDE+Nbn3wOivZU+4gz8scTT6RAayfVICbsbbouSKflcKkaMfDk1Aub
         Xq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736975822; x=1737580622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ms9IEBzpyk/XVKoMAGsaOzSpnjjWL2vmcBPCCTvooQ0=;
        b=pKtQ5QFK+W+inZRKxZdpZEz498v+oFOhuwdnlzF4n3W1BEKnpdMrquXLgUGznubv1z
         csBPu44wIGbwwDXs388Eee19vwoER0MN0Duq3WMXNzMnW/9jZrV/0Sp1Kd4zShJJBQ6M
         x+AdCIJ3KNKEwwCC7NlejbVIeqAl+jB4nyOgGiBoT2VooVuuz3/sbM9TCaTwFA+Hxkn8
         8k9mFuCGL3IhA1axfBEXdP5plV1gsdEX+97svkRwccPGe4UyanpQIazpOSlzMaDrWG+J
         yXni49HQcrisuUfRFnxkpAQdrnbQoiAWB+eLRInRam54hGXpOUg1bDMNQ2lhr57XwTmC
         jjZw==
X-Forwarded-Encrypted: i=1; AJvYcCW3aJ9XTeSclNY9vYUdbLqZeQJUMmLJ3f45dDkKOoqlKk0UPEeorrt6cpEYLeXLy4nnPp9h/2jS7/GJOgoNl3oM@lists.infradead.org
X-Gm-Message-State: AOJu0YzQOTjZQMHgsInrfuKc9vhZKZbhnHdgEDr+I9w7ipLguEy2ALqM
	2JQFRi7JjuQbe+XmWZT4xPgPc4vXEZPQ1m4EcLMoQwRxQ5NlYPrOJMfm2S27PaQ=
X-Gm-Gg: ASbGncvvQzQ98EJCuKc8BYA5dkN43Vm6JEzZ2GDwpit6BLnG7PYPa35E7f+/ZTLW5Qr
	tOCQz9wdJh5dlJmTWPHUNKgUmM1KKVCta4PCTYiSXh5hwWMMtmnv9U9vw67XxZu1qX9R2KU0ADA
	GR+3Z+/PF+FbRUwbIdYrLJBKEFIMePKXggVmQHCGx/ITy35K9Flj09PlF1cL9yMZV3syjcnO7bk
	c/LxIUihXaaunltJ/ueujFn7t2EKK9LIFFz5bkUy540krAPMxDqo7CQGj4kqPaTvCekJOQ=
X-Google-Smtp-Source: AGHT+IG5sxlfm93ZZqieB+RkF9UShh5QqNGMEBcIF5ekOU9Z+J040z2Zi857k3ycfhveU6zzpgKNFQ==
X-Received: by 2002:a5d:588a:0:b0:385:de67:229e with SMTP id ffacd0b85a97d-38a87308e30mr10527783f8f.11.1736975822395;
        Wed, 15 Jan 2025 13:17:02 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c6a2sm18693379f8f.54.2025.01.15.13.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 13:17:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: nxp: vf: Align GPIO hog name with bindings
Date: Wed, 15 Jan 2025 22:16:58 +0100
Message-ID: <20250115211659.194072-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_131704_034988_517C7AA2 
X-CRM114-Status: GOOD (  11.34  )
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

Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
to fix dtbs_check warning:

  vf610-zii-dev-rev-c.dtb: eth0_intrp: $nodename:0: 'eth0_intrp' does not match '^.+-hog(-[0-9]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
index 6f9878f124c4..4f99044837f8 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
@@ -392,7 +392,7 @@ &uart3 {
 };
 
 &gpio0 {
-	eth0_intrp {
+	eth0-intrp-hog {
 		gpio-hog;
 		gpios = <23 GPIO_ACTIVE_HIGH>;
 		input;
@@ -401,7 +401,7 @@ eth0_intrp {
 };
 
 &gpio3 {
-	eth0_intrp {
+	eth0-intrp-hog {
 		gpio-hog;
 		gpios = <2 GPIO_ACTIVE_HIGH>;
 		input;
-- 
2.43.0


