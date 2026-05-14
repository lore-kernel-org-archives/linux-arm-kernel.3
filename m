Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57008CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTNot2G6UXK9KjvKbPaeqUks8bb1J/oblGSXDP2sQRQ=; b=SZQq1TJTLo3d1+AuyA9wWdV72j
	lStF7t0cJ2ndxC1oUv92QVTiYpJb14uFAWoCvqD6fJjc/5LMSinoOz+cP+cHBVqoldGh5Z8TWA/Zo
	OU7icaP2LTq6UxfwAtkyMohvWthCeiM9BRaFwDSFxuXcZxCU1uhVjPX87IrzxebiKm2RDm+Tri/dw
	hOU60Nvy4qWsHjroTZPiOzTDcZ5k12QZMBJULB+2bjt3tufZXYs+HRRabVxxJwDyjmsvOMuT18TY/
	sYk2OXcYI4NTn3V4+9YW9quqk+N5tx/tlWv75dQBRP8Ih0Pa8Kflq14PVR5aALas8O8NeqC+iWumt
	u6SltRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX3f-00000005jdp-3WWM;
	Thu, 14 May 2026 14:29:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX3d-00000005jcP-2IGP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:29:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBecKk1718027
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTNot2G6UXK9KjvKbPaeqUks8bb1J/oblGSXDP2sQRQ=; b=QeQM63iuLk/7LG7Z
	M4Kp+xld3oR+w1BZnykV7HZRxxUscupSqZWv+NxtomStZgmTLEQbV/Juf8JezgDY
	DR/VvbfEebXjbFVtGyih5I0zB1GzYG3v90Z8Z4kojHxRv7nIKqMRS/XUu+NWwkLh
	7LBaeLZx8HkF+1WxfMypBu+WCdi6fpDu3TvOtPJpx/Sre9RCmTatPUJc9OJKs7A/
	wGyFnlv838TVpKzz0wbYHh9ltETQq0F4c1XdTa76/YdtCqsyVMYkE//dPoKsoTtt
	2Y2MVpBGnMirHmLDL4XVGWp42GkRv9Y1fBXzpnWR7J7wVh8AVkpjQYL+H/mSeLSE
	56VYUA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7hwbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:29:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b461b36990so83985515ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768940; x=1779373740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTNot2G6UXK9KjvKbPaeqUks8bb1J/oblGSXDP2sQRQ=;
        b=Qms2D9zk4Jymsvga39DI0LfU/B3h6skW3eKuRyljfxVJae9tuXKSNS8XN5B4h63e8n
         J+iqUkZxjS0JzoI5FtklXHlXbUSSJK4FQ77OAI6SxNohIHZdWsY1o/R6goSWRuCqXUM3
         MBQ2b396CWNRUDtcMaHQaxlfejd6rqtJTda4DM76aFOK5KfxZv/8/i5qaZdX5ZXQG1Ui
         yCo2XP1swmNcEdCvrE2+sbCfmHxVRPdWJn4jBUPBvlDx7IJG50O49EL+QJOGQSvjt0r6
         GBKfU5Yr3hcsSDZPwmPhOC+VARzsVaC2XaTU+evv3SPCaYrvoG9o+ux52cIByF6Le3eE
         qpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768940; x=1779373740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oTNot2G6UXK9KjvKbPaeqUks8bb1J/oblGSXDP2sQRQ=;
        b=m7sEY7MmHnoucskt2UbhcSsCrCvf6eMphepjthxDpjz0vnNWfGvRzzuHmwAMXjt58w
         7ICtSaAet9He4spH00gTdhTRP0dRQJfUfsng8Cb3AB02+z6JcBNyrQ78r4j3F/rZqJCI
         WIUJIKTxYgIRepyXGFzXnj/Z1JS4CUSFSt2mIYCOt0e5wO9xTpQIarVAo2ffeo4iDz+G
         j2mlNX0SDm50X6yQ7TbMyZzMXJ8x+wC1HYEsMl2pmiPyCDS/0Ojr8lcB84ZqoxxL/jjv
         puHJ0PZZ/oWzEx71JZN9Bk/aL4iDSWR601ukVXtlXmOcTjjjKJj4dHPxfTIdxJdZrgP5
         eTJA==
X-Forwarded-Encrypted: i=1; AFNElJ9A4VONkD8s2qk59lsOHa/WwdI0cskixmYrTmbOAh45TyeUwuExDRbQrP08R6lCXAEm0Ucly6LfmgmWxphqTzeQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyirveIrJnOrVGj1sfuzdbS+7s/BOE7iRFfhuUI4SpB41Fy/CaP
	onuWNA0n68W5c7ksX26eL7pIDm754tdbev2k3R4VRkkf7ttpzrl1D8Dy1ulZJLHGEbNPMu4gfV9
	2CCdidxVq5r+oIlKzodi4XKQO+jb8RP1p1qGXfQixC18kx75YG0b0SeuNMxjAYLSwc4b8AZiFLW
	/cUw==
X-Gm-Gg: Acq92OFwj4Kz+L4AbMdayBkZZ3i8nCqUazFlAUMGrmaTX9K1g0vvO6IFIVjtZc6b2+5
	6ZGk0ZtFj/yDCMGGoE6YPs7WXpMMypzlStY4dIm5nxUqZwYPrSyfoNOQKnMZGWTjOmT1j90N8pM
	q5+VGFxuEd3ZLiWfrrBcW8e531Cv5NJYrXhsyiqYLGx+zMOd46nEmd4/WdJh0nFTSG00ZiU3rWQ
	FafY7pb2mddwxG/PWo6vTBgwNOOFWqJ8V8HkgAOvRk7X9yIqzd8kS4Iip0aClQ9+iQrpfVmN9eJ
	pBoLLEsgvHyi69+yzqkmmzTmEbV7JwhV+RIcUSAd48Q/HQtOH8em37CfM24zBfT1ietBZRyItIN
	bAAZ0/cYMA2mIlgvmB+uPJeeFBo5FJmBy3Az5tD9L4Dx4oNrgKN/e35cggA==
X-Received: by 2002:a17:903:247:b0:2ba:1202:4fa8 with SMTP id d9443c01a7336-2bd27291ba0mr83863565ad.20.1778768940030;
        Thu, 14 May 2026 07:29:00 -0700 (PDT)
X-Received: by 2002:a17:903:247:b0:2ba:1202:4fa8 with SMTP id d9443c01a7336-2bd27291ba0mr83862895ad.20.1778768939331;
        Thu, 14 May 2026 07:28:59 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:59 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:53 +0530
Subject: [PATCH v22 12/13] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-12-28a5bde07483@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=2244;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0UqGJToy0TBXJ6WPFU7lKlAFIhpopdAI0eFI74nJSqM=;
 b=mc2n32EA1551rOvh7McfKD4VQShAaZJi6Mm1+QyG4LG1g9r/Pp6mbhT0nsgCYpFPHBED8gDSD
 4eBSLKFcKEXCJfpEeyPgXtkIksK8OgGl2nUJzAaCxihw4VD+s4uRJlb
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: AqF5Y40RgvAztKN8oMmQpwOxITWXwUXt
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05dc2c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: AqF5Y40RgvAztKN8oMmQpwOxITWXwUXt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfXzwTX5KsRXVe3
 F6vhPr5dZPb3bG9dmXJCV3XfSvHCKqTlj7fYpIKsAzOn/+2qWjSznX7kwNCD9W0oSP0KWYWGpWM
 c3c+fL0Aq7PEZjREbSQ2SzZxCiF9SJwSo49CqDRInX74J0skM5a0oqm1gc4XQ1w36xBP0rcAAVP
 6wgj9HAG1zp7K37kW3xnnqAJ59ZzzWC+UqL+bM5YP4FpG0F13fqs4ezV5x+UVkXNdPS8vpu/1ZC
 cdul9zgab2GGqFEXxHVKST5jBrOu9GZvID/L6qhSMpIGP9VCLmz0dbAEre2TXjmoHjE7HlEMSuJ
 ESGxn4b5uBw0+Wv32vjUp5IkZDG7aOyJwyCqPF/UZ2sjFNtJxSJAF44JG1TZxqvI4iFa3biU0rL
 tdljy5wEgMlfyM1lq/MgPhOwJyxKj8gZ9MBdDKkGLvEXdRcsFj6Aj0eP5S4oG5VPxFiWk0ac94C
 hTNDhqOQwJgz5OLGTzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_072901_609774_B507E251 
X-CRM114-Status: GOOD (  16.36  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf130564efc2d0159ac0de39126e80..df668dbf2bc60175c36cabfa310aff625647899e 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -661,6 +661,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e6953acc7fa06d22a1f83ab24edb0..da675f7a8f2d83f3598a6a7ad71a99206213d03c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -674,7 +674,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d821ca88a38ac59a78625707850bb5d..3ab5ae3124ed5314f04202b6b247fbbbef665053 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
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

-- 
2.34.1


