Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2770ECCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyAHXZfiSiZUnBesnTj/zEW972y8t9X4DG0As5mUToM=; b=D013qZ7Qq3eU0q5H+UnCP52lM0
	Zo8BU2vtrZUG7t/XnBUz9Pt2ZQXbbj+k/71kzmGU4dty8y+oOzCU7x7sbvk3ScqFZ6xyvoXUUmaEd
	O0xLEmA7x8mqT9Rr8lhCzA04R9Jk5nG95zbBBZYRepso+xoofeQjQTMh9yfX+ebyfjCoH0P2SV52l
	cXizYTJrgH8LA6kqqy8ozFDY3lHqXvJBaHaabd9h1oZJ02ObZuzO20cXDtc1AXGoBWzRdKZwQIjny
	HthbbMFizIXPWv0JddTKEDg5zP30SAsnDpt5zqgFsqLYLOe8XvXKSwy3eMQhyjENLEmMaOwRgqsLU
	j1xk6AWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWG-0000000ETdR-0IeY;
	Mon, 13 Oct 2025 20:51:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWD-0000000ETch-3K39
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:51:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46e52279279so33100545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 13:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388704; x=1760993504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyAHXZfiSiZUnBesnTj/zEW972y8t9X4DG0As5mUToM=;
        b=CGuzUPnuDHX/qH1A7BS3Oa8BfMZJXoGMpFiwNiSq3v/0tHSm5xw7uDrkbKIumTQEq0
         LKPRDe8LwQZ4dPIOk/B97nuH9M558hNTCIxNSFlIU+EwrAHLL+VQbwzZqAkW5kpQMHa1
         f1Yswg6oa7HMC1n6Ne/RX5TgdW0u5zCHs+KmyLhATbhvQGm5vgo7BwTSDozjRiTI8Nsj
         YfMYVbH1e0ef9z+9sU5YmWpwKNh6EKzKIV6PYjkU0m9EpOuj7Xs6bun0yjLj8a9ioFOd
         py+UxwfGKUMML2jkw965SCZxJdsVBDMaaSieXRSgToOZd9iphenswo0t8WdLTkPmTAb4
         NU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388704; x=1760993504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DyAHXZfiSiZUnBesnTj/zEW972y8t9X4DG0As5mUToM=;
        b=rj4SQHmmpstJd+z7KZUiIl9KNBLsbGY4eZf0v5RIJ0vXOF8o3WNuiK9KUExkgQBwIE
         LXbccrFzDBFx8A2d0XRdnmykEJO76y9HfZy02uqw9QJvKTnxenIclkJR+YgVgsWmVSMM
         dKbXjYnnvKnawlSp9xbFb0wbJIZEV5gyVVCqWBLcRjF8QU7NJ+b+GSscnOQLZhIOMyVk
         qIRVMjE8kifaAKmqxpBLggtk21C+wXMeG3cVB0Y2RAvS9En3AyVtAztlndSfXAUPVBWZ
         bPFdwFqs2wT/eRTOM/G9eXJUqvNLo25NPK9gfQ4f3r6b8wXu2pexY57koOIpk43kgthQ
         azZA==
X-Forwarded-Encrypted: i=1; AJvYcCWJSsJLmvk4FYOoCb5e5Ms6Z3sbmT4Wn3W9px9TIyHwHMqNIBdBw6/c2D+b2qOlim3jNyrB6zw1MyBaWJy09dkx@lists.infradead.org
X-Gm-Message-State: AOJu0YwHbxl9tCOhbTqazyB/39UfhJdpvvbcCMRvVTHfnKpfDoiXHuKd
	bMLeo+Vb11NtkVf2XbBEhzpfn9PHVx6SSzILjam2Qn7/wF7cfdOKiG3UhQ8CR0m538M=
X-Gm-Gg: ASbGncsGb+v3XBWIiG+6ifta+YKPAvA0cmdxBxeXr5sj3f4siZr191F2s2u++JnxsMJ
	7lIbTTEDGI9As9VFhLSVpcPQVavRTcbLi5F3Uda3VMU5mZ3uJGjsYnRZJpKP8QztVD7LYhNuAFX
	qS4P+j/qDtPRVXISeZM0e7YyUz9TYKbEz75yma4/PNaCTonD/3YCGibTDUr8tqRMgvzDDXRu3aS
	rSXwWIg1KTuL4z6jv6fv2rvyJIztHDBaiE8MVTfX8QVtApzkz/NQGfcgLOXZlorNw1O+ErqXrB3
	MQ6qPln1qvk7kSQxtmOQrQS6g03mJbTWPKA2uyhucxvA74lfDyb7zVT9NrrwmdJD5EYWxYl6spw
	UIz9oa2ewjNO3ncPg5Bo8Chx34C+6HkaepvSIQseJCNtCBDeoZ1WZjvHgtpKPpw9VTcSvfP5MA2
	ab1MnPjml8gW/JI2gtqep+
X-Google-Smtp-Source: AGHT+IGM/ohxNTkB5I5MkU/rwu4FNgrucoZDaWYhj1yomWR4i7pKzGV277cj7BDpJ/M4YUeEMDupkg==
X-Received: by 2002:a05:600c:4752:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-46fa9a9f05emr144983335e9.11.1760388703969;
        Mon, 13 Oct 2025 13:51:43 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:51:42 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 13 Oct 2025 21:51:30 +0100
Subject: [PATCH 1/9] dt-bindings: soc: samsung: exynos-sysreg: add gs101
 hsi0 and misc compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
In-Reply-To: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=+oCGKuWrWlzzBKoMEL3/FfWoYnYmDhmOoA3Dn2HMS1M=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZX52tjaL/uhAfhCWfI8+Pih5EXQZpOFieP4
 jF2DKC4+SmJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mVwAKCRDO6LjWAjRy
 uksXD/9TEH4aYwfIIwWKepmKdYexuyHJ3CBlsgHDqQplGtpixAO+QJV8YjxA1Yz2onhlSyDIReF
 LJ8S+5U97RrsWGDfLSRYIhgqfg+QM5ZJuC0GigZTPmh16qtd/jgr1tMsVCp71ymyVAXkKfJS6iT
 FhpOs2hM1ji3uqQNRTrm0w7k8Alh3lzTnoLkCdfy5a8YE0famciNH6ejpx+oyp+sC0QEuTDJtlS
 KsnfpNGv6obmQKx3DnR4Q4WIZhN4dlEraL4VwKfgmXUqRvujLeDPEvNVQumFNusyQD7pAw8leKX
 OiNpSkvLKtnq0X97+BX8NOUo1LSxieGNLpspBQuqZ+Zxeh+xZXiieXLU/A5I5zuGK0R0ZEUR+/O
 PSvAq6gPM2ZZf0mLZDxbj86nxtgspkfB7ViGWTzZzuMu0Wjbg3lD6YHDi0wJfO/ZQqD01UmARkG
 tFp/+8W9gykbIzOkxBqp06LeHQ8YLfP0EoKGNy/DVUDFx5O12In7qt86z7He7iYx1ExOvOglm0g
 u6XNjHSbxlttVpjOzgx7RgjmYdUhexg/KWG3CzZERx3mNqddVFJCF10z2se9vovsK7oeF+iE3ET
 b7xtbfB2zSJCEFqoqbUgeGmr+0X4PoyQC5bZ1+WAQ1efzxidhCoyDxgvHaiCigKIwiPz8BOqHJQ
 2oG8XmMM35so5rQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_135145_852898_5A84951B 
X-CRM114-Status: UNSURE (   9.80  )
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

Add dedicated compatibles for gs101 hsi0 and misc sysreg controllers to the
documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..289406fb586e1a8a9eccb8eb781f159fd5b9d6eb 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -15,7 +15,9 @@ properties:
       - items:
           - enum:
               - google,gs101-apm-sysreg
+              - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
+              - google,gs101-misc-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
               - samsung,exynos2200-cmgp-sysreg
@@ -83,7 +85,9 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
+              - google,gs101-misc-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
               - samsung,exynos850-cmgp-sysreg

-- 
2.51.0.760.g7b8bcc2412-goog


