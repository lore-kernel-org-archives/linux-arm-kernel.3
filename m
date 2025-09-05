Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E6ACA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOEcXeUcizfvnu5+T09Xo7eSsAfydjLjWPzQfaUOV+s=; b=OIVoHnKCXbVlQOJsMC7eDhPArp
	MA7TF+dEY5slJnWBRN5Lv6yeD3w1a5LcVKxDIgtdDzOoPkFD0c+9ksLUHTHYndDPJZyPsBCGh8YFO
	/E6il6g1MUxLJIwnYWnM0HJQe6/NbaHRo/d1uHl+K4u+iEzlcPjTxDTy3nVhcZ1885XS7uidmH7Tj
	jL8h0KIS/673oUKhrWO7ikejj5L/WifG2+r7Z0z6dOPQY7wIqexugddLeXlkatEoX0Hg89HhDotVE
	F3rm4p6/mOBx2boqMQI/Ptg9GLagKU7AVgeGBDnFzZmC6oD4/+ZzDP4J5fjd3Dd+1aCIkllcu4ge7
	VeTK6sxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYVd-00000002oKQ-3euM;
	Fri, 05 Sep 2025 15:37:53 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuV6b-00000001XCt-0sMj;
	Fri, 05 Sep 2025 11:59:50 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-32b8919e7c7so2439015a91.2;
        Fri, 05 Sep 2025 04:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757073588; x=1757678388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOEcXeUcizfvnu5+T09Xo7eSsAfydjLjWPzQfaUOV+s=;
        b=lU5/PTSCK0JFqJq04bprBezppxUEEYqWGVWcCnAMW7hc5xcAr1GXE7fNoWkpN7wLeG
         cloGrOy4tCVrp7/+ToFKQ0lhaXy0qKBETxvbcjNiYCNFr9/1kUZHxHClBXuwpCBytTso
         fVudfe81SYrvo7Qquuzxoc+4AmWv7XgBxPG0He61y8fOUk4MtYMws5NDp/JuLNYPTiaC
         f/eJ4dymK9mAleXt6GZbtK8Kb5sNmG0aKfV6PtnLh9IzbXuPAWxEmgRq4irye3IEmJ15
         e4CNvxZeBd2DU7rqp2YAgjSwCo4LZD5gQ/xfl8r0zt2SX7rBygQ/lgpH79kqQAlWpfLZ
         TkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073588; x=1757678388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOEcXeUcizfvnu5+T09Xo7eSsAfydjLjWPzQfaUOV+s=;
        b=n76ns7UXWy4PuPD2f2ca/TYU4g4aX7iA4LA4PvMsznEtc9HE/U9nr6ifLaTFgMc0SX
         gUgljY/tPsyoAOpls9q1Jp+ZAM+XQy8Z8XOpJ9UNXiSpKVpPb+OhpdYFf8pyzR0mtuKD
         yRWFiEF+3E2KuKOK2AYtLMBs/jgjl02cb/JCmCrHs+cS2gsOAus2ddSjumRZxwrll4rq
         WIqB9l2jFzz/MMli4PC4EABOBCLf1ZzkmKcBIbM2ChTt0lcz2QmK2LnEEKS9WfbM686y
         r4hwY4xuBHhd5OhRoO390sjcLZCCcKKzrmdT+/7zZoahO3h0smC6QHoLBgyLmaOxt8zK
         zlew==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/3j1z7oAeMtggpXEsX5vC8ESdu9742IJ7FT7k9HRsSUVCylI7322210cdZ/pK/o3gvTgIam1/Yz8xyi2@lists.infradead.org, AJvYcCWv9TJTTDW08cwNkRFNbv4DjQA8zuR3AwlodFYdCI0xUxmnqjBO//xosvOufaBow20jgiNmldbiCnc3cuHNqjhyuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YznJC6hbzXOiiTBtklfADo88rsB8O4Zsgq9kK5x2uhC+t2FmSFU
	6r8eFubtrxXga8TtJ+VyNeHwD82fBlILLHPZ27DykqEnEQUcPX2kTqtB
X-Gm-Gg: ASbGncunlkyEr2muEdXzh1my20bkwEg9LdXszz/5KjcJdDSudBoWr9/0b1RZupwCbKx
	nGYdi/ixXlQ2zc6Rt6bnIoLX/6RSMzZg+bD6mvTgk0KI9Wdom6zBmvMaGiOdkFX5o/iRvEF2dBn
	/J/CwcbPwoviz8g5cZDai+/4e0C3Pbc4ty57mWeBxGPgd8NjNAWdzGg2+JzxlT9+9s139kTX1Mg
	vqInmh43J78IkBC3axBTqT7bhP3YYdUJ4tI5WRLjo5ECKsoSvm5auAi/p84Xt19wHWUS3O5nQqI
	g0K4nHUS1yHTUdGXCpgLflzbY/YffgKk1aqyoYUE0Ejw1JNZHn9eAnnKwIBg+Gio+ccW0dnO8Nt
	PVpMYjmfKJzWgmLLS6OnaoT8a9NfBC+P6+b/A+9fhEQ==
X-Google-Smtp-Source: AGHT+IGSnGXMPfX2ToymDA+CKxfOFGpRs2YxaEW93/3sIQasItb8q0Va6j5MszBF7XBKNfyU+srCKg==
X-Received: by 2002:a17:90b:3c12:b0:321:2b89:957c with SMTP id 98e67ed59e1d1-328156e29eamr29316101a91.27.1757073588211;
        Fri, 05 Sep 2025 04:59:48 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772396d2b97sm19633049b3a.67.2025.09.05.04.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 04:59:47 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 08/11] arm64: dts: amlogic: Add cache information to the Amlogic C3 SoC
Date: Fri,  5 Sep 2025 17:27:39 +0530
Message-ID: <20250905115836.7549-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905115836.7549-1-linux.amoon@gmail.com>
References: <20250905115836.7549-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_045949_245907_04B2B41D 
X-CRM114-Status: GOOD (  10.38  )
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

As per C3 datasheet add missing cache information to the Amlogic C3 SoC.

- Each Cortex-A53 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L2 cache.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index cb9ea3ca6ee0f..ee0b1ffa947e3 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -23,6 +23,13 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu1: cpu@1 {
@@ -30,6 +37,22 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x7d000>; /* L2. 512 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 
-- 
2.50.1


