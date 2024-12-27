Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BF2E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOKJ3wQvbvnKfy50Gr8I3coc2Gwt+700w35xpJ+3wzM=; b=aBKuin4I5bbZ1MA2YGSG8rhYGC
	pym3R4Rv5XUT0yZqViAqjWFv1mBDjVs3Tw4Pie1Z5LBgS8A7z9X/Rgm9oz47Ptwn/auVWjDxB9zWD
	accaK5w5KMI7HBb4hQ9kNs9YH2kW/8skm+LNP761P+BRAc6xIKgZgsSDnIi7akbDiBTXweNySAhOQ
	uH4jqtAroVbVC0BHkacCrOfs9E8oco2/ccXzc8MCIefmDM+rfarb/bK2aTWCVLFRVn59vwbn4RTte
	2HDaZEicUkROOZt7FA97H088hudbfIJxR4JRQ7rYqUYP8xFCvyfbkGyc0KLIpz/Iqeb8UYNFHEzCV
	96kpK7dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDvU-00000000h4U-4AXd;
	Fri, 27 Dec 2024 17:15:04 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDem-00000000eZH-33J1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:49 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa66e4d1d5aso1195252266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318667; x=1735923467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOKJ3wQvbvnKfy50Gr8I3coc2Gwt+700w35xpJ+3wzM=;
        b=BEsMYRc7rPz3kZb9ssUYpxCd7cfPr1MWVvtljOtGffJFH+0G4k6Ht4wijgNiZCuZJF
         hqCehPg1Z+fsc2MnAAXeDKAve156swH3bV1i7eTMiDf8cWnvMrJA9S1KyTw/jm+BTEFo
         pC8qIjGNk7qjtaxerBTY++FSMrvcQSk5DAnJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318667; x=1735923467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOKJ3wQvbvnKfy50Gr8I3coc2Gwt+700w35xpJ+3wzM=;
        b=vMDo+TrLBBPIIYJOeilzYJ4j8UG3/0HVvMeW1J/rQAbYOj2MFqSk43Xl1hJzMYlN8B
         ft97i23UQ1egs6nbm95cMq9fJJ4TsNSIoeiSxemkiMEKe0YTAwHaVSOHZnHGb5R1CTH+
         ldzoCjMHA7q011AJEqbcpHZKll9UBilQ2mwQYa/OpQamvpdTVup857anaBnD183LtKf5
         T5Uye1RrqvFQ6/Ur0xTTl7Uqr9Wro5px8+6OlVVQ7HUoAO34uhRYV8rYGnPakSRa+h1+
         wRGCMxir6ekKIpv+FxKmTKuc1IPqQaqF7+55Pd/+C9xKBMV4SvrgD8Q7Hj9ZYXXyrcqz
         5hRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGQLEY/nB5RZudB4eowjVpXQ2lJsZudekWVgzEqJd4EAh6MkdMtWLBjqHYqfUvsueYcXPes2mt1sSt91YHnnYL@lists.infradead.org
X-Gm-Message-State: AOJu0YzsDuu6Q3aGUN5uCgnJsILN3pGQt13bPRjAOfmBvJccGWjG48Wp
	vVc5HcUa0jV9sRDZebDKwJtqx/QFvJycnsj6J8S1W2fa7vLuthmK91Ja4dzZ+70=
X-Gm-Gg: ASbGnctgagG+aGNvbIqrxISSvq91ZBH51eNfYUeJciktIOADMG0y8I8TGPKxo3jed/H
	+NcvhaPi89AsC3GA6AO+eCHqZmyohBS+I+nLGcLOPDBE6pqLUg1r7P21KIgyZHdREBq8Cj+AiV6
	x9rmaY1VR8LGsVBlOBqZDimeIAmx6jmklPvkvXGooZhps7b+tHGP09XfPSGuER2nJ8XCKrIzgJ4
	YnrPe3eJYUwIIkkj1oEvdJ6iHtC6Tr3PH0x/G7OdDOXjKAP23QvMEemOBRgMDwfJJSmqTInpG0o
	2AhDsnYVeiHAeBxQh9igqA==
X-Google-Smtp-Source: AGHT+IGgrc+HQYxCKLo2SLlUL/mY7iziyIkQErGfzOsjT9xrluZfeOeDPohhXk9ai5VYtyng9jIdHA==
X-Received: by 2002:a17:907:961f:b0:aa6:abe2:5cba with SMTP id a640c23a62f3a-aac27026cfemr2873979066b.2.1735318666969;
        Fri, 27 Dec 2024 08:57:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:46 -0800 (PST)
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
Subject: [PATCH v7 14/23] arm64: dts: imx8mq: add phandle to anatop within CCM
Date: Fri, 27 Dec 2024 17:56:17 +0100
Message-ID: <20241227165719.3902388-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085748_767022_BB50FAE9 
X-CRM114-Status: GOOD (  10.71  )
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

Add the phandle to the anatop node within the CCM node. This makes
explicit the dependency of CCM on anatop for generating the clocks for
the on-chip peripherals.

With this change, it will also be possible to generalize the CCM driver
code, as it will no longer need the platform's compatible string to
retrieve the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- New

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 1d1424a136f0..6f42e42e13e4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -859,6 +859,7 @@ clk: clock-controller@30380000 {
 				clock-names = "ckil", "osc_25m", "osc_27m",
 				              "clk_ext1", "clk_ext2",
 				              "clk_ext3", "clk_ext4";
+				fsl,anatop = <&anatop>;
 				assigned-clocks = <&clk IMX8MQ_CLK_A53_SRC>,
 						  <&clk IMX8MQ_CLK_A53_CORE>,
 						  <&clk IMX8MQ_CLK_NOC>,
-- 
2.43.0


