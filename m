Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E42AC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=; b=gnjaYpEBf+QGgTsmqa6tQ3oxiZ
	4+zV/TB8vORy8Dwu4GVbi6YdrE9aVqfRIBqTEzS4bPcCF8T8yxR3FUSeeQutCismPNqS1aivILICn
	4V3jCu0lITJbAvFTHEyhGxiH5AMDilVCPWH18OAQVkt33Vl1+jqornequH/NK0GQfMHKjpl8ICpu5
	I/gh5OsSsUOgPQw7SFOjQXwEtwqiYhDUITM4nOQ0lSW1F28bR8tTVGCRVlEMPVdNMAFb3i+2OO/qp
	np47Fhmw7/XGaWRdiifGgNvsVD12qtrVOhGiAwrrsYQZwLzRj7rHudqSJ/Vp7wJdvU3wciDuaUTzD
	IKWO3YZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4aS-0000000CxhI-0dek;
	Sun, 27 Jul 2025 16:51:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4CU-0000000CvNH-3hip
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 16:26:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56REZKMC023119
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=; b=YCssGXc/+PcbODIr
	BXsd8GOGDMLCWgs7k6oqWgd/Mt+EYW4PYdHwCAC51JM3WXsGly0s2Xl2SWEQlsD7
	m062UagyoNwxlvT8cnTgO6jhxwArBz5Asuazzpj2LFiV7e7jZ16mjdXVtwlyMAgO
	sHxoKGuNl6xKDsPftS0vRgRwrXBlNxRw8kh+8II88bxIpWrzYXZL2AhLGC7kQY4q
	zEaj9iFyW0FuFbmofdYOCoRruS7FpS2RQ4w3tSrXqAeWbI4rnS9eivL1F5DsHRn/
	UC9VyBKexA++NL1WOE+uRXRcZyxKDoKkIsb/TvWyeWIPDym9Ni7FCpygFHHQ4AfJ
	D/xjQw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr2jqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:26:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23ffd934201so5498475ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 09:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633572; x=1754238372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=;
        b=tZnh00OiCIqaLWbyjmif7ZeIKoesdExWGhidK8IVdoSt2KlE4Pozq0hp097OAoB2zH
         4vjQdfYdRjNq7xX8RjH0NfqeZeckWqZO1DVxA/MD1R9z+yzY3kQIofT7wAglUUUbmIYU
         vdpeG5Wi5BA0vsUebVOxkqaf6YJGtew1RSVC6aqlkP2tULMHqQIYuwawQDLQj60GqPrE
         rXf/OvcxvLJEHHOGigUGKzD2L0/5NjcXMZDz5tCvObuLCXd7gCKA3EDZlNK9wGPEJCDL
         iIjBmdhjEM2UDH2Kb5DgCHZzW51FtpSQ/jD3OTs2On5HGi7d6giE761HbdludTLhuCun
         9qrA==
X-Forwarded-Encrypted: i=1; AJvYcCX34HN/CVhQSN34yRVCzgxogpGIw6sKMD13FBXNp6Lkoo0DkBhLJe+07iMZdJPWKGEExF/59iPv13FhBnGtG3hr@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfewx97ag7KSTduxk/7kfDxG/JWrkZ1ycGO1YSbpA0YzdsW7eO
	znyO+FJeqK2AfPbHrKm1DzGTbqPpPsvXtjG3m9AUZrVhsqARDcBButHLBevJhXO8hY5RYp4nmU5
	ZwY4TRCu/OIleR1j79RzlKHP1jRB0CaPtoN+bRZFZhbTKf6/cHKgWyToJl2YSyd6XQOfIJRImfF
	pmAQ==
X-Gm-Gg: ASbGncuT6s7Fz4RxJ9I0oP2IlXnLG+001RtIvmHqZtRnNB10Y82z+pZCm/VEBUjGoxf
	oXBBtwbJZY3aCu8p7VztBTvoTf8dy/VWRKfl8r4qFz2DH8GDpO6cUFY3m2vp2HGoWxJlqD1jx2/
	hOTLK2Sjnt3E6DwcGHSyChNguBIHxyCmVTkBPPYUzcfqWeqR11Ix0h8/bFztdpvUkPpx0SaEaZ5
	mWrZjqCIVGmrLzugPa3fe8wjYKSAJgQSqBLw9Qi3zuP+6q4gYOE6LAkf0wBaUYVYCVtu78H1zTl
	nNRZwHSv05ALRkhXT8pLIlg7wTe9ESpLrNDbWgxLkM+Zj2XVkZQqK9PJGdkktFb/QiO+IQfiCAY
	i
X-Received: by 2002:a17:902:ca8d:b0:240:35ae:506d with SMTP id d9443c01a7336-24035ae51demr1133725ad.35.1753633572016;
        Sun, 27 Jul 2025 09:26:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkgKR95HfbF6oQwB+eiE+UGyj35NLc2nILT1f4/5kpa8bLrNcUqa3To0n7rXU9i9uwnvwD2w==
X-Received: by 2002:a17:902:ca8d:b0:240:35ae:506d with SMTP id d9443c01a7336-24035ae51demr1133435ad.35.1753633571483;
        Sun, 27 Jul 2025 09:26:11 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:26:11 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:52 +0530
Subject: [PATCH v13 09/10] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-9-6b8d23315898@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
In-Reply-To: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=1185;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=rmo18nL+UB7XAtgXRRqne0fPUU/Z0j3760cEPwsemB8=;
 b=Q7kRckRAJ/nnrtAocNnkqrdbMErSSbliIlAcnFlr5Am3UV00ZuO0f1aKxMH6JVpoxOHtlYRiG
 CXP4DUR/vLfCVMCZcSZwpLotxiQa0+gmmIkxpVhVAWNxL8A6eWqj+4o
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NCBTYWx0ZWRfX0sYBMFe8SCuo
 hhwONetM0HLzFjM6vPAhmGtr+gEaso61xgs9YN2o4Kwy+sxfHyFReiwYjjQr3oyuVVmYgL4d0c9
 Q8N7uXFv0qCqTlKVS3BbZtTK/M2w2SCVGr1oorSwJe5ElxW1QprgajBvJrEFV1gWDZzqHlQcclh
 4Bsg86NYMChLjwxo8ddqMUy5x+by1m2QTd4eiufB/VsMgkXhgWavHKoeJe9ZeYe/IGhtNN+uc3c
 amSWAPMENWeqf+dKKmtGQkud3diRkP60yZPBFsVB9C9blKBYge6+iwyQiQHVVCymzr/VN15pxN8
 kXMMwuHJEFUUzWuKCfAHJjjC8KKy8eCmFl9UH+tzFHRFk7bz5CWKtsZHbv6CfhMTHQgxZBPS9oU
 akd8CAox47OfdjL/ihepGJpY407a0UD/OlpDBfb0Mu++uFXCrRV5cEO9ZOCUR9XpvtCIqPop
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=68865325 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: wavfkXY8qvFz22wirs6ciwc6_SNtZHou
X-Proofpoint-ORIG-GUID: wavfkXY8qvFz22wirs6ciwc6_SNtZHou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_092615_048421_26AB08DB 
X-CRM114-Status: GOOD (  13.98  )
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


