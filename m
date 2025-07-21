Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91989C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=; b=EM2o55RN18V6hl7QWJEVk/3PlC
	DLJkgYwxo1MEqxQR0DMXUduQ2VzJ4qyzfMmDntn8Ho09igUSk1yLD443rFWlz1DLQ1kVuaCETo44j
	A2l7y5C5gF2jKnv47mXgT5xh+rkJIu0HMf8Xu5thwY3mTq5QVSPbgyTKai3kHZza2GG74egqVKB3c
	QC0A29qroMWNelU+ArfuKPmMfwnKNYp65agGS5psBPfrZq9vYhK9jlHNIwA/Q+CHNoMClJxsAHT/s
	k9bhChDtUnHsr1gKYbfpjxMrF56YRgaEmTQA6L2X7Rx51AjOZPs5Lpee5IPdn0UEinrAAwTUpqvNC
	0EuZYO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udviE-00000000SLs-0Hl0;
	Mon, 21 Jul 2025 18:58:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvGv-00000000PzO-0NsZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 18:29:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LG28iI005511
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=; b=nB0spFK+PjnDeIyN
	tEVwVVrmb/XJMeu7DbvyqmqHj5xRUC9wBSTAMGPsS+9TnzaGno9DXR/slXcn4p8u
	tweAsIdxeNPJ2zXt2QOH54oa4JCh6h0hR7PvrSpT2/mYhL/VQ3/6N9cJ7/9y3LPA
	YzmgVwTLd1O+QLKvME42UWRA6h5P/9Bt6f7eafed70OWmdq0Yz5yk+15LDErSY8j
	0B32i0zfbQOkZJPZO2965Z8GKseCXEprzP9IM8YNbKDiCYk1ZIHJ5Kg/hbk2T1DU
	fPIGcSIVFSIGH7WwoEnFhYWjqjdJi1glv9/k6maVxASgq7oimgRhemVnBTf0FNlM
	f9Z2Qg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q6v5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:29:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b3f38d3cabeso1737808a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 11:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753122593; x=1753727393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=;
        b=N6RjELkd3hR3Zu4m5LLnEPF6gbD5xqCpX+G7uIWmiBXosniiDnHmLqB03ZmJltQyK1
         4cke75bWUcABOf3/3q6oKRqeGQ4L+0WpMo4pFGt+Duun7fot9a0V7i+xYiN4Cu+arkMj
         HO/jAktG7SWSAh8zjFe3R/1K2udiFtyYoVDiA3sRlrFGxM1QEk8mRYCjWaGDhfNOjvTd
         xidugekhnXh97/LgtuwhRwageVVsp39BeC4NteCx54Xrjj+Q467l7+zzdP7vxOXXHrjk
         0KUrZeaeZ3hUwu8wFFjEO0dYmPosJQcttrZDLlHITNqBlLmTr0yqE+qoucj28Ry1i8TT
         YZMw==
X-Forwarded-Encrypted: i=1; AJvYcCVVVGI5VLZflD8BBloqAme6qsPj3lI3BGcCXxZpr573nVh18KIllfPOc4KIm0T6o8CVOGRoXIJ2gRNoVeDZuYrU@lists.infradead.org
X-Gm-Message-State: AOJu0YzFY3hF/fItQOt/W7YyM5TLXzbuV9jLt0H7pK/KCZSJenqlUsrp
	UkXJ+nf623WGYquO5rbg++597wzKFwpSMEwqb9+3MIGPvxhD4ZpZXzWue2pUhS6XP7dsHnVgKFf
	iK2nVn6FWeATaAqwcY9MQDTAMM0Zt2ZpuZI7PaFyYXKs+Af2+Ki8QG6JlVLa5yNBEjr5HIBQGdA
	cZuQ==
X-Gm-Gg: ASbGncsta+C5qGl+t0ZBhsixw4OlAxSsYCy0a/aKg8KvRmsHy+DYkCLPFFSwrXgmvz8
	jIeX6ir0F8g6p51c/OF2H4OChLclqNP+94S3hA3zEsj0Q9jO/kLaPrOX+vJ/ZlKEOcq9QqVEZ1f
	R/vxOmjkaMUri5FI9bnufpAVqCIxmQ7Wzli63/unLuVzcAzZ1OIl+aN/sGv4/9NbwDbUv7EGTrl
	Yu4BD2k6tASIU+P1zVcSP5Udnp3cSab3eWjnTCmH20YF7C8jk78P9OChkg77DaF76aSqkXT+bgq
	/jTsmZsPwekCLT4K6W1iRuHbPAss1uTGLSc8pM2A2ake0ewuj0GMo8N4M9eJHG96b4VR6H37CY2
	5
X-Received: by 2002:a17:902:d508:b0:22f:b6d6:2737 with SMTP id d9443c01a7336-23e2568616dmr307650415ad.10.1753122593198;
        Mon, 21 Jul 2025 11:29:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEA06S8TFKinv9Wu2LscXJSqCUObI3Wg7g7JStQknBcI4tSz1lSz4wMjNrNt+hJSekJoZkuw==
X-Received: by 2002:a17:902:d508:b0:22f:b6d6:2737 with SMTP id d9443c01a7336-23e2568616dmr307649995ad.10.1753122592735;
        Mon, 21 Jul 2025 11:29:52 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef4b8sm61414545ad.194.2025.07.21.11.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:29:52 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 23:58:53 +0530
Subject: [PATCH v12 6/8] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-arm-psci-system_reset2-vendor-reboots-v12-6-87bac3ec422e@oss.qualcomm.com>
References: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
In-Reply-To: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753122539; l=1185;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=rmo18nL+UB7XAtgXRRqne0fPUU/Z0j3760cEPwsemB8=;
 b=HjHL91oAOUytvzZi0mEKgI8wftmZvhJIdLx+TWOHJsBmGlSiXAn+3kblN7JMKgSlZJrb8QX5I
 TW7FqjUxLbTB2KM7UkhtL0NpuEmetwIFdB+tykDB/f5LJN5FI+hRnRY
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE2NCBTYWx0ZWRfX8Gaev06ZfcN0
 BzwpIf90DgykNnYyNFVEM7vKjE93jgAXmVZXS60xqByU5+7W1RSNevdpit+tCTMHDtkglSafQAR
 QKSrySPv/oJ/Cvfv8Q0UvtPVDqyWyCYzUnnK4kbCLHxEAYTgYBFexMcGqNH22A74romLJkGWOMg
 XUIcU23IJjvppn7cwSpF6hu81NNwd27EB7Hfl8a9Q9OWJV3BOAPUivJrLxJ+XduHDLV9WFowyAq
 y95bNMKvepxxhHFMlalCIV0K1dRMzUx9WPa58A1IPOXhV+jYCer1q6xA6TQuUDlH3brKWue06yQ
 xAnLpbMOQaoYsdc6QLTpkk8A35adn8k45Ku0UyqItloZ1cCO2aybdT+3rV2sws/elo8ftwYbVY/
 CuhyZ8TuPeeRnruoLB2NEUD62lgYxkq1izPi7qvJsuaYpHK+slWYG3IxdJBByyaicRml7cQh
X-Proofpoint-ORIG-GUID: 1RRGVBW9UIXUE0VsuVE9l0Yq_N4lEwO7
X-Proofpoint-GUID: 1RRGVBW9UIXUE0VsuVE9l0Yq_N4lEwO7
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687e8724 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_112957_263685_EBC529E4 
X-CRM114-Status: GOOD (  15.19  )
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

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode. "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 5fbcd48f2e2d839835fa464a8d5682f00557f82e..8cf289a3cfc4ac7014885494c27fb003a7258519 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -966,6 +966,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


