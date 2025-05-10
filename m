Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD170C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=; b=NLoh9T+Ehz+nzHYEOQC3hX9+5B
	s0yaSfnz2NKVzcPK33d0fBg8WZaEmB6QH7A7oS14sT4E+18UjFQ46NeZA17VUyFbbMpgtTSXjuf8p
	8ppUOHI7kArePOIORtA69qeGCEEotBjI9TF/nKgzjwA2g9Sm7/LVM8wpXpDYsQQYSH+kCfXkmh4Kf
	IHgLC+FTNp4KNgG8/cbDLt0zAV1ZmoC3ZuAdzHOiMemNcugX3C8N+BePpK8AcvM6BaD9n/cKgziCF
	Df/S4fKbmRAGYt56utwF3CX5NP/Sdr58TIDNLUuwN/nN5boZhlEXwwUvJXXkud2/VWJr8p6xEU1u7
	xDgb5udQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmWQ-000000067pZ-2SIx;
	Sat, 10 May 2025 15:53:54 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlsO-000000064Hx-3h2K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:12:33 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2970310b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889952; x=1747494752; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=B8rcRf0YX1zhLPyOEfmZcmyjyumqVWpS9c5WL3qluYFU+/Hf6to8kBST6UKngfNG/n
         ERzbVtXcGboWOtHTeHgxBEgL9Gqzo7t+ZwwmnpKWWScNHmYMeDiHj3kZui2uxDF66c2G
         3Oeumdo0iWi2HBO3wx8iXntPTAwgPJweC4xYbigdbuDyjLaflqEqDmpRvp2CiHlje1TJ
         zSovUWkhcw+81xITu3Cn3pv4zOO8bsS4ZPuvOpNhBbelSdMyUQzu2Zh38YcTyDAXLrZU
         b33h75Fhd33BITUbMioQQc25X3CyoFC/HwG7AAX0n5tlOyjP+2Y9Z7JSS0vZB6UIfVQt
         15RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889952; x=1747494752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=KYfZhEC5zHGPIazjfezi7fed1FoIu2jDqiJUZ/AKwqOimZ00rFXmpjTuY6g/CZCj8l
         cvvviTAYdQcomnnqnSKIHyfZPby8qH7NIcY3PtlCBX/NtgNmSM5b0Gs9z16Z4Tm3yrnK
         KRaQ/UTwbsaeO45FeuC1tb/PcnSdpOCTmFdcNkRpyIWbw3oxlhHLVSAt/Cvwcnezsw0S
         sjTm+KlG02QFN7L8+gAQCxyEYOnbq2ftFslen2nu07MDNx9k1fvoSQOgouLU8Ilsd5xm
         f9SyJo2AmZOrsCjYJGEDzg8uVjlw1Dw/PFqyaLOaodN5c4cfsGFcaqUq7digfHmEfn5Z
         BN1g==
X-Forwarded-Encrypted: i=1; AJvYcCXcqCslncfTIHxvuT0DcM2evBYpHt3nG2/uQzd9RZ7t4oWr3Uq1oG6ILzp++vJVY/uGy9t65jVQUmYrhQn2LcsE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7FEQ/9XJpeZDTKKZuXyjHQcwMIenQ3ClXAZXT/aouOLiCMPVe
	QERzqprg4Pn2CDG/Atg3YLGl/vGvxQJ1ZXllU8QUsx2dDt0E1uki
X-Gm-Gg: ASbGncvXt7dmSPACU5Vbx+oSD2bNuPvwTeXBSnS7oUilRl8xX5FUozM7iz1daLFq0Mu
	6155XhfqNKXCUA2B1JOQOlvYpg/zqWjI9dr1gdG1tUOiuq3KeBF65M4pw7+EKgZTEsRvNK7MFus
	Ius/bz8oJQafAgFgYXxKIlMaQpBesZWAxqH56XDxMpBcmnZb+CxzyqTBqJAXiRkn+cVCBy8Xv2z
	ipDx8O7Ho3Z9ud/WYKt/0fR3VDKoaGSh2Fb5X39Y7DjJvUOQIQ8Nsf9SUWHOQrFlNXb9cGsBNAa
	gFzM7NkwUKZgm4YCaxnELNE3wFEtQxHK5HfTQ0ij5acWKARtPSoVTw==
X-Google-Smtp-Source: AGHT+IEMFhh+q+cJHPupM8+Z7cVVNi9EWGiLspkGttGc0HUI16zP77d/SoHDXw1/U1p5cJlCY2G+4A==
X-Received: by 2002:a05:6a20:9f43:b0:1ee:d8c8:4b82 with SMTP id adf61e73a8af0-215abd22329mr10897841637.31.1746889952306;
        Sat, 10 May 2025 08:12:32 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:31 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:11:00 +0800
Subject: [PATCH v7 19/21] arm64: dts: apple: t8011: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-19-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZNIQgw4HnW0u/JgkpB+HMZ3DOfGGfZVMtPocokF3spo=;
 b=kA0DAAoBAcoIt6bFCCQByyZiAGgfbJyjeBZn2zZv9hz7wHCcGAs9PvoObq3TMDO8MNjzkgG2+
 IkCMwQAAQoAHRYhBEtSeHhcl6z3nDxogwHKCLemxQgkBQJoH2ycAAoJEAHKCLemxQgkszAQAJF3
 v5zffv7gXhNtsc6WJ8tUdwVX3TGkTdLQDgyh8tX3ZN7c1t2OBUMFu0Q8CsuaQA8KbRRGWk3rH/+
 pEU7U4qPvi3Mpe51F6c4RUqrFK74mknjMGH0PA9pHXi845AzNa557Q+E9mrIR5Bxe0At32R/o5H
 cEXGq6n8yUS3VV+S24Aqovu488Qe+M9IrjbyqG2B4X5dOvwbUpfHE39mQdv8NSnKmL8AF58N/gf
 vChkPFsFsmAL70gYkcmdrNFPiUhmXyVVyQtcx1aA/FaPo1FwNDG4mX1LAc+okj0adNG/gHH8ITH
 RRGZPIkl9nqHq4Bvda7bT0omcDiaZlOvjWb14bKbQEcHrc4CfMuqHs6FaEhRRcPbGBrLN0P9HVi
 uScyYRlK/emBxSg5UhQLxSqqoW5CH3eC/SLDLvdutTLBWaseyUczdqbm3KwCCG3o6+EbvbxzMbj
 /OSpSYrGNW/0w/GFWSUeZYSw7rEXQ/mgFVKDUvyYr/v1IZVjI5nWkNpEbqu8Bd1ZvThNatdmQgK
 TqYBy5ywI0/hk76w3cMUmxJ6Ow4DqrCqdYr8z32uapfeZ/o2eXidBPP0OGWLk9nb8NUaDsNUypu
 HoPKdfQoPYa6Lv9J6rkdo7wzUtDu0/ylWoxTZdpk58zxmgWn31G6kxNmqNjN7T/zMgL9MTXHD/H
 ohKGe
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081232_922793_3CE090F9 
X-CRM114-Status: UNSURE (   9.42  )
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
index 5b280c896b760dc8b759bf38dae79060e34dfc19..7fb3ab738f67583d9a19a542bf36ab2806268d55 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -237,6 +237,15 @@ timer {
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
2.49.0


