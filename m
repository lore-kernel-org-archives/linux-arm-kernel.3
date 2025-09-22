Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B5ECAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xF282k7wXJ8WorsAqXbmD2TyrPkO+b2YocYCnInlnJU=; b=Y6uZDlI1jl/dE3QVeMaToB5gbK
	T1X2Bj8y8RXWKHh6UjWgQyOAFr0IyaV+PYAJfkmJj4XgBYtA6Ja2QjbSHiF7WyfYAypM/+uNaP57h
	oMxS+/BMBzbWoaawD/gHHSRbMGfKlgcBBalaPAH87WMRq4gsDeCe5SlPhhkmBcjLs+gGjbXRXx6pt
	5NAbD82mz/0gK5NwfhDpAdp9JFZAlUd4zv0i/F9A+XrYuG0oErCX+17cFOqvRHjx8DYxGJTT3mWL1
	NDWs1Av5XZ4LXbUPeEipfoTxIBK8zg/GWviUa+jHAaDuOfSeFhBZqmN4eqArnkBXK/7nc+R1QSJmN
	/4fa4e3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gob-0000000AYRm-1gQm;
	Mon, 22 Sep 2025 13:42:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0goY-0000000AYPo-3YIw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:42:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8w7mI009181
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF282k7wXJ8WorsAqXbmD2TyrPkO+b2YocYCnInlnJU=; b=ocyQqhIG0/1m1nDQ
	Hylchoree55eYm72IHN2c8uwGfh65nZrwX5yMJ4flc2+MTHgXWUr2odlZqg+9uPN
	Q/JVDml5KIcNoxnAWjV8US/WqeXW1JtDruNb+9HBB5PraW/R+5A0/IJOkA3xtxtj
	dQf8yjqYJwhoRdPttHHE/WdoCur9htpr46Pk0a+DtBVqPl3/ZzXx7vfahW0xP9tm
	3W23sTKkLBp4LS+dLpEz3bq0+JROFcYv2kpBy172i4qKRvAWyAjzUXQwUzHLGPnS
	1y5v6P3E4Eo+przOQ5OUh/fYnPk5B65Aqf6RSkWu2xvo1UTUjwnSiTNkhU76qcsY
	irfx+Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyen68k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:42:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-269af520712so47827735ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548565; x=1759153365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xF282k7wXJ8WorsAqXbmD2TyrPkO+b2YocYCnInlnJU=;
        b=luSM7pSM7LIxsDO2oY7da8tFSKf2VAyjFCWaVZbMupVMdta3RMnD5t/nTrtaW9BgGx
         xPipalSpbqHX4gOMPb15nFOKtZRDQGZ6IuYyA88Mlq+ZsSVLweVzhZkQqwBgd1wkY3IW
         UWqhK9anT1aZMTnxV7ZOxZoINyVvpsm0yGqyrAOEGMvAd3A76O3ptnCG/edWmM37cQL1
         WAnZvXz4Nbvqe6dRPpgZtrY+8aLMFsLOxPnFDsQndqpUDQ7h1yH1QlePX0oQ0yLIUbna
         3fuXUWuRjAt8MaJA8PBmSc2Wx41bd9KbDGeNqTxCTLTArEaklwrnXZg3MRO6B/B41bR7
         9HkA==
X-Forwarded-Encrypted: i=1; AJvYcCXIBvoZIG3g2JpGqYvlm5G713ikI5IZgiowe4Tyoxq9vvkqe3q8V3wrWr5FXp/LMEZvCzI8QZHAtbnOzATEakla@lists.infradead.org
X-Gm-Message-State: AOJu0YzJA0iuIkpiVA85NPaP9qPVDhNtMtCVaj9K/udvUZz9ZOYFW2A4
	9N0awQ9TxwO4zVifJA19/Ha7RIBHQN9xRhMAUX1YwkNELJy2/6pUvTBkbimw31zSc6+zI2zGCet
	h4Y2GciZngsegiCFMt5eVoVk8Ri7iUtGaFTco67DIirkpEfVGNPew+a0zt77bQtkx8d7VbHPWb0
	TRUw==
X-Gm-Gg: ASbGncu2RJLVyDx+0eZjE/zd5kOyGVDY/0vM+E2auUEiTd+/dWtKIGmktuuFZNtm1iT
	bb3pEp5myRWF5stz7dKb726gO5jIB/vnJ3BIaX++rtBKF+DdXp5iT8qNGAaNyUfjnJHRu+ZJWdJ
	VML6XdTmRM5Aihqnb6t/IX5EB9O0dCl7JZwGQCZxghNk2WrwIT+UdWYjiQd+E2ecutgVR5DcMDQ
	hMQPqwJ630ARHYABDTm6LuO6rK5FZy3dqPA4bF5uCjfnTMiZFj+pqwcvmp8XYA0UgDty4LTwM+Z
	MeNUV10CU+e5jmoJ2Tm9VcqvuRlkd7vqhDQuNBcWCDjjuXw2a4vA3k4nMgnVxVm4opFvKj1hiAj
	9
X-Received: by 2002:a17:903:3d8c:b0:24b:25f:5f81 with SMTP id d9443c01a7336-269ba439f8amr124646225ad.17.1758548565377;
        Mon, 22 Sep 2025 06:42:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4mN40qVZSWz0W9D0CtJAtXceZAK1xhkSEtmJIUXhTWTfJcTx6aXvqIGkYbWG9m156mJ0Avg==
X-Received: by 2002:a17:903:3d8c:b0:24b:25f:5f81 with SMTP id d9443c01a7336-269ba439f8amr124645855ad.17.1758548564829;
        Mon, 22 Sep 2025 06:42:44 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:42:44 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:23 +0530
Subject: [PATCH v15 13/14] arm64: dts: qcom: monaco-evk: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-13-7ce3a08878f1@oss.qualcomm.com>
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=989;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=G1BondNwxII71bYVJuYm74JpYy3/CGfYOQJXMu36Xxo=;
 b=LFc5Z6nf29wlIhd1CXRGQpvPgzUhQTtOP/larFAQIWR/CtquNgknXkMHf4pmi6tx/hW8PRMHX
 9bMGBVHYvneCjK/DFOFTeh3uB3CKgW8rGGV9kNEjFI+kuUQADQz7Q0w
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: soWm_bp3W7_shVeF8xUS8uti5RaRh2xE
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d15256 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JGo1Z14By4IpQyqbhUIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX3qny5vLy3wUf
 tEDxNz/PMzi79pkQw29ZvC2Ad+1TYr4jk6vKRvwM3cSU8mbtNyQSITkuaS1i6Qg72cZ+5G5iuN9
 Jrs74Y8S1leKe7rJHIXSLb92vkhquiMjliNjMF5i60ev64RRTfraoEKMVdF6j2P9oSBtEVwvXCy
 kVQiilVV5pQDF8i9L0Q4/UPjRpQSjvy6L7VCrtVUDntY0HrFffUOVB9kw3C7Y5q2bKnSm8iCd5O
 TodzSAGls8NzV0I2ZOxKiv7oSkStX0wbxVk7lK8CBUXKXr/WOotl8lMTxYcU3I79cun+gVDLgTK
 UXPpbnKnq/f0/WS2zAIRDNrKZKSYGEuy+IRqh8yD4eXsrrdCmMAYxHFxcHRikYhhw+khxFbonf+
 0lSJnI0a
X-Proofpoint-ORIG-GUID: soWm_bp3W7_shVeF8xUS8uti5RaRh2xE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_064246_900117_D1426DF6 
X-CRM114-Status: GOOD (  14.34  )
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
monaco-evk as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 116378d4ce7af4c4b37f5f818fd65c693bfa88db..fddaa8e3fc34fb26796375eda3a6eeb6dfd777ba 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -392,6 +392,13 @@ &iris {
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

-- 
2.34.1


