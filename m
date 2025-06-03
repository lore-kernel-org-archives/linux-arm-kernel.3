Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D29C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 15:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyDAynqsG9jh+cOOc7N5aPAGPcSiqWcSOwtimCSGBpI=; b=0rwNbSyuWK9WO1dRsjwyuIGrDV
	QlZ0OwSemsBzmItWwSiVHFF6ZvlW1Ps9CDWhDDNYeKjWJf5A8iinekz2tySe2jDR6qBp8jF07TPE4
	K6qdcZbqMV5C5gOKtBF0J+b7HjqWXKRs3Iv7K7E1KPTUd2/Yn2Ittn7jtP2cLRk3Q7X+q3W3iKtrA
	eHEOuoKEwcT5+h1lS4Xsbufgq7USwlqoxegmGcAo4ccwbj+zEEA57vLxXaHjK0PWslvGdcnc1FUu+
	rCimJw+Uh9Nz14zSuo5ZMKGDFK2/IjoP1zer5dI9WOJEJLm4nSeufbGhiQhHizMW/F/G8gA8lGeNa
	bqwHUJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTrm-0000000BKCn-2tZ2;
	Tue, 03 Jun 2025 15:47:54 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTnP-0000000BJSX-3kkl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 15:43:25 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad51ba0af48so1196953166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748965402; x=1749570202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyDAynqsG9jh+cOOc7N5aPAGPcSiqWcSOwtimCSGBpI=;
        b=FcilJkGrwHvJRQMKLNI+lUoxwPaNuyki/6p9aNoZJjn0n2gPkHFiqldRgg/zcL4y2G
         EkE9rEf5kpDBhwM1j84IrciWcVr1eRHTEodyMAbK4jih6CGyMBbEp1FUIxTFc4t94dWY
         rAx1ntjLUn8Ppl9Il8oT5qvtx7uZ7lNsACnzwGMfimgeehH+VjTJuk3aQ2Yh+l/p72SO
         yJ68Mr+BZ6U/Las/JZeBCTUos9b8YyZ4/e4qTfcYF9awa2ZJ5mqDnVeRLcFfRQOUZEHR
         GUJol3l8eWMVEzIu2cEanzNeXRzjaAhO/x8SRmR/zQ0cO2w2/8J1Kyjs2ukVRnXkSrEg
         19jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965402; x=1749570202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyDAynqsG9jh+cOOc7N5aPAGPcSiqWcSOwtimCSGBpI=;
        b=Cw9Dx27qSFw3qKtJ6vdh0w6HVsVOtq5KPMtk0kM54upvWaLeDnJEotxOSoZffTVfQ/
         3Nmz27aQ95V9Wd2xbUaptUgYVi1aC6sksNvhfRi3SJzyLc3lWlZZ7gRMZKb9vckGqLGr
         m5Trooj32Ew3RB8RLWXonR726/RCKme8Mvbi8lwmNZ0Kd1MPUpODpyLt38bw1d2hT0Mj
         SrBGB5qi1JduRHqBMAywyzh+5Jp7CIJR1o/QSL63kZ6aLW7yYDEuXyZaWYtUXdX+k946
         q1/bQcmJSjGE4dTw3lU9kYPID6Ph+ArMR3VyROfGx/p+6rh2+jZYJ7i2NtVm2ulaHjXG
         3j1w==
X-Forwarded-Encrypted: i=1; AJvYcCUjSvIdHu8R1dwiCfeOGeZIKt8O0bjd2HKZL1I8PG0/9cmsorGB1fQhC1G71YyVHqGQqnzQMn3hWt6M4Rda5Mf7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1WI6zYTjoKjkijKotOTnDFhOmF72IimsAYt6XPsvuBpGsNwOz
	1ffg6awnbhhR374tC78+pVNNAWZal/28FWC2pt7zWtTj168IrU7H+DS+VokUBwQZFPo=
X-Gm-Gg: ASbGnctaptvWdVhEbczWJBx55cEays6NEOhOf5G+gmXNqQtfGSMWbTbGY0Tbq+br8V4
	oKgKHijCKRZEvTonT03WraDblXFwsXBltnEpivm4zXyCq27+fjzvH0GB+/kwTnWIuCezDdBeUls
	//wFG81yj0eKjISQXOW+3wmgTEMm79iGwJxqDQlSxepLHyo+e07h7F11lRHAFyiV1i9hFkC8fYl
	X82aZHtrwhY0AZ5606pw0Yl3QJv0WwEixauTblk5FdQ3es/A/1u33+x59OpEUkF1Blif5mn+BEP
	FrgkEWgHzGeOwi697xd50UXSnp8v+jUSuaEVKwCT+7OgKW6z1MWNb0l2z+9pqVrHjATKvjgEXPl
	/fB1UZpmrshsbmNZ/15IJk+E/DuyroIOWtbw=
X-Google-Smtp-Source: AGHT+IHaS+y52wFsPfn/BGos8YaLrH6Wz7Z3gAJ7jHqi4eOsbjUUHHFwYuM6LlBkTlFWjROGBuJiGw==
X-Received: by 2002:a17:906:f5a3:b0:ad8:959c:c567 with SMTP id a640c23a62f3a-adde66652d6mr315927366b.10.1748965402049;
        Tue, 03 Jun 2025 08:43:22 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de9bsm959277166b.47.2025.06.03.08.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:43:21 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Jun 2025 16:43:20 +0100
Subject: [PATCH 2/3] clk: samsung: gs101: fix alternate mout_hsi0_usb20_ref
 parent clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250603-samsung-clk-fixes-v1-2-49daf1ff4592@linaro.org>
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
X-CRM114-CacheID: sfid-20250603_084323_934984_4626E9DD 
X-CRM114-Status: GOOD (  11.15  )
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

The alternate parent clock for this mux is mout_pll_usb, not the pll
itself.

Fixes: 1891e4d48755 ("clk: samsung: gs101: add support for cmu_hsi0")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 12ee416375ef31deed5f45ea6aaec05fde260dc5..70b26db9b95ad0b376d23f637c7683fbc8c8c600 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -2129,7 +2129,7 @@ PNAME(mout_hsi0_usbdpdbg_user_p)	= { "oscclk",
 					    "dout_cmu_hsi0_usbdpdbg" };
 PNAME(mout_hsi0_bus_p)			= { "mout_hsi0_bus_user",
 					    "mout_hsi0_alt_user" };
-PNAME(mout_hsi0_usb20_ref_p)		= { "fout_usb_pll",
+PNAME(mout_hsi0_usb20_ref_p)		= { "mout_pll_usb",
 					    "mout_hsi0_tcxo_user" };
 PNAME(mout_hsi0_usb31drd_p)		= { "fout_usb_pll",
 					    "mout_hsi0_usb31drd_user",

-- 
2.49.0.1204.g71687c7c1d-goog


