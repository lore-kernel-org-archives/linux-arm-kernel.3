Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919E4CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EZqCABiIEnd0Y9dNLKHtIhbcAbjGjEboA5l9h/vQsc=; b=mOrcirxRbpFMef/eVJh0zU8+wG
	YSD3ikMzlwQfocjQJk5lXydGMlCZDRhy14pIHRDNOjZCVpYDqp3B3fOa3sO+YmC8ORalBf7Dl9JbL
	HS2Df0w8TqoMSj86KRnc05qlhXgBFDh0rqX1m8JLsoZ6w6ebkZWasJoDSoozRnleyifPVmzkTt+zR
	+Hh/bRV1VN++4YQGW0zNw+FyWsB7JAqVoouImLBilbJIEtoLssGeFg/prnuGMTRfsGbXNSJWM+MIS
	ukBrx8YmY5K5hcTfC6Qs80wEOM2xXq+nn3HBg8p8H8STAmRN4NqFjKXngVtaeVJP4iyyMvKZ66bVW
	VmhCRVJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNM-00000005IVg-12EX;
	Thu, 16 Oct 2025 15:58:48 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNJ-00000005ITX-2Stl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:58:46 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b50206773adso395187566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630324; x=1761235124; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EZqCABiIEnd0Y9dNLKHtIhbcAbjGjEboA5l9h/vQsc=;
        b=kQvgVEKd3yjxH2wBlhoCYsdgFNz3VtXjonY4U6GdUn7x7rvzhpql/q7DCnoeUEmXwS
         zbpKcQs4SeMNtBJX6c9o+bjSH8XDCR5BznUM4MzagGM00tHwBokxSFKrxJoLWlxQtSPA
         11Wy3h7Bw8EW8rOcgGCBKy9cO6nOWoOv1+nhZ0LHmz82A2xVBH+4ubbso+3vSVzI6QvF
         cOByi300la9alCghSxOz8fTUeeyhWwh1jHvRdZLwL0V+R+u9HuKAQsC6DEQpuC9SDxNj
         4LE2Pjff+O/pQUtdjrcw8Hjze/SBwjt/SrhD2JIQBwjy7NlR2jKnkL9xkql5rNqItFkX
         UMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630324; x=1761235124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EZqCABiIEnd0Y9dNLKHtIhbcAbjGjEboA5l9h/vQsc=;
        b=O9SXEcPZ3OyLowFORyo5l0Ea/A8HOilHs28i9F3gVl3Myy1hajzOAQyVVFnjaQWduP
         pK/z3TvD5Ht5tCzQuObXoFqeUQaOzRazIsTYg7hp0Z4bEiw0fovb8CaR4H4TfwOuzZB0
         QlLt9deXuqSckhupIeyonwJ+FcnOIsuy3nGWWOS5ndNyzcagITIkmXWwASbL0N1JJ7U3
         KTA0yl4cZaVO1aIaCZvW+6h24VhxdUlEIr4BcnCPPMQW3/M7a2kIsxkVdwys+muU+JWB
         THynXbrSEheQNPf/s/H/6fib1Cya8XhVXUtUx2E4xPfFp0gpUCIhKiPCpKXmPEAjwKrW
         Z+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVDv8V9r9LbjhRBe0N9U+I64SsXoEjOeckUnxUxa4w+5srZ1XuMzMAmOWsAfmMkdTXEjjJJUwrvEc3hG1qZWt1L@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1ZCsox0XZqwNY2DFPgSeUekM0WOzmpPgWHhKxB/ywmmq8XUGf
	StBVcgMZPDR8CAoG88s/kW3dmbJ1W+tOAVEFOJcrzqGbxZHt4uJ4hiIRBr/n8mCpfcA=
X-Gm-Gg: ASbGncv3DuvWonL/W0+JT8+rmBhGzfvIjNZeV74hUZKvlTj3Pzg2m3ilq5wJ67aoqXw
	pK8bSUTWjshKz7RiHuxol/Ouxvpc1wI8074JPiwHv47flHHxw4W+x76KK50AFHI8+3errUTAFh3
	Rtfnn09PJU1acGJdlEeAI2Az5BQocw2Q0lBV6+Q+kR82cPdzQmupss4h7ESeIx+Yv01pTEMYLTh
	qugb86uBgwQMRNkHECkh9PV6KPrHE1uuBvcw8Ax36FArCx5toewJ9FNRBKJopq6podaQLaNqQrS
	5LZgEEppbPskNCgVigW9V+ibJ95R0l2bpY8fiRTuHOY0pOOGaSP8rkt/xmYkPos7c+n0CbRHkRG
	TWkBe25MSAJL2SMDQ5TO6X1HmuGXC5sAW1GHSgvsH/qjsHpkuk3Ozhf/h1WbFnWL3i+bGbDNA84
	pC6c2a4eVoEoL9xm2553CrvM3OByNmVile+ZhUu44iGMdgjLjD2cnLmn5AldC8
X-Google-Smtp-Source: AGHT+IFH5MBvT1BbvZNO7LnK4pIDcpdPVfm9z0TGyk/r6VaVSo4jUiDBCHuy36yU9LuWlmcxA0MaVA==
X-Received: by 2002:a17:907:d27:b0:b38:49a6:5839 with SMTP id a640c23a62f3a-b645d20f122mr99022466b.11.1760630323679;
        Thu, 16 Oct 2025 08:58:43 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:34 +0100
Subject: [PATCH v3 01/10] dt-bindings: power: samsung: add google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-1-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_085845_640363_19C42D3E 
X-CRM114-Status: UNSURE (   9.53  )
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

Add support for the Google gs101 version of the Exynos power domains. A
new compatible is needed because register fields have changed.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/power/pd-samsung.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index 9c2c51133457112ca0098c043e123f0a02fa1291..c35c9cb0115d79e5c36142da2c2a5dd30cd2ad47 100644
--- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
+++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -19,6 +19,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - google,gs101-pd
       - samsung,exynos4210-pd
       - samsung,exynos5433-pd
 

-- 
2.51.0.788.g6d19910ace-goog


