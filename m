Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7B3C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMDoaAwlzNUTRWkFfx6sI7/AXu3O1IHa2Ua1CeFXUbY=; b=Kx7heEzff49JiDrkUn0MLsQZC7
	8XNaa8gY9tqA4SCcm+gxtKMfFbl5IwkTjOtpoS5kZyK3OmQ111yQxWxxswRjNbs+g8nwkWra7k+OZ
	eRaw2qnyq5U/QGth7c8pZJApH6lLq0h+nSCc6hpxUDg0S3akXY8yVymb4PlydoSe6Jrx1PECQMfDT
	t+ArGq3pXKXT5z+DThhCgbsDSYQlZfMg+WTcxRYsjnB1Cng0khDMA2a9tlkP5+uR4NfmcSvIt3qPQ
	JwNRuGFkL9F255P6gx4hQwrRYLRAGw+ZVgZ8lvjlZoOsrGj1iEryCP7QpFi9PYM58o1EEfFZ8zgdZ
	dInFmRrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68Aq-000000044D0-2MVM;
	Mon, 14 Sep 2026 15:00:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68Am-000000044BA-3fYd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:00:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0ata674538
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMDoaAwlzNUTRWkFfx6sI7/AXu3O1IHa2Ua1CeFXUbY=; b=jOk7EHTbuz8pS8cH
	2Gb+jU3y1nBmkLekUDDyGZ/92x7TIofuECsKyDafT5bYNu0czoCcznXOSW5+1Z/a
	X/h5ePTTxWNH7ljipeU9G5D9PLnYNgZAIBLgJyzYH/L6MiBAzyq98oYxEqG1xMO7
	lmjkiwVkz+jKPjPmXBgm0rzsIlectJST8omgNd26cVJoCb5UXY8gCoASQ1k2Oljd
	rRoE8fCgiF4fAAG7LpaQQc5sXk3cGtoNDOkfHSHPf4rjw925n5Vb8VLtaRUnn7OL
	aAmZ/ZSzhgtmEtx9hKoSpg5SI6kMt7EpbBWRAS5T5AfINeBGcJTPRnXXEOvAkUtU
	TcLQcw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs99tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:00:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd753a52bbso2260765ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398043; x=1790002843; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMDoaAwlzNUTRWkFfx6sI7/AXu3O1IHa2Ua1CeFXUbY=;
        b=MYhKEWH2KrcVsIr8z+EzMZl5yJlORNrGQn+x9Z/Q3oc1jR3uAKksJpqFjRn+EyikAQ
         CT9XDLabV9p7NgqQEt2A14rw7Q3iDlM72/3kjhEYtMFXSeS7wRdDrRZAVZ3rwOb4VGu/
         Jc7WChbCvbjvKLEuOPrtT+WWmWzRXdtiuU30ORtzw7xaBOKyOPm4+120Qla8XNIt1jCP
         LizNGZbxBv0US76j5CLHSNh2USSJMGwcUfm4dVoarI7XzZzlse3TUpuxAjDvTmy30sXl
         UlHYH4ZFqHo8u6YErxH2FREU7C56xqmT5Go3rKJIeS0IPaQSPLnDalGv21izXUVPPwnS
         s+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398043; x=1790002843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMDoaAwlzNUTRWkFfx6sI7/AXu3O1IHa2Ua1CeFXUbY=;
        b=A4OX4BlowHG0vrwuv7fkCmTrIS8XknTGfVcTbSx2JleU3cUoFLJTqU9nEK5Xfd3C3G
         CyGV0RO85nBWxZ6gXtLxj7Q+6LOSLw7ff7B0U7Os+7b6gdjQuW+QCgvp8cAaTde4Quh/
         4Yq7lwj4kNjPWqGEdRsREFoOzX7F52EFlmNnXLOyw23eWNd1gS3atRrwWvVtinrEoF8E
         Zz4Qnb7+tEsIGn6VpU6cOwFWvkjI6t7V1toSN8FTRYq3Y13dy6BEeCd+0da8Z7vSZNa7
         4lmm4/uhE+9R4qIMK6anx71PYSRvtnsH4zjGLhhyoLD67/RJWryLp3cYWVffRUxJwTUi
         a1wQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYRU7BYkchYYG4Is0UvyvN56yh0o4EnXol2om8ALIkrvQzVU9NBlZKh1AT2dFjCHSLsb09St3W9KcW6+WAOfJo@lists.infradead.org
X-Gm-Message-State: AFuF++lcix6UGKOnGIA6JNwpHH1MwhWLn4BKWCTV8nPvl88bFvfpOZlM
	F5VFOB3/E0eF8FIGyKwUi9Dvty+erWDXwh6Ds7M34WWMWWy8ql/iKfUB3FTAFZyLjCd6+GkP/kZ
	D0M2KXKJXjerQrA0zAa2p1MNE15FWYKAq6qWddTO1F/a9YHyF3GHMVvugy++CuDSxS4Ja2GBOi5
	qpCg==
X-Gm-Gg: AYBFou3NXH6kyzo35cwmpJnznrfcS1LepcVLaGAmECkTrJ9zwVHa7sNa56/KpdMUcA/
	UpBsr6Ry4zLgH9eItOSPZ4WKsgIBY6WKR475txVrW54zdm0gL5tHv4zG8U2tdRl+v5V/vM9Kgcv
	mRTJOiPcIvjUEBrEDFaqxu/nHF31m7Qb71gcNX7QO8dUEQDv62R5+AIw83yXOwrqMJWg9+H85TS
	3cybGraJOz2Dif6pnS418cYnyfHpM5vfYlYEeno8HwhxpYaeBVvVqiNH/l3cxN79dDuhdSguf/d
	nAKT4W+Ta1Y7c2JvyjNrxtKn+cXzTO2xCyOUEMnK4VtyCYK2KVma0+/Yz7eRILfo8OwDX8kY1X7
	UAAEHmhqFSUIcuQZlrelWa5afx+G00mnpcEGo
X-Received: by 2002:a17:902:c40d:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2dd6c6fc4f3mr55282425ad.17.1789398040576;
        Mon, 14 Sep 2026 08:00:40 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2dd6c6fc4f3mr55278505ad.17.1789398038902;
        Mon, 14 Sep 2026 08:00:38 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:37 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:11 +0530
Subject: [PATCH v25 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-7-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
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
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=2145;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=qOFvn7wgKOMIlixvdMXPEO8Y8u2ONv9k+Pz20i023QE=;
 b=txsEWykMpTLSUOW6FXQVTJLBQQ1Nc4sqO3I+bYIXwGfuhPQ6gT4S9k1E4GUbqfnAs8R/0URP4
 /HrN6czalP9ApLSw6uR4PpjIRu9AyPfqqX0KmqYStyBUvqXmpeSjBoz
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX+yvtQLZPyz90
 sZ3WdsPdmMtk1ggrSaQgib6w1FMpKCcvJAjcSa6HM+HPYAK4CERB43zIP35Rxoh+W3SugVP3cQ/
 jlToOGYa5TwjXuzZtd9uA3q2bhTgk1M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX7Atr3Xd0yuRA
 4dg8DpI7+WqOtVIT8R4k6opvJ35mRN4rLfMnHV2JS6eFpBGjLYZDEuwPxzTNE0E/nYvM/49ndYM
 /3/pe4HmEduGj9bD9oIpg4psWX9z+8v3bQzOv+1Fkx1rlQlHsIaYM0HtMcXhdurh33MaibqQh6s
 Ph53LBlf2FGL8t3d09RfL9q09wWfwfKMhlnVLlXDrG4965qJoRZUyLXCx90C4+/3XLMR4OQFx8f
 G8afhJ2lIBP9di1pc9rapILY3N1xNHE1jTO1spTvWTgN5cvKnKNfgB1spd9b8TSEDASUIg/3b9Y
 EGDqHlAwAjzpjmHqyibD7ZB6/lLA0+1ErNVR1EFjGF3tAYfCxqvwP9JH3m+l5YF4HmveQEysfl3
 hjAlSN/BC8/ohvmwNB1XWpOJcIPn80z5EvWVkHXCTMtMmgXxymj0mMGrhQOA/PC5VnC2BpFf8g/
 g97pYR6oX+x/ju5iM5A==
X-Proofpoint-GUID: d6l_zzkunb8fwe7hKU4Uoq9WpXh_iSuH
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa80c1c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: d6l_zzkunb8fwe7hKU4Uoq9WpXh_iSuH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080045_160816_1DD1E332 
X-CRM114-Status: GOOD (  18.54  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 347815e5983e..307fc45af37a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -867,7 +867,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 58cce89a0c1c..c9c1b0c48550 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -786,6 +786,13 @@ &qup_uart7_tx {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 3bb5fca8e2b1..a107abee10c3 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1097,6 +1097,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


