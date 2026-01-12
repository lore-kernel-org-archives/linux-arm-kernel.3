Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F49CF45BF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQ6/E1tgqYIjow3S6Hfpj3KTp0Kx78pCSAMldDRrYrY=; b=1wYWScdAT0sKhOJMmsrAVJdH7J
	W1FktS2J6H6XpdBCVKyDz3li9SADH88pBq4aih9Fqka9moRs4VxOdMxeAuxA6CypPYSBSzo1KeuGj
	h30vAA8olcIGjuUJwFyA4SrW6TcjnKQLRLhu3OODxEwWt/BTVNdn0bZWz5YzJpFYnBCiCpaoviOBv
	EjrAe4Y671HYyFX9xVqeztr8QRO4rUl68SfR61jpOQ6UA8MSDQiMj5DuJSnOWasy+8ggvCXzDU/I3
	0JCmo1kkgECfHPv59mcb8z8DNEN36sA3W8hHRNrD9AV4tysrg1zJlAY54aJ+GbZemyLPFwRy+k70j
	eIEfodZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfM7c-00000005tFB-0sdO;
	Mon, 12 Jan 2026 17:54:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfM7V-00000005tB1-2c3V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:54:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso61382255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 09:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768240463; x=1768845263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQ6/E1tgqYIjow3S6Hfpj3KTp0Kx78pCSAMldDRrYrY=;
        b=BVj9JfCA+1oyXK76F9dp/fyJCIR0CRhcVAPm9CqL5wqAT4ylw99klYIkYNh6tQSVG7
         wD/mezTeyf7jaRff7J13jQg0Ord6JMcQEsRi8LqbxizcN/t+WQ8cmnWn6jkoCMkKTyN4
         NLs/XHAy5975HpDsxzeeeg/oxEjohIgI8QVXzdpAwniMh0T01xcJhObZwZtlqr+sf2tv
         b85eFdcRqTO9ECLGAikUIriXtp4qspeqgHLsymJ4Ewp62mJmSDAKMb1Alj7hVmOY2/HG
         vahgWRg7RlENES3RAhi/Sk7hJx/V8mkly8stk20KIytDbjVY66junGyhvgDtjxzOPGic
         scnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768240463; x=1768845263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iQ6/E1tgqYIjow3S6Hfpj3KTp0Kx78pCSAMldDRrYrY=;
        b=QB0rE2Ok4nEdnSQ3qCZNI6GTrjbXf2wIIxdL/WDGm7K2WhtPGJ4uY63RCg67Pr3NRO
         w6fhcprb7Tq1ezDGJ/FwNj9ZygQ0WS++hru+e4T5A1eL3Wo8tOE/nwDeXB/YjXI1Q1YN
         hLeuknQStnM7n4Le9EwiTqA8rPjS/Z2VfcYeZCvJzRUBGPVoaLjOhLfWbLfpvrqvhbrt
         yX9YlzDXeIJTUEgz0UCCFEz335HvBN4eVLKRDIKa0b5Pb5UCq1I+FEroCdrtAt72Y7RH
         dqCSdG/E0oTIen27kJB8kYGry7YNo84+TZTYXVP4QhOR3cRjxrGlbNS9yvQ0nDg3iFE4
         z/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVVWe5GXdQlBc370pRSekhJfvCM7/C3dhqvia1iuZDZjjoZuwCa/C6QfLcS2TeR4rlF4uUeeHUPp0Ic89Kqmp7x@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Ei6AC32wqb/FXBko+ZkuSY6dYZGOKbb8KH3d8CYemOSgaWTB
	Ex3ExJiHOikg0NtzowW4XYjsdmmof0aSGbsqTKH2CWesc+Hdct2zXi6K
X-Gm-Gg: AY/fxX5MDA3fE6Kp/hv4pNboWL9VFETwlaxOfer8MR9MTWaOyDaDlbA25Use8idliWO
	74z75GK1vIqmHqP625XdZ0S+/3VU3OhJ//UdbIpSvRUwoOvOhAsQif27R7TXLbTI1dW5hH39E8e
	Gb10lQaGAcBe5vt08eaWFjZbFrGwTGd+cV49UXrxepAE7mxvnMTV0gQA6VuVS0PqKCp0pkHdW3B
	nrXxJzpoCBBC3h8GglnDy4AYqPe+3UF51X9BCvn2Y29LWN6dgeq3ZN9XEjQEfg3MumeLBYKUlW8
	09+kTO9BcKYlPalE3fMkE7qUkFlhrLtmvbw93sKrdG6YICmZg8mtoDoikD8YdtJ4r/oKr6CbtmG
	od4v8523RRtLVo5ie4M84NeZIH2TlMRIrBXkE8vv0P76O8uWUfHTz4dnp7G8pvdO4jFGo1MmcIA
	x427HrRnQRO/ehRo71WwdX1aOyKEc=
X-Google-Smtp-Source: AGHT+IHGhWNkDca/+FCzmz49RYaZy2H/+LLzjBgLUetoD+8ejUSWqAtQI6jGW5uDZGAQmISWirqefA==
X-Received: by 2002:a05:600c:1394:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-47d84b3467emr225515145e9.21.1768240462813;
        Mon, 12 Jan 2026 09:54:22 -0800 (PST)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8719d057sm134047305e9.16.2026.01.12.09.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:54:22 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: ti: k3-am69-aquila-clover: change main_spi2 CS0 to GPIO mode
Date: Mon, 12 Jan 2026 17:53:47 +0000
Message-ID: <20260112175350.79270-3-ivitro@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112175350.79270-1-ivitro@gmail.com>
References: <20260112175350.79270-1-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_095425_662035_563019D8 
X-CRM114-Status: GOOD (  10.62  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Change CS0 from hardware chip select to GPIO-based chip select to
align with the base aquila device tree configuration.

Fixes: 9f748a6177e1 ("arm64: dts: ti: am69-aquila: Add Clover")
Cc: stable@vger.kernel.org
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
index 55fd214a82e4..927d0877d7f8 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
@@ -208,7 +208,8 @@ &main_spi2 {
 	pinctrl-0 = <&pinctrl_main_spi2>,
 		    <&pinctrl_main_spi2_cs0>,
 		    <&pinctrl_gpio_05>;
-	cs-gpios = <0>, <&wkup_gpio0 29 GPIO_ACTIVE_LOW>;
+	cs-gpios = <&main_gpio0 39 GPIO_ACTIVE_LOW>,
+		   <&wkup_gpio0 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	tpm@1 {
-- 
2.52.0


