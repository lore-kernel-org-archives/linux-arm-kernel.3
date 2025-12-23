Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CD3E6F085
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yj3uTrVzY91o9UvaViQBsZAb2B7yFqWeP8MulTCY84=; b=e5SKfCNWqirH8kmfIi77EZa0o3
	TLtuKY4LGokFJX0bHOTmH4FCp2VpBOv5ijIcKIG2r/inFy7t2Tq8nz6XGVqCVUHyA/bQSRHQC80pC
	jeSDbuK0HMhCltQbMtKyYCETudvrNmvE+LGrZo1r+1+A81hgKGOgRh8Z5yBzBlIfDoXPIW2rVeLFk
	z9MU/BLpxZRs6XUgNVinN4YVQnonRec5D+w825utCFN+dA7kaa5WIQsSVu/eUmy/FziKU/TUnrc9a
	eIzRSzN4DYaF/w0hdYKndQRBa7L2Sh+E9rxAir3aEf1exi3yjcpI4qwgetjh0GxQzGlmTqeoMTM+R
	SMErYQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5sM-0000000Fneo-3fEV;
	Tue, 23 Dec 2025 17:08:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5sK-0000000Fnd1-1kAN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 17:08:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFr8Hf4134161
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yj3uTrVzY91o9UvaViQBsZAb2B7yFqWeP8MulTCY84=; b=HRQ94JdC/hefFDBW
	iPfjuxwzKQK4WWDPHUStzcw0jG0SS/3p6dePwPKdrnLb7uevq/bTf4RE4a7V4o7l
	15FgRsJj9+oL7ntE8LJAm1Dh5VQXY5cqqeAwuHvo9YDPBZMdSvOAmrdkFzuE1+Jn
	YS4xgic1/ZLEjQ03grjHb3t1rVL18wSFv2KnW+RSZAV3Wv4z8kbfQ8pCpWwOWYn+
	i0QoZXVfXP/cK6hAoRh8j0GOhFYrn/jFTWUOgVbFNfkNV/VXyyIHBPsc5RVeBazN
	WpjRF8KN3P6TVgppW32Hp4dyZc5aRoBYAItphLf8HQWJYJoGjJ9T5PR8pZHztIJX
	JMmZSQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46r8c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f13989cd3so157827245ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509723; x=1767114523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yj3uTrVzY91o9UvaViQBsZAb2B7yFqWeP8MulTCY84=;
        b=eXwBckvonMz7tvz7iDl+g6ygwR8vGQEhNnCXWL/qS6UpJ4DA000pErZbWU8gWd/n/r
         rr5YyFB5N2d7PgcSV4/mrgJKN9x9ErPDRT+P/uG6Mk5DbAgqm6pEjI8O03s5sgn8DlIA
         cYx8qUb2SnS/MaVaOO+a9pCdr9HYnHqTv/rIai3IR4pzUeuaiaiaVBsIMYDsiYb/pffL
         kCn0NQzbr6Z/dHfzNeoxql1M1ZpzQ0yNgnHcStjai7wJjRABg/2NI3lIYqP1Ka8eB5ZR
         B18QwL+cbqxu15EiuR5w7aufOe17E34yzVBdhnHH0ro9p11qCCaFpen6yBdFt4zoweyG
         W1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509723; x=1767114523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4yj3uTrVzY91o9UvaViQBsZAb2B7yFqWeP8MulTCY84=;
        b=qzWr+Dsy56VOQ3A/vE/kvX0janyoNsJaYrJ7X18iVWPyBdru/J0vp7vKLbEH7rkZa0
         psugI6WaTJmJDefna0XU1NzmQ4vfjTdTi2aMyAa7uqyxSocM1tsaZmKXo4UX9eRnp2Ha
         6UGokN1nhKQHZ7z/dr2cHo3F1Y8843agWfXBwOBjyvAmC0NkG0v2EZgqIgCWZf8u6iv/
         LBFDBmCCbUDju/L8anYMmEXJ2QNtyGuKoloKzHKX67igAdORRZHuT6SmC7pRnz6T3uxe
         6KZcaKuQLpH/O+0RaN8tNBb2oCBvfbabOt9BUxy056Hu2Xi2IyuHCs/iWsj0unRnQ4VQ
         hqMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAITXEUifP69xryy8Ym7glFYQzQELJqqFf8JyhT2tm1Oqfv075wamSLsy+/zvIAq2teFg8+g/9bHDMG5rM0e4x@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0V3fauDPrIrAirB3DaM0Y/W/AYDoLYMJZ3UCd2gGJuNardShp
	Nb0VDv5+aW35LHqMn7opquxMSMZUO9EGrMU4WjEkUsmCQ56e/B+GwaSY/54ApvI/CzR9+pitdZW
	5/xQwov1dWAVYwCMuSkYGQi4rv9iP/jHTXByh5VZeZQkRk3UjroLMKdWMUHByBjhxGzjGAM8Rpi
	t9kw==
X-Gm-Gg: AY/fxX5rtkChijXHOY2uWQjB6l5KB0/IxZE0Pe8KW4qIgcjllUDohry0lVUT1iVGbKG
	2VcmvS+XT6pZjdHZjP6XvLVJENFTE4pwjX4t24nTmo1LM9ArEbx3AjIrtK7FDUk/U9sK1U99GtQ
	M8HtZOQRbWb3TvOMMKphVd51eWsOybUHI2KD2QLS7gskNwEMcQ7sriseBdn2IfvsOlaOSVbFUx+
	+twfZKihJbAHhcx7OPP5w4rIXcZ2ej4lhssvKp0QoGuklA9UiGOhusl4R6g99GnaqsSOFtgBduX
	QoEjG7/R4f/T37wOej6NqoEC7kOW74sB6rxg0K6C0WVw296IBYZROh1C41Myrbd/QVr94T4L9Lh
	/V+03pC4V3eQuGrrt0xrZO7/TVa6xu+XiuMx0WN/NBzBu/A==
X-Received: by 2002:a17:903:40cb:b0:295:9e4e:4092 with SMTP id d9443c01a7336-2a2f2a41a37mr134505405ad.56.1766509723262;
        Tue, 23 Dec 2025 09:08:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ1Fj4uQ2liIo6VAlU6QcFtiDsvDxHyH17s8W+Y7L2nFddhJNPJyS/P7f69uV1PpHS/k1faQ==
X-Received: by 2002:a17:903:40cb:b0:295:9e4e:4092 with SMTP id d9443c01a7336-2a2f2a41a37mr134505105ad.56.1766509722777;
        Tue, 23 Dec 2025 09:08:42 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:42 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:39 +0530
Subject: [PATCH v18 08/10] arm64: dts: qcom: lemans: Add psci reboot-modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-8-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=1079;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=zyaMjYOjFDa2SPj03vZF0IuCzZxO/R2dcgFXOkM351U=;
 b=Fc6RcorlMm2rMSuJrm8pkanAycaULDpxTiofIummpRV1QoobrxYOeY1At7M9D+rjT5F7WnjZ3
 v2UfekVvNiMCKud9qP77Krs9vT9ns3zLwBMv4XgHL8PEmD1/jZ2sRZ6
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: 2e8gzjoLUjBwkK9BNVIELBJhQH0q_J-C
X-Proofpoint-GUID: 2e8gzjoLUjBwkK9BNVIELBJhQH0q_J-C
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694acc9b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ld_RF3OM1xByVwKNVVYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX3qwmhw8aWR/b
 bbtE+e9SZNy+IDCFKeIy1HYJJTwGn4bE+edsw8X2fOw6mwpBJzB4iqEfF09wAMYJO6jDcCHtWWl
 WexfV8bvoNXW2yZ4zDtJbzt8Og2KjJ0VyuP3F5FG8eIMwbiEvosrb+NFHPZ0yCJc5Wrm8D3WjsW
 BRoM1GX/So3ewfJjfAKex3myg82tTWVe644TQEDpy5bGdwrSA2p6S8AGm+XQ/kttwBOnOYZBvF5
 xKqGORCLBfNtsS+w/ebW6iVZ4TmHdwqFP24SuucYxhzOLmvthI4dIT0kOdJFHtK7cNh0DpyPHLP
 83aHICBRcjxMaNO6MJAlarIZw5vU5k/K0DYB2J/T4QmMXnP55tkjkldAVKwHJa7jfUlj8km3SIj
 95C/nmASDwCFwHQ+gI0WUyfpiBs2jkNac1Hffrf39Y4phFNxg+JtbTNAqfE322Md1bK7lSvGxL5
 xrBcpzJ22SbBwvUYGoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_090844_489865_0F367076 
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
index 0b154d57ba24e69a9d900f06bbb22baa2781cc3f..cc70316d6949c8a36280b85931c4adec9cd60f62 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -698,6 +698,11 @@ system_pd: power-domain-system {
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


