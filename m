Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE7DCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJQkYNJ2ptgfx/Tld3lEk18PrZsK416NnAJeaB5RM4o=; b=xSqDzSOCYyqorwAbMFPbcSscwA
	dpTtpL/C1sXEsrCMQQWKD1uQ4LIu593GslYTsthepnUFWHdUT8fMRWWA42jbRqHCltJ1Hegd06YhH
	auRL6/M6jQ3iGLv0Xe1svvC5pn7CdukGqQN9IAF1GbeI/rR3gx96vpzMqGADEM5ZVC5wl52cw9Mtk
	78PjPUrnjF3PkRWSV+7us7iNNX1IPYV+hS3le10QgJTWe/6wyD6mxjhtH81hGG24eg2bBfkpYzjx1
	du0eOl+5z8YikSznaVldi5UyGXOYgNEfK1pQ2kuYZ60AK/K2ltqD1BD5AQS5JrHuPTdyQInIxzBYG
	VNrtaR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tIy-00000000Rnh-2cLx;
	Wed, 15 Oct 2025 04:40:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tIv-00000000Rm9-2Pvj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:40:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s8gY004423
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJQkYNJ2ptgfx/Tld3lEk18PrZsK416NnAJeaB5RM4o=; b=msPOCJZxEE3uULcc
	MC+h/g08u9WGbFghGMnkBDqCEUVs7YqwOkQPLyeX/JOhMaQmAAmdMrnJbudQyrDf
	hat7XaOi5Q99fxRLeYhocHYd70hVqeyC2UOTpCVI+X1NYHE69htytLFg0/BNYgkn
	RgLcHWeFUckj2+MDusmTrcIpxkj7EvX8/psHeTh/8Wrg1uTUUwuZ+kPDDCq90jfX
	uH3u6/1Bf+QXk8K4iWtvZqlVnDbtsEV08qzAhuay9tuQVdPrS378lCT7yWgNy/bN
	PHOXTDP6hZ2BDIqHNOs+Phvbvu7qpY8ak/HPhrLIpT1XCI5V7i7HrIIPbe5C4d6k
	Zjg+Dw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1afbp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:40:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5529da7771so7816428a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 21:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503200; x=1761108000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJQkYNJ2ptgfx/Tld3lEk18PrZsK416NnAJeaB5RM4o=;
        b=h6BPvT8Q0HqD4ZT/8hmr884ibRJ+LiPACodvXabhwaBOjLBJ62Wo2YkfhmEe5NpEs4
         ZKgbqp1xVsxflYQjJ8M9E7fykjbBUaI2t7+2P2DBILXQdPgUWCQgJMJ3tUX91OA7IOGT
         awhpTJVtcHDEYrpBj7f4iLe5YAFR2UzvsLUU2rxjl3suK0ZPB31nZXBqUDxy07MrppXm
         jcF2XW1BmiHX+t4s7YuSWvdP1Q8VxiNNkNBmdIpRl6NftGl3EwwwMs3GrMU1HlwWOYjj
         o6n8BVNEn5nxc5UGmM2modkNzIjG9AfW6nat7XQI8Ydkyu+bqvIaqJSpmw/xOj80nsU5
         FeRg==
X-Forwarded-Encrypted: i=1; AJvYcCWYLTxPfwZ3FZNDYS5XgZzDIukFKPY2BMTe8Km7u9qY40qAMot6JUz+NhLSnDthePD1lTFwKmWOspBwvz9xVoG0@lists.infradead.org
X-Gm-Message-State: AOJu0YxczGR3VnJYMAhqx1Yz4sDJE/CnihDSbKOX3z8R0qCw5Rn/Og0j
	QKcfQFZLnrbtAZd6MjOxkFGIYud3xL18V61q5rOBtgns1RYvpFm2e00jPkFoBQA15jQ8h4q3DbU
	aOmBgHIu83f0RjElapT8FpjifgKTi41l0X3UFJ7rHZB0YyF0knAOAXSolLcHPjdEt9NdsOkxi0H
	6caQ==
X-Gm-Gg: ASbGncv0mJK6Mf3ApJyD9RDxkrIlNR5T9s68OGy1esuZIyae2/dAVol9qBLpRceGpfL
	aFSBTFh4lZXQ8mV3dyvLrS6l+ofBL98KkwUCCyBX96aeq3LuXdOgpfgNKIa+5xK4ON1ZmgyqJtH
	HhmG7HTyub4I37X76/CDe445LJMoRfkx97WXQ5bgC+GkwY+BZI01jPvIDL9XGgoyxCoNP55MtLb
	IU7acWBplc1cdhwHNCuuiQZlvPolMoqKH8QiiuOt2N3G5FyNOZELgX1EoLaTuIs79z0vOrsTbOv
	W0XqYbMavvPxL/YDqYSy/mpr/YePhZXlfVRVBZNEjHUAZj+EiHDX7RlIjcymwdGX3kU6fIUhJ/h
	O
X-Received: by 2002:a17:90b:33d1:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-33b51149957mr40663641a91.12.1760503200058;
        Tue, 14 Oct 2025 21:40:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzhSUdPcBNtpuWSbeLJvXggYqhWYI2i+smtNsSh5TePFlbEjw8lNbvl3tdNRydAZ2+8EAKWg==
X-Received: by 2002:a17:90b:33d1:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-33b51149957mr40663569a91.12.1760503199250;
        Tue, 14 Oct 2025 21:39:59 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:39:58 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:24 +0530
Subject: [PATCH v16 09/14] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-9-b98aedaa23ee@oss.qualcomm.com>
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
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=1185;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=fkRav5QA/W0o9Ycg3/xbut6S1Npfgr1jXzERBrOotDE=;
 b=skcrZstdabB94QPMmNvmUBmgXo2iDP/K2PrViGd7XleSuwoAEkPT9UvVVi5uAiw0VXmzxWXoP
 MuzJD13LH3EBKpAvsTX2o9knFlhccW9FSl09RtowPFeXjC+ycWwLPRj
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ef25a1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: FNta_hmjpG-lp5xo4yq-0qnqszfAerMn
X-Proofpoint-ORIG-GUID: FNta_hmjpG-lp5xo4yq-0qnqszfAerMn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXzSC5dZrdCL2u
 qxrDKlc+bcsfDNDYolTUkPy621ZHqgqFVrMDo0OBgU953LO0rLRVNtoH2261A74kCHx72sazgbW
 4DvUTWBXUWpnAJFCuSO12Bf0bBbbG2VhazFV2Jmih9H/AzSi+8nU6zH9+SPnIsGZC1wNbenuH9m
 N4J/Tm2Tn5xEafIzjHyHPBFPuZi4oyNJlnGlKYO/NFvtE6hES64juXdFmEL5uWsazb4lWdNM/DE
 tb5CKSk2/O1CbU2zEmjq/+SXhXQtGTqQOc5mC8OiShFPAyokMxbJRnWoKeDiD7fZe8UACowA0J0
 06FuH5McutiLiol/WGOOO3B5MF6Xmpg4tqdyFAUcEEkOBoesEwU9imMYQg35zlSXDzF8HivYQBe
 cCzXhC+lOOpvWGZLfa9a6iQO4UYuig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_214001_630119_EB6DF05B 
X-CRM114-Status: GOOD (  14.69  )
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
qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode. "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 18cea8812001421456dc85547c3c711e2c42182a..f38fa2e52a635100a7505c615c0e96f1111d0b5a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -975,6 +975,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
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


