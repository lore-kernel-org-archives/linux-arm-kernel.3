Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2A4C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 21:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ma8TsHB+F3p3QSMnqT7X+sjQQo7g7lCsD9xj8Lp3FGk=; b=UD9YNahZ7Fvkrb3zhcfpwadX1H
	avgu0uhIIFfmUvgP/sFEujWItPC0epy1uLlMASF5F5xw2kOmVXTZEOR4bLC6GfNgODegOP+nCOa8R
	uTnNHufn8JaYMudy7hbnvzBo2XiuwN6U+0nwgopxuRnK/VcNVbLwB9JMiRI6gctfHsyevh2UKbMxd
	8hvVuzib8SGwSx1qzmRT1N+bwvYBGlpBbG8Qei/JnNXmw8BoJYDxx86f0O+yaUcp/P4oIqZg5x7lJ
	JAeMAf80NpqrZ5BXChenBMmIhCMvwqlvFPP3FaoCitWaZ1I9ROWNxlrS0kebp5nofZEQXukYFfACv
	D1K1AQJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1p0-0000000BbI4-1S3H;
	Tue, 27 May 2025 21:26:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1Tx-0000000BYyX-46P9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 21:05:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RBarOQ029656
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 21:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ma8TsHB+F3p3QSMnqT7X+sjQQo7g7lCsD9xj8Lp3FGk=; b=Hn+Q1/js7qPqCwal
	QR0R6xiRErIo4DEK+STvZLfnrw+Qgh/ktGhQCxhH4XVsGkqdlpIEyZjdsB2XZTwr
	RAEvBd9mQ6/EyLGYMig0WJy4a9t5mHar9SKs6i97Maj6yZvtRFeesGOYF5gJ/OiK
	z0bzGKl9pXTURbmw5WV+xAj8bFE6stwakJ1Y/wHGKFDa36jtEV7LI0evjZ2hVTgO
	lNd7wjXcBmVYW8/cSgmFC7onsGW/LMVQ7Os/B6ccZlX7w1Rra7zu1RPs1G7VUY68
	/MgQX1kUNqniV5Yffbua7o6dsLvxkwRTp3XwGYpYgAnhDeS4bD7w5QUZj8nAYO9n
	qNnYAA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691aq19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 21:05:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742c5f7a70bso5185529b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 14:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379908; x=1748984708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma8TsHB+F3p3QSMnqT7X+sjQQo7g7lCsD9xj8Lp3FGk=;
        b=hf+XweQ7gfOJYr3CMmi6VBRnpZIHcXZIeIW/5QohgVCHj2rcHVGT+rne/P3qbnvPeB
         5TJNC5VMm8gqC87iZtMxJRX4QelmGaGzu/vA/EjYo4EeBw5BDi4CfBlp8wfTTpBKaUr1
         yZJ4wvExPV9vVXwEpau9B4v0orSCIisWyp4q5tSvsS+RX0c/apUcTgO6PioNMHsXZl+Q
         T6cEqEtQnPFP2ZSLz2F8u4Wlv6d/+/IXPUptV0YW6IW+QvzIqxF1vGDmyMIoWJ/be8B7
         LzIS/SmhLQ36XAtNHFwGpr+n3KarntE7fjYJwNMvlogQ3eyJekGM2I47JIdXtMbhPR3u
         4BhA==
X-Forwarded-Encrypted: i=1; AJvYcCVsZsnLS4P7gmZpLReSoyKH7i4VN+8AtpijdpFls577s5b6avijOJYXkRGXL+7ChyND/nopG8uA9C6RXp2QCIRH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq1/1L9BAFt51Uos+Nwj4BMGmXoQrv0BFnJiPHiZ5jmPEhH3dW
	y3brIqDlIXa1ag4HxLVttV5UGm2zguu4hZb3SBuTdw601Tm6L4AnWK53yhwLHl1hvUVM41UujKb
	+c+Odtg/+7TNGHiVSbgAl/1PN5rzQHzNMUMzllWRuK53NSYuFOI8ELuSiROgh9orMSvFMD1VUq9
	fyGl+clYkonQ==
X-Gm-Gg: ASbGncs+2wG5Zmy/tXI21WV9/B9HLugHXiRHHqazvgxp1lUXuR5oKdqJSe532htFqRI
	5ZOXaJ7PiWMG7LDwiqu5btgur7H/LTF+stbq8gRiq6wjZxf8f0stJwAtdPIljuZz3+9bYNQNOd5
	KDAPANwp8UTQbL20lTynw2MNUfTxOpFuU4/eINMdn6j/FGBwGEaL7V+X2oqFky8sq6pu9noK7Y2
	r/FBM3RvfD0Z5KKeHGQsQmS63UatJ/EUmc36bEqXSfh7f42Q8leweN2RQlUvOFb0aDehY+5x5ps
	Jkm5Q/Y+q7x8F8TESoIPBhNbug+JoQt3tTWu7ITdBsNuVRD0Q5XtfbmF3+eOAoEIiSs=
X-Received: by 2002:a05:6a00:2388:b0:740:91eb:c66 with SMTP id d2e1a72fcca58-745fde95d69mr22807110b3a.3.1748379908170;
        Tue, 27 May 2025 14:05:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2Bz45OE2w5HFnK31wbhlsPZnbFbrdn+wcobk3wqYztQHQDfpbs/apLivFlaZLBGsaPBctAg==
X-Received: by 2002:a05:6a00:2388:b0:740:91eb:c66 with SMTP id d2e1a72fcca58-745fde95d69mr22807051b3a.3.1748379907716;
        Tue, 27 May 2025 14:05:07 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:05:07 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:45 -0700
Subject: [PATCH v6 09/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 QRD platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-9-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1413;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=gc+u2Wnbmer5INhP/AFAJkM8vbhhdjKxQE+MTNg1FPA=;
 b=4AgkM8l55iNY4RBu1/FwiBbrVzA4iniGJCA7yl35iytkMEU8TFElS/1xm1j9EFI9+yj5eR9fo
 gy0q4gu7itdDy4GfnuSGHdb+p/19GMumODCz/v+vYfN4+QHWeaYoKun
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=68362905 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=EoOMd-xwxZjzz6zYUw0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gmjHE5mDB-xBLI3susR08voTDTL9-HxK
X-Proofpoint-ORIG-GUID: gmjHE5mDB-xBLI3susR08voTDTL9-HxK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfXw4dRZ2+Em5Fk
 IFyxlKVLsuWEUXwgLj5OJox/j+jRgbm9TyL7LjTjsTWC5OgOIyLh/zNMA41IIoe0NYfOA0P6lwC
 HWYWyV6hkThz2tGpUCN0wPqaf7bPL/URiEiNodDAaL54EP//ewBHFt+jwErFdBn17PxYcai9e8a
 JNHe1rDTJuxql6X6k6flzmVNIjsQjii65WJQw13FaLov84sucGAvfejf7Abz276080VP01XAmhy
 um9dP7/llhAXjvSjhmcdQWiqBFFWBNU0hzYJ2BKd0KqzPPe+Rd01ducTmG7rdPY1ZhuXPjwR/Pa
 DyPshA9PV5ePukGChyUD5Zstx+T1uo3ILjmbrBpbABDjsoyHW/De/tsMaaTT5n7G77att+usX03
 aNfgZdoqkH9PR2R22ijgBdgu0yS0jvKkJCjF0wMmKbRzgjE0neVIn0uTQZJbqdSVtnR+0/Jd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=837 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_140510_029067_23578B7F 
X-CRM114-Status: GOOD (  13.66  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 840a6d8f8a24670a01376f8fce511da222159016..5cb18ef1bdbece09a7626b57a852379a62985995 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -811,3 +811,27 @@ &tlmm {
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


