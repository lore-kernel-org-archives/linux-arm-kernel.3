Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ACCC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNUV/8sm81bezTrvcZDm6VKxqfl3WlqL5X0WFl+eir0=; b=VXeM2VqQkjIK2cshG5Bl+qtgEc
	3sHmdmsJJqCv/rbxbBio3Qu41IeW17nPGCK5S4OKzwV3I9r+SUpvAPuJhqWXjVX6DhvCXmRt8XvW4
	QWMSg2+KwILU0Efn/hWlhBqr08YNZ8U1uDNPSsJR1FYf76ORKWYAg/SUtt6bzEKAhBNhV+n4ssJ/d
	zLBsUuiNW2C8JH3mEUWNzvM/aDr9djf+lRd1GhhkwuX+d/FHlGwDfhQVJChuMLFSQ4wgiGa3UnfIl
	j3hRFxNhx4CS3SXAHIzc5cVyyxhjdX0TOMnFh2Fbztj+pIYC7x+kdFjOdAZ8V/IJfkghhYLjcZgZP
	xgIwhOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnACH-0000000Fggh-0XhO;
	Fri, 24 Jul 2026 07:19:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnACC-0000000FgdP-2IMr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:19:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4liGI1869814
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zNUV/8sm81bezTrvcZDm6VKxqfl3WlqL5X0WFl+eir0=; b=KNjt6WWH5tvWXHe7
	unp+sXXcCLjGMuI07DlpqLnEuuZXxTbUeuBRjiFsDdILuuYdT6RQn67fhXiTDbnn
	1aNbWS2ZakqlYwG2BK0QFViz7UIx7V8dMELyVBz9DApu+AWSKN6YynjDr37j90I0
	FkmjaPqC7NzrAqRbzFP/F/PY1ghIyIpf8UGtcDzUdgK3MYkX1Lri0k5OXQGRi5U8
	/Vck3er5tUHatkQMKo0SfbU7fWPIJpMH5dJGg7QQ7m5c0lXDH4xhBHqEvAQGNHu2
	gyeinpp3e1p8LAlj6bhogJ5aqft+nvxtHTtK2zcdg5i5jvbMDxaUsJJ/uOGFJe8M
	PJ78Og==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw8mts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:19:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cae455cf6dso2482135ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 00:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877587; x=1785482387; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNUV/8sm81bezTrvcZDm6VKxqfl3WlqL5X0WFl+eir0=;
        b=R9d+C3PZcrLM2AUBs7HMH4l8Q2AZ17a2QUGr0zjfO/zWl+2BIcp01hOVvjOISVfI/z
         flohri+xZEdOr1Apx48UanLsPr8/anoR5199/5UkxLWgZ94g0BM3/s7/rF7bdprSEScJ
         np4xW5gT+m6Qeg8wBf2BQZuUYYp47z5M2oIqNxW6RNzwnyQ67auVQqf7QdEZjJSRh4by
         nsC1YG1VKroU79WSQdRytXINRJpFc30zMO2/Z0ykcTKm9/DSssyLuzSu0/Qp8km7MIgd
         GhGzRu8FyUzFcKnvRpHeHob92tvpw364u0Ny8969t18/n7ckUPRUFrnx9ta3YmXndEBJ
         rkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877587; x=1785482387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNUV/8sm81bezTrvcZDm6VKxqfl3WlqL5X0WFl+eir0=;
        b=g8SBNNGjXufcmARlExMWRZBuoMQkxS1VSwKgfELOa+6R7qLWiAhPXi6jyllffQOQnC
         SrV7pn9wTS8V8+/pJIDthtN2ml0zsbypLY6VbVEv4MLY9N9lAT1BNssRwFtC1cTdNQSR
         3durxV08yjDG0X1cQ3roke2goIZWjzeSpfpkPg8pS1lpZBodateqjeqYHgZ+HdyOKIFn
         RLSttw0yPznYyRIaBLcv0/g2Wd6ZLOS1h92E9fuN+To1P5WhSfs+kVlHJ8R/yesmy+bU
         bykAC1YCa9RPOr8flYUtwvFB479um1ZLI4t+5ew+Jf4sCl56DLQSdrMO2JME+7SisElG
         YRQg==
X-Forwarded-Encrypted: i=1; AHgh+RpGb1T2WmO77tmolrzGz6bdejae+/1fdi9Lh8+KJDrkMVHe5+aXqJLBasotwIMX40gnMTYcRur8TqbrjbjVDHyK@lists.infradead.org
X-Gm-Message-State: AOJu0YybaA73zt5v1RdbhIhn9uvfNYewnZPoDJlhTjGgd2lJwc2UnPJp
	k+PBeMkEIx7slrQNEkq994SubAxkrHen6XuWzRaLu4go1/sinuHJ0hV8DX7/Cn3NxWEGzPUGxpG
	jQq88QEd6Vg+7QFQNY9V12b81xmOS1sEhr1CicBJOFEeL8bl/P9RkPRBI/tZPn3xKeM0ZRgOYF0
	RS6A==
X-Gm-Gg: AR+sD13V8sAfi4zcusbQmBoCvF8Y0yi7gxYCIqmLqP4htjjpsHdtJAAJmiVbOGxmRQb
	SD9qI/zu2Yhtg/SOvG+5PhBrUv7Wq+PI24lr4PacLaVUVE9fth4khhlRF+FifGApwLK3ntM48b9
	XY4a1gOC+flK4FU9yte3kXYgtv7BMQM6AhEiFOWguZ8+mcINUX9gHYaDj9Hxt1ABnAmx+AYcy1e
	TafQH4wp4LIZCIUNvQ8+vlgYJyeLepbR5I46OcaH/ICmKRBN3x33dz5cns4fdkLKTe4kyO2/OPa
	O/o1ou/osR6+WDxJJKLcoc/7lTvCAylNOAlvGDoWw43eTKBqcNL1k0HCgesdp+4/3VeEHZFL82c
	Hcs+HxLCG0Wb3eB6I85y3ZfuWfi3KtRQkCl+h1tjZi8c5uyvDdEElYnALzv6ZFaeaEcQuzYrvwU
	tutjY240qzrNsfXMt0zXITmb7UK3Y=
X-Received: by 2002:a17:902:e850:b0:2c9:9a19:df with SMTP id d9443c01a7336-2cfa71dc761mr69960725ad.18.1784877581754;
        Fri, 24 Jul 2026 00:19:41 -0700 (PDT)
X-Received: by 2002:a17:902:e850:b0:2c9:9a19:df with SMTP id d9443c01a7336-2cfa71dc761mr69959385ad.18.1784877579885;
        Fri, 24 Jul 2026 00:19:39 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:39 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:13 +0530
Subject: [PATCH RFC 08/10] arm64: dts: qcom: glymur: Enable
 LLCC/DDR/DDR_QOS DVFS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-8-cb732bcff1f4@oss.qualcomm.com>
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
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=2333;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=aJgvkeU1hYS46AIZM4QP3B9a00RqrtIO/xjx76HW+fg=;
 b=hyNDpepWQq8DZW50Hf0XKBhuQW9YP8x4gP2ntWFWx1ni2fW0+zMs1ZDdZWb3Acb5szBESdj+M
 y7/hPXttUVHB9YFZsF5+60PtQo990FpWQysl1rMZga50QkgkPksdsW+
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX1l6IXtfyFOPp
 SO4FS0jOlQIH4LEP6LTka2Er+O5xn/m/bMW4ZvVEmkd5N3Zo+LWN6XR9o6OB6quJVlyQ3EhBjCs
 w9YEK8Zuf1xLUAan/KydFvpddOB+qFPKEJaKT2dBuUM0P/v8rxY91kAUgIll0mWOrCIl/57Zh8F
 H0rm03pvN6ZXoajQWPo07/nvFPf/40szrLecdriG6ohux6yW4bYLXr4QaNR6MHOfC7PQRGSeLQA
 fZya6GrPU3CuvHzJFaIwrlpQ/Nv0oXo04c6jthPmYrPhRjcmayS5R/OPLqCuARkIqHMGhDmk0tz
 ET428vRW5xkfoLwhh8JYmrck5G3i/jtNjuix+YaBjgj7cgeCn5gqZQ6gqvutjN8slkCFxwg5DPV
 I583rnRBhwMByigKoNNNEN4oo09WYWg0u7ZkRVLW+bq13FhRThgCx040bdWsfPCQVT5R4ljiUft
 iDcrJPcDZfj+KDAl2nQ==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a631213 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-olaiSHPbsRiaquSn4UA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: UczC5rQ5qaArIWNil2tFP_K_RYZ2kRY0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX9o+61zUyM5tl
 oMt3+s+43jEXUVCCHQaqtBupE4btbbjOz36sSnseWdXQS1N8Hm5QcmZPYgJ0dNBvQhz74tlpTcL
 KtNuusGkmZxujst6qBOianiyaDLF+OQ=
X-Proofpoint-GUID: UczC5rQ5qaArIWNil2tFP_K_RYZ2kRY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_001948_735678_02996619 
X-CRM114-Status: GOOD (  13.55  )
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
QCOM SCMI Generic Extension protocol to probe and get functional bus DVFS
on Glymur/Mahua SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f32af66a3f1c..32ac471e6727 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -420,6 +420,20 @@ scmi_perf: protocol@13 {
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
@@ -7658,6 +7672,13 @@ pdp0_mbox: mailbox@17610000 {
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
@@ -7842,6 +7863,26 @@ rpmhpd_opp_turbo_l1: opp-416 {
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


