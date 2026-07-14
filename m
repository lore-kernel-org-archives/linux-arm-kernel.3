Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF46BC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BTBeOTYIOKIk3GZzx/H2GNcllpLfatvGrcCCGYprRVY=; b=DnwRk99qa6igI3RFb46jr8B2Zd
	4/B456FWMA72hCMN5rb2FBErk0bmqdYG0xyZoctVY6GYihGaWG/UZj4hhi/oAadU1E+c8lrVetrrT
	HsUk/YYV9QdGiVcQhb+PGCViYz2QuahHN1jWu6JT/UVvL+ZXtsyKiT8AIhF+I4Z3uXyRxDERL6++f
	FMWH4pziV9ccMEd4QL7Noj55owN9HuXd0PPbv646UNPDLQwN19qOe6TZnujmaXuct1GxAR3d8nIl5
	E/Mb65IRPa+ZiYpHbMAALIFbP1FJOSlXvSlh3wMNmvpGGlEPHV823tDMNzB2C9+Jj1orkk2Ja7Mt2
	rssx+cig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjier-0000000D1fF-1yh7;
	Tue, 14 Jul 2026 19:19:09 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjieo-0000000D1eJ-0bZX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:19:08 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7eb4d532e65so1814070a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784056745; x=1784661545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BTBeOTYIOKIk3GZzx/H2GNcllpLfatvGrcCCGYprRVY=;
        b=dUkYe2k2GH8jk23TpRJcQKIsVnPvWxoxGup3qIiAc0DCM0vS6YfjpjG5IYltre82id
         oZRYtR5n5faHBKr3fV7d5znYOVB7K+H9aCOboOgTbRrynBJGKOsIzXgAVEXjJyan5QrW
         SP7hpI2lX8FZJuMC7kR+OBY3pQZ7tWJMyUnXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056745; x=1784661545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTBeOTYIOKIk3GZzx/H2GNcllpLfatvGrcCCGYprRVY=;
        b=pzc5oODh1L0rPv5oPrlQcQe4pBLCjpwa7fQb127OiYdGTFburYDVf6LxFMuQ2grOfN
         qNsetNy7uOV6WcPpTfqlPBol82fwPrS/dqhskEcopunFyyfI3TGwkMCTF9wMYMVTqj+a
         clb1apqphFiryj1tnYLghCqTM19DIbASUZuVX0HTgphM7LZQHdPWIOFHGHgJIwHiFPDf
         WJKoqnJNAlpB3ACc11H7JENi9ljpgr44Z+BefkJ/bVe79lLoeVksqXib41ORXgxx/bxh
         L897P3tsOpvd0UWRuTL/MrmTfWHGdehJumIOBhObhKmOno1kaujEg4cEJBwWwclErFvQ
         mOXA==
X-Forwarded-Encrypted: i=1; AFNElJ/WdpoRAekpiR/DiYqP/qyrBJbGpHE1qWqcc3vumSlgHk2WBELmRBwx873Y+6zmy1+kDSAgu/KAHnZZry1kvpp6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6nR4r9+X0SgaB4zLqFK2SEseD6pdg6Y3+kKR2BE0Ro4n4leXu
	ke3bsQe/Ugk24ebKkQs/uilCQSQbrtiSqPiJTUjQPJHPkzvlnvAEtdjd6koIAU1hAw==
X-Gm-Gg: AfdE7ckxq6cMdLvwvO1131g92nq1C2jFOuWcVSjXFI/hdpZsRLTJLAVIuljKbDH29oh
	fKTmJT07mJt7J6ZYLIhEpqY54qVtAAQPi5A4GFdBCXuBXJAmJ0TrewI5CJtK+nILza0oQjexuyc
	GaK4qU7vNvQJQAqyqaDqCPF8IO7CGdlIVAYTcsPRkmnUbz+cHdixezq8ppNFiIQYHohz2itHRXM
	92i+w3pzS1cYQ+pV/g533bRileBuh6t6G9SBAP5Y7sddXA5X3LHpSiGWL44NhGdV4u/dbCytQ+r
	zU7hOdwErj+a2ZcEJPe+ObFv6H/05vlm4PIhDBJugaKxgZtBDnLjUw4XOhniye8ktIEs0pOiMrx
	LXSTosmU6lOkrtSwKQDu3YelPFGM1qr1kR9f0azSfi5y1XNwmQFYF3IL7Goq6f2oyzEumRsPszL
	x5pSOSPtuXV7S8x5soew==
X-Received: by 2002:a05:6830:6a91:b0:7e6:e349:539a with SMTP id 46e09a7af769-7ec097aab48mr9268737a34.21.1784056745121;
        Tue, 14 Jul 2026 12:19:05 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb3f2b86sm15713103a34.26.2026.07.14.12.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:19:04 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Simon Glass <sjg@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jamie Iles <jamie@jamieiles.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: watchdog: snps,dw-wdt: Add RV1106 compatible
Date: Tue, 14 Jul 2026 13:18:57 -0600
Message-ID: <20260714131856.v2.1.b5339e64b3fe4338b3924ebd9dc0096904699744@changeid>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_121906_185709_F60DB66D 
X-CRM114-Status: GOOD (  10.35  )
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

Add the compatible for the watchdog of the Rockchip RV1106, which is
compatible with the Synopsys DesignWare watchdog.

Signed-off-by: Simon Glass <sjg@chromium.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

(no changes since v1)

 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index 9d25f5e497e2..2b16b7c2787b 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -35,6 +35,7 @@ properties:
               - rockchip,rk3576-wdt
               - rockchip,rk3588-wdt
               - rockchip,rv1103b-wdt
+              - rockchip,rv1106-wdt
               - rockchip,rv1108-wdt
               - rockchip,rv1126-wdt
           - const: snps,dw-wdt
---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
branch: rv1106d2

-- 
2.43.0


