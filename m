Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB799D0C84D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74ELsg7vhoXLfA9GfHrjCg3jNxskfuERCguyJAcC0EQ=; b=fNuws9DvzJjAhi4VrRPyCZbDnn
	BAfApYH4O5ttIA2hfuBHMuiPmP1SK7Oq8C0dsELOFgeJI67T/LGBW07AK7OTLr6Bm7MscUA3sK5nm
	D+scpQs4HZ4zMpuX5H98sPjLaRg1UPMf0PIGmuPil5ZAxzKVAprfvnstazhOMr0VOgOldbpu3gF1l
	CH9/IWwp95p04LQZhbU/hhZXaE0H0Z0dKkABnVeeReIoq92CEudTG0iNQIZ67goWpKtZWDkOedL6X
	ikvvry1ZePkbeVqh32iVSuLt+ShdOH/HauTtA83PIG92+zROY63T69aDy2uiSRR5oLIji2VeduRwl
	mfxjpFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc7h-00000006wby-0usK;
	Tue, 13 Jan 2026 10:59:41 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc7b-00000006wYo-1I9l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:59:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so3511774f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768301973; x=1768906773; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74ELsg7vhoXLfA9GfHrjCg3jNxskfuERCguyJAcC0EQ=;
        b=lyvAjK+75gqSjcIghb5vZ+HW1q2jhR/wi4YT7mRDVwMVFWgVoUwJniIMRYO1F+33tm
         1Q4lAnf3567vV7Q63pFf7kEDTEE+H/mg3znVEYyiSDA5elBkUaT7ZmWzS8xRypJLpm+t
         0ghlMe5vK/wZmk1WVpO4rSf+LJJotZMKQWe6C78AskjAbxwbB0L/CMME0D19XjxjbPzM
         4yjFKiBKL+erzNnWXIsozBMM4FSWSb9g25yo9lcz9cy3lSD7anrjdobHbdbpApzqmsib
         VeLhvxWYsLce8FsBOrHc+BYYDOxx48AcxwPM7F3BvZWwP4dlCiLGlVgTxM58niWkc8dE
         +b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301973; x=1768906773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=74ELsg7vhoXLfA9GfHrjCg3jNxskfuERCguyJAcC0EQ=;
        b=jY+zIRmYM1qZ5jrZFDQg44Mtq8aBCYvT1Gvy0kRclSHBJtsxPanGxDQtT2MsPSaLoA
         GAg8dewot1uc1HD5Ivs+F4H82GtnCzAVlfWkbRLXVUXive93G1Vb/0CBU0D0MkihbrSi
         1jfUy7hu+fCSsDLN7lota9HxQc8DxfL3bLxUUUKDcYMy8v1mvIUQ0UJOlm631892Vnyo
         9GCeQn6jKn70JdoA+PfOKRqriU4E5pnSu4l6w1mMvM3uhJ1fSGG34nzfPUiW6DIWov7R
         qbT/+kJFStohgtrjabzTqkCkItzCCKhnQ7XorzMDDPD9sn8Lr7LkrUckf18ynDtRC+qZ
         QAVg==
X-Gm-Message-State: AOJu0Yy/9Hza8XOdzhpKyYmJcN0T5bs//0RaNHORRoLvSiccavacmxxw
	T3jdZQ2jOu3OPngPraCNuz2gGlVvoPayKbhLRdWZ7QD4igAF+H5k0EOrt8twNEzGWZs=
X-Gm-Gg: AY/fxX5Z11QnZRMTRmdQ7B5sIIchx2ODhk0joNRaLmP8A3kDyZSbjfP3eyl6DwR03dL
	9AKgD1hF3fgOHwUG9YxaOrFLMEHpG87cNxKQmq9zGKkTaLxBCdwziTv3qY5jAN7tNzB3ghNr3ic
	yXrrUZkj0RTwskn2+yEF/yuwNIt+VgCdvdXglzCRQ6tcKVJPTEC0/LMqNKY/THgoNv6tXP8cV/I
	LQNB5QNH5/4a69dIj80AO3ZN/u0rZxBw6tS8Yp4iCCFO+oyblLX7USx6dWMkQ/j7CNkOZZqlkX3
	5x/qT6GEV654Ok+vh9C/IIEVkXz5YDGI1Fxpses+R0Xup+iKRoyeJ4ArkqGqkmWw6W0H/ztRzCC
	rFpxSC+A3EVMdrU6Dixr6Q5m2BHucw0PSBy3Fnpy+VwTBxHNas63bSuWlRGc31StP5J8MBxPxSi
	UdwS6ezG/aVOST6RuveLJ6tmRByVpLzMt9UjbNmL/NIzc=
X-Google-Smtp-Source: AGHT+IH2JbtL21jIgggvul12eFS//aGQrO5ZAtOVHTe2wEpJpvpWq9B0uugc4X9NenGB+bHx3VYl2w==
X-Received: by 2002:adf:f54f:0:b0:432:e00b:8669 with SMTP id ffacd0b85a97d-432e00b8adamr10557403f8f.18.1768301973374;
        Tue, 13 Jan 2026 02:59:33 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:3454:384:9eef:8e29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm43729881f8f.31.2026.01.13.02.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:59:32 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 10:59:00 +0000
Subject: [PATCH v3 3/5] dt-bindings: samsung: exynos-sysreg: add gs101 dpu
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-dpu-clocks-v3-3-cb85424f2c72@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=zdOdJQNPdlZKaryJV0eSRMq15kBV8C8+9A0Oans/k8I=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZiWOP8X+oM5w43jD1skqX2op7mjV09xdPbxHj
 sBrRp1J/XOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWYljgAKCRDO6LjWAjRy
 ujvRD/49YLewRuYcBVZ+8v+DqIvcqjsd4JOFG+gfylt/oY4oN+0q/Em+TL9AfmFLcGUEUmUiMn4
 P0JghNWmeaHU7gE5oc/9Mka3Ms3aCmP1UOpEnCJgYqt0kC1HA2VPXcIM279BSaNd7pyODhGASDG
 ipamtPTrN8R1zwxwN//IbCsFpEN8IQ6RHSrL7A7iNsASKLbal8C+kzQjTzBmL2m9NG0FaFBBpmU
 LTH6lsuZ6GQBQCkL3w9ciH1f6+EMLNHlJuQudL/wzr9JlPVhzoVs8z0hVj04TgGDEoj/nrQ6bkY
 k4PHlP2RWfBDuY731dV9OyKx6qoQyn7jmRpX8HsAaQEkbjZbQ1lU6CzLchREYdDh4Y6mtCAARxx
 1SRm0wSikmODQp7Cp++FjRVMdGOay2QxMeqRkMQ0mvqn6Z+ZMVR4OVTALnmuitA9XDN2ocd20DE
 1etByCbWGLjQiztV8wZUNaZZrAX4Sf95xu+dHJwKJL87N4uDkoxzyYISTxM2LBGvLU9UPfylgJl
 772El4IyxYtcWqwzf4GLz42DPWKRP6k8/pVmM7nmoug75TMay3KIcYqZDitgupn41IC/3Mj7yN0
 JlmlZM6CREMS60lB8Vf4UZRr2g5xiPeBPtHE/+QCJKD6jH2ioHA2VRVb+ZOWJTguIin2vU1EyB+
 WPgqVUsAISqoyKQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_025935_364875_67B4C3E6 
X-CRM114-Status: UNSURE (   9.08  )
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

Add dedicated compatibles for gs101 dpu sysreg controllers to the
documentation.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 5e1e155510b3b1137d95b87a1bade36c814eec4f..9c63dbcd4d77f930b916087b8008c7f9888a56f5 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - google,gs101-apm-sysreg
+              - google,gs101-dpu-sysreg
               - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
               - google,gs101-misc-sysreg
@@ -92,6 +93,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-dpu-sysreg
               - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
               - google,gs101-misc-sysreg

-- 
2.52.0.457.g6b5491de43-goog


