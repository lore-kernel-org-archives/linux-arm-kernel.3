Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74394D0C850
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBpbiT1UH/OA8X+hOXxnnO4w4MCR9v/fz6fRCvgTXsI=; b=yfIXIJ42VUSdtTjaxkyPpRPNeY
	XSAg44syZl30CGV0NRrj58XgmBDahB4NNj0ZnEWZNUGTxCOSDapSGJqYyh1KaG4yTCfIYwz57iVnR
	qtEGUMXh2dZoc+FonDQeP+i8mH0HLaTxUk8rK2oso0b2xKqmE0CqJchIRxAQAeYQhV1E6+CI+RcV3
	VAaNiDHLwPLQA59oX5WoYrircCXROxELgXhZMr6KcJmBWrJ7CFC7l8uxWDDOEMtUxEcu+9QZrJhV7
	VD6CbJ62VLPuUfwBBQTusE6Gut8LM1xRPy1jE737mO1LRva9anUeiRmcMEpurnBbUBTK4TenKW4XU
	c4mQeLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc7d-00000006waO-0n15;
	Tue, 13 Jan 2026 10:59:37 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc7Y-00000006wY3-2Xoz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:59:33 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42fbc305882so3991455f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768301971; x=1768906771; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBpbiT1UH/OA8X+hOXxnnO4w4MCR9v/fz6fRCvgTXsI=;
        b=NwfrnOyiKLwz/VhcWJk9LiAJzQlHh3zuL/XCIKHM9drMtirXO2ESoe+9yZLTNgoRNO
         8GUJrDHvdzteIBlMFgGUV5FdVKcXvTnBGB6AhToQ9lzeqRvvsEXcCp7xpValBqiwOx18
         R6nkqDJm1Uv9Pci5RBgBGedOmfm6UF1zUx6xFllxus+7lnYRnE+1YAi4JaFE36n5xwAa
         f+a28RaxIBRaWClgAOtIyy1PofjEJNE4dImUQq2OUfdpXvV2eqU+Rr1B4BZ06DBe79jF
         Y5awj77t4ppreXFB3WPR3PFn7xYM5hWRFRWzzCA3UjdqF22TfrYKTgvXg1Mg+fffMOK/
         3Zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301971; x=1768906771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eBpbiT1UH/OA8X+hOXxnnO4w4MCR9v/fz6fRCvgTXsI=;
        b=Bmxcf0noBY22/KMuZ61U13tkGqC/KzAg0G24J9FwsiWbfPCQ0XDr48a2rsdlscHoEn
         TWPnOIdXPzh9ifmtQnOi3dG50T6txEetL9sQ40a4FX8dXbNsjRj2XbxW+SYsGaqvC02+
         PM5QaWo/pugZ2J6HZk+2E7ELG54tpUH4+U+L1LxQzDDmZY/EUBgAMqDilW4WX1q+jzBh
         GM289w32jlAfW70IlPRPrzwzrGAc/sPfaRf7NT32AjM7nIksnJBoCbkuXkktYkDTh3LK
         S+zPb2A5GmffgpfFkTzKlKUEXLm+vdI9/Tu5s2slDKRhNWx83GUZwL6fWV032qF+/ofP
         1Deg==
X-Gm-Message-State: AOJu0YxR6Y00/x5JEYVzht8N4lMw0tLzqn0zaJQnUKYxDka3SuhEV2jp
	5wL7F8bLES0xabH6KARM6JeEa577L9p9ImtYrLLXgRV5jlkVh2XLK7QbZEHrDlRL8dw=
X-Gm-Gg: AY/fxX7KpujAteQ1eM+M7tgwGSr8HNPwZ9gOp3kYJQqPLNonatjI2kOrymPoX+ApWaF
	p+AgATnUOAi8TmpviTGjq/PSJF9MijKkUZj4Ob0we7FklYBP84+LhZDrRNZ8wKIv3bUqXQYiceq
	nyZwEu+MX3ORCpxhSMba6F9lJeoExzCS1cGa3YMvGdEQMxkYzAqdTGEM5bj10Vx01EMX5sy/2z4
	0TZ7KDqN5vVVozWUZBNBYzcGrwvbZGEhA7D9jiAMZy/55893CHxdUqYYaccII5aXhaRaWFeQMEC
	fiOA611vUv098h9z64RqbKU/H+hZki4x1VlSbEzsfiIUxnO9tv8GVECe0rCSf0cUH8W0x4+q/JT
	g4Tq795v45/iGIDGTF+NrdtZdP7XvpynnywKXMFoT5vcIl96gom79Ajb2F55LWmUaGWrzKNZe7b
	jMcAmQSP6mrBewVL9dzGLHIYdWFHQfz2fYk5eHVaEC1u0=
X-Google-Smtp-Source: AGHT+IHSgDVUH9/dhiZYJxnIUorYOCelZMoqtmXYQkautt0XBMKPQj25UwiE3+iF4Z6lVVM+z/bN1g==
X-Received: by 2002:a05:6000:400c:b0:430:f6bc:2f82 with SMTP id ffacd0b85a97d-432c374f180mr24842546f8f.30.1768301970623;
        Tue, 13 Jan 2026 02:59:30 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:3454:384:9eef:8e29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm43729881f8f.31.2026.01.13.02.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:59:29 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 10:58:58 +0000
Subject: [PATCH v3 1/5] dt-bindings: clock: google,gs101-clock: fix
 alphanumeric ordering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-dpu-clocks-v3-1-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
In-Reply-To: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=S+ZAPlt7l7qSiwZZJgJDTP5SkN/10VGq32rITKiKJcw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZiWNAam9qhTSzrSHSokiaMfkdqj20X6eKe1Mi
 PmqAX1HWVWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWYljQAKCRDO6LjWAjRy
 ujKLD/9z6NjG0NY1i7Yp0KdIYiIkkBLtIA97IGmloAyQ4SVzpinID21BoZZuLQ/fD+mvCkoyKM+
 idFWAL/vbyBcU3uJYVAWte8JmCtfCgwACJjnbU9alawn/BQ6BGBzSfSdcbYJe+yX8XD0cse9xIN
 UzWwVp8QS8hz1Hdl2H+9fRGNKklKeSfcEdd/osHQ3mN1pKfjnw16nVfRg+Z3lvFAY/ntDBihQIs
 RAcavLvBSz82pZ/VZ0cjOZ5hitRoJPldq8fKtjnk3v1hIJhIQ1rV1D7g7VqV6yz7O2Nekq/gqkq
 iJorEXEuSvsoVWZxFXjN7EKToBEkH5mrVG3q0k7PgKvQhqJMGlxB9FWR689muzvRyHXUXlnqj0a
 Cljrw2z7YGY35zpsEDjCeEdlJPFr1nV+Qv7Wnrm0PuWkeppIrJ2JinPeeJ4KPLMJZYacyyPwZQT
 Wy8FbArW4d9ZIYa0xM0XT55UhIj+5x+M3wKCM3nmRzRQrx8b50EVwsffJx1cfXKuyOcGFKGEf/y
 jIajZcNgfdS3uOveMknn02Mnnj2EoUFpmQOF7+2sxg5jr/9xPuLzkFtgiMAg0YZrx1qlluXaKR8
 glzbQP4MvEhATjxQ/BWi3uIF0XGl8nFIiwe2Y6wtuWPVlYIC86AxS0ITG6eTQ37Z3AnP8Gk6GX1
 8RlhcnHtRlwA3Mw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_025932_663884_DF2B1893 
X-CRM114-Status: GOOD (  11.90  )
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

Ensure children of cmu_top have alphanumeric ordering. Top is special as it
feeds all the other children CMUs. This ordering then matches the
clk-gs101.c file.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3:
 - keep 'top' first and alphanumeric for cmu_top children (André)
---
 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 09e679c1a9def03d53b8b493929911ea902a1763..c41043c7d25200fe947a2ca5b2780e4dd50ad433 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -29,9 +29,9 @@ properties:
     enum:
       - google,gs101-cmu-top
       - google,gs101-cmu-apm
-      - google,gs101-cmu-misc
       - google,gs101-cmu-hsi0
       - google,gs101-cmu-hsi2
+      - google,gs101-cmu-misc
       - google,gs101-cmu-peric0
       - google,gs101-cmu-peric1
 

-- 
2.52.0.457.g6b5491de43-goog


