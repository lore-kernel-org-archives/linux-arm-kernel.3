Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E66DCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZfu7RdKZtwAuiMpDePN5OtJu7qdVHtUdaRTMDlU6TM=; b=Jm2bvIgAjX1TIMyhvpYue19ZGQ
	Tplvx9vW+WeVxG/qJeqEwjg7s9PxgwKjZPLDLUzeJx928RpC859P3DzjCsYsDvBsPfVJaUKfcknUG
	easNFuLzJjFE01PFYkRBfC8fzjaZfT3By+6XinTXw6EYYdffth9Kfqb9vAdcs1mRuPA6sv0MlU4n7
	jBvql+mKEz6/7sNCuSNAtWJrph3xavnI9OT2Ow1zcnUuFy65Xo7tnhiy/btbYDURO9/Mj46ivQTFl
	twKb5MBqsOJvwN0la75ZnE9O1CBE4EDzXwIr42CZVAiIQtgLl5QDVmwmtPosw98LWIp/0/f0CkcFI
	d8wRa2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tJQ-00000000S87-1WoQ;
	Wed, 15 Oct 2025 04:40:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tJN-00000000S5w-0kbU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:40:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s9Cv004011
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZfu7RdKZtwAuiMpDePN5OtJu7qdVHtUdaRTMDlU6TM=; b=TAndtT8xUCR4alSN
	4rrgBcTwAXs0AN5CDagPAvwdm2hZBk9jhyZkzV/EHefwTAKE1MwK8pi++myMZMi5
	M03K1V44ioslf97fYT6w9ZmWJAyyKnw1Wc4jVxcGYlELYeJGUfsj5+ZpaviiRMqr
	KT8rrmRuq035OjMDd1cu0uz1aJywbTF763RgsbNVx7gtRhtSWmNaoTNGf3Illmqv
	FsUWInOjXzqf84+mkCb+lC7533dOKRL6Y6Qkc/WWMKDgZ8of+eU1sUeUruVZFKCw
	el4ChIRiHzNafenU0hVDQrAYEvGz/HI3SUWwCB9vlAid2qfBJ9R8cP74Uuw5RCqa
	iNBy1g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg2wkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:40:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-78117fbda6eso8846057b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 21:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503228; x=1761108028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZfu7RdKZtwAuiMpDePN5OtJu7qdVHtUdaRTMDlU6TM=;
        b=bIyVCjLNjL430MuvSgPnm7Ap+8dFOHbtXh4ZWn8CQRnsg7i7g2gGZP4+0KpeMcW8H4
         0OdzJI5cax/H7R1vACKK54I/NpBMwJT+IUzHv+cPxpNowt4oHLWiuJ68WzjYHVKqEQP0
         EfGN+9ISX235gFc2qHwIN7Zvwz4cbfIKXCsXgXDWzHI4AnJo9kfYakTZCq31b4xoSTzA
         6prmUYRXDqpRy2sXqJ0lNn7xpCteEkSbBrAoT6JnZq4o8fynH2RkktVH67DLNv1fuxLQ
         /t+k3LNoXenNNOx8O2EKGWNLBIcT5yy+JUgdxhBFACrDPB79oxaKQ4gJxbVsBEVk13dv
         y95g==
X-Forwarded-Encrypted: i=1; AJvYcCUA7efn8wyW9PjH9f+xFhjqn/ZB7yJZ/XFr9lhSWMDMqmboEzVithwnN5PcsYNKZeTIHz8Vazq1VIc52Z+RYhWM@lists.infradead.org
X-Gm-Message-State: AOJu0YwPvj3gkbj4xu+cUVqXxLUTuguhLuyq9pfS1wSnWcFERSG51C1k
	iXaYr1WUvuwYQVXof7ruovpXtLU+DqwWXU6684iPpimYP3Kl8CpS8dYtFG5T0mr+KhiYh+mQyT1
	WeqnxQBouy5VWLA4z0ZWWBQsCxRaqc24+rA27X3izbijt7XlFFiAIuWmYfpfuK17PGzBJDidv15
	0a9Q==
X-Gm-Gg: ASbGncvCZtKjTEEGSazohixq15xronarmvgOKjlwGINiiklb9xmHdF6ibZ40E2JFm59
	HsMvA/m6z5WjFtHermXKYOW7F/78oBLy06PkEnor8BHkg+yoRJwBNXn0/GYcGvHU1omoEL/RJKT
	iwgBnrvMHem+R5WNuJk3WVpmLYNxY5CyXMFaWuuksIG0AMEwyuKSbNDGLzeR9VBFIhi4keSl/WN
	x3v9zPZ51CXeD7fOM+PpreX9xJMHsxhbR0dfgl3KyR55oNjQILa32oM74YeapEubb6Wyjrj+koe
	45DArmyNEYfoOuqGU2WyatBH0U1ljdvCv7FXjqjhUsLgKV+ysFBR0C6CVAGtGLnfqp8Um+1mz9n
	3
X-Received: by 2002:a05:6a20:9147:b0:334:8d0b:6640 with SMTP id adf61e73a8af0-3348d0b695bmr198615637.8.1760503227394;
        Tue, 14 Oct 2025 21:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkDYbQIRUoxg05mXOOOW/CBEpKTEB/pAQHQYMra455pfKgAnlmRZ8yd3snqshN/4BsPPzZaQ==
X-Received: by 2002:a05:6a20:9147:b0:334:8d0b:6640 with SMTP id adf61e73a8af0-3348d0b695bmr198585637.8.1760503226668;
        Tue, 14 Oct 2025 21:40:26 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:40:26 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:27 +0530
Subject: [PATCH v16 12/14] arm64: dts: qcom: qcs8300-ride: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-12-b98aedaa23ee@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=1518;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3tL+6VDoxS2hdKK3SSVcPd2aISC6JIJj78KTfRsAig0=;
 b=s/A5Gob1an5Sgo3hNJYO3UAMrJrJ71fVPjCtysHgMuKEyh0nW4q5z+SfV1ZdY14GzQJsINdBc
 U9DG10rQtHxBubxEMRq8aw3VSj19z5jd+9mOd0pBMH3u5SxAcI5zdok
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfXywMJaPnXQCH3
 sK3vp0Ml3rIx1HAnBU7W2c5dsrAsP09tvVW6wkOw5ZUaryrtgZp4kmfVeqzbRUSg74bIbHqTAgc
 593+iKIIOHDie1qO4et+pYdguMkB60phCBYlbTRYMdSuIWCcrsNYeHzl1e9funjKCyJR21NrVZC
 AYytD9dtWxT6LMl09V8OqN8FKEQn/gIh06MQDVUsEqutGXc/jaNqpirM/XtzKRQBT47SD3sJYFB
 tblPazgaqPOWeBrnRoYEFe/SrjmSv2DKEIB9abyS9aP8ic7A9QBZNDjzLc55U7dlpqhIYx+lh2s
 fY7NSJ7y7IgNtWko7Qo8cy7bMnBYpbAbvRaKI6EzpKCuKiaYESGpGnwIncUWrXFLbg+oh9o41du
 hj4YySxt9jQ9IT4+7UKPoQiZrg4oeQ==
X-Proofpoint-GUID: vJ04A6jAUlDxAO4JUHiqUYT_ekVIzYLm
X-Proofpoint-ORIG-GUID: vJ04A6jAUlDxAO4JUHiqUYT_ekVIzYLm
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ef25bc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pkXgoPqwvIc8jTsVjBcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_214029_233729_03C62E0D 
X-CRM114-Status: GOOD (  16.25  )
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

Add support for SYSTEM_RESET2 vendor-specific resets in
qcs8300-ride as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index cabb3f508704bc9eb0038bd797cc547d0c8cb3ed..7ebe292f1029393b43f34e66cb15c2cf97ebf30d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -317,6 +317,13 @@ &iris {
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
diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 8d78ccac411e495592a6ff532c99e7aba087d18c..89db75aa0777b9ce90732956024b6ccbec93428d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -663,7 +663,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


