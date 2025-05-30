Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B783C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugagfCqzkkb6ZXT3N2b0w96FZKb2OG83xQzQHJvA1Sw=; b=0cEPJUXL0cCYJrKS7uvMZ8rcNB
	mmaaNPpVg90N12B6vI0bqGo4nESJZaYOVZizEcTqrsZmuuWRFQgCCVgTQ1przE51XUF3tzGHbys7h
	Aotz//Wpz4T91w53ONXOXkuImIqcuulVuAcLTHUYgr2Hh4VVxcCnM0RLB20BOa5NEAAM7MhMAfaPM
	4g4N080jasyMMQfAmWL6yV8M3n91xa02oGjC7qJ8JN9P7GK741KiYf1jyMMgiLveHnxQ87DjOWoI5
	HCxvFLMp/Gu7vtpeMqlXv6WGwTFRP8VY+pzNBaq6TVNY7/4shOHTYsOwR67JNXLFclN+FGKOnbHNy
	0WAp3Y9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2NJ-000000018AR-36eE;
	Fri, 30 May 2025 16:14:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2Gz-000000016xO-1xQ2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:07:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43ede096d73so16401435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748621276; x=1749226076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugagfCqzkkb6ZXT3N2b0w96FZKb2OG83xQzQHJvA1Sw=;
        b=JcK7WJvRnrnaKtM+SGG8+cbv9sQ5C6MoeLQPRhPa7sV0th62akqfDbr2uLvogUR6rD
         sMRYceTOnteaPDNKruq5Iap0SYTr7xlpK8ero6JIhkTcLq8Nkiho+E1KBAtiREJszh/T
         hMD9yJSjjkYmyWJEbm9IUbpJolxA6S0Ifriic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621276; x=1749226076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugagfCqzkkb6ZXT3N2b0w96FZKb2OG83xQzQHJvA1Sw=;
        b=RJqjNr68fW9qhZYAqGDPTLr72NbdxpmSUDTAM3kBdL+/3BW0ucrGduUzFsz9AUPkBs
         tdAzZNbjpK8h6cH5YOP6//7bYKbKPraZYuaaT/d8XGdV56tJlOXjKqLDJ3IaRaMF75X8
         FKX6BOvdw73rPV5NvIPS77g/pnQeO9Mkhjk7lRlXuYRstliNdvT3+IOTj9gAzAQkPY+o
         70Q6TVSVH8gpjb+/sy8gRuFJjrD7oV6nUEaHYwOHOehjkNweaAX0q4Iu4ynh/Y4odi8Z
         lr6HpO7XyB4Ir3tJ7Y7izq1EcpsTsnyKXWo8mw9l5XCH2Xriup1GWLsaPKSOUBssOGIi
         h3pw==
X-Forwarded-Encrypted: i=1; AJvYcCXkwlQlJNV4SgTmyt8sy7pdUhSPhO7qfFWCYp9jzpqoDQ7ZEFfLroFCt3oD7gVyOtpUOK4chYsEbvmtr4b1UMta@lists.infradead.org
X-Gm-Message-State: AOJu0YyabUhJWZOoALQ/62G9frrYqQSXkNcQp9lJa6H8t9D7Gg7PVN1F
	oLSVtJeD6htF2w5oKNYg3z1s7bHJ3RHPJkgOetv3JrfiO3JTvYy10HCGsOz3k9lH53g=
X-Gm-Gg: ASbGnctHnkKXz5P28b81HLVaOsbimFEyP7rT/OT8AzNm1aYO2xdTGz7N1oyupjfYaUR
	oryi6hWVv+w0oshpSwjrweSQNIItQ9TpH99i0VK6OKW1BaI8kEOR02jzvR9amePZWkr2i6YGj9Q
	2lVLt1hA4PUR3ZMFBVm9XBUksfyK1lly4GdZtp/nuQdXQDyUTOp6+HK5/6mGNmzFFOw9fcc15qU
	DraHWX+X2w7Rorb53YpcMGa1zcnET3fXNcHvRP5sYAJl02wVU+edCBlKU95hxKkvV8auOSZWaBa
	+THuxrCoDqDyT7H0+Gig4GBp/+oG/+97b1VM42ZT0gueO7vaGx0LQN8vpKquGNw2an9h/Di1SF1
	f2OPfYfJ4yUfk2r5bRoRabi0Dv7/Tb96WbkbK+S9r
X-Google-Smtp-Source: AGHT+IF/FFTEstI8VczI8bSd8uyPZIXtdnlGAyynzNnJaNGF3uvbYAuD6vs/4UH6m6kIb/231ZEJww==
X-Received: by 2002:a05:600c:8207:b0:450:d586:25ad with SMTP id 5b1f17b1804b1-450d6543cf3mr43891965e9.15.1748621275772;
        Fri, 30 May 2025 09:07:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm9716365e9.38.2025.05.30.09.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:07:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/6] ARM: dts: imx28: add pwm7 muxing options
Date: Fri, 30 May 2025 18:07:33 +0200
Message-ID: <20250530160748.2476088-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
References: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_090757_502785_DDD25C78 
X-CRM114-Status: GOOD (  10.33  )
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

Add alternative pinmuxing for pwm7.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v5:
- Add Reviewed-by tag of Frank Li

Changes in v3:
- Add commit body

 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..ece46d0e7c7f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				pwm7_pins_a: pwm7@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF1_SDATA0__PWM_7
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_24bit_pins_a: lcdif-24bit@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.43.0


