Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24436C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YcdQwSLXWJG6/mDXjcwWp3iWOMDL1BHi5ApBEA60rU=; b=iSQPSTsegLjBtOVhAJSKoNclbC
	N+HJo0at4+grr/UhPfk0n1sgnYl2xUMpo2LSi6QaYZcu0UkCGjhHn9fIIyT/WM7SHv9GdSgOtnDa7
	oBJj8eElREGQ47+X6hs/pt1rvKF/39q1xqt3UORYgcFZCWCDGsatv0RGxHSxaO89dJEWAa2ML5VXF
	mB/1ll05d6HNti2S6j4IwTzU31O7/nF6FmhZ80Virnowa4g35P+VkcnvEKh+AW3hIu0sISyNxRe6o
	vwFIa4H3lM5S3K4y0gzF7gbq5oYRB7ajxujwMTXN8Sp3wvssNKpkCwkt0eVSSGjDiOPigP5a0qeaT
	81w9oNxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvRu-00000005ZCC-0p4S;
	Thu, 06 Aug 2026 10:35:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvRr-00000005Z8M-0OuU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:35:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ndEv1578698
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 10:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+YcdQwSLXWJG6/mDXjcwWp3iWOMDL1BHi5ApBEA60rU=; b=SutFMvm60EZqsydo
	YDncm5HHnN+nXuRkZND7R0GseUviTGRz+VZUJ7YwW0tt6Be4+uy3GEh5CESjXYoj
	zxzEt1g1nyrhmcxH4W0q7MKeFFG6898JIarDDf1Vo7UkrW3Psx6DBwKICam7Q0OI
	WRyELqh9xrCsI/6XOHWZzpH6N0E51QRsgvL8f+BtMVAA0sBHwAkfSRvJ1TfVd4h9
	iOMMPZvIGP2RyKI+zhMNFZ4wthIoLQFo+eXWjvcE80TQ4/BGeBclKXrAPgTEpSC1
	aOBLzfq0egfSyDILYiXWXlUjeedB8231RZrMPTqvHajQsfWWeHyWAsIimnOGkECH
	XF+Q4w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8hke4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 10:35:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso3057833a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 03:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012537; x=1786617337; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YcdQwSLXWJG6/mDXjcwWp3iWOMDL1BHi5ApBEA60rU=;
        b=eJ53aEZ3B5qPb5vgxSkmP4VlouxcHxOcI0AQlRzRMwqSrYEYXl3Q0V5bU6TAV7LI+Z
         uQD4R5ZEIhZk+GpxmM5nuG/D8aQnWkTGnZdeRmaMpoHeAyW9B1kW4OlKFx0SQz5K85Lr
         46LNskEUOxYONap7dAv+p1Z9Qqg+oBB6g8YOsXyWzGFAcwAI1TKp/gJKnWjDPfEZlBZN
         O2fELLZSRpHlUPAjC9tZ4mr86IVLUlryUuB6faMmOQyGzhCHGK7SWNRXDT8v2HPcwodT
         LIY9WjKdkwPYts11esYLrzOlq55EpfPdnId6YRtWCqRwIanPkF2V4tiNBsKB8uuWl2wy
         prZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012537; x=1786617337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+YcdQwSLXWJG6/mDXjcwWp3iWOMDL1BHi5ApBEA60rU=;
        b=VmbDgF2GryY2yb3JaVfXQIdhFi+cGqUBMZxotgdId+Gll/ggHKeN3XidH6JDotx1YT
         /S6mQcJccMSxePr7RG9UpU2mja03qylAT1KJPZgbwM+GMghD+HaxKeuk2ga+sQNY1sSd
         wsUafthYukJH3zjIoJUs2MMkqT0Caqxj3rcAbnK1CvXVnmQjCuWlwEbxZzaqf+YMN5GB
         iELrkSOTjTVqLZDygOjTHS0KA9vfapffwChXtox/98naezMhsR/qeu7/1aUN8fGnFdmE
         X0f/00uCira69Yc2On8scJq6BUr+8+PHpcxp8H8ccS/hNSe23UeWoCkquLyU5igKBzhi
         OdAA==
X-Forwarded-Encrypted: i=1; AHgh+RoFdO18Te8TiQy46F0VS6hcWueKVaZhWCN2OFN8l+A86Ex1UimjAKM+kLVaBHA11iCbxaIcMlCgyrMO0yH6Y8Jw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5LxX711Z7wNhsLRq1ge3BTnd1ahIDXp5n/HhaCwJEauPabUxT
	fhuBsE1Nx8Ar4ypfJh+Ib6ywwWy9Fic0HyO09AupQP7OWrHQ40da1h4LFPhSw8E3TVcP5iQ6e9U
	P1ClVEmR+fnZAHmmbpMI1aoM3IbsVgT5viiojT/sWnKQomgocjoQjdCxI5cuq1MRRMb5Tf/mnUe
	koBw==
X-Gm-Gg: AR+sD12vhApmpb7I9a0smJCIK2XoAq9TQJskCTBwMxROQhU7gkjauRLODpST9/c76fi
	x5iDREL32g3uJNlkCQuK4bj1/j23VQnCK3Nmx3C7/OCyqJ76gcgKpiirz2YIuTEiXARyYaFeXbX
	kkfKuPCP2Dhh3Mez4Ro0ylc8WYbAw1OWqp5+x+hMZybRpGaXMF/bvxvL+BiaXY9HouXqydspHEx
	1NHiEccWyoOoKPNz6ARMRNZtHccHnZxL5DG9mTtnkLnQcRYDHOhGcugrTF+Xzg8iH7Xf50kN/f/
	QXfvisLUOsfa79wP1E7OncLcS9NdkgBY9Jq6205r+0b5kyxM5RwBjtaJ+fYZ1EaB5EqVjAlPg88
	7Pr2CfQCHU8nQIxSJntDfTJDj
X-Received: by 2002:a05:6a00:300e:b0:84c:4bf4:10c3 with SMTP id d2e1a72fcca58-84f2e0cc682mr16219997b3a.38.1786012536993;
        Thu, 06 Aug 2026 03:35:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:300e:b0:84c:4bf4:10c3 with SMTP id d2e1a72fcca58-84f2e0cc682mr16219901b3a.38.1786012536509;
        Thu, 06 Aug 2026 03:35:36 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:35:36 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:15 +0530
Subject: [PATCH v10 10/10] arm64: dts: qcom: eliza: Add support for MM
 clock controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-10-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: -Ss2iVf-OeDn_C3W5Uewdid_4OUZHaa5
X-Proofpoint-ORIG-GUID: -Ss2iVf-OeDn_C3W5Uewdid_4OUZHaa5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX/Rji5AZIFriH
 GUpS7Zn3sfHncNl/qEmBT8UcsCh+x+707UEhXsHxKeDpSicO0t/zKZdmHQzouV93vic2Ztjwk+U
 dun9VWf7npP8Rq8lqz5GoZOis+GpGBBSHDvzbclTPbKcaCTGAw0GBrPjvittXW4qTFHLRz8Sk73
 7Zr1fxnkp/oMAQKIIk2VVcAyofSm7iYK2xnAef/ty5OMrG3f/7Bbo4kYinZUiikHuf8Ousfo55l
 B0X4zJhoUC0wSjEv8HIVGcyWTf9ZNQcAO37ZGFuqrSH75jCfsszji0F3ZxfCJhX+tzLmbCHn24H
 bt4dzWAFle0D4WalXygAa3ORsb4nif6NfJ5WX3zGBBnNXnNC8vfd2pdA1dH32LKQ0KeAzZvdX+E
 vom2CuqadSWKhjkEsQf8CXkz8wBxPNDOu+xlF9Sap8/uW30ExCMLicR+XgInFRYaN2XYVtKgiTG
 Xcpiy/mJcTpo8CIP4CQ==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a746379 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MvewfubiCEdZUln0E9EA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX/TLOFBGqvcJ6
 L0bqtXRN1EuDuOG4xkREZhjDr2zU8ZDoVQVtYoPmltQUnR5wXjTgm5LCU7gIcONTwXKMhlN7B4g
 HQpXz1i5rre+W4T9EVNjQMLNKXp+9jo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_033539_256460_20E506DB 
X-CRM114-Status: GOOD (  13.96  )
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

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 75 +++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73a37303c1875361b7c03f09d58432..94297e05677aeb5b684c5e7cf0cf677dc93180bf 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4,9 +4,13 @@
  */
 
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-dispcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1787,6 +1791,23 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -2893,6 +2914,60 @@ mdss_dp0_out: endpoint {
 			};
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,eliza-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1


