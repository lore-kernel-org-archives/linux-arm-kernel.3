Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC07C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 20:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5EABLMYgrPqX+e6g9POPOLdFY8Rck09SBi7ZSFcSKQ=; b=rqBCKXk9nljcoTns/qw47gKShz
	jsiDsXf/Grh+GLBi83ad6AwUpb5mFb4HpXBZDXardV3qeGOjnJ1jmeGRReUKuAnIPFIVDZtFTTZb1
	xtxlDxtxQzEKI0wLvVhLZ092IzNs8A+rOze3mMMADdJi/MAp258Tl1f7sGeYIcMAVXOzobnC0wUER
	a5UxqAApTQqU0G25T6d1Tyk6pAkp8CXLUQnC9J5biBAfXh1hkCH103ozq8eQ9Ve/q0ytIS0C2Jwph
	mGl92qCGmxWAxbNB91IqbZ4C9BW0UpDI1bX3jYhx/iRkuhNkMmNF8sL5YXh5YxNaJEc0kdh8cTz5v
	ptG7Bw8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpOa-00000003Dkj-1k6L;
	Fri, 17 Jul 2026 20:42:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpOX-00000003Dhb-0qzg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 20:42:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtL3k2906068
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p5EABLMYgrPqX+e6g9POPOLdFY8Rck09SBi7ZSFcSKQ=; b=l+KULMYpfhx31Xm2
	SEo+MCsYLBw0rqvsugbSuJE3U8AVVu9n7JQbKyTOwTopsx0Baxebl2TPoyQjTWgP
	ndTlv6auJpOfA9jfxYIpbn8Wh/D2dNzjTyRQMEUzi7uprVcvljwUkw8NvlFnZVaO
	2jb+MQggIjV7J/yERkZ1dw7e59EITu+O2P2P5uMNzvJ9rAFf+0UNL828GGRz+7VT
	Krbn6NkPe3Gs7OjPVJnBpB3duWq19K0vDf5Wh1HsE5+BoAUeKUbKomCmqeRdy+UO
	RHCBCGd6QD5xP94aykQe9weASI0/1dW4vQ+1+In5Hfv3UjgsZb9+k8USEkzfoFl7
	aBl42A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrsq8qmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:42:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3811279d51aso8806823a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 13:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320971; x=1784925771; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p5EABLMYgrPqX+e6g9POPOLdFY8Rck09SBi7ZSFcSKQ=;
        b=GkALA8U6wEhHcW5zvEBwbcXr1qhcgMHnyYCYQsIgtQ2h1ycug43mjCf1SANMpEwNDL
         4OSf/RJYm/eacOcnAm3kqUfQWf5nZWPEqSBnu6m0ljM2n/AEy17W/51vYyWjHd/idtGJ
         o9mfWkgjTxw8JhQE0+DMnQqNKmsap2ag9AgxqQ/BOSUs0XYsBFsLFKI0wcbKjD4meG3H
         rWx3nw8xxbAUJKHPkyV4Hmzm0t9GZQaZqA9wCuP6kmOaUE+UJaLx7Iv5cMvFChm5onrP
         xLuP2Z6Vnt/A6NXSUnwamzk4ItKGtBu8nseBg0ftqWFwG6luHtoMHLcgm7UW+i8O4WrR
         VZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320971; x=1784925771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5EABLMYgrPqX+e6g9POPOLdFY8Rck09SBi7ZSFcSKQ=;
        b=HYs4pzlBvjiKEWmVT9Vjv3gjs3EbbXXseqs8Yum4yMSt8PqaObfm7LGYINIdLHhleR
         b2upIM1vSmBC2ldNH1lH/L9XkGO1El4Z+Hlxkyw5pCbAir96OM9OKhTjcGMt+vMr5F1J
         Wie5PUNfqQTbFSetlAtaSihwGfK8NdgK21dJbPUNtLSzYBBUOk6N1RacKYug0d+eAypa
         JvzH1+IseyCSoAjfwmrVscg6iiJHZcTXRCXZ+o745sGwP8t2YYM9KluEfcvBtumtJxfK
         V4n/dFMU2gxiYC60RT/gjTg6umAh+UX4I3zxEaXJsvzNxHIMQcNkYLprNfHs9hgQ6afG
         rbCg==
X-Forwarded-Encrypted: i=1; AHgh+RrbYuXVCd8WAZWPaD5b20ZiTQQgmjcIWwbBMifjHtotxLUwUuWqsj1DLX6we/iA+1K0a5IdYr3YNS3pHBjK9CgV@lists.infradead.org
X-Gm-Message-State: AOJu0YxVA7PmOzPqLRNwxLKFvL8yR6MD0OGkeZg1Ucp5qmjm//g0qF+z
	gGs4062uXxMIQ3yR7WpZBtAwbUtRxJ7sEjKkm4XA9uBTslctFz44Ome2SsWPazzO1fbvuzeP3hT
	oK8Wbi5Aqk5BGJjIrr7wJM+GRg7I3o0/sPiiwJEbcz9n5m7N8sx5kAgVhO/yBuTrYqMHbAmmwOJ
	smsQ==
X-Gm-Gg: AfdE7cmUWoOPJQtwKegEUwrvqBNiNDnfdVd/aIKgypsCk/dnPQI61B1oIMZV/2ogHXf
	unKt67OvhkOmXXfl2UWtW3uS/yzmkhON+uH87UGWsynKSO7dlrjsX4UxYvPqInffuXTS0HlqzTZ
	PPyEf9hkwlZX5O1qBciV9uRFIzkXWgUht2PMBr4xbv4sXH2oezUQ08eeJDf8GoU1YekMERTuDkL
	d+OvBJzVBI2GuT4FE5PAFng30wtVpAx6S9jgRhLYdr6bwm3dXtDhxIifz1t4ir3jX5ep287hPtW
	pQOaomTc88Mroggo0/PFOXJENGaIyFksoWsubLip64j4PPDm9abWHFQzK36DuzAfRFr6Gx7sobs
	Ima9VTvmSnOnvi7yqpF3T+Ivt
X-Received: by 2002:a17:90b:4d09:b0:38e:2fa0:491b with SMTP id 98e67ed59e1d1-38e4b594eb3mr4384602a91.31.1784320971027;
        Fri, 17 Jul 2026 13:42:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4d09:b0:38e:2fa0:491b with SMTP id 98e67ed59e1d1-38e4b594eb3mr4384579a91.31.1784320970601;
        Fri, 17 Jul 2026 13:42:50 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:32 +0530
Subject: [PATCH v2 7/9] arm64: dts: qcom: eliza: Add GPU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-7-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=5441;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Tc760x2HSzCAh01NrUqagWazPo/xG5E3TZ5FY+sYPYo=;
 b=HA2PZqykYBrV4RxYXVrVfdMUsWyeU8C73KsGv99Xxxv8wFWMitPeXYsK/BRKzqOJIoyWF4R1r
 moUX080nk0OB48kkfTJC4ii2Cs8Joi8F03FvySccGIMkTAqODwsuEWv
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX64HgYRiS+Zag
 Y5XdCm3EsBZ5IbinRWD4CfZ2EPm8mwc9Ng0JePXvSr2UTCACsxIueIXCOjviqo/4KvhxAdIhXt2
 wd0ZJw02Cy1NrrOyOL09A/iMeIBbOAM=
X-Proofpoint-ORIG-GUID: pMnXi23sG_CELVD-rh7s82eq9Wu3AE7l
X-Proofpoint-GUID: pMnXi23sG_CELVD-rh7s82eq9Wu3AE7l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX6Y7ku7nmt2E6
 1ggO6iR5laamrPVx1jZdPU+rv8E9IGZBVys9ScVHoYh7senycg9pgeD/stA/m9keArie310Ljm0
 i6Pi4tHj25/zR2ha8UtvdikvzCcmg2ohbWJbrdJFTJZBU4iZ3VgZ0s6zNwV97Je9YrPHgSMN31H
 a/ALDQAjQYOR7KifxlEof1GxMxTIka0MpKfwu5QQMH3n4wm/elZmrqHABzfy+LnxhIkl7nN+hgC
 Eztq1k43S0L+X/J1QSZx4mz7RV6Bpp6As/bva86wKUxaehilMm0PUMBAIQL5QopRSKJD3pkm3NL
 nNDBZEziyFIiY6aMYG/hEYeAr8477Z4Ntl2JE0yYdT40jnWScMuFCG4CkVZUB/zEGAk4J9GCBP9
 w9lusYXRI9RMMd0dI4WsQwf48Hf97nxUbtOdTVMrGLdCBrTGoY9hAXqwkirqbjdukfCyHtt+aGQ
 xlSmasEd+yXmL3qjtOQ==
X-Authority-Analysis: v=2.4 cv=OJIXGyaB c=1 sm=1 tr=0 ts=6a5a93cc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=p8LQYYvwJZuHz2WWpfMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_134253_402280_FAC89136 
X-CRM114-Status: GOOD (  10.86  )
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

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Adreno 722 found in Eliza chipset belongs to the A7x GEN1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include lower cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

Add the necessary devicetree nodes to describe this GPU.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 152 ++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index e5b8377e6c3a..c24c5e9695d5 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3742,6 +3742,158 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-43020100", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0x0 0x0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_micro_code_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
+
+				opp-259000000 {
+					opp-hz = /bits/ 64 <259000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <781250>;
+					qcom,opp-acd-level = <0xc82f5ffd>;
+				};
+
+				opp-345000000 {
+					opp-hz = /bits/ 64 <345000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <2136718>;
+					qcom,opp-acd-level = <0xc82f5ffd>;
+				};
+
+				opp-515000000 {
+					opp-hz = /bits/ 64 <515000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <5285156>;
+					qcom,opp-acd-level = <0xc02d5ffd>;
+				};
+
+				opp-645000000 {
+					opp-hz = /bits/ 64 <645000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <6074218>;
+					qcom,opp-acd-level = <0x882f5ffd>;
+				};
+
+				opp-724000000 {
+					opp-hz = /bits/ 64 <724000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <6671875>;
+					qcom,opp-acd-level = <0xa82d5ffd>;
+				};
+
+				opp-796000000 {
+					opp-hz = /bits/ 64 <796000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <10687500>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-900000000 {
+					opp-hz = /bits/ 64 <900000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <10687500>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-975000000 {
+					opp-hz = /bits/ 64 <975000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <12449218>;
+					qcom,opp-acd-level = <0x882c5ffd>;
+				};
+
+				opp-1075000000 {
+					opp-hz = /bits/ 64 <1075000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+				};
+
+				opp-1150000000 {
+					opp-hz = /bits/ 64 <1150000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa8295ffd>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-722.0", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x35000>,
+			      <0x0 0x03d50000 0x0 0x10000>,
+			      <0x0 0x0b290000 0x0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_GEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_DEMET_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "hub",
+				      "demet";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gpucc GPU_CC_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 0x5 0x0>;
+			qcom,qmp = <&aoss_qmp>;
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-220000000 {
+					opp-hz = /bits/ 64 <220000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-550000000 {
+					opp-hz = /bits/ 64 <550000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0


