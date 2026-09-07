Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51108C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 05:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7xPpPd/gMAwc7gipdn+TzoHtpnTabWshZ97q2TAFrM=; b=z1c4qxDd2Hsy/OLdThbBtqkRmd
	mgtbO5e1yQadIxhTzHaTSRwXxNkj8OaN1jvKMw3EHEEjZjKEwMbzCdiJXlrLA+OxdbrP+W5ZbU8sb
	zSgmpPf9QPKG0ncDo83lV5Kd5KRttGsuCkB9MUnBzvIeL5Rqsoued8GzCWjrz0f5HnOkCGB+4PjRl
	Lkw4SgUS07IY8RWlygy/a4D3cpZ5np7oVLkzc+LBHPdgQPJQJoVuA6P5llW7oHetnHj0A6HUYFRVW
	e8Fv88SgVAw7P9Dmw9ozlMn4QAG6stlmvi59R0Yh6cYg5v4a3hyDOXF6/P8fIGb4OZA9pwumCKsJe
	aD6dRNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SBf-00000005xxe-3hGM;
	Mon, 07 Sep 2026 05:46:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SBd-00000005xvz-05Uo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 05:46:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lBSS2821008
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 05:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7xPpPd/gMAwc7gipdn+TzoHtpnTabWshZ97q2TAFrM=; b=EL4s0+TVhvnidJAO
	BJ+aBA+5w4xsi51FaUaHt+rkM7rWDQc5cdEsO3HaRzChyPu0jMpb+dr/0W4VLWZY
	3023ABlY/aU5uBmHREt7O7qI2oLj/zWymAfluSkJfNkq0SfOqJgv0HNBdPWKqPsB
	q5veqk8BCYxpUjK4HVBI2uWmVXoKIqLGxZnBiii0xFagI8haVyWXdzzuGYzaysWZ
	b+HMiq6z6N48yz01WzW3OcqlQyKfc5mKGsh43l0ErtlgQNhXWj8kXlhkSyiAsF1Y
	G+crE98cbBe4PGp6yxJCQllc0Yf0LVwPP3SYEPpJapjsoMGYcyYegTh9XZsQXDRP
	RiFJDA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhn7gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:46:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc44d708055so5854086a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 22:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788759991; x=1789364791; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7xPpPd/gMAwc7gipdn+TzoHtpnTabWshZ97q2TAFrM=;
        b=FPUk6prVNWflnYKLDVR4nVoTEB/XKb0PLYQb9w2CfjWuGjSj46N9Xb+8t4ToD5Vgvm
         0zNPWuStjt3xw7zdbCOh8vF0WY0rkZBQBhmN90VqBOM8dUTnpZenzFL2TLZgLS5AbfWr
         tYWwTqtIh2GgmN/lp3qmdmlsawobsMHPPpfGU3SobTowFxbr2fvI1lUfthsvX5DeznQe
         W2MVdHAgkP1NLgGTscdu3v/fuAOXURwefZNr40ySYq+Cjzdy9PAZG2PGf73vYFEe+0C6
         SixwOXhECslXZ4GFcKt1v3QNPPzj0vhMzPZk5i5MUqVULQ1/G/zpgRn86hEtMvHIuZ3U
         Fdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759991; x=1789364791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x7xPpPd/gMAwc7gipdn+TzoHtpnTabWshZ97q2TAFrM=;
        b=Z6u/TJq5VYCkglrM49UCgH1toq+zC30QUlICxE9EZJ3LvtIxnURTEU1uvIjTB6qThc
         vwBtX3RMQtSd1g9lDK4LoP5QXf6crrB8yXZuaBy5W7/H1Z5pZKQEGnxF3t9EljTqv75A
         7GKtX4t1ymOfbsm10DojZ6T9lHsn5UfmEMV/dS6tYpgIc7mrXclrVeIntACcLUZIt2KF
         9OPAa48OcKBUHE3Lam8rwG3v90XXqlMzLxXGBW+rgSwNTcYProkkbWWkbwWvq86o0y4+
         pgLELUnQ2Ypcuj8Gp3r9AXocsjTV47uUuqAsIwJcnRwmSOpAlOroG1x0w7zUGIKGXuH5
         CPzA==
X-Forwarded-Encrypted: i=1; AKwUvBy0Hrz6eNEKJQm7EAB/PMpHclnvlXxIfScUnX6TjeG//udlXud9p7/tQY0gmh/fTm86JmpvtQYtEwwjPxxAVK3u@lists.infradead.org
X-Gm-Message-State: AFuF++kDPaP7mvP8vq0WBidPVNhICk1tlMnifiPiEpy9nLFrD4ormzMy
	xg/kx7CAc05XtgboFUQm+/UEC8A4pI+0dYpXHU7suPPK989BBb7U5gQLwFFRMQILYboHq2K7DXi
	QDTY3MojGcjTX+IAw4dvt4cY3flG4NAI1q0ODZCm2tqscl9Vc2WoR2wlJwTcPSXgHaFkVDQT4Ju
	aIDA==
X-Gm-Gg: AYBFou10voc99lGVkOTFpGe8IQ/iYzqMuwBXIIWLxiNJhTq2f5J97a0dRj4sPeWyNNl
	rbm+31gXIozc9sfEGomtqeNUwgoRD+UQ9Wj7KSnucRKyCWwPfVTeJgJ82NACknshPwh9yuD3FoH
	3GWzBnkGzEOysKTnn6cEqUgByLj8lbr46ssa8hqlekOiDcgMtOOdQOJuXaxt0gTUDh98ZEhYugl
	q19SW6lVsZPpNCmE4gX5BN0OvSgJ7evLCsezl9hMZoT8q5KEt18jWKynfJ1SofO7H5bjEXPzCCF
	E7VS3TAvfWkUEDenL19ZqnUp0UA/z5gZOBGzSY/uJdDpAjlDaTn1OHxH0yykHzzcn4zHw1KPvCI
	9hP9j/Zjfv5LoVEDmu751xdm268lDxVXlBp5X
X-Received: by 2002:a05:6a21:4e01:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3da3a178a99mr32448196637.24.1788759990972;
        Sun, 06 Sep 2026 22:46:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:4e01:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3da3a178a99mr32448137637.24.1788759990513;
        Sun, 06 Sep 2026 22:46:30 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24022589eec.22.2026.09.06.22.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:46:29 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 11:16:07 +0530
Subject: [PATCH v2 1/2] dt-bindings: regulator: rpi-panel-v2: Add required
 vcc-supply property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788759980; l=1463;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=TGGp65HQw/cMtOZ6c34YE/ci3z+cTavJC4fOlegELGU=;
 b=HGqHYzefSsJiIaceJpBRFr7bUOzhMrcj8IGMVMJXpA5rttKU+yhWh2DxTHVq4N1MHRPikfKsu
 ubODr/32dUADgvFEFgN+dVi94V8ak6A+snFiqQVu9PCSDNRZSmLLi8C
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-ORIG-GUID: S2_ZYJHsrjCqiJg9EmimsJHvxSxODHS_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA1OSBTYWx0ZWRfXwVcixNp6gwDs
 kFJQBiMF8P3uEd1uprud7TtnWM+gkmwiSRDEBTQr/9nikgZ6TS4iTHRjJYK4qoZBAmqfq2Q3AkT
 38l5nZWkYBFfJNTaMjmH/9rYlvq2vWLnjGEJUmIE9S/OqYibPQzZ9ui2sY3rR7sXsqcdvCz/MP3
 WXbPi1NDP+DRxedyu7eA6egVC+P+jTUWbMH1LhwgNJ7q/mA/wCASGyjOykeUxA7ehrtrY9sixMr
 ABvx3pHLmx94Zfv5uy3MB2nnZv53CT9aW+4lSkDni+Vg4On5Mz4QO7WfMk+4YJl7l0wR8Ztkur6
 nP+9qGH6sPLDB+sOwkHF9h2IaabPrqU8YOKP9tAyvElificW0mMQQQvSWLAbtntKfP500IOxmgJ
 06cFso3ZdTsrBvVXuN2bzYCEsGrR7Ku1dRwgMNXTcPj2ACM3nNRNTUpTTcl9nVvONUEMA6UM7f4
 Jc7iKLTvKjtwNyJqdTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA1OSBTYWx0ZWRfX9ibeLqMuZl7I
 oIyKRWBoYyldiHkrPzsDh/N3mmawru1p9WMMoYEoRpY4fEBRFPtMVllm5Fb+hlIo2e6LaC5Zt8T
 R5dcJ/llSKBMdtmk4Vaj193WMegAn/U=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9e4fb8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=H1PRAqIjwE-dPk8C70UA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: S2_ZYJHsrjCqiJg9EmimsJHvxSxODHS_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_224633_167482_419935CD 
X-CRM114-Status: GOOD (  14.04  )
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

Add a vcc-supply property to the Raspberry Pi 7" touchscreen panel V2
regulator binding and mark it as required. The panel controller MCU
needs an external power rail to be supplied before any I2C communication
can take place.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
index 37b9ed371b67..a6195e53be16 100644
--- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
+++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
@@ -35,6 +35,9 @@ properties:
     const: 3
     description: See ../../pwm/pwm.yaml for description of the cell formats.
 
+  vcc-supply:
+    description: Regulator supplying power to the panel controller.
+
 additionalProperties: false
 
 required:
@@ -43,6 +46,7 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - "#pwm-cells"
+  - vcc-supply
 
 examples:
   - |
@@ -55,6 +59,7 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         #pwm-cells = <3>;
+        vcc-supply = <&vcc_reg>;
       };
     };
 

-- 
2.34.1


