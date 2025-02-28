Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D94C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdYvUWAb7XTZZfCxvHyVpJfqR01oQeWoaD5JV/9jAh4=; b=NA3w9m4cWg7PnMvoKNk0CEIfqw
	3CZLk6xFqGyhH+8E66MhG9dve1qZObCrMYhoX+8rGbWYS7WtHAP8XmGWjqB3ZNBUaW+FAJxeLa5QB
	ZHbw2ssaAt0bfVLfP47Hj6qnrsGDK4h2W1PALArZb04NfA//2vaOczLqRSKBLIhtNOdnn1lwbtAF/
	++RNFhty/ppdAQcwp0Nibd2DsJdqPwi8wRImOqoq0VW8RZZA4HvR9194hPJmhQDitZkUhYWOdrpiz
	K72XoanTkhc+iq/iwj5HOjNLH4cVkcaLAZSfFWKRflSWb1q7/+021pgOE+KMUEI7fk/Fcl8WC7XSv
	GqIb7fRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrmJ-00000009hYg-1pji;
	Fri, 28 Feb 2025 04:15:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrjI-00000009gj9-3YUk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:12:06 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22349bb8605so34129145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740715924; x=1741320724; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdYvUWAb7XTZZfCxvHyVpJfqR01oQeWoaD5JV/9jAh4=;
        b=AjIboLQvmR5Hvik9JkaWCd8C6BFTo+NXH2WCFfcoHTu+CqXhGhdL235/JNSh9e272C
         N19kqjkLXpxTf6pNSZQAE5XfwAHj1iv5cDY4+WMdPvB7i3JqrazvysliKZWxuvvjbDZj
         fcelbDFKbhkZkgB+nq+hMsGYfmO+UimkJlhM9C0Vj5xxPZoTDGIq4FomLVDC7wOwpAD7
         DodWFshZk7Of2Nx8xg5AQ+N34YhLy9+dOe2GiMayG2drPF6IciHy7FIS1Zj/cH2+rbiu
         ETiGOF6ppHjl3rRhbSzYAneargJl9fC+O/6hPHw4QXV3zjIEgWbGduau+OZD2tpZ18aH
         HvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715924; x=1741320724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FdYvUWAb7XTZZfCxvHyVpJfqR01oQeWoaD5JV/9jAh4=;
        b=TQmEpaWMMbNxC+xHWclYEBVBL17eD7z/dScNfI+2g/gf9eJjnW9nwROoumuw5YkF+2
         74fDbPvBUeG8OcuWuUyOU3WEevUROb8oYTZXx3r9npGzjpAirkL8PRpwSTfvYvUCOJvK
         Kxu6zqj4G4cGU/GaxAfiOpRUK2c+AdNUTO1YqKoXWBbFj4sWwj4lnHXaNXTJmvUD9jAh
         CF9V9xiMdfKbVpodTCvlmirUvd1b/i6xyBPWTdfFmheVe2ApSZOnXs7yZlFqv3eyiGfs
         prgDIYD3YO60VJR3RZCiOW9K7jLP8UKYfPtR0u4zmeJMEg7Z5dROmPrlCjZxDeCDo4Fr
         NMew==
X-Forwarded-Encrypted: i=1; AJvYcCXDFsJdLphZF0vhJmHwwdDw3Qpyr1M4ty6UthWHed6/eMuSee8+L5z5QBmFxVaVB1S2X0Zqq2aGCHo+x0eQV9/v@lists.infradead.org
X-Gm-Message-State: AOJu0YyoBdou7mrR5SCS2PGjjUli+YmhVMlqIE2NJ4lMIcdci2M/tERs
	/DpXITQGAvdya5JhdGt9l7NATNmUiuIAe9HNE108dmp3ZlnWpER7AcLiMA==
X-Gm-Gg: ASbGncvi4Dd0JH9hVDe3oGXdkqvYelbohUr+zDTOV6GZl3UQEmDHPc/miSVJHESH6mI
	uMvqLqWkW9FjndySPXRO0eehgudzNZpavfealzytmkxC6QGe+ntoMOojlz4ef0V1N/dsqhlhUCN
	mi3GdRpDlv4HsJ3Ry1ppzSUTIzNFNCKAQSwKw2T+mN00P/Vies0v3baFxW7KKpAxvQcbEETFDeH
	QujsUqZ5L5uz+Z+o+Ed8zSeJdLSkTZyjGFqbIpSr8rVwBzNyQB92njLvNea6pw12HnuF76kJi/6
	KhLmvrHD7iw9Ow5WBOfNh5VYkgY=
X-Google-Smtp-Source: AGHT+IEZUDDAXLavQwDXUSG1W13QFrekWn1iP4y3s5pFZHode2QXMI3+ncgQHGdyNcHsE7wI8qqVmw==
X-Received: by 2002:a05:6a21:9988:b0:1f0:e4e7:ef7c with SMTP id adf61e73a8af0-1f2f4e10369mr3442876637.28.1740715924154;
        Thu, 27 Feb 2025 20:12:04 -0800 (PST)
Received: from [127.0.1.1] ([49.130.74.133])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-aee7dec4114sm2387856a12.57.2025.02.27.20.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:12:03 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:06:41 +0800
Subject: [PATCH v5 01/11] dt-bindings: arm: pmu: Add Apple A7-A11, T2 SoC
 CPU PMU compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-apple-cpmu-v5-1-9e124cd28ed4@gmail.com>
References: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
In-Reply-To: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=gbMJbPuP8ggCUDDTugVSbzAiMEjb5T+FHE+EE/UhRsE=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTeHIP4AdceqgfqxLnsvMGDhSyXATgprKvgaa
 Qf2+iYrtMuJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E3hwAKCRABygi3psUI
 JFzuD/9gYz+RAoruClJw73GI5SFqh8fyk3LiF5737RSNGLV7U/CDN+EykGjIgKhR4GgDqsmkw+r
 tliJKzZf2aWdpvqNlHBnOLA1rd4us2L0rYCv0a0vQk2tL2uFIwcLruKJuYZKRAX6ldZnMcixNHB
 zi07woYDiS/gqHtxca+5BHc2Y7EJLz0XGAOKuwTK13SNtXJTrGnadJbs0NyeiPwMZEXlpCUJii7
 BrzGnbE5r1eIir0kPNy+Vfq6NW630pUeCgeuN5eCpoNZ19hNSkzi2Zh1t/ayQwEu0zvj9/8h79F
 4OasT7nq9Dt3fIHNFklDSUihpGVOsb45PQxK5J6oCAje6EwCbkmsP7XqqzJ+gAIriYaA4ALXaRo
 CAtfDAChnIQ0zB0ygioHtykCJcFnn5uofSppoa48y8sLRYPpc93+zZ5JzRL3w9nc8Eem+hpeFKL
 YDaHD2svRQnItWmAbTv6M6iObzf0KtFTZfHAYMvc1yApfdYtaHaMpNsHcH8TL8NsO42j4N7IG0J
 zfpyzSVZ5cJU3G1EyZmc3g+PocymlIVkLoUYODskLq3iXz8svgNkRhUcjUm2MassRUVfxxJyB/n
 wiiA3ddz0cJ+Dc5cltKtfWF4OQuGvGCDQN2a05PayEUv0HXhb7oq68dgYrMhL3RcrYn23kByQBi
 PjJvDiA2PWqdHPA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_201204_890845_8CFAC9EE 
X-CRM114-Status: UNSURE (   9.10  )
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

Document the compatibles for Apple A7-A11, T2 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index a148ff54f2b8a92fa3fcfa78c1bcc525dba1c6dd..d2e7f19cf6a2d7d2348d163d37c2787c7a36bbd4 100644
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
2.48.1


