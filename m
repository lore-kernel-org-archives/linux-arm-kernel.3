Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A86107760E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 19:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhe6Bw5swAXowEnRvu3RMufWPhEQIrULXXpRHTNF+tE=; b=eHGBfloivn+QEV1yJBtD6k2Dqj
	Wk4cBpHZEGdr4wA3E3lW9Vs4Il5JqLXdOwbOBy88VZodHqZ6qj3LCw2O06v15UYLbOHPV5DTFfKxF
	8n+Vz3UopesHW8o0ZnOCpu4CXO55tWQEepR/D4IoYPeMVYK+yKX5HyyrxIKfV6zU9Ns7OLcXgsIns
	0nuKYypVv3h7V2WnQ0KWDTGPrVDBe29gjxAKWP1MBzTVp8jhtIF+gBxFCEyjruWlQI5w1WAciKzNb
	+lkDZmYMpU7HE73ervLKKfJq2hemH3hDPLAFaH0nM7AbovnRsw+fCvqQT0yYUWME5P6DFYIWfhWWo
	YzpV+mvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2whP-00000009FAx-1Gvz;
	Wed, 18 Mar 2026 19:36:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2whN-00000009FA6-2VRx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 19:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qhe6Bw5swAXowEnRvu3RMufWPhEQIrULXXpRHTNF+tE=; b=csMQujppwkghUWhe341YX3xf9C
	3rRMmALp+upk64ykulSyBXsVyoB1m3leXeB/9AlCAVYcxFBYSaN5JXnfWvq3156ZFhZXNu4Mo4ewB
	zITjt6UrrerLzEyVn7A3Rj0WCyvaNkr1cWeBjEwIh+771qCBPjvnTpa0THH+IsBmnTtBjZGdP9/60
	DoSLYiF5CnZcCqEGn1K0dvMWuhEzWUV8iVTyO+9NAEKEx6BsHMq7fNBXu+3jnOFM0F7XFF5HXq7X8
	W0xkRu11MFT3A3zSLbpOBIYvpWuRejKOQ8jP93bVaDy8cjZFYMV6ARhapMM0KIkiXhKXcnJzduFiU
	YeaMPZkg==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2whK-0000000C9A9-2YfF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 19:36:56 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3591cc98871so163613a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 12:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862612; x=1774467412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhe6Bw5swAXowEnRvu3RMufWPhEQIrULXXpRHTNF+tE=;
        b=emSnHYlli96rFOKa1kgbT+i84xiiD0J7UGwvGEihsg+xofGexnOUg90Vlt+eYylwYr
         knoTeHRa3zaozQfPtuMmI1QKKoW9pZtKQBOG4W+KFZESTsIpwTPM2uek1M372oRCDOGn
         C5tG725Ydd3Yld/dd/kvLmWiumTg6g9F7Cjma9kXOWMQ/8UdVJGyw7oN0ssxatqcgB4b
         2mgWtS+KYlufGYnZKzD8Jp4FxDa8gMl3glowpJ+5x9dzqp6yIxBNfiS0nBHT2coI0c0a
         hGgG7w2qGATpMjeOaUZWH31XE4Pb8kvfeUf1E6DqH5+tXuZ92MFmRtsviK9fy7tpObWW
         z+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862612; x=1774467412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qhe6Bw5swAXowEnRvu3RMufWPhEQIrULXXpRHTNF+tE=;
        b=R5kIqZkcowRdTms6bynvSqeVK58JGsvJVZBIqHtPTrHU0ycIhhNBmygZl5eE1Inm0P
         fxhobOS07+ZLNZEX/NiyydLR+1v4f7la0BkL7lzthE+CNQtmzuPep7+7kzGwgFPatV5o
         7m86CU9I/skbO/QRmgO6+PDTOW1D31Tig9zLzXLHWVn1zEO/szBjQpM2ns1N+sv88Ldl
         aHC1LwrPEk07/U/Cc2QC/WambxbGakMRJRXzLNyv2cUberwqQy53voPA+zR+nwb6TamQ
         ZBRMcPu8cnzrlVJX1qlvIN66GBqOJUaVg+AU3qgHdarTmwQV0Rms7FuwNbQhgqKWGyRq
         i5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXt6AzLk6WbmCs/599+2Kyopp9ohlqFqMoD/pjb1qLS6vNQ6uiRvgCKYVMGWRp/bxLNqXoUF1sbKf1UkzvIYbSM@lists.infradead.org
X-Gm-Message-State: AOJu0YxPcDEtWVhNOouzfHyzXZoqJHujs4HzzhiMS/bQpgTWEPa1qUQR
	jbOu7gRGS6YCJsj2I3cfNrsEWHZ3GK+brHbHaRwZC4taGob9eaIc1YPq
X-Gm-Gg: ATEYQzw1w4NRcBEaGiTk06cySN+92V+jtXx4AUux9qBVepDvz196w+y3qy/y9Hnl0SO
	j0WoUKW19leaLJXDVh96kUCIYqfOMuG7VhJZ30u8rf7MxLS5mCbiezeoh6MCkVIPaZ+URY86FTY
	XBJBemR0zLrz5rc2Xn1vi+x5ae7yJYQW5IFfBTWNbKKJcTP5h3qWUb9orzy1Al9pXVFWsLzjkCA
	IL8XG07DEZ1bxxypf3JGSmMgwhtMZ1hYZ2u9ds0UTlk864C9a5RGXXDHH5pmDyWXK2U2X+gCS1C
	2NpZ7hWLlShuchl7QI4qXuEy27Sh4P4BbsPZ7ZxlTMfHsvxJAyvZYHnPzQVgjnqCFD5/35Xc3PU
	r9eQbzCpzayN6Gk0tyYQnrakp8pVDQm/wA/DqG9rQfnDccKGAE8zuQ8KlXQj3XEH0VHfq1pPDt+
	wmgbcQoz/xTrBYk7Cui7mQnctNkpuZcOScrbb50CF36HqEOr9M5e/L4adyeSZZPor/qLywRyK0R
	75UJ1GNCIy2MdzqbknUcgwLAMmE6Vjl562NqS0=
X-Received: by 2002:a17:90b:184e:b0:354:c593:b1a8 with SMTP id 98e67ed59e1d1-35bb9e7d24dmr4153966a91.13.1773862612414;
        Wed, 18 Mar 2026 12:36:52 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (100.130.194.35.bc.googleusercontent.com. [35.194.130.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9ff59a4sm1521664a91.2.2026.03.18.12.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:36:52 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 3/3] ARM: dts: nuvoton: Add OTP nodes for NPCM7xx
Date: Wed, 18 Mar 2026 19:35:38 +0000
Message-ID: <20260318193538.246853-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
In-Reply-To: <20260318193538.246853-1-visitorckw@gmail.com>
References: <20260318193538.246853-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_193654_702964_2A139155 
X-CRM114-Status: GOOD (  10.60  )
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

Add device tree nodes for the OTP memory controllers found on Nuvoton
NPCM7xx SoCs.

The controllers (Key Storage and Fuse Array) are attached to the
APB bus. Since they are internal SoC components with no board-level
dependencies, they are enabled by default.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index ab3c3c5713ae..8a28b1f8a4fd 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -480,6 +480,16 @@ &fanin12_pins &fanin13_pins
 				status = "disabled";
 			};
 
+			otp1: otp@189000 {
+				compatible = "nuvoton,npcm750-key-storage";
+				reg = <0x189000 0x1000>;
+			};
+
+			otp2: otp@18a000 {
+				compatible = "nuvoton,npcm750-fuse-array";
+				reg = <0x18a000 0x1000>;
+			};
+
 			i2c0: i2c@80000 {
 				reg = <0x80000 0x1000>;
 				compatible = "nuvoton,npcm750-i2c";
-- 
2.53.0.851.ga537e3e6e9-goog


