Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB7CCFA446
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGrpLSO7RqibWTIvvE58el48N4AMLKKXatRNlJSRkbc=; b=cyvGtux4V5vLwmawihJI1sOOFy
	9m4IxzO4xNKECOQEp/stbApFXWExYxLKPAqRl9TAxDK8fiNv5mFUePDta/JMDUtCXL2O5bb6vdp/j
	FBB+3AhdnUm2gVI57JS/P1jqfugvlyqgqZZX1aqvYid6YzuQ1nXt8jRg80fT5DLXmxvnRk7mzJ/rG
	r1FGg2YaOX9/FaQfn10k7YsonnORRhoOS/aVjddEDvmodvtCWfoR64JYlcTltr+4fIEZY9mfr0VTV
	9lbF2ijPUMhXKz4b7CLmBKL1xe0UAD8CDQ+SWkWreA2hyh//WsXqxjWBWKFkL3DbdZW5ejoT3Bl7Z
	XdESJ/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBrN-00000007Otb-17dK;
	Thu, 20 Nov 2025 21:06:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBrH-00000007Or7-1lE9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 21:06:28 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42b2dc17965so1277698f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 13:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763672786; x=1764277586; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGrpLSO7RqibWTIvvE58el48N4AMLKKXatRNlJSRkbc=;
        b=bvGJmEP7y6yEZ9u/4IuD5Yreo40gj1uMLuSWAf0IqhpsUNwDXTtNVd8s7Yc4GFNFXy
         r6dlq0mWkB2MHiBnF5bEPBIRzIoFygxW2yODOrN61vUzPKcvlZfP8aVYbMIWQl7gHg6v
         kIJB+H2okT5hztkR47AvCLROatHB2oJ0UxfLa+00xHKwsdNsAT4ZG1cIeea8OwrjZN+O
         Zg72lryagQF6KAuXexUipr3t2vSAdnveVG7Nc4iSrs7paln8+Ndfb6k/b/ku8goiKqRn
         WX5SHbMoEiyq+oo5jFD4Ffd05j5igYWBGaL0Gd4CFYYZSpHJpYHH0rlA4/XKBEPGv+Il
         UVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763672786; x=1764277586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jGrpLSO7RqibWTIvvE58el48N4AMLKKXatRNlJSRkbc=;
        b=twpDQi7q0rAjKWoudMFInBJz/lYMkl8tjngHhpyr5huN0hdeHycJ/qtqCwS0aMbebu
         /XMCTKBn93BsYJhQv+R0YsQ++mlK8+a3KoSuf/PIRAdhwZjP7W07Kqy28Axx/MPalcDZ
         nNX8dxHhBNA9t1OubFBNOl2TxfTAAGFx0GIbrsgRYY2pYY+FbnqrZLl3Xh/RjRoMsKQ4
         LYULQPKdvsKp8xrTiMQqGAkd4HnqGBqK6usnMn9FaJZ1510bNtOge4YgpDqelghGV5OW
         wGqEUSsv614/6mLmWRAUd6AOlSvqaJJKxnPGocFRShR0WigmcKqipk0oA816OKzhOhxk
         Asug==
X-Gm-Message-State: AOJu0YwFvTLHGdKTRLNKzXUJ9IqV1PpMSaZ9Cjc7AsK/cIxRNB485OHz
	JXByBdiV+bSv+a9bG4s6VbMCRzTHC5M1jkpmiN7rm9mFVaceHUcgfbA+7o5OzWFwub0=
X-Gm-Gg: ASbGncsojIukW7H+UYJ602XBNUWcBeHfueFFTF4JfM/APSjbFtncnN3ifhu3mYqcwFT
	X4VEU9YGoA1m/Ju8TdpyyA6E9KCxuZw4v4k7Ng04ECXm5imfBwqgzbCCA53IDQ1+9naO8aNOn3S
	977Jg3ax4HmZVrnKB3g/Lt6PfL1nHxrS8OhIMe1lZsz9pjlItA3Oxg9w3+KvF6HUHgm5cxf9aKs
	96LFcqXCrcaG1m2fua3nhzX5zNHxTysiJPfA7L/SjlaklfU0Ntnr9VWAMmFrGseYzLhC3npWVU4
	O6MYkM1lSgMbwRCiKmLLjldPXnmvaqjGg8GQdnXrCZ9ambaOxHekrK3EC0xxl2ty9a3tveivwmw
	MaoE8ZhaAoReFVgw4Wa7QJxtsMMJCkD0/vBDofbIDNicQ+Am9PgbjrkMQN5XJAZHaWwWLxnWltF
	t/VkNyb2QDlHd8y8cDPvu1K8zUNHQCxjWZyo7BeWA=
X-Google-Smtp-Source: AGHT+IGRh9YI5GYMBjiLuiPtf2I0mkD9KZvk950BHI0yExr1aKpde6+NDWQM8tzXu5YIrtApVzQJ6A==
X-Received: by 2002:a5d:5f96:0:b0:42c:a449:d68c with SMTP id ffacd0b85a97d-42cbfb0864cmr837159f8f.30.1763672785635;
        Thu, 20 Nov 2025 13:06:25 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e5b6sm7321287f8f.1.2025.11.20.13.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:06:25 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 20 Nov 2025 21:06:12 +0000
Subject: [PATCH 2/4] dt-bindings: samsung: exynos-sysreg: add gs101 dpu
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-dpu-clocks-v1-2-11508054eab8@linaro.org>
References: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
In-Reply-To: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=hy/K6BGPw/RHqXahng2GeGBJJaR09CDU5bF5fZ2rVfM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpH4LKmGf5AQvj6tGjpwDAMh3/sbxlKcWzGEccy
 rqgIKhyMUeJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaR+CygAKCRDO6LjWAjRy
 ug9pD/92Ed6TgocOI6TPwbPNBdeEnDmaN0qY7edZYHy4zhr+Gqir3v12M4hhu2ud2IAwFzx2Y2Q
 rGB1UHYXGMZkAMdhKqNZodUw6eopkvqUaqtyCrEtcRsaAxRgATFlHrpu7RxfrUgtmq1W6rMFGbY
 SnbW69Q5TzevSTfcEI3RoMQs5U9D37YZDj8eIcJ27UD5q3E2yrHdcDhZteWBSMAsU6X/9d4PMZ4
 Fcyxk4TYEvasQHtPlhVEZ+ZrLIDkhjtr9DNkrWjsySnF465j8RnQScishN/C8gkOnUovNnTe/kT
 XyWOuuFHXSVCVSNFMLyZ9a2z+JtcgHqeT97ZOe2mnCLsM0WgeJC42acNdWBf3FieyO4eHrPVcUb
 RhHWgjj2v5FGWMXSJvL9O3Vrh1SpYsALsP6PQV66oxlynFV98xm6aGn3EEHIcrejftac5aYvT6X
 L9xSwuphPBxze2APX9E7DdxP13V5vOkHEnt5IcVPEnvdYEJDwnSezTOZ3a2oo93E0czHmthuKE+
 I6YeT6WOhIeWn5oTVEax8H/vgA79Ge/jStIgofj1dc6ZhvvM0W7Dq6iPNovAZqle9yxuR80L4Jj
 18skMFYo5GvGaFvc1MSaZ5I8biqifpLFNJK6xEgwZMgMnNB/qpNCNuZ5Xu+uymKPKldanRA2G8S
 qS21wV5IaZNh13g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_130627_477949_AF0EB945 
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

Add dedicated compatibles for gs101 dpu sysreg controllers to the
documentation.

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
2.52.0.rc2.455.g230fcf2819-goog


