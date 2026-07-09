Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C7DC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=; b=HWmXu6QWRXuBI61nbITdh2zyf/
	ktj+izuAkAWTIbjuAShVjXmalIh6oy4I/nym0Ora+rgGvY1Gn9LAkvC/VzTfRP0wahKNLgUbDPwih
	xgPbyMYWCaDCI1VV9tH/7YIn3R8noxeKx/fuL673IjiGNUk+ZdOv6dNSKoI56dGxpGMkjPyWVsb2S
	GyVlqanHcqsRs0E37qkQ5Tqou8fuTpr/SgwsntREJz/6Uqx1JrDUaHLlKc8Spd5E01KgdjoV9R8bx
	ov+jg+atnHTweRgQHrPetvEd3rY2Oo2IOC8PEFtxytyrTvMCY/2pBeCFZOog0zBfbWKicFh716tZU
	ljFMrrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtiP-00000003IGL-0X3k;
	Thu, 09 Jul 2026 18:43:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtiN-00000003ICn-04Jp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:43:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HX9Nd2503868
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 18:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=; b=Yr64cHKx2hYIcvXe
	23qMLVYQYQjimgeW56vjD2MNs3ZzA8c2CBI8GfDJhERElGzyCBvkOMB1h7wK1Ydx
	AMjl5K4t1loPPLIWggmRW6d+ZMsz1M/pH87YN4nX6YjIoQETLejy3YLdK3eN9bhH
	QA6ZIBnYhld8ocJ+bTjhZpS2KhQ26xVmhRk+yw2weltV8Z/++RofZkaVNAwzB2eQ
	BquSxmo67+ChX5W8gQvc0SWRzGhn1GnjncLx2DlY37Fvwm7R4uJz1XszME1yvMOW
	ZI00+PqI+jIGcuEo/oVw6vZexs0PM66Snyv6aGdWHdoefkyQ6rHbXtcMtAF45dUS
	z0xWdg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3uctd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 18:43:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so1037907a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 11:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622591; x=1784227391; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=ROpEeVS1OG5KwplVsqWcKiWS4/jrthRSrm3HIf2nl7foWBr7Dv1JJKXEDRB5TT09Ph
         eoIEIsbej+p+7NoZ/fOMURNmMGmAGTOaxPSfeiGxA+RQBDXkuewfWFSMvbImf55agM5e
         fjPG123karu97p6Kwb8ghWIj/Jnmd2gervhuQfAfLCgfJtj0ReZOkR4/45eMLZF80lpt
         ySETYtfA2k/hfKyGKB0/tvVRwc90DpARldRtIiyab3IEHzY4cqhVF19mEJWjgdJcvOWy
         nRqiygcAGn7J8MBL+rGjLVrndQsMByZqfrlTK+SjQlKnm1uzFtHZSeIMo3MHWJaVW0qh
         dGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622591; x=1784227391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=fsbwzHDhkniTjOMWr2zmKqSAfNszWAdnnXYT6Mhc3zGkqGymwhDx0zZUE8y48XjXJY
         dYXDqitM5gyX2D1SGSv3+yIOw8s+U8AWx7udnqvwdLtTK26RflfNP/9dZ1qAKInHPEp6
         XFKOmTQJypkwWKfKx0NF+UF7ybwhow+vCGrE9ap7FGP8DmvvPjr4XDZkapXNUZd5XC0H
         0Ho2iDts5COLUwJkfCZahK1xECYgz0oEaqRys4Q1ZD2RXV4VFlBiFW0hg5mBGDud+921
         8QN7ce9r4Apv54yoLchtGHarqhhmAGF7CAhX3A0c6yBr3okYUqHfR0IP6hBRWmxwTDUy
         8ioA==
X-Forwarded-Encrypted: i=1; AHgh+RpyMbwKNfcDnp1ZPpJKn0IZ1GoOrzgSNVRU5AHhygnPkSYMw4eD8gO//alNvsK0IfYsEq4IkVDX2rkoX1afjDlI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4IKjNUAL3p33W5mrzwuK0ffsv/6knpODyOos7iEsoUgexoH5F
	+xPS7rU9E+UmkcOeAgFrGYI5tBPcC3TkzqbwY+D2cmnz36kj4v/nlVaJocrs0PYrHe3HybjQey0
	2DsI+UiF6UV5AHYF5P9KeqxAAyvK7NfX6Ge6Q4iL5kuVfLIcL1Qm1yIaTCbw6jHGWdH5rgOD0Sc
	Q8Jg==
X-Gm-Gg: AfdE7cmi4bHXIPU6/+uWvS5O+L+8pH9Z8TnNOHRLeD4AQRzeh42DldckBosZE7VIOEN
	H1Kr3PndZ9vyucJ/aC2XSOUWIyNFb9YXl3WR6avfgkK3xhs9zZ0ATInxZFtPEz695U3dQNYMIt3
	zhOFvlSD8p6lPU9PoeVlpYzmAgz8KUoW7c2unnzKCLE8pPyuU6uTz3mx5NrrltiUGfMKy493U6Z
	tCWcKDA7oWViS1BAdyjesXjRgPWC3i/S5BWPEM1TwAST97W5stULkMrpIoSFnpZm7J4QDH/TOw0
	v5mYfN5f6YeIDA3nTJY/cfKY92xUK6aHT2Ln5qtvU+IQw+DB1I/FfFjRCevyFz2AbTeLsqIT3sc
	Ae2kmGqSQYb4Bqtfo6LhMltBS3NJ1clvjVcw=
X-Received: by 2002:a17:90b:562b:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-38d1596cd89mr399560a91.16.1783622590634;
        Thu, 09 Jul 2026 11:43:10 -0700 (PDT)
X-Received: by 2002:a17:90b:562b:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-38d1596cd89mr399511a91.16.1783622590143;
        Thu, 09 Jul 2026 11:43:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:04 +0530
Subject: [PATCH v6 5/7] arm64: dts: qcom: shikra: Add A704 GPU support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-5-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=3495;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AFPL1mLXpKffrlVn7dhyAuVw3rCpzngGAE8+zg6xtsE=;
 b=tacrVztp9Jm3lWTvjjWw+Fn25POssjiE+J5DI8nPBE5GAX4Ro4DXa/HhntJJc+zyCEmRfs1LQ
 PKX6hvgevKVAd+LXbcTmBLwciCfuu6XNqjkJwaY5W0UAJFZrhFyYmNK
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: aD4bWzZzTBsr79sFGEK9YcERSbiW5qW_
X-Proofpoint-GUID: aD4bWzZzTBsr79sFGEK9YcERSbiW5qW_
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4febbf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX2gNkXEbc7jB1
 MD6sUSIfm16Kdh90v8JhERYwjbz0GJ1CLyoxiartP095EiiYcfUnqU21DCO/b6oY1bHJ+uMScmW
 phSuc8xDyemJYNbd2BttMzR2H42xosI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX6hkXU2z9o7gb
 Wr1h8kPuABib3pVK43Z/ZuJRn7czRxYODo9fNnIqOlS9+vEkv9mUYH0lMobCxJDWVoHmlMqIhXJ
 QFc1Gv4YE7H+HdZKhMIZWemkZ+zzlkfvcknldHzRb9kzaQX3rrS80oh4QPmjt+s191F14x89msb
 Q22m8T6iHyYA5QjWLXiMWttG/o8i/C7GvZ5cBTmh51+/FADprzoHYiUkHaMh2ISxojdidvpNFQE
 z9NjQ6Mrz62dAnoGLWqxY5ij4kCA0OSQXHWFqVnct6jACdVboig5SCMszyIiRgYOjt/Xvy5AZyC
 9FD5muC5CEcF6S62FQVeF0lHW2lyQqrtnkpzurRUogUpeuIE9CZcJd5EQrdUCk9O6S+RqpTDn9o
 mDsc6J8rJtv9IW22qXHB0NtXJNOqxeScjCRuRTtM6J0jaJ7gH59olj4EAb7co4Z7lJkVdNDCQmu
 HE2zUoCyYBO3+glwXiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_114315_067086_769A38B5 
X-CRM114-Status: GOOD (  12.52  )
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

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Add the A704 GPU and GMU wrapper nodes with register maps, clocks,
interconnects, IOMMU, OPP table and the zap-shader region.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 98 ++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index bb11e832d9a6..34261221664b 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1992,6 +1992,104 @@ glink-edge {
 			};
 		};
 
+		gpu: gpu@5900000 {
+			compatible = "qcom,adreno-07000400", "qcom,adreno";
+			reg = <0x0 0x05900000 0x0 0x40000>,
+			      <0x0 0x0599e000 0x0 0x1000>,
+			      <0x0 0x05961000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "mem_iface",
+				      "alt_mem_iface",
+				      "gmu",
+				      "xo";
+
+			interconnects = <&mem_noc MASTER_GRAPHICS_3D RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "gfx-mem";
+
+			iommus = <&adreno_smmu 0 1>;
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			qcom,gmu = <&gmu_wrapper>;
+
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_micro_code_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-1142400000 {
+					opp-hz = /bits/ 64 <1142400000>;
+					required-opps = <&rpmpd_opp_turbo_plus>;
+					opp-peak-kBps = <8171875>;
+				};
+
+				opp-1017600000 {
+					opp-hz = /bits/ 64 <1017600000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					opp-peak-kBps = <8171875>;
+				};
+
+				opp-921600000 {
+					opp-hz = /bits/ 64 <921600000>;
+					required-opps = <&rpmpd_opp_nom_plus>;
+					opp-peak-kBps = <7046875>;
+				};
+
+				opp-844800000 {
+					opp-hz = /bits/ 64 <844800000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-peak-kBps = <6074218>;
+				};
+
+				opp-672000000 {
+					opp-hz = /bits/ 64 <672000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+					opp-peak-kBps = <5285156>;
+				};
+
+				opp-537600000 {
+					opp-hz = /bits/ 64 <537600000>;
+					required-opps = <&rpmpd_opp_svs>;
+					opp-peak-kBps = <3972656>;
+				};
+
+				opp-355200000 {
+					opp-hz = /bits/ 64 <355200000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-peak-kBps = <2136718>;
+				};
+			};
+		};
+
+		gmu_wrapper: gmu@596a000 {
+			compatible = "qcom,adreno-gmu-wrapper";
+			reg = <0x0 0x0596a000 0x0 0x30000>;
+			reg-names = "gmu";
+			power-domains = <&gpucc GPU_CX_GDSC>,
+					<&gpucc GPU_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+		};
+
 		gpucc: clock-controller@5990000 {
 			compatible = "qcom,shikra-gpucc";
 			reg = <0x0 0x05990000 0x0 0x9000>;

-- 
2.54.0


