Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2859CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/1HJxrOXMdUlBGAfuEOyATY8C4K1iwqLWBzaFNxg8Y=; b=jOvIllYNPRhFqQGe/MyHOxwBtl
	utEMcm6kJNisyvuG33JBEpu1n2dGFlMoPZBZTgnRAG1FMwRLt7k4Lq4pnir+4BzKvlvcAEwXy21Q3
	Ay1J0teoPWVll5SX/R9LCdCtmyxm89oRMJr8EhUPhP1GAndFOsHyhkpqFWTKioZRTbgBCcU0u/S7H
	aJeqedOd+3OSrexz7p7Jx2xC+iN7yTD+lKQwmxa38CRqvkFa3XpdjfI86KVsYZhnOKsliI6nF4Crd
	Ov9PttJkWsZ2GDYRVKomoa/+U0ewaVX3JBgyXUr7n0xgWGZQHW+ArDrsGeOR4DCi1TeyQuUCHyO/e
	QjfYpPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUaW-00000008Dqe-3JnF;
	Mon, 11 Aug 2025 15:37:28 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT19-00000007uSI-0Ug7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:56:52 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b4245235a77so3678306a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920610; x=1755525410; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/1HJxrOXMdUlBGAfuEOyATY8C4K1iwqLWBzaFNxg8Y=;
        b=HuaqqeXdVaW1kjOWFpPOxxeim1bhMrVmWuxXpQEErxrJHDm8ixNAcD8R40WWcqE804
         qQwF1ShsZX32VDGE2C8ELdxFKw25yjzC+tUMZq/gpOq0tdMy8ND6JLph5mognp9QRQVI
         sibLA8bLysAf+4DuQVxknKiqfwVN7aDXE1i1Fzhb9K9H6h+xk7RZlO7FD4tR2O+IZdF/
         EGuhb63Be/NrgWodFps8nUfGxiEGIMdHXsIGjZ06gAiMknO7W3s7+/RBbcyEvpgLzVaB
         xkwJMBRXkL2i3p4/b2GifNqEFVvieLIPepxxgmBEJFnfov262D/lix3jfYdvhzwg1rK8
         cw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920610; x=1755525410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/1HJxrOXMdUlBGAfuEOyATY8C4K1iwqLWBzaFNxg8Y=;
        b=wOoyWMyTGpDiB22TcN4XCOrrwZcFTRNLLYkcySp2wlVD1GEebDxHVeaq4SbDX71mnQ
         5/ArXXvbhTBj6rIWUcFbKevNUnu0n2HXMNP35FhPLtZxRRjbSs/oQfsZqkEoaXtZKMHR
         WthSjvAVGAtOe66RCzoOa1FC8LdCTk1j92K/re0g88tBhP+ShKk018FmKwvhuQse22nh
         SwHpc6BPB++5EzRegBkxl2D2hMAnL/gtXxnJqmX4YJJiTBug2arwmRrfpe9RXYYqh+QX
         rYto5E5HIBaddLlr2xxPL+bW8Iv8J2D94+VeYnhew1hoWvHhzEkmlUa6bFucX45wasTc
         hzPA==
X-Forwarded-Encrypted: i=1; AJvYcCVON0BeoHcXcLp7jbGx6jR9wUT4G3VC8W1n7C5KE6TbEtTk+1t4gwfYn74Tl6so9IT+HnLJuXc8OpR5WfP74Z2e@lists.infradead.org
X-Gm-Message-State: AOJu0YzgIuvtp+LSTIpySF0XCDk1MAZdnbIwrm+lHxg8qS2yeJJ2I2rS
	ptPZc9i0L8QI6MURykq/9gO/F9D9OsUDehSLkkUHN65G2D6f+BKbl9Sj
X-Gm-Gg: ASbGncvmOIYt2EKpapTP1ihrnrEk1COau/wPJ3zQ1y/I6ULiTzhmAHqOCVeOzcdEEsU
	Rb2xRdGEFdkY0trvutB6a30QVIf0x9uxNfmYHNnJTMrdWQb/ENfY2puEJgTuTVImTfpWMfA5zRd
	KFjdsYgqLeMvfQiknVkv7VPplnq3/rgitzIZoXD4HOytcSp+BLtw4Q294DfU72RR3aezO1eu/HD
	P7FFP/i210Hj3Od4pqgj7uw4QglXmppb7L/7Jj1zvm0syrgFGHcNWI5cJUleaeft+ooB1kFSIPx
	s1vfgvrIb7Y/rcJSa3GOdQltW49IdMRrYh2DhkgeTxti4pDs96IicpHyhB6078npe148+V32o9Y
	KMnvIJ2L5r2RJOcsyLQgz25jZF7yZWfTKM4BbhmLsS6sxm6A=
X-Google-Smtp-Source: AGHT+IG28jhCE0GuPPilcApK0/tx2rGtBIczrbc72FzxigaZhu5XM+av2qEg1gdd/Cahah4fn8leOQ==
X-Received: by 2002:a17:90b:3e4b:b0:321:6e1a:1b70 with SMTP id 98e67ed59e1d1-321838a62aemr21627006a91.0.1754920610197;
        Mon, 11 Aug 2025 06:56:50 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:49 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:51 +0800
Subject: [PATCH v8 19/21] arm64: dts: apple: t8011: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-19-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=+6Hv7wN45RYOvBgi9TpvNQIVfDT+M+Oqum7pRXh6aLo=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZD8saXseFrgg36l8r0liIuixczX7zmShEZR
 G/KHq9APyyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QwAKCRABygi3psUI
 JA9CD/0XlE56mqo5MzkghwtKswzQ0DKTDGT/gnsr2ijcJkqCMePQyQZFJoCEzQe0+/vG2dprTsV
 7WkJEG72CHqP7C/Dg+rS3WQUhyi/22FJVNgYcT6ih5sQloxEXk+x3O316c36pthdLxFLlvV+JS5
 vXdgilEDGOckwu6hW5+f+i8uSv6t1o2CBM3g2EJP3sSQlvJlKLLvWQdfSmf3fSkSr3UaeckjTYJ
 C5Pi46Ozg4YF91hOK+GOaOxIQye6ENEhPALGK4W7j3t3UAt05nqlmfnc7+P+nUara0ZB4o08A1R
 ppeGjHv5Q4u4ijpXvNGJ/wAZnOBOTAsRfRzSSWX9sfpku3ahCpR356NcAo6SeNVFIkb4aheU8iz
 ySsmkjcSjl4/C2/F0euDY9nXNPQMmJdZW2o9UDU1IZHpQZBSdxHdr9PzJfknai/VcFV0AWLEXJr
 MlMp3/i1jjhO5OWWap9UP7QhBHA+vZVCm6mdclc4egYhSjqC1WWJkyNj+nH4W0aI89Y9VQT3YXI
 iGvDUTC12auwLKVbIOjX3g4d5Rm4YQec+Nr1wT+RdiP5UXuTDa5ikHQwHRRnkePLQwyZg8TLcF7
 aXWJtcCeeT3/i5aUyXwfhR5QDmIG6+//W8d+JvCiWjDVT3XWmOJDDvfGZ17ulLBP0am7RBTKnwG
 WI2+zEi64sbSYTA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065651_175367_349B4B09 
X-CRM114-Status: UNSURE (   9.73  )
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
index 974f78cc77cfe28d3c26a52a292b643172d8f5bd..ac203ac4d6eca75655cd590deba5c361accf2375 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -253,6 +253,15 @@ timer {
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
2.50.1


