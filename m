Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83033CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7llkAP8rKH/Oo92VHhR1v/h5PxCOy9CRKJV3/2nzc+0=; b=ULbVnVNenwTRNufBP34U5N3/MD
	BB0rdxcFT2cZh17VCcxUErj0B/XpkVZ6kxbqlucGsN/apIDBYkwncEcakte+rhR19wpSIXWyBeFpI
	Zzf7Z7dwhlWesmbLvR8PKS7fD/T7CwwrvmQZpCowyVvoBkZQ6j7YmNhMYI/uFuRge0uIBj2OJQ5Ku
	mikLxYQ96Xo4kOzLSYbL+iECj+c2Vub8SkNdKxFjHoLaMPQtMbOGTdEHqDQZi4OilSlhmHDwjw5gv
	+sS1VQNIolg/lsQgCRCvQCrjjNHHNos7x75tYMwUMIDmJUGkD8tzP8n9zEzUxmQlgiTJqlrUGmKvl
	gjluGkuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gas-0000000GjY9-29G2;
	Tue, 14 Oct 2025 15:05:42 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gad-0000000GjOX-1YhI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:05:34 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-77f1f29a551so6970120b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454326; x=1761059126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7llkAP8rKH/Oo92VHhR1v/h5PxCOy9CRKJV3/2nzc+0=;
        b=Ccsii9gn0NGE0h/YZRp20ng26lbbnv/SXmuUYK4ICWjWELxa+OQskB9Q9Noe2o8apI
         0cK6VXSTXcHpC4ShzHCGbB89ncpoq6v+0flOHmwVAZxXXJ9usPmhAurhqYKIKAfP0IQ8
         iIhSAJ9KW2ShHgCmjfbqiVDlxin4XkRN0ydNBot9pcL1RXwv3thZWa+ArToN0sSe9SbI
         CgVdCSw97Z0J4qV1KPLZ0lM1FgJWvCfMlEr33R9XSejz0pbmQzykJIBysRNIMktvGwVY
         uioGzY9YPn3VIznKlghhy8YXhDHL79ngLH5lHE599EYZinjMPlkaIrTdDzBQ2PoWgcsi
         t27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454326; x=1761059126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7llkAP8rKH/Oo92VHhR1v/h5PxCOy9CRKJV3/2nzc+0=;
        b=YNHY8NPdy0KnXZ+0PsCJzl3Y9WeacSA5ufCO8b+383IoyvdypfBbiKOlSsoDQFjq8e
         Cvcz8f/9bRTjiqJq2VYhNOrbshsAPgLoODYRrJahaliz4MkgKPgLORsvJV4vlvgtvGba
         O9wobfq2PPMrIkpVE+kSUFRpaOgU0zpvK+LJ0zPFheX3yG0C2okjaoa+t1IRkTHsGl10
         TiWXCa9f2HE1+JFyLl4zW41j+vlqUWEsnnVOcMBeDTvOkKOUqsP1f81//Efui7KVDjUB
         gOGWk1AoK4apw5J/42qq/2qPp/sgPv6z3wZwQ0V9qB3w86ovRJZIxOONC3cbSGWn3/bX
         wlQw==
X-Forwarded-Encrypted: i=1; AJvYcCVCXnqJaf8lX/7oSLJ4rcOKxFP6p2257/LQiEFAJtrp3JWeIqll7Ya6xMCy1IUxLN/owp3q9jy7j6DmdP8MAd1W@lists.infradead.org
X-Gm-Message-State: AOJu0YwvDtuL4nTsMAMqi30xoy7jwYyrL7jpaKIq0xqGHmT63T6kfrLK
	p4fpEyqcb+4sQGwyRqKs2pDW60Ugwd86k94xQCULhG94nnfOrp2vYrZS
X-Gm-Gg: ASbGncuE7ja+cZF/g11x2AX+BiC6J45x4AoJIh+5/HX2T4BzTTUMo8wZkS6HtI6YOaL
	EHtlLmcZYC2oCQXTlNPB9laCeNx9UMKrjSaAVJkc8MOdA/Mrl5YoXAqXZA6L/SedGDDRtFaL8u+
	SSbLVEcRkTixis01NpmRspIzz75GtKYdco70gHQeQRA5nGZRNdQW7Lu5CNMYoFU5W0He2Ejr0MJ
	HWFqpU8yejj+NEiXLy1WqDdts2KIGN56k63h3sbiqoPPI0QdbjzcUAzg2xvQCuPU5tSTK1j1ltT
	gCHaDUkHI24zMlIzoaFSeKYNrv51wTVNxoEle4M42pSu9EIuGV40OsKrGOcE5aiylzl+ZHIxloj
	Vxob1xjX2lvdAM1hiydtG/t3HuHGZKoZfCTds7S2zQ5Y=
X-Google-Smtp-Source: AGHT+IE3NxAaEns2gk2qdEx9c+kwoggzTSTvFkrcp8epRBoP1K1fTKpenPt9+hbz3q8VSwNcOXWsnw==
X-Received: by 2002:a05:6a21:6da1:b0:2fb:4ac6:6662 with SMTP id adf61e73a8af0-32da8139364mr35196981637.13.1760454326327;
        Tue, 14 Oct 2025 08:05:26 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:25 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:52 +0800
Subject: [PATCH RESEND v8 19/21] arm64: dts: apple: t8011: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-19-3f94d4a2a285@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=K4a8tKqeVL9BaqFzY33bqex26zqvwpxkE6HkJdl3Qlk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZv94ncF/y/perEeYBY8+y70nwkVMNq1VRMG
 6Ac1teUQH6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbwAKCRABygi3psUI
 JNd1EACsHjSDCSxZDW6ph7m64UGBZOj0NCWE4q8pP2G2+ojKWdMmmM2B+m+uPXfdxyQBGim6jbX
 ef/OEysjJkFl1lD7pueuCDnH/yOyiOAJtf/Ew5BJVSqRc0pJZKj9HW1vAcjuBO7s/aokKO2NdbD
 d4PFX5dhOZS6dY6dZddHT32Q/r2Uwa//W5LyquKm14YpY2pS/7IEg7wYeyuHCjrVPTQflRtBL6E
 2ZobaDsC2cMVo9qt/PTqF/EzIV0p5A8i4DLHNdckv+R2mivu7oUEXlJPeAygORYT5jYE2jc4sns
 5TS4B2SjwWkf0qppUxUXj7X15U8BXGdkC5M85omLBRiXmFCf2vuvLBuWQ4LhS4CKpi3tXo4HQ3p
 VJyhn/yxyHfr9ZSbO2a3GAvmPf3AIAEInCD3wSdk1ovr9s/g+gGuc5g6ElVy+Gtzm+gR8pWvl9i
 A4bEcW2QSi3HRMk31eW7VKeCYW7p8FwRpb4YrQCo0u8Spfl1gzXrcC2oh7Ar7L0shlvfydUb/XV
 sWSMDoN5aeGNmjzkfeM/zmfDchwwRt+w3Wy9TYdY/PNvY+x2qkul2dVhGhw9kla/78WbO4R88Nh
 vaDg3NFpU7aOxG+r47otn04n+jaa3zgkV40PVqL6zg/mfJZzQ0VJMXs5lD4tG5HvZs7uLmAnvf0
 SkiHDA6Dxhfn4Dg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_080532_901773_5E1E1184 
X-CRM114-Status: UNSURE (   9.43  )
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
2.51.0


