Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55D8C55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 15:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1RU8FAh+O/KkJCPmZApbQw1muC8TBWf9MfayplznT8=; b=dCc8f9ZJ6LMPqvtuOZ4u/aIVFq
	Lq7VaSE6Vm+s/a3IpAq7ASX13iRaCI024EAXTQnjQOF7l3xRh58yaoRd6ru4Mk9mn9+R4MxHTPOrM
	lnhPrOPKoQcttyq6X7223sn/jDxeVKhmydBnzbWYLkZbzVqKGGaHHB3mVadpADGuvC/1cDdcuOxVb
	7LHUYY63cpuZ34Mj7KRuqGXelIuknu53Wt5GiczgnQHSRHHlK/n8e/1ho4l+jTHK0X2dh3kGTHCm3
	99LNKGjCOyWdv8nS+JqgIroXgrpMjGv8AyeUA8iR8Tf8T11IR/xSorokiWL4CB8KpNrIjPebj1wxR
	MNUOznIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBJ4-0000000Em9g-1nM1;
	Sat, 01 Aug 2026 15:07:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBJ1-0000000Em8M-3Bpv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 15:07:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CaaXs2738105
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 15:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r1RU8FAh+O/KkJCPmZApbQw1muC8TBWf9MfayplznT8=; b=W/27Q2JJZuefDriN
	PVFshZVngQRXVRKfcxo0g8iwOmM3AR4qWJ88Pl4U96cOR6B5vo1pqxiP2wW7ZkEM
	Bk+vnAyK34GpkMGokQLablxeLVFZNpVjqQvLolnv71JXKSRiNu38r6cNfHYT+sqg
	fOg5SjVDjTOzWCplEBzYoD/bGEV9ciwq3/Z8cDg+rbI7o+/GhOEOi+jpoy5Jv24f
	Rhs70stz2tgd37/c1gWlHeX+R73SOANfBeBK1vxVd4z9DK/LJ/YBjUKhiKt/Zu/X
	7RxNTSVnZlode7vwTpfsVNtEb8AwUrFhFTYNYgJwgTVL/FhTqyHfii5vAGaETyqn
	Oi+5Zw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa380ybs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 15:07:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ebdfceddcso21373201cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 08:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596838; x=1786201638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1RU8FAh+O/KkJCPmZApbQw1muC8TBWf9MfayplznT8=;
        b=Xew9VcL5v5r1GGCyTaSIWdJqFtpfluJkzpzPIZzo74cYFz9xq8eBEIvvt6lo3tY1B0
         P4oi18sGfN0iwlBQ5RQRldPg2jzNMXUkaJuibykx1TSJmbn/Fw8k1nvy0r6C9EnD0ZUC
         AnfgWwVJxTJc/2z22oDe8q1Qni9owkVX14lp4txu6b6/UlXKjOshHZ6voYd1wEVx1jXt
         59lL79vPwHbKBiv5A7EJ+MGMOS1mqLPmGgyxCoJRRAqf5X8nnJW3ppa/FGZkUrgUtGyq
         /mWvZxE1d89pT/UN93qy9zQl4dz96mRW+hffe7nNSp23qrkc844Pnt0NBOcQljUnoMlH
         PFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596838; x=1786201638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1RU8FAh+O/KkJCPmZApbQw1muC8TBWf9MfayplznT8=;
        b=VMr5AltPms3k8tJkzD2TIHGxTZKe6zCMVkErzvxSvpHGY3PoAfgTOswr25VK/AhMX4
         3PKjib7KKLeRaj98qp0xbz1H7orwAZmbaDl2q/yIpEnZ+jZgCEO0eIE1Hpd9Kx3gurLR
         cIBRcRg3WHCk+r3FXVOUCfJyBzQlaSzyQUpCeifTYp0kVBBsQiFBDUD82ql2FtgLo9s4
         VaIGZ7bHWB9thbe7KTznVY21LO8Vfe4T86QZLnCtLH88kA484TjUGBad+T0kNLp9c2p/
         JfCD/xBLtkbIzmC2N8VlvLeGCg6mYdo+C7MXpAV2J6+HV9l6hyfnf+ZaB2GF+mY3Zsqy
         v7Ig==
X-Gm-Message-State: AOJu0YzObiOokO1ZMMJ6jW43lmFt7zy6QgEHn6t8gX8OasSEl9m0oPvh
	RwuWpk84Zq0UZpCE1PSvmxPVX/YbbjvlyRSQWIeOorlhmxOcZf3wSuA3qK5gXdW5zK0qs+Fcziw
	LIub5SgWiGPNC5wZ5wGmPn3cVqU6KiUtWHx2+0wFrPiWL5IL6i/XbK8O5ICUbS4mye246b2ACEe
	xaUg==
X-Gm-Gg: AR+sD10HW7GOmnQwdDzkNoQtujt5ArKUKR0WsZBM4VGWe2wR+DvE0vLPwtR1Sw70wxa
	IbqCnyMkNeFj49c+SFomOgT+tq8pf0XItE2IuxC5I5JOdJF1s6q730hmUu+HhoQDopZZ5OQgFqh
	ZR/sUr/HfK5MyKyb9zTu+eiWp8IKa+8HdzxAI9uODMJlBT3TxEmKhaJiVGh729Ucbf8yft87bW0
	bvkAum6aJZWrKN7xdAasgGY4xIr3/GOYbfMXjkPUW6pwFKD9/Cgfg/4+h22T5RJrTMbHlGg4WnA
	302YuoMDoB6XguyDQTl49sudTOnLCWHm4dNDIXQjYvakIQ5j0U7eowhS5/Wzmt63HgnQCm5fEXn
	4OP4kytwy4gYiHjhNHkTRu2Qw
X-Received: by 2002:ac8:58c5:0:b0:51b:fd82:22e0 with SMTP id d75a77b69052e-52b5669dfcdmr78587691cf.3.1785596838035;
        Sat, 01 Aug 2026 08:07:18 -0700 (PDT)
X-Received: by 2002:ac8:58c5:0:b0:51b:fd82:22e0 with SMTP id d75a77b69052e-52b5669dfcdmr78586641cf.3.1785596837600;
        Sat, 01 Aug 2026 08:07:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm16005222f8f.37.2026.08.01.08.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:07:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 17:06:58 +0200
Subject: [PATCH v2 3/8] arm64: dts: exynos5433: Override thermal zones by
 phandle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260801-b4-dts-coding-style-strict-v2-3-f09a659ab80d@oss.qualcomm.com>
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fJiKAJBCPPlI9UZOKJ5ojp+QO0sRrADx0Cv1xw/PsMU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbguXFoJDPX2kkuBG7S31hBmRZ02B8Np0kJXs9
 qHpMHwPgUqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LlwAKCRDBN2bmhouD
 1+OTD/9ajMyNThGC6tmXV84qNauvqQSk3UpfCUgnQ+peYuDyIDltmNnbuL+E6KrvkBum7303mOX
 l4uVy73MdU1iUErojVTcESf9B+dLsobnar7aSmSwBKoI7KK82/XsOh8gJEjT3AV1qsy5HQOF9gv
 Cacer0g2Sq9YXGs/aamSdCC0KppIwikWuJBPEDYlrKiFUtzIsxEEPAgIN0FTv0rC/Blemd6Bqhj
 MCQ1G7/WP3gmPYultx3ebVX8vziIM4kf/SPUsyHNTKhx+Wr9qpjLYbDGCpd5ZiRRkwqTIKF+2mk
 Bu3iM4wE0XWnI836uRcMdZKLh7VQ/hEavOf3Qoq7YlvTO9WwBAdJ+1KqK218BiDnCsm4ZdjbYVH
 OSwKOLp4SaIggID5L7lUbvKaAydJb1gWN00msAAzaKhKLYjNabPdGCG5+aD3acON1ny25kZizMN
 pvJjFb3rigWiZHxEiHmlPWh+gztdcv53WibZPoqMAtyAbQYI039l7+j8HHqFWlD2e0XukoXwz7u
 2ew8UEcuFJoGqXs8BXYHPowj7FmUQmjVzIuLCCb8UsTJ7IjTO/KwDbwi9I6frFYT0OqWjV2C+1t
 Bp4JaaUgFGB3QwQvnFd4U/4mSvJ3uAwyjmV1T5SgyNXfdUGn2OAz0uBACxrwlpLNTlZN3yKzjcb
 SFKmflWDLe0lnlA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a6e0ba7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=51BPPbBw82Ww1msbaCIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX6GtwESYgzQFl
 7cSJdlQvMtMsdKxeCkkEoce2mZMScS81Dtjh0dz2U8vPx7CVXERGz0jM70+CDCZnDZO3Xu+pv4b
 Jz8epaKQH+Zp0O/tXMm9VNO2RiXhpAw=
X-Proofpoint-ORIG-GUID: LeHrZMkBblL3izHsVgaca6Fwc6YSQ1L0
X-Proofpoint-GUID: LeHrZMkBblL3izHsVgaca6Fwc6YSQ1L0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfXzYKNY/INV5m+
 KOEZ2+eUYru1FUbchXbkD+IqxArF/niHIbPFEdun22w+7NPTftuXqxz06npEbsvtO3y2nJA+KJS
 NwhtsI3lLzyJ/JbB42xu6qUunrKrYLuc84qQguYIYN4qVXUL7fMwITI9EdNB5pbGtEF0yJ3kpJu
 DfPalDSsiE+gD7s01e+ic/YL+OH2af3hrgbWgXoPwwIbYt1qn8NJmrMyM9N0NM9MVdz4/zvPpPX
 a+uuLoh5OHbjqZHcFJ7HdZtqBEN7FRG6Ja8K6Cz6NeSH43Tfpuzm0Iw4XTJ4RAVgwSRb1c5Hdrc
 l2AEbW376U5AjlNJWyBwEjQTu4C0FWsTQ/jWrCwK+1Z5GyGdJlazFRrMzOyl/IVSqz3mbQD+JkA
 /2QLkLMOrzFlDQYORRMYGY5QUHuKZmk830mBpbSd8zRn7uHi+TgPSRgUJo0zvDosFssoh1Qn1Vr
 UD5Hw8uzn23E+oRH4mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_080719_803146_6796B546 
X-CRM114-Status: GOOD (  14.70  )
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

Fix indentation of DTSI file with thermal zones (two opening { brackets,
but only one indent) by using a safer choice of phandle/label override.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi | 4 +---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi     | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
index 57b335f579d8..a3ebc49fcd36 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
@@ -7,8 +7,7 @@
 
 #include <dt-bindings/thermal/thermal.h>
 
-/ {
-thermal-zones {
+&thermal_zones {
 	atlas0_thermal: atlas0-thermal {
 		thermal-sensors = <&tmu_atlas0>;
 		polling-delay-passive = <0>;
@@ -347,4 +346,3 @@ isp_alert_6: isp-alert-6 {
 		};
 	};
 };
-};
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 5fc3ca233ac6..ebd63b9e244d 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -2073,6 +2073,9 @@ pcie: pcie@15700000 {
 		};
 	};
 
+	thermal_zones: thermal-zones {
+	};
+
 	timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,

-- 
2.53.0


