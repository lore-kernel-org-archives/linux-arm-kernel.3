Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2895C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 10:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHGeVOx0U2s9qP0ikhLwIs2P+IuUNoY0lfi0EgG0DtY=; b=WIGWhAlh4M/aYHezkA9voFirmK
	xAcDxKChqYDrwvYEog069pU728HGDpuJCkIhrbz+6yvPUoD6nigxBr+CKH7vC5O639Xo2OOFQ7EdT
	d7Ys6R++QjMfbY6eFtmrtYXmns2xN71dYO/NL0Bd5Ff2wgFP2YOu9pjsDLxJmmCj7m6OBcD4T2HtR
	VylZLxSKuTPhjXd+7IdcV0d88M/ieY/q0HDaf1AJy1JnfVbk1nft9BQpPvBcrjvMJ4nQMSRrdT9sb
	bsqRcLvkHrjKdP37xd/6EeTavmBdVW+kQvmwJZm/ZGEzTNwwvmVIPJlngMOYCCgqiLHSrW/EV6T2V
	fPWqVH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZocR-0000000BV8f-12rP;
	Thu, 10 Jul 2025 10:35:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnPX-0000000BJjt-0OSY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:17:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1dDkJ030102
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LHGeVOx0U2s9qP0ikhLwIs2P+IuUNoY0lfi0EgG0DtY=; b=T2leWwQnvLvOkFT5
	FqxaS8UlSjT2B3VyMJW/m80MFFazSucqvPBpJnIE0FykN9J0Jrnn0TBJjigP3BFp
	HC5rSlMxaCCXV6ZY8ZVsx2Urc4vVFfdjEmW+OiaYUeRYXredSnDRdup+9khzzpxk
	Y4ZoRaX8ySim5buzzTB5VFaujIvS3dBRpSSReF0L3SahKEkiyGO3vRBSfzieGYtv
	EKKUQszXEPp+NWhoiCHdFb5cw9Jrn2WFcCYkOeug/I7wyK32bMS4J026Yl3ZbmLo
	4gtNC5Ddh9jurzukUaEA3mUSYVGUzXqUi9P4m3rUqXQDK215N6e/BtyeWqJllsVF
	D34PwQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg4b4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:17:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235f6b829cfso6552575ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 02:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139066; x=1752743866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHGeVOx0U2s9qP0ikhLwIs2P+IuUNoY0lfi0EgG0DtY=;
        b=ppx5m2DnUltUjWB6DO9wYPITNz6HyzC+0VsPgcLqLil7BjhTSXTHr0Kk9Vi9HWSqvs
         n5jY8XwbDR05BlraXE/OQfvddEi40W3769mAT7Om3cqUKgB01gzFl6OXmqL9UZPBIU41
         W77/Mu0v/WhlHSaaq5PHM7UTO0QJcxGbLG3ec1/rlCEVMgmgex3guj9o4MQwA+rgrf8h
         3UQx+k/YiFEiUZj7fJ6RPlCCf1ikQ5l2ry/irDd1sx+Zxgn2HdYsSRmWMygjX6Dfam4R
         fW4coXb102W2CVlMFp1XQDA+2tEdfwFCmsyMZMO1yB8x+/X9JCrEK8/5/reP9aDrLxFP
         /gFA==
X-Forwarded-Encrypted: i=1; AJvYcCVzBMNd1+fZK1Vj0n2BxwuLDlLv/ZrVGSL2EhFfmSqnbHthTxIyD51GM64tT+DPN2Vc8tnQEFhuNZ7pIRp/faFI@lists.infradead.org
X-Gm-Message-State: AOJu0YwFbIQijFyA+ebkuVk00A06VuZ1fX3Mkq/QQD94KYKK5IKjMDv8
	CXgOThPHAoZj3sZt+hVM4f5sGF1iVyOMa9Rae0bntpxLQ3X6qnD0o4EB/KeE2t+gwF8V7lrx52D
	UMD1dvw5tA8SHyOC3PLU0GZOpcTFgf8AUd/Ltv1PzzPPnHg18DXqJC3cM6sKZCJIBF3QyTSRCVP
	NOCw==
X-Gm-Gg: ASbGncsyutCnjyDTkjrg17Oj+bU+9cVDhY1s8FChUZAkUTHbVip5JgFRh7bvk/mm8z6
	/RSpYMOVNe6jzOBp17cBsnqsVrKQCLq5E+O13I2KBdrOpk/51iePBGy0WVj+xrsFcS+cwZNErHW
	/ZDcpNqiN7BFXKAEK6MfEHGzdvIOEHnZfl6+5T1xTxLvsEbVf4xKssZlZ7+GMjIpepyeYjVMYyY
	w3Tpqj9blUuFmTZjChU4OtCHi9/6aeBZ6ThHKJnl0FTTLhR7/6xaV0Dp+sZhkavwvsvF0RCpxPm
	VqTj4wjQ/yhCGScnYlQyt7TkbHUOsk0BGbf6WNieeAoY2TUC1jC0qr5rpdk=
X-Received: by 2002:a17:902:8f85:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-23de24f375emr43328005ad.35.1752139065776;
        Thu, 10 Jul 2025 02:17:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRrq1v9TOcKehLshyNd7Q9DOKQg1TlB7iqx+awqZ/WY5auAdU7wXya8kio0FJy8iSW3PY2Pw==
X-Received: by 2002:a17:902:8f85:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-23de24f375emr43327605ad.35.1752139065322;
        Thu, 10 Jul 2025 02:17:45 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:17:44 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:49 +0530
Subject: [PATCH v10 07/10] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-7-b2d3b882be85@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=1169;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=hDcOEnYaWsyU0iqVg0jGaDC9VsmHgvyimm+9MopdURY=;
 b=LLxxdiwC89+T3X5nLirDzCvhuvPRD/c3MNOaVzUQd4mRVGpcSzTIh7ADcfoFeLkJX+zkArk/k
 5kif1NoHvivCPiFySaWIVEsxNKuvF2Bu4vUXGv4gtaXwnEgWXYmX131
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686f853a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=mlMSzhu8tE62a9u_TvcA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: soJDca3PYubh82l3pgaCTp0mN9r8_vdZ
X-Proofpoint-GUID: soJDca3PYubh82l3pgaCTp0mN9r8_vdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX7yJnC447+EQK
 ssa3uA8FGkzM27CfQtvKjmOYskU7h21wBMuiU7cWqI0gL2hFTJMP7ZnBtPRAmuRRwe8Es9rdsMX
 vz8aw88RIHEpTUE/j/uG/CCous4gZ5obpjb1oxCAHy/lqNx+HtXzWRr1R7I2Rc/nmATvUNIM2V/
 Wz9K/E5pRlE/3oQ5OoZX0KG9vAQenU/juuQ6yDVVhATtb3zGjsuv9eKCo8dky91uRF7VYLQOUfZ
 kgwXYjIrgWn6J4YoXvjz7E2q/QLHwVVQKuiU1ZUwbmWY5Cnlt2+5v9b+qGNi9j/1969S+Z4/4TI
 NuKvAccGcMxQtHdjnnUzWo5cEouq3n0HhI1RQHWD1zlq3CkOjmAIAwTgIXicxCMX6c0SyyqB9X4
 YS5ss14jGXtoERhUcJw/G0XfIF01cA/eUUUYsijo5mjiCTx9HKdUoGCepPpwQCnLt9Z3q6XQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_021747_142274_B0A14765 
X-CRM114-Status: GOOD (  14.26  )
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

qcs6490-rb3gen2 firmware supports vendor-defined SYSTEM_RESET2 types.
Describe the reset types: "bootloader" will cause device to reboot and
stop in the bootloader's fastboot mode. "edl" will cause device to
reboot into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 5fbcd48f2e2d839835fa464a8d5682f00557f82e..7c06fe496e800e758d59ca793785d7c2907df8dd 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -966,6 +966,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reset-types {
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


