Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C42CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kj7fG7XAER68na8hgLjfPolxfyD9eQkGEiz9N4R6m0U=; b=qHKqWtCI7DJapP9/hCb0TPz2Cp
	+4RuVYHuTTnDevv//UlQ6dA8XQh3V4O/hhrheD1qtiMBdU5lMYeCcu8zGeGRtgT+aYZDQ1y+oO0RK
	Sjlu8/0CmsXRgyHg4thpVDZqLqs9uqx91jiXQX0LgQsFUS6PQCPUSdxEgxv3tHipjsx2o/BsW2Lk5
	htnhv2uUDuvvyPx8EN1UsT4IgK3ybuZpAP45zVCKkfs8+8KpP4LUN/9WQyCMGIJtclwg+wPjnfxW8
	bsBcQWEeB7UnZnTvk2NMUH/1SginCm+yrSNWLj66aE9/yZNQwwKUToeyFEW4r3gOhCGBaNBCfuofI
	YD11RGkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gb5-0000000Gjh5-1AXp;
	Tue, 14 Oct 2025 15:05:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gap-0000000GjUR-0t6T
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Oct 2025 15:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kj7fG7XAER68na8hgLjfPolxfyD9eQkGEiz9N4R6m0U=; b=U9qtXk6KETNfcWaW0UFujd9XjK
	NWA8FjlIOjXsAxOyfbrC6SqPHcBiMS2IlefQtyGNl3O6ll7Pd4cUuxNfsLzjFSdkqzvOkEkEsScpm
	+cu3y5ExpfdpizxNYa4O72+eGomqVUzFIMHnnIV+PImaJ6/QbDXU4Qc5Nd0fMFCMsPtmhUoqd/QYG
	9ptQ/10geuI91h6VAznYobIO2/ZR/HXGDWx/6z1be9ZCRHytCfS59JNtluJqD69bIC6cjLNYAiFqR
	SMW0IdoSTx7N4o/0WxgJSTkmFtmKRGVi4ytaW66CLBP4b8Pf+77ZM2NMy4lEuX+GjloRiCNq5Ioio
	otp8ozqw==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gal-00000005Gax-3Xax
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:05:38 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-269af38418aso63596285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454334; x=1761059134; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kj7fG7XAER68na8hgLjfPolxfyD9eQkGEiz9N4R6m0U=;
        b=RV8gVjgqyQNp3aLndzNMKkQ8Hy0yHcrVcb5067GRBLBGUoRipnbJQP4QrtCrCMODFC
         LT0WApvaX62Fh7ce5Qqu/S9CQCEaEGgQf4PvhGwZED/aqKrf4gf4DGrjVxovCAUXGFII
         R9zjnsGopgZ004J6O0Fu9QEXWEFfHBV2ziS+dzFexRVdRXemzr7UrWigNCfAwMxabS4o
         D3n+1yx53Pkgg58z+itnXRnJk++85+sMfgS+mKtzFxfG/nPPpK/UPV+wZhMy5pW5/+Io
         2e0GdM0Mkb67AgWJFZc80I97zM2TSatGS/vFcUA43cHN74Xap/3WoNamp7Y11IGpAx19
         8zmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454334; x=1761059134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kj7fG7XAER68na8hgLjfPolxfyD9eQkGEiz9N4R6m0U=;
        b=QOBcA8ssuduqYVXC0Ozwh8yMczNCesrhXc74FONpN1XyMj1tVA5+0xC/wb7sM7xZRl
         CZg1N9fRtLyhPC2IIhsV4CF4CdMTnYFSHWDSSzoy3r/nKzS1IzmaJiih6H9kQpA4h8fF
         p/KLcHY3892TsFx4mETIOEgwjraY/Tus7wOCnBt9nCKCwfJzszs9gsYeZjSSBrj66kzI
         D72wkMhbwz6MRhC84mEj4/RYvWZBtbKXzHY6rZUngrSqwuZDUOMAx55oA1niaHSdJG7B
         LMf7RujwT+d9GvEwmz6/8Yo9bnNIx0n2f2yLCBfP6BQTZeKEBI9IvI+bn5QVAA5DwZ5T
         naXw==
X-Forwarded-Encrypted: i=1; AJvYcCVNhVJqxTLGfulZHKp0nCcX4YHjSLSyRhgnf7cY+32wjjXsylhim7yLK5s2kmeUXUtZTKM37yEWG/zYVRBCZndZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ8+GqJgg9uyUQdGfjSai7VCsRVkT4u93heBRvefD03Sz7sge8
	LlYBeczlKgLDEBhRAVM5/WL5gYuhdd8G13FBIla0mLWMsPyQvEyLtZMf
X-Gm-Gg: ASbGncv9EDk/5Lbns06bADLL+OVbYZFkXijrwwJacgoQQZCrqvsx4420dIbk247YUGo
	ZOQe1CTkPawqhknSlDdp3EAAtdvJdV3Lo2ai8dzx0LbMaD7XCaliA6qPDyBq/FgBaayq48k8+PO
	/Uug5OLoKpShE//x6SdNuZ/9g+9IfeWs6mv4Sl0ygAfPHllpSV8yxbvckzfBcFeflv3NBoCww+a
	kTGoh6+ZjY1RcFyHsFWEwD+sWDSt7OOFiag2fnCT0GNCduripe9VX6e07GbW2PwNsJpAwl/KEZE
	ZP3loD2KSxV8evNqZI2XBkdYKNpylE3ksODdGH/wVi/XkpKUrbVuwen6C5EHPwrijE4p1Modkts
	3pSEPspDTDCc1bgPLNc3b2ELjaUBgKoJcURtH8FG223k=
X-Google-Smtp-Source: AGHT+IHbjYg+JErGsDXlogYv4U5n/Ev957SikqxwbnwgsM4THfPZkc2ANoLT1k5m1jk1sr8QGnevjA==
X-Received: by 2002:a17:903:1a8f:b0:252:5220:46b4 with SMTP id d9443c01a7336-290273ef076mr279316715ad.37.1760454333232;
        Tue, 14 Oct 2025 08:05:33 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:32 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:54 +0800
Subject: [PATCH RESEND v8 21/21] arm64: dts: apple: t8015: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-21-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=NgiaadnBWzmQWHLVGXTkghr12q4e2Z2pGwu46CpKaLI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZv5D6VFnHY7xtzs/SFP7ACL+A9EPJr60YCu
 l4xx7HpGz6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbwAKCRABygi3psUI
 JKcQD/40/H4Fdg/0XKvNk/ItYQoUHoX7cpR1j5MG1alkId+ifV/HOPZMjKMjSRzMBWEFpbI8g4V
 O6OUkcbVVog+LpZYlwx371Vrm0G+B0pRV61KchCZ/kvp9AQg8ndMtQr50YU83ZYfOtadimZJPVu
 QoUgY8jK2tUHciPv56GZXM52jMQObX5HxyStxCJzUI2zB1vkbtBQSGXn6T87ivVS2XuB3OMV/bc
 USy7QhDP0YG19Ebb+i7ck1ZWzvZQio+cgRvA/DxGCmYgigKvmoJ+UEM/6W13MC+tfvEQddvjUSQ
 BpsWJLbERjxTj5k7R9HyBfYhjDt0jQW+7dYBpuoZel1Jw66Gf4+Kx2az4LuCHWcOhRngr+y1wf9
 revK8izGXomy+QY3xFi//K9Qh42saySjl1/qTUVHVizoI9JHc19TWM5tTFFmiDnY9whiJjGHXiY
 lyluNFhn4Xqza6j6Cs0jFuVtftS9a6FNkZwrw4WeR/6kPh+He9okbF3ZWKAoWRzVxhxU9CSW1UF
 ybR5ss86Mp5fxT6x4SOQPPAbgnW1tOA+J2Sx/217mVxPsQoUGsgBkUzNvQVLr2+mbFnPESUngbR
 R38m7Yq3XQPAlQfy+T1iQev13fHjEhR2/9QCGV665dG3ZFCmJEgbvP+1X7oBauAkjhRXGiZgCmz
 vLivvLjl0yITmHg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_160536_529453_0DCC1735 
X-CRM114-Status: UNSURE (   9.95  )
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

Add CPU PMU nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..9bf5157f0e504b7394ef5354411d3d37e8d5760a 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -284,6 +284,18 @@ aic: interrupt-controller@232100000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			power-domains = <&ps_aic>;
+
+			affinities {
+				e-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_E>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
+				};
+
+				p-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_P>;
+					cpus = <&cpu_p0 &cpu_p1>;
+				};
+			};
 		};
 
 		pmgr: power-management@232000000 {
@@ -412,6 +424,18 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu-e {
+		compatible = "apple,mistral-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,monsoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
 
 #include "t8015-pmgr.dtsi"

-- 
2.51.0


