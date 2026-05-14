Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4882ACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzWlaO04yyHlsdDuTucopP+bIfNJCQRkBOIVvtEthBc=; b=saZVi6kb7Mqg02LDqrDaE8skIT
	gu7lqwqowWX7UkkYADfi4s+jY7MK5TWHttvT/S35Bq2hnqD981Ttbs1Zf26eW03VGa9KdxICx3dB1
	qi986lxV+iNjX8ubswVOTgXogXSzErIESUyLqkwxyBZ32/xT4A6wNtweqs/q/IaAzQlVp8wcN/Jfp
	tHpBcpmb908ZAOqas9peOFDrusJvrCHPQHw3CUl8IJ2QuGTMuiWg9MyOGd6fGLZc+BKtkjG5H3Ogt
	miy+g/mbz0xzBoa6x6zagEPTcUfyM9bvcnPpP2Q0ZDd4lt8hyt8pgc2jPgihpg/GhwCjLE+zaW6sk
	kfVhcTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX3M-00000005jR2-1yHS;
	Thu, 14 May 2026 14:28:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX3J-00000005jPJ-2Lqx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:28:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeZ7P2261600
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NzWlaO04yyHlsdDuTucopP+bIfNJCQRkBOIVvtEthBc=; b=GMboUtuG1xj1VF/0
	LZjDrzXIme3PohyrPVBtWygHkd5e3XWG1qMA6PRmHGw0B2XxxfhtErGq+3LOjNNy
	m5sqPOp2CSljODTxNyal4QUAhiREKwpC/LauH25c2jTwP0GU7hHP8DxOJyIySNtu
	JHnpaMLhaw97ZIKe0D0S7CJyplUgi6avGb6BF7Ds+ZxFXxWBgBfWg4Gg/ratDCOv
	dmYOh1dYR5NlkhV6f/nI/GiqYWiGiXPgb7aK/rZ95+P37kcCWLDACoPVZFZA1rTD
	rDii4jX8gUC/9InqVgYyF3Mfa7zUHgNR6yzKy7NUW0SlOmg1UdWQ9PyUA4eZ1KgL
	o4+y3g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hj7rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:28:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4530a90fdso188542755ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768920; x=1779373720; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzWlaO04yyHlsdDuTucopP+bIfNJCQRkBOIVvtEthBc=;
        b=eXkO+mV6/JqfgwiZPymTVdJD6IPjopXGxpBgPI+JYJSoaw4KJfunwiqooWPKBHIOFO
         JpSgOML7W0x1DT6C3Dlg7mgpsDSWe98mibNPI2ele/q3ukyoCZJ6HaFEVMUhfBNTXfFI
         3p2GCJjtGtfeYBjQ7FEDcO9njPgRSKNRkPfSzdAUXE+lsx5vKyW+3ms6r+Rpm87yfymy
         CLD/P5rerbBIr758kaiD9ME6CFV9I6jxobjIPxBvTu4rs2vT02FIv1sOcTfvCXQcjs0q
         +L0CKcGRdx1JfHrG7ApsTJ1AoqEvSucKDG5cldK1i5kXD8DTcdxJAPWhjGAsf9S6Lxrd
         L6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768920; x=1779373720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NzWlaO04yyHlsdDuTucopP+bIfNJCQRkBOIVvtEthBc=;
        b=iXnDt05dTTekcB3uxLUMFMX3ZWzMIrqLmmtnkzEOcxaKAXHxp52nPi6z7ojSxFFqGU
         U7M4NhV9w7g78CtG8Au9tRoVaN/1r2QrhGlj0SmSkVLgUchanLR1nZjqU353NT73T0lf
         0/DSkaxwl5ZiQcZlRzlR4lcZXle+/rnMAFAZ1ibMBQTwSVq6c3uMoDnUSfL6CqRcaD73
         6IBmwUgdZ/AqO+fqvCemArQCs0RdGF/E39Rh32PWZnHCDPkweCe1qka8ccAJZKYMlZdw
         0hCHkc6SEOn9zir+a1A7u4+TQ7oSQVptBoXTA5vat7b1z/8RysSRiLrA2yFSjOci6rKn
         i32g==
X-Forwarded-Encrypted: i=1; AFNElJ9eM4FjpOVOY87A4nWZXA67up6ghlob3KBA4NkQ+Wd6DrjuuP8RnEskAWwD1BJ8ZAGweUUNh6zKoU/R4SgR78pD@lists.infradead.org
X-Gm-Message-State: AOJu0YwWOBERlL5IDP33XG9yQSPpVbinetP2X+yvR6mIVBnD2aa4QivG
	LIpEZ8e/HP7Vl4CUUyZWSkuPfVS4pUWGRbDGfGwmvfBda495On9rPMBEN+XRoCV+XA6z+C+f55f
	7cIuZHyMQod2KLmdmML5n60mtU+ulSLoWUxDq2S3JQT0RKcHKdo72+xLX+MfH2oK1kePl5eAEhG
	nj3A==
X-Gm-Gg: Acq92OFi9GEQbqNljQYeRhErh9t4aOeZMKZqOwT/BzHo4BS7y5KknS9QqLRXt2s1e5d
	JllpxyTTvY9Ydej+nozHeavDW9AGtYa+P3b9xdW5EsHqF6DjvJ/d3IhJXvEbSONyTSR1XG7f15m
	87NLDXGhu22PeHBSh9MDm0EbHM2klD+BBIpDe/tG5TTwxVJQEKVaQO7yxlMD6JxWhxULZ6AfnXT
	3cJPwHDOTQc67/YyG+46Eq4Jji52m7yILy1/clLejnSObDnMN17KRU9gz5thAJVYX8KNB4aJk6B
	JtN2knuev2Bxu/qYPK54ribDFnkyTYD0ihZj7b59zjdXYbLy30OIbOGBvFZILPBQh0dTwhsoi+Z
	MAcxZBUxTUrix2QYj4tAfVbBkSh8ORstXYS4/JTv5qEALlaUNIa898NTd4h8tVGN2vQzm
X-Received: by 2002:a17:903:388c:b0:2bc:e62a:979b with SMTP id d9443c01a7336-2bd30333de6mr84520205ad.30.1778768919649;
        Thu, 14 May 2026 07:28:39 -0700 (PDT)
X-Received: by 2002:a17:903:388c:b0:2bc:e62a:979b with SMTP id d9443c01a7336-2bd30333de6mr84519645ad.30.1778768919132;
        Thu, 14 May 2026 07:28:39 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:38 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:51 +0530
Subject: [PATCH v22 10/13] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-10-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=2313;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Z4ZuPORDaKmwW4HgxyAXr2NET55WZqUTE31cMVs09oQ=;
 b=UV3YrYW7ea7IDtY3mvFFnc3oM4mTHIzbv8vLk9734m6TdveIxgUI2VsXxYkgt6YmsWwQrXH5O
 7md8+BNAZT/DDonxcGbchOqjnzcHx957S4NDCLNDmMDE+9AuEo2Hg+C
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: jV_7sgf8SldSR_K_OPOzvKGwY2SJtm_H
X-Proofpoint-ORIG-GUID: jV_7sgf8SldSR_K_OPOzvKGwY2SJtm_H
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a05dc18 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfXzfEOXI6Nt7zr
 BMlWiGSh5JTmm9gWT8qSANY2efQ4EKati8Ly3GFNZ5uxln/QYKH2rO8j5FzXNvmyhICcJ+Yc6BE
 k7VSod6FrmpMGWcVD30mXZHlCx6pgmu7CwkVKVIEEHixsVF495iTjcEHAMbruFhzz0+bEYB6edL
 xYdmES7wwMLA2FTp2yapyjp3D6n33dgS1cY3l/IbxsYCRDaC5OQP67Y+Idu3hW32tGb8WPY7jGD
 Oue8D/wErPTvn8VwCn6m9A67ap13MolQEsU+9ht/hZa3rIsZimC3vrQbmQ/gduFvizQTs1RS+lN
 5qmNeKb/zbdn3oF/DlMOlLSHpmt6kGDRH6q+CGorZ2HISgqU8cPzMHjJ9hcK0SzNFGrFIrwKNpe
 r0X+XLgCg0QJk60Bk6f2BMHMEB8HQ91rQJLnOT1hAVMHzveSWHKFjb9VR5pR4MZDwfhXf5Xkx9E
 cU6Cm08S1AIur2Lc9mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_072842_892779_95FA9D34 
X-CRM114-Status: GOOD (  17.09  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0ec5196c88881f529236c321ad617..72bcc732ab7b64288e1848edb8a55e2c7fe34f98 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -863,7 +863,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902bd37242ba96b90a858ff091e0c80..b7a0b53476395c25f264f2808176588f5943c4c7 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -786,6 +786,13 @@ &qup_uart7_tx {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index ceb68a890bf401ca1d0c787a801d6b192f4e0743..f4af4d1e9bfcee0bbeca892d5386bcec5663c20a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1096,6 +1096,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


