Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB005C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGjRMX4G/COI/IQf9/y2Lgcl/FQUEBYc+9lDliHqOG8=; b=zthBhaKgFoZttlbifCux6xaYkP
	SA7IJfpoN7pdaRfV8FHhrTa+V6OLJri5XIU54xecBc8ZXJ7/dAhJ00vDrJBEvWrH5YuqH7FHQxcFi
	9jjPhRUKzgZ8V1oZI3iao62FxH5ixBy940TlRsvuVl2r3rEV/dBTZu6WkoTpFYxzj4XvMpsTDy/hu
	CRcu1DDy7WFnFpxYz/BAknaefV0k/E+V+Affaa3nawMlPvvykuvKseIF+OaIujIlJisM9XJb1d13/
	eq8D8rQnUv9nTdp4ZIZ1OdEjUexZak8zY6aRG3pnhbnXaVWY8Uw6PHgA74vg1tMn2b0YQWBL5sMig
	UpeLrE0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3Fb-0000000189y-37fA;
	Wed, 30 Jul 2025 09:37:31 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3A7-0000000174o-49XO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 09:31:53 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-61564c06e0dso2991799a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753867910; x=1754472710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGjRMX4G/COI/IQf9/y2Lgcl/FQUEBYc+9lDliHqOG8=;
        b=vi2ZhUOdizOdfZ77f3yzckULyvFXAhdeDY1o8dXACv0MJpcNzdEDqdGHsWFw0pkPWM
         W42vBjUlOdOcpCN+UFllvGVDbwpN+I+y9j01RtiyKYkj0xGaAJIdf+H3aJQMeoKm17/B
         pKcMUzdYxvVYC459MKRvI+Ss7yYUdyaiXovnV3ExKa1rl0CgzyIlJgRmqH/qa00fxc1U
         8nyZqycuGQMeyMDOZPp/e3VwEL75tF8EDtehAx3Ah32KPZ+3EJXYz5KUYFKZD+CdKBVP
         sETxgUmeRklBVIj9bhn5S5uyrIx5+WY86YChKdyHO3d+gOoqbWiUnLMu3PVv4hc8NjtS
         XnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753867910; x=1754472710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGjRMX4G/COI/IQf9/y2Lgcl/FQUEBYc+9lDliHqOG8=;
        b=PQTHpGW2aHsIm8Cgjz/aZClo3c/9EA0IpgBB6St9oAT2zQr0vIocHF78OAmSi5TF4f
         ocZF9QHDxDZTPiKNKTOzWydKQ9FC93NeoBJNimPkpcWs1sMUST3+4QBZ5qF65E2Y7VKU
         7eoIO8cfXZGdi9Ef2ylEe/z52PmUXFOiuE1RFrbDwM59R7p7EM4DYKdygO3MNrLob/u1
         gIld/WOjDGPR2T5ScnKegMPr1Ef9vA2HQJdieZ2nqhWsFZO0PbaTIxz+RCTJycOAsdyK
         LHSknMiGIwK2XAA9JBU/p6o53nNdlNcjMVmykLHPp1VyddUJSambhlCZNU95qE+1L5Mv
         r90g==
X-Forwarded-Encrypted: i=1; AJvYcCUJHBLk1wFS18CoF5Mr8ZhQ0mvYrb5THTmRwetiXxgKhJ/67a/qpb4xDE3D1RIq5Eysc5OrLHtoyGsw8hKZK8re@lists.infradead.org
X-Gm-Message-State: AOJu0YyVUTaiootzrxWTmEn7GwMGDhU80a24tWvF812e0EIgCZtMmtIr
	FIGvf4InaArfYYJsMDpFZQve9tH5RTvDPOGQrLK+2VfEvvVZozw7xdSCvYLFgroXAoM=
X-Gm-Gg: ASbGncuuvRyoXyVYJ5kurlviGEk3m/kRG5CVX3jRjUn3pPc6FtzOvEChCwUFI001Rjg
	jLLng+yg1WkCOcUgShGy7OzeAMMLH5Bjy20+8gGrDFmq9yM+gH1qfB5BkSmIWe4kK7SakcDvtoD
	3gOsSXiP3x9wKOrUkNxP3PUHCIjI7/GPEVMQku3R+DtPqP6ZIIinVR6K8XFVyu6rSa6E+tTUje1
	mAaJGqu8Ps5ZnfBHL6Fv1LbrKjI5VdRMzq6s6SaTCN2pwxkPSxJLvrLkJy5U2H4QUqtYjRZ98mZ
	/OZU0v3UUK73fbiSu08n/FTn/17AlIidGz950ODaQTL0R+YagpEMBLhKRfyov4RQC1lhUcqM2ZJ
	RWoXnlnDV7PhYVJ54nYCrHe77vIySB4aO8Pe5/49whFUXtpc3qxQ69ff/DhAvzB7a23d1/vNr7c
	a/jt/S8A==
X-Google-Smtp-Source: AGHT+IEUMxf3gSpGjkAUfDfzDG2wfz30DekTf/PJZewF4AZbZS4xARY+7EQX+t4IEFMHZ+3vt+QMSg==
X-Received: by 2002:a05:6402:40c5:b0:615:9b4e:7b81 with SMTP id 4fb4d7f45d1cf-6159b4e7f50mr683882a12.7.1753867910401;
        Wed, 30 Jul 2025 02:31:50 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61536916dbasm4090424a12.43.2025.07.30.02.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 02:31:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 30 Jul 2025 10:31:34 +0100
Subject: [PATCH v5 1/2] dt-bindings: clock: samsung,s2mps11: add s2mpg10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250730-s2mpg10-v5-1-cd133963626c@linaro.org>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
In-Reply-To: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_023152_026850_69E3F3A4 
X-CRM114-Status: UNSURE (   9.61  )
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

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e6053a1881650b8e8ff2524ea01689b7395..91d455155a606a60ed2006e57709466ae8d72664 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-clk
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk

-- 
2.50.1.552.g942d659e1b-goog


