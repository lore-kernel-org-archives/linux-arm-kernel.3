Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280BDC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 04:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=; b=EUGOfnfZtsvN+ImxNVOFOe6oGL
	XzDjYt8MRu3IZBTNTfApy5LlzT4b6/2d4Y+FlQRn/LAVvVv8CyOgPPChub/WeK8ZZRcGWeoaPsckT
	whvFOgFIoP8h6qo7Oc7VNL7JtWRcAe9o6z9HgeP7BpiZyVv4xBEjhgRikUU3uDp501/hSpfbetRAx
	ixZ5osZZC0oo2kbtZl9wHAXWpDcnsWn4dbC8AcWj7fIhwpa6MktKYa7IYlEa4pLZW3NzLB0t4tD3p
	I/stBIh+3t88G1/pIil6fmG142As5BJtPEK+MfzEUEStVTWqkCq1tAUy7uqt6CXpLpw5f/s6nTql9
	l8KjRz6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cYK-00000008ITx-1FjD;
	Tue, 29 Apr 2025 04:26:40 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9btp-00000008DHt-1u6u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:44:50 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2241053582dso83035365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898288; x=1746503088; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=;
        b=Cs0zRXxyhXDLOkKA+uvgqEURfMuPH6OCwDpOzFwWFDzGbqYYvAEPlXyHWdX8HEFi7M
         uaJFo0Ka/otToycsDT9xvFikEjUAr43GapqwRy1u7nHkMt/WoEg7by0x2LM7yzzRQj7k
         pCpcV28NW3aJebIoq85I4x3AES6tBbgvJShvY1zZw7l5bu1suZhkkni0DB8ZdJK+Vh5O
         bwTh4CoPpxhucJb37S9lmSo9tZUiNtD9N67K3a+EoclPu0l6BK9gaARhT0/l+kSwiSqG
         qGagKKZETCE8oZ/FS5F1A4AKaO08PPrCmfyNUudPUTKhIsxtp0vtejygMNubL4dmJgp/
         oosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898288; x=1746503088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=;
        b=BphJuOCU0irHIEzN6iRhee/uL+qNqheI452mF1x5CLOkCQmWj2CL5UtZ8dJ3heJCnk
         t1ChRoyi3XaFOl84p0HdxmZW36XgvRXrZSrx49jBi8/FbqEYuUUwSHgH7m5AMO5ki9oO
         beO/ZoDHlqUaQFC0CgBRRJ6P9TW+pIZRvTOVQJ09sbRrW17kI/kBYv73vfbNiK9evPqp
         vYqcPiO/hyR5827tR6dQSvA9K0CePe4VIlnDI6pnAbrHr12sb2PtaGQ4x1SHd4Jgzw7a
         CftRzzA/PqSO4PYtACo1dZsgEFoxAvu2Z7gC00jhrFIp2ePI9LCtivxyQrvAw5TNJXmK
         P08g==
X-Forwarded-Encrypted: i=1; AJvYcCWHb1O/kjz4ukjJas97oJPGTCPvcy/aDJauAhSzNr6oKWN9j9drI6ZLl+tF+8UoEwzP/v70su0qsqhJ3N4ZFLto@lists.infradead.org
X-Gm-Message-State: AOJu0YzJixwlkkw21dk6JxSvjc2h+xuPgEpmUH/IUFkBhkbPmEttEXbI
	Lsmq8LxWwM8StHJ97EXHyCqIqxJLaeQjKJ3pk24gOylkDPzu17dt
X-Gm-Gg: ASbGnctotIVOmJ7qBRP7YwI5qGFwIDpjFkw9s59crYk5MKM1TzQkA/sBMjJAMfyZSdz
	yk68Huc6wyAEDNPTMUwnJqyHU1knysZrQdjuKH9lju0kRu4Bjr0v+KSQ2FfHRzr1Is3hxODeJZQ
	rkoPT1w9RZ/J/HDVF1QZyJX/gOR8Z51gpcBxeaSpgmYIKQyi7l2pS5V6I+MMDSBE7QCI/NbSK9M
	IjWg25YROuiUs/VrkO/wfzhGYQMgNf8LEgEuvvWuT6CjOtG7Zz829T8NeVg3qyOQSV0QoiRSvqJ
	01BaC1I9y5nf2d+0YTAef7SrvEBN/w5zwt0Tt8TxDLVXnJVbcZXjSfS4AZgi2+5ZBBau
X-Google-Smtp-Source: AGHT+IG+mbGfHby4oN4mif/0xWyzRBGUvzT/O7NjVxUxLjebSyALlk4r0nPv9AAtoDtPEV0kMXU5LA==
X-Received: by 2002:a17:903:24e:b0:220:e023:8fa6 with SMTP id d9443c01a7336-22dc6a87a3bmr149376745ad.50.1745898288540;
        Mon, 28 Apr 2025 20:44:48 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:48 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:45 +0800
Subject: [PATCH RESEND v6 21/21] arm64: dts: apple: t8015: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-21-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZHoXysjC3tKjwBhupXya9t0tvevKJFeLclU2Q2P4acg=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErmS1j7IbxLQZFLwnkOWnyGSToxunf+XJVbp
 2Po03ztjQmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5gAKCRABygi3psUI
 JEnzD/4oHcDES/A3PK30mbJojwRLni5u89YxyaUUXYibt356GrRUeaB9TaCO01jQtOCbCyLwdng
 YYLhyzjLX5WGz+LVCOpox/FejgYqaGmOs48zTsdrza7jrrcapf4Gm3y4u9LGy1oivwzW4eSvHqe
 BclP4UmTlBVeLCZgD5Lpdx1Y7gGcA/kE0oKbae+SCi23mdmVMa6uVCUd0YrwMGRwglDR/DNE33E
 v8Pk7JisxFreQLuncLRqBJXpYzB5lDbB3XxsnmuZqNuT1SDyjwK+EHMGuNIsXLBLF+FjFwQJ4dC
 NKmL4l+qJPyZJ2badP5lsPMumOQ4E882OtRIGWLojoc2W7DzjrPbPSrZ8FzILxZtDwxyLqHALf5
 rOlZ/n4kepyshmCA1terQLnhNH66s4MEPKSTRqIdbOmpaOJAmQr0q7xehYOTcQtkOxik80Dizob
 5UAtpDS+m2hl3rgIk/L4thrBIfq5YVY+5kPuZ77KP9UEJoxKoopvnY8AedI6CZ8Kj4Vk496/r7k
 bIw0zf4Dv76CCEY/S9EJdSOe1UG0VMQEbYtoarAGR3tYr8skigSk++wEkiMdMIAddQ+ryWvepQS
 dNNrxD1hBKlDuXAs4WdEvD7FLxKx9p3JaA56Abb1PxNiE8S85h95aE0WQHyuIURre8/c7Wb3kcv
 wjboZ0P2NAD9FNg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204449_496965_D5FE7F12 
X-CRM114-Status: UNSURE (   9.98  )
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
index 4d54afcecd50b50ed1fd386ccfc46c373e190e6b..e838b65ea63eef9c198032ee87e63dae282141dc 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -252,6 +252,18 @@ aic: interrupt-controller@232100000 {
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
@@ -380,6 +392,18 @@ timer {
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
2.49.0


