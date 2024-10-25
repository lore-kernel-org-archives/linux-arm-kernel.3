Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D23D0C601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBspKlYH+nN4eI/HU4r3dQSnTCqsjAVwwkRAWiGEGfQ=; b=WPOJ8l7BbKpFrLYHXNzl4EiBcS
	3iUxdcmuwTDcOgvZsjn5uDoNBPglpKFc5nQLSEOVb7hQFoZZKI8kdmIV0sG6zOeSvElV81R/c9BDG
	QlPX/oj/4VdD5YIsKDXuu8suBfTZ+nCp50EvQHTS7EBxRSZ+Pro35nBuweZvANbD+LLKB4bJPBvrJ
	vBfAbUYkWnnIt8WvPVdcqJcZywJtF58jH2/krsPJeKCRmNELFsA35cm30PVoqYL9nieAeKtAJIwNW
	UpPZGLCXXUrsGlo3yJP43JHuHyP9UCzawihYLsyTyqCl9zDVJ9Oe6JWShFSZ5cO72oWkalR4anbiR
	2L0fuK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IkC-00000003YCN-1OuM;
	Fri, 25 Oct 2024 11:44:40 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IRQ-00000003UyL-1GyC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:25:17 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539f53973fdso1612628e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855514; x=1730460314; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBspKlYH+nN4eI/HU4r3dQSnTCqsjAVwwkRAWiGEGfQ=;
        b=NyJguz85IsXnTMvCJ0Q+i6gC4QFq4iyjmGYBJD9lSHfG8LuqSSsCDPnrCKwrEUOqCz
         eRlWNLoTc2obt+VS2GMo9ImQPgMXtzRZoeBZ2bRE4mOVE7DI0ar0qiKO1b0kMeAaLr91
         DKVU6flr4CERKOwd4r6vKHSyf5016Pnu3uNimeGbJqZu3l3DR3wI6+NTZiLA3s1N1isJ
         wb6Rt5OeM2YlJ8lxyR4Icb3z3u1eMO/5ano+g5Y4QLkmhljzWlCaEcRAQrhY0jFqKqBh
         juLVfX6atZ/GB5Ytuid1+woVaoBROHDzWfPYtiiX/BZxWeXX1/pheMVrqa5RSOaLnBC3
         klbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855514; x=1730460314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBspKlYH+nN4eI/HU4r3dQSnTCqsjAVwwkRAWiGEGfQ=;
        b=nG198mH48ES+iA+rItfj330P0FV5omMvOCHRoK8O2TDIfTqDjBcm+m8qZP6TV139yh
         VJWUSbdCkAj4BRh5RQ/r61+kX0ADm7TSoH1TtBPMh340SJj0xgxRy5T7FGKo5NBCM7Js
         B14dJ6CSjAVNzOhkmRn1y2lCVjRloblbQvOd3NExq7lYBv63cJ4T2kDN7O2UYe2Be1KP
         /CdmawgMe/AarAHPOXAWdY+MP52ogB9psYfutELCDV0sLwtX51fNOTsZPgAQ7VI7cY37
         mb95dUp8u6T6E0aYkXDlSL/c6uvOYysnIhDE4Y0Xfp5KEotCEFibWTqt8DHG5tLp6qKz
         4z+g==
X-Forwarded-Encrypted: i=1; AJvYcCXR7g0OaBmb46ZYcHln+mJDVFKyk2srScRkixLhH3NdzAa0NhIgdTLwb7OSzGfwFMGno95VDgO7RbMFK2QeiWlq@lists.infradead.org
X-Gm-Message-State: AOJu0YwXfP1U8FLkUynIgL37oRdIO+mITDuK9oxC4BsZ5L/qtfCmOKHP
	z2Q7UIpg7fXnZWiMjvKV8p4L3OZ80YfsLtWSZ8SYGEiIA1Ewd00e
X-Google-Smtp-Source: AGHT+IH7aD0bikl6FQMGLNd7VofETGubF8sLbJJ8xzo9F6OJTAdG/SoIoBlpl6PgXjVQzoxxi24rqw==
X-Received: by 2002:a05:6512:230b:b0:539:eec0:20de with SMTP id 2adb3069b0e04-53b236dc96emr1633454e87.10.1729855513818;
        Fri, 25 Oct 2024 04:25:13 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:13 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:51 +0300
Subject: [PATCH v2 04/12] dt-bindings: pinctrl: samsung: Add compatible for
 exynos9810-wakeup-eint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-4-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=1142;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=anfc4pv3kBFwMUC6+boo1nr/Fl+OcGuNSaeW1M8DaGc=;
 b=RN0biJqpKerXFY2hT9SMKUf1B954dfTnBJCZk//sc7T/EYhl/mogqBMxMnDQf63uuf6f+l4XM
 Z8JM17GPDkfD3Lk8H8da8XqD/ZpvNEoUoCSKFR3Oj8zbQJTEt94iY8M
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042516_376177_074DE1B7 
X-CRM114-Status: UNSURE (   9.83  )
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

Add the compatible for Samsung Exynos9810 pinctrl eint block to the schema.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 565cacadb6be77b1be1a7423f88564dd950c44db..68ed714eb0a178c46228bac142d69bbd6baa6277 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -47,6 +47,7 @@ properties:
       - items:
           - enum:
               - google,gs101-wakeup-eint
+              - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
           - const: samsung,exynos850-wakeup-eint

-- 
2.46.2


