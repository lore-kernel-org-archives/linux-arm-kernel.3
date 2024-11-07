Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FBCD5D695
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 23:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCtmy0HxXe0b8tYyb4jInNsE60r7b6EEJpK4qRncReU=; b=1AAivR7K11az7Zs8RrlU3KwjCf
	tHghMAN/J1qztCgMot98QqReMP2R3emk7W66mrfrTMUsApH0eSdq8DYoMu/5eThUvX/7XrjRJcX4+
	UwzAFohKZwcuvxHy1jQu5spT9YNSeGvMRp4FTiEjFJ72B2onnal9oSPvV8db2OGpCnozHaEHq35an
	jfNv//TiufI5O9EezIDz4a6KKTrbCoZmVxTHtVHuC7k0Eylkc5iia/VPE7Fk8CysbqYeAVBWKsvQe
	SZCur6EzCQtcF3Sk++pX7uYBaKZxEKZlKsZEsQwUeJj+7Lxe1/O+q+NXuwNONFNQOBP3ovy2GBUVY
	vrqiJ7Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9CEo-00000008laE-3VnR;
	Thu, 07 Nov 2024 23:48:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9C5R-00000008joY-1SQ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 23:38:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7Mbewh012723;
	Thu, 7 Nov 2024 23:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XCtmy0HxXe0b8tYyb4jInNsE60r7b6EEJpK4qRncReU=; b=CxRoRrphrXUaYC8Y
	cf1zEtmshlB1CtrflMR3uYeuQ+5pxgq1MA0UKz1BNfPjL54gKNAaGA2wl0Rejck5
	TGaionutzmwqIrd6q8DDkiVuq0jLRIDVdOlTteuqkBiuaQvQJTgOWuIPpUw6A6JF
	JumxF1e+U9NJzQNTNjxQGRCB1cV4BCHyXvFwkzQnO3zy97hRtpjLf5R/q6LFmfjS
	mrDY8vyahMd/lAxuhkGiuml/3bNykmHfGkXR3AzlpnGlI6vsHzM2GZbQWnLyGsJr
	mBAe0BRxADQhMOkTcDuc7aSgJWZRdmvAyZMDHBCFgtAjq64LaVlkYGILOF0vVCB4
	w8tGFQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42s6gm03tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 23:38:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A7Ncdw6006876
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 23:38:39 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 15:38:38 -0800
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Thu, 7 Nov 2024 15:38:30 -0800
Subject: [PATCH v8 6/6] arm64: dts: qcom: sa8775p-ride: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241107-arm-psci-system_reset2-vendor-reboots-v8-6-e8715fa65cb5@quicinc.com>
References: <20241107-arm-psci-system_reset2-vendor-reboots-v8-0-e8715fa65cb5@quicinc.com>
In-Reply-To: <20241107-arm-psci-system_reset2-vendor-reboots-v8-0-e8715fa65cb5@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel
	<sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Andy Yan
	<andy.yan@rock-chips.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Mark
 Rutland" <mark.rutland@arm.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, "Olof
 Johansson" <olof@lixom.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will
 Deacon" <will@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Shivendra Pratap <quic_spratap@quicinc.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Stephen Boyd <swboyd@chromium.org>, <linux-pm@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Elliot Berman
	<quic_eberman@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RVklIsCqsrNkHx21Ja7Z-a2NTjjatmZU
X-Proofpoint-GUID: RVklIsCqsrNkHx21Ja7Z-a2NTjjatmZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=860 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_153849_548542_0F36A7C6 
X-CRM114-Status: GOOD (  13.00  )
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

sa8775p-ride firmware supports vendor-defined SYSTEM_RESET2 types.
Describe the reset types: "bootloader" will cause device to reboot and
stop in the bootloader's fastboot mode. "edl" will cause device to
reboot into "emergency download mode", which permits loading images via
the Firehose protocol.

Co-developed-by: Shivendra Pratap <quic_spratap@quicinc.com>
Signed-off-by: Shivendra Pratap <quic_spratap@quicinc.com>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 2a6170623ea95ad34625b7eb3b729a3e1018f99a..9e8cc21873338f5aaf289df0acde6576d425d6e5 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -498,6 +498,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reset-types {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 23f1b2e5e62471396d8dd5eaf5ecb23e01a5e458..dd36eea80f7c5ca39ae7bd5dec7f469d4f69775f 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -329,7 +329,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 	};

-- 
2.34.1


