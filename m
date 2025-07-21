Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20894C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zO1m4Mu1s9USWMxZJk5OY8bYzy46q5JS7Is6cMJU9ok=; b=foggNd7qOwVXTViHsCmqHe92+W
	f+s+f2O1DE+a7/LBEl7nVssQF36uoUB5jRJcI1+/vtMsCzAsqvG2A704imHcuCpbJLHv8OvPIcMpR
	9gMsKIQZaAim2aFzOwKMbTp+SQzuvZluLmjNkBSLde8B0VVmoP4AspTwcttaayaKKSo9iqt2Cc7/6
	Beaddq8owavsCMOwtdCAqdH7bjrkBCvS8LXSKTDiZHtQqljc6eiTgmhJ8GggKUt1FsulyMiE35V02
	v0QNX8K3iSw4O4VY32FtG7brqkzvg0LUASxw+J5pCZhwvNEAguj/dXXJr8Mx6E7sq1ZTpDDwfuces
	3Ig3BHaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udviF-00000000SNy-2rTl;
	Mon, 21 Jul 2025 18:58:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvH1-00000000Q1v-02k2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 18:30:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LGAS4m029282
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zO1m4Mu1s9USWMxZJk5OY8bYzy46q5JS7Is6cMJU9ok=; b=mNot2AE5X+lLUtlJ
	fUnS3BfpKFpZ7Bj90v3GMQNCk0NCARF4DgF0lher6/I/WSnZ42DJrD9xo9KOGNzv
	2LH5sxsi1FluiEm2/xdjkQ/P+n9rkh7MmW0q6zBu9A4qrzpExhGmZNoIZVE1hZUQ
	JK15qBRcsUBN+fXDTBbBAdoJw/hYNW8+2txn1UWlYcwqhsNjtXqghCEHcDOs1x/c
	DtJcqtQiPaTGyfJdVETmQ0qfDi2b3tMYAxNjbM6nQRUD/XQ19j9Jkf+9WZ+2tlvn
	8tJGquyfU9KF+LfsVrYU6/UHMXrWkMS12EPSwBg3rt/YBxXFJxHAbKbwaBMCRWnI
	gyTBhw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048ter8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:30:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2349498f00eso44883715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 11:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753122601; x=1753727401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zO1m4Mu1s9USWMxZJk5OY8bYzy46q5JS7Is6cMJU9ok=;
        b=T/vA+4WlCGasBjbrAzskXH83J9d/jYkb6raOdD7xHUi6J1xe9N9LXxjD9dKRF7jIx3
         NpOO0oDMrvH1KYBRp+yJilTEBwAYWdtY8TwtrE+sYSbyR2zjbgvsgYOlI1DcAZz9UVkb
         IQ13iLdRwAYsnaT0LmyStTWLMXVwpHZX3ukUhp1gvXv3xg8e6n9en/F2+7cSTGNGtnfj
         fM6yy3Zctqx32hZuip09KYwi4nUtsPJ5uNWkGo3/JkDNwM/e1fCqwKjy259vEKDGE8U1
         zAxQ15mmbojpMyiKB3fFuQhERDx0aucOAMpbndE3qnw0OOI3v4tM4znPgqDHt7VvboB4
         qzlw==
X-Forwarded-Encrypted: i=1; AJvYcCXUgad0nUJAVICiMYwayRt1oBaxjTyAq4mrqRRCoZkwo/8sNefa3KYLNmSWSoEC+wLHRKzVPIvxNSGSsKUOgHkd@lists.infradead.org
X-Gm-Message-State: AOJu0YzK1tg4blUUBawYD2Wip3BSC0WSc4d4J5viv5hMR5axFViLK4h2
	GkDoXtch5qxlOloFvnLYV9wLfNrFo4xt8MwdNX1Vbi69yk/caitzdC7bgIVPbPVG+rY3rey2bqy
	ADooVHez9ScjFUx/qOBzkI6/OiP4XFN2stahck/fYA32AFCVckfYim8Q7nUWu7ZIlIXszgDfXIo
	nw6Q==
X-Gm-Gg: ASbGnctcosghC+CGum96yvCQicuFUbzFA6kRLJOG8Zn77uRR8S0JjlU+RNnJ1YR7m97
	i19d3U2/ucQaK/SeAWKxLiFUrR2hvYED0cPbtct2SAHoHUSyxNcTqyyfQhJuhGj28N189DcNCao
	GEcczf7dkE4St+h0UsShRIQ+E+R7c5hsmRfSujUhWaGiAe93xZNhG4MbpombUlzBOObwm+TVCX9
	HgEyNLMLb0MNFQgidFQsooQYy+YoBAv/F8CYimONTooa08evQ/xwg4mHx0ffWJwHVUJuSPSlpNL
	GdaS5TvUp19Tm/rk25J0QrNxjHtOZtS8qgt6b5y5rUdILcS1crlkp6BW/e/6jWfwPkDyQj43HXM
	E
X-Received: by 2002:a17:903:1247:b0:236:15b7:62e3 with SMTP id d9443c01a7336-23f8ac5c086mr6239405ad.9.1753122600859;
        Mon, 21 Jul 2025 11:30:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEiVeGtNV9GmrNVrD6U4nu+8UhEiUkMzdQ/98qBAr+cTMXNUdE4x3JFAM19mTP1eT+MB3fNw==
X-Received: by 2002:a17:903:1247:b0:236:15b7:62e3 with SMTP id d9443c01a7336-23f8ac5c086mr6239105ad.9.1753122600430;
        Mon, 21 Jul 2025 11:30:00 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef4b8sm61414545ad.194.2025.07.21.11.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:30:00 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 23:58:54 +0530
Subject: [PATCH v12 7/8] arm64: dts: qcom: sa8775p-ride: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-arm-psci-system_reset2-vendor-reboots-v12-7-87bac3ec422e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753122539; l=1668;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=nykICX8hQVOI73Pb+LH6QfNsfIbx6Lek13GmZ+0SmB4=;
 b=g3A+MwUIEuwhNYH7AEZ+1Tszhqr06K8jZVVPYm2Soy7Wcl0QigvUOomREQzxuSnNsq9GSDF2n
 TBAB47HabTaB4SXq+0WPD3nEzI4RciQ7fU3duwR5zUVb3BDxCSqUvDf
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE2NCBTYWx0ZWRfX8p6ahhs+Kz0h
 54YPhlGG6Yqtxcybbc6z2r9Cenae+GBy5zfo+zPJmBicC7bprZXEKwkgjqZCI4ZSjOxnolrpPhI
 ZHvWmzsBmsZohLJdrpWEU9dyR2wRUdd6NUj2Z8QtyAEN6PbBhcaLPECIhqB4eY795izNdeXXGbR
 WYXo9BREqQMocSQMWDjRG0OOMgMDk+942mvOP/H1k8cnnlw2upOnucbffhG/rWc9c2WzDkZI9P0
 nZqnNasqq8DmkAJ7wHox1lwSlIZmQawFEQhIVFpzIw1mUPRyqycIjyrYKW12xb/KXk1YdPX9iHJ
 9lL8dJLmAsrxp7tgHxfjxaMQhFJ32RlqlVsJws5hJmoRpmbdvyjbSe9ZTprv/n1YOMkqyFmlZAJ
 aCg0K5hYELIP1fD2+tx+U8NOee245h7cwLaBi7i/5GXeaaUlaLGH23Qr8WbTg4QBUN3O9e5i
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687e872a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: rmP7igIGbKNX12JH_mxFqOZ5inRArQD0
X-Proofpoint-ORIG-GUID: rmP7igIGbKNX12JH_mxFqOZ5inRArQD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_113003_168713_D07F7E19 
X-CRM114-Status: GOOD (  16.55  )
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


