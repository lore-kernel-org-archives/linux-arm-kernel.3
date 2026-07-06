Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8AAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bb1MYCJKp847vDLld6R4w1OeEzf9CmRGUvqkPknJ1A=; b=qZHLibvd/M53fLQyLkJu0+NXbZ
	ON+mJo0TmOFccFgRFQ/9l6qgXC/D8ehbRWiw1jfeMYC7ELk51+D3+kHJQq6vLzDwnjhmcSXxYhMrq
	KhHWSGg0wHMble77HCLJOEm6u/pZzH4baxZvbtDZGbPJrnt9r2C7atHW6qLSFmgxq++abvvL0V7um
	GUh+hgvojZcRTXeI/o7gIHDxfiKkMtX4yF1263FDSfjcSGr3YdHla0azQ4gxTSTFksupjsUHHPp4A
	G69FJzEPzVbv612fmErzEMwTY4Qc8LlpmO3Gav2fDdjKBQIH9wxH7RoAX65C4W1jOZEQVVGk36FaV
	Dm3HFbDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr44-0000000Df3a-2lQF;
	Mon, 06 Jul 2026 21:41:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr42-0000000Df2K-2Jjw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:41:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEq1g1614936
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4bb1MYCJKp847vDLld6R4w1OeEzf9CmRGUvqkPknJ1A=; b=nA90DhtSxK29sVIR
	l1pDzdTyKyw0AUfd/wA393LEfCUYoWshsxCpLvbMO+q4EdRBSEEWhqXFgn6FsADK
	yXykI9kwXTuqVgVnp7fGvrkHV3xjYSUb8pw7Xr9385uWHae+yF04j7UmWydr+sem
	+HxBYv4yMJ/82j2RGF4TDhL5Orx8H9HRY973jbY5SoIa2FwQW0ik4vIPF5xmBe7/
	qLyMrj3cFSSb0qmlNLT541KfdCfqw5Re1sJbFpA251u/MhC5KAh0JHhFTUsvhRO+
	DX2uFpgOWJYuQ1o3x9ZgVrR18XxSFVuCnlTmFEJjPZ1//StgNAJqt2GnUhrw8Iqu
	9YlSHQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h53dd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:41:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cac01e89e3so460335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374077; x=1783978877; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bb1MYCJKp847vDLld6R4w1OeEzf9CmRGUvqkPknJ1A=;
        b=Ilt76NIjnbGuUOmLW0zLyQ4xqZeun0HbsJtt/QmngwU7yogUbpzMSNEKQ1xq/0B6s/
         9Fo4GGknxRwRrcTI5GZ3vhL9fohGdAX8CxxPV9Fuu6Oi/aDNrt/MHMGRZcfIcRyUEb2U
         dO9u4UVT9BfrBaOoAf/68ujM/zJ1wNYerWyrmPo7rrh6t0gwB2Ju0GnOdZ4A7RKowEC3
         4Pgs7EdbJmgd1KGgkICeh6aHaraG2NcvUBj931xUGMSc9+nbqw/H1FRuueeu3QZTk+sB
         QjoC0IIOdqu855LcMdpZjrEr7D60BpIWfSpRe1RHLXYT/4DtioNcZo05kjB+nuw5t9pb
         drhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374077; x=1783978877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4bb1MYCJKp847vDLld6R4w1OeEzf9CmRGUvqkPknJ1A=;
        b=sllhm7kG66ancOTsBawpjrt4GeU1DpK5hMHk1YA5LkUtP8dL7XdV2qWbBrchU43NAY
         cC0cgPWf1Xmxs4swF3Hfi08Yub+fTWC8KlumpHZ+l2SC+vDwZfYC5/ZQFU9TydZmzjzO
         6HjB1tOWhw4UC6TPAI7XwX2YfSNvou7cwefsrqIvhgWFJRfsGggKr4ZwAz51qdVJ6+js
         CIjePI1SkTwHpgUoK3NUSPGO5tpu5tjjqQofawMxPkSdlIBhSyC0NYEhOfDtr+RF2jEU
         /pUgV+vkOvjra+7vEbxVV6tn9k2Pn4Sr18Esv8LEYXHPVbzbaCiVN8HByLWkmOZ20QZx
         CQ+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr70b5N+rvEs+LtYh6FXZ5/Dnx+ss2F9sA9xy7MN/kyL2fKbSDnlgoNeSU6XrMTNySQkjeC1LJog+zRQppLDQhV@lists.infradead.org
X-Gm-Message-State: AOJu0YwTpovv+hWQX5sC0WX7IiBevro+BeIKfM3xT+RPLFG5909Gt15r
	lfgoalyBH+dwN6iR/AjdpZm+ChkQqi23bTeuISXFvJJ3x+gnLiOY+gos6EO0+vBhJB13enMeGTT
	aBL0qlqexpXeuh9imO0pL7HBWhmuOdwdm6AcSdIBl53z4KXa6WJAXsBm30abob2Zs3srDojL0ow
	LiGg==
X-Gm-Gg: AfdE7ckGzRS4Pm+xNz8teXbDyZiI1/90ndOIjt6DHQGG/Kor9jKTm1yRTpmOj6u86Xc
	Fi37+r2kDevReSK3lUkmwIPFVP1D/kK0CpXyiLlRKPWr8JiIdn7NwcSgmbXZRJ145c6lTHFYR4Y
	3iB0z2iief6JhShjYdTz6/GChBE1qnAMXJNRbXUhB+/3f8VOpCg6yVJQlkQHTUSBNkZTlw4S0Nn
	CbWCvTrUfTFwBIkVJk8NC8ocigS8wejuRI6/suNFBoEEiQLJmFPnRe60EuNvFPcbk4p5kqzo7Po
	G/RsJfMdJ/9WyjAbJohfDQLaxdSFFAxqDwlWSeaNd8Hq3JukXBRnG8rOy5Cz1i8/F9RwCX4lLbi
	5rUFQC+UvaFnxJ+UTOZ6Ns/kVLIfsEfOk5gI=
X-Received: by 2002:a17:902:f788:b0:2ca:f417:396b with SMTP id d9443c01a7336-2ccca8c80b8mr941705ad.3.1783374076481;
        Mon, 06 Jul 2026 14:41:16 -0700 (PDT)
X-Received: by 2002:a17:902:f788:b0:2ca:f417:396b with SMTP id d9443c01a7336-2ccca8c80b8mr941375ad.3.1783374075943;
        Mon, 06 Jul 2026 14:41:15 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:41:15 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:22 +0530
Subject: [PATCH v3 4/7] arm64: dts: qcom: Add GPU support for Kaanapali
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaana-gpu-dt-v3-4-8dac9a60dd5c@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=7741;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=CPu2xqs9e3R64JRB1PC2AvRPbedbXmd+QnAY1ScuJSk=;
 b=b8hcpLOUBPyzdO94qCDXmlCoK/YoeV7hzMm87PlsJ8AuSJIhCOjx0yrVrdq/rr5jTl+Cxnnyk
 qW9BSBn25kmAGG/fzRxCw5UNzN1htC2PDlexXl3Vs35XWIS7885jyyn
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: YP1oLmSKrgPhNireyA3aomYdfRraPb_t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX/ctS3gMSVIAk
 2FY9/cqlnVjI2wcGEasU5CCGRTVnkIP+KUgymjosnBgEnDStGi4n/LIG6lnKEkfp92e0q0NhLpf
 AJekIWT+l1ETqsUev/yacDfTlibeqw0=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4c20fd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=N89IwGAUvIjX8PsTpEAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX+ECtXiExhLmc
 lDeP3hLaDx3EJul+Lic8H1Z6kiHHKPPKTkle8Fmt9BWX7Z+TancoMFX2SXIDos2xfCsO5X3uhMo
 1PDmSIuBspdBOAaeE93JSmlRNLl3RAu6hc3JS/eGKEn2UL46Snf5EDQrBuNZC0kJ5Kztf/cXPvL
 Q/Fs8QAi7x+aepjUgpuFo8neyUqDpV4TtQqwOt39Yd9VVpvDCMBWWk6fsV/T3VvvkEDpMqmojrW
 KZ78AX3Kg+rDr4FIdqznzFITIfNtUdnShIj/Z2IxxqDwVseilgWfQFBhd1S6XF7RJxGW1YwJglk
 862PG+d+AAO1wxxGf1coa83cn4WtD4KygQk4+H6fQ6a+uPa+6TPvUwApXB/Sj0YdnvCMIpexbYm
 Sd0KCnJA9hdaSRbhG/nfKyD9bBWtqh3rrcEstHM1JMr+n3iXGB1NoRLCTs7o8V1DFfz8YRX5sUP
 MXAaWjdacIIpd/CZqpg==
X-Proofpoint-ORIG-GUID: YP1oLmSKrgPhNireyA3aomYdfRraPb_t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_144118_716319_854F31BA 
X-CRM114-Status: GOOD (  15.40  )
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

Adreno 840 present in Kaanapali SoC is the second generation GPU in
A8x family. It is based on the new slice architecture with 3 slices,
higher GMEM/caches etc.

There is some re-arrangement in the reglist to properly cover maximum
register region. Other than this, the DT description is mostly similar
to the existing chipsets except the OPP tables.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 240 ++++++++++++++++++++++++++++++++
 1 file changed, 240 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 2d0db71cabf1..cce2e0a3f971 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2577,6 +2577,246 @@ videocc: clock-controller@20f0000 {
 			#power-domain-cells = <1>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-44050a01", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x6c000>,
+			      <0x0 0x03d9e000 0x0 0x2000>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0 0x0>,
+				 <&adreno_smmu 1 0x0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
+
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_microcode_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
+
+				opp-160000000 {
+					opp-hz = /bits/ 64 <160000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D3>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					/* ACD is disabled */
+				};
+
+				opp-191000000 {
+					opp-hz = /bits/ 64 <191000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2_1>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					/* ACD is disabled */
+				};
+
+				opp-222000000 {
+					opp-hz = /bits/ 64 <222000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					/* ACD is disabled */
+				};
+
+				opp-282000000 {
+					opp-hz = /bits/ 64 <282000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1_1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xca2e5ffd>;
+				};
+
+				opp-342000000 {
+					opp-hz = /bits/ 64 <342000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe22a5ffd>;
+				};
+
+				opp-382000000 {
+					opp-hz = /bits/ 64 <382000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa22c5ffd>;
+				};
+
+				opp-422000000 {
+					opp-hz = /bits/ 64 <422000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa22c5ffd>;
+				};
+
+				opp-461000000 {
+					opp-hz = /bits/ 64 <461000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L0>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82e5ffd>;
+				};
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82c5ffd>;
+				};
+
+				opp-578000000 {
+					opp-hz = /bits/ 64 <578000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc02c5ffd>;
+				};
+
+				opp-646000000 {
+					opp-hz = /bits/ 64 <646000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc02c5ffd>;
+				};
+
+				opp-726000000 {
+					opp-hz = /bits/ 64 <726000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x882f5ffd>;
+				};
+
+				opp-826000000 {
+					opp-hz = /bits/ 64 <826000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82c5ffd>;
+				};
+
+				opp-902000000 {
+					opp-hz = /bits/ 64 <902000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82b5ffd>;
+				};
+
+				opp-1000000000 {
+					opp-hz = /bits/ 64 <1000000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+				};
+
+				opp-1050000000 {
+					opp-hz = /bits/ 64 <1050000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x88295ffd>;
+				};
+
+				opp-1200000000 {
+					opp-hz = /bits/ 64 <1200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x07>;
+					qcom,opp-acd-level = <0xa02e5ffd>;
+				};
+
+				opp-1300000000 {
+					opp-hz = /bits/ 64 <1300000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x03>;
+					qcom,opp-acd-level = <0x802d5ffd>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6c000 {
+			compatible = "qcom,adreno-gmu-840.1", "qcom,adreno-gmu";
+
+			reg = <0x0 0x03d6c000 0x0 0x68000>;
+			reg-names = "gmu";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_GPU_GEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "memnoc",
+				      "hub";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gxclkctl GX_CLKCTL_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 5 0x0>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-475000000 {
+					opp-hz = /bits/ 64 <475000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+				};
+
+				opp-575000000 {
+					opp-hz = /bits/ 64 <575000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-700000000 {
+					opp-hz = /bits/ 64 <700000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				opp-725000000 {
+					opp-hz = /bits/ 64 <725000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				opp-750000000 {
+					opp-hz = /bits/ 64 <750000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+			};
+		};
+
 		gxclkctl: clock-controller@3d64000 {
 			compatible = "qcom,kaanapali-gxclkctl";
 			reg = <0x0 0x03d64000 0x0 0x6000>;

-- 
2.54.0


