Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392C4C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+8csztsVkxJLpwMf2eNf9DbwNaVLmwQIwSKFspXvgQ=; b=oqD0MKf5r2crc26KKmXlGpG8Bf
	SP1LoRgZhzRH1katxWek34Vh7A+c/wKeUQKWEo9Y01q8DdZVOmX2gZpNm2ZzdWyGMipeZJikb00Hx
	DDoB2LsiUfECNgrRxsKHjMq+FvIdNACEAmJ/udImJLeomOZh7qQyLcPg9VHj9U6xr0zOYp5muvw9d
	xIh/PyS0IGOVJ5whSuFKRPW39CAQiTwhFmwbszL+8Jfru5bsN8eDmXsRTNdFsnF6YQx8IFkEkDyKL
	XMK4tq51tLXv5VLVLaPH4dQ4+2+E5hd9EdAneiODgeSHvmVZpZa1tZPuW8dGV1n/RZWvEt2HAseKQ
	OZt384TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgmO-0000000CkMa-3ewQ;
	Tue, 14 Jul 2026 17:18:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgmN-0000000CkLL-0Nme
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:18:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6vvH852619
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+8csztsVkxJLpwMf2eNf9DbwNaVLmwQIwSKFspXvgQ=; b=WXL8B9bQguMMatZ+
	nel8WLMgwkBiRf3tcfMMV+UESDdCx5LT+vWbGloU8cdejgUeuMEhrh1Lt4D0MMM4
	NATCKzvQg1jF/QrEc40SHxo4Fe3f3JzmpO7qDCLrTF1cszT8nxfSZlpTAnxQU3gC
	sYyWItlzVkBMfKIslCrG+gLoxgyUT/vUT7lXrrFDvPGdG830NX19H6RqMfTAcz8Y
	uDMGDoES+Nkzi10QkICUDcJk1Dg+EgKvWz9fLO13F/W7qX0W1LmZGB43XLyD9GO6
	BTf4R2DJWDPZLEMRoBaL2ebUpGwnN5uJ3fQJJlCzqib+givFxciMOxvSY14sTaxD
	FK1AFg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk1dtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:18:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1130783a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 10:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049525; x=1784654325; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+8csztsVkxJLpwMf2eNf9DbwNaVLmwQIwSKFspXvgQ=;
        b=dnefYa9Amj+0YVU6b4w7kOEAJm4d8fxFh5f9/gLxKR4PEj5/P6bOFDxbNXIuRrq0Dc
         VKn3T5VxsAoClce91IxHZSsq3WkXLrcCgpIrIhMWci5ZVtLHSN7eDcY9ilWdETizYTS1
         7yBGFDPtC3226WMrr/ELe6FqApBHiKV1QN5VgmQD9Tg+85RZjCzpW2pRVWHFKWm+i4Iv
         wCdILU/4vLicsZDpijb8Hw65g7X06Ofth6Hg6VF8T/G89AjK2EOh9s9xEAl9fXvIIp73
         6Kv7zU0SRuG8pgH1b6zzDqvwumVcrJLQ4vbltOnQak2BqObZaeoWhhJ5iDRYCIDjDgxD
         zwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049525; x=1784654325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+8csztsVkxJLpwMf2eNf9DbwNaVLmwQIwSKFspXvgQ=;
        b=oVzTEMSVyHveDnp5txiboz1D8f1Y0K9SuW/FL4ctEg2y9Cd6z26VmhZ8wEsnPVfPn8
         /XXn8JVB5mLihaCPg62y6t78MDH9MCxeRYeB0LZTuiXPtvYeA+0alBeaqvDvwLRnof7m
         AELj+dB900bmjvuCol8oEt88TbcApQQqDSTYZmbnYErozrf5mKDKwMNo6H65m8cePDzE
         qEBwPyLXWKzBXSWzHk3YhmsrVZHiny6g9TnEbLTzkaOwNLldZ7caNy/V3EmQ2oe5s6gQ
         id3rTfKVX8CXSUTxvnpsmGGSTAm7sO4jO0bEvaaOqG5VXyc31G3uUr3m8eQgREL75Bux
         veeA==
X-Forwarded-Encrypted: i=1; AHgh+RobUrSrbD+W6WD/sZJoZ1KjmcFfAqQX+tDHnROrommfw71kkSboSHXqdhPmhvVjBx4axMS8wWD9XyVRLIeCPfK7@lists.infradead.org
X-Gm-Message-State: AOJu0YyUta/BIpsgC/K9lB79L/y3ExLlbqMe3x+nT4T1XFKKt71ChpR7
	kYq37elhRyWsRk0QI/60P6vl050EfPMcolB2UsSLzWmSbF/eCSs0dunTUJgmwBukfO+y5e5nyo0
	qUTeGAbyQ66kB5aEJBR2VSt4FsWwew6nbVqDZXykv773fF8BkJoqrNAyvJQsJFkZc20TiMl4ksp
	WPyg==
X-Gm-Gg: AfdE7cnp6gUrI5N8n6mc2Var/OreMasNAp26zqerfgbv50B9z0tVQ+iZbGgheO7PoZs
	q0NJ3+aeP7glEn4c11nRJDfMGXXZ0D9HqQLhuo+lHOIKpgmvJbNEx1SJbGhzqp71F4ykpkAdWTS
	IuCGd1RJnTEm4go0CBZLYTsrAydkuRyI01E+KfpLEdXrJQ4PH3G0EP1G66doWuaJNLBXm/GIGS+
	6FRSoKJF0JxcdJv+oHk7Y4+65JtmRDubK8xGw9f3qdvZMr2cyuDPAH9lxyNQxMwCwjLCc7L0L00
	3sooP4Dq18Jau13G6AVpXotuFKJAIq0xLOGzjjyw+0pnceEVAeRZ+9ZacKf4n/SZoSfSU5YNraZ
	m8m3A5qgCV+/bcB8WH16iLotC4wVxdCVKwIFs8ZRDm5NQ0UA=
X-Received: by 2002:a05:6a00:22c9:b0:848:5951:ff78 with SMTP id d2e1a72fcca58-848897d2bc7mr12968005b3a.36.1784049525204;
        Tue, 14 Jul 2026 10:18:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c9:b0:848:5951:ff78 with SMTP id d2e1a72fcca58-848897d2bc7mr12967962b3a.36.1784049524575;
        Tue, 14 Jul 2026 10:18:44 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:44 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:40 +0530
Subject: [PATCH v23 12/13] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-12-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
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
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=2076;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=kOJzOHPbdhQsKmeQIeYy6G9x3fc90kQ54JK6p6ylG7k=;
 b=ESGx5r3AQTBnDLh7oNOdrBzmCSNSjUnfykfNHJyYl+Z9qNPaSE/ou7JEMTQ65oKELFQeNIKrf
 gNtsrQ7u/c0DYCpwV0Jha+KGoHoHt0fDHHSiGc934ncbOOknuX05b9L
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: tI6dFSkEIuA3vEMCUDbIYF14P-pqSzAt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX4gXlHSyxb0cW
 oEObApv5wKpmwN6LeSnc8kMx1s2lEiwDNFIj1QeVPcZJgPQKgVb/8XukvMrh4MWO/tAsclOipGA
 TFEsuSINj9hZtBY4jszS0g/9iDUup1SZhRbcW1KRsMbtizQSpzq0cKuRubiN7DYbLj7wvWA8Uk6
 5oA9AjOiIypelQILkcv2wtvwr6LlpfFh7OjyN/LjWsZWk504EI/ycw+2nlbcWEJmnpiGcCgCSaW
 Hn2RpKA8xZ+nKob621kaEO8uov6YJ9QHZWKkkPlVfEjUf6L3REH6KLhz50JAgfPetV+ijO4AVlp
 ZYSYXL3B7UTBkx3d+CaS/kSTAMFNCA7fmVQdBqBNCUj20Nywgy4kPpKrsFwjbtpuN1+4De+wObE
 ob8tYuip5ngBN126llWAueC0VC7sgxcxSDSmB3Uxd24qQIJuXxZJHm2WS5+wXCfcNB/sUATNRnB
 HxQ8RjQt8yn00jpXSLg==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a566f75 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: tI6dFSkEIuA3vEMCUDbIYF14P-pqSzAt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX5k8Gbop3ales
 I46wbwaFN8NBE5Bm+/IVyxTxDf7oNinimKdfPhn3NVzU5Bkek09bauxj6nvIgokXOA4KWqJJ10y
 fDicbtNERm5fDXhVb0RDpYlIxHQxLnY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_101847_161998_8901DEC2 
X-CRM114-Status: GOOD (  17.46  )
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
index 9d17ef7d2caf..df668dbf2bc6 100644
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
index 64fc0d592282..824ec3838c75 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -654,7 +654,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..3ab5ae3124ed 100644
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


