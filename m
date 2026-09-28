Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1995C98328
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=; b=0Fa/cgHgC37YFKZ6rTLGRpoqrT
	RZ6O/iGGGiqEdAzRndZDny5pC+ek0I84nnjuqbc9siZZrVGZb51fRnF3VhyaH0BTFu5jaKYn0J8Hd
	4e2gTHF2hHo6gtegGqAaRnS9lQDDl5CmI9F3jKD+7Cexi5fHz3gXiRWV2sBhaJA05LghTn4sQKyaI
	xSqg/b8KpVTOIg+EWWoUXdmZ/sV7DhHbhKHXcyTibfYuMd+82FBr/k7tcckOKWFg1VYI4E7g9Wkcf
	mMa2OOB0w3SB5+zoKPdYKdgGjRTcraqGFqRy4HNm2/bVTiN0S/GlmocpGwTz9MDfAyp4lhq/qxnNQ
	4SzAkpcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4Zt-0000000HQSs-14ys;
	Mon, 28 Sep 2026 06:11:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4Zn-0000000HQPh-3iwq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:11:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S596I81500998
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=; b=hhYBREwloagq9SSi
	ckrfC4WjX+v88luweFvE//fkslVqCmhozicPepDxX3uxgLS5hRwHs6UtHpctnvai
	k4qy7E8wIxdPQ5SkTmwbWOcc4DknKhlO5PwfPItlaRwKWhA6LfPaIB7V4Btrv4ef
	EWe4EHcz3WSTOS1saqIKuMAu1Cq6cW+7u/GSmVdh5H9UtN830Ju8tWGD1g5cUals
	UyU4HnCTo2+/iwGTzC2dLVtr8UVMOYBOTbzBXpAIAYWRauFaxnCZi/LGGL1tGvo5
	ywyxI/mH1hkyBtwhUrHscjtccan8015nn940O5kh+DkKF3zpW0wTRpCiMbkfHOf9
	pQrRvQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubg5wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:10:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so2928118a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 23:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575859; x=1791180659; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=;
        b=PjppCSrY2Zn9JPCpJ7y02iguLZi5chRgnJ1Eu5m1PhkJ3x1JFPzYh3IZNXaTokmP8f
         W4/i6Ws45jd5iCLuFpPLmcUAZVRQ86sxtu8+KpsnL1xDTOgtHknwSTXmtyG5auaregpH
         alqCZXjRCPe2nTJ2KEa3dPbi2Y7pLbQ7HvYa2D3A6KP92ymW9qHiGXP7BGufkDHbmnvY
         NfJk7Mjw7dutFO+LLurdzu6pVywT5ZX+2NfFS59FYndJTRogmLkoNqzNkEO1UcKVszB2
         kan4IIxsdpOTQ4tBYENJ0pJ6EOkzGLIoa8xy+gmHvnsctQSzEJmjVWqPR2WrbQdP4JbU
         /e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575859; x=1791180659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=;
        b=anrXhCUkbMAsv4ZNAWQsQrCfGKBWVuIokT2SdWz0VwtnozIyXZjX/461cmkBQyTHB9
         v45KHZdNsUuQtjR5M0YDpSkrS+EJ99LQgal/B1ECqVYocAcGaQzoqG19SBqvcirldv1W
         cJ2IqnnYl/c+KnlfLBv2stphXy0sBTu6TOESRjhkvE6C5w2+UhKvhJ+CB6oeeIKwX2mj
         bbonsiOLF+dsWvmcXokg3dnIxRtZFNUmXnkarrNE+26df5Td6pCRVW2zaPgEFe9+A53A
         Lb6Vn0LBaK71XokzS8Hs6yP0NRW6tlhSc7RvI9sbT59SQgyeDmRrySZGFw+W8+gnT4QG
         Nlww==
X-Forwarded-Encrypted: i=1; AKwUvBz28eSeHW5RZ7GjaJXV53O/kXWAyMOe7mj/JTx9kmbCuNar0DKI+Y6/5MGAyx49xYEc0cCH0tTfCkNIIgbWwrBB@lists.infradead.org
X-Gm-Message-State: AFq9FYJsbUwLQdmPkx4978h1XDwwk7WJ4rvtaGIMzIK1BPElwEGfA7iM
	BY1xe/Oez4+DYSP4mx+cJ2Ue1E9Deegu+ogpteaZYWFKjHXu1+wOWkq2xSXIiLoFGYd774L0Dca
	lHxUvXuI67n39pLIcP9G2njNInUxWCZ8GpLuvZhoWTywjtBmwNRAa1d7Kx0x8AgJ+LEzkb6vsng
	VOZw==
X-Gm-Gg: AYBFou1DpsrxnovW/mqfTBgIGnWtY3c4Y7ixl0FFnRMK3SJq0alI965Hw39jSfdOLM0
	PrE+btsD1+dAow/v8yxOrVYhZZAzhRBK0/4FSxVvxH35U3ITR60ZmYZSwgPqX9DKWYnRaPFqtvk
	ZmjAbtjrk4pnV4web83VWut7+I+eA5MrLqxZ/C3BL7IANk2V3p607t1AJPbqpQBS1QsV2e6E/mr
	hCaX+bQkrRldSo3Cybrnw+iUw0R2WJ2KnpWLJqF5Eq0fuSvOS57HUrDBniJuOeXRKMGqbgv7L8M
	poivoo/OIus8DFhqG9h3AV3cLufQqgKWI6Gp4rhiaTzUHQLV7NdhCnKkaji8XJob8T5XHNtD7RH
	cs5v37KNwFlbwEp7r4CxAHXPfrxDBke67wxKC
X-Received: by 2002:a17:90b:35d0:b0:3a0:df61:3fe8 with SMTP id 98e67ed59e1d1-3a0df614b3emr3891119a91.13.1790575858163;
        Sun, 27 Sep 2026 23:10:58 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:3a0:df61:3fe8 with SMTP id 98e67ed59e1d1-3a0df614b3emr3891061a91.13.1790575856656;
        Sun, 27 Sep 2026 23:10:56 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm20040846a91.1.2026.09.27.23.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:10:56 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:39:20 +0530
Subject: [PATCH v26 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-arm-psci-system_reset2-vendor-reboots-v26-8-b24e2348e8e1@oss.qualcomm.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790575761; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=HY9fLa8u8u31BscwdrGeQccVQPGFQUgGa2K581SXsxg=;
 b=ISNKMf7RMjaU+bv5/aCDnX25z901Q9bqAKTDSWTlUTv61Ly921JCiACTAvjmSsgsSC7vVVaDn
 KfWEYUs+lA1AOkcX2OWs5xupnWc1Au1ilF9NORSNXjlWEltiZFYEAKp
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-GUID: 80nqQSYj0Qw9dKsOk0mjytz2Elivi0X_
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba04f3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 80nqQSYj0Qw9dKsOk0mjytz2Elivi0X_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX6EeEcUeXhi22
 GOVxCbyaEJubXHu1O505mUaprs+YIoySGsYi0FQIi5KnJklpCWi5SxrEgXrzEP7XvzjaALN4pte
 B1SdVuvyAstq9QBEyrJFCy5o9RaTppe0JHbvewUYz+tNuyk9UQKKnfVWbufygW9Qe9xGDU42kNf
 Z+OCCJVI08RPnDRtC+6JiUlwgT5S1tYv6kYnxuNcpofkssISsSAUc3N9G74D4DLzoegAd5rkQYR
 jjBOvDTXJm0qBJ20NxQGd/5v3TVftnsBb/UjAxmYCvK44cjiN1gXjPbX9geQVDYTUkYQWmTXBA2
 7Kva3XmbXSR0gKIj+LkAmO8740fUFml0ph2lMFgD1I76LokxRUse1UAVaMGURbnMg/R47sk21uT
 b4EBZiIsvHDTLhJcYCEZpnGU6ZO2PZsd6sDJ5tlEzDto1qyOOioGG7ARmNYRzjlXuM+4ZhidgxD
 KhS0ZO3HIrTIjpHIyfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX79h105MU4z4+
 sCztD1kTMkD3fGxRVXV/XfLjMTkJl6iaCELKB5/Kf0qO+QijSAMcgj/0HaEmVFafpBBpjLq3gbT
 b00ER7H4BKVExBuH/am0aEyOyP18n84=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_231059_943879_894179DE 
X-CRM114-Status: GOOD (  17.69  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a45485b54a5b..87d01acc7b5a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -911,6 +911,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 144f117ba511..0adf9f02c8cf 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..f0633b81a04d 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -550,7 +550,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


