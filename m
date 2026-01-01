Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52613EE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tdOFnD1zwwXEjmETrN68s5mUpHoY1S7934/U4qRcoA=; b=FkhMpPTPR2UxKmlnERK+J84eGi
	0kpkeDi4YMYhHHkfyqxD+ppfarOFOJZpKhryw+5097p4cYCrM1S13rICLXqQLGBycAzMLB/2sYu3w
	X0Ye3EaadenZDS9fMBdtf2vERlBWjTNYMw71+CmpYx6TFfo3S9rKoTdKuy8mFkypUqQ4HNjCENwFt
	mywZim45jzcqZmoQWeb9wuD0ITidspOljRWR6CTc9i9JLDKtEdlV2yHjrmM50eYOOAGl/XRs0JOfA
	kySpd2i8qeOFcHkVCKp5Lk7fL2QPXY3LlYuSaS6k5Q3rcAOw9KoFQsXv1HF3D21r7dyHmIe0dC67z
	mQ2rzb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEbB-00000006jsR-1bca;
	Thu, 01 Jan 2026 09:04:01 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEay-00000006jbo-0Gf7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:03:59 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so11671021b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258227; x=1767863027; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tdOFnD1zwwXEjmETrN68s5mUpHoY1S7934/U4qRcoA=;
        b=R/jm1FJP17rKp27HuqNobTiPASc15vFSc99KpAs+ubyxyGuhPb5IvSsyEzRlAU/wQr
         fQ0H4/TgskqgGi/h6ov37kj1nItzJD24qLtj5V5rQyQt8UHtQ+ionsqpvwxrj1UYGcLw
         wJdSIPRuU3HPIp687GWzpvfWdxIDacYV0e+ywY3n/9fPBd+H9wKsh3DgH2KZKX4IL/cU
         4+2/aIJi7sQK29/QBmfuJAbT2N+ECTSBHGwNmizJPcf5YlMRqHIsnJtjrvacmOo0V6vX
         DYpBK3Hre5/t1tCIhkkS8vOCT8K81rjO2/ZAbEGxgbJ6L2Y2r+TFKYqYgp52U7rI/UT9
         v8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258227; x=1767863027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3tdOFnD1zwwXEjmETrN68s5mUpHoY1S7934/U4qRcoA=;
        b=Gicm2iqy4iKViF0+jJcolY5MZya8j5n0JF5ZPvntAKJujRhnyMpzQIllEIjZQe9YJG
         9i9hjBZNQNi4grtKEbzOudjdcnoXdBQisGyvc98tvhunrcXhMiRI+DRi1lGJtiTIzmZy
         dMPnm5D5C4dor9i2VO3+I84Pt17Om46sWFDVTOcv7SpkMkS5BgvjKiLVHomOsUYsfJoa
         9z9WaZ5bBcPG2AzvWA/4JYevZB/SGpa431/Sn+wx9JfyQzE/O8uBsoaeakqQlTUdXddo
         OmgQ9Uck4P2qXSk77VxkjfKJi6H3ru0H7uUNbxd61qcXZz566DqdK3rOVsPLQTohN8ke
         ZAuA==
X-Forwarded-Encrypted: i=1; AJvYcCWxtA9bbsMGCGy7ZE17QPjafo2CTDVCUfB/lt83b4b3vjdz/MaSi2t1noafc4ApcNuoBGi87RBfNZNS2TbnCOgE@lists.infradead.org
X-Gm-Message-State: AOJu0YxPvyU34Pd/u+FYTv6yXbjUSCC9EcTIPgPCRPnEh5kzQMwEQEmE
	OawfesLDshXq2IDV5mYDvBp77bhAl4nFHzjA6iqJbju4FUPeG6+8+k4J
X-Gm-Gg: AY/fxX7lyRwv19jz3R7O15xveQjceHV3jwgvjv8zmtYRanSNDcmFoksR+xMuhqbFb+d
	ikvpfGmyzv/khbEpx+fAobB2hKj6ydN8qfpaNiHsU107njZvHMt6mW6wlK8/t4T9MFULo6/5xVt
	3NIpBUR2bBB1Ku/XF/ZEQX75IB71+pjPFZvRN26vWTUwv0LiU077rci+Tfd3q81L3LuJHcWCUKX
	QRj0TVJog1txhUXSa3/Wvw2dyhfnTFetzPayeTnQRIima765m3BN8Hji4U4ha6mbGiOr3wF0iZj
	UM5e2eEWirT9ryNdfNYGtpEff48858ux8Ku6rqV5nxZop5Q1Wm0+Evc+1m2wqBIXHpLvvQ18Bth
	1FMG1OdMIaKj5kCvUhz951Fa/MXcK1JzvysYXH1S9X73fv/ezfa/ZRqHqrPg7+idytio/w91bNm
	OEHwkBbuphTb5M
X-Google-Smtp-Source: AGHT+IHO9HLDqLnxGqMh+mxYDWViv1/O3WqdN3+qFILp62mk/kOweAuJA1AZ8e4wVoEHoRWOZ+prQQ==
X-Received: by 2002:a05:6a00:90a2:b0:7e8:4433:8fa2 with SMTP id d2e1a72fcca58-7ff6607bcddmr39960635b3a.42.1767258227104;
        Thu, 01 Jan 2026 01:03:47 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:46 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:57 +0800
Subject: [PATCH v10 21/21] arm64: dts: apple: t8015: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-21-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=trWVfDATm/MwjZ2+dtjuGYhC7m5DG/4DEiwR1Jy0uIU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgpSfeNnDDFSIT2Vc+1Lesv6jNsQYcFQYur4
 OGMFS8dLn+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KQAKCRABygi3psUI
 JKgdD/48Oa+AjeAoAVsrpKQTk4o35ek0CzqaxUwDuPnoOwbkEgFd9Gv9cAbMM2eks5VybrHunJz
 e5NYXyt9bxOKT51Lq+Xkyro8ixG0EQrPItJKj8ckf/yA6Jitm7fikoHiQXc3PkUC/MuJkNcEV+6
 blmxnWxOsdxt2pbkxVBVk1ywud8xwITHXftKf/OZ+gUCWOaHgWXUEdZ++zxDCGn6G7BB2FNPBSj
 3RMWYElEv3m00UtjLwOVegeF+9LQYasHUjckXbFLoDBXqSmwvyBSHP1MurONsa28XQry5VlBHku
 LSF50dJsLChEaxClORGyiVsFvBMlI/WRnnym0EyqYwAHLZ2KLfqLvqsJndKpbF7RXdfbTuC/r5G
 1v8Xz9KfWik/7JJ4vmnSMoAVJ8EwE5XkckvZYUPt3k2hC0FUS+YOro/8fPOs6kev4KJv2XpZXJI
 cE0NhDyB0MfSclFPKZBzb5frmfVGA0+PIUwXEZjHsirGsdOhbLBDQq+ZIxuUiqfUsP1X5bs1Ohh
 evZE9VP8zemVg8jruE9jT8nqu3Ve2kw5+w3T4X+spL84wVi5lGnMmxefqyfyXFSNJxhvwM1nBf9
 bXvbE7sVJts4ECdTCJlZg3epyUkjmC8R7apIijQZJb7EQj9R3wCtCysNsWW3UgUOqmeE3BDJ6i9
 YG47wDhWWBmbfUQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010348_148245_CE51A409 
X-CRM114-Status: GOOD (  10.27  )
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
index 586d3cf1f3751d9ee23262e55fd692bfee86c13f..0c1ebab56d6b36ed5362a042ecb6cecef7c97f64 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -341,6 +341,18 @@ aic: interrupt-controller@232100000 {
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
@@ -530,6 +542,18 @@ timer {
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
2.52.0


