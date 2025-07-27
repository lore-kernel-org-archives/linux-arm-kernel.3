Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EFFC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 16:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiMmHpQ1bB+met8QLJcdnw+SCuV4S6OJO6VsyYvdUS8=; b=oYmYsFfG576mNefiNqyaYDmNz9
	7EKYg7Ugobo2xor9ypsVdBoO4E7d96/E5kgBHg7Ug0XE15am8ufAWjjL+2Pe8HXcgUoxBqivUMHXT
	Mz8gdNina9l7MFms/zumMtNoA4uI8q9GTmmAuVeMLkDdmhW3al5FLWSb+RPiS2FOSkf9b2/8C2ogW
	AGoVTg0yoi9Axb5lwFFcadtfc7//R1aSownm9lMzZhSdHHyDQnc7eZWSan5tNo4EkpTdSWqtV6td8
	AU3AKNrQqavr3uLAZQIFw9FjEk24W2Buyr13RJ3R9HFLY/lNLDqwNSWgpoikWnfjZxZtkV20TYwle
	j89+PO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4Xx-0000000CxWQ-1cIF;
	Sun, 27 Jul 2025 16:48:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4CM-0000000CvLD-1Sqp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 16:26:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R7Vcho009567
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IiMmHpQ1bB+met8QLJcdnw+SCuV4S6OJO6VsyYvdUS8=; b=LnRUUNJGXUIhPCL1
	JnvGQKD2L6Lbi2jzEYnYkIfcAFZkQ8b4XBogLRdUTJgh7+AeZwmfupFsATieWcyC
	+4FLiCJJOrQlECVglxl32h2h3SlMtG2Uye2YMhDwWU0o1wuSQRjkNtPAh7ExSUAg
	huNpNknEJJ7U4FAeNWcO0Wakusb/uHCLl5XpFdKd30lL5V7dscr5baxdyQL2lELq
	N3EmJrem0eFuht6RRvJ/aL6sehCOvK7JECySyPfowe7EHRrbAte+SiVg/W76J5nn
	OYIMhmkUssp+Z6hlJF7czQPJQx7cqwDWurZc5IhV76VQnZxGbk5TPuiBP255VIAf
	IADivg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1aackt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:26:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23824a9bc29so61275035ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 09:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633564; x=1754238364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiMmHpQ1bB+met8QLJcdnw+SCuV4S6OJO6VsyYvdUS8=;
        b=dn+8UHgXjo/JmA+Hj36NuY/VI3fUWZWyrQ3RoVD5CfyWlmQI1r5AxIs9i5vSHiH+I1
         nWOVJCanxV3gjkeRfQ61a+fsxVr/YBg+0oYBHAxjhTl/EQ0cI8JV/1hLsM4fwik8VH44
         Hm4yLyG+1bQslpQEzuw1r6EyVfkQLAKkkMJPJozxbzsx00N5AN8Nzbst/gvrsFwEFSXH
         QnlyQ9niQ0JlX+B25eAbD8YPD5gXSDVvt1O+5nQbsqOkIS6D87K/LV/9zwFuUM7BSuTb
         i7GO5Kspddl99ups+NnQWM/Cdx36ZmNVh5PCFfJqBvakelzLoCkDxswBz+OfxdYl59RZ
         aDtw==
X-Forwarded-Encrypted: i=1; AJvYcCU3GYXxRd0x73su6rhC4lKicrgiRwkHYXYuHRNd6HI1msW7y4OgHrhCBRSbBnP1tvLXJaa5pSrguQs9nVm1qGce@lists.infradead.org
X-Gm-Message-State: AOJu0YypPHWDLNjKwlBjPzcT5bBatOqtL+ZAqi/8IST6VoyHHPYmbofp
	uBefJZAM1OjXDVrWCkARK2wkVpz0A4vjuJLDuHjEbtmEhR7ZvfFHvA3YUxeb3zHDfUOE5u+mcg4
	k9y19f7UvplKtOKTo3WQobsihMpAqWRyRmBgIT7J6caMhv/bNB0hGum7Sw26nBaeyOwDw32LeV6
	vPAA==
X-Gm-Gg: ASbGncumvj7dPMNuyHtYomDI0YmrZUTimF4xYmUHLiJWQhLLuYmR9yKzkTeNRicKKDY
	UTHmYRctYLEzAgWUHW9DvVTvfNrht/A38JYu3dymLWAIJ4GI7rWj4A59e+N4MkY60uKiwCr9Haq
	Cv3Wt6fxktKIzOSei6A0Ax6DjmqNRhRSBV7B8KtLzPSFyUaY9Jzhs9vwnk9YS1c4DsvybsWZVc0
	lmuuT5J64oeyXl31NBa2M2hrCcwwwwuIdwvaj5SChLe+LHY/gcA41DRhAfFuaZFR1eP/78hAFxI
	BniZ+cRszHE0tBlZsnA7UsbOS9f9mtkBGRQ5meU0x3dhyG31lepcc3xTNSTrrP6eBzUY6JZDJYi
	p
X-Received: by 2002:a17:902:ceca:b0:240:2bb6:d4ae with SMTP id d9443c01a7336-2402bb6de62mr9628185ad.30.1753633564185;
        Sun, 27 Jul 2025 09:26:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcv2kVK/ZF8/3NjRyqdhDR2HpvnWClMUSrwh0p1UvaDUQJSXqzTIkgTv+rF7qNzXfsSV+sgw==
X-Received: by 2002:a17:902:ceca:b0:240:2bb6:d4ae with SMTP id d9443c01a7336-2402bb6de62mr9627755ad.30.1753633563720;
        Sun, 27 Jul 2025 09:26:03 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:26:03 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:51 +0530
Subject: [PATCH v13 08/10] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-8-6b8d23315898@oss.qualcomm.com>
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
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=1628;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/OISjQAhUBAIE37ASE5b1kssDpdL8gfQSFob68FR4qs=;
 b=/j9LuLfgeFti1wex62JLiS+dW57tWBQjp0c2zfR2CnLi8HYpUl4wkARBVtzMP3Jg2HbR5Td81
 AGDjWH7b1EqBbUwIaroGDhq9zWeYEc/3o7sejilFBpLNay/t6KxhLuP
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: tfOEi2R2X--Xxvk1zGyJLfFJX9H0WbdB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NiBTYWx0ZWRfX6hnzc69zCSWo
 D7F4YRZNzTz9k7rkY5YcsUGr/Izl2LD4UwRFJo/3hdKdKdVfWK3WY7wDZVcQmTLYZu61C5MIHgg
 rcJEwbzhFT/ibBT/Swz3tKI8N+k9q2qvgbUCj18+vghAnhIngnPkvM2tndMBvbSCwCuHJBNqUFD
 1t2yZ+Lom9hb48naftwGBhXlxsBWBsqCDndPlBtVZiu8SrSXlS31W2tq/3ZxlgRYSiei7X8t3qG
 XbTZiSfsMZPdM8u4WEJSCG2paW9rS/JvbolylLnHCK1gpeJTikIXzRrPdhamC3MWzReG04cX8QK
 J3LAEcUaKRzwl/cN7JvQODlyoei9z/KPOPgZNhGNOuQ/5O6wpf0pDht0k07S4evZM2FbQTqTS3z
 v/LhDwM5WHNox9klSiqkySsPicQza1mz7SJ28c7GJRgG8ljT4Tz0Uz2ldkvHHF/8qFlfSqXA
X-Proofpoint-GUID: tfOEi2R2X--Xxvk1zGyJLfFJX9H0WbdB
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6886531d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_092606_513745_9EB22469 
X-CRM114-Status: GOOD (  16.01  )
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


