Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883D5C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 16:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zO1m4Mu1s9USWMxZJk5OY8bYzy46q5JS7Is6cMJU9ok=; b=oQK8nEnZqpFQSdDCE8Jrmga59Q
	qnaaq503UQpWcQ9usHIlJBCFN1Gzbo7bMFz/m6TVhn9Guq8+jjT7N+FRb6tt1k4fdInYY9rRaGbjo
	73RdACGZRulNchRZWKvMFXV4QxesvzxNJvUDKOX7JpWgd4g7ok3fv1Iw2sSNAdWYSmtSWhAiqyhbJ
	+Yk+zu6KDSsRs3NM0Wa4s4ovfXsAiU6oy9uXegqj3wSZbXPKqOSfj7zBw4wFWKB6X/oPvM5QCH0rK
	ExWm9yxGVZDDcjvK35yhhYGXT+nec4dXstduh5GfLRMIRRMf+LqCK/qkNzGCarJHgEpNAQU3UhLXT
	jQKo/lLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4fS-0000000Cy1T-0V19;
	Sun, 27 Jul 2025 16:56:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4Cc-0000000CvPx-0iRA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 16:26:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RAd3bH024908
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zO1m4Mu1s9USWMxZJk5OY8bYzy46q5JS7Is6cMJU9ok=; b=fUDksuNJD70l19bX
	6Bp4yt/V7G/bjPloVzd/OlS5eM0+YroiuqBGLwcrg9agTSJo5+F8RCQRj3CQb0Id
	iNaUwmG4q2Fbqkip3En/1HtzhZB9lV3f1P4Ia5tfnxiAlhk+VggNydXAt3i2gzOJ
	57zsbO569dh5mSwQ6bueeXl8U7s21JVaJmdfzHk3ipB7Ag9VB5YwbDmgSadrhUMD
	Sf+iTjmOctGTI5ilmWL9G8zC6taZRvRzMG87y5fsBUIRBS8Nnus47cysgZvjFKvg
	nkkn8saCL7hHEwffzjmuR3rApsCutOEIrpvXWfMcvxjHPNct+FcwhrTrwBhj7kKM
	IP3nbQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbktb9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:26:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23824a9bc29so61276665ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 09:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633580; x=1754238380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zO1m4Mu1s9USWMxZJk5OY8bYzy46q5JS7Is6cMJU9ok=;
        b=XvPwThDokp0I43Hvr1tDvmv24smzF8qyn2Kmj7pC7jHXM0QagisLnRubq1hXEAQLx1
         c6OOXTixk8DaNgyv7Pt7W3UHxSFLjRGx4JEcLGCjbNoAABwKQMmA/jomQ3qdnXC3iVLm
         0VeSJfvSVm0qf+ruRh9/Ra8G/k0aIfdSU0L5kfZPSYggCPF1u/QE32xF5Gm3PrAmly7I
         BaeOkwGk+WsoRjBRkzb3dFxp1SIeZXuvd3+xzk+5WWRKiboWVmSYk2N+hS/id9mAZDKY
         BKrH1MygW/x/AYm7iVsSZXp28CnSAiTEGJDLZpSBfqo9XotgYOBmYmE0Ij6qGpKZdbGm
         vN8w==
X-Forwarded-Encrypted: i=1; AJvYcCX3BPVsBLljTRqeRy67L9tZX2AtEI9jZxZMt0vORAOnuLd5jjDNlE+2eMY8f+pJ87tRl2G1l0vTS68lcN3XLOXD@lists.infradead.org
X-Gm-Message-State: AOJu0YyzlSyyPW+LmY/vzNRPcyPwZCzfjvXqobiN9ZJ0nSLLuKQ7bpic
	GaH8OrE84X07N0QWvCGK4jk7dOZdzxYqNPmq2G9b5vkPIGayB6DA91DfzvfMP/HxMdQrxZCVUT5
	vMsyiW1IMvBdMJcacH4bHrgkSKyLZtgQzJHC2zjh36HN8IKrnRX3ZYqot7wkSXBa0V7lxNnafPb
	PUdw==
X-Gm-Gg: ASbGnctD0+Q2tPw8X9XfJt9XZxxxKRxsSlzqT1dn8m1WLUdQlB2tgUch08pHkwiScX4
	nsL2g4GpL2k3e8WCh6/dEH+xlDDtq+6bLcTFTxHiG9R067DGDgQEti2GXZCG2aCQdG0Q/TO4sIa
	WJ86dKzXbl0BPPTafJ4HKewJpHjtaktx4uR6T5eVdJE3uHsUHjp5h2k07sKZAmmmRv0fJZO+RyD
	jhs5CP2mi+/QGsMb1yJsaSPB/AlFJj7jIjwalVxwt8xQqSeiqGTXt1UYqtyyCNKZB0fwD5tIUDJ
	+ZWuxNpMlM6ccYVzuhgvxSNiEey7AYwAnU5ehlUmIVc+U8YHS/bLuAIszCRD1p2ENcykMQYhlGx
	+
X-Received: by 2002:a17:902:e807:b0:235:1b91:9079 with SMTP id d9443c01a7336-23fb31795bfmr154382865ad.32.1753633579819;
        Sun, 27 Jul 2025 09:26:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwc00XkR+di84taiD/OffOGEpCSV4NomuISb8nymc7JO+HaEUAMVPaylTxckUGH7O8K1y1Vw==
X-Received: by 2002:a17:902:e807:b0:235:1b91:9079 with SMTP id d9443c01a7336-23fb31795bfmr154382295ad.32.1753633579320;
        Sun, 27 Jul 2025 09:26:19 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:26:19 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:53 +0530
Subject: [PATCH v13 10/10] arm64: dts: qcom: sa8775p-ride: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-10-6b8d23315898@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=1668;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=nykICX8hQVOI73Pb+LH6QfNsfIbx6Lek13GmZ+0SmB4=;
 b=qv8WQ4rhMzRIfBTQPcknLWKzfFESP1pOGTqD92zp0OFhxDqrgJbvV6E1LADfVHcHGcJQzUbqr
 o9Pw1v/PWgrBJiJ8iJ/4KEdXWIzCIiK4N7VGCBXkE8I4eFNERL87qYr
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6886532d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NiBTYWx0ZWRfXzi11CZwKAXHR
 KtC7nP97i/HytrM0Q4tvjS86gs9YZfYrcSFtAM7W80bEWzqMAAtDKWGpK2qIBjTuzQVKR+Q420y
 zbV+qpSMSqAoFFK9y19vdLF3zR2SNdT/IsUW4yKZ0n68wYNZShyiES43m/CLre8FqOlJWGsA3Bl
 XBfxeJelQf3x6+J0BstoB3YHzX+GtYDGM4xmBYZAllSjgJCnHrXmOqqUso9ULu3xYsAFRPx2Nuy
 Yx04nVi/CwtlFWJOy0sQGQdrfq+8pP3867vIkNXaPtwJxv7m9XIliKdXXJ4h+AUr0dJAylGtVAQ
 LPoFG4xgXK1AesL5RWYybLXyQZM+eBm7YqUpqChWIwxjmGT5O+ASra18DiU3Es0ktPb3CfU2T0j
 oJ6TcadjO6g91MDgwZK98yxE6u6928xqrs+U5goLwxyk8N1cXx1FAK1a+9/wZKuRdYEseOiq
X-Proofpoint-ORIG-GUID: nQo5xwYKyv8lwvtixCj-7wzQXO95SLOl
X-Proofpoint-GUID: nQo5xwYKyv8lwvtixCj-7wzQXO95SLOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_092622_336308_BD027CF5 
X-CRM114-Status: GOOD (  15.78  )
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
sa8775p-ride as reboot-modes.  Describe the reset types:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 63b3031cfcc15fe2cce58c0fb7502b19f058b80c..b1bbd3270afc65e9e036e8098ae7cec3d3363a32 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -874,6 +874,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9997a29901f57d7894dc1eacb6a809caa427c6c4..52466607035e663f4dc6e5c97223d5c0404650e2 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -622,7 +622,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


