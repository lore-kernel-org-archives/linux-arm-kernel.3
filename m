Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E020CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyHd36Q32D6LVFmjxrrSCjpcR8v8mTvafzGLYpLOI3I=; b=nfxIAM+9YAa5GFaaWrTEBKgEcd
	jir9YaMTpY++TqoKfnscZeNKoFblf0HLeN5CPQEFf/Vdy6WK0vQO5keF8jtpRUq3RYK4240i8ZCwV
	nbsWl/yOmSuiC2POABbNsC7ZoluU6SxaY63h0tCuiUEBQ3fJhwjmhxgve7TWxnng0MVAH3otdmsrt
	GTWCz60aYuxm5B2znNy8hrPN1yzUMg0BPdlDWuMyAvkZxVJDZCV9zPZZjECLDtU6s5APGpa9FxgFJ
	eeg+C1HNPn7UpSEudZROPc0cfMnF0NrMyeyVidCr+Xdbqs0OAjeNcx4wSfGcczwcIwDqX8pRopqRa
	JGZRwdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvac3-0000000GqkP-0RdK;
	Mon, 08 Sep 2025 12:04:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYh3-0000000GEEW-2G8r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:01:50 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-24c8ef94e5dso34332585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325709; x=1757930509; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyHd36Q32D6LVFmjxrrSCjpcR8v8mTvafzGLYpLOI3I=;
        b=AbucYiE4liKEsR5NdgstZvufJdgBsA6D+6Kc867zKl5ECLDkWv5N8RHZ+nSmiiLRHw
         mmk8fw16OehSAtyXc34q/dbTmqgiH459Y+uhxXZa3TQAj7ypvju36NYKM6CpO1sdM+cH
         8OmD/sgnEVdCVEEyk1BAWgSoqujL+Bk6k0dSkJP0bNNVon0/K9sjJCBYdB51s+f4P+ZF
         16C6mQxTNSJEEDujs7g1SILY+GLP/uJ3LBSSfd0b70YWviYPpKDfU4VSIfJtrq10i2bR
         Ma0eFuGT+9lyTgj7xpyEo1hji6kZrbgfcgAzLUCcW2slGI9ZaP1ynITh3qrBjBOVarj7
         AcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325709; x=1757930509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyHd36Q32D6LVFmjxrrSCjpcR8v8mTvafzGLYpLOI3I=;
        b=EuiGHhRB4ncTIXhgxBo9vJJ7u4+QPWjToBtCNM954Z1xQD/z4PSbpwEX4pfvx9OEut
         qYbHyedZEPJMBFTILDv2ahOjgoFqHotX45eYsgoFTTa+2cSsfiPpmsIAymjwLo+w0taI
         6eJnl+aTD8ozpiChXdLBDfWEGEPyAyLGWoIAa/Cq3Oy9Wjpd45l6SrcTtjwdBw1cBK6l
         jDlf2fySMhfwU5w4WRB+QbwLs5W1PC8F3zSPazFFeKv67+7/DHj/9FyTgMLVQpHLsDBp
         e41gHdy+qW58U0bf+/C2gHJnJbDJCV6WzCRR0RquR6gWcxTNX99YsGytciVLgP9jGtin
         Hq6g==
X-Forwarded-Encrypted: i=1; AJvYcCUxdbtH6jaAfiWUPVPg4ipVJdfaUL04HKFAglQXTdhAZE1+yyQ0evZLs89MSohgl8hWICDq+LasrjBFrAk/DrK4@lists.infradead.org
X-Gm-Message-State: AOJu0YxmaVikELzZWdAaMIuDN9sBpvmpih4tXNCOb6zVPZlP/8j25ms4
	E42khGv00X+OPe6wTB3gV88m2qk8YetZ2iZGHYE7FDSeaPXCTYkFSPMl
X-Gm-Gg: ASbGncvCmEjZ1Nfe9byjZO8+XWtxqbnrqGcnKqQdXQnWflIEuvfn60XX/dWKSEmahpB
	nNhHIYFW8Lg29wkkWPk8WrX1Phvz2QGhhU9ip93bqk2E/Yc3MRAqXnQP11nh+OxA4hjpwtfL/OO
	p6E8ZHpgJiqJNztdd3ZtAKSbiv20Rz4fTKwZ+bpzXiYEh7RTwcF/CTvLb2ko+8Irf33Ez9KBkHu
	0nrlKuCmunF1vzznkJt6Qxx1iWEJ33UN1ZgO3sd2ifuGEay+6PuXFDYsX/zhM8uaE7f6jd+yIpQ
	FgfNr//F4+Vh8d9fVPntWn9/r8VQTdEWG625u9BHNiV7ou3nb1oQpF5s7TbVJXW4i56nXg6lX+T
	XdVQq3Nd4gBrp0bD5SaxDTHhqnF/1gqyLf7Fwig==
X-Google-Smtp-Source: AGHT+IHVU3ALye4sph0Wu+Tnv2WEHOcB5qvS7mM3i56TPwTLcEJRcMe6hHtK6mhihmKypJeKyqYQrw==
X-Received: by 2002:a17:902:ce89:b0:24c:af27:b71 with SMTP id d9443c01a7336-24cef93a60bmr134956285ad.20.1757325708812;
        Mon, 08 Sep 2025 03:01:48 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:01:48 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:38 +0800
Subject: [PATCH RESEND v8 14/21] arm64: dts: apple: t7000: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-14-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=1JKajXUwqRhul1ka4zSxgmuIZmZnF5dN2V8kqpA2Ejs=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlEwbV0Ai/6KcBnAAiK7K8h/Hekwrf8ii3JD
 vUIXaW0sDKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRAAKCRABygi3psUI
 JOnOEAC19Bj2cTcDw/YbvyrR2Y1VbvNwSkj4qxaAx7xK/5DBRHYeRBprDK+1I0jZhVFQEVAcQp3
 /ASswENjcVv/tgFKU/1PM6aQQafuVRTDRKa3Rbtips1arm3MA+hlj7pmVMkbN+THB2vxPnJtun5
 mQtGm2BEqf+TLJvbm+G/n0jkfTbCsrAu1/N1QXNt1stLCkCPZ0WlUQcLGkPGdhYJQlccxH5CWuo
 YLQohlunR/Lb0fKzwYVWSRHqPqKJWsSjchP3wUg2uHLnrKuLQMQOkJqOBCWnCVzmJYOpdNIw5sx
 gLl/Ja54mmF1N3cWrRkqeyWD8tjY145npqfbvHPpeWzcQpTh9dzWMFcsBcyAr1VSd8jGl9nHntV
 KAbvPrvqeJUOZAp9XU7cih0V5uq17aqZ77tdnFpm/bxgbNCkdIbqa1z5phh/YgJtB4eDhiZgMxE
 suBo2jWn7tKLb+h7bQxAkcTCQ4gKtDj86TwCNDr6ANv87FtVUdLXFQmaf5VxLWQ0grbwxDNRQkC
 KIxxWW/Gc/sm3jJc+d4fuZ9gQbBw82htBQhIObSGCPj7jSwQ8k2nwMORywqrLOQ4fW4CeQd+UqL
 Sw5XyebirPlIIK9P8nr+nPZxMqf8Gqi3zHxbhko6sZ+XiQsIDkpUOSv1QGT/Fa39tjcnsRqJBOL
 /4nn0Jfb64M6Zng==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030149_592107_2F7CAD4D 
X-CRM114-Status: GOOD (  10.29  )
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

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 52edc8d776a936ca5ba58537d4d68e153023f536..98c41473a84098bd70df86c2728a8080b05b41f4 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -206,6 +206,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t7000-pmgr.dtsi"

-- 
2.51.0


