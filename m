Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EFDCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSuOxyqohNyFghg6trX5SYjSHgMDEUyPSbSYNvimIaQ=; b=h9tDg1vlMsl1LL9oPWy41wME8d
	hVDjrGVeXL5c30XNJhKvtND0CwRpj8LNJ/qiklfCuKhzSZQpIG78/No/yi+Gc0teQkXu4SvOq8xd6
	WqWAX4//ON5m9lgYWUhDv4ptUu4sahyfh2bZcO7v985bhPLRSUciaBgYi2DLGRsx5BevK5pPCT3xK
	dlKO8IF/S76ReFK+x8H1mwXE2HS6as6Jhh/8qS46oONaxe9nS2/mYDoMa7Qn/nOR80k23IhZjmJtE
	HE4e7SGZKgZNC91Oa8iIE33CGfIbsavVX24wk4OJbr1V8yBBJe1qWeHynQuEfYxohAGHgAn0dveWF
	FT++NAYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEgB-000000078ax-2MdO;
	Wed, 10 Jun 2026 08:52:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEg9-000000078Z4-0iiW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:52:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7i8iC3152070
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSuOxyqohNyFghg6trX5SYjSHgMDEUyPSbSYNvimIaQ=; b=mdg5+8jK1Yod+3UB
	MKGxGgARMLz8SkRgI1AC+ffOj9duVH/OAfHgUH2xzdvKJ5raF5UlbOTRlhLIt2OH
	SP8NzjxFrruVUr5sJ/lOpv2SsTniOF8KJfVteZuBtFvA1iiNNNSx+xPCkZ/f7RsW
	sEaFXWH/neuPjJASaEeHsK0l9OSqjmhoOpMPWtM4JIzKZPpLVUynlxDvTG7cHFA6
	+awq5dCep66R4z1/tDoHRKEonOzEXNd5iBRs7yuAeMaCtVlXU37po4qSxyVP/qRg
	OGPtoIY3txYizcUplhvHvwlA4Rz1nLd3fxv2fEkjo0+rAdYP85vLs+0eXSjKxdFV
	xhePCQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwneskuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:52:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0a81c1738so38551535ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081572; x=1781686372; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSuOxyqohNyFghg6trX5SYjSHgMDEUyPSbSYNvimIaQ=;
        b=US32/IaX50Snn5YsPhy7q+RGsCLYr4uVlcMXcyKUsfWtL1MtS2t4m2fefmw1c9ipk1
         bX6rUMpnxNX4xdl++mL3HPgeLeZfwOlUYrkMKza5pzSdPUTE87GgNQzCwrmAKJRRDVRe
         5YfxznAZrrNrxkNcSqi379gBbeX3v5YSUIXetYa7dm7IYjOPy5Y5/l6n8ObOH2uQtkuD
         ++3G1kQZLY6h7OjDv8wNDTw/gQ7+HM75Pfv3iguTXvoAL9sia3jt5ICbZqHJo1nve2eT
         5RHALfJnQ3G7XIJ6Q+SW4bNyA4GtmtZff68Izh11YPvvQhZHCq9i/4MtIuzeoPJZIQmq
         66cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081572; x=1781686372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oSuOxyqohNyFghg6trX5SYjSHgMDEUyPSbSYNvimIaQ=;
        b=VIT7taZ05VKPkwPeBA7AaoD0GQcpIoSM7brzmJlKG/JR0v1xAcheSO8cPodaczAp+g
         LztKTcM2/t4zqskXdN5nQP4bk57A+ghmr25x2kzhN1inM4gkJx3TErLzsausv5IBjSAT
         OQU37us9ubwLoo4e4eVZAQIGf33J3vZEPLaQT97TmKmo6cVniFLn/O5/h6zIcupnZkP0
         O5yAjUhBPjcOW2ZbRYaOOqD3evhY55s0/KRrI/Jci1gXE53Es9gHgZfHFjebZ9ez8LKS
         Z9X2GbtJO9yIf5Aygu+hbgySFX1ngvh3LPxFcxf9tR441OL7Iop2hoo3OV7rgrEYRWCp
         AF9g==
X-Forwarded-Encrypted: i=1; AFNElJ+seyv77kKhVfBkE4MWSa+aoo9dUpePr6K1AazAy+bXnkkrwA1HKHOhiwBQK5R77xjh4mFV2w7u9hGB2zGQFI9r@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8uVXrqlm47bEnRNNmTTMOXkOEZhW7dPr5oF0lvLlzov7fLVku
	PI5dxfqy196PErUXSBRJkTuJKlHKmKClb2f8JXD60PgkK1LDmqWiaSPV5qPArtmhDDGP5dryQL5
	gLcovB1mNUIpkNYArvyzGwuM2AurHIhxPGiI6jlyr1Brlpdk9A5Zjm35ovRNIxuFybz0DVSdLPk
	EOcg==
X-Gm-Gg: Acq92OGniWR/6zYbCDHhS/GJlLmsMWPBrSXx/f7ZhmIgj6i6YFK0CGZvwTbVLJ5HVBa
	1jEK1beIvLjwal2c0riQ2L4iQgKyu+iJugvGBf4p20s+LZm1sVP/PPjo+njw0jpHOS9lAe0wiTV
	Y+/DUmdBWWBIGmCw+HBqwISP5ZS7MtcIA3mHMrQOIvjFYfHtQKmRFFH3jP/zcq7Ga4WtmTxHIRw
	PCa3E48tD/8tGMQOHFdt2kiwSi9G9w9c0bJzjif+GfRWY0TA+c1r/KpxQJ29z8g14WaXcWi6FEE
	sySNYXAtk3icKvHgcK5YJaBHhH9X8/a2SzjaE6Lgssb8/L+MYKT5gbeo0hzLZH70YdBmK89xNGi
	AIaNHpmWHpKoATkcOI9ZCvVXr/axK0tgrOafRWb1QHr3s1lbRacJAX4RAadA1DQ4RFZ6u/UKdkM
	mCpUIjI1LEZQA1yaWNyCBm6paR3K3Rd5L5KKq5ksEMEnAHYPYKKhbAjd9e9Kk=
X-Received: by 2002:a17:903:908:b0:2c1:a19:8396 with SMTP id d9443c01a7336-2c1e80ff89amr302918955ad.31.1781081571977;
        Wed, 10 Jun 2026 01:52:51 -0700 (PDT)
X-Received: by 2002:a17:903:908:b0:2c1:a19:8396 with SMTP id d9443c01a7336-2c1e80ff89amr302918445ad.31.1781081571486;
        Wed, 10 Jun 2026 01:52:51 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:51 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:35 +0530
Subject: [PATCH RFC v7 8/9] arm64: dts: qcom: glymur: Enable
 LLCC/DDR/DDR_QOS DVFS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-8-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=2333;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=4Fx1VL1dpIFfd4Qo0Yj/taSxtHb2Ax1sJaQX5XeZ+Cg=;
 b=BjKyZHKjCreiepd6S07vHbcdWfLq7M5XFoZPL3rzrC1KJGYL3mrnWvPRBNOAo0xvsE9tz7sup
 Y1kMzGHyWhRAn852ChSaz7twP6WkOVL9Kxk3S+FaEq5bGeKkbeTRDZI
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: wMYdvGT6FinJiBkbumTJkeC6Wpv0HQdI
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a2925e4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-olaiSHPbsRiaquSn4UA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: wMYdvGT6FinJiBkbumTJkeC6Wpv0HQdI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfXzJBeFwV9+v+e
 rNURJ5EjFs6ZJgm/6QqWAzSl0dQ/n3gA8s0Jaq+dWK21DQ2Fi/EXsBhDwTj0hwF+MmD35LnV6W2
 yMqbK6mufSjdz1ynPOZ/4jepKHkZk3hgeCLGoPSUjWrXvQV2ApNikdM62Ui9CKE6dbnlhmtmsr5
 MhZ3h1qYKv72ZmjG6yQB6l/cC8lY5r/MwP+A4y1/ng8D8YGWigSgIs7Cik+OmqcIEk4ilINKCT5
 r4gNkG5SbPeX1YXxB6qohGsk12QMQlYQzvHi2uwgrJhzkYP48OsyjhtGFkdRuVi0ShxAShOwS3Z
 ufcoxTs3+94oGumR2k1j2hn1jCcolLJYL+z9M4LHZ7ASMbW+0WFxa2VLvmyPAOr4M8H4MJrrHNw
 s6pUdYnYfQjqZzgJm9CaB865ezY4ng1Fj1w6PZCa4r3N3CJxV4ecswHcjtRY1MES88mYZL2Vdip
 Wq+UHsCahIEsErXHdTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_015253_231500_5F45BE93 
X-CRM114-Status: GOOD (  13.06  )
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

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Glymur SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP). Add the CPUCP mailbox and SCMI nodes required for the
QCOM SCMI Generic Extension protocol to probe and get functional bus dvfs
on Glymur/Mahua SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..c0edbfefc39a 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -396,6 +396,20 @@ scmi_perf: protocol@13 {
 				#power-domain-cells = <1>;
 			};
 		};
+
+		cpucp_scmi: scmi-1 {
+			compatible = "arm,scmi";
+			mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
+			mbox-names = "tx", "rx";
+			shmem = <&cpucp_scp_lpri0>, <&cpucp_scp_lpri1>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
+		};
 	};
 
 	clk_virt: interconnect-0 {
@@ -6919,6 +6933,13 @@ pdp0_mbox: mailbox@17610000 {
 			#mbox-cells = <1>;
 		};
 
+		cpucp_mbox: mailbox@17620000 {
+			compatible = "qcom,glymur-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
+			reg = <0x0 0x17620000 0 0x8000>, <0 0x18830000 0 0x8000>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		timer@17810000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17810000 0x0 0x1000>;
@@ -7103,6 +7124,26 @@ rpmhpd_opp_turbo_l1: opp-416 {
 			};
 		};
 
+		cpucp_sram: sram@18b4e000 {
+			compatible = "mmio-sram";
+			reg = <0x0 0x18b4e000 0x0 0x400>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x0 0x18b4e000 0x400>;
+
+			cpucp_scp_lpri0: scp-sram-section@0 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x0 0x200>;
+			};
+
+			cpucp_scp_lpri1: scp-sram-section@200 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x200 0x200>;
+			};
+		};
+
 		nsi_noc: interconnect@1d600000 {
 			compatible = "qcom,glymur-nsinoc";
 			reg = <0x0 0x1d600000 0x0 0x14080>;

-- 
2.34.1


