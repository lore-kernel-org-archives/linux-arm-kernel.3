Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1468CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZI1ulbnp33sSmZzOl/WukD84JC7rm/wreXUDUVjjRA=; b=LcaMNhcduHlSPY6NT/X/vpHTbf
	/uZyY2HmCnj8cXbIzrld1cPtUz8DxL82BmCD1xq0XSD92+scrZjYxd/w9HGKAfBakzOZAjxfTKB3U
	F/SMlpHdshVY9EmlrsLUxL68jHcn9iFT1MCUjoHmNFSFEJgLnAtc963dbAorQkbwxdmaTHSNyXA6m
	e57lkyfsASxtIbuPAaFmijcP3VEu12fk7Njg0+ySKMMqYTx4Glt3pzmq54Ms1FpUPezYguLBOSCL8
	dG5EYs29rU3DavJeYuyf19qOeGHZ5biM2YBREyDvLwg6om1UvjrOF1snYMJedbs9/2VzsATnqP0TD
	KgMLibnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxMF-00000002yjG-2aqs;
	Fri, 15 Aug 2025 16:32:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvYk-00000002joI-29Tt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 14:37:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIkLj019986
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eZI1ulbnp33sSmZzOl/WukD84JC7rm/wreXUDUVjjRA=; b=H9ZqoocqVzOu22rQ
	KmYlkKXCct4rsXUqtMwuL99d67dAemPz3Z4ECLC+DfY1v4FUHx5W1dplPUt4mS3B
	k75VEJqDi7n8KsFPDfJuTBQEXS0IcDQeXwRPZYKmp5n6ZhXSKK0GJiXn4aFJnKzI
	tveMC5u+gh9HdfHrJPWADiDLcMMfrztP11sMbhkKm3OzoBCQQeIrvbzBqqRyc+Cp
	9rY+wQPz5YNHJ4Z3K5tLalxqQEb42qrTPOCGZzhQQAWQtionjqMaxQ3GtzTXBROR
	V7HDgtcgAelaQf9acbhrZx3IQ84kN0avR0bIUAqX9utq8ADIK27dP1qLambGa8Bi
	dfoiPg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gk6q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:37:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b47174c65b0so3324049a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 07:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268653; x=1755873453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZI1ulbnp33sSmZzOl/WukD84JC7rm/wreXUDUVjjRA=;
        b=IoJIHCOBh67BZPGFtsKpGRo2XKjVeXz2pphlrC7y8NIwhHveAgJThwX00oFDsBKUV7
         Bnj0nshmdfTigj5b9ZZcqBVyRAoEp9mnSotLGgKIydkLeoHO7ljSH5DlxRNIAqQ7n9cS
         E6gPp65pCXcPfrkasoSDiHMIuh7i80nfFuJq5+hbH5jgDJKGtIYKYonMTbupnhk70EZ+
         WHGRR165/F1ATNaFSWU8kOESJpQnIWwOQ7M9AzD8O7cWx7AGT61oadLqB1+aMmpXYzms
         tWHzbNdLC5iXoF0XxDbMZ8IXDt8pJMwDX3Abl1TK3ZlbhX76z3j1f5lDfa19/Z/EdJz6
         8cSA==
X-Forwarded-Encrypted: i=1; AJvYcCVlkg6bKZZpYxA9xe80OF6w2FhkmehCJd7xSNv3n6mC5Ch60sPf8aAfJbUgaG3IQSASu2pL7/kRb7PRDcJ5veY/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1yuObdUnYqZzlV3jh6FPyEK5kiQM2FBFNE5LuPWBof9F2B6TR
	yrheSw+QRignLo/gaWjQYprJKZqC1cFYQYZCB2R2n7mict+DeLbKr465nzudYLdBhm5+oYBl0rc
	C+vmGwcGL00oj0aYu9p9dQXDr8BMSAfnCTq73c1e/SM5X78lwjHFUvPrM/3blVukk6dm1Qr6Ath
	3bUw==
X-Gm-Gg: ASbGnctWwFsFsuiFqyF9yRvNIfF2ZrjxAS8uoVtzmhMr6yTtifxNNx6qRLjSTU2OzhG
	KiUifhXy2hn8ioVySYUp8/4FeHpvJ46aYCWsYROU8SMtOL0+alUEXevB0JGXGI0qgbZoFqEkvxb
	CiQg1ckNXl9hrlcfuF+yoD7JmXy9+QOjhqWG5X9JTsG6Spd0JFcv2wwIjUperh/QOWopYwMJA6V
	PBuyZDyshntrmoedLSUofODshDl55Nzha/bedjOMmmwnfZaKoaIKg9XPKIg9NYG8sKMRRe2PwR3
	7u+duHl7HAInACzB46ByM3bTDpjcZJUUhg/LGbV0OYMqfixmNeCPwrouopNzvSlacsSqYzlPK73
	H
X-Received: by 2002:a05:6a21:3393:b0:240:1c56:6495 with SMTP id adf61e73a8af0-240d2da1ab2mr3983852637.14.1755268653303;
        Fri, 15 Aug 2025 07:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGICSeKOM3amu5cDfHsCt6tTSoS71zRuUcFNv7sC0jlLIlPMtqsbosekt2XumDOgR42afsnSg==
X-Received: by 2002:a05:6a21:3393:b0:240:1c56:6495 with SMTP id adf61e73a8af0-240d2da1ab2mr3983814637.14.1755268652889;
        Fri, 15 Aug 2025 07:37:32 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d73619fsm1437576a12.39.2025.08.15.07.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:37:32 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 20:05:13 +0530
Subject: [PATCH v14 08/10] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-arm-psci-system_reset2-vendor-reboots-v14-8-37d29f59ac9a@oss.qualcomm.com>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
In-Reply-To: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
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
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755268580; l=1628;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Dajt+SLbZYuP9ZjHPqwB/7XOdBkGsUiHd4YnzMvhaQQ=;
 b=MEXYaGDuDuUFhmah2GQbSrJ4wEfwuNgDwr1BX5PcCzsPjhFaX/Ovj9lBCsR/tOhqe0QLmR7rY
 mE1K9DazWzSC7lUWsHUgB371f3yxxZgg08tvl3sOq0dw32CLkCKQbcp
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689f462e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX5/2AoEdwuLxv
 DjoDq+TeACOMEuWhYK3PBGnGuNMpAUbwJIsIgRdtq5KvIMqqpQoxuLIfm6byFEUmAWvBot6x9xj
 qOQIIHQi27QZ0Ye8+iTYXKF2C6Nwj60MV2Mxa+chl2QcAMoYDYZKHPXu9foQTEKqUFJtpuhvEmr
 AkiIeXUpU3k9LkXleAI8LyRABhFTphfoDwVqvVPX5z8LTT7cjxnxbfpHUr7XVy54LJh+ko7NupK
 RjC9X52K3uWZnZv6fwjtlYgYxAZWVq9SQd8iBjb7ZJU1HnDYNYwJSf81y0fVvL1lG8ZlsmHDOy7
 QinLIwgjPIaUin2qo//B7tcuK0XqSKyGYquIOeZlRy7GHKLa1kUS5BqOEYYmxBQ94feJ+jPIMBf
 UqSTlDsI
X-Proofpoint-GUID: sl-taFKs10_yAXJaxGJayV1CjBeTLZmV
X-Proofpoint-ORIG-GUID: sl-taFKs10_yAXJaxGJayV1CjBeTLZmV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_073734_567016_A3D435FC 
X-CRM114-Status: GOOD (  15.51  )
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
index 8ed6e28b0c2977b831a1f156014eb9d6f70d0243..51d5991a5c392d2b7afcb5dd7726a01ededc199c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -654,6 +654,13 @@ &pon_resin {
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
index 0dd6a5c91d109c78333f6b90104fa51fcf3bd64c..0db3fab9915b247d3c30d7484625fbd89a3514d1 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -857,7 +857,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


