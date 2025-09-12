Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3234FCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zq1J637xCjsK3a1jRXJ0Uurp60mNSuIOaSzaWarRAoI=; b=LYF6LG5HjQ9T6EwhsV8UyIbEty
	/+E73w+2a0nnevnLI6GjB2WkYFBUaGQFMt6qFucAHoiM2/xJppzPLsJrYveStaxBoJ1D1bpThY4TB
	Oni4gjbIMARI/h/UR2vWNz6OmEh3g8oJhX446IymoJO7lObB85T9AgGDsRxN9iCOpLrcuBlNluJ0j
	B9toS98WtzicCrPtqhB0uRaL/Ll6CDR7iyOacJdyIZShsDFTgQTAjxCNXkHwdt/8KNqAeZltsskuj
	P1j0A2xvI0U+9Paq9lAVjDrVJ6G1pxA+aKN/0SL5MtSLu6Oo08orJetfOB+HJQqQYVmTdOz//+99z
	gkl5WJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5JD-0000000A6BS-0Ymy;
	Fri, 12 Sep 2025 15:03:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5JA-0000000A69y-2RiF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:03:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45decc9e83eso19137145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689406; x=1758294206; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zq1J637xCjsK3a1jRXJ0Uurp60mNSuIOaSzaWarRAoI=;
        b=DzxQ5EK+rWZM8tLMv/hJdk1WZZKpbROtl/vpiOJF/dqieBlQ1eTAWFSUiL02ckeQBN
         +LryjGKv6sOKpCGDMmIyIgG7QWmm4dwGiLO3JqkZR9e+GzQn5BOUA4W0lNc+yjxXv6Ba
         X+R5KpZgfy9I8ULj+E+cb+Do+GTZCj0oW+t4wvhIcDXs1iIPfhd/96jZMnTFk+Tic75k
         6U+DuEfCeCeLBcfpclR4G22kqb0ITRtH4+jqbgJXiLvQOO1nshA7xA4DTnjVpoxMh67I
         8tRcX1HG76gsyt93Z7jcpeJ/i1pvbp4X7K+lI2OPBO66+OVvPjcGrFlJcSc1mYPhzfsG
         5L5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689406; x=1758294206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zq1J637xCjsK3a1jRXJ0Uurp60mNSuIOaSzaWarRAoI=;
        b=ZsR3AwKo6p13A5jKfZ2Kv0FxAtOKJDVOwfBSOaQ9LZGrKWYKIo0qf0BKcs7aPIboWu
         JC0rKFVjZtXZC9JB25L+FIA8eeO0bzKrFPcYW1Trz94+fabAmDIxnL0PTn0w1NZnQOu/
         kQOSFE/x/sWb+xLjWOh3T+otDJ2kQ+q9isNJKUke+ggh/k26B3EX98PpdlUplfDPtkpV
         6Pj7kJuQYf9P4gyodNp4g7ZbGVxXp27bsHMdxi09+ejpdYM92VFJkug+ZU6mKU8ZA13j
         dCc9I1KYuAESalIZONAveG/9bTMvgB7SkaLX+aL/gvgUyRirPGBFLnLCvhWhOCKXn7O9
         o8XA==
X-Forwarded-Encrypted: i=1; AJvYcCU7buPx3S76LPHrmPxuvpLD8sqwewoJmDDi/y0z9Cjwr2pQFexV/MKRcZaAKRbE5k4BQk+QZqTRpM8EcQIM9H7E@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9M1A8gI+LeJ0QL1/IM17SHXoXh97yWySXS1vQgk2CJ6CgklWX
	V2nqV23c2/iQByKDG82jv5q9GGU6T3ieT07/uSVxTmf3hE1lc9C2l5kBRYus5aGdG+k=
X-Gm-Gg: ASbGncu/ANmiOxWVYqRzxNuEju5F44jbV2nbCC82JZJ4jgi67Tw2PGEAvododBRW/GW
	efIXkmLkMiu5AL4ePRTJZ+ifjnrI/SXn2kWC39umJ/HDAR2GUsaC6jo1DIf1/GZNO91lcjCmYQ6
	zX1jylRywUsbk7nUh+8hbL9K9pIpjBb12vOInFyr/KLK8PCylkWsK7L+8FuCOrgMf2j7IJyA3W+
	qDgB9TAG7i9KHdPHVjSbLkkUu8it8wiRnWqCRxIXkSsAcMQI7zHs4k8gzszBtAPQ45oLvaMeqUv
	N/cOSKpEOJdaylU6/q6v7i5j4NjYcoAzadSauPwSQtx1HCoiXIE4j4M6I7ISBGwGI16GBKLnjuv
	EVtYek63DMr56/Pqpmjbdf2OQiws=
X-Google-Smtp-Source: AGHT+IGJXVmJrfU4VspkXVUL2QLcSNv5Pv+0FQFjRdVM0w+zljPzezrhfzIQOaENjXatzp2p/nhztQ==
X-Received: by 2002:a05:600c:3ba9:b0:45d:d9d1:80a3 with SMTP id 5b1f17b1804b1-45f21225cd7mr33416595e9.37.1757689406190;
        Fri, 12 Sep 2025 08:03:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e015784c3sm72663525e9.10.2025.09.12.08.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:03:25 -0700 (PDT)
Date: Fri, 12 Sep 2025 18:03:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] arm64: dts: s32g: Add device tree information for the
 OCOTP driver
Message-ID: <6ea7fede9642dad10a6270a07e052f7a726f9bd6.1757689031.git.dan.carpenter@linaro.org>
References: <cover.1757689031.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1757689031.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_080328_645362_7D4978D2 
X-CRM114-Status: GOOD (  13.45  )
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

Add the device tree information for the S32G On Chip One-Time
Programmable Controller (OCOTP) chip.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
The other patches in this patch set were applied but this one needed to
be rebased.

v4: rebase on imx/dt64
v3: Add the device tree entry in the correct location based on
    the 0x400a4000 address.
v2: change "ocotp: ocotp@400a4000 {" to "ocotp: nvmem@400a4000 {"

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 7 +++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 3ff3b2ff09be..d167624d1f0c 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -325,6 +325,13 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		ocotp: nvmem@400a4000 {
+			compatible = "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		swt0: watchdog@40100000 {
 			compatible = "nxp,s32g2-swt";
 			reg = <0x40100000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 6292ae99883a..be3a582ebc1b 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -383,6 +383,13 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		ocotp: nvmem@400a4000 {
+			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		swt0: watchdog@40100000 {
 			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
 			reg = <0x40100000 0x1000>;
-- 
2.51.0


