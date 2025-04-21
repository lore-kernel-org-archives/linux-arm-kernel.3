Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45BCC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 22:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uazp880WP4oSz5grWMsfUwvLFejN9KQ7Ij/wBd9lOUk=; b=ltpXKwd/Q6eSCuH/otBzk/wdkT
	DZMV7oYzFSOKT6wZOnXzCz7szyCfSdlqgH8Z6QZoSOIM3xa8sejmlzGIFJBQWwFvW5T0lMLXANjpq
	508wlYvc8LT5cmnJkS0pPreUs8qqpMLb+Gy6tmI+KLqrieXvFJECU7TVk5X881JhOjzRkW7qCIvyP
	JwKAcEYjfi18Ol9Lp1aM1pdN2QeopOhc+cK9BEb1vo2S5zuTxPWPBGiGFJA5VGBb+LnMd9DREWZAk
	XCt8+tviNz5B3tcn0rGXkbSiljBPGMDHB+B6Yf8t4PukYOaZj8QK0HJANJ2KQJLIYFlw/O7tlGU8Z
	4+HHEQvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zWA-00000005JbZ-09l1;
	Mon, 21 Apr 2025 22:21:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zBy-00000005GZE-3cjk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 22:00:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK3mhf012269
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 22:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uazp880WP4oSz5grWMsfUwvLFejN9KQ7Ij/wBd9lOUk=; b=L6WRdDE7droB3o9E
	B04i06qODKi7BaJnrV5JDgmzyap7qPuQpEledEvraihkC4zlBRCKs8FY5w1OSveE
	VxIh27XA0rRHsCENI8FTGCeNxi2gRIsWhoOCIS+cFgl0TGXvRomDcQalPnbvivEJ
	cCUTxbFKaMmoOd2N7UHBtc/5a8d6/0b+hKsV5InABEigbyb+mRL/hYxfUI8tt86S
	MuzTQawzDnGrZVN9zwmP7O2uZrwP8GUEJ3NlT0xmcGmeBJq7TWtkS19z0FJ2+7Rt
	f65X3v+bN/ElDmRcYy0V0AyvdrEc6DK5P+LO2ZgtHOm1/os+Arj52zwyYTufFPCA
	VeVZ1Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426na4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 22:00:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736fff82264so3331563b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 15:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272832; x=1745877632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uazp880WP4oSz5grWMsfUwvLFejN9KQ7Ij/wBd9lOUk=;
        b=oHVssk0poFy7QBoXgWGArqO9xXE8x5+xF2ujkAqE29Ht2tGcXGNSaH+4MAgPtssYUp
         zIuBQK4uHENEGQxN0bxg9Yovoa6VKIi+Uk3RTSBOw+9JR7JXF+5liLG2S3HbPwSlJdJL
         wjNAUPmeT01Hgtq8onfG1WcSLQGRa+SR5k5e0YBpUpDKKIY0mpUwiaH4m67bcllRdsMn
         0EVgJNaeG0NaRGz1/PkV9NPJVJ+Mc6lcqdVr0KtPVuoHt3ohIOVEi96njkgw1eZR4QXz
         AchnTCkVFw4ikr8CSwJTp008Hem74XY/Li4vp7md+TBcuE1Z5Ft0Ghr7jrnK1ooKIRlm
         TU6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVj2Ob75PcO9jvQULDE4lAVsrvQbgVB6Nrvm8SZSC9OA1GVS5HnOqAdZqOyIKkg48RTTCY6DgZW0DF9olwhrCrf@lists.infradead.org
X-Gm-Message-State: AOJu0YyCVJy20yYicm1tK+cLWXPy0jB6P4D2aFRCbZ8fYSBlgpUyJZ2a
	Y337+Ne2RYv508M9t7D+pCAYjQp3tOdVwH1E/5ep0WLTkYGkq1+LXfCpt+K6x7s6ECpFWvAomjs
	w7VmWXfHCoqBpt1nKu/I8QEB3iXJON63hFUrmwICXY3YWTQY9lJZm+s2P+3vMrDHE9bmKvqWbKQ
	==
X-Gm-Gg: ASbGncsC63+y8XeSfor5gg5cqVbiZRXzonQuuRQhVwmwflzwQL5kFmzDc+ML4WuMgfi
	qUfprh9OqcqvcQhYHh3mq2nR+HhNhtOydXPJAWfKs2d83/DI4BJKpFswXJMhRtM6aBQVq+FsAIW
	1EvCm+mA0HZ8FjCz51eHxZGGQxG+5WwXU5G7rf0qQIz5FYbKao9z29HzW8sAAjauEchQ9gn5LPV
	fmau7Ie3ExByOHYtf4sSvYtwterxGQzUsW6S+fL/Dw14NHGeF5+tlWVh5aWu2lBGg9olV6jqTtU
	CcStvr1Ol3SUZGHdxsjvQBxZG1ZHnol8dQ3ds/z4NAMQ4741Tpq0xOupAaS5OCF3LMk=
X-Received: by 2002:a05:6a00:3a0b:b0:736:b400:b58f with SMTP id d2e1a72fcca58-73dbe33a010mr20742289b3a.0.1745272831515;
        Mon, 21 Apr 2025 15:00:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd2JaFZ5xayiBayYrxFjaq77QJEeo7B+ROQTO4klSPnHDNhSnBxzHPeGDowAOPB7q2goChHg==
X-Received: by 2002:a05:6a00:3a0b:b0:736:b400:b58f with SMTP id d2e1a72fcca58-73dbe33a010mr20742217b3a.0.1745272830983;
        Mon, 21 Apr 2025 15:00:30 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:30 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:10 -0700
Subject: [PATCH v5 03/10] dt-bindings: usb: qcom,dwc3: Correct the SM8750
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-3-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=1135;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=/pdn7VV26vHsdyRwPkDqqfr5a2aFBupKx6kIrHY3wNI=;
 b=OAqbWj2tMbT4LgbPTEZ+OhAfWcf4RBdXsny37UizI+Wabc/Oo8AxHA53vPNaePdUIDjUrBa7P
 7DF7jHYD2JyAUiE6QUvCqENTZL2NqByI0QPi/nizK8adtYPYXfTumae
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: YNVqwOaDs2LWdLt3q1Gq9N2J9Ep0YUlp
X-Proofpoint-GUID: YNVqwOaDs2LWdLt3q1Gq9N2J9Ep0YUlp
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=6806c004 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Y21Hm-oE12uJT_c86xsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=525 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_150042_903372_07058797 
X-CRM114-Status: GOOD (  14.63  )
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

SM8750 does not require an XO clock in the dt as it is the
parent of the TCSR refclk_src, so move the compatible to a section
where the XO clock is not required.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a681208616f3a260086cff5a28dc23d35bd96f9a..ccf4f505913b0eea12e7cd58958b43013451f46f 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -216,6 +216,7 @@ allOf:
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
               - qcom,sm6350-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:
@@ -355,7 +356,6 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
-              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:

-- 
2.48.1


