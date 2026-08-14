Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AF7C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=; b=VC6S3aW8Ov+CwnUg2W+q7Y94K5
	ag82Op9qMPU46jK112d89tGS/FVKIW5SiSdQqOyXh0xdboMf8SICxOb7fKbifhbmHU6zwaAEcS3xs
	mQQfdnQofP1YJs7iYW9OVU8LGdxS/BC5WJRGch6UFaM07xPuFLnB117YHIOzB8vmjTbEbpCsnhm/S
	Xhb+Kt1EUa8XKLCzhX3smzQICC4sTEgl8+BrNmdV4Eo4moJTx/nn1wJn43m5alwnSIuDdFGKfWeVn
	mEQUXy77Qbfrp2YQquYaNJhpvtCMtmmB/SssfRU8JttjwF6NrXAv3aREZpcy0NZLZRrWZb7EaN8J/
	bH11NnTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumOm-000000029wV-1HR9;
	Fri, 14 Aug 2026 07:32:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumOj-000000029v5-2Bi3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:32:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QUCk669218
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=; b=ZqyQF3qYsoI0iga1
	P0dUrddoNGW/Ab0986gmxFI6kCZjk9D4aTCdcl93gkZ2gOTsEG6zttj+vk3n3sHB
	yUvoH3WK4ACmQpd0rPzTZ49Sq1QiErQrMef5rdf9kgWxLaNU2+lb/iJezrienF7i
	i8g503thezTB+pMyNyqOu3rcpyv+IFNrNZrbpjVstKQp0oDTBsaaB9yL/mFzalz6
	C8V9gcQnN1b7BIZl4McYrwLCnDa47eZgfZwEtiBoImeoOqnJQuCnuoDybPbU9FMo
	09GAHagxNwe4H5BATQW0FFiMJ+VQJ2l0JFX2lUGIoh+Cvz4VCKD2uMmkBKbIllAn
	85WIJw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h1uua2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cccfa32670so8301885ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692731; x=1787297531; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=ca1EgCDiMbZbcghd5YE/CwaDq8NlChN6yoO6KqKjEI3rLyGMyWUe8SrTCz4PUP8T7x
         VGqp/ODMS7kTCUp0sbvBLFBWgLDfuani9mxDJ4e94o1OYqcRJ/pkQk7nsYFZlM7vueEv
         u4l3smRIy9MGaRVY6jIpOMurbDJVD/x6Y6qFLaYWTkQAWHM5dTYdW3nomsbrS5qFRePv
         rEdOImGaGyopfKtyov3Atk0cJ+ecD0/CA0y08IFrjm8JDPx29UKLJv9rfut+SeNqurTP
         aNHsyHleSLOm7yX+JA0fdaxjpH0k2Vhx6z2Z8pIWLGoCp/3RJ+9aOnTuU+vx9bbYmiuH
         LHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692731; x=1787297531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=quyAn4XSCuxxxBqwiOCQxAHyMTygjbld7AkRRC9VHGVc6BI704z621yYXVv3wPdsaY
         RZP4jp3bwshpISNXvwXJiAxH/FPPk2NZD8RPpGk1bQc0Jl98jzbi8jsh42Y7hZO9cNAO
         wkaLj4wchMs5VnvP+s4tTueQLKxkCvEBZi21LBO76RSn3b5aD1kVOfrJaiYkUU/i3+zX
         0MoQBzE6bSUlXRGK1GFtEhpxHnRVY9jKNmZIkKS/IzalTIRu9nnZVJn3mtO0MqUJoVBS
         4/wViztuhkljOIwQUZOVHOf3XbHAgsSqTevJNTeOjzeAbOBNeDmJUVh8bVGPRX0bPj/G
         DvCA==
X-Forwarded-Encrypted: i=1; AHgh+RoMFpQ8hXAvQoblQH42Do77xbH+HbbvFGu+JounSuAJt9Z7Kk1leVJX6Dw8juhD2SKj6jQAWCtGXsqvBNP6r8r9@lists.infradead.org
X-Gm-Message-State: AOJu0YzkcrT84rYA6l9U57xfcRHjX2Mo7DwThEovjlT+ivEwxEe4cfnE
	w+PiLGvZ3bfqY6IZwWvS2gVLYjvxW2/8nF/VDTHb/R6867+ntShgv3dTa1IWa1inefzRNbgDLM0
	IheB/50HR8PSkoi4l9pL5oLJ9frSd4vFFP8l6p1T0pYWKVJbzPqVbjSkXJMvbLyuoJylvf8hKjB
	Go4A==
X-Gm-Gg: AR+sD1248Zu7uouNlk3NE6SeFLJuOV8V3klzpx+agsGcbQkm9yKx10cK9yUhdshJvmZ
	ow2l5J+c2OYFRrTCZxmILdwFm163i3j/TlIe9e+DwfNfIs15Roqe2zDSiZcRlTj59EKmUws+6+7
	W9icYmHi+j4V8FtPXkpmEiXeGY1L5xU1WSr0WMfitFGk0hYs52VOYFK2mgQneGHARyT3p8DQUcn
	OHVVbIcQujk6eqJ5+xYP/UnxO445vTYDIuP/UR0ba+o3T5cTFo9VyrTvZrIGge6a+nqNxQm2NKr
	6OqVn3QCOLEQk9GIopC7ZTQlWnNQLoZ1FeNq9ZUuGeo6UvCP1oIHHR0wux9Wa+Q8mp//CMdLloz
	ybt4GFae+Wur2b9JvocGoeUVfxDxjHDxDrxIzCU7dLAamJ3t1Izej0b/X8nDkYOC3A9ZCUKhyqm
	xIeEwNjzJFeuwbe3G/aQHhjAg=
X-Received: by 2002:a17:903:2c0f:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d3b0eec2f6mr47931015ad.14.1786692731582;
        Fri, 14 Aug 2026 00:32:11 -0700 (PDT)
X-Received: by 2002:a17:903:2c0f:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d3b0eec2f6mr47930065ad.14.1786692731101;
        Fri, 14 Aug 2026 00:32:11 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:10 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:32 +0530
Subject: [PATCH v2 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-1-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=973;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=gHxGYWhnicYORaElGwhsc1d3PMvje3as8cNJCACI2hM=;
 b=I0K2b/N6iz/Hf/cAEZCNxofz9Q4I9Wd0lnRLDoR4xw7gpjXX9Y5mTLDuaUuwduG/xIi8+eCO4
 Fhxl4TnLyFUAy1u4Qn15sFvcwtEhWmOFc2g9+d78zMwYmEfpYDN52DO
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: PLnNMbWI_U_T3ytR4AHTYvd1AUGcKwNo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXyNhbVxH4BuoL
 EPkgtuQ63SzSGvRc+6tcZ13DnckmhDcH/qJjveh/0INOQUtdHy5ZXE7OF1Qqo2pnF/C9CNlkPsu
 UC8I8XHy4vEDuJJDTI7MudSQoK1BFFSp5kKNXv9kGI28rhL50mqS5DprpeSKIuCY9P6pLcBMMkU
 H1hymCr1NUc116pJsEekgefJlpFcAEV+lI4IcvMWLNapq51c4Hg5SNBRGvPxnevp5ujk3Q/g6We
 TZ+tub3wYi5GNw1HwuAFuGI8Ru1bwn0FOOIEH6ppsHNBg24I6ebaHWMzEydooTqlCxg83v548dK
 tw9xApa7H5AAibJr1mTIpd0iCMq4Q/fvL5d9bAwch+kgF4l1HAfwwsaVfsIHFP7ScjZMAAhrP3a
 Y7SEiKs7fjrskty5z0qhCRCnvTwdjDh2LH9HJvJ7YaCkRY7xD48KtliYMg19i5hAVF81/zufhPF
 7eufY+nLqFBx5bZbmVw==
X-Proofpoint-ORIG-GUID: PLnNMbWI_U_T3ytR4AHTYvd1AUGcKwNo
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=6a7ec47c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6t05LGSwh5SlIrDCal4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX2jjG9oRvNqag
 hUTSPyFtmLXr5S2hkn7ZntRwstYztM7s6ZxybavNh8O35PHvxvQPPJWVFdsDGcDxtw78jz6jPcg
 mjYERRQ9dvwgclfBRR+wOYbseteKOOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_003213_708363_9AC42521 
X-CRM114-Status: GOOD (  14.51  )
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

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART. Drop the explicit ARM64 dependency so the
driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
COMPILE_TEST, so no replacement dependency is needed.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index fd4d4ecd2df0..5b3c9d31fd7f 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

-- 
2.43.0


