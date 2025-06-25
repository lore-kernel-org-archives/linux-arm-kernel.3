Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34259C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4D5xBGxSr4jfA7P6+oNyoTxU2RBo4soyNKPqrCLRTt0=; b=ahqMd0ziPHKE1gWlg0TU0qo55a
	nLPJ98yslxKe8IPsvqqzayfsDabj5n2WyazPQe6OqunrbwJiHrrlQIcXT8S6Nz1YyfIXp6GMEHqfk
	19l8rAyaQCJGDRjyBFQ9Ov6dovurFS6km8JJbi5Gs35yIanOoqYDJIXDAmXZKiwvniVLBNvOWyBvI
	F1SGyW4Pw4B85bwfvaOMQ9zv5sz8wt6aw8MSkPn++4yU8msW2cACOOESWrPy7AC/2JhCe0rhpntMg
	IZ2KKnJIiJ4VxsrnFlff92heFDH66LycV164irorV4TOoiTzTbvoVmaWK9MTewPyUSNJ2g6N22uQM
	8jB7S6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUP1b-00000008ak9-1Pjd;
	Wed, 25 Jun 2025 12:14:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNdE-00000008Lts-0wm5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 10:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4D5xBGxSr4jfA7P6+oNyoTxU2RBo4soyNKPqrCLRTt0=; b=PqFVLZ+s2uQ/GE4l2aloz9HSvX
	w/18ygX0KIoJzFIb6g7FpB2QlLJ0eseOw8zvNMQ0v80saLai/OHKpwdocOvXd4F/Dw8bJQ4ZFszDe
	hQW9zzbWT4Ab3aKvxL9WGe14gGwnchZoOHJZgRqhrUevB4NeAGLEWeVpunXRpKEzWxrv3D1qylxdj
	0sjWwTen3lp72g+T06UBidbda7sbf7yb3UQvJenaaYJ9PLSe1L//lHsjkTwdiOvUt0J17IwKLw0z6
	cKEmy18AVy7UbMY0CwBf9zMni2jCTIQjQMGjdZpHIFdJ1YQmhwhRgFC6INpyzPgQEN2TXfs+xZ+iJ
	mI2inPgA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNdB-00000005nRh-26IY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:45:31 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAfEYF000685;
	Wed, 25 Jun 2025 10:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4D5xBGxSr4jfA7P6+oNyoTxU2RBo4soyNKPqrCLRTt0=; b=L3RxeuIVxh5uFPnw
	7S2T3NACZcmdWobfvAGeAC93XFllG1i3oqG65rTdVcnKCdziZpdipIMKhmb0gGQj
	gM8knIhPbZhPbzdeLlbxBBh4MFLsW+I+VMDEqBws0umh+6j089UwCHwkSLzTW17e
	YDdyit57lm04jsXvZC67mJxtXQ8bxl3GbFhaMrXFj99tdJ+BBxKmdL+uZ6eeUzov
	mlF4H5JP4zrv4qseXcOv7FYrZ9dD40mjZtwGME0zd58D+9pYPLQov3VMN2KtjaFb
	lNzZNA64UiAXLJPHICWprJjODASAFBfZDJfBivzL2nwMGvUDEglsS4sS5mT8txeA
	95qRRw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7td9d6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:45:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAjKG0000741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:45:20 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Jun 2025 03:45:15 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 25 Jun 2025 16:13:35 +0530
Subject: [PATCH v10 10/10] arm64: defconfig: Enable QCS615 clock
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-qcs615-mm-v10-clock-controllers-v10-10-ec48255f90d8@quicinc.com>
References: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
In-Reply-To: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685bd341 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=AElZlkIX1ip-SmTVEvQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4MCBTYWx0ZWRfXzA66QZK+FjFN
 eKCKEtsChPGESg+DIWZgLI+rFXVT53hvpyWJ9m3YJTEVOU4hUk5eRrCx5VyF5EI6ZWnYhROaBbe
 RBlW2E4/DFF4MpuevYSuy6I0QGlYBsfVGvpYfLryAhAwJf/kxCXhP8ZNeZycLm7zMMwxk+PmaVH
 mp88zl98QhmLg9wy028g7Gf02l+McigJ6qjKpBYtIt35J6tmkUKDkM9VXt2FQlXMPPSBglyXgH0
 zUcXgnxY2PHq8D4HEk4katJ+xfd5W7QyFZe5McPYK0cg3+MwkoefyMa/HbJvTLfjTITYXxoBuvO
 /wqHKt62nU7MhJgiWXeb3ANaQrtpH+UOcvzzDX2d43Ws2op2xHbQh+5mc/Wdgwm1lbEIxnojAp6
 V6Lh9YJuux6dMk3tkUp6BQ6AfZbJMY9rCa+Ji77rnU9/lDUg9hDt69OQNT0CbHlGUCzpR8oc
X-Proofpoint-GUID: CiLf5sYbP2_7lyylUu7L9_5nDRq3Ho-S
X-Proofpoint-ORIG-GUID: CiLf5sYbP2_7lyylUu7L9_5nDRq3Ho-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=760 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_114529_911439_49AC1C33 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

Enable the QCS615 display, video, camera and graphics clock controller
for their respective functionalities on the Qualcomm QCS615 ride
platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e071f8f45607dbfd8e00b915b27999949ee0fc88..3c5c1901ca5670d1bfd0a6edd73f0591ccb9c76f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1375,11 +1375,15 @@ CONFIG_MSM_GCC_8998=y
 CONFIG_MSM_MMCC_8998=m
 CONFIG_QCM_GCC_2290=y
 CONFIG_QCM_DISPCC_2290=m
+CONFIG_QCS_DISPCC_615=m
+CONFIG_QCS_CAMCC_615=m
 CONFIG_QCS_GCC_404=y
 CONFIG_QCS_GCC_615=y
 CONFIG_QCS_GCC_8300=y
 CONFIG_SC_CAMCC_7280=m
 CONFIG_SA_CAMCC_8775P=m
+CONFIG_QCS_GPUCC_615=m
+CONFIG_QCS_VIDEOCC_615=m
 CONFIG_QDU_GCC_1000=y
 CONFIG_SC_CAMCC_8280XP=m
 CONFIG_SC_DISPCC_7280=m

-- 
2.34.1


