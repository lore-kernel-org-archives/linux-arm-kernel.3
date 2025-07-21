Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144C3C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiMmHpQ1bB+met8QLJcdnw+SCuV4S6OJO6VsyYvdUS8=; b=eXyqQLrxfQbHP2nzAY4kecH4ZX
	utO4vrUZU31mb9UrfiGFqKcX06kSliz57ebrcsHuoo6jT7/bwLcq6jk/URJbZjW11aklvlrb4kLDm
	2i/BgemgPa31ZoXGwRUGmTPI5NqL5O1A5Ite85IVoEzlGNlZw2PJW491Oc88lMk/NhIkpvM8Ic5Gg
	QEI8afhL67dHqe4y99844EU0+7upFXpbqQUA8ScwP7YFZHPq3/9FDJmgLxdWwAw1SDOf8jLGUXRKD
	6L+tdRt1B6SzwEGAFNZS7dBkBI48B7E2+dg4fvNJqxc2sBGAnkjJ43qj/uLaHG8Ue4OOIqPAjQys4
	zyD8IxMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udviC-00000000SJi-3QT8;
	Mon, 21 Jul 2025 18:58:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvGl-00000000PyK-2sq5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 18:29:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LGNSBd016585
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IiMmHpQ1bB+met8QLJcdnw+SCuV4S6OJO6VsyYvdUS8=; b=kkNlFt5wACA3Vclf
	NGmRyORu0cJbEy9crqoWMAVRIBO3IR3LnBHeE3LVmTaviXrUvKdsbLEvohPRQYUn
	jGVLp9zVxFSftokex/1yBBeyqB4g/CiPWcplToe6KVbhTdwCRQ2lv4o2QciUI9Y9
	4eR+Xxr6fCsGk4O6UZtDyvVgulkOl1irMR+rJfjVJB7tHET/zrFUaxw55I5IIFMh
	DZGrDnwOAbiDtrvhBPMFrKwhu7D1Y0ulIw/DsV9oYFoPzUo1IEYNp9DkQwZpEpnT
	OwVfYHclC30e1pImYdP4rjIohh/Rse6IgD9EMAs+gj9Md2iZJKUREzwYjFtZjchT
	6C9x0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048rxv2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:29:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234fedd3e51so45030155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 11:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753122585; x=1753727385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiMmHpQ1bB+met8QLJcdnw+SCuV4S6OJO6VsyYvdUS8=;
        b=gGDFqB15POJ6IpULYocUwOo8U4eYJ1ihzLy+/lEvZ3lE8T8gB63Dslo2WmJymmnowz
         X1hI9du2EV+q8Hns6x6WSyUCTSjmqXTUMXGK8HWebj5T0cqviLff1e9EsagOaA+uoRYA
         dzZ49gRyOFHC28DnD6MylhxTQX/jQQ7JebYGAnTlcwdNHdds7oITFJRV01+K+LR5hEPO
         tTZeDFHeDBlF97ViElo9rIG/EyYfGwgbEnmB66If1rbf/ZGZAWAokOGC08j3iZ3vsk+W
         Khs61WVBnsTk6Lq8QWYSNv/CuodlSJnAeUJqrc4iMcrr4d6NhBsfsve3WHTwWwaElIZa
         8ehw==
X-Forwarded-Encrypted: i=1; AJvYcCVwDkGBUFvX+3UE8+huxQ5kwKujvOsOAVXWYFHbu1wb4zNiIZ+GdP+b9VLTbUBwHCkuKf5v1kSmGYdNKugyjxmb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2EQ8wSPB0hRTLkO1ZGwuLK4XWLhcaeUeiTRxSWHU+CQ1yxzQn
	RYJjjfMCYpiCYTTdhYR3OwGr9V9+y9K3CLcnagK3tuuijbjHM4f2h0bk3hjZezbwszZjYFHNx4i
	QyGPWQEzpeMGccOm0pKY0wMY6GnEqnBGDHSGteZqN+b4knrhPYAA0vS1q7ExKhCTxs55xCS1cv0
	3b8w==
X-Gm-Gg: ASbGncvxCYOkBYLCOVui9YWFbcvATa1ah4NpOUm++DiMD0Tbr+DcOQTlmISnVpl1Ie6
	K/rlAuLK2/c6sAMtP9tYlfLYFsuXIzfxOrKf0IwQvTA0jAMSZoAiX+hQJN3mgOrcGriSB/uzMX1
	gFeJH67+EYy5YWmD2V9LA3OOmdZiCU88YU07zVRAs3aIreFqX1el3pbns9qPRLuExsKR3NhecM2
	RcEZRehyElpcmi8dp9bJ3BMzksALv49XyvtUhhIWQ3aLOBGazsQQh0TZpfhhbUgdZFPazsYXZnL
	xcB/QRfgRVuUnUeP9cy+bmGhIUmb+fSVkbFXaw0NzpdlPyCLbs3OawtO0ICnKqpVZ113S5FnHQf
	X
X-Received: by 2002:a17:903:22d2:b0:234:f580:a11 with SMTP id d9443c01a7336-23e256c951amr253931915ad.19.1753122585536;
        Mon, 21 Jul 2025 11:29:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKesUD9aIM32P7T7wuM3eaFz432EA7KeFqHN0KCnfPzbQxwR6Z60riI80+yCNY/RoO+9fE2Q==
X-Received: by 2002:a17:903:22d2:b0:234:f580:a11 with SMTP id d9443c01a7336-23e256c951amr253931365ad.19.1753122585027;
        Mon, 21 Jul 2025 11:29:45 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef4b8sm61414545ad.194.2025.07.21.11.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:29:44 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 23:58:52 +0530
Subject: [PATCH v12 5/8] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-arm-psci-system_reset2-vendor-reboots-v12-5-87bac3ec422e@oss.qualcomm.com>
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
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753122539; l=1628;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/OISjQAhUBAIE37ASE5b1kssDpdL8gfQSFob68FR4qs=;
 b=Bd6Eb28aznjRUSwc+8Xgk/BIQuXk1bJ/xKoplQQ+Od6H5h3mOZK4CPnDEWLP4aZz683h/a7pJ
 mkziSxCbB/OAqiXczvWlddBGNyeSdaJelRlbiVn05DC0+K+10Ob9kho
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE2NCBTYWx0ZWRfX+VPSRtON0xz0
 mcD8O1UjtwWAf8+7z8Q1uDJybemP3twa2vFv9wWuPLpP379Zp24uvVgBh5w7uyf5I56x18hsHWt
 8CTam0Tc0F8Y1CF2xDORKYX/Cf0F4IpPWKX/vKe3IKkNooWS6yvy9GtZbp+c3G9uLJrrqsdj69G
 bZWIxCaBH3Bf4MNJd/sJPRcj2k6q/G/dE9QrNcwUp6W0K7IIW2oS+kQCQ7Lk1Og2fpLTdEVmerw
 AGZW0Itd3ND5D4G/Xiuwv5Yt13jNq2Q7yEvJv4K4wdjE4sucsj2f/mGhVQ7fhJkimeDbuYVh+cG
 0yB+E+KFuBabj3BhjRRHUV05xh51q/seh+16KBiZgm6aqacmJTTvU4EndMsrenqajmznYvAMQrV
 ewp3i7UB4mmIGE50BZPzRdhcOY4ocNejuuxQVROuvFs6Wxu/Ves3c8wUT2B8ApBOgJDJVQQw
X-Proofpoint-ORIG-GUID: ArTS-giEvME0eCCkxDBJhJZAGfwPO_pC
X-Proofpoint-GUID: ArTS-giEvME0eCCkxDBJhJZAGfwPO_pC
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687e871a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_112947_839104_416564AF 
X-CRM114-Status: GOOD (  16.39  )
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
index 7a155ef6492e176390faa3f2dbe419f5cfa62f0d..d25dbdde7dcee9fa3f1bd48a38baeae0f063023c 100644
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


