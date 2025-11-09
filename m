Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2464CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 14:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AukN+b68F1iRj8szvnom43KeenMjLq1Gdzm80qeFQxk=; b=axchWjnT8P0N6uw4pFgcB3K3YI
	TZYDvaNiB0dxyry/jiw1e6g8SXZpuIkscllMQVCSF+f5DBoaMzmKu9nYYwAgrFdixCCZaDOnrkwdC
	S9ZiZmmw975zJnHoQDnafDObTGM1GLPyUkMCB2qE/r9x9/atWpra6PF9y6d3A0QPrvL38cARQ0Gyw
	s64PTeUtmE0XTh5Xh0rsdIY57nzwfumAg4IIpPvwB2iVQm8ZWoRHWQmUGnEZS81aUFI6zbkn+QVim
	r/Jl+2NdzK/hzRSTRywq2XCaQiUsCkfYydTTABl2c+YaPFd+11bJy3fyCx7Ad8XOiMBWwK+IycFNQ
	2gAk57Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6Zu-000000045aB-0uLJ;
	Sun, 09 Nov 2025 14:39:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6Zp-000000045WX-1aMK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 14:39:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A97YnK14004828
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Nov 2025 14:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AukN+b68F1iRj8szvnom43KeenMjLq1Gdzm80qeFQxk=; b=VgiUOEvVyDsP0oiU
	6O6pBDoPcx6kQ/cDcQH5U4M5hCfoGn/3vBSxJGIIidIdGAuoomIaeCnJMoGBPhNc
	NIrZmhFwcW0JtpWHxQ44+Go/aCrrpxLbEJIFy22SRlqxllY9/cAGmuycF8KSYWMD
	1s8aL3nlivCdOcg227EsfW52qrCfsMHuHa5b6ZbZSfUpurDl7opwxemavruSykVb
	X40FH6Ov+Rg6c3/XWu47aU1VBpv3Ic/9ra6oVRyQNnXTVqxFRUR1QmXW6gzmbkfP
	yeSmvtl+uXIvhYii/2gu5Q+LD0GkC3au7aJCUrvM3BFQxvSN3Vr4TxhYCl0XcHmq
	TRz2wA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xw6j82n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:39:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso2482537a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 06:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699172; x=1763303972; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AukN+b68F1iRj8szvnom43KeenMjLq1Gdzm80qeFQxk=;
        b=JApAT5ZUHpZ4gDXzYjYDnCecifq6Xj/mr2JFOZn4pVPQap1WR+s+E6oH450A71FQ45
         w54SvjkTIXeU99ZXUcUioqj8Oo8335dwBT96jAbJN1/26sDtcvWjcbICEGFru5EJQL3C
         +Bjzyu491DvbyQWcJBBhgoi2NJMAa+xuikgTlp3AK+TtSc75T0bwBJD4rkA/JmN+tPSC
         SedRMqkFN+CT9EFqZDxRfag0XAgwv4rX5eEtWUkxRBe1iT7rjxco6ouGF99Lxk3l2JMV
         3/bUNTlXzW/pErylefe8u6qHdwFJg/zWHNF/wid89wEb+a8IXR3yTEAgwTrJChK+KJhP
         IyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699172; x=1763303972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AukN+b68F1iRj8szvnom43KeenMjLq1Gdzm80qeFQxk=;
        b=xHn8NdfOYc6i/UhJM6MW81RpajPJxLZiq1cCn3v49mpCWTL/pKGURF/+JtGt2yggZh
         90Uj19lcUO2JAeTmn95bvxD0c1ZCYnX33Y2JEWqb+nLzYkVnt3hOkwuqKCcsi7IsDZ6m
         GeA22tUvemn369+IDq8esbixQd5I59shn4lReB30KTNmIQKvLeB7N4/W76O4N8/6Caid
         Bc9cVW/TPbNO9eR3DEgbPS0DuzpwS0LOY3AtY2DzGOBX8uUX+3w6RMeNmbyP1FYOlSuZ
         M6IUFXoFV3zBRDzUAutFqfwVmYnbSXpVA2crNotrNznm9DPqHAYVNDWaITCbXYL+8heS
         esYg==
X-Forwarded-Encrypted: i=1; AJvYcCVPromm2oEtMM6F99q/cIjrD6rBjNVptv8JW/d6Qhd5itzjlr3LhTtkqu9Wk5hx9rRCNs4vNBQu84QvPBtHUslQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyrDdlFAqfdHmXTB6GjGpicgyD1NnnmYpuntYmaB6MUFNRz2e8x
	vIgQiP/oncivzRp0tZLEvCptMT5klBCNZS/+5OvJaq5pn6xkvxy4M0ZMNxsGaW8ZjNy3ww1Kj77
	9DZkZqDxw8d7a124QESkPH2e2a88BoNmox4qMZCMNno3Ls6tEUp94pD+XJ63C3sTba+Lj8tLH82
	MRhw==
X-Gm-Gg: ASbGnctvYdTByOeNLXoj+ug419aYQbk592is+pdbL/GiULMLQz5y7PPB58We2leegV3
	FwUyX8+8LVc+dkDKgOFNAODX/FP3RhzR8zl/uX3SBm+62n0gQjv2WUI6sCG8ASm4Jl7fzFiJwL1
	n+4R6KwA9qBm8ejA0sBTf0DUw1ND20O/BDUz3tzTtpWTj7aCcg5mIku45LkyjYwNd2q+P4AKLy4
	Tz0Vz6YSABZLFe6AlDGsIawDsAp9v6fsGFSQovzbKFe4ifBVmPpgDyCjiE/Ts8pWr2iFvIyjlNV
	p8esAAP3eM20SxLQjIbb01Ua9vB502vCT3q4TkrMJ6r5r9VCfmLwHi6waukfMrmVgNg3Hr6LPCM
	pjVU1HWYUFLkmyLlza/SiQt0R4u+kOktbjQw=
X-Received: by 2002:a17:90b:2d48:b0:33b:cbb2:31ed with SMTP id 98e67ed59e1d1-3436ca9af80mr7084193a91.0.1762699172285;
        Sun, 09 Nov 2025 06:39:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKmUKmAO/5YNNJQCK9WyTgSA7HEo4zvTBWQQYM60M955N7ymLGX8tiEKVtC08gIxpgP+mmzw==
X-Received: by 2002:a17:90b:2d48:b0:33b:cbb2:31ed with SMTP id 98e67ed59e1d1-3436ca9af80mr7084148a91.0.1762699171725;
        Sun, 09 Nov 2025 06:39:31 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:39:31 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:23 +0530
Subject: [PATCH v17 10/12] arm64: dts: qcom: lemans: Add PSCI SYSTEM_RESET2
 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-10-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
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
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=1108;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=c0sDk7nE0BsMGILV6gAFYqW71r5wB3+58FpK7/a/qxY=;
 b=Mz+dwUU5jjgSzD6eifvT7KiJQzAbIaiZ/S841YqDDe6M8lFmUBSh7CQIbRvQr1GkfZsQfHygp
 2lejprqAIqqDTRobgFBQ8CGm51ZyS/hsWggwRnLthv1chZL9MjYDNJJ
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfX+XbXaW9lEtxv
 Lj3G7dolFvDMYTCOIvKUYXx9PSxSb4R/PRKm8v2mNkb0y+SpD1OPIiVVCn9E+N+/AdxJqla5az3
 xycWLOxWzOSe/SDbP3DWvMEPA6o7nIq/65yGMQ0BKxTk8/42X/Ds+cy6pVHFPOUhT0GsPGBqEM/
 6ywDNN4wGknsj4+aaCNO4bEfMs1R3syysiqziwOtvYWoi4ZaiP1TTIm7Ps703+OIDfeN7nDteu1
 IHsUCyOnrzvp5fo+cGb9bxWTwGA1ZTb6ngJaerqxgJLqhgTaSbR3Rw+3XisV3cDqTYoDbQUYepA
 FcmazFXsH1UpQ641PCAOa0Wc/UXDAzNB9BO1WiLzyUGLUz+MT+DxUkPj7LIfWpe3W/wm9q+msoK
 CEEIzRZu33Hw2zLdFay6Bz4bXXVPug==
X-Proofpoint-ORIG-GUID: C7Q88t9IZ17549tROwxLhR5znS6DsmZt
X-Authority-Analysis: v=2.4 cv=cpmWUl4i c=1 sm=1 tr=0 ts=6910a7a4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ld_RF3OM1xByVwKNVVYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: C7Q88t9IZ17549tROwxLhR5znS6DsmZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_063935_029621_234A03FC 
X-CRM114-Status: GOOD (  14.26  )
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

Add support for SYSTEM_RESET2 vendor-specific resets
as reboot-modes in the psci node.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24e69a9d900f06bbb22baa2781cc3f..8b594a6535199b38ab6ca432673c4a9432c0df39 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -698,6 +698,11 @@ system_pd: power-domain-system {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&cluster_sleep_apss_rsc_pc>;
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x10001 0x2>;
+			mode-edl = <0 0x1>;
+		};
 	};
 
 	reserved-memory {

-- 
2.34.1


