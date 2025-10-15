Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72143CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCB9nRmhWTH8UllODqI36LPvufsugmltxoeJ4FWith4=; b=s3c0OMYLpnPnwoz2zKsyMgSX7r
	QqSrCzRsqKGycC6jH51NLCyuCpx3MzSNfW+bjjEobvUSR+jSh8zbxoJHOESiOAYlk0yzCK7FBB6c8
	quxl3x89XwvBXxvW6pABsFAdXrCS1ixMo2K5rVwinmZno7depnYbf7mxcJTmM1s2jF92SDhsdSacW
	q7gCP39DtCTJybbIntZxdhtHGGlpqzZG+JWvLt3Z06IhNsIOEdwS1Lrsv5WwU/DptnqbZrHgR6tZX
	KaLJcIyCYfXqzyr1UJt3IblPi3buMJI82Ti785CXjFUSfcDO+Bp/d9MKGl/QPOYdW/3+ZWi3HE15I
	AV5OZjDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tJC-00000000Rxk-2dkw;
	Wed, 15 Oct 2025 04:40:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tJ9-00000000Rvi-2y52
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:40:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s6xt024767
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tCB9nRmhWTH8UllODqI36LPvufsugmltxoeJ4FWith4=; b=UJ2lVrDKFv2mdGz/
	3tE6xJu17u2hUzwgWtYLuS8SgdIWLjUltTlQ7lc7hYSb4GzAkAt89zbcSIWRZYWI
	MstWr+K8ZerCcuvzToMDrInagM+61z7eGbdk5xiO9IMJcsY3ZuehTYC6wklOy3vR
	maoyzkh6juFzoLxZBcXnL00WQVTmEfhHXqgfB/+LuLl43zEGXyXVUQEvorTx/Ame
	fnL+qaVeQeXjbzGVcSlKRj+H8t74IYWCflb8FQHRpzq1vki+PND/UIh7RHujzmRJ
	z1kbjZe9kJn9CCE+ZWvZ8EV8TSY25CJYapBZFuMmCzFroinDTjsUUdtx3iCGIApY
	LmlLAg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0u1mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:40:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33428befc3aso12271217a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 21:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503209; x=1761108009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCB9nRmhWTH8UllODqI36LPvufsugmltxoeJ4FWith4=;
        b=pDsD8xB0zAk6IStPHCCr16s5LpHsz61619B/QewBKuSwqJkEl/oMKA629D2x7jNg6g
         YByKs1nnOfNDHt/HrU80Rcqjat0l4EPDQzZC1N/R+bcjGkX+AP9ZCgkPdzu9uQ3Es3/A
         nZPGabUYoXPQnk/thGb96YPBRPbIIISGhEAysmhkyyJT8nv1mnizX5MyCKnbM61xndzP
         w1Sl7u10ecu4IYySfbiMMeYJAysPoDbSX1oNwT5WlWKkqqHtiDNu0OLdPn61lU8jmL0U
         eGgpV7AibXubsI64lIljQ9hmqevSLJaxrxGWoqXfENOquoStXdJG3i/U8Ox131D9M6IB
         EVSw==
X-Forwarded-Encrypted: i=1; AJvYcCVHgkSYSn2k9FqCF5ZQSG3prihZh36ynTzy9hAFxvRaz0jzMimmZG6FiLky3rAsKrVE8GlVn1dS6P6cFRX/GP6k@lists.infradead.org
X-Gm-Message-State: AOJu0YyIaqGh2lKgRu6V6t/ilKCBQnqCv5DJdNkpGYgu46TKYtwJj748
	7VbHiU1WAeNXly7K6hOP0ZvGiBdq7INGMIFyi7uzks8SwTbhJXG636RyCrzI4CvHt1+j4vfYNsM
	UDkGReDfL+koP8eZEa4U3tlZjA9BWO51Tbw5pnGkZLkpFHNmyJOji3g8wqnmLTtvwaOVEPqbL/7
	JR+g==
X-Gm-Gg: ASbGncurgZ9/IJWoxiBpJF+cJQ3TyZGixl687fRPClLeLVCq5SlYVDzugj8ZuOS7iQW
	aeB5QX1LfeUgKdgcp+WbrbVgVjYldnnMKyTk/LVhM8waWT61ao+r2t/fqURQXLcmcnVerlWSYsh
	YG2IDntO7WFFVIOxrIcLN/LNYUho+7MIsWpuPTDldNXxZ0eOxZoroV6RSmc2ktmu8osm8x6p6oH
	+ac12JFIcck5NJXQdKyjfpsBBMX5o/G/GzGCXp7LtHRtFmuVEE6RS85Fv3g+OmXCIS0aC+ANtEX
	g2sArrbKmXmTknK54dyZSO/wqdgqPTrIGcjB8YaDEugg1skkGYANJCblUpstLjQlsKwen7rQyWU
	o
X-Received: by 2002:a17:90b:4b87:b0:32e:e5:a90a with SMTP id 98e67ed59e1d1-33b511497f3mr39789338a91.8.1760503209247;
        Tue, 14 Oct 2025 21:40:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHORSza0VEh/h2tJOvCDq92nr7cNJeRD3CAUWw1vY0j7DXcuVHyWT86lYWW3ht2Z998Hh50Ow==
X-Received: by 2002:a17:90b:4b87:b0:32e:e5:a90a with SMTP id 98e67ed59e1d1-33b511497f3mr39789278a91.8.1760503208625;
        Tue, 14 Oct 2025 21:40:08 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:40:08 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:25 +0530
Subject: [PATCH v16 10/14] arm64: dts: qcom: lemans-ride: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-10-b98aedaa23ee@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=1694;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=zMGGltlmXa3IlmXLTQs7IvClVW6N3DVlsizb5HTNzk4=;
 b=mnbE1fUg3oN/AAG5P/p1NKe8wGnyvNaD6robxPZDx8SEJQg4ue2rPIE879MZJ/pNuKAMwNfVm
 Jp5i+BW8zQ1AQWR3vnH1QUsGiq9jzLsTbBy8Pw4GI6Yzjxzkmmz6g/U
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXztlPXeuzaeuE
 uUGLHglnpJx0sYntnMul+v3XjnOx/u+pMjmejW4bkCK7oEPCXYTZPbla1snS7VWhTtVfvwnI39I
 QAcK613nMEDIrNYyaFv8b9lIiJ32MbzhpNKFeyCgarO4Gvu4NRtyIrgsLCQIeKCsi6AQJubmJqy
 1OjIf8UuYJfp44pDQrb5SQLbEvfq2REIl96HEUqZGkzFPgaD6dAYHCwRD2txopJ05pRv0YN8U1C
 IHs9zJSHxWLVFyeepqtdXDJRVnI2iMJqdu1gdoYTiDyfX/rUhIifSZpuwskClag0aaRnnHwjzuN
 oU501va6YS/oaKXZGzMWcA71geoGtixDd2WXNEwrg==
X-Proofpoint-GUID: lQrN3aFmbXc6485KipvqoBoISDvat-5V
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ef25af cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: lQrN3aFmbXc6485KipvqoBoISDvat-5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_214015_809507_A58B48C4 
X-CRM114-Status: GOOD (  16.41  )
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
lemans-ride as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index c69aa2f41ce29f9f841cc6e6651a8efc38690e19..41ba0f4d437727cfe0c51e3d355427f37dce7f46 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -722,6 +722,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index cf685cb186edcade643790ba22f6a900beb85679..5bb27665cfa95954543f7a66ec424452ddeb24c5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -622,7 +622,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


