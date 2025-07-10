Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57FEC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 10:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjnERpSzmYvkUrDgRq9M98U0DkVLcbK7HnoX1+rdKUQ=; b=oLy1yI/8IRVESliq58iCJvFaxz
	4JRp8eDOcHBbX46mW4x2ZsS3Da0MjTZyw81Kyo3f3qY/PR6HWSmXlpz3Q7+W+JXj1+cvZh01hLdOz
	82fO8XtccB3+5Bjq67RcTTSKgvG4yh9jBm/epSVtCakSJeBBzty7bdq4fIgh1YihzEpCwydQFORKm
	yszXR21n+3McAoF80+lEwBjTZ7RxFX2dDvzzSX440qydeY/Jj+SJl01kkDClFWNzBVxKBWEL+pz4O
	pTjNK/6FLzjqtDdH/7wJU7mEquO0eHl2dOKCUmiVWFx5Ld6SaJDpltPXuioXzQO+/8WA1DoY056tw
	EtJPu91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoa9-0000000BUrX-224B;
	Thu, 10 Jul 2025 10:32:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnPM-0000000BJhy-2BS9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:17:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A8ftGv030114
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjnERpSzmYvkUrDgRq9M98U0DkVLcbK7HnoX1+rdKUQ=; b=LhOfv43e1mI+3rdy
	MtydXTK8trGflHcht5g6SX78LUPNwCXfdtA298j+BxH/JPAD9RvXS80ZufPUoHAH
	Rx+KtMNwiNLV2XoVcZyQT4MRrK7zmmoW+sggNLGpPSCyjFxfULRd2nThxkaqzWAg
	+U9UvWbcN5kAt9zbo143R1POcWIUvsCwUWNhPbbjgIyq/o0kc68husWRTIzUEPqG
	/4xAHa1uFkYz2RnMyGSEhSb57YdSKgOfEpsyAfoOgJF71wMfYazlTB6N9GC/dxdN
	IiQ14FVJS9bJlCtQ9JhS1Ii4RLDjJ9O54+W2XapvtazbIbGXzOozVR1dfTKMJ3sZ
	ODBNwA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg4b41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:17:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23827190886so10024505ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 02:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139055; x=1752743855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjnERpSzmYvkUrDgRq9M98U0DkVLcbK7HnoX1+rdKUQ=;
        b=DchpivGMH+I6RWMHsSs+elSVhCADmjaSWmuebKF4hXUvUKp+S3A5gY4ENRznhqHtSD
         XX0UOgvar3B5jdZ2Gsl4oy7ZEsDZEocWImF7puR2moPnY/hNqNKDH9IRnYjByYcxaIeb
         OApW8s/INHKUv+t79kj+UNl3nlWf5f1qnoRb6hVm5Ex9qtXR3ycm1MuqNtJ4Xrj+4x/+
         a8D6xsGl7t8+HOH46grtGaqTu1wD3F0L2wPDVfuGsdUU//zH9L4plqrw1gG+lGsjsbgR
         mPOZ8tEtn7MUaCX6q0LrlDTFPOqCRDsKWi2yDvp3slLX4a73ISeXBeFXDUizQ55jZKLP
         ebvA==
X-Forwarded-Encrypted: i=1; AJvYcCX03S7WLfDNH3icKgd+1U5J9tATpQPjjF2kdUKND+mt1Y923FDXmU1R0LYHvKxeVO4YxJ53n2Tf6iN3gn+7UDGp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/i8QycRbE/5hG7pZdeMwcVYyqsa+g1ueue8p870/PmPqUPhnJ
	B4FsAsn/gS8VyQlgddz4zlZ16ifiNGxkIG6q+Q+Lpn20IkaVlKFu9hux7eX+G/mAFBONjvg9rJV
	yNnqlETdtlPVU4wBHcP/mTYadTKLgGFA5mzLug+fbmER0ju1tYc4ttNPbb1ZuBon9c62uwxiyDl
	A6gg==
X-Gm-Gg: ASbGncumGfjvvLyTyX3IGZKz6jGFA06eDJss+yuwY13StANL/xOZa8hsMwTwZF+Eulx
	mVo+Sp08wRi+/3/fuisjFmluceLwFnvH01uueGKaZYN0oa0vH+C20XGJ1MYJPTPBJ03Krg14Av0
	p0Jwe8AVwaxfGM4YWAjtcikDIZ5Pz6wgmtXnPkm1fc3AcLBXi6WAVoVUAZTt4tY5Oo5DNfHBsI+
	Q3G8KXw2m8RoMFTTTMbXx47sHSZkoajcQaZZOsegYbRHdX8fXrrmju6CHBJfsch+EFogQH8al1F
	pe09xvokUoU9jHBNgtyiGew0hcNUkkLc1O6/AgtNeWGlcyFNAtwW1ju+zi0=
X-Received: by 2002:a17:903:40ce:b0:234:bef7:e227 with SMTP id d9443c01a7336-23de480b01emr22477235ad.18.1752139055195;
        Thu, 10 Jul 2025 02:17:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOJVHab5T9iz/Q1OPBfJ6QDcI7he8gMDHrdEtDIQENvV9ux+bR1aR59bdZF7+Pu5JDOhCy3g==
X-Received: by 2002:a17:903:40ce:b0:234:bef7:e227 with SMTP id d9443c01a7336-23de480b01emr22476875ad.18.1752139054755;
        Thu, 10 Jul 2025 02:17:34 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:17:34 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:48 +0530
Subject: [PATCH v10 06/10] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-6-b2d3b882be85@oss.qualcomm.com>
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
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=1684;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=C/j1pRyxrqegE9+HlfozjQfjDAmabEKYItoLHtiCbfY=;
 b=oe8WmAtH5g0NNJLno0zytsw/dFU5witrI2BFN5XbefWtdYq5E2r0zaV+zXXXQr+UPw9ahC1h0
 tBeRlLEJRy9AsD9sm0fL0JabkRyYC2H18E+hF15CP1nzH43tmkUZ5Im
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686f8530 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=rzkh05IFTCqOtWkwyAIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zdCH5b3kZTBFl2lcdEJvbEQwSLxdJJqZ
X-Proofpoint-GUID: zdCH5b3kZTBFl2lcdEJvbEQwSLxdJJqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX76HagAD8uN41
 q8WpFkOUCjbr6cHdSZhWZgjY0OvrD0TylytQ9LkSWJ/i2+maOYBDk48WvswhWCxn6Z5tVYLyrW8
 DFUJa2vHKa6XavxW0snwycOkyFba2jhlHpbWKe93qeikmrlO+LelCbnK/MEhld8hp68PneSAX5T
 u6KMA3Tyydn5GRGWG1X5PtuXJM268neJ15y5qV8lpPN7QSCxEwdYlGKBEjCAV7d5ogshNFg00j/
 tmbJHticUaw1UrLa2mmSyF5rlDeexkHUXmq5/Jc500xgoqMGkCYb1fWtwfN5kIzwUHXTLtqZ0gS
 5/l0Sn0h5WZKaA3xeozwSeoPUdqQCt6UcMCx7WWtgEh1KWjDKMaXTJeoezIdrwq7bLsPRtzK5YJ
 smZzbwu/+YxJALEJQV9tcDJaLnDmr9u+YXxfvDXnmi1GuCVnKbGFR9hBtC66lZFN2/oJ8u4+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=914 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_021736_575800_01B55232 
X-CRM114-Status: GOOD (  15.74  )
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

qcm6490-idp firmware supports vendor-defined SYSTEM_RESET2 types.
Describe the reset types: "bootloader" will cause device to reboot and
stop in the bootloader's fastboot mode. "edl" will cause device to
reboot into "emergency download mode", which permits loading images via
the Firehose protocol.

Co-developed-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 7a155ef6492e176390faa3f2dbe419f5cfa62f0d..6de4b140ed10b0da72f3bffae524f65406d8f571 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -654,6 +654,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reset-types {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64a2abd3010018e94eb50c534a509d6b4cf2473b..e6a99ef50b9b9ade9d2a71a14fcde429f8076dd5 100644
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


