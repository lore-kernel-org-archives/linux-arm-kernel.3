Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEEBC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GZWW0Xx4U3/kpLuB9bQNMkOy/eW94JZJBcjM0KLNk8=; b=3tCXSpNKBTDaj32qVhqKQtFU6A
	xblBwotqUdKEfjTTyeEzFBw4XovsyjiCdZA5hemDgt6mg+eUG1HNgfCu4duN1U7d/BVtWIIRztFCj
	9TnP/Erevr8xEh9qUInY+IU7PUhsPCJKEuhzHBzW4S3nk7pxoHwTq4HV+K3REe+41TKbeAr4vWvMZ
	rGgTYHANxIN2lbplYU8nqQRJkvT9j3kh4DkQzWRMQ6SQeJZ+7JuWcrXgezZZTuP6wjwk6Ch/C4rBF
	m3JNce+fy2jZohKp/VGS75NfZlMc1YDZbYr1ifg79TegTxUS/zhzlkWKJ4FHd5yY8blQmBkqHaHjC
	BJOV1e3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnACV-0000000FgrS-22f1;
	Fri, 24 Jul 2026 07:20:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnACJ-0000000FgjA-3oH0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:19:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lB4q2137557
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GZWW0Xx4U3/kpLuB9bQNMkOy/eW94JZJBcjM0KLNk8=; b=ibnSl3fQ7xJRrSyG
	YLY/8W30sAW0GSHBO5CozqId0PrY7Fc12xuu/pDxXf883QPibNCVAkcWIqAvehZS
	/pirbRllCg52XpYrpaimePc+7V8/yjFpOAw/LIe9iyNRawlE02fBBK2jnw4/ro8z
	vV5sptCBQsT4KOXgsxX0bhGHoK5SxMEzNi+aF2kk6KKQIJxsOCNsEZOwhFAVGZld
	OglNnU1akQlCYiYFvb61/CnStlljFkTjtJSqvMZhw/AJJYexbSQUG3uGbw8LZqGT
	oEzG+M1rY8+wuj5RLO3GqoDtEWBZ7DoQ/29d8sy20BCXS+JYLDPxv2TMgbbg8v+w
	kSEAgA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa1amyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:19:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so3412825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 00:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877595; x=1785482395; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GZWW0Xx4U3/kpLuB9bQNMkOy/eW94JZJBcjM0KLNk8=;
        b=Tj3yfjO+uXvpgNmS/mHv42jiXhdu4ofuCCXiWAi+lJaXopMo8N+LTjZPNPJp1GRYlp
         V+M/f7SYKoD3LeZvaGhicD64B9jq2D4Az4f9Q/AAB7iK7J2RT+wdfdpf85/9OxsGPM6X
         V5i1rDi3Dbpr6LWBab8FuIso3tPNqCDgEgnbHUuKrGKhYoQDw9Xsrl1+9Ijeku0c5Wbh
         xjFgK+2rcssZTOtAPGhGLNLTLw4TdOIoZT0hyb7MiAAoOWx48LP8my94L8OhrdjwRwux
         a+gDbN3/lwvyIUzby//CKo7A9BgF96uv822ZsH6yPzpvjDQN00npIq8TY3l0vee1hzII
         JB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877595; x=1785482395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GZWW0Xx4U3/kpLuB9bQNMkOy/eW94JZJBcjM0KLNk8=;
        b=MV2DpHLqYHUiHZIliM1q6LWIEni/mxcuMt3sUaJnZbK8jcwfs9Wj7r500QHd0LuT8O
         zU4tnIBRC5zSLWkJ07Hp7u9ofwNHqxvMstow2kJ+maVO/SsgV0gt7dQ2kVKOb0Dup+hN
         a/uRfQMP3bs9KBjLDjfZM+byxrmVJ4SOkffOo73SiO3tnyBjo88nEpQvRsNHNdpvE0T2
         JWdTA/OVhR9N9VumbXK8Xa2KNpbdwX6gwZZMpwNWSw3AOPDN2RG40QpSh67/0AEloOzp
         lMVRIqvdxL2k9lg3+gO8cdDwnjB4eInNuMLP8xe2n2aCcbGrdKPnxyEnAwnPC7N3UFFD
         AQCg==
X-Forwarded-Encrypted: i=1; AHgh+RrosDQXeLlFJBGjd5gxYRIi5fZnzvShGhmrxj7vL46BDOqfOb4PS6YgExW3izmHG6Lh8pHsocZHKxEl8FYddbv0@lists.infradead.org
X-Gm-Message-State: AOJu0YwD3CSIwIb5CaGZE+aIlMmf01YdjLwYPoBZXFzkpupvSb2Lw93V
	wtHS+GcudIYiOvimPgtxJZu7ZMM0XU6P0R6J2sEiB1qWnuRps9cfcOi9ox7b8NNZPIdgYws4WOp
	Fwz0Ti84nlT0pjwviAn05g5FtqaKz4yhkE7RrYUs/jGwFd9tUdrsT7fykEUx/g3aXXUiNUtkR4c
	PBtg==
X-Gm-Gg: AR+sD10scMCmhpziKjylcyeJ/ys6MZGkwDu0TIPlGccYN6jOZglNRgw0PfY3qD0VMy4
	3Ih3Ft9Rrz1J/Fy0CsDhEg3CLcMm59EYohnN5zAkd1T3HvjFEtvo1Geq6OYKJOziyv8ZbUteZsp
	TmhnB7XgG6uYY1WIb/eCPmVikoDJ1cRyplzA+fvRn7AzxTPl7OY88BcTxfiv8/e6x0hQiFXJI1Q
	B5wS8/O88NUD2LsCeg/ykxZGa916albLufH4f7wLzO1iBqAeMmU+eIDvAUpoQnzKWYReKUyjZ+m
	5bP6/guwXZrn3Sh8KmadWOO0MfmyBMdVpc7/+YNV0HBYlWmkUSt3xabZMcimeaPpqeuNmIdA11p
	EplGidLdG1Y0YLzcwRxahMjAXHbvxr+Wq9g48zI0obo25fID2s7lu/Zq6nFvz9xejXs1Eul+M+5
	7pT0jMVnjo7GpyFR7OslDSLmpPePA=
X-Received: by 2002:a17:903:1b10:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2cfa7435a36mr71420825ad.14.1784877594717;
        Fri, 24 Jul 2026 00:19:54 -0700 (PDT)
X-Received: by 2002:a17:903:1b10:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2cfa7435a36mr71420595ad.14.1784877594276;
        Fri, 24 Jul 2026 00:19:54 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:54 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:15 +0530
Subject: [PATCH RFC 10/10] arm64: dts: qcom: kaanapali: Enable
 LLCC/DDR/DDR_QOS DVFS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-10-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
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
        linux-tegra@vger.kernel.org, Jia Yang <jia.yang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=2511;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=RRRnlY8bGZF+Ix/OI25BJOg4/PDL2F0fBt3FTJPUD4w=;
 b=Ot/2FakveQieb9FjNIaC8Eh8UzyqnPZIl04ZXlXEwPmL4WwfHv5BdmPf/4u/1sE4diECf+Fzi
 z+UeTkQi74gBMDWhyksq21XsTERa3lzeFSsIje9jS5gJrlPZEsxfqRp
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-ORIG-GUID: lY4YD0YpverCOvnQmp5zHHqh7CO4MsDV
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a63121b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-olaiSHPbsRiaquSn4UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX2ONlimLi/ED9
 Svkc8e0OW5pXLTenZVv6RLA43KEBdOMH7INo7RSKSssoqX5qed3w4eCawSbRolEXcCS4WnXDATG
 NoqywwZ3uHyNLrwZJSLMAX8VanLUzp0/gqmxEa9jILcNDT5CyeogHJLOBk39ll87LOdQQLZedMH
 07dsPNTIQOeJh2ytuhrGPbNTTWJHc9cGZBtBMAhZNBH0pwnBh1rhnXfEzUAI7s+DrZJm1ayx0LD
 MeEbOIr4PcQxWkeaFyxappES/4qFNTkkSC8DaBnvKYGUPt5nD1MGMFjPw6HX9Av9fKvTb9IS0tO
 8ct4AePA2eqlNEgzpbfrg3tHlNeoIMg40IjYtu0TM9AdHNS5tiYrtDJXZBNvEX5DdyNY1Y6UMF+
 H8qg4HlyyJagNKKP5gAnwOHBGGzXT+kMyYdWZOhxueiBEABAE91XHF+rdYgXvyT4bZZOU6x4NA5
 IyVtF8k1utCIEnu24EQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX37rbJ8CU7EVx
 ddx4/hbNpCqrJcNHERm98+jqzMUm2fYm0DbKdA/PyVAGVzIic3d3y1NhIOYQ7ToXaAnl0rubEDT
 UAjlf4sAfCsECCib3065nPLQr+xWWo0=
X-Proofpoint-GUID: lY4YD0YpverCOvnQmp5zHHqh7CO4MsDV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_001956_063572_63CFE6F5 
X-CRM114-Status: GOOD (  13.98  )
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

From: Jia Yang <jia.yang@oss.qualcomm.com>

On Qualcomm Kaanapali SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP) and are exposed via the QCOM SCMI Generic Extension
protocol. Add the CPUCP mailbox, the SCMI shared-memory regions and the
CPUCP SCMI instance (scmi-1) with the Qualcomm vendor protocol@80
required for the QCOM SCMI Generic Extension protocol to probe and get
functional bus DVFS on Kaanapali.

Signed-off-by: Jia Yang <jia.yang@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 74699bc3eadb..594fac6d27bc 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -240,6 +240,20 @@ scmi_perf: protocol@13 {
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
@@ -5756,6 +5770,13 @@ pdp0_mbox: mailbox@17610000 {
 			#mbox-cells = <1>;
 		};
 
+		cpucp_mbox: mailbox@17620000 {
+			compatible = "qcom,kaanapali-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
+			reg = <0x0 0x17620000 0x0 0x8000>, <0x0 0x18830000 0x0 0x8000>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		timer@17810000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17810000 0x0 0x1000>;
@@ -5965,6 +5986,26 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
 			};
 		};
 
+		cpucp_sram: sram@1d838000 {
+			compatible = "mmio-sram";
+			reg = <0x0 0x1d838000 0x0 0x400>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x0 0x1d838000 0x400>;
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
 		nsp_noc: interconnect@260c0000 {
 			compatible = "qcom,kaanapali-nsp-noc";
 			reg = <0x0 0x260c0000 0x0 0x21280>;

-- 
2.34.1


