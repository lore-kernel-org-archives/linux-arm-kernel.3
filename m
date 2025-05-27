Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6295AC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 21:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teg98KnCXRHpbibmB3t0iTGw5Sr71vWVJCSu3Gc6TZo=; b=0ZKo/Yz1QFxlfNWdFyZQ7VL2o4
	dz4FQ4dOXYnvQNRhJ2QA/etvrVHEHyo+23DY69E4V1wYABzqwYOjHoMn9p0UFt9ZcNPS92Mh5O4N3
	V7BJNhlw1P+1w5rmwqA0qw5s7rhdyEtsscKm2KCyCoRc3UmeSCRz8w+4up4GRV36kIMRdAidd9R6+
	q4dKUSSKClMQUBqndHMtf7pmYQRNFLfrom4XzWlu6wpXrqO84xF/htI2DEtJW8CjUyvIGkhdwTNbx
	P2PcWmHgsPNTkJgfTxZ0tJgIMx2elBq0UBbs+7umcP+t3x0WUjRY+zaMExWLSdi0AOfwnqrxkPFou
	itkvwYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1mt-0000000Bb6Q-2VCn;
	Tue, 27 May 2025 21:24:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1Tv-0000000BYxW-49rE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 21:05:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RFn7tJ028211
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 21:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	teg98KnCXRHpbibmB3t0iTGw5Sr71vWVJCSu3Gc6TZo=; b=XXLFu+zJIXzaJOnH
	6MmY7OJEfvk+vqpjXwDNKNhnTFbtvufAnTxh0w43zpikEqqTLCYhUKVa5MY8XzVA
	XBJAD1aHs+NBai6fjOp52Bx1RzbDkUatBByTbzuPgJPwfMLFpVgb3Sg+OBnHvkA/
	oidME/ep06EwgmBqQCMHpldraWVqtH46MEqXGm/cDll02vDhM9tqtRNubME16HPs
	eXvwB16TAaTZTGAow/4+PY82BOZt+CAxfoeQ3g4lgi0gGrlOs+YoQG+zookZh7Qs
	0rEtKo694lDbsfnxz3eDjrRTZBJxvSeklAkL6fncQHDV5vP9IV+ZEF3QLKGRcvSq
	kKqKaA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992j8n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 21:05:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7401179b06fso3047222b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 14:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379906; x=1748984706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teg98KnCXRHpbibmB3t0iTGw5Sr71vWVJCSu3Gc6TZo=;
        b=u4DdvT+Dvvs+gP6q59jtIBXwB1ypmxRJzmifBRCUOwg6xRqlY5nvkbPZdyUktqiveR
         ZmXvbPlll8uliOUAUuAH0kh7FzxxbE+r9PRuP0+46zXnGd92052yhdLOd5i42kqZYK49
         12XDsWdwp3Yh+f0aOviapb1jJpg8m+nVkF8ma0FUvAUOTo0adCAbxGpAEChBu+AGU5Qk
         qJIXwTwckfcdWWDPHfWKGdasBnVaTnff98NN10thLMsqEz+dz91ymLMXifqClVwx3/Ci
         AT9Hu680kbyXU2ksUn2dns0MBxUls+sFIfBg9RnmtvWFBrG9YN2ynYa9D49M/CNodj5q
         u6mA==
X-Forwarded-Encrypted: i=1; AJvYcCUEMvDt64IKzgiDqPXrc5ihWqXxD4mUm3pihA6MFN2Rwt+P6LqEg0V/x8QxrYWCsvRqxj4ITAsfpe4pZNQJGOzv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6wQEGpflp5rikm3qIjuLGNiSk2RohHekybjTYKa+xyB83f8Jv
	ssw90mVHgt0gwI1Vu0sBa8ZUqr6egcYMwGx4aGTteRShvXwYMzQWewMzkFmTOEWpPVOfNQdEoAU
	1ahd+G/ZfK9T/HflQTSSEVZx+jWxXXpx8rsuL1Oq5oVedmLggHa/G056yNrZMZQ/pq9qiRPecxG
	WGhNHD/qLqGA==
X-Gm-Gg: ASbGncvF1T1vPZEkJPLte+2inQBlW9WlmB2g372rVc6gvbBbCySDtZnUCuSerU1TTNH
	9j8BZGO1o87CAXOWkGOqQpSXsRcLBDZ89gKnhJuDBTpQepfFz+M3Om7J4NycHvejvgofgrjEWWB
	W45ynqIfbO5wecSSCoZ43d9Pg0ErTJPnNmYjJcHe83VBMeTBo7Tge0cbxNdlu8CuG6BRw4KLNdB
	i68h7w6hZMnmrHg1Tf225sYgTFCmh7VAqPhOzTXpdC+3FuuOvr5dGLIBMvvTax5boBXmodnIC+5
	EenYXFWtszM3MxkitfbcjVA5OIa3zziWTl0M0ySpeELTZzaWN348xx9GRvt5sc8oE/A=
X-Received: by 2002:a05:6300:210d:b0:203:c461:dd36 with SMTP id adf61e73a8af0-2188c20df49mr23718630637.6.1748379906519;
        Tue, 27 May 2025 14:05:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFurMh4Ktwpp0qvzyqJkXxlrwd4QWROOgS0twx82tbgVIupB84blzpNgeeLHqbI8CEKvbsTDA==
X-Received: by 2002:a05:6300:210d:b0:203:c461:dd36 with SMTP id adf61e73a8af0-2188c20df49mr23718567637.6.1748379906065;
        Tue, 27 May 2025 14:05:06 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:05:05 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:44 -0700
Subject: [PATCH v6 08/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-8-d58de3b41d34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1355;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Nx4I/ZG5m1Kxa6LCnqamndwPnsXvis3d+v65oICH37M=;
 b=Hp/G/DtacnwV0EhGyfZOVZRkpEebZE/+1C8caI/kuGc9Mek4iJ/VNGTuOQB6QRMqQZR9IOssZ
 3IGYp9vp5sFCd3IY2cf3mgW1K0ADTPQeQ0gcHgh7c9fof70ePb4DYOm
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX6YtHEg1P/ryq
 s+toDUKvaOzVEn9UCGf6ELTbP80LqjJ77SnHAnc/eKBg98o8rXj3dk7aXzis3RDO34DKcwE5vUg
 UnZtoqYBMa/8VRPpXvRpM89QbxooQy/ZlfamrKtUp1LKJa/zigP+uSltmhAg5h6EZ+Q+b9UJNmt
 cr9EsxV10K2vJ7AdDwrjQdkleeBDt3BStQzaV+ZLYrHl3QKMY9feF8/7NFUtCyL3nmsTRI8J7dU
 dSJeedZJpKH09GeZ44f3q8WqK5HMnqHVfggi3Xol9TzZ2lbk+JqCvYRcpDHwOFyDQRB2f2ACbcP
 Ql9gxUdjCCPqsHs3QeDoOpGG3J7LWi8JWEjEE8AVgs17B4BRzebVoKjt4JEtUeUaSQlxMqbjwdm
 ss/4VpWUbjU4QIuTIK9/jqrOT0zM9Ltr9QMtUJs3h+/vcOkyPq2FxrmEOTf6k9CS73+8+PG8
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=68362903 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Tsvuh88POXG944tnl6EA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oWJckxFvQYgOSQgeSjvT9q4APnh7cydE
X-Proofpoint-ORIG-GUID: oWJckxFvQYgOSQgeSjvT9q4APnh7cydE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=873 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_140508_043907_08F47684 
X-CRM114-Status: GOOD (  13.70  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


