Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D241DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 22:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85FTf5dq3WUxvPAL+FcZsdyjl6Gon2Kpy0Ag/qYK1so=; b=PgL9+X2ZjFv2cEYbdy8kkvPFEy
	xjEf0SovBEUUVWxPrcGk4zJH0MVXQ3on5Rp7QWFey7EglaSFNwKD0V5omcQ+qqZ/Lrw0HAIc6w/Rw
	oTODDzeY0cZvCH//6AU3eZBzwUOLUkmZ0mIqTa8bE4J5z+Dmah4suZr4K8vYeou/jQF2CFugQ0oT2
	yAhCdLj1zqSjTUR+dvzRdrEse8kA0wziW3bbJvqWisu7jAWMdtr8X2sYgNhj0JFc3dwagpb55DmA4
	g602mE2zzYeObxT5+GR5DuOk3xdmNPCT3rAkctD8Xui/ateRCc3shumLuKBiEV5EdKfHGlfIOd+LL
	DnP1AV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zSU-00000005J2a-1BZ8;
	Mon, 21 Apr 2025 22:17:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zBy-00000005Gca-1NwG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 22:00:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK4H5A021861
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 22:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85FTf5dq3WUxvPAL+FcZsdyjl6Gon2Kpy0Ag/qYK1so=; b=aaGE6rkCZtdvG9tc
	a1qJ8uhw3iP4HEmPkIB9O7+6NRD1tTXAbC63ftEebmgZjiue074qGi4ystuDl6U+
	DsnqM26bSQWEJeZUgC+/1Vwm0JTGiko1mm3gy7ph+P4ZOFZXnNwrhurZ3uPD+lUU
	9uclUqLnPUgUHQ6aK6vJFSTuN0raWCwWKmK0TK1y8GGqsbZiBoYoXVmpRdylZ87t
	VjlHmU//+4TjwtmPTnKPADrHpNu9ygdOEMuZWAv+mQyX1vc5li5G+Fd09UmfeKx2
	uI5b3z5l/gcd3RW5dSnU3TpHpVUIOgbEHk95ECd4RxhwGqoAcZXC5+GWu+42BCHG
	MEbuxA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46416qwkgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 22:00:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736cd27d51fso3580030b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 15:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272840; x=1745877640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85FTf5dq3WUxvPAL+FcZsdyjl6Gon2Kpy0Ag/qYK1so=;
        b=BmOnf9kJUKeAnOxm8U+u8yvsEIIVwrtGoNv7ioubzK8xrpoPymFN9K4yyG9K8uVLkF
         1ePYBCOT+kp/TC3yHyIcbDkVOQae7j1He0KDK+6LrFnFKXrDuv0A59dWOTVUXL9IYCLJ
         HJu2PKGB1z7aZX/UDHlqKkb+gPAugM1sRBO0DL1ZjLBCMF4C7k6jVo+TheB9DcYfUsJj
         NPWOzzzBrFPrNZ3RA2dGISwXiNA+OEutguWDSse/ynf5iDIO0fPH+OdTfCUTYBagC3un
         jG5m54ABWN9bc68EDWF9xCgdDrELgdWkB7nvs05dKAeGyX8LekN4xdonz0+2quEjYQvA
         uYEA==
X-Forwarded-Encrypted: i=1; AJvYcCUiqeOaJmIC97UD9UHEG6ZYRbEFCUhzPRBuJYDAP/roBzCimoDfWcrEoRHVmHk1UPP2ukhWg0L/SZarVJTU+bwR@lists.infradead.org
X-Gm-Message-State: AOJu0YxVlFKOKFgbtHMMalqLMPXScFX7288FK9IpApN1SARhPpFGalAR
	xe3GbddcgkBv48rqbkhyGrnH1o/Bu04IHZ7DwEY7Exp/N6DjNnjANJ0t7TUCWoLT2qi31md/DUY
	rVLEL1CtXrTaOBcO6ohKPOG+lF2lOJiRBWMVnO7ZVVsx7Wzfo0eyoiiMB8EYA0x60g2kpvAUDyw
	==
X-Gm-Gg: ASbGncvvbYAraEoKdEJJa1AXI7Cjdz4Mb2vLonA8yqvIM49Aofjd8Nn2JR70G82J64B
	2w+GAGfT3Qll3fLrhX42VGM66wZg+YmkdPOIIFlhpjLf4jIqizmXy81KFlzC2QNuuRzBk+LQfqS
	bSPTI1juVDoBNpJPP/e/ZlECZvfmnsbqLbwTbYJ0bUwv1UGfFXfPDAmA2ygEWqpDtO7XgP3rDsm
	X9Rom8bjTC54c7Zl04tg4onvrXNtQkNRj8hC1fPvHJsf1KToEs4Z8TNRxSDSUQ4CUK+WeCdtktU
	4hyz4HAI3+HH0TVC+E94NrZjOgvW5p/lGVkNXrOwoGyo5WcG56s9gi58J0mBGSTLzCY=
X-Received: by 2002:a05:6a00:2182:b0:732:5611:cbb5 with SMTP id d2e1a72fcca58-73dc14cca88mr17001096b3a.11.1745272839430;
        Mon, 21 Apr 2025 15:00:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsdbfJsm0KdV60HiBE6DxPravmfAWBBMxUJAVErJZ8Mc6PzUneSapkKYNVVusWvrtS/jXXkA==
X-Received: by 2002:a05:6a00:2182:b0:732:5611:cbb5 with SMTP id d2e1a72fcca58-73dc14cca88mr17001010b3a.11.1745272838817;
        Mon, 21 Apr 2025 15:00:38 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:38 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:15 -0700
Subject: [PATCH v5 08/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-8-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=1288;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=+b6x2t1UZ9tBSOYbcUj0Sk6c/9sXGEBZ/MeOUGfqqx0=;
 b=soft0JCqQzQ4F8eO5+nGm1bNhAoWmg05DsdBm5joEmpWCGlAn4jtQjnOkgw73BUZ0YG2wzdbV
 MIzfiTfDUVVDzggWNSMwA7WyAd2Y4JqKHO6Gfg+pWQ3VJBsB2Wx28pV
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=N7UpF39B c=1 sm=1 tr=0 ts=6806c009 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Tsvuh88POXG944tnl6EA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0D0eewxmHYyb5kC1sy5WMj6SZqF6L6cM
X-Proofpoint-ORIG-GUID: 0D0eewxmHYyb5kC1sy5WMj6SZqF6L6cM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=866 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_150042_499611_A25D72A7 
X-CRM114-Status: GOOD (  13.16  )
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
index 72f081a890dfe49bfbee5e91b9e51da53b9d8baf..d28e45111b8d01c2753493a7a4ee248bbb334aa8 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -814,3 +814,27 @@ &tlmm {
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


