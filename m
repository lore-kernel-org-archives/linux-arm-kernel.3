Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451EEEFCE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhDn1FDSw+c7UhbFQL/TJrvi10/P8i7V+vblELzHcoI=; b=o/MzXVPCpYPbu4hzWDQ8NjED99
	HksQvyvpmLnklvHj8mO5Wte1ghdBV0+hDnfy5wIr4yu9/dUst/uGWnQTxY1p3Z2pXFEJzftlFkvqZ
	YWfDi2IGJGZ773UdUHBFoFfRuX5hbl1fk/s6Akq9cwGr7Q1HqpOptIwpYKoZeLaULLYEaw7CDTMsC
	3jxdk4JrFW+PYFGeCKXxY3wkKi7qWN9wvZXtLEk3QJTrbe56MM5iT5GWHOsvBOD018ZoUy3cxsMt4
	2LJcLr+Y2GlvH5lTGBMeqlbyR845JiemJ6RnUp4GWAPw+9H56X88dL7ytdAk7NFg0PoJdmseTp+ql
	2IOpPImQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqaO-00000000IO0-259t;
	Wed, 04 Mar 2026 18:04:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqaL-00000000ILM-1zpQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:04:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624Cjf7Z1422277
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 18:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NhDn1FDSw+c7UhbFQL/TJrvi10/P8i7V+vblELzHcoI=; b=jJaMHWVjsJjwa2u/
	aC0yykYaleCxm8NyrmFR3Bz1NCDL3FH1w5jjPlOadDOkQZ8sV73EyQTln5q6t8xs
	0J/CxMm3EwxgqY/1f1cmgFUn6fIR+jS6xNKbmxxyoXqoHODkTeE6Mifwo8/pejad
	J/mLYl+r7ThQkqBFMAsGhiNP8tNbNuOQMWZ3o02f+UaXf+QKdlIoFRKb2h/Yj58l
	FEek1ZSYPYjrScpyziIF5Q+XuuVr1SrbjSNufoah04obrMGzgDj1IAiBdrxK10qZ
	LlWO+ncPE3RxMNOrsVRhuZX+HWdPFXoS7erpNwHDEeOiHQIkBi39OUQA7EMUKqPF
	L5oQ8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u2dtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 18:04:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35449510446so6740847a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 10:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772647474; x=1773252274; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhDn1FDSw+c7UhbFQL/TJrvi10/P8i7V+vblELzHcoI=;
        b=N4wfq0a0g1WyXtUOHBXz9e0qj7wj6deIWrIKaqtl1yMTLAD0NILiIs3/GU/xgPzUI7
         hSh+EwbXo1+8b2AfYu3sZhI+laJUSRLfqTtswJpOxoFTHF/JwV+E29+jdzen5dkOcVuD
         8X+7wPLkKxe02Aq1pmWF5CcRH7vBq4VfM+H8evSFj9Fabo6bxGirf8lnfQ/4H7LH6Fma
         H17Oyz4yRyxjuM0ijj6emFcI6rrk5iIT3c9KeBGHAihdQ9SUXEfko2eVVboFvPnqEAIk
         eUFsVKy8YV34TNeW9yyn5mJAb0WHn4cUl0h2AFDsILDjonkA7j/NcHaX/46Tbh2VsUYK
         2huA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647474; x=1773252274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NhDn1FDSw+c7UhbFQL/TJrvi10/P8i7V+vblELzHcoI=;
        b=IHwm6/kh4amMWLxUK8fFlKzZD2hDiBsh4Uieg76yhs+tSvf0bGVkFk8gzlSbtLwj9Y
         ZMHAN3hh4zrfuoe6p6oFejRZ0IVskoptU6zwTB4XPXCvs6K6jGEwMBW1FTUxIOZniZlu
         cleR6bABv9hBoEuluuHEhx84LS820O/NxXpC6uuH3sP12V98QOIHbwe/O8FNw5EPhAeb
         N0grQM69syCpMcoWQ0ltM6v0413GlqD7E/UDnu5u/Cpqvw3XcaNnhVMd0wERk7eTSLme
         G9/8wC56Pjkn/qj2SuHH8MIubU6UrEHAv3sPmh3GK4tvnq/KGRzaTqRlLe5GNTe97Z05
         6FnA==
X-Forwarded-Encrypted: i=1; AJvYcCVpZRY57XF3QsQPbR7Brk3PmLzZ2h1nFITUhHNQ3xa/5lPgBnZlSpBY0jZVm81Pw6r9xfbeE/zEEaTMJFTYXrq/@lists.infradead.org
X-Gm-Message-State: AOJu0YwoAFOUJGyN56dVC6tq8fScaPQp/oP41/zG9zMYEKJ6KF8pobUi
	2sZZ79wORsWvrwJSDNYE86oIZfWdBWvJfK9E2QUbsqo1iXncDHwZnzEkfJ/CFK6KJE7GVwP6B7l
	CZeNqMEas9Ea1ip069RHhXFZzkpvjZPzwf8STHSWlqRWDu3fO8yUoJGeYh8ESFkf4ZsBJQqjZfh
	EpfQ==
X-Gm-Gg: ATEYQzwAtwG5OMjs+alGIF2nThMwCdhVHp8zoP86QqG0kCPhN5hqfpMGkIxcwD0ttmN
	YCKap/k3eRn3FHMrVMynSQQdrPf6joiW4ghKtP9Tw8YFK24G4N7RJ8Q1emybRoteAW1AdrUvvtM
	AXjoDmJLt51D3FBt48k1qtmHxsQ1A9dcz9F+4SnwM6B4Ed3bx8XKCavtLLuxdU4+0gABOjF9z4h
	7GEB/jhXLLbAViJM6bm5WPObyy8ctdeen6elm+LoppAX/GdC6DPxlcwI8MYXWkuwidxTcD+4ZND
	HRAT97RORVsZpJjDyh12JtKZrenB7Xpx9L2Fv0IVJnUDP10oLHYw3mPkGmjT6LFz9tnJFPz4xwl
	jOunf6jwfPT6Stf9QXMpuMIENIZcxGoOq9Gca/Qk/YwBW5o+SI73CDoZ+Xw==
X-Received: by 2002:a17:90b:3d81:b0:359:9669:c879 with SMTP id 98e67ed59e1d1-359a69cd901mr2630729a91.11.1772647474546;
        Wed, 04 Mar 2026 10:04:34 -0800 (PST)
X-Received: by 2002:a17:90b:3d81:b0:359:9669:c879 with SMTP id 98e67ed59e1d1-359a69cd901mr2630695a91.11.1772647474050;
        Wed, 04 Mar 2026 10:04:34 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359a8f22062sm1080606a91.1.2026.03.04.10.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:04:33 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:33:08 +0530
Subject: [PATCH v20 08/10] arm64: dts: qcom: lemans: Add psci reboot-modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-arm-psci-system_reset2-vendor-reboots-v20-8-cf7d346b8372@oss.qualcomm.com>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772647398; l=1079;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=UhQBeFgHwK+VhUEZZ9u/QamtLLiZ1oP9pqxntRK57Dk=;
 b=RcmoQ1fYDcRXvDooluVeIsqC7tRYg4rdhmuADpGjwdfi7jgzmdro1TicHjZj8DieHX9B5HeQr
 oPFfLSLbZ/PCKjddL8VgGur6YGNV74s8lBO/Y3lhg+hfpieOYAYNN56
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: 3lOBDbE3L_rZ-vTqtkxHkXL9ZnJ_-0s0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NyBTYWx0ZWRfX3TCHmEe/+LhK
 dLvsSketMW/Lv7kkmTSifZis/bGdb5MCu8GwajPC+eycjYyvYtDhzC3hQ3btydAdWroFFzjl3Vw
 aBByBq7j44yVqEilBHKqWDAaWmYMWV+holSnq1juw79B9rCkUjE5DkoVRRS0Nmb5JAGX4FtVFvG
 8dFwIlddQLE/0ivpMrkzPfP9ly28QqsKBDlcmqCWiYB9vwOKU58gFnUjylg3NeeabpodkCI2YR0
 hrgT0mufYYRQgeQZAx+fYzZyVAX8XQghxolMaBBdvoISnPd/GSxbECkJoDRhpGlttBR4YMfhH0U
 JVN3JmWj6Fleb0Cm85ZV40acYINwDGArWjzNsiivNcBaPHFrYO+TvwbKJW6T4bVwUBx4AUogosj
 jRlz793lVL3y0RO5LvUJW1HmrTAZIR/0GFL1wJBjPpahwftVcmt5K41hwwFnyEieJ6CNImLT+PM
 j3nfh9AJtrK/X4bzWuA==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a87434 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ld_RF3OM1xByVwKNVVYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 3lOBDbE3L_rZ-vTqtkxHkXL9ZnJ_-0s0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_100437_671032_A9AE0872 
X-CRM114-Status: GOOD (  15.32  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for lemans based boards, for use by
the psci_reboot_mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553dd70904d771cc1da784c85fdc1a5..b5234a1b31761a6565299733a30cf3808c439976 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -635,6 +635,11 @@ system_pd: power-domain-system {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&cluster_sleep_apss_rsc_pc>;
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x80010001 0x2>;
+			mode-edl = <0x80000000 0x1>;
+		};
 	};
 
 	reserved-memory {

-- 
2.34.1


