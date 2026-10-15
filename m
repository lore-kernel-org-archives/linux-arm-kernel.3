Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B27ECC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fE1exKssV2qfOjHjVoRaELptiZ1wBqEO5jlvibdDEbE=; b=l/EQBLT37aDqoUgkdMaIBGGH2B
	vmOrlN+SQ07l79GUfxalWqr08k/PnR1g4pImeBHnLewMeLn2eLMJi8aVyaltMcvS08XsoMDXLam0v
	YelqmfTki5jiBcba6XLZxtnStpwQ9HlK/nNLdkZf6hK4d2+s8SijBTEtPfthjL9VUFLcYNoPCtIIV
	DwUARv/gCJrz5Y/5zfD21KqBifUb6kZgaM4yqdY2h9ATOJ00bz2VQ1kcDWKmJybu9G+jBvfFsjh0k
	sN3faxoTGvUCAnN6Q7INZBnsac4nsSR27BjGv9kpOGFhkwCTVSLqQluV4Q/R+Ji6G9ZUOrtVwSrGv
	HT07OwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIBW-0000000HM5z-3QgQ;
	Thu, 15 Oct 2026 09:55:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIBT-0000000HM4g-2lxR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:55:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jkjZ4011197
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fE1exKssV2qfOjHjVoRaELptiZ1wBqEO5jlvibdDEbE=; b=CtdCMIcUK+XrXc8y
	IcxiitShv2sytA52Nmz2q+OQZt20rBDdoVsloSjnQQ4K0nFoP16xVil6Mo74bAYZ
	9Aj/LjaC9V6jezM+uiuxoofnSZha1lPEBG+B4wTKgxzSNpMBZHjXNlA3+TAJDOPo
	bwGAo+kDEoFcZANNTw5p+/AZFMuqvq4BKW2iAA/qQ/9Xn0ZKTvyAjO6FayEbaWmY
	L5J3rgYhhX/DnfNNfNrYtYNVs/tV19g7zuKqHYvDCiwgtRDXcEjkszgL2ygcTbQl
	ayjk8DS0xAE4myew45jxQiHfjzSpt/4Eo6XJPatXqvXppGhEFTy+GUvDibUuRbdb
	jtUv+Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhbtm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:55:35 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-156b5338d4bso1824060c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 02:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058135; x=1792662935; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fE1exKssV2qfOjHjVoRaELptiZ1wBqEO5jlvibdDEbE=;
        b=i0Z8LeN8EvYud3nZS8xS2QUIEMjzmCX5k0hKUflWXwd0wHEQRMNFYA2W+bRTGVbCNZ
         HHqAyAH91VnQBK+LmP8ta7l8Iq72YL4naAYJnZ6vMqmRq4FkjPMMUD4g2sBekNdJNVPZ
         oxFtoSBiP58IvENicVeOd+EWRRZ25E7gr+AgQnN3v/AopnNFplpJK/jf0/cyHXJqlmQi
         KfYJ90aySC4J3Cq+6YOvIBVchFwdnWhzEPot8V053PahCuDOwEoHXvPTbVVj/uA5+8nY
         P3OZpbdp5ecj5Ywfl/HR7SEvAjL3WY5j8ViGFA6ZG+ezvylfC78bJy3U66j43U7PbG8D
         zUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058135; x=1792662935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fE1exKssV2qfOjHjVoRaELptiZ1wBqEO5jlvibdDEbE=;
        b=hejRiiX0/Es+av97sYfF07pchtYtRjTxJrOXOSr7qtbSsSXozPBWYt1ytaPBgDFsjK
         uWE/PMnqPxXGpVf2ZewpqwnWZCbtizdEYC3wVbil2ebw85+IRYDxB8MroCQzXqCwlKK8
         IB71qg47q1tEQcomtwH5G1VhpKc4pQymJkXS4awsduhp09qlls6Tm/Sw0bt8r0GHfc1c
         y5MdnMt308a5TNLTSFtYTFWzMBjPkDAOtDhPSVgZSqCSR40tzAW6EUDdK9kgj4NxSO/3
         N0yP4BWV7Z3FRRTtkBqi/+Lq7S3Aa1C3m2MN/b0jb0QOzxZFR9aoeNllP975IVTQFuE6
         YdBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8rflhXGh9Fcq0n5/eEbIf7idhSIUPsN/BfaazIb7Js2t9NJWw6XNBgPE2ByBlQ3fIUeMWCCFb9vgf0GYgc12S@lists.infradead.org
X-Gm-Message-State: AFq9FYJgicnvTQmn3CYWSfl3w7zmY4/0Lh4wWfHJLmu7tJPuuMQZUttp
	P0bRur1XXgY8ABK3gvjDNAL9rfUnpWcdkMOOVE56lq+ygjEbCgEWZra5X/1mt9zC1Dn+aysL6lV
	0JOOomQIGVyuCQMZHtpAdNrGdI7x/JvgKnioLpjjiW0Zx7jnji9ZPX4sOFb6QKJV7YZCVJlNIz3
	fc/Q==
X-Gm-Gg: AYBFou0/HBGZRrSBswqDf/AimSQisdiz7f3V+4/fwiYnjLwiYmsllvXP2PyzxD04fKD
	vdwIH74zD0xHl30+GsybZ3ObejT13mXbvTWbWriXqAMfJt71xgRNBFEM2WSUpIMCHLjX8DUVPIz
	6g+8vrWaWJZXhCIV9VQe276xbQDEEvoA2BNjDQXZAsxu/3WMhHT2nOXIKj7UFU/1kGduTzCgj1c
	AOYV6ZKsf6kOb0dJSTx9+VFlkdg7I1rYR+Y1pKI+IloXpoBgV1j32HsJAlwdUEbzoYZPk/+toJ5
	jakjhHcOQKgARp3VyCOx6Dv0VHyGcK9VZvJQMlXCZvu1+7sHp1wKGJDTDojsJ1G+NSSRQ5zIEkJ
	pvC9w6r0CxysKXSj6ylduYBkm19dz
X-Received: by 2002:a05:701b:2512:b0:16a:8ffd:4977 with SMTP id a92af1059eb24-16a8ffd49d9mr20307285c88.17.1792058134529;
        Thu, 15 Oct 2026 02:55:34 -0700 (PDT)
X-Received: by 2002:a05:701b:2512:b0:16a:8ffd:4977 with SMTP id a92af1059eb24-16a8ffd49d9mr20307263c88.17.1792058133920;
        Thu, 15 Oct 2026 02:55:33 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:33 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:17 +0530
Subject: [PATCH v2 1/9] arm64: dts: qcom: shikra: Add CPU idle states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=4467;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=wb3EvT2aSl7klz2UgJHQq0QEIeAXIx4uIPM2LzTmY2M=;
 b=qU3lNFGQgQYnbIWoAxUGGmhIZhU2+35sGMbVEWluduIDYJdEVd0ns2srHaOoFurCtymLVK2xg
 lIYELgHvuW6BbdnhE/S4hQ+1zJNuPpsGd7hzLQWJrcBvXoHtxm4OO0F
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: W7_2Em5jLqPJXtBu4gfgJpD-b61hV2BZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX6SBBqJPRJqTx
 yu5bO/exQUuzVfRYVovS5T5lKrXMBQHG3E1rP6oEH5V2/Weawff20lhax/JX7Wwf43vth6v0FBS
 6YKLP2kH25M5bus/idF1NQql3dJ3O6U=
X-Proofpoint-GUID: W7_2Em5jLqPJXtBu4gfgJpD-b61hV2BZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX2R2d6uGLpbwa
 atawYHVbp3XMCricGnBCX/lq/sbUQrdrIj/Iw4sDtKkWqKdtQREJPnd0/GwoDb53mjw25/eNZxB
 zVCXiTqv4DyIzL7eGYXsexGBtvbP2lDwkpF3XqHtykoR6kLTgimhobTFdOHHqPk1m+UYybaI+Z2
 JPNyr4M2h/1zGDJiaSrqqhFsyUmCw0Zflz2QzxQxbFcxkJb3CHIKghmUFNefwC+Gd8/pRDKlTG7
 kCz4HAkQvANpwMz/gRtRx50KiOkVxfWFH4BXoNnSZdpkpT5BL3Tw4//zjL6GvBU+3bgzrGTnygc
 v3O2ARc/kdppG4B10d5LSakCFJTAG/JnFJPIBFoQ+kTnxVladeh2BP7F0+IAy7VI+kP/rktbqch
 yEJZnUmslJrNqTclLHdeq0XuIf0w89f1Wi4T1EWCulZemPJmkGtK4Az1SF8w0XM6sV6PdX4NsyP
 Ccyu8x5vDuEohgMLG6g==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad0a317 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1ktBgAoqaJrOdt2i0ToA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1011
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_025536_168758_0704EBDF 
X-CRM114-Status: GOOD (  14.07  )
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

Add idle states for the  CPUs as well as the whole cluster. This enables
deeper-than-WFI cpuidle.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 93 ++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..df4a7181ff80da0b75287bf4b96f82facb152b46 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -40,6 +40,8 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -50,6 +52,8 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -60,6 +64,8 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -70,6 +76,8 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <489>;
@@ -105,6 +113,61 @@ core0 {
 			};
 		};
 
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <549>;
+				exit-latency-us = <901>;
+				min-residency-us = <1774>;
+				local-timer-stop;
+			};
+
+			little_cpu_sleep_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <702>;
+				exit-latency-us = <915>;
+				min-residency-us = <4001>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <523>;
+				exit-latency-us = <1244>;
+				min-residency-us = <2207>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <526>;
+				exit-latency-us = <1854>;
+				min-residency-us = <5555>;
+				local-timer-stop;
+			};
+		};
+
+		domain_idle_states: domain-idle-states {
+			cluster_sleep_apss_off: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				idle-state-name = "cluster-power-down";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <2752>;
+				exit-latency-us = <3038>;
+				min-residency-us = <6118>;
+			};
+		};
+
 		l3: l3-cache {
 			compatible = "cache";
 			cache-level = <3>;
@@ -144,6 +207,36 @@ pmu-a78c {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			power-domains = <&mpm>;
+			domain-idle-states = <&cluster_sleep_apss_off>;
+		};
 	};
 
 	rpm: remoteproc {

-- 
2.34.1


