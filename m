Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BB4C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 12:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rP6n61SWekMknO/zRlSYN14fVYP5G3VDX27XosLbmfk=; b=XCK/fQFR+XZzCUQ1YAZOSjY2bd
	5LbMw8iYdO1EZ0U8qnG7bxr0JSIe8iwq5SramOrS2xbkSv7go4A6/iMxkiIVcfEmN9KEjVDCd5uZw
	evJi9QbYVh7JexpbC9OwHvgHTRN37D1ocBocQAN9QhhLMnxKnNqXZbt2fzwBFLXHKNbfYZ3631GQ+
	mJCOFhiofp1JDjlVEsRBmwuA2UtzWvAAUDGJKdBAN6UN5aUEVrdCx+RZJVb57tqDgfS2bMLZ41tla
	T/HGNapwvn4UoPklExRYp9EWldV/NZjTwDvEAyNbsJhBVkPb5F8m+fIWiFK4TBaqO5PygRyn+wCXz
	ulBXfPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fkn-0000000Bc8P-33th;
	Fri, 04 Apr 2025 12:02:33 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ffU-0000000Bb68-3ZMc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 11:57:06 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3912622c9c0so192212f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767823; x=1744372623; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rP6n61SWekMknO/zRlSYN14fVYP5G3VDX27XosLbmfk=;
        b=q2qB1xRO/YW+lV1RnVrsGW370m96S0//VmPjGAskuRX90ATZRNC0ugJBfXx5js0Iwt
         vqLmjAW+xkHNMEcF/MfY7qHV+KbPkcsXB3xyz3mqqmYlLr4JKrwwl6au+8lWRJL0xPmq
         b6BQbPsQJLwEKZKFykRKGn/QJS1wM2ebjLeEuJ+NAGIZjo2krwNWp/B1bNyThTiN9Gj1
         wV2vZ5uBw8xHVTn/IpJRLOxZvfuPGezBvB9gtoC9WOYIJGHmxaJ99xcWfQr6jwXcKa50
         hlhzOrA/c4j6oN9pu109x6DAK5QSGukRfbX8G60Ad9C+mi5SXtUpJSAOH98w4oDNnFRr
         Uz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767823; x=1744372623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rP6n61SWekMknO/zRlSYN14fVYP5G3VDX27XosLbmfk=;
        b=Clul9NpEP/97ge0kFDNBGo9ImRz5UOMsWiK4rUYSeVde2Q04yKxaGF3pLzRf4kE3Zc
         yJg1U+Zjy3ybYsYXjTw9uvdDpXZC7goifBWEiSEB7woUWLsAfE36mFhuY4XZO6i6uUbT
         Iq+/gt5XvwAINUJ60O2w2yh7MAiz76P61UNJQ/6H7ERKtVYJiUVAnZmvmbPzpe2cGksM
         jDcTHi0bpURlJ+KqXKzP3jeaMnoGmVaVvcEz5Cr3M+CSUE+LugRtI8++ZsmX4QcWqhUg
         zqitSadue4jjNVZXLcMENzszSLsoYkPeN3SJIn4R5kJOz2UifRNJthAn0guV1QMLYMXl
         REdA==
X-Forwarded-Encrypted: i=1; AJvYcCWnNltLcfbtr22UhKLlfNJni+g0T2d4ddj90wJNK3U37HhMD7CdrNHLqxopSUrMUl/5Y3dxncFiXw2pOPX+a89Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzbLYr+cUX/l1NKzHt0q+b9hQOYwvha1wMrg/p1OJIQJLFK/EoI
	22bx0KeUOV+XOL3+apYQACEtFGQRqqYWjmxyZpSoyyy8mJVerQ403nnmCQX8Ng0=
X-Gm-Gg: ASbGnct7vzl+rt+1Da/1Cx1jWafUaneQNzEgsdUWT1UOWJ+GD0ZDITXMSFF0EW2oeeb
	e46wW8VnJunbOxCyxu5YQbRDlEhA6EruuI6ONdIprpPQ5XNrG/dpUgGg2UJZXCP9NVyVMzOJWST
	mQ/IyIJuIOw0MtpJNTibMd46Zjx/M9yPYl46gcgRCDdEOsrnAQIPLSGmdaV2K8sxexu8qBGUAD8
	cYoTtOExp7+CUe2SeImpwtVGI5AjC+vLieGF/3CtUEytXMIOFhzRn0V4g+GBKyoCiNEfvTzuWVZ
	7l6QHbSuYxsz91IddW8SUmglSA8nUm5YHltCK0CdvsAP0ea/TBo5UzkHHI5XgfI=
X-Google-Smtp-Source: AGHT+IGREdRnQ2gEflgpMySypGT2xrFpTeuT80iZBzxVkRizH3MB1Iv/GdfxP0Mu67TBThpOTa6MIw==
X-Received: by 2002:a05:6000:188e:b0:39c:266c:dae with SMTP id ffacd0b85a97d-39cba936215mr862740f8f.11.1743767823172;
        Fri, 04 Apr 2025 04:57:03 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:58 +0200
Subject: [PATCH 2/5] clk: nuvoton: Do not enable by default during compile
 testing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_045704_893558_A028F2AB 
X-CRM114-Status: GOOD (  12.61  )
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

Enabling the compile test should not cause automatic enabling of all
drivers.  Restrict the default to ARCH also for individual driver, even
though its choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/nuvoton/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/Kconfig b/drivers/clk/nuvoton/Kconfig
index fe4b7f62f467048b7c86890972d55faebd066947..e7019b69ea74824de6943108f30ec259aa52e5f4 100644
--- a/drivers/clk/nuvoton/Kconfig
+++ b/drivers/clk/nuvoton/Kconfig
@@ -4,7 +4,7 @@
 config COMMON_CLK_NUVOTON
 	bool "Nuvoton clock controller common support"
 	depends on ARCH_MA35 || COMPILE_TEST
-	default y
+	default ARCH_MA35
 	help
 	  Say y here to enable common clock controller for Nuvoton platforms.
 
@@ -12,7 +12,7 @@ if COMMON_CLK_NUVOTON
 
 config CLK_MA35D1
 	bool "Nuvoton MA35D1 clock controller support"
-	default y
+	default ARCH_MA35
 	help
 	  Build the clock controller driver for MA35D1 SoC.
 

-- 
2.45.2


