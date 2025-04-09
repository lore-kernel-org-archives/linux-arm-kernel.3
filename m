Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FED6C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 18:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMlcATzpP4SwOlSvLawCrOvBXTdzBvxy/P85lAIfsJc=; b=fo3O1l7q0NjykdHUsRo+9Wj6FF
	PxaEMxizwQjmIq41oGLEnrw1UtnN2G9Zn4KTKTZkAectC1qYMlUubS49+la9WOhFbh2rxxTFBecM0
	nklyVzlnYuNlLb00qcjCKgYLYyIKMEa8l5xN+NOFL8CVcgJ3LBUL9VJUP6inYlYPBZCZ+VDwQyGUa
	SzpjDRqmLLngH8ciNeyCTzicUQf6ZZntqJ7lZFVHOVEwrUOxF00GsHhtOmgfuG0h0ehHclrOjz3aK
	5GUgddy6UFdEbRhX3LsKZomLDbvNmscrxjuBQvgtJnBbptjKd8ncnUSE4cSY9tzpvkOeX8SrWQU+1
	JiW7T1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Zn3-000000087Bg-0FyZ;
	Wed, 09 Apr 2025 18:04:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZXT-0000000854x-1YZp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 17:48:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HF0Yu004679
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Apr 2025 17:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMlcATzpP4SwOlSvLawCrOvBXTdzBvxy/P85lAIfsJc=; b=aOjUuivXd7msVk7c
	xeRu0w31+xxRiBF/iX9GmbDSL8mz0ouMyIJAx8bsZno0BvguXarPnyzGQasQqHgO
	GW2okA7vyZu7lDKFVEUlVV/Y2vPxfJzm0G2kX3ygQuAAPHTaP0oSejuztBXrz9+E
	dI6mA6Kmcf4TMvYOVv3G5TZ1+y6p5JayAdp/6YTip5x+unFzjyOHDzRtCp1y0G6P
	4e4S4+4OYUfFk2pYTR1EsCTo4wp3h4K1ZsT0rHsg8lt+c+mfn4vo/505wc0M5L/h
	yBWc4x0MNJcOHZ9unPQLbH00NG3mNVz8j9JMDFUMZ3x4bTCose7vYuS+W62KqWS+
	OtUrHA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb4cf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:48:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ad50a3a9766so4792a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 10:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220918; x=1744825718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMlcATzpP4SwOlSvLawCrOvBXTdzBvxy/P85lAIfsJc=;
        b=t8d8hZGu6T+0kD5ZOsQTt/uK6pbNnufR/eTrx55XWEzaUyj9f+cR++LM62N/5FtVEG
         KV5RyMUaJ9ZiLBNvHeOl34O73nuqJj1/IqzGMPbgFUwwl30FCJKVsV4S52OVA9aejuri
         S4rMOxq+dx6S7No4j5X0nUIitic5cTHQZKcdxuzmu4Qa1xC3v8+sHZy1SpzFyZwrllK4
         RjUSG+UKGxMc1+g5hg6xW0bpg7cc/il79+fWqJ58XNb1YSbMZDRvaeiXiuC4Cckd6Rcp
         qhqcrbQRl9klu99/SdlC22nk5pQFsWxrHvHoWmfZsbYQQUh7krB2BMKvCHjOnpyOZrZn
         jhAw==
X-Forwarded-Encrypted: i=1; AJvYcCURC2XFlQmlpMHqS5kPW/3J/SGQ+hq2YdZc7ON7bobMCnwsCG6b3906IE9Foh8WIAkQ2jQw8hveE1ziQi25OQT8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl6vmwSFWn91B6T4A94dtSQA5UpeEUlEfAvJ3gnTBLa0K9So5G
	Sa1EAhROdd1f7DLq261k+fFnIKwQi3veQfx136p/SnXypXajZj9EIY4wf+raqvZwaddmh6JpUyw
	Q8iRX6KE+QTwpR64v+v9eLfgtgNe3QAqyzG7kJmtuTKAJKSYrIHxQlGgTfhIzDiNSMiYaMOqLDQ
	==
X-Gm-Gg: ASbGncsbR8pNYwz47kSrGZn5qTitBhP1uDkRocAPLnxceRIjRrv111ONraMJfoQbo3n
	kikqD+Yy8gsdmKQAzt6n0uPKwAGcLggB/951ZIEupfomPWvCL9T4QByKOTA0i9GbpXfqwydOxhc
	3NWnOksi5UGBS2EhRHS5k3OKE2dj14HKQzKjM7oqiqD9Oao6M1VRlBExK3S62sq8HhGkrtNNuuD
	q7YOm1QfThJtTfZcQp+iL40y5t+y36RKBHjqx4GECgSBnk9ZYa8ncsi2MP/sWFvr7s7v1Qv9snB
	7GPQwkbN3pfROGacJUuXIfyGD1LeJl50dbPD10JmBjFoMNohYLxrto5EY2bkyJLJngA=
X-Received: by 2002:a17:902:d4c9:b0:223:3ef1:a30a with SMTP id d9443c01a7336-22ac2c266bfmr48940555ad.45.1744220917811;
        Wed, 09 Apr 2025 10:48:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDgSyGLh2XAMOqvFxthpf7vhlVKkk1+AeWpcHVuGhAtlSIix9yvEu88v8WHZBgkrm1aUAyCw==
X-Received: by 2002:a17:902:d4c9:b0:223:3ef1:a30a with SMTP id d9443c01a7336-22ac2c266bfmr48940235ad.45.1744220917481;
        Wed, 09 Apr 2025 10:48:37 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm14964005ad.148.2025.04.09.10.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:48:37 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 10:48:19 -0700
Subject: [PATCH v4 08/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-sm8750_usb_master-v4-8-6ec621c98be6@oss.qualcomm.com>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
In-Reply-To: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744220903; l=1288;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=DuT4nt6bKMvm4aZhmJJ4jf1bQ96Ec/cSqjFur5HUS2s=;
 b=+KntYU+os+cO+o4A696kL+VRqPIFmJ2KwIq6t0NqPlaQKbnrpjNAmXUNpAoeA9f9O/0QxgsjQ
 Znp4tGy0v4tAQzZB3gU97UoM6bEXtjBq4J+filtjGpOchw/of3PBvLw
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: o1XzfkQTYpSFCGrWAn1VArmzBCi3wuAI
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f6b2f6 cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=zJXK8rm16J_mOy4j9woA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: o1XzfkQTYpSFCGrWAn1VArmzBCi3wuAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=808 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_104839_422035_D80CF870 
X-CRM114-Status: GOOD (  13.18  )
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

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 MTP variants.  The current definition will
start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 5d0decd2aa2d0e0849414534cdd504714402458e..3ad417aaaaf46ee007bc4c029fa9e57ac183c075 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -806,3 +806,27 @@ &tlmm {
 &uart7 {
 	status = "okay";
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l2d_0p88>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p88>;
+
+	status = "okay";
+};

-- 
2.48.1


