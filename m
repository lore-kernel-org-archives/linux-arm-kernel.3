Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DA0E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=; b=pIfOKFmDBdIdmdN+eZ0apyOaZ0
	ErUBBH6yqUmtcbdg0njP+fuMmqG9R2YDJEFeQeaYBYsgSSuOzN0RUrwuBaQacOp9KOlLVN5JSjXSa
	ELIFSjbgW+S5eiyiNNv1pze9DILqpY5NeC066Wkce9klAwDXViBn0d26ho2ycjEVtFNzCRfor4zfT
	fSV9dsb9tKNCe59pMUWygnWLrfyzSyPMO31BqFuwhAPb/l+O716oiiYza+NfzhH3zsBS7fjgJKSp8
	YQy8AcBbqU/ucLSpj+foVkxXVvoPcSnc24rrj8NPTh0HI8pESAzVLNvhGzh3htUpAP9VJCGxGGNm6
	VXssoLTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDmQ-00000000gAZ-2EWI;
	Fri, 27 Dec 2024 17:05:42 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDeZ-00000000eTz-2P7m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:36 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso10390524a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318654; x=1735923454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=JE77TkX+ZAMUYF9kHF6CtX9lw+8/8cJLHAWAaiRuCb9dsoeTmOBkJN+rKX4JhGJ0Z2
         Lc77LBl5FGhr+UoY6+Zbl22P8FQ9Xfi/TBj7NErqhnkBMhOxRjp1CNRa9hNrAPJvaTXT
         9Yv8BvG1gAGveqXpnDfbU4MUiS9C+XkDcwVTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318654; x=1735923454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=CoUbtssAwhRVY4V/re0JlGiTYi+PFAQodgw25pszHGV7GKMmorTiE73+Nk8SjAI7PF
         88qm64HPLVtqSYEbEe4JwijNMAdCjJB0UAg5DgEtDx7+HEpdU+FPdeI2lPUsHue6KKNo
         +3I4Odv9XREYQyvDgpj7sbQa8rftfJWoRpii8uq24YiC0iCtqwcmGwLYqwlVq3uW/WaJ
         Bl+XPNVmTepYwIlLIZ7e484m/laBjxcTNGGegvFg/yhObBy0JOPSpu9pdSqsSWoTrrBs
         pYYd+ilVkBKRejZ4/6lXZ5SxVsXRHJGSxczs3tFiLmf6ld3tuInJL3cfCd41Uh07n2f4
         PgiQ==
X-Forwarded-Encrypted: i=1; AJvYcCViZCvLn+IiY4W1Byeww83N5BHHrMlc9di2SMHiSscyJFYf1Dolazbk6kExMJlF4c9H8YdfbgHU6e6Q1N196wOu@lists.infradead.org
X-Gm-Message-State: AOJu0YzYOKikF7UyBa/N2zir454qnQiLwAoi+VV0W58n4lCYaqR0t6OL
	FFTZJURPSUE9icXunelDcirvEGf/+a713hQEIFGPGllLcKXgEAoouMFGG4+ihoQ=
X-Gm-Gg: ASbGncvogJdLCr03LkbHLUN0vqld3PpYFLELVivHQpEr1HimDp5Vc3+4pwTlfgphz3m
	HNS7JiXdd7Q9pc0oT/jZXEqzoTfPJi5qO+iNuIHxZ7si3ZaufpJgQHytS5jinw4VKaPCudooyxV
	JXZU9NnxwJRXdk84b4kZr4FimcHa68KHDT6TT8U43Qwl64FvIS/im1yGrfeHxZfXp42Sp5rpt48
	/pOwjPjumOXbO9jeZ6doqE9d127aeIvfZ3KYtiCto6Kw3gKiBv5e8KPYlCNYSa++l7X56mXHglI
	ezZUFdpq2RJNw3tDjNDUeg==
X-Google-Smtp-Source: AGHT+IFlmdnMThLPb9EkkuKwMxGI60ovbSUep0LqlOvlgpARRv5AlDDZd5jWQljGYpDND2+/ZP6Adg==
X-Received: by 2002:a05:6402:2693:b0:5d6:688d:b683 with SMTP id 4fb4d7f45d1cf-5d81dd9c716mr60767226a12.9.1735318654135;
        Fri, 27 Dec 2024 08:57:34 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:33 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v7 06/23] arm64: dts: imx8mm: add anatop clocks
Date: Fri, 27 Dec 2024 17:56:09 +0100
Message-ID: <20241227165719.3902388-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085735_606102_947BCEB0 
X-CRM114-Status: UNSURE (   9.71  )
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

Add clocks to anatop node.

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


