Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A78CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBo9gZrkew51yYf4IHpWDN66o41yYqQF87bJGWuNb/k=; b=tbe003i1CpldGSwzEZeha4Dtba
	C0fI7eJHe4cGLCAiw+q05WaApsiwFmcoxZZeBywipfF+kGDgqppXmjlEuEv3VQ45hyKomNNm3fCWQ
	1Fd0G57Bn56IFvcbjd86DmHK0YdK+/nPA7Ze554ky4fk0v/j5sQrypWkhyOotKhs12c7YTko4YrJY
	4jsfH9goWK/ZjJm34Nn+5j87p+KAChXtv1FXtB5FhdnRq0w6hsi9FnJU2WT4+8nhQxeHsc6iimHGG
	nEVFOXztfrp7tEzBVWdSrTwkr9PMMYP3dYJm1IWEur4o4O8j9sVMlSXdZOHlOTNzqU+6bzdUgGBya
	an2ggNNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tJk-00000000SLD-3UO0;
	Wed, 15 Oct 2025 04:40:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tJf-00000000SIM-3at7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:40:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sjMP003849
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gBo9gZrkew51yYf4IHpWDN66o41yYqQF87bJGWuNb/k=; b=hxs2r+8SAYSKqgeT
	uAZNpqBlEcK6bBPzYZ5zcv8abNZFHrNMkkFFCSPx8K8IIyRARkIGLrTOPXAqDF/n
	qZp5bk41wfi2JAhOAerQ/gzaNeZKOMKe0+ao48SwoB8F0jVO8VGz2suDEWTaKeDP
	J83RV++aCKvWtMtJEjQgMIZcXWIZi7gOz8MkBDDA9j3XCIKlaf11bs8U3BZx49x7
	pN05oHm3WL4XOd+RN9kp3jgnEWfzcVTmVkCM8pRMt6XCy40+rjLbyh1LsBkT7xCn
	Ybb/QhPBDJIGuzlRTMgSDqZ9T2FUOMOYfSLD20UkNWEcVKsrZ3zH2EvD+AEnbMYL
	OI9xXw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8hmna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:40:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eb864fe90so17000800a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 21:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503245; x=1761108045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBo9gZrkew51yYf4IHpWDN66o41yYqQF87bJGWuNb/k=;
        b=Sfq1C/phdEd5YfRgGys73guaoqsC1g8L8y2gUQTXg+gZ86vFTbSPFCIWpmzAcONlJv
         INsqRH+/+UZMHeTVDYQWS6ppFw+lb9c6FqdtT46tp4+Zwt8hQILxatAaih1jS900+/2N
         BvKT2UoMcGEJTdaoZaAV4r6UOKGkX5+F6Ew8FjpFClACCz+JKZ1fV83QArtVCsHxpQe8
         tWOWoozVE7mQknsTylE7fCYFlUFf9PlC5F5wKPHF3Z/2dQCE46P02yKcR/BrWSIOHPX+
         CSUUdFiyleFfrO/vVMg4oecbc6ocNxM5lejA0LKbvfyffihUt5S+WzbJqs4QANdV+75q
         229w==
X-Forwarded-Encrypted: i=1; AJvYcCVK6M4b5Z/rH8gFr64yO5c0eY5NuBfbZM3LAUPbz5kb5UFFpeUYGg5rvz8OFGBIfSOsP6gaJ+eaRa8pAzTGTWBH@lists.infradead.org
X-Gm-Message-State: AOJu0YznuAgzdhK9MxuPletbAkuU6rdSHhi6TmmvBw5Q68DJ0QP3APuD
	FEkAYsXeaqefI/0K9xWqjvJ3un879pXptMEjz898sgve8lNfhov4i0lFA84LxP+XohYG5NAmq9M
	+2OhaGkyf/Xs8s+uNGtb55dTgZw7GQC22cYurrh/O44x2mKJCNyioIBPN2fb/9neYgwGaAK+Ath
	HXCQ==
X-Gm-Gg: ASbGncsqwARaL+ZJ0YU5HmEdekJgOWZ+m3IDK8YvVbBu7jcdxQ7JZrZde5ResRmtgS+
	9+c+dMbDgqH4d731l8gYoAGhSC358JkK0e0n9APFSNxD78wWa1diG7BtV7vlEX9Rs2sRf7Nj8wE
	s4wtB/cE0ZHZaAADLIQVFXs2U9jq9hqeRJdFhKoQ07ACOlgvB9F+E8pTNuO01AMWXCgGjN3sDC0
	u3bQm26URw0si49bVH2lO5/Sn2/gFkDNCMCFkwnmqFINK+3ecoSUhDVCzASIf+cvM6UKHZ4c4ef
	YPY15WR6NWg9qW1b2AjHrASmTlOjw0BfYuUGu7EsqyXc2/RyWwOCqJLDzQm/EVSYXMb+AeOkknn
	p
X-Received: by 2002:a17:90b:1c88:b0:330:a454:c31a with SMTP id 98e67ed59e1d1-33b51386573mr36050552a91.32.1760503245579;
        Tue, 14 Oct 2025 21:40:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl45T5gEGBYaChkWOQqwIOqGUS/zz2WbvtwiMkJgYFYDoxb2M6+A0u7nW/BBPu6hBROJZsvA==
X-Received: by 2002:a17:90b:1c88:b0:330:a454:c31a with SMTP id 98e67ed59e1d1-33b51386573mr36050499a91.32.1760503245015;
        Tue, 14 Oct 2025 21:40:45 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:40:44 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:29 +0530
Subject: [PATCH v16 14/14] arm64: dts: qcom: qcs615-ride: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-14-b98aedaa23ee@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=1528;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=st897fJ7jTPYQ5eppZ6+OrlCOSPDdAnpzJ0eoXTLNbM=;
 b=gWz6wC5KS4Z9D59qmU8+oPQ+ydpoZURhG6YTecv1VL1HdeQY4r8X5AuEshLZFDnnQNu2P7OnP
 ETCaaC08bcmCbxRY4EyrQJoana5MwZKnS0RbAX/G9ftaPPfaG17phQc
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: li9Zu_XUcb9VYNngpNEveihQIY8_C1Iu
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68ef25ce cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pkXgoPqwvIc8jTsVjBcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX3kcnGb8olhhI
 oWfGXz8/5sbkHtWVrJ8G6Aay9zPCots242X2u6goOeWK5vHSK/jZzo+4UnjzY3sxTqS0xQmtKnw
 Jc04rDxIfEoeu0GwCfu7zXUP9H/AqxQgGcFnrU8oqCK3goBXl4174Pvpw8ABzMBIvOj7dGEdSCl
 giMkqcJ9fCNAoOShOkMJ10iBK25jPrrhBpUAsG98JdGBacGicTuMq7AwKYwC+p/oiP21bux5pGm
 8yoeDhrufNNW+eAKOskl+0qP4Nkj5UlbF/977syjAUF2NctbAjCpQzVO+TBKAeC524NnaLAm+1x
 xsgZDLGU+fpnMEDIaqFiMcuXxBod4Y4947VTIEYTjC0Lb1DgZdQLt2nw1dNt59myuZG102h3vnG
 QB7GvSyRNLNWaLe+SlRYO3CQ9M3jLA==
X-Proofpoint-ORIG-GUID: li9Zu_XUcb9VYNngpNEveihQIY8_C1Iu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_214048_019160_AF8658D0 
X-CRM114-Status: GOOD (  16.07  )
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

From: Song Xue <quic_songxue@quicinc.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcs615-ride as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sm6150.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 705ea71b07a10aea82b5789e8ab9f757683f678a..bfb504db43368fe73ff200476ff5220334872c8a 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -343,6 +343,13 @@ &pon_resin {
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
diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index 3d2a1cb02b628a5db7ca14bea784429be5a020f9..9df5e94069f604e5393350f5d8906097d6d01209 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -416,7 +416,7 @@ opp-128000000 {
 		};
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


