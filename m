Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6E6E63F21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 01:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0uUVQPbhvB6NSi3mbkZ1qXyVTFOD4aa4pfphYcfbKPU=; b=z4YP6gBK7AHZX87eA4P6jqKYAO
	TyAkNvGEEM054+j8hTZjlU+q4mBY6yX+udlc7SEo8H+24H95Asfl7X4tjHpCUBgOSh41lFuBDg4IU
	rMK8G/fPNR0l2xxysRkJSc7Ld9zfKmCWBOQQ64J4zE6Jr0rmkphopSEz1q2ue23AMsF9mP7z58NAt
	VtwDPQ7FmuQObY6tJzjmIXj4AjzpAfBEs6SYvLnCrzaNj063qp8JFOfyzhXzNNz+pQwReWgQOksSc
	kmyBWOhyJjMdf44Ft5So8cmhkGAQIaN2ZbhwLXzqGJqkErZVXVnjzHq7Tfy+baPcFiXgTLN2QK1K2
	OKwlQN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrn0T-00000005pUF-291b;
	Mon, 16 Feb 2026 01:02:33 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrn0R-00000005pTU-2MRk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 01:02:32 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1248d27f293so6275492c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 17:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771203750; x=1771808550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0uUVQPbhvB6NSi3mbkZ1qXyVTFOD4aa4pfphYcfbKPU=;
        b=gXJbMuNsAIRWGAIZ6GlE3FSXnMyX3Bv161S0D6Q2N8xWnh30UObegegSAgNqUfOlWl
         YTf8DQp/5ve+mhfG1Vi0FX8JElRRSeXpt6mxbeUzwbf35TR+euugy9sZbmhhoJ2/bIYz
         uFEVn1nKPIwzVtMlvpByI2n2Ak2e2/OD4jZ1rRysv651kh9UbaDupH6sbg0FgrqAPCWM
         L7bkHeJFNuKipw+5plqgiXxgC3RYCT82jX+ywqjirD0H2UI79IDMsYt0Cz3VFMZKYYKk
         ha2CNyLZSqhFAeOSh7V7EjGiLjxxPHPxxifaEsKb30En0PvFM8D4QGyIRt2PEmwhpKd4
         oSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771203750; x=1771808550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uUVQPbhvB6NSi3mbkZ1qXyVTFOD4aa4pfphYcfbKPU=;
        b=r6TBNQZRu0XwKGCubG00W6F2Y7GhxdmEWzPzo3U2qF0yKUaS66VKa9/JWS6asAIHvK
         JqN9nrJRyeFdqpgvePfuohj1Ox6Qrs70qobCTMncrJqLSCnwV8RvACnprEKCZsLcJVJc
         8TPQgS66Un79Uq1svS/ltPt7jke5gUmj3X8or0c49MSmCZnlrKTeQfYTqtwxPw15h1aL
         MFm3YqKjWGn79D08hoHT/WwusrNSO2Kyx2K88cMVKc/3IepecAN6TDbotChxpItcZxPA
         q3YVzV2ma0J8X/Zd2NOhvMQMj4gx8DDYe8DXMHeVfJdAyme8aX3SMBL7plWPegmHhrao
         KKVg==
X-Forwarded-Encrypted: i=1; AJvYcCUe5ZL5YLJ+7J1JaVI4wkAKalSy13OtGFYRIRlCUvd3HXxDDfLUb0g8fZVWn912xPPppFx5X8crOvk5kW+Uv5AR@lists.infradead.org
X-Gm-Message-State: AOJu0YxVouRCNQPYBovURwRTuAID/Fbw5f1Zpm8e6eEN/HLCDgjcOKmT
	5wGdd0w0l6c/50YU9ffiMZ15J/rW/UsPuZl6gMVyiIqZs2KNfMkiLSfF
X-Gm-Gg: AZuq6aJE/RhB1+HlR/F6KDXwjCHR5zPqbamab7dyQDOTaD8viqCY6ZZoCc0XQiCidWv
	WH8fWLZMFn+Enk9VH5NzQYMPKUmyPO/AWDH7i3iAcNiIgxCJt47hwieNae2H+XPehoK8AnQfszS
	I/faWdaObTN294DteumqNGp7zR9J+547dJBjibvy3uJboMxDV3vhSebM+lAsaorgDD1/qwrchj9
	H9X8sw/UjXftb0I0xBfjALQ/oXN+BpcanXJSQ9LgIJ++/3bRb2upL2C1axkl3tIcQliULzFnIa1
	Pwn4LZaF5tttAY/1uooDo/rbJG4gllpzZs6dvw3PSnevPoO0iQMxAGbFwQTMjOHlgT1+L+hbLut
	CQJZaU9a1N8WFScNyHnsocI1DA6/3VEV7SazDSodaTNSniqsK9TtpweM8KxALBk00JGi2xnToJg
	Nv8X2EYiOFAPuEKByEpefrL8t5s2dvL8o+F4HBkJ4FMELYlJt11IrMKJ5HcGhwozXzJw==
X-Received: by 2002:a05:701b:418a:10b0:127:3b1b:c816 with SMTP id a92af1059eb24-1273b1bc8e9mr3216897c88.20.1771203749797;
        Sun, 15 Feb 2026 17:02:29 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4ffb:cd7:e7e8:c526:2074])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cadb25sm9158160c88.10.2026.02.15.17.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 17:02:29 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
Date: Sun, 15 Feb 2026 22:02:16 -0300
Message-Id: <20260216010219.2131484-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_170231_607395_987C777E 
X-CRM114-Status: UNSURE (   8.74  )
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

From: Fabio Estevam <festevam@nabladev.com>

Add the PMU GRF and IOC compatible strings for the RV1103B SoC.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v4:
- None.

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 0b8e3294c83e..2cc43742b8e3 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -63,6 +63,7 @@ properties:
               - rockchip,rk3588-vo0-grf
               - rockchip,rk3588-vo1-grf
               - rockchip,rk3588-vop-grf
+              - rockchip,rv1103b-ioc
               - rockchip,rv1108-usbgrf
           - const: syscon
       - items:
@@ -98,6 +99,7 @@ properties:
               - rockchip,rk3576-pmu0-grf
               - rockchip,rk3576-usb2phy-grf
               - rockchip,rk3588-usb2phy-grf
+              - rockchip,rv1103b-pmu-grf
               - rockchip,rv1108-grf
               - rockchip,rv1108-pmugrf
               - rockchip,rv1126-grf
@@ -231,6 +233,7 @@ allOf:
               - rockchip,rk3036-grf
               - rockchip,rk3308-grf
               - rockchip,rk3368-pmugrf
+              - rockchip,rv1103b-pmu-grf
 
     then:
       properties:
-- 
2.34.1


