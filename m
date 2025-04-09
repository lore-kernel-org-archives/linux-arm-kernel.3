Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F359C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 18:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVAy88wlNJC3OilztIMhCSi3ZV6REtKHr5V49PSIZ/k=; b=0pJT1g3fpIj1CCtWpc6Yc9PyMY
	4q15cIFzYrBy6os7u0qmy8e+e7nzJRCLOC67fB6M4BOlwACKZcCRgtzuaXn7RplFn990jdo26r4X1
	G2Dw22mr+m/SjTLlhQjo5jLlVpa7aknbpIqiHjxRPFf4qY3CpNHz1IQyzQ2VvZl7rUAyJj9ECIh2M
	0iGirhLNOnkesrD1G+VIrRP3/AzJpvRvZBBOYrK3uNaGagqxX7pfiF3PBq6jvLeMnsvV4hTvcFh21
	Ru87NlHHaQNGNSBb4fvBAHlA9duT5CDxvOZfuhcMF9UB1qHkOmXUeQFNMdxWgKBmxMCaQ3EcNF/BP
	2lZurt6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Zom-000000087Oc-1x1h;
	Wed, 09 Apr 2025 18:06:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZXV-00000008567-2xBT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 17:48:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HZdMT002282
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Apr 2025 17:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bVAy88wlNJC3OilztIMhCSi3ZV6REtKHr5V49PSIZ/k=; b=CDk4/zt0yWHhO3BQ
	V1tnGO+3+z5o1vwcVbuTynHRWk2Z77a5n0XPZLe79BIvF67EVJoC1RxQGEOGtgwz
	tj4iTeIh8QjK04hwpF3PqF6GT5/anOpVnDLRdUHDBV2UwpjwQDhbvZ0RqjdaIJ2x
	f5G/BDtYnoxpCRW7zSZasSwxuoNA6jnXNn9VviDFty/N3459G5dtiNfPB2TvfE0k
	odz9aASXF8BBkbXJ9xA6AGndSyvH5sVls+2AOmpOlZwkgCHZa6NVWuw3ntRO9omO
	//dVZ+UAYFoyo+F+c3OwIy/dHn8MAPdO7XRfH1Hln/jXOR92twE8d14NcYbA97Kx
	9rEYIw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1m55k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:48:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-227a8cdd272so61731855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 10:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220919; x=1744825719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVAy88wlNJC3OilztIMhCSi3ZV6REtKHr5V49PSIZ/k=;
        b=WGEs3nrlvwr3ROCQ5qWRhLrafQOc5CovPOGZuOqQdltNe+8VD6ImXF+3xVdg+Vvziq
         kZfFHLggHC+c3+ij7kN25/hUI9mkXm4wRPHSwlQEJlnQ7JTe3pJq1JwfvdmTXcTqkmL4
         1k5HRx5sOtUcvgzT7uXIqAvhRKN9RY9K70sIGNFI3eicr+6LQc5aDY2Gh6GQpiUdcdo2
         To1SMSqPItCUU0bBzzEMZ6GQLp3535aafhY9cdWgsXyXjAxfaEmCWQ/juVOEte4P/Vks
         4ASlZliv8mVzXuCoKuzDo17HEUrgwiT2Qs4QqxVGHAISuFZHdEp/CjyolFGFU6wcQ5fF
         b1Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVbH9aHYQc9kv094jOlusUrDExjbnpVRwPO2p/aexG92VD6tIDvUZzJDK7EctFvT1OOn3fYha6zZHvQf+4a/9CG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn91/7saZ4dDLybjX5/H0ZcRL6r7ia7/g2xnrUTf/X7apNBSq9
	1nro4wAI71uoOs3uS9PUefkWi+e5t21ERQj0oiZ+qVwl24VLoCD1cBQK3j2XI+g/JWA+TW3l1js
	HYtNkEuOdMbBvBfnJImlHZiDPC7lw10RbgY+tCw3s3F1Un0V3wrkqO0jiMxBrEqmUMLPdURwNWQ
	==
X-Gm-Gg: ASbGncukX5R511o6hLaTT0iW2ec+B674h7QqzZ7MXhrH4qHbMrHI8AXjUWDYsxNlepe
	5bM8HZpJj4leIr+fp2Vh+ryEJ0wuroIeNkoOU5p0HxkyMDcYftQd1Erh24ufnHrP3pzbLnRvpN9
	evpclirs6utgdqHYYM+0dQN3ft9Y63a5l/5TMr7dJcBW1WaUwNszlBFVBTOphk7cHRGZXc9h56l
	WGgQ8Rlbwf+1WleZUfOSnQjT4oH1o+Jt9LWIYLX5SXNbLB7njrG0NAZXQ7f7R36CNQIQyZ6qmrO
	RXGds0PEcKxoQcBk3awheXnmEDADwpUV8bFVed+ofVDVGzasMHuF1H3BQF+nUHjFY7M=
X-Received: by 2002:a17:903:948:b0:215:b1a3:4701 with SMTP id d9443c01a7336-22ac3f6e816mr47119635ad.13.1744220919431;
        Wed, 09 Apr 2025 10:48:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5Ri6zYviU1Hzn8RpAKAATT1858Rt9K99dceK0g45RXnTwZC5N1EqWIevyJSP7eG8TgRQTKA==
X-Received: by 2002:a17:903:948:b0:215:b1a3:4701 with SMTP id d9443c01a7336-22ac3f6e816mr47119345ad.13.1744220919029;
        Wed, 09 Apr 2025 10:48:39 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm14964005ad.148.2025.04.09.10.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:48:38 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 10:48:20 -0700
Subject: [PATCH v4 09/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 QRD platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-sm8750_usb_master-v4-9-6ec621c98be6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744220903; l=1346;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=hZUg/+RZ20nfOCiPzQxS53fZanuVA7aPrSUO9e2eLoE=;
 b=8Rdo1xbQczhNUjlciv4mj5V4rITvKPAlcB0V7w3tsHGIg0R7aBPsW5osc3ahw126II0Pa6Plq
 acxVFib4NJUAdOyD714DQk7cvk6tIqD+1GKPX1QC4sEUtM4IzI/gc3N
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: YTh0lqSTBoxNOImI6V7dC9eFtaVtUADa
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f6b2f8 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EoOMd-xwxZjzz6zYUw0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YTh0lqSTBoxNOImI6V7dC9eFtaVtUADa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=772 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_104841_873485_4171F405 
X-CRM114-Status: GOOD (  13.47  )
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

Enable USB support on SM8750 QRD variant.  The current definition
will start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 7f1d5d4e5b2813c59ea9dba2c57bee824f967481..77735ddcc7ab954ac25aad20369fdc8898283d40 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -804,3 +804,27 @@ &tlmm {
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


