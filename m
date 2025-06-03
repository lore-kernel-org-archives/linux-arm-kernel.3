Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C12BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 15:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIaiXwYKVn8R6QIWY00MiAnh81IbvOV/xhrE7RJnhkc=; b=b2C84TQr9N0vpPs2XOFHh8asHz
	RzJhPuLDT8u8cqsSgkNLzK5k2lpoodEWVnkprSS2COxN07WxB7cZK1GeIGWmPSm7w85Y7XogcqCOL
	I/l64kn9cyRc0d5ZDW+xDO5qUuAaU+JItfrLafMqThFIWJY7prBy+ye59Ntv2aGFBqBBNqFerzEwP
	fM3J2orT+IL3weYF3WapKwLexn6h41JwVJF7O6pd5+HcLPIlLfrJPCeDMdZVzFkk4MtylECQm0u+w
	zuUqZR5+5A12F6Yo3OIstdPly1TTOKoxq64EI+T/m/abCa6Tfw96wY/QD85gI7rNJ/YFCPb3zUqp/
	JI1OQSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTw6-0000000BKfa-1W0X;
	Tue, 03 Jun 2025 15:52:22 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTnQ-0000000BJSm-1OXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 15:43:25 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-adb2bb25105so922936666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748965402; x=1749570202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIaiXwYKVn8R6QIWY00MiAnh81IbvOV/xhrE7RJnhkc=;
        b=fnhsAGDHWxO1SqN5zCSXjq/Tw3RJLYLUOaC1IANkcQD6/3I4/ZpXy871AUxW/1DF0S
         njdTaLUyWIlvy9zvXlRWoqswSKzEjKnqZZPHn2/OvOrCOa0eKXiWPhe2U0/dSZK7lV26
         C5VVyiIievtigjRDHU41TR/KFO7W+4bQCOXncMhpx79FohBum9xgA1OyFtiF3udbXEFz
         3EyqQcTbMmsCly5pALgR5Jlxv1DG/U8ZeTmwRKjI5zKx7FuNXTsK38UaTQx1FyCjGKYo
         pKSaWgNKpgEllZ6oc5RC1a9DIKiqfDGVw/zyctyGwwcPVkl4VzFmzlY9p5tMNKepTBXT
         NU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965403; x=1749570203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIaiXwYKVn8R6QIWY00MiAnh81IbvOV/xhrE7RJnhkc=;
        b=M1oBX7Y9yL6SjXQpZRotKvnW33vQ2up2bpGMNdDow1XfizhKnG8BmRNXqTE+se5/Dk
         L5EIrhudMRaDmWLGd83t2jJe3iffPQ/GkEd1CPixsH6HVVP8bbgqeVM/ON/KAtQFow1f
         SUXOE0gTkQ38xVd4SuS5f0IF9BZ4B7t+t/78CHZGN4GPmImh1su20yyJm0ZxRx7j6B1t
         uv6MxlSSNfBhIeIxanrSwRWMAQeF/OoxU7ZmHk88730vqVsWeHkpNqyGgAA9U4vuSIz7
         Q2Cv/po1ohjLEltNaCknWdrOCgC2CYClOENdouuWsnzN6e1W/R4Yscvx0FBqZ63TNp64
         fjJg==
X-Forwarded-Encrypted: i=1; AJvYcCU7625Vy5BSmTmwOaF8HuWXBvMTkxvmOyFMCNZMD1d031dULCio0VDYZgMZrh5bK61VNVA/YwlJAEqUO2h/5z6z@lists.infradead.org
X-Gm-Message-State: AOJu0YyG4IDJHfeyXL/WJuAAi2+6+uDzrsb8Jo4Ozr2Rhz6yxOIXpP68
	Dp2Eu/c5ER4MU8IGWX+NRRjWb7eXBmLNf1hX33qIpZHSip4/GvfVrbJsRbXk9pQVJuc=
X-Gm-Gg: ASbGncutAlxghfT4HRbsYbyFl5psvIcznLraFpaHHDy89xEid1OKACTjtpiA6NmWqdP
	3u5RMTSOpDTxUAWCH//eqYHwuX0NGM+iMqyN4HztJLdRqgXt94eBD+B/hjuevGXEfLBhMp4enI2
	lP8FKJ03StK9OwIRGLj/YzBIFgBJ29zXlXLtaYR+GhUr2hEij0iaXrIxwPkp01KYE12KrQV+ohu
	sX5dLlzliHMoScO+5HQS3H6HOqxyZ4tzb8BhX8OTyC34JwcQkxfeDyiXN/QialP+1dShPP5nG9j
	hyxj6w5aOFnT1Fznqn/1UMlVBGU3jA2VAzHSVLncJg4d9nmncUDqT2rrYnWba9pLWbf0nOWZnz3
	FcmFhzX67xbq57Bos1A6s+QdBnftg2qXrV2k=
X-Google-Smtp-Source: AGHT+IHuYQHqV4Udvsmxd2a4zxZaKbBte+8oMefdUwG0LYe9b8Y64CtnGXRSZ5iS6KwNcCvJD1IEPw==
X-Received: by 2002:a17:907:db03:b0:ad2:28be:9a16 with SMTP id a640c23a62f3a-adb36c117ffmr1500580166b.51.1748965402578;
        Tue, 03 Jun 2025 08:43:22 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de9bsm959277166b.47.2025.06.03.08.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:43:22 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Jun 2025 16:43:21 +0100
Subject: [PATCH 3/3] clk: samsung: exynos850: fix a comment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250603-samsung-clk-fixes-v1-3-49daf1ff4592@linaro.org>
References: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
In-Reply-To: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_084324_370195_A086B59B 
X-CRM114-Status: GOOD (  11.86  )
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

The code below the updated comment is for CMU_CPUCL1, not CMU_CPUCL0.

Fixes: dedf87341ad6 ("clk: samsung: exynos850: Add CMU_CPUCL0 and CMU_CPUCL1")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index cf7e08cca78e04e496703b565881bf64dcf979c8..56f27697c76b13276831b151db28074387293077 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -1360,7 +1360,7 @@ static const unsigned long cpucl1_clk_regs[] __initconst = {
 	CLK_CON_GAT_GATE_CLK_CPUCL1_CPU,
 };
 
-/* List of parent clocks for Muxes in CMU_CPUCL0 */
+/* List of parent clocks for Muxes in CMU_CPUCL1 */
 PNAME(mout_pll_cpucl1_p)		 = { "oscclk", "fout_cpucl1_pll" };
 PNAME(mout_cpucl1_switch_user_p)	 = { "oscclk", "dout_cpucl1_switch" };
 PNAME(mout_cpucl1_dbg_user_p)		 = { "oscclk", "dout_cpucl1_dbg" };

-- 
2.49.0.1204.g71687c7c1d-goog


