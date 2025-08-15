Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78050CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9UkRA4sDNiNVDXOCr5lj213AjA/7qAtrMJayniryuo=; b=Ni+47yFvnjWsMOv2U3gFxvYuxq
	qySwE9U+zK65L4GN/GCi4BvhJ/S5eH3YdndL/qjvZmxv1J20TQcO3MBFJib8uzb8jnoyh393LokNL
	PeMNiueV5HRCNQsrVnexbxJH+aNXm4VPHsUeZef61OMMklq05w2V9dR9drr5C2YBZKlJc8jxs9v6p
	GySCLDu9kr01kOz855Zhd1LWVwJ6WUu/az1NzE53hhyuN2XQW9ljgLDlTcYF0zrxN/e6dZFrZN7qL
	jfhW5xXHgG4ubyFbC4TYs292f4kjflhrhYMZus0LiZTCym3l8VCxIQB1SZWGXxNCev2SPuyBDl7aa
	EthhIzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxOm-00000002z6a-1yNC;
	Fri, 15 Aug 2025 16:35:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvYs-00000002jpp-3YCx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 14:37:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJ6YL008761
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9UkRA4sDNiNVDXOCr5lj213AjA/7qAtrMJayniryuo=; b=aa3g5NszGnvkQYXM
	XP1rBUB0Qqbto9SgBArkapt9Y/U4STlPLdmYuJjspx006Q4jIHO/tmyFA4/Ay0Hu
	YPMNwFCzTyiFm2kepSFeQrzdXVRjpuEqvyuBnowQfeQBilpi0m83TBS1tLJiLqGl
	vcSvydvI2CJ0HgPlEPhY24Y9AmZ2E9qb6h+DagkFy01ClOLRsCcEVriD4o6brSs6
	qHYKhpJMzZUPpiONRKpO5vCXo156o2QT5BKCCkLt7mjOKZ3gT7YhWMMhUZ+bb6Zb
	DcZf6VdfI8JZ6Wu7UvXtyOWPLdWh/Vb5/vBYK+GGPY71RD+uxr6lZ14g2Wc9mum+
	jzRyMw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6y6bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:37:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4716f9dad2so3090222a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 07:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268662; x=1755873462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9UkRA4sDNiNVDXOCr5lj213AjA/7qAtrMJayniryuo=;
        b=EPzdWSccFin3VuhnmlyOtUKu9zI2L4NtQRnlNRqQ8Zl9fgT6DCi5igyAIExX2gowI9
         us662zOz4Ya3cwEjPDR7na2O/WyJUkT50dARf61uCoEYohbbLvSd9fFouhtnfXXGW7dw
         bLa/GhuKbgMEUCPg3Ou0eRBVGhpQKgcJRGCeBPkBB5sU2X/Yt1nJm7Y8PYcVWbKUWUO4
         TCDbcvGImgyBsiTdoiEVAwoIa86iP3axk8riFOsu8KLX4gBKfHEyN5m8cYozAcQodZqS
         x1VOpZ534jL3BYAI7xozi04AlhXUuz2eGtEOFtS+wBNTmsD+bwPVhiRTTsrfIci7QYTP
         xsZg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ6YEMx201RATbsgfZDrBglpOYGDIuhelixo0u25cNKbw9j6nrvYVd0z5Ntu4fEJbQTeZBhAlMIQpU4b0pK8Uz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1balfaN92Tm0nxIE7XuT1LN9YC+oD3q984tFZx3KCTIcLTvOP
	V4nmN1bkBJIPhFTA3VVz2/0/qUohOAtSrNorASGIrQCy+xBpFrGCpLIzRHPFqa7L94qZ2H53JeG
	W4pVk+Ee3N4210LrKdqzvgds36yf9sH6lI4YtvOtS8+NmVqWTzLyDz6Hnl1EPBCB8nkUmOZNMF0
	YR3A==
X-Gm-Gg: ASbGncspFAQXMYNWRMLQ51kH92qUq7r/O+Rx90KuPmudFNb4/bn4Ij7Hz9moi72yQO5
	JWKTBLZx1sqhLK3rztztRqu4GZ2+CCvjsNuhzQm+OVT0hd6BS1xtaDiPiAB1rRM3qJ/d/dvJPTw
	bZOChhhKhI/PEIQ+LozKd0pVBUJgnfJaEJ6Lipve45pKs5v1Dl0QS6CL6UaaYUSqdO6B1+81dtt
	2z2jR52uHGl1nTS15Pj9N1a+3hKivgpN28OJA1bwh19M2mIj4xoE8zUMQBLKdP/7vGil2hpL33d
	BJBsp0q2Kc/PGolvMXoglcjigrn/JxI2L43a7ynyvmFKna0djsXFk5e6fCHFQwhyiiWkVoioPhW
	r
X-Received: by 2002:a05:6a20:12c8:b0:240:104c:8e14 with SMTP id adf61e73a8af0-240d2f2145emr4641308637.38.1755268661630;
        Fri, 15 Aug 2025 07:37:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEYKvm7YlLHtN5zoWFya9n6lHhS331aexLq0ePnq21K2fM39A6b4KRmUKen+GVL40Mqu92Hg==
X-Received: by 2002:a05:6a20:12c8:b0:240:104c:8e14 with SMTP id adf61e73a8af0-240d2f2145emr4641265637.38.1755268661201;
        Fri, 15 Aug 2025 07:37:41 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d73619fsm1437576a12.39.2025.08.15.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:37:40 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 20:05:14 +0530
Subject: [PATCH v14 09/10] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-arm-psci-system_reset2-vendor-reboots-v14-9-37d29f59ac9a@oss.qualcomm.com>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
In-Reply-To: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755268580; l=1185;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ux79/gmiZ2LdMiEPzsFxhfTKa+YcpSdHQfwMeKSsyq0=;
 b=W31B5yI47L4hb70bhxr6KolbTw/wP2Y7bRpdOBNeoS+yDhcadTJqAp0/QGVYybfT5t8rTSAjW
 ZIxT3KTCjkHA+dUGzT1lsBcJ1JaQEXxYPQFMBN5CETvMfxeM8c5RxeA
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX9yndQXgRt78W
 BCQLu8JkA16TXSM9T214feWHTN1AIxzwkFRaUMU2sJOEUj9nVcxfBmL8FiU6Sg5mj4AoWboBpK6
 KoGTFCjXvzmVmtOH2PY+m5V4gAhi1/X26Se8YFpggu6+huuIxKpl02qrt0Ir4sRp7GyuVxFjEYR
 aZCfxnXwtosnNeGi43bgrnEer/Qq7Ft11kYh0M46g2oJXF7ZvEJH6/ask9ckwimxdtApQlM0QkS
 qaIz1qk5FCPFLE3/Skgmmw04PaH5BcRawrrEsDfyIRaMizBOzf5KZYkgjbiS72QN4xzb5Zh1MSe
 f1tkZKtXkBvpcJ1csoCWR4VrD3NWoz5dSb68phSHFKy9dNQBEoo6o9gd/USgAxiVO2X4IHKzR0a
 UNinSYHD
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689f4636 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=0YKNsV3nudetVglqpTMA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: fvqecWz_DNdry6jBd7cYnjBx_qHIGh_p
X-Proofpoint-ORIG-GUID: fvqecWz_DNdry6jBd7cYnjBx_qHIGh_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_073742_894710_0DC6BDD6 
X-CRM114-Status: GOOD (  14.14  )
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
index 7509c27bd3f8f3e43877ded3b898205bdb66a847..621628311a3e36cea70697872b63282d1ba83e1d 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -966,6 +966,13 @@ &pon_resin {
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


