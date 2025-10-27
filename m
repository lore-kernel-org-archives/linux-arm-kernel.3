Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F54CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6jnR1l/knmmCE7j64ceFOiYUTsDgn50GkewewG1O2A=; b=PsPLl5F5CJUbyxxYXOrdAfF6rq
	kryKyfZKNoPkGxqQmF32hTYWtQYLYdZHNgQ842u2MOjyVbkSCS2toSjPoSyLOUp36YS4zJCEojk8b
	I01G+fp4Jt7XfkjWUdb/GkIuKi0YiAulOSSZMCxZLumJ4n0RbuPz9z1chw5bf4YUDHj52VV14T78v
	mFEhYHVb3GUGmtlkvjhFmTdaC46dP4OAZmwYzumcGJJapkV+rcaYRHkTjxZiB3PlrRbfGq/iDWmsD
	whO5AQ/A0sU2W5N7gjcjIFu//+3qTMYMs11qY4ZPe1KWUCr45W+okYYF7uYToNrwN8FKHXwrpE8eA
	I+WtF88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJaa-0000000DXvn-37WQ;
	Mon, 27 Oct 2025 09:32:32 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJaW-0000000DXt1-2fzZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:32:29 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-63d6ee383bdso9572144a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761557547; x=1762162347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6jnR1l/knmmCE7j64ceFOiYUTsDgn50GkewewG1O2A=;
        b=IK8FMO7K8FWpo5fRCbY/qS93DD27F9R70JVBHgmmhBNM7YC6mOSUiPdLZH7TQDRsqh
         RYRmDGbhQcF8/1shTqvQgFhjKSQ7H599e2jqto8cGvQVgXJrptN+bwPDRrjv5Q7HRbr0
         7pOrHQJm3r1xtR5z1ITY89Sdl9xBhP9vozzcF5nsygx13qf37k8PTHFHsP2761dq7HQl
         tu9NHCNPdbl9VuKQ2Q82EsoxOAxgesyyd70m2saAk2hyPcBMyqyUM9UJwtuN33PIxpyb
         f7LRf7ezrgpyLgtl6VBho0kceKAWqBBfoVh2bvq5FRtEo2VXwjILNVLwfdsveE1p5sNp
         vV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557547; x=1762162347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6jnR1l/knmmCE7j64ceFOiYUTsDgn50GkewewG1O2A=;
        b=cbPsfmxHxIckJgEpygl7C4zWihcDipl2Si9Q1Zr2TvLMQi5h0SmwthzZE+73Qzy0FB
         QO56x9tutDVZ4841BtzyLKylZxds32uO0fUnqw2JCWIxXm6JWY4fOluvho71vsdIHrii
         N0Ede+6OIZDNQY5sJcIUWwDW0XDrgtEZrcsTQ2egIXXtWvH5s8nXj+zj39IwUMihFHgB
         9HDUI1OIJ4Eo91Qw8mu+BZqdyE8tkJyHuA8CuWAZ0oUaJzYxzujOCI75Gttv4rgy0vfL
         2w5viSe47fG6UZNueY7poRLCmKEM/dvouDIcKWOf+V/fKWNtcP0UOIh+5yRaC9UmclKE
         FXhw==
X-Forwarded-Encrypted: i=1; AJvYcCXmAxOtbBhSBVA8Dc7Our2bUjZEX4bVi2Kai/AoZS5liRSJ2UpvGLfTCpsBQg8oM+jt/Pr58YwO6g5Z+o150Yu6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9yDEeRoKgJ7zEcpYDCRZa0fjrk6M5lZg0PbgyRNx9ISEXyzPi
	rDaJ87zPR4QAJX0XTAx0bJlvLV8D01kn3Fiwr+nKPmSn2Ztr18zsYfv+
X-Gm-Gg: ASbGncuzAt0Yg8G2zDZdErjyMR6bdxkw6GLjBjn/27XToXFjkUfK93CtbBGc9FO0kA5
	eC//oA1Ic5zie6aFHQozQzjiU2ix4jDJFJHEflvfsVXb2zNi6s+FGdaEmGtg9ENGabh370ljPn2
	0YLjx+sI4sCLOaB0NJk9dZt62z99yNAqIp0n9m3HdhcmsgUKh//IPTjk34uW4RdextQF8qiRw9K
	5sgGEysQLXsQkHUsSthQd9a/PVUvNdnEaQ11w+pMwA5ATDlMizMHQgDLHgcNklBIV5Dqtr1+P20
	5p8SUxq7mQHRRoQak0aslHtsd6QWrYE8J3SpO0mGve2t02btXSGr0DkiOhF0rtd64W073JKOL96
	3iLWF2A1EIvXknBblON2W0WzTwPFSBu502uacN8FfV4er646UFgqWmuDft98VBP2ARL1AsTGWB/
	Xk+4PaFdRI+hVAwa5uksoLOPoHZ87z53KuJDF8LN+xs8plgNew0zj88IqrypAuvK7pc4z5pSmPR
	V3rNVkfiYHG9WI1
X-Google-Smtp-Source: AGHT+IGo4pfv6hPnOdMTXONgc4qw1GUfLg7rVGlLeAbdxBQfM+FdGB1kbkQsXhoL+4Azs4JdFAml5Q==
X-Received: by 2002:a05:6402:1443:b0:63c:84e:614f with SMTP id 4fb4d7f45d1cf-63c1f6b0b87mr34969695a12.18.1761557546755;
        Mon, 27 Oct 2025 02:32:26 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6be28sm5681014a12.2.2025.10.27.02.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:32:26 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] arm64: dts: imx8-apalis: specify adc reference voltage regulator
Date: Mon, 27 Oct 2025 10:30:09 +0100
Message-ID: <20251027093133.2344267-4-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251027093133.2344267-1-max.oss.09@gmail.com>
References: <20251027093133.2344267-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_023228_713051_1854B628 
X-CRM114-Status: GOOD (  10.84  )
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

From: Max Krummenacher <max.krummenacher@toradex.com>

This sets in_voltage_scale to calculate the measured voltage from the
raw digital value of the ADC.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 686fce7443bb..abf6d543380c 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -284,11 +284,13 @@ &asrc0 {
 &adc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_adc0>;
+	vref-supply = <&reg_vref_1v8>;
 };
 
 &adc1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_adc1>;
+	vref-supply = <&reg_vref_1v8>;
 };
 
 &cpu_alert0 {
-- 
2.42.0


