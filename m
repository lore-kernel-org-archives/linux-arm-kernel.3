Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD32C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQ9M/4GETx2H9TaIH+gNmu1Gg6SM2o69SmVk1KgoZxg=; b=Ktiqln/MntAGqc+6aaFxip273A
	h9Oswh7WhUAYJIHqb0fgbzUAPulK9JOjQIDlRjY9pWu8apfrC4KbV9X8A8EJiKFaUWdaAm2GFYIcI
	Ycs+T96gR7d5K0kqWnJsrziEktjz8n/Fyd3y1/lgvAiIMECDHYnFgR7ZsQkXREfI+hJ+ydQYsEd2H
	I8cD9fjPdpLQj8k5t/ktDrPNpp2qM6pRChCboyMgSEH0SCwJrnUA7xZovQLO2gBZNqVkHzpYx9hBK
	XrpsATBZ6Yl1hQ5cTA2m1vIqBLqBMOFMKMTIHb9PfMDmlG/ygih3AKSxKpO4KTdsFLbgZRdvssySp
	Pg+zt1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHnE-00000009585-3KxU;
	Sun, 05 Jul 2026 08:01:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHn9-0000000955I-1oLn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:01:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6652gob4519328
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HQ9M/4GETx2H9TaIH+gNmu1Gg6SM2o69SmVk1KgoZxg=; b=cC1TzVjM+aQ5i25p
	CqQ8uKZCejk0meDh+G6X6/lLS1Tc2HdI8996eWYDyjTJNLGz/bzVg5GEl/Ow0wSM
	px7b/ZJuiCwlvnyIM27S8jg35QHM6k7f6vXhaTJUZ0b4d9kcFjxuRLVjU/KEcJ5e
	VboHEkz7v2zA5TUkRgsjjt8X5amJ5eL/3F9UUbxQgb3AckGcGrF2MMK9FM7mnZlj
	LdauW0SKv83vdGsypcC6U5tZE0J5UdL5o1xbdTLVNVDKTgLWbux+IBBasMpEdF5m
	NzbDH0PSQNkriDn01UD8xVZcXEr4vMfD3G3IqvaTExjU+9Z40ChtrPPDV6clDQKB
	VpWrtA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3a9xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:01:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3840994b0d2so1320194a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238490; x=1783843290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQ9M/4GETx2H9TaIH+gNmu1Gg6SM2o69SmVk1KgoZxg=;
        b=BHAPoVJLP2S2ompfQkCH8DoeYHU5Dj6dMnS0CrDq9zOEf4pXk5/P5PDHDUvOLQDyKu
         0wdo08MqGQfkomycBa000xLvP5t2AZwSNyi019pfks3u/FmO8w39/xyeYH4lkkQFDTTj
         EDaEMQuQh5EX3mTt1QklBbPwO3nsZvaCJiqCayqyH0cqulbtPEUtMqPCzzRySc/d9QxR
         M1WcWH8/npl2ooW8t+N7QVGxr5nGOX+l1MW7zv8Z8iuC8hUeJj9gxe8jz84/kz8rb8+K
         s3ZM0/CgHT1zuSQqwaiYelMxa16GNONmuht8xVlkmE5moycDXWly02N5OIj0XjefY+it
         SS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238490; x=1783843290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HQ9M/4GETx2H9TaIH+gNmu1Gg6SM2o69SmVk1KgoZxg=;
        b=LtaG2ctEWYP7Dn1auof2v6LjOFsT6uG/PoRv3n0gEaOAQOStwjxbn3vGgcpMrd5IZ+
         4mvneVdH6Shs5jz6SHDQKAQkIO/x0EQ2PpWt8oXOSle+6jyB6QyND4OKRBY9WygE4NjO
         2SQp3k2A9hUepLfEI+0BdINuyOaNZYlqItKPtZSxCN1qlWRMcMzraMaZsGOXuP//VYbT
         nw27CAu9kpFr8TJOTMSqTXbwLjTx5J4h0zZ4L6ne8LC7iXXQHjTTkR3py/fTNN5hbKyN
         NVL5CXk0UM33zD3LoNUpdmSgBVQfTCAzlJ7Osp3DLcyA1uyBHoyF2xiI2CR9aMvcnFmw
         evgA==
X-Forwarded-Encrypted: i=1; AHgh+RoJ7+PJMb6PwDCUBrdbZ7sRTuNDWAw8sYUnJtoI83Y5gNSsYGyUTg8Ww2WEnZz+mM4kZN5euGx7h55mW3/lxUwb@lists.infradead.org
X-Gm-Message-State: AOJu0YwhD1fyX2CBQxjXbbm7g4hNLy9i6erA8HmiCIHk2qqkhkOwJfa/
	OEE1ZjrMGqGcWE7shzR5yA4AE48QXySVtul8UTeOiTOci51dtneYQBd3YjJaKJWiztYDC5erema
	eAznghr9zxB8uqDwfUzXeUf0Y/20qaDCg6Qe8qN/8VmdC2g9jtWKfjO/Hybq7zMz2sy9AKX6iwZ
	g6ug==
X-Gm-Gg: AfdE7cmE1oXNQA3yMxRp6bxh8ODzcxYQPERWx4TGtjqpPwosvq6vfq1xWwAeb4LbWkE
	emDzLPe6XPoLE3YEHpevMX5UBF4f+aM+upIR5XzICKjdGdnNZLAO+sytKJT1B09lmdfhiRnG8lr
	XRZAcZOdVSIeVErl7PXMdrHFs+U8+TtY/ozRUBFanIEGkH9mZ871CsEiPGI2BitaFD/NBJPN+Gr
	fpRgn8clK/TVyXq7dg7h2jSm9ZYs9IW/GJB1TXiIZVRv1A/pvcILB3Yref07ksP6ZuKNjoo6+Kf
	OoBQACOb1N0ZGMFdHnXMTRTVSGfC/jCBecewIb9tRpISdbpg0iE2EK1pxt3zCuoNtn7v89o0yjt
	g8xmMd2dfC57tmquPQVpHka/D62vR6N1eLQg=
X-Received: by 2002:a17:90b:3dce:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-383443b4d79mr3767982a91.5.1783238489740;
        Sun, 05 Jul 2026 01:01:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3dce:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-383443b4d79mr3767939a91.5.1783238489152;
        Sun, 05 Jul 2026 01:01:29 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:28 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:09 +0530
Subject: [PATCH v2 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-5-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=7741;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=G0Zey0vCB0Bai+o0HIhDN6EVy1kYwW9UByIsSgvhH78=;
 b=MRwFsOEavnvAw/ye+cqHITNvYq6UQRSIrAFyHiKri8N35UK+JvJ9tUpMOwY3oYYe7SUUd1wex
 1g9SsSVZ5Q6AmJv80sHBh5rCH0QRYWRG9Q9XDPzPqH5k1Wo2W2Q7HoW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX4WZ1YEuga9F0
 KNA9cHIHc9ZK7kRhOXLDbmq1ziL3OeXGQBjjumBiEb/dmypAJOwjZ/jVistrMiw9C7boRTXAmKp
 JBXQUGoLN+l/Nb0uFEyoRSGz0Rtq/6o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX0Noc+mydA4If
 OsPYUmNJoLpMtCzmByS+rjLMDTkoMZYQNBb9Po7pKrv2JvHM7D9d7UeOhwhnGmjpzhm9Go1aN/I
 5vKYH8oZnfmw0/UOoeU032tZ7BPRCV683W1Yl+AQmTWS3SUeIT9Hj6akRNfMyPSXaNTXlfl/MCc
 eTcDkPii2b2G9kQg8qGjo2B7ydFzEd9UjxOJoG8YYXUjbhTTgveDftw+CtGr5DZX7gNZSYXhoJ3
 GHI5B8FeQZk4pbQMeDQdQdxnyBeSiQIUX2D0nAm2ZKOBFiMgLwOMsdHJbMVyXj6axB6+9XvJpWI
 RaVsZkRBY0b1zL26NqJ7tWGkwgEhyB8q2AIj5PgGxEbWcetbtvPUZJke4THYP0er65ryN4ZlWcm
 lu5y6c/2zIArdLtHWU5u+yAF9K8SDr4yn7xHOekhs+Qkv4lolyXANYOQjw262I4a+PB4AxpGFrz
 +WP8egMNU+l2XsgjGZQ==
X-Proofpoint-GUID: FxIw6iNveLUKpu_qY2DsOxuQLzAKBwFW
X-Proofpoint-ORIG-GUID: FxIw6iNveLUKpu_qY2DsOxuQLzAKBwFW
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4a0f5a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=N89IwGAUvIjX8PsTpEAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_010131_481567_C13E6B63 
X-CRM114-Status: GOOD (  14.77  )
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
index 8f71f9dc26e6..009f0ae1ee16 100644
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


