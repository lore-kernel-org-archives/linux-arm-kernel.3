Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA17C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=; b=i12BUT8WxYzf2n3Ea9rGL50DXr
	9xHaEUlFKbwKSi3AyCQo4qEDC38To4dkkZikxJGkAZTlQBsOhm7v2qrWLv+iFX80gri9PT9dNwnE6
	8JzfIiSgLdQebfD9N6nOoPAypkiOkD75M1hHqyLuIoyOkG4qtB5fjdDXHvT2OCMixNycoiwfempnd
	6NBspu7FgGrih15JHKhSqKESEuCGu9KGtIgKCu2HvVJen/zQwqUhI94MX+/zigN0C2GalvO9KPCtw
	ltrfIHEcgFiQelD6fzNT7mdwM7Ng0CrBOmYu2rsdpYaC1B/GhHgjC0CurOelDRAOQkiGD1Dv4oKlI
	eYrPY5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmSK-000000067as-0I7h;
	Sat, 10 May 2025 15:49:40 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlsI-000000064Gl-2CRK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:12:30 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-ae727e87c26so2088827a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889945; x=1747494745; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=SGQyYAjq3n7s/plIKv4cJtNi9NISpXcWUlFqtC7ozqIi7u+6uB8R5JLKTIkB2oIq0r
         Sk3It7SgI2gK0oW+ivGh0UW5m+d4dao5/KZRN85Mqtjwt/TS+aOjM+BMpwf+HXzsx1HE
         uCJu/QlRj8gsg5iCgqGpDip7R0hfV84oazBtvV0QY+XW7qzDaYhP7D0bUUu5J/1LAA8U
         m3zO+g1M33C+/bt11oKnJYd8UEjUQKP/kJvFCXfCpU8QfeIlpCIYsWWFEyrJzGFHk6JH
         sL8nuPUgN46pH46Tt20oajDCvLf80kyFw9QEiowK5oLNXJ8DiJjy87AoieaREToPwZpo
         CNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889945; x=1747494745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=ltodb1xJzn26Ijfwjs+4tAvskv92iRKPFwOKHZzd+wCI4PDqnFKsCjlg/AzWIy4Cf+
         AZ10XXpmQ9wO2iIylKfpQ+MGy9YBsaT5qma/G3WzOgTV2xldQuZaRk2/T6Pvh2GxWK7u
         izwZoIIbw01xCjKL4Rzpgh+k1+PDITr/zFGRSBufnqcoGEd0noIZgCN9A7MGL1PIrDqt
         oio8Rm1tAilPMS1AfaJ4tyHsvwC27b2EDYMorkhU+GR0qhCCaltnWpdkcOFS91x/6024
         Bzov1xHZRP4VV2kZPp2xlvFj1ioAe8zTrVeAbpgTGXreZ48ql6u0oxZs63Q8UNcD4l6y
         NfhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW77LRuMXq0Mx/kYIJswr0F4T96QQ94rS8sHB2FjkRDsgJB4AhecHGLvZXAD6/kbv1Ysjpn2glcHXq0OV6vS19M@lists.infradead.org
X-Gm-Message-State: AOJu0YwQWNKtzZvOPnEDYg6ASMDOztPvUdJIULV9MbYokRLM+CKgKZJG
	alTAELC5CvH9mtI2J80Gw2qnxqaCCGrHtGr3Z6JN8Ugtlr5uTT5o
X-Gm-Gg: ASbGnctdE7pcPKOOEwQ2Hj/dhVaZl4InPB6H470ny1S1OIg++xFqNUwuH9q8ltN7+hU
	/GuIYeY+QkU8tPZiP/3FXsvmI+5XweY/p5uKa2CLSXa9iD6C06ibfXi+5npKzHw2LspPeAqJ+sT
	NFYLtG4vWuF3qndwbRCVfhDQpyoip/tPcvAR8ZVA0o2oPxPFSHgnZlP5s1RalRFDGuyajrnFk5O
	pvPYQvv3OgmQosRG+Rvvkd1FAbOh6gG6nttku0B1yiIIuWpQ7w4XI0UpaVuvwWW3VYkjR3tm8H/
	lkXuiNorekst18nXdJY1ItKubhkbHW/gOVDlw7dQwwYCuvF/tccO/w==
X-Google-Smtp-Source: AGHT+IHvpyWaj41xEJ4fgTCl3JLKcagSaqSvSd0GQPAB2NLjBkSapSV9Zv6NdP86SFyL3wsGhog0iw==
X-Received: by 2002:a17:902:ce83:b0:224:fa0:36d2 with SMTP id d9443c01a7336-22fc8c7c0bcmr91362355ad.26.1746889945680;
        Sat, 10 May 2025 08:12:25 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:25 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:58 +0800
Subject: [PATCH v7 17/21] arm64: dts: apple: s8001: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-17-bd505cb6c520@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=umS18Mpui1EoUACcGD+WdVdka5VgnqwULsO8fA+OvnQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2ycF2bw3pW8inBZRIdQmQjyjU46bjoUvRyrt
 YQ6AHCBUqSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9snAAKCRABygi3psUI
 JIc5D/0VQtva3ilCixys6Vr4EbzfXvPR+1Mz98aBHk5EgmotsOVrHArH9ENBqVQ/hwGkV1WCxFY
 Q3Z+zsshxMQ/LbtkpORixMbpkIcmj5YwDhOvCS5tbDqU6gtVoUgHgK15IFeUmoPalsv5TY70xZx
 WcYk/w3seRQcVgW7pp61jdLE3M/skJLGxw4Vs1C/h5bvqBKCmuj4HzKwFrqX56ysqsEBAVDplCv
 21kcI1cB0Ka1ZFsVUBOiP52hH3mu/A84SeGmjUL9dJBMNY8pJjtw3sbgaIP4CeauRbLJkUO+N2Y
 nVZHttdDvWtaZ65yOqe6hYNm8RKF0RAXGgoLYqvsyf9z36YkgoLRDCMxfeR0RyMh9421NwP/FT9
 rwKE1uF9qsHpeVpgzwNvncSLx6JgwCW7d5Dv3bvBcMh43H3nSYCnbz71INK0s9RTRBZQTwkeggL
 m9j3yLmsqiR/7rGAUS7FvzE8GHlz74wkE4rng3/68dhbTqsY6mWDy1oTFoSv4dPMWaGfoGLVoZb
 nYsbSvHx+BKwR8hIVYTX83B9NC44WWgsYlCZGQuiwOMl/lnCmL7R1UeXRV8OFXWpM1TBcPDWYrm
 bhCMMA3ui8oNM7RZdzc+IOlwXxVS3gAjR8cCGIHab+I/gb5amYkdzQe7E30iYzi7i6VYDRut0VL
 rI3xk/Ox5RZ1Uag==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081226_567389_E4295957 
X-CRM114-Status: UNSURE (   9.94  )
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

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index d56d49c048bbf55e5f2edf40f6fd1fcff6342a9f..33760c60a9189df5491256f81db7f413cada27a7 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -209,6 +209,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s8001-pmgr.dtsi"

-- 
2.49.0


