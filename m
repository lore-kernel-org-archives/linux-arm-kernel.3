Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE8BCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIrqaoEgpUjH1gWqJbIHE0oWUKMM91MGVrTsMI//tac=; b=phNW9MA5r6ktGCycUqj6AGx0kG
	awJ67WTf5HfPZ83AlLSaFVLdSic+Wfq7n5EYYe6Yp0tUjjdYO3rwC+nE4l0kbUhLmeNu+0MGlguuJ
	5tVm3Q6Uk8ncvVIfLbxjVHMn349UqYvfv8JfyFROgaJ+bm2y7XGu8xktltlwC41MXJrQSD48Q/zk/
	+bgXGkDh6pkYzhRAJv1DpGY6gTnQZ+ADunk7YIldDKj1O8E7E5ywo+Uw4XTTKZ0HuiyzLTjpk9FAC
	hRSkqvCNTzUVBYIENyrDyM739zSt7zNJb7CxNOLR1/KTkJZQD+hVLC3Ma9FSQJW1nd8NnSUIEFcgP
	Qe5PoYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tIq-00000000RiU-0suc;
	Wed, 15 Oct 2025 04:39:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tIl-00000000RfA-32O0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:39:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sG4a009308
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aIrqaoEgpUjH1gWqJbIHE0oWUKMM91MGVrTsMI//tac=; b=mKTU5L9pgpRzJhxe
	+Hew/+th7SmqB1lfHooMNMFvfhlMEd4BATgkfq36yxsuYzk9OtYH/f3c42kWkzRe
	rzim5UMj4qJL4ICHa22zaWxC2WGWk11iIBbrf5C+tHaNqhY9j54xBDFBi7yeK8rJ
	dPNlewCwdNeyHuv6eauzbBRTUf44kmZgihLeqtIS6cyMx9Vd8DLscKWXgzM2+58e
	DiDVjc3W2W1Dw2N+N3dhzVz+TQLmIr8A1rP9y5DcUb2yrO5MMvmyI2hnxWlnsa2O
	d6iR+gRcoInN1By7tGTMpH2D9YRa50oENZRhLKq2eufxbZU8lxNHkZ7tq8YOYM7S
	+9+MFw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c30v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:39:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso16020245a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 21:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503190; x=1761107990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIrqaoEgpUjH1gWqJbIHE0oWUKMM91MGVrTsMI//tac=;
        b=WeMMRQ5+skxOdWGa/PrqH6NdUtt0YnhDMkDLH/BIywGMk4IzUpPPpoiU40Iw2blcZB
         gpuyubF046rdZHhECZ7UcGUHeimBJQLxAgFfhrUJ9dvdljrf1YzA1zKxoco+tfPq7Fke
         jhO4sBO2NvKKzRdYYYbkXmqWdrLJt1q6fFKXiysaRI6rPCFz4pCgjPbYqn4x5+yWEHWQ
         c4QlaGzXMyOGq6a3baP8DJSijceMvPl7EXbpnSuqTcqoHRnBbfhsTZvp35+iPvtHVF7t
         6eYfZppptMexbMVpfDplIZowcTdV951Jmsp2msS908L7FI4C/BGvKkP8RAIr/NvhtjI3
         t8/w==
X-Forwarded-Encrypted: i=1; AJvYcCWygjGfJuwBmnEUmKWO/frJ7+6Fd52WrgZJtxYp6HFKWCUp5aDQiDiwItLAHT2f+L25Lo9Mlck77fGpGIkZAZZv@lists.infradead.org
X-Gm-Message-State: AOJu0YxKs6kkgMvq3WvA9o0m/uHjjm66jmjfUaaWde7n6TCk0MTwff28
	f0Y6KecwHGJdt4EYzVS+q5MKRm+PQq0e2w3/IpISylcsTTl0MGaKTSlFQGP635AMq/QLFVMw22A
	RHFt2YSjqhVhLdAKmSxNIVuasogijDg+wtwF2hbOMa8cVrJ9B3tDoK9PAfonoUWwpVIMlDIxwzT
	bKSQ==
X-Gm-Gg: ASbGncuMSMBSpwb/gxWaHV4rHsnZiTN3CihwhsV+rv7X8c4Ucdvd/LdfcAm33RSlbvq
	fO+Q7ntV5Hh5hzJc/AD0CjDrf7oN9JI7Bpyaehx3uRi3ktKzsX1vuhwgX5F2xf7uFJ9jq2CHuLF
	Udy88K+9r9Vk+BZrZfeL8HrNnbYjipOHUJAqd9oz5hDG8MVCR08dpExHmhXxd/nR5x24T1aqTPY
	6l3WyjIwkJ4SD9blvUR+YkGvM7JHhSEFgZ5KkZhXU2aOBK+Xbj7sGgpTsBM7yVz6tHo2C8vvosk
	eLRWXF09tPwi+FLWB+gzMfn+fEy7nvxl1MT5TaxZ9icJK8zNKsE2VJcniC8h+u8O1LmM3C/Hbxr
	Q
X-Received: by 2002:a17:90b:4d08:b0:330:793a:4240 with SMTP id 98e67ed59e1d1-33b513ced41mr35775304a91.31.1760503190393;
        Tue, 14 Oct 2025 21:39:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoIBdMWJbuvqOxHpsoJ2SXPuntZq046aG+M0v++nDpNVZ+bCmPJYBX3N9RPRNo9pLI7vYF4g==
X-Received: by 2002:a17:90b:4d08:b0:330:793a:4240 with SMTP id 98e67ed59e1d1-33b513ced41mr35775260a91.31.1760503189905;
        Tue, 14 Oct 2025 21:39:49 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:39:49 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:23 +0530
Subject: [PATCH v16 08/14] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-8-b98aedaa23ee@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=1628;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=CXhzYLss6B84Tshec6CrBMIL7abCTu6KdaOnK+fDvoE=;
 b=e/n+X2V5Goy+lb5dOox9u//usFNX2UoiNBTuRW5PuKfbENSKiL3PsZTGWMHHawy/fOhX9mK3v
 xqtcZS1WfdSCVMHq3PDL9w+vAsdRovHMMHuZtGTssOxkDmn2YtVFCmB
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: r3IQD0-rJ7Owel-Xwp0zAlVZArzIbEG3
X-Proofpoint-ORIG-GUID: r3IQD0-rJ7Owel-Xwp0zAlVZArzIbEG3
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ef2597 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX8G4pOmUJEfZx
 LC2r1DmbegkaVMixhokI0QmQPkegZJwG2n+JFI0yv74twoE2eF+QcNxPoM8x2RNKS3r8hKaURAp
 ogUwUVJUw04AY4xsfuZV0pWhlTs7dL9XiTxMaxWgpvOPrncaX388iu0f3m70k7DhhZcy9GSpTRR
 E5pTBaHsTcdXSjLbC4jTN3FzjNwcyDGHOg1F09QM4N3DJ4G3/puXbr5JIwu1X/8PqqoqlGQyfN8
 6wzeEJZpZb8N1zx4HFmR2HNHy1hsGLIzikqwp77NJytbZfJgLV/lmfZ4ZfKEs603HpkKQdd+NG9
 spSbnhrsdHAvStlbF+pKIBOdAzoyKlXRgMCBDqPhM1O3FLujMuURMkQZxztbrRSoH/ZcstDMpYe
 eaAzKf/GSlRvn9Tlh9UCu/k/7m10Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_213951_797401_08C57CC7 
X-CRM114-Status: GOOD (  16.38  )
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
qcm6490-idp as reboot-modes.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode. "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 73fce639370cd356687f14a3091848b8f422e36c..84322b74917f3a70adce5a4182adfa5d787ab11c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -695,6 +695,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 4b04dea57ec8cc652e37f1d93c410404adaadd5d..211c2f223a03c63a79ddc736c18a5b79faec56a4 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -858,7 +858,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


