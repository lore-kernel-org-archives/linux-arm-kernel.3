Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C782C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 07:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCgcrdULWipSXWVwkvOHsT5HbMWYQ29OYxYE22eVPDU=; b=rOjgTduSin1oabJzZMAJNR1E7s
	tzuORwzrM0rK98Er8uls/SQXKSJlYo7+ZeOEUygh3uIohZ2fVwPw7jltV8v1aZIbqIAnKBs2wQQ1y
	52Z6v/2z053biqdwA8qhs/cI5SR+vdIRwXTiXr8SVLYAoKopq/8vhBK6CQlSZCPEU6IGvuThwjvOX
	9/E0ZhNHxcXzZ4MUNwcZ1J9Pm8vWNnB+5kr+nT6QMZgyQpC3BeIYy2oxPEFX+CVQh5g82Mk5/AQcC
	ZFq+1/wjnXTDX4lfitUser+1BPnWifayIaKksUNudNtjm7JNRXmhmAP0+RGV76UBtySCevEsVAV4b
	IqlnRhig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDeSQ-00000005Xbu-0uL7;
	Sat, 10 May 2025 07:17:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDeQM-00000005XVq-4ANc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 07:15:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54A6Tkrt018863;
	Sat, 10 May 2025 07:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UCgcrdULWipSXWVwkvOHsT5HbMWYQ29OYxYE22eVPDU=; b=QViP04k7jGdK7TIL
	q1Qf0hPgauZl87R5XPm9r+qeSDq7pnwv1kOdjauIrjvMxpBscYVUcqAKLCjbcj1K
	ucKuS+Ln6mnmTR5PXIcvBj0D8I8vVcrOMtRzCa8i6jbw13Sgsz3zm2ORn3NM9r1e
	AeUqC/ndobAHx/ykd6LXui2xtLUx7ksKWUFlp8Nvt9YniZWIzV7HgB3ZUzwCSIvu
	0FOsO4AKMLM1IBhmNbjv3jYAP8gOiCHqpp3mOGrC0hXKs+BY6sVERzJBAp6s1yJl
	U6jkZ7bRbIkjp3EPaJfPiqvbEC2kvbSS5U4XJfB1LwQlcDLWDnsbP1QCNUzngmQ8
	q58cwQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwt90asj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 May 2025 07:14:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54A7EoRp020408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 May 2025 07:14:50 GMT
Received: from [10.204.73.14] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 10 May
 2025 00:14:44 -0700
Message-ID: <cfc85bc0-1808-42ac-b0b0-41e4935ec74d@quicinc.com>
Date: Sat, 10 May 2025 12:44:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP v2 4/9] arm64: dts: qcom: sa8775p: Add support for
 camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
 <20250427070135.884623-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Suresh Vankadara <quic_svankada@quicinc.com>
In-Reply-To: <20250427070135.884623-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEwMDA3MCBTYWx0ZWRfX9SV3GmetpTwc
 X0VXYu1G47/tEnvP8FWh+hdMTNn0XGp1bPOdeZBTnzepG7hlfy7rS1XnTE7l+I3Zud/9DSX4n1n
 WGAIiI1mvlAC5njItQgjfzkmKqdxb3iOhqhJ/sMqLuqFbz5MlA6ffYESnF0yaqojtJAD5ZgtfOp
 Y0S1lmHYpWgCknzpCAMtZkJn44CAlBiLcsbVGRoYNFp2lbVn2Uk/ZbDLSVDTnYj9tdT2to6Vkpd
 s16ZMg+2Dk3DwfJUPMj7fY6YOCwBPOrT2ec9BYgG5egwaties5K4S3x7PWPoCyGATPv6whz54EH
 ozZhSlHCR4atayqVQZtEE6DVEbKKpqq+DHcIA6uccj/nbV4udHFUe4zBKK401rA05pgDL8O/bTc
 PBb7LntAykdVa9XFAxNa+YRNqiTlafy4IVsfJjQWIA9Zrmu+e5O9hd5PdT5q6JG0OkFaU+7m
X-Proofpoint-ORIG-GUID: Kxw6DUOrPUofECTmBkYuMgyl2MM_WRwy
X-Proofpoint-GUID: Kxw6DUOrPUofECTmBkYuMgyl2MM_WRwy
X-Authority-Analysis: v=2.4 cv=a58w9VSF c=1 sm=1 tr=0 ts=681efceb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=OqTgW8rPjYiluJQXZTQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-10_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1011 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505100070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_001507_181025_FF4792FE 
X-CRM114-Status: GOOD (  16.07  )
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



On 4/27/2025 12:31 PM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SA8775P.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 187 ++++++++++++++++++++++++++
>   1 file changed, 187 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 5bd0c03476b1..81eadb2bb663 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -7,6 +7,7 @@
>   #include <dt-bindings/interconnect/qcom,icc.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>   #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>   #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>   #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
> @@ -3940,6 +3941,192 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		camss: isp@ac7a000 {
> +			compatible = "qcom,sa8775p-camss";
If more number of nodes are added for CAMSS, adding isp in compatible 
string helps to differentiate.

> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csid_lite2",
> +				    "csid_lite3",
> +				    "csid_lite4",
> +				    "csid_wrapper",
csid wrapper is top register set, which is applicable for both csid 0 
and csid 1. It is logical to keep along with csid0 and csid1, instead of 
alpha numerical order.

> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +				 <&camcc CAM_CC_CSID_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY3_CLK>,
> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_ICP_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "cpas_fast_ahb_clk",
> +				      "cpas_ife_lite",
> +				      "cpas_vfe0",
> +				      "cpas_vfe1",
Maintain consistency on vfe/ife in complete camss node. In reg section, 
vfe is used for full and lite version. in clock-names section ife lite 
and vfe are used. As clock IDs upstream and ife is used for full and 
lite, this convention will be followed in camss node as well.

> +				      "csid",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy3",
> +				      "csiphy3_timer",
> +				      "csiphy_rx",
> +				      "gcc_axi_hf",
> +				      "gcc_axi_sf",
> +				      "icp_ahb",
sf and icp_ahb clocks needed?

> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ahb",
> +					     "hf_0",
> +					     "sf_0";
sf_0 needed?

> +
> +			iommus = <&apps_smmu 0x3400 0x20>;


Regards,
Suresh Vankadara.

