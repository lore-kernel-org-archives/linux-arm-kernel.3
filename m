Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED15CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7IroGFfuMHil+70rPWoixnASrFWM1LVOm0U4Tub+go=; b=sH20XqDyDI2GiUm4XCYJWkqqRl
	YmXNyDVokNK4Aq8uiCgx1UaW6dJN1E6zDHvsvrxseEfAnf61jInzuOAOM09JHEiiGO5PNGoGGGuO5
	pSs7ou7OVSblU+g77l+GVDoZ9Ciy6BuVzd0J9sFtGwvaCWldvhDAVLtDt0ZOCEVlj7AcDk/N/q7kF
	t2GMK+nu+iq6bcaiIVUnNt0dAqYmaD3atnDkRalqbN0SSt2z4H9AHLQW7FkM1iJuv5oA7BrtzaajI
	evKzQwHpmg/Xvps8BxVYnshA8JyQXOJ/TWwQjh8n0FXUmG84PjzFlc/A+9GsRY3HWcJ96DGtWC9fU
	Lmbzgz7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gZd-0000000Gia3-371G;
	Tue, 14 Oct 2025 15:04:25 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gZb-0000000GiYq-3G2n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:04:24 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-789fb76b466so4965756b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454263; x=1761059063; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7IroGFfuMHil+70rPWoixnASrFWM1LVOm0U4Tub+go=;
        b=Op8VCwQwdg3UsrMb+G3kxB1odUNId7HVP613zRFQDb5KTxV/a+O2jSQkT4kGW+NZU6
         Tv5+ZxmOolHBO+vBm4J4QZIK/ZWI+x86hUrrcU+ZxP+DaFuuNo3CaGcgwynqnpPel3Hc
         FJz3mLety6aCmL/FOfIUoYiYxX3bptmle138gdvr3zlHy/QjXTfM5uihFHTQEZtUKjWQ
         dKwSXUeeH0odm+5HwPS5Ry9Drri5buGtHWbIeRCzuQG0ggNPPFYrONNVOKipG1CTy6kl
         mJ092bWjW7ZZzkxUsjxdHowuxV3ATVWOq3F/DgnW5SKoeslzaDTjJ95gRW3GIFpCRYej
         Q3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454263; x=1761059063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7IroGFfuMHil+70rPWoixnASrFWM1LVOm0U4Tub+go=;
        b=l0wxkHylatTwamkBl6WPN/QfztC4MhndkJk1FL2brbAVe1LaXAATIrBLIKndvKgbe/
         QG2MYK7/NDzZiJT/EHXg9xdKQtWngx+6wbKhmNkXJA5tCEhdxNf9F7cqhytjHETQtvkm
         BJwDDBMclppc6KMbYz+etvLt2X75vgrdM8DrEWx+LhEd2FZ4AyIghKznhCM5MAshPMSu
         5F+kRX41vYILJPunnGYwR5qQI+BDKwi2HWpKx3RcP/uSyP+I3qxetz2Vayjx+NFEBeTU
         1+QhB/Bj+VR+SHW57om8chqzSX5WoMyI6Me1pOHWeRSIPocPJ5jCTpQWY8/kb4wOwOE7
         oliQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6HhOA7buaz0YYl/ONf4mWRsvrsIqyOrGSTPF2f1RCCjy4cntjd80p/NoY0r85HkFYeC01tNw9TihnBD2maE5b@lists.infradead.org
X-Gm-Message-State: AOJu0YwV4bfMP13jUs7Al4fRUY6vUVGciJ5NvIYjuNWGm34IrcyaU+Uy
	jJ7cp4DAK9J9z47S2SK+c3A2CgvG8dAg4CWA9yI46/6JI7yVQ12X+MfIYiyP5Q==
X-Gm-Gg: ASbGncuMeFBteWFhyEHKEx8cuPCBF7M5BfGWJFS3aJp+87gvHrJGqNWzQ1W16UmvBde
	xc1Pru+jfbukyMmv70SpYLc72sleoY3ZDCNNl4Op+5Bi9agP6yRVSUKwgZNm4n2Bp8Mzlb0T8nU
	sHmNTX20ZnlOfvZXoiB6+E3Fs65ANYb9sF2yy96DANkiOzIfszeuZF+m4T6jJJZe/J7FFZJclT+
	vIR5jhjAWnkHoebcNeO588fayuPBJ6lCqSF6J+8URkWBX8Pgxu7qYbOf4dpzBTqgMN2gyzlGEC8
	MeAgrxuK7vdp25+rJ6V6vY+tDsvu705+OUzHmUYJfHMHWZPxNfTo4/GSw3xFpatR64KTpxmNPSz
	CXwgXeVznSa8yJuu9cGfO1XOsqdWyo72QEY39a7NEZ08=
X-Google-Smtp-Source: AGHT+IH1Ue4p5OCLX4CRfhF+JPw8oqTqN7O/BSJ9WA0RvFwdGeAb81e776hbse5RQcmrAj2fPtdD1Q==
X-Received: by 2002:a05:6a20:72a2:b0:262:9461:2e59 with SMTP id adf61e73a8af0-32da83df936mr30917032637.39.1760454262600;
        Tue, 14 Oct 2025 08:04:22 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:04:22 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:34 +0800
Subject: [PATCH RESEND v8 01/21] dt-bindings: arm: pmu: Add Apple A7-A11
 SoC CPU PMU compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-1-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=octx4ZTnNO/R4DCoPqgavGVNNjwOBSkdB0RJJeuCRxU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZsiLQHOHuDXQKieC7EAHvU1ZyAcFv2c7NnB
 u8sNmO0kKuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbAAKCRABygi3psUI
 JERND/9BESP2xLUOegwP5HtDf4olDrM+n/Nf+ieBcAXuVPuWct0DXG5/WilKWfA/ucbdraT0ZRA
 gOUSCkdD3PQZhOkfiqLuI3yNYdJuwSBep9h9IaoibF6w+vX9nfD3RXq0J9HUhNwkBuLQUKiHvL5
 1XxrLqauIaAKgo0IHvcsfxJ0R9yk5fg0i5X6pZ23LgUxQsKuou04zkS6NQWVNa3XZLyerev5D15
 7V886q19ojxV/AahWKOAG+uJQlK/SIq4V7uU4vGicAiOVQEyObgrHJ+75rqRZXltRC1kmXI1Eje
 qAVdMu9HHQtHNfx+RTVLfZy+8mQowXCD4mS9uI2RSanf3NH1NXoc9xC0HJZ5JkWwwkznuB4180a
 mSvILhVUtdx5ga1P1wDIfsqE/qEof8LuICuv5dgVyTgyrfDhyKtAkcRubxx4Lel1KaxR78REw2U
 W2jKUc+cnwoK3KUUFXD/3HlMYZKeSjcQe66yYTkObNJh+6Gy2XAhRbK1A9o1NEygIU9ut3Gve6K
 Pw8moaYQpAY3niul4GMPotz8eiLK7zPkJ7dmpvdjfFhf3CkJknFlr3R4njVOwJsYB2L8pRBckMs
 0OaU1t835QMSvdx7T9iSt08WbuqRsE6DPyGeDJpz+qljG4VeDTUXjt0ogUMZunmHAnS71rwACto
 xYZpCZlxPxOXcsg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_080423_843032_E3B2A6E7 
X-CRM114-Status: UNSURE (   9.48  )
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
index 295963a3cae799a54560557137dd6b3cf4bd00f9..3726e1b78c42f150cf1dc68a6b3aa3541517c311 100644
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
2.51.0


