Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925C3E6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdW1aYhvWI0surAr2E3GwiYANfzJ7XxjkfIeaqYtXoE=; b=Ckto0fsVjxBGOstZ7NoxoIvFlw
	U88+QrQVrPqs92ZTMlK1IbbZfi+wxqq2nSU3GozW3TxP6V5KpoeaM7ASv3d1L3nQecdqDrcS9d1xl
	+5QqaU0EKkp6daXfQAFl6N/lz0i3bSP61BACApQArH48BVmPd9XGj5yib8v+nI8TW1rQgukJeJN0u
	V+6n5DunFVPRlkhHb5daxRagOgym6P7IcebMMScKnOHpGfTRGOefBlZtRHE1OVwGH61jMwCDZ5jK2
	st6pdLoRvIIbrhTS1XfQSpANsnHBotlVzT1m69zLrrrDXYkUmNcckvTrMsfK1MlNZ5nOxW7CSvdT0
	MZS3pOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Gv-0000000Fgan-3F2z;
	Tue, 23 Dec 2025 15:26:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Gn-0000000FgU7-1kZV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:25:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNCe3nm561247
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UdW1aYhvWI0
	surAr2E3GwiYANfzJ7XxjkfIeaqYtXoE=; b=BkZ9QdlJ8Z5uZ2zJYghIid4QPgS
	OSeCArKOoFfat/9sEuS6uH4rAVZwZthBCnhEMhjftv9+JCu9hSXdQ+TbSYRGevrX
	Ac1DNhga3r6YV4VpejBjP5RxIV33bbRapAQVSCAfa+fxDn3udSwsPKsLHqmWfg1S
	dyi3Jen9dPKYejBmBlg8UXtdFJVTBBuS5EpLL1bSQCu9j2asqa/uLqCOUpr0hNhZ
	uJW127TC2BoDH1+t0Fo6g9InwPy67FJDKLnlh4n2uCcUxayFS1CwNt2zfLj7J2+K
	uVO71QyWBBq6ZT6jqrl2q0tcedgRolU/mEEo3PO7Y3H2OHDjsJYTFbwBO+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9creek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:25:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b4f267ba01so1568554985a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503551; x=1767108351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdW1aYhvWI0surAr2E3GwiYANfzJ7XxjkfIeaqYtXoE=;
        b=S1LPkVbyUrmccPMlUfSFKv+h3r/cyZ5tPrzLKTrADXjA3dzYhiGI6Lk/iVPyQwHl78
         vbJfnAP0gHxI+hre0N6GIr0F4gn8af3jxt3/m44zVXyq8a61R0LYYVm/L2LzRRGn3OMj
         Gtr4IGsBMrRAcG0fANPakSMUH6MCor6Qlv5R3cDEQgaCYWiYA0l9/qTOjAUwhGMqY/i8
         RmbwyPhf4V2VI8yenwiNdsxPCCrx4J4jDon5q5v2/uS2Ls4RrQndMJIZQv6ZdzBLTIXO
         kv4bqKr5x6IOQ2FTNkN8HbscQusn5kNnCSnhzZ2wxZM5dhHwuIJa20U8rKpJzwW5/vrP
         VnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503551; x=1767108351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UdW1aYhvWI0surAr2E3GwiYANfzJ7XxjkfIeaqYtXoE=;
        b=SAsBb+BiqLkHEgYnj9MN21sEqkmG3XjWP7Kc+L8us0i69Nw1UJQbvsy8nAtc1k/U59
         NZYY01iNhaOGICpbWY3Dy4vDi7imfOXhfdz1VjiXzjaMYFuBPNXQ2N8XkzRFzcNf5pGv
         UWJo7QXHjC5UQRcNknDg2uCaZx8KK45O5n7aPmiCfc0QeghtQzHl4AF6uldKdXdJfGZK
         3+tyazbLjdZ3QGWLPo1m1zFd2cAR6VKA0qFPvVbyc6OSd7tlFfx8Y68hXTqpJur1x1WS
         q+AitsoN+DBGf2nCUOfhqq0n3Zo27W8I6QRpQbHS7aMAla/e0lgcs6F4Fpf+82SW7PcX
         CI7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0QXVFyghCclsFejVBGaZ6Cz3SwMPJWDleQ0lEYRF9Yeag1icYy3qmaEzN1CBsw7yCTac0qCGth72T2o8h1h5w@lists.infradead.org
X-Gm-Message-State: AOJu0YzvYkCg7MYs9WVBTZkIzoYW5MERKoNhluQn+vxHBmCX2YIt/k0y
	T848HRjPjHdIOZnI+9Dgcr5AkE1yJqk95ny36KfZcwgVYNQgNUbvODUxsqf8OEZ4kT0G3xJGvvi
	1gVQv0nIqCW7TudXUqrpCKyBN5/32vZzate8WeZ0yR35ZdODad8J9MUqGf6QHAjuuKgjkN+LA36
	VtqFFygXdzTQ==
X-Gm-Gg: AY/fxX6S96VNQNAK2S7jHG4K1Nf4zGslj5X96NLCOrKh8UhDJXb96MBmXFHs2VkPAFp
	hFOx/QrmS98yjvOerW2QHVNMGHNzmbXRYiinnp74sZcHHNzauxZDil5IPfXbDVhSUOyM2/AfWtv
	XrkTCvgnrXXqmS74a6ZXnwpWTLN2QBp/neV1Iquvz9L3Tt3AxWsliMq6kuzAip/ZxkG/ogwugt6
	wMUHPeD7/e2GmUxmyMxxyF3x3JONuOETm8x4QY5/qWAoyu9WCyJwXzt0UfVVyi1Kupnm+LnJo2D
	QQb3J2DfKP0xw5V85SGjO05Qpu13wOdw5lbXhDSray+zDgbF4N+sSp+GNbiN0Sz3fALWA23g85H
	haXxLk15WPMwZ0iBSnSI0qMEFk0xk2wl54khMML6r6JqN86MOnt2SO+Fy2lqEgxqOTi4=
X-Received: by 2002:ac8:5a81:0:b0:4ee:26b3:e512 with SMTP id d75a77b69052e-4f35f3b7834mr261949931cf.13.1766503551557;
        Tue, 23 Dec 2025 07:25:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCNDdleerV1/mr7P7xnuU+g14yJD9qFowrQWc2bYEBnzRPcsjZ3dwIcpaeMjLcAMNRqp69yA==
X-Received: by 2002:ac8:5a81:0:b0:4ee:26b3:e512 with SMTP id d75a77b69052e-4f35f3b7834mr261949381cf.13.1766503550971;
        Tue, 23 Dec 2025 07:25:50 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f18575sm1401626566b.54.2025.12.23.07.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:25:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: st: Minor whitespace cleanup
Date: Tue, 23 Dec 2025 16:25:46 +0100
Message-ID: <20251223152544.155637-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223152544.155637-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152544.155637-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1983; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=FBEZSzQ0rqkvVrjYCGkubQOeZuQXJmK12Qqhdra07SY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrR5CLCbMPCA+E3qJtui3ASvK8v0kBEUlo0Oy
 NQlwLFyfOWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0eQAKCRDBN2bmhouD
 1+QOEACamFldQRPk9FJbt40Z8CFaom3KSBw0pKmn8z0AJWEldRgP1HS/UX4s6dDYER0i144hxw2
 uR4moxseidWd3P20gX34IKLMao+wSN9KLkWbS/ExhknL80EreoZeU2gDW/QapEwsyYJ9nhPCISL
 OEVSYmRU5TnuJKvciCsORmIRx2mav5ze2EBzSvvqGjUuVwaTUcJAZFmtklYltmDwU92dW7xR0f2
 YxOQ2785PllvGACqJBknyip6lqYPfWJKA8c8gb8ZI88xPceP+lJDVN/Qx2DCNEWDVGSaENzcf1w
 bQuWL2YFIMzz/5f9vKWiwfQzlj7hKFVWsNGGOQl8pLSTt+jKBDpDJpXZqw7uhlJUeXcoStLzTi7
 qi0x5H7LcZrlohKtK4pyp0LknbngbouA8MPo+/E2aZnBhqf5S5liZgvv2Xc5b66PmpqPhd8vCSP
 EA4HqT35Isk1gFWSK2gEzT0KZtyfYshB9LNdfaYlvhXH1r8N3MDJg4aLNGzWM4NLRirexwTscHB
 WhqaYDdM7CwmOUIGi2fOlGQBfTgrTFtockKTF3huEw9bNmnGRxon1k8XQsQnxKhW+sIw+HRgM5j
 BIuXJNDOyUr46C2wKZqUBNgkMybEecAEDjVa7Njg1Nhft5OBN4v6gbLEfTNWGrKGc2pKDcC/St2 ep5cAKFKILMBRdw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hILh914XLh8mcAcgW7Y-7qBk0_kzeOrQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfX9UINWS+487P/
 8Q0WGTgRGrTj57Ze6aomaQcrsfJ5aTvjFYOiRnDEDYYS0yi5Gj3RyrS4Hlg3lsTcYXMYDCL/r8y
 3I0KWp5KrxLBYa0nCVOfgeK5AiUU9D3kbKdgPe5VW80X2Y4HHYkkEg1hbsiSa4uYp7Z6rBftTLt
 EJ2tK3irtbiHSZtHy9o9PgA4tVQK3rMxPtXEa8r12PiB0+UquCdkHxJuZe9pvHjG5eshY7Rmyxx
 mCiqYqfCFIN/7H52u3IkrFudfLV2STGovnnMAY14BCfnlVaqvI/a3dj1XdtEVokMIr+cARJr3wx
 4JhM8FPSXSIcYLVvBnBTGWlYeDdvk8r00nCHT3gBmIZlSNUU9FiGxjgj41j07DFvr8sbHuBZSqe
 TCBBNeolKRQvvBHprqDr0Z7+vfqMj6MUYiM7VBFwVoer5SIc9mQiRFejVhluRRmzChv9QRIt47H
 tXdNkvCK6mPKS6d7d/A==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694ab480 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sndkAbgyudk1eiRVjvgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hILh914XLh8mcAcgW7Y-7qBk0_kzeOrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_072553_631189_AFFF7D4A 
X-CRM114-Status: GOOD (  14.02  )
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

The DTS code coding style expects exactly one space around '=' and
before '{' characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts  | 2 +-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 2 +-
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index c3e688068223..9a2b2f50df76 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -93,7 +93,7 @@ mdio {
 		phy1_eth1: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
-			reset-gpios =  <&gpioa 2 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpioa 2 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
 		};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index e718d888ce21..4a489a8d9aca 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -93,7 +93,7 @@ mdio {
 		phy1_eth1: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
-			reset-gpios =  <&gpioa 2 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpioa 2 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
 		};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index bb6d6393d2e4..0c5fc7a7be8d 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -186,7 +186,7 @@ mdio {
 		phy1_eth1: ethernet-phy@4 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <4>;
-			reset-gpios =  <&gpioj 9 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpioj 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
 		};
-- 
2.51.0


