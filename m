Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297D9C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p88Xq7CcIbv//pK/8o6xWNFNp8G6hvFjdYWZku59rLg=; b=kkP6pX1mgWGvVShIxw/qdfMDAm
	9Bf8uAS+0Ifjch9s1APu/ydNmXT5AX8Dus1qcZ1h57ug+c7vMvTVH97pzcFW7vl6ajolOdPE6CFU6
	dEbu6DKkmPherlZUsu1UeLQDWTLzZt846Z/LtjSapRKP/BJO9rKzhszKfkXLInY5j5s3o8SMuMOae
	XyWlMd9JGrKapM7tYL96aavx2v3+ubABNuZNm41PplMgTUuFjmECwpj7ClnZ3pSI+vIT2mw4aSnyn
	/PmxMliwnrs6+I6hEp6FLBd3daB4I4VDQO3Xn0aDUpXtMcwV9s3Lm0gbBh3ab12lUR46Cg/JK++Dw
	4nwW0dIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5wS-00000000s86-0L3W;
	Thu, 20 Feb 2025 12:46:12 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5Ze-00000000lco-0tIc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:22:39 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220c8f38febso15626075ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054157; x=1740658957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p88Xq7CcIbv//pK/8o6xWNFNp8G6hvFjdYWZku59rLg=;
        b=BYVaH5NL3gJOxOZCSFhkR7LMZoVVSinctnVyY6yoEGplAe7BdDYRoq/pT0e0eoqKWp
         QMlwtalodcjU/gM6qPPg/sVpigg03lRbNmo2gCnFHhJFcBW+/pWa/Duy3kcPygEQ8MBa
         9bzegAWM+qH3bWejjxlERk4R0sNHOsKHYEtDlAsyDwJZgHu9qi2mk1W0M7vQSQE4xJS6
         sFwoM9DJ4tEx9Phtg4LbAqjp6TuzlIioLpcvRrzozppB8GN9vezuKrUoDaQhoE9qEDcW
         MVyYrXYL4wE7cgjFPrRbCYCFO43xjwpi/9lvxo9FO4HepfyIR6O4+nq9t7RyMtvuo00K
         2XSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054157; x=1740658957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p88Xq7CcIbv//pK/8o6xWNFNp8G6hvFjdYWZku59rLg=;
        b=pPmnTF1+/MZXmRc7mUHOoZV6HOfy2T99Hq16waJ6R8v6+snO+f10bo4JCmAM4uTHl8
         Tbig0rr9c3tcRb4TbWvnIakNdHyPcev4opJpyTm1tf782r2AAXI7F9sDXv020VONO21T
         0z/7kEOKUzMrlww2UgiIw+n4rnxWYB0iBaL/cpwpZii4AYAk6BnbapvRLUUhNMDPZB1K
         /mkB34ppGjdhJLujOeSUKUVPktvtwJCx2wZZQJXCYspyPHul2WcsgyLZff3eHKLG0iRQ
         3y9jPhMmx7m+UHFo/3DIc8DEpnN6ZxQHnSaScN53uaNL+jSDRn7EL4/4wxQM/gbnDo4O
         WvzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcvRnZhyB3YeWPyVc54Iduh/Gz5vKfEdRslWUp4jPiWxe3+IkF+lkJKBAa/YmAz6nKdXEAYUHxT02q76MuyiKW@lists.infradead.org
X-Gm-Message-State: AOJu0YzG/uECeakYBbTL9WruTCKgN09FW36FZ7xT8S9qjtQbfS2V9vlh
	Ru5PdfBKx1q/FGUkrLRxSFx2tMgGZu4/UAkydkPArBhewSoupTUd
X-Gm-Gg: ASbGncu4+bQiXTOmk6OVhWWHAELMzy98gzR0gfOj2wzaQWh+6eXBLGeS5V8RdjuspZk
	eBwMCHorP3K2YpVx8XL15p9aTOCMCAhzgSshpbBkM9Yj87GeJMBJnQ8kPA1dr2QDdqkNj7pBon9
	NwRiOZL+ZyKJNLVcy/CHmo4rPnCraRqh7QxSSM7of8sw0U11RHgLT6Cc7suo7DbhbFSYFrj3SrA
	DMrGAHEIi3O8eM0RpRcCY/hZJVdeiciVU7saeGiqItoQebU3I4iegN8m1F1PNbE/EYxwyf0d88v
	+sKEeMsoOMgWrgQCCg==
X-Google-Smtp-Source: AGHT+IGKi0OwABJ8OazdgI/qPfei2Zb/m9/WRKpTHFBhVpsI8ngWlD5vkXqc6qhKnNsHJhG3sucPtg==
X-Received: by 2002:a05:6a00:1812:b0:732:5a0c:c1b9 with SMTP id d2e1a72fcca58-7341728035fmr3827536b3a.13.1740054157213;
        Thu, 20 Feb 2025 04:22:37 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:36 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:45 +0800
Subject: [PATCH 4/9] arm64: dts: apple: s800-0-3: Add CPU caches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-4-2c7011097768@gmail.com>
References: <20250220-caches-v1-0-2c7011097768@gmail.com>
In-Reply-To: <20250220-caches-v1-0-2c7011097768@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=m8DIH1oz0BOQsGMq/uy1lhJh09Sh6/MpdSkzvHXLM/M=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5+sEdIUrj9lyDp6bgq8zlC6AYKb0UbErd1T
 DYTpg9Lra+JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefgAKCRABygi3psUI
 JO5mD/9x7g3XxV7Y3A3h/VxuTLsbrjRrQv3LRwbIsIbWfDt+fgtSq+UFYHXekbz3pvRmSIviTSy
 +wsG8YF/8dYtAxg7o3Et6LqUv4l0G1mf4a/cBhn+Rppu1yfPWvO8bZEPNJYG03DmR7ToCc4gJ6g
 /wm3uATeXQPckGvaofJkQN5uGpFRLiySrQC/N+XEL2686uDqnlyCH53RxoyOwtSJ5p9goKJTAqE
 +ZGlDvmsl3k5FiDxTcHI3wq/WG4zduPSAv0H7gxtDU1iyUHXqdJaVSEjc6f/WOV3/KsnVfrEjcQ
 12reV8t4YosYLLPS/YiadOV4p8LTJvHB/3VIFt+jGpuH5v3fZMNZKgp0wqHeRghQdWTkF4LvNS+
 W5SByHg0WBmdlQtLm6kHPqPaWtczr+TwcaS1FaFyUB6xLYKyn2RbFE7oAqF2yBeiZp6bqdnx3eE
 7T/cz5e4X04sLtIy5c0vosTkak8bKw6jwdcIPc/9SyO+EwcqNhd7E3kJUfpaMH31SnIzSVS8cZO
 rF5gnUkBIGD+m+YBTWf3SgF3fHIYNuVzB0wluTT3AaRglIGO+59ZCkip5EAMM5kFZ2EBRYCF2T2
 S27ln4iXKhHHCC5zuxGsLhM/QjEaZ/CZ22xjB0kC+nLzrp+JGOkkKLem4UZ9h9pGWNy0SN7F8bs
 VOJ7GCRceKh7oRw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_042238_258887_752027ED 
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

Add information about CPU caches in both variants of Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 2aec49f0da6467519aeb2561d00b14f46fe216fb..e56697689d953fdb0da9d23b57fd92b6f8eb5756 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -36,6 +36,9 @@ cpu0: cpu@0 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu1: cpu@1 {
@@ -46,6 +49,16 @@ cpu1: cpu@1 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x300000>;
 		};
 	};
 

-- 
2.48.1


