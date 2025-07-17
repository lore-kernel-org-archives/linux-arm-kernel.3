Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA500C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 13:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zO1m4Mu1s9USWMxZJk5OY8bYzy46q5JS7Is6cMJU9ok=; b=yPYGiwUp8JPMAzefkTXaxsOZXq
	YFLnt8ZeGHj5kT27J8WDHMQHajpnbrO/MeMqVrL+XDyoJrioi02WphN49/GYZ//DIsuzcfoyJksfh
	4PSR3Phcn3SGSwKyyjCRMfvLbE/C1wiag4gtypDts7HQ75uq4KmJvq1PPRLz8+eUEhAhYZxCmdL2t
	9wRxtg3fTXGCoPp0W4JDORMXggdi+gP8IyszdZmcx2byL+N2RwU/nPmSv5SHYm2ZF2odRnwL6QW6D
	94jTXuhO6v+tKx1nSgotCCPHGl6VNch7EpXWVYxWZIHyb/48Raaj4QDNBbTWFnj9PIcnUFMjjXAut
	8t/sR5FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOx5-0000000AI8e-1ThB;
	Thu, 17 Jul 2025 13:47:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucO2U-0000000AA0j-37rU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 12:48:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H5aOmY021593
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zO1m4Mu1s9USWMxZJk5OY8bYzy46q5JS7Is6cMJU9ok=; b=m2M0ijgjpDIH5XHA
	kGFkVZjyT6ODkzEFE2I1liMEz3vA3GDuXvCBxEgLJtZdApP1Qg+z2SZMZj6wKL6j
	XllhprhyvzeaG0nhtCMjqWRvzuLB5j3y+9Oa/BcD6h/y0//Gu5gTwqZ4pszCaII1
	MBoSuWqsnfewV7WPdP8SSvZ12YipgaAjBZEAgr4JAOpHFR33VQ+Sj+oUu7TedBsE
	1vi+rwPcxKZrDeVE4M5zy2//hAucayaoY18XKg6Z8F4s+m3Ghd8CVBv20fwvCqfj
	PutqdmNycq53BGQ3T7EvXT/vF1I4NuMaECqvpJpSqNIpK5A4P25iRmpa3qLC0j+0
	CksERg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8fh8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:48:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3bde4d4d5cso720635a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 05:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756520; x=1753361320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zO1m4Mu1s9USWMxZJk5OY8bYzy46q5JS7Is6cMJU9ok=;
        b=jbUi0LbbX4CsfQz29pZUgVYYXtsA6PYQiGZ0Kdv6QIaF4oZIZcRP/RTNZplRPk1+w7
         Q7aypqamwAxaLrreD0uydQkzUzXiQHAFH90yofdCQMAy9m/Z8Z9gJfVm2hSsIrsb5lvF
         xtrCSHoGtdrCoptYtdDOOzRVNMh7An3Nf6QP32zPxeySHqMvr8q0DsxM3mHEYiAmU7aw
         W7KC/83osw71DYDvSh51D9S/0OYNcP84F1lgoZx85FVF+Np8hQFvS1Sa4BN8Ww9CIoTQ
         lemdbeNZvpn7hf57U9R8FLTCJMqvv4ua8VK/MabA9VDD53st1ivmE7odPe6/1MpZc8tl
         tNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgmSOGlk+U+MJ1gWR23Y1+o3/4dl0msCKsFRApoE2S8Bh1tW21MKjLJymFzZhTeX6OR/xnRDyL1bKH9bpjfJvJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwnP9GsT3u9R/qLeoS2cHJg/xOUrnCFNcE9l9LBe/M1zyn+deKw
	jVqm6tZ4jS+ue8gPCWfrFL/ydYUgjtB+ijrQIHl+aeoHPNzRRl39g+2ygVj1UhQ4Y8Qn8YgOMPQ
	d3V1MabT1F/Ekb2berM9HGB3s3w+/H4PJqHHtduxdTlX3NvU9By5K4lmC8bpz6vi8Jfx48prOl3
	ciIA==
X-Gm-Gg: ASbGncuCusU7HjsWDodqt78Y5EfX99BiC9R70goX5Sy6Z6X4VcFfyHT4K3JJurbnSJz
	qrOAcvoTjQJprClTQdlgoWHeNVU6OxH9j1DC9fsKk7n218/OBNR9mphODW2IYbWfgF8ev+wWy6f
	/8/RQT2Oa+TXLQ6SdYLHcISDTyGiQiRl8zFpzKzYhXPJFt8XVFwWkxjh3he6ZESkwlmDxM7D3Su
	3FU6wtAbMTYvjlG+7faU/lpnSHNLEWlctNkMLebnBvS3IH1j247sv+tQy66WfjRLEud/xdjG8Pm
	Ptjzc1iZGxJ5ihK3Susb4Y8Sc8Wb3EIZM0w/jnlc5f55X94uZKbIoWXeNs5gkYU1MrPTG4sOyJ0
	d
X-Received: by 2002:a17:90b:1806:b0:311:f30b:c21 with SMTP id 98e67ed59e1d1-31c9f4b40a8mr8772533a91.26.1752756520521;
        Thu, 17 Jul 2025 05:48:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXMBxI6IZLFJW1s6JPc9VrE1ngxmouoIjEDFAd9i20pNgJNbkO88UCtpZcIP58Sg3KuJiB5g==
X-Received: by 2002:a17:90b:1806:b0:311:f30b:c21 with SMTP id 98e67ed59e1d1-31c9f4b40a8mr8772503a91.26.1752756520031;
        Thu, 17 Jul 2025 05:48:40 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf828a0esm1505283a91.42.2025.07.17.05.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:48:39 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:16:53 +0530
Subject: [PATCH v11 7/8] arm64: dts: qcom: sa8775p-ride: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-arm-psci-system_reset2-vendor-reboots-v11-7-df3e2b2183c3@oss.qualcomm.com>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
In-Reply-To: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752756455; l=1668;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=nykICX8hQVOI73Pb+LH6QfNsfIbx6Lek13GmZ+0SmB4=;
 b=EiF8IZxooW3vYhvtPrDfdjqeu8GiMcEGqyXXqmthd53rwasr7uw84mgWXdkL1gvuf8BBZ0DON
 MDQxMZOV0SIDfo+q4a1SmrjVCc+0M5DF4A+sIyRvJ9Q6hTTHal1B6cE
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMiBTYWx0ZWRfXxYHGeorR2ctQ
 7JPf0K6YMIjP8ou/uEF+5B5XoN9gISa4IN8+SDA+wRTkqo7cIdSISpx2q6hF2dn1SVn6VgK5syp
 M3LG9xiK3DDu26ahXW3F+zDul20L8ZYtvD+yTl+4d0+GzOns9hNGBqmcnNJ8LPoX0MohD7DkZ2h
 8YcqBEhJ2adZV/kIf4Wjrxw1mGKYpsTGrinSX7yhnPFfYb5eZMxkjcq3gNI8nnuLjehyjDc2MW7
 p3Re/x055K+QUH8iDuWseN/6485SUxKZRCufEwQKtbkdXp+9XkMoj5A4oMBoy1lAWfaFcJPAnQ4
 4Fjj5T16zhrxApxymH9UaQbGHfqdoC7lZJJKVx7eUeYKs8rOPRhyzGeABgpxsFy8caf9/inbfuF
 TGMtOqVphQcXjsVcopXG5YWhvchXqP3RdTHR4k6/+O9duipSV3NLbV+JPKqqo8XFAigmpf09
X-Proofpoint-ORIG-GUID: EAVh7P1fwtEfZrZsOBL6-is-JUr8fIB2
X-Proofpoint-GUID: EAVh7P1fwtEfZrZsOBL6-is-JUr8fIB2
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6878f129 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_054842_905599_E3AB93A3 
X-CRM114-Status: GOOD (  15.34  )
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
sa8775p-ride as reboot-modes.  Describe the reset types:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 63b3031cfcc15fe2cce58c0fb7502b19f058b80c..b1bbd3270afc65e9e036e8098ae7cec3d3363a32 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -874,6 +874,13 @@ &pmm8654au_3_gpios {
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
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9997a29901f57d7894dc1eacb6a809caa427c6c4..52466607035e663f4dc6e5c97223d5c0404650e2 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -622,7 +622,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


