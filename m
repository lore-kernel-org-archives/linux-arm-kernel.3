Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49576D65C7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NS7rXNvu/k+fb0x7YdnIE3Agpb80vBTRZvlvmIIsndw=; b=3sO41K8/wrRfiMOpCPfS1IgSSf
	cJrG4O42wkuNWpdZf+nzh5EZEe1Vlbqlp9OMK31gox9edGI/o9G9+sOQwaY1litK0UgoODwUkD+if
	PYBoRkp9eipCvI1BCbxMeTiMAomtUVISHnuuy2IlLkXUtSr3SPIp4iaJGTJdj6z0ITOnYuJHj0qUU
	krfRvlWacDsB/LGDQ3fBiXXZWvFG7vfNKDsQVZ5Xf3iYBxdwjxCdtBBBRvC/hqR+fPVQKl5/obB/E
	Q0bfXva+Ngeq4dCFyLOAPIMz5WRzSVgY18rdAptZj4IZ9ry6/TmTn0KoVSvANUBLPd3E8l4/B51Zb
	BdtECy/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLY-000000075mU-0Pkw;
	Wed, 17 Dec 2025 16:25:54 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLM-000000075aY-2cDT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:25:45 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-29f0f875bc5so78960385ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988740; x=1766593540; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NS7rXNvu/k+fb0x7YdnIE3Agpb80vBTRZvlvmIIsndw=;
        b=EaTjRq1hXSfFUhfNpHHy229LNfqWBUiG81x1l2dt0qAFp8Js6kImczZE3CTZl2XoCB
         MZkPOQj9YAzi0LBlcBOQ98mz/N7khhAF3TiaLWGY37EeN5q0foH2zRjHYxQ/TFHm9Gts
         iww4RssNSa2g0G3VQRjCKNp/3voQ2C+/bPB9p7o51dhl+jAVtVsk2Ab7OOHKn/4epelR
         75tJGYj/QDRh73FTTebVgWg4OHZjWewu605NvpSCiDM59JuLqPTh00jpg+s6D+zA3/Ge
         kTVmTFDEr+4p+fWu2yAVqpibrCK10Fjhg8LHIXwnFbaWe9P31vqI/UGIilRSPdn/Pi1p
         MluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988740; x=1766593540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NS7rXNvu/k+fb0x7YdnIE3Agpb80vBTRZvlvmIIsndw=;
        b=ZfmaKnPWn+0QrmeQRpp6ATBPXPOP0IKODCySZ1b9PAYM+sdfeFp7abC3+vTp4OTkCs
         xiC9YBws0pgSMvkpdfti7M/vcnaOqFOh+pWOnYM8VeZZDDdIojfnNFnT2bZJIzNHKZJ6
         rQ07Tws42oooXzDxSboD5PRYrt0qPczltMxpO1HQfHdx1E/IzJocgFnHxL+OpqPxdeUZ
         poZVvOPYd9hOs1hJDzWU/w+4sZUfrv1JdMWLAZq/QTNQIKY6qa9d/FMEkFAJ2cVWITW7
         X4NGEZ2/KYe/rxpQg+g0myZzA0cJcfq91l0x+P/0wASFhQN5nbM09WhOVIhBFYgSiumQ
         9BmA==
X-Forwarded-Encrypted: i=1; AJvYcCVDE4M1cnm5TtYjS52RKR5JbSvDn6UXhTy55MaDsYL18Gd1d10DSHNsBF2x1bxrrVH20CkZW/C7XMyycPiMX325@lists.infradead.org
X-Gm-Message-State: AOJu0Yym+PxM8bTTCOSikRM+SsK73po+rvHKZFWnT/D44uJmTve81M0A
	8tdICjScMxuXRY/bkZBG/GbHXnFYYcUkC+woOXRJy71q3qVLB5Q60uuH
X-Gm-Gg: AY/fxX5j/qURa9AEqQDv0Tr3Nj4jPqICrLaPUr+AGTok0QER8Eh5FWMnaprWFYwVKv8
	dkwrKPAgl/OKodqVsqNfvN1BRxzNx2+y9fDjl7zOhQDn8r6k7O1ha6CG1YOCO8zbfaAZ156uDXi
	ZW93DF2TtLYHNBwbObicE+ETOg2jXQ3STiCozdGIy0ZqXnAQZbXTAkVAVXrhRxkZ9C8NwR5o5Ub
	c6ioalba7jrpvXB7Zp6SQHrGPayhguNiorYMWEgyN9sdzIAodErZd2RkQLzDo9VUlCHh1nrRkgq
	l5oVAbQpiHO8MFknnMLPr2sOs7NkvV6Fz7Lct4a4i8cubFZBPtxG3ugMk6FQVzj0mRyO7afsxlq
	5ZwtYaZJp3qqfqalgfwFWqZPAQmSa/Ppg+ApgSEOiKy2PH/n6d7LDafFNgmVkvsijQ8QxR/rFeP
	BizlMfZWsRQ2Zi
X-Google-Smtp-Source: AGHT+IGQGMr0AmGgbN4xg0sghCxcRIAwjDwaNdSGUd1h1vpKA5x1f2e8ppoipUpn3JG6UhCjVxeliw==
X-Received: by 2002:a17:903:244f:b0:29d:9755:9bd8 with SMTP id d9443c01a7336-29f23e6fa91mr197349105ad.22.1765988739788;
        Wed, 17 Dec 2025 08:25:39 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:39 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:32 +0800
Subject: [PATCH v9 19/21] arm64: dts: apple: t8011: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-19-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=OX5KL+MG6sfpo1KjHjEhXoAalFtdpPr6gBFVJvOaFLI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlCu5cj/TLrZWC6mrH7YYJbkqAiAC7pEfyDd
 Hj0f2vlWA6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQgAKCRABygi3psUI
 JM2jD/49XIhE+QSFJovMK9EioD8JZ2370zRmv2bettLyrYyNn0ozJMj8eqHpFbPUdAOJzworI53
 0pQpcWVYu1W21pzI01Ux5JtTxTozyJicMOWFMyQQNnKGK6bCr4id9v8mlTDLjOJgBXuVbxW28Qq
 eucnSDjLgwQqC6aMe3lftGDTSYaA0cz9o1BeAA1/vhrJjqUMYWxf19ZeQRqLOjn5lXaZT08K27p
 t1JB9P3kXgPlz5x0RX6Pkc3aVeS5XW42v9j4CEl+j70kYzdPLRBHarrvMSXua7Pi9sBkjzHtjhz
 3aCG0hVdDnKh+g9dhIZBiMptatnjb/1RQPFabtZgG34GtKUhbJQD2XiuoZx7IEwAokW6/KOhu7/
 ewMCbVe+Nk+mzlerzFzB3hktV7zUZfFaQXkFgtqAVpMgC4MQMyOATSP3K+/NyMIZ+prHnwJZyA6
 3VGKjR91dL3QVEjh4vDPbt2QUz1skKsPyR5NqhWCUf+USPuTNoIuDXzF31INwSNpEaX9ee4eXON
 hyK60T8cN+1zlC2BrwYKZYlGjiwQcut0Z5T0Le1NFCnxqGbTOTxWvl+QbtppK00jOHhIIl5D6Ts
 1pfTwx1wjiBZYCxLiEtmy9byA/NiDYMToyRt6eHVxMGwI2rfrw+Ki9SmrQxqYzQ7EDqYo+fc9y0
 s5uk4hc5IzzYy+w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082540_706797_98CA883C 
X-CRM114-Status: UNSURE (   8.73  )
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

Add CPU PMU nodse for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 039aa4d1e887625e7b6ad789bfd9aa032dc58d01..7f7b0230cd648eba2533f860622f683771197bff 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -329,6 +329,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t8011-pmgr.dtsi"

-- 
2.52.0


