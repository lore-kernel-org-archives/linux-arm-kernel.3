Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B0BCCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsMRt6a+0MtEqKde4YWuihoSzMbsHghVTF7OAbgmvz8=; b=CU5vV+XY90Sreo9uBOv2YwSr1l
	xigwERGJn+h7whjmXYw8Xeqv7iOwxsvZNsDcDRv8cnsW5k2JPSYioR9fM/jOVq1VRxwfJZ4rjXkEy
	hu3Skij4RF2IcdfLYszHD9X1iIV0WKcUETzVD0QGhCcdvG3HWSq0s3UElhz5WCwq4RyfWTWLFI8Ma
	ML6EiJqC5rN01ZO2PxzJY8/9iSiXcthv0AW0wzle8tRf8zSASIX0idsPHQn7+pEyUKNLeBInsipQR
	M4b94NjpRUOOwVEirGUbpVan9WUCwXaLc+OEON1ubaN5BPN2Jvbwh/HMM81rd8hERckrzreG6lmyl
	dqaCAs+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gaN-0000000GjBN-0rbQ;
	Tue, 14 Oct 2025 15:05:11 +0000
Received: from mail-pf1-f177.google.com ([209.85.210.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gaI-0000000Gj6E-3TeI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:05:09 +0000
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-782e93932ffso4912863b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454306; x=1761059106; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsMRt6a+0MtEqKde4YWuihoSzMbsHghVTF7OAbgmvz8=;
        b=VIpZnnI9Lge0+TPznOEZjxOCgZe5cL0OlqiTdnzJoA5FmNJmr3OTonT0opTlTR7mQL
         jPnDLIYWSrNffq9lGRe4rinBqZjAlzaZKmKdInJv0FPSq6O8H8k2DOnwBrR8V9geGVm4
         2Ef92RzEMTmN5/zS3An9BPhjlEYPOUedQonXVgZ8N7mYWIQaFo+cg8ICpXLoeuHJvDhk
         50uI5DxOHF3Bq+mBDA34rou8HJKmD0vxV/8ErumlyOVyFylBt7AeneNMPUo6ear0Bs7U
         Wri1HmPEB6CMgR8ytT4r8Mieapr9SQj1Vf2VRho8wwNgpO7Vxei9q1b6RwAwr4xdx6sq
         yqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454306; x=1761059106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsMRt6a+0MtEqKde4YWuihoSzMbsHghVTF7OAbgmvz8=;
        b=cm4Elo597rBobRjmvlMqEgahv1FlWyjL36qFhFUDrxrBobZVYUenaAjNpnIYumbigd
         31GcGGCYdTbVG8sHnUYg9keD22OR/GkFywCp48qOnQLo8BaSYf5UBGcYd6IlLdLjwgaC
         Jbscy9brWQ1Y/YP7j95Swf8Y6c3Wl0dGM5mqh+OGFQ2BLMd8ASxhZudq4y8h0LL0e/Y/
         DGjf7Qn/KHa7GRE76BJpvT2lhI2CH/9nqWAEh3ZeeL+cCV8WjmgoIuweBFRFda7hF0Xs
         /709rO0vawVMGzAS9zROqpq12zBaiK03g/8b2s/mcRlpnjmDFdB8MkPqsjDJPZ/X69PU
         T7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrM/u8FA+koQJsc57DeDaSKfmq4LRLLMyXQdQ5unlikyRKCrpRXI4kcjIR/HQhKM1ajo40yAhxmnENIaR/nFj0@lists.infradead.org
X-Gm-Message-State: AOJu0YxXNQ9eUBoFkRtcdnrM3LkPTAO/Tr97CWBrYIvq3/YUliWMfOrt
	qOg0k8PEYoi3+BXS6MrXsn5GZGdrg4MqIAWPwPEyMiEFPv/z4XUH8nzz
X-Gm-Gg: ASbGncs+qWS0xsGGsjg3PslhwOG4Ds1J8MPJ8etDclFCHuv+vSDsG4xNZRjP40E7ruT
	n46KqxxiYv1oj+v40IyqIL0Ufzsi5MHFA5o1vZNIoMliolYX/pdBMaScF9jzGWUV63kwTwsOJet
	G5QzpgZH/pKATvb5kUgbmz89BlsE5qxCMqmvbCeUOzaN9DXwg6tCxCygKbdT46wfzW7y5V5LfGP
	tJgmIZfrcxIciTJzwSjqu8FERxNC7r9/3Xt0aPZXkSEo4JXCN5vfiNAC0fsdp+ihxYBkeE+xH+9
	PNt/EziYWktBg8N8CLE/4qVCb+9U5p6EbsULB30DWCJiFYHqJY18vMo2IRyWaxDNIflbpWZpmxQ
	037sh70DdY2pu4vpIEpL5R12ihTKZcfTU4YFNJszgT8o9Eh2ztykabw==
X-Google-Smtp-Source: AGHT+IHfYvpkP9qBYR0QxPI4MGOvmRjmBPWouaaIKnO8VsRvsEyRGrUKru6CiIL2ZB5M9rvBGZzptA==
X-Received: by 2002:a05:6a20:7d9d:b0:303:8207:eb51 with SMTP id adf61e73a8af0-32da8462f4bmr34021694637.55.1760454305535;
        Tue, 14 Oct 2025 08:05:05 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:05 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:46 +0800
Subject: [PATCH RESEND v8 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-13-3f94d4a2a285@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=XiGGX/gYUODKcUIpICueRO0ZWhSBnplWOTrgw4sJMTI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZuP34mQJBCd6DStjvUZPuGtGfYF/188yqem
 GL19LCKE4WJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbgAKCRABygi3psUI
 JBi6EACU9XHCs8g+4Qbt5yLz0F/EmK7cgyB1bpMgI6YWmKeTTXtIGIGFCPumMb5BOwQ2XU/cQhS
 pcNOLz7i0HEv7X/unBThX2PCscxe+9eSw59pvdHe4eEG+BDlHTFbIqZmPTzE2kMNZPLRXAGLdXU
 +UZWuG6HsNZSOknammazcOredp9P7t8+oCxz9X29YuMBXlzN6Tn95qwDmdbVUzuPBC4OvIY5/Jz
 uKigRJS/Jb6WCsRKMKx5v8QWbGRF4MRaBL2ddz8AIM9t73e0KUsnGG201jxuMUnEzPmQsxbngFi
 KdoT97UWsrW+eBqgVzrN/LoBPYcIGqskAcw4TRUmntFDVqi2S/cN3zbS40XpwnU9GNqwr798pgB
 ZYNP/Ay0Y1E2hbQJ4OqT8eEEFklsPT/7nw8hU+ZlcV2/2gIkSlUNN27N5M9fEULSRYK7hTYl3dB
 ft4GbH6QRVusX/oZVtoxaXQbKDJ2kvQw/mabUxusGg1CAsecpBDQYRky+n9DBIKRY+bqKVmWudr
 JrxS1XszQOq3013ZUOxJnDMsSMBtsekgfjST/EAIBJ4MZoI6WbQenxgZjTsIRFx7C7rpC4qazWK
 CFW4RAYAIuIArBchm8OO8dpRHXeuSnnWFezg3vOrr3cSX9TX9asFqC9xiSwxgfOcpG96SSTLWeq
 +9oQspGNJtE4Dtw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_080506_925402_D76E9371 
X-CRM114-Status: GOOD (  10.06  )
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

Add CPU PMU nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 5b5175d6978c45052ded495fc0d18ee3a8fbfdcb..1a3a90f7b9ded42e371ef0b41057fd3081579615 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -151,6 +151,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,cyclone-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 178 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 181 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s5l8960x-pmgr.dtsi"

-- 
2.51.0


