Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E995AC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 15:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqjEa6NJuLKhar1Hnx2KGoMXir3yP3J42qYMb2JDkMI=; b=tYQA+TCRgNWv8WAtJldJHpuW+x
	W1V71oBNk2aHXKwwMr0q2tWXHVTz1Wn11gKK2YuBfwt1v34rpEhO6SknZsgi7AOXgsfWpg0MLY7iF
	6fk+rJJOay3ycyyelsIUD1EfMB/7+GIPWKiuLT9bZrSbSL4X0z9RBk5flfYPaTqCM+Tt262Uwoant
	QT7gToAxyPNdr2JfV6Kb/AMCjKICSlOhU8NuHzMuniQHJ922epvtmhs792OfIYiRoOgwAH8Odev0B
	/k80EcU3TPHf8Ti9/h8lSaEMatTim7sWJR2VoN2p36048y21Nt/DCTc6SVcpn9gGsEbsKVG2KUEcX
	VU8iurSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUvg-00000003viq-28eM;
	Thu, 31 Jul 2025 15:10:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTr7-00000003liU-3zb5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 14:02:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45892deb1dcso4329385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 07:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970520; x=1754575320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqjEa6NJuLKhar1Hnx2KGoMXir3yP3J42qYMb2JDkMI=;
        b=Gi7pD8D5FlBOu95Nd0OHgXnJr5Ph8WjZtR84ruPM2xsBuSqtoSeqNxVmm3TK6ss3ry
         6bcoH3W+utpYUAZ/p+QRWzZmALL3askTBODhrSomUCG/1EGhWISQ8Isj3JbgTzzj74pX
         N9V7ARCk8/bMsxD77EM6jXR+afuQqfF3CvleOgFVWk2GvjplBJvu43ZZoFgduwEtHAj5
         TewWE9pmFx5HCV5r72UuFfr8XWEGNazvjDrsPu9Mg71oU8SYFETJZBPUDAMlRgEAycj/
         k150CJ8D7qpKVVfTeY39CVHiraKi3CarM/5Q5F2Pa+UUvqvD/QMKQY7MWM/abyfi+0qg
         4uHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970520; x=1754575320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqjEa6NJuLKhar1Hnx2KGoMXir3yP3J42qYMb2JDkMI=;
        b=Bafic28kBK7xrmQm8UBwEKww6c5NhglxV0xLfBlgVQ7vzzcoUsXbJaMPPCsYEn3Krq
         VOLUjNT3eoPc20QY1B37E3Zry5oYhrrdvUoEUXpePd8RlKonhjSn0ezTJIcrtkrAT7hq
         9Q4oPzVg4ms8LE/pW8DvzUCoGYJhGWS3BDu/5uk11t2DZLTC+G+UNtsbHdKwLdeBtMAk
         kDTYYXk9pgSciLLWV7hB2qm00s59HlU2NzOiUu5547ybVtdjcpsaSyY/eylblFF1pZWx
         jjAjYVPC2uUe4s1EshBDy151OYdWq3QiuL8WAamGqjQnDQR1/AILyt9uA3u0eYIxFl9u
         RKLg==
X-Forwarded-Encrypted: i=1; AJvYcCVygVqGLILA/XLkRbRsqcsTU+C+PrQTVTcO/XpTj5wRd1O3wuXzDhjyelyBeOIU/Bj2ArM3GEmIZZ1XIYW34/bQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi37IBwzC6XrX7ed8JW8aP6hNakVhaBY0ejA75ltEsArT4p5sJ
	I3hZr8WN6Tv0Jm8+hAUx3weMojAda1tPPSdATVN6O9YKs5fpwQw9TJj5Aibcai3GyLo=
X-Gm-Gg: ASbGnct4RprUj7KXNmfVvM67htSrsVYREFnuKbS9NZADsQBcGU3zd8srH7VQXan2bsC
	U6VbPzYBtA7ZnHeMyxuAuAQXlfCLYPqQkmClSwi/uRv83OiBtGPn8wNOFTYT81IVsO+B2pzKIqE
	qit6Nh4dUoNPvVBUYPJLvPM8NBxdJyRC+eGPwMf2J7m8szB9VH0ERdRkEwbQImipoowW4mjKuBI
	4xy+4CDf+4Nh8OQ0B8xpabi/iwytVW8vSj/LYSKIbIhFkwQ88EaHT6hwSge1optek60H02j5QXX
	scPi3litVf003ljxbLbDZsFoohfT+lagon7CvriFsRFqflJKXZz1W74qZxAPIrftGp9g8rUzJEq
	7Yn7Atul65TBgttAWOETB3NepbDrzDrWPvPLLGuKPmyEBvFFAox8zPbDeEU4=
X-Google-Smtp-Source: AGHT+IEs9xTRBr8bAi6DfE73RMG6wNvvUR3ws14YWGjYBbTlujwfRrxFnpMHFkgHgq+RtECti1PpDQ==
X-Received: by 2002:a05:600c:8114:b0:456:23aa:8c8 with SMTP id 5b1f17b1804b1-45892b9e4bcmr70544375e9.13.1753970518732;
        Thu, 31 Jul 2025 07:01:58 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:01:58 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH v2 2/8] arm64: dts: s32g274-rd2: Enable the STM timers
Date: Thu, 31 Jul 2025 16:01:35 +0200
Message-ID: <20250731140146.62960-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_070201_992061_24D15C4F 
X-CRM114-Status: GOOD (  11.19  )
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

Enable the timers STM0 -> STM3 on the s32g274-rd2

The platform has 4 CPUs, and the Linux STM timer driver is
instantiated per CPU.  Enable 4 STM timers that can be used as
replacements for the ARM architected timers.  The remaining STM timers
are not useful to the Linux kernel and provide no benefit, so they are
left disabled.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
index b5ba51696f43..505776d19151 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
@@ -40,6 +40,22 @@ &uart1 {
 	status = "okay";
 };
 
+&stm0 {
+	status = "okay";
+};
+
+&stm1 {
+	status = "okay";
+};
+
+&stm2 {
+	status = "okay";
+};
+
+&stm3 {
+	status = "okay";
+};
+
 &usdhc0 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc0>;
-- 
2.43.0


