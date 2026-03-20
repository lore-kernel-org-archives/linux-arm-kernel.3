Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA7F1099B42
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MPb6MVQqXHQI6kKZUWd24slmi84GBPiHvGvXcVqCJw=; b=Hqa9CFtTyDCepUC2vjIfu0Zv2r
	quibhpdiqjfaMP/jTqQjfV3XAxDDOxphiRPxV08VFV04LS5HNeS5HZfNoy0iWOQ6fo6O06MYiCgz8
	PLIQRAL4i26mVT1sJrBlO28duIJ3jV3N594p1ARMsjIGv57bFYj90gondissirlY+BZJDWBPqoJS/
	WfLnAgJC/0Qo6p3XCqwJYQuAUriCLBi+IWSe1p1dCwWOnsj4EjRn36KlOtWJp1Dk4kfY/3qj2zCeP
	ueU4gcO5aJq+w3x+95uCta6H4W96ucvoQHNrME7Y6MmGzG4/CAtt74kL2NndUWjm1imPVLXQN9P+l
	23897Kxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBx-0000000Db41-48NQ;
	Fri, 20 Mar 2026 21:15:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBs-0000000Db2Y-2UbZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 21:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3MPb6MVQqXHQI6kKZUWd24slmi84GBPiHvGvXcVqCJw=; b=FQotmfMGgS3WZ965ZTSjIzuL1k
	Rul2SRLZRygThpEM5WeJT4/soNNJ2zSYF5OAUoV3m1reO8Stsu6LwicXT5ER6sCgTDqtv7REZcGx5
	ExhxnrOw/I1Lqj0bTKbwm3YpCoiN2WLembVqrhtOwruidmjNZvNdcGAh2/+JLfTKaR/xzqv9NDXf0
	Lv9wBrasYivmXR1T7TwWRKMdx03FS3O9y39SXp6UhodrH5GFhz5dzd87TW6f0D4MFETyYZQi7l44B
	HiquEenBJsVNDIVhxcF1aIN6LyEmgOjVOTR3Rc42cL7VSrMLyEL5Q55WIcXYjZou4JNYCwQNyXf77
	oFYNtCDQ==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBi-0000000GUTf-2NSJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 21:15:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43b527ac5d0so527473f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 14:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041321; x=1774646121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MPb6MVQqXHQI6kKZUWd24slmi84GBPiHvGvXcVqCJw=;
        b=IuKyK+ziJfEq9Xom/hACvw1uUYGOSjF677nMhp7V5Y+Vvy8UWAc/TdLMKV6Tv5ww+v
         pd977inqwCz0CaNjQmo7fd0hnBHpxC6l2KM3hvpxPGrOo2ET76bk0bbEr+9nfvStqPKO
         1fJEbCGfNTtuCKJ2KbPad4BDLaVZeb4VrfvYILAQox4sSAAETGvR8u2z4l/seDRCY90f
         TicSD82EZxv5bZBdf5Bw99lMFN/DlldotDgHK0u1hVOa425lJzREwdKRxRvuVrsxmu67
         rLImyqgdxJZb20dZ7kDUEU7gEJ2CL08T+bjN2LMondVs/YWhTxltwMcWHhsiwMUJTSd7
         iJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041321; x=1774646121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3MPb6MVQqXHQI6kKZUWd24slmi84GBPiHvGvXcVqCJw=;
        b=N9C2D+21Y/Uh3rWfo+PLphHBMmqpc9t+j+DKqL5/8pY8L7N8nJGhAPNmPJlAlTwgAd
         /yrorDiLPy2fDhnmuv8IMaALmBMLUDzBQXDYZu2igP//17bguUz07kICC3Sb+1M1diLM
         /tZHrayWm6H7pGVaOfxP/FSn6wYfBtU4zrYuPpVZ0xy1DVm7V97Cy+Q9RB96BMcoW0+h
         wVAzWvQWkQeWLQoeOJVOvD9Y3iORcXSjYYJ9HXIBYowlOcgRaiE0DhLykq0Ktt4o7gza
         gdGaT2pS/v5cTk9PQR+6c4dj7OLooVyG3YBioT/4stSRc0YxoCCXf7iE60zIQzVRFlZS
         J6Fg==
X-Forwarded-Encrypted: i=1; AJvYcCW9yXYw9KoN9HOm6qyK4txMoiIK7Nu9ISYpRjzJDtCxzq/8jzFF3H51ZCaAa+mf0q2hvjyv2ZFoAc0H4llSRUA1@lists.infradead.org
X-Gm-Message-State: AOJu0YzIFJUh3zh7g1qcIoWVg4JC88Tuiq6cMdCtAiyu2P1LCzzEyJbI
	i3foUivsB3w2CU9hkeudq0ALgMqic6Q5ihdYqnK8eon39kNIAUJ4SmCQqplcftvzXU4=
X-Gm-Gg: ATEYQzxQiiWRWxVwVOtIuF350RkaAsWdVG8BkuLgjZF9WBT6j8el78CLcPaSn/WDfxr
	0ocycnyP77sopSIiyoW2kFXynEWn3RjkqD7rdDCXBGjHDpq7PhUY2gGyNmDy7t/djkQpydKxpUz
	P32Yi8wO13rhP62SfjPiG+6Q4Ru+kHNPngRNW5bhrgdfv8T1tilz4ZmaAnbcaFhldYw/7BNjlQs
	Jn3M/mdoqsCCQM9w70+rhTyR6kxbg/+ZV/YBE+/a1YR46Diq2c73cxw6WxxaPxW8ImGjAFzuEzP
	lIyJw2GWh5icVT9YFY1VxdOJ4boUxuwX1YnXoNqUycKWgd46Lp4nMb0uQ1fQve1g+GFEFrWBA4Y
	ekMAMYSRfniRJJ/qgQJbL2LQWBkKUf/LuxwJXdKhnfAUSJhobbY0cCW+XCu2SaPw04JEEs4L+RQ
	DnAJLfwiM5bxFQ4yy+G4QqkOGFk28zXxBx6mi3GB5T+6X7qWdrrOYnEXOZSIQHfaCrD46tsdClV
	GDAlli8hPn01dw=
X-Received: by 2002:a05:6000:400f:b0:43b:50d6:4f04 with SMTP id ffacd0b85a97d-43b64281491mr7630137f8f.38.1774041320661;
        Fri, 20 Mar 2026 14:15:20 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:20 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:15 +0000
Subject: [PATCH 3/5] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-3-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_211526_893351_94F3AE20 
X-CRM114-Status: GOOD (  10.44  )
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

Document support for a mailbox present on Exynos850-based platforms.
While at this, convert the compatibles selection to enum.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
index e249db4c1fbc..c109c1f7af24 100644
--- a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -20,7 +20,9 @@ description:
 
 properties:
   compatible:
-    const: google,gs101-mbox
+    enum:
+      - google,gs101-mbox
+      - samsung,exynos850-mbox
 
   reg:
     maxItems: 1

-- 
2.51.0


