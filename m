Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F08CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 01:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRJljLs0mUu2LG8ESeBqv0weK1tocDM94Ekh5Hl/RQ8=; b=oEcUEdT6DelR6LUPwXbfOL4QCm
	KnGYUrilSgQoZkk/ycdL2WF1scOSjgRpSqcExWDbmjDtTbOdxAVsUOL6un0lVHtSQtWSbjMBxV34s
	4Qq7M4pcGG3knICXt+ng+4TCfGfhc9avibIcB1HSPVVhjjh+AjKl44lesNTus/6e7WUuswj15AhvA
	J8DVTl7YMt+CpE/7/5yb7f56ZPMt1yvDbK6vWfzvlT5N/AuIHMQkYo6UiwsEtrKjAMDizSnlQTvc5
	jpr0v3Qz+9dcVfuK35l6wXaOF0+8N4QwuRRjcNoRqCxZwdTbqpfXss+Jz8cnbgohSDZ/0PIhV34yb
	6HbBmw3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpG5-0000000Eif6-1PFS;
	Thu, 06 Nov 2025 01:57:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpG2-0000000Eidy-3WFW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 01:57:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KFVYn1785434
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Nov 2025 01:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WRJljLs0mUu2LG8ESeBqv0weK1tocDM94Ekh5Hl/RQ8=; b=CTo1IeJfVWfYL/3e
	pQ1GLDiqqxubSa1baNWssJp4AULUJazOfJerod6znB9qI/iY3JuqU2MO1dpGTptK
	cWySK03ho5LecERfy7ibBR1P/I4ZLcMrSEf1awGY2Hv8fLYUSclI4j3dMFyzIdnw
	A43Z8YIOIDaMUbGT8oHLTlMlxD6YMB9LZMc5AMp2IMJvEerdgh5JHvbVqjBz/czI
	7aIgj9MzY2nzdO4zZHSpuZtUItc49S4I+pa7u6PtgYPDx2E+onUDEaZ+4Ep2RjnQ
	+akylud4ARpw6STTy6dkIaSxQ/u5UYvVzYWeW9aSoT/xEJIzrNaaiIhJjKsIZFi7
	ehNz0g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8amx9cfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 01:57:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340c07119bfso1531046a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 17:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762394269; x=1762999069; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRJljLs0mUu2LG8ESeBqv0weK1tocDM94Ekh5Hl/RQ8=;
        b=S0E3+Yedb9eICYjR29NjE7Oz5ZZCBG13CDsDzsyYDl6fVWHNOJ+zU3cpOrhyeorDvq
         LlmRolLWqoYkqd3Fbp89S1DrgbA+WB3SbyIsOK7sLqMJU+v6OxPG2ao7Wvug9ZOC9aC6
         6U0tw1SkgCM5hq9eutZYeWmbrB1JCC4x/rCPxEcQZ63354U5JhZ5osZnwdzTCmIx4qaU
         ATQQsznDigumgBNDj5uwi+j7qQBTKagwcMUCCI4ZWSR7jFdeVZAHWf4Uc5AX0oBecJHy
         34s/Tp0+8UaTHJ+NbYt4skAeUYm5ULeTTv/vcbLihKPY3/GfiwoByo5C9BiPn11nwn/T
         1dLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762394269; x=1762999069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRJljLs0mUu2LG8ESeBqv0weK1tocDM94Ekh5Hl/RQ8=;
        b=ouNTclQeRpCwGvVUukQvebTLMDqDra714BQJ81Pl6DZkr6CJFmxXU+bL5Dj6XqR45+
         Mn4LHjViUHQTqFv/5/0Hf1UH5Io8rKjiPXCzF/jvzQ+c+OOeAWKeKBquObbsv3wkoiln
         U5awp2DNHzALzqNKJZ63MduVxCYDP9Phf7/4J0iKl4nwxQ5GEIC8NPHcFYSVR6p8gdTm
         B0AfDzRzBYPFCPDi3sU9Xzzf2BzFJLIkl1fR3UJwz8hih/gddfOQuifw90YZ2TFjj9/B
         FrQPJKimV1jWVsdD3Wz6Cc6DBVUjmxXFvvbuUwQcTYCT1MCq0xOSJ/sXs4NTzhx2avGd
         Nx7w==
X-Forwarded-Encrypted: i=1; AJvYcCXk5mBnOc7tDgZ01zU+fGFghuMEeHqKJAjmFc/npTWUvuV7V5vZbBMnfwLVfUKCxD1jGT92uQGXZ2nbM3++jJuy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz68iNIUY6Hmk5UHslXxSi8s97gv3vf5vci2q3a7HKsAsD2hwjv
	NmaEspnZ00+XF636KAutFqP8CmWt4ZDmiP2S7F6ULTwJMRi6ATnApX1pKVsypVTum6mJQWo2dWy
	4bKor64nh0pZsX4EpxQS2f0b1OPevAtYz3ZlLrd0tiTBjZKNO5FR8WdcCdTeLSih1t9JYyLz/rc
	pN4w==
X-Gm-Gg: ASbGncu2DJp4lWXHXOuh3C6vyYRSur9D91/lbdVTMt3TRi/za/M72aVHJkVOXWyRQLa
	FpJKXdivKq/Oo01XFRYwhhg2UiLuC3yDHtrtWMbfWPTuDe2AeyRa0fKJ3fXDztfBnUS5oPY5UFz
	1Tb5m7SMGxet7/S/A6wad/kQ7sqtkwtPcRiJl15/TYlwslCT3lW2QK1vB/f7o/pbSjgEE/mbOwz
	EmPpxW8dc1Ynp/JUDPjAnKeVRRyn89EwPMgQpVqB0TO/9FiqGGu9kBCTx6AKTjcEv7PlRbjzO+f
	HynI/79gCleUmVACo/WoVbyK3OxXXIlvoWoWKt+B0r39vtteYPxtUI4WJrKPscePdH74NFDqZKG
	N7stC4PRxzmywYkz+3bsP6PhqNzruwYZTwSn8AsBEliy8kkJXX53qUDxPRdb7oA==
X-Received: by 2002:a17:903:2ecd:b0:294:9813:4512 with SMTP id d9443c01a7336-2962ad0c69cmr84799105ad.3.1762394269433;
        Wed, 05 Nov 2025 17:57:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEad9eTk1wDBEBRbA/9d4rvxsP6hrAqaaoyQaLkrSKmxzgcL8VlZOUxv0noG5mAp+OzbSzGEA==
X-Received: by 2002:a17:903:2ecd:b0:294:9813:4512 with SMTP id d9443c01a7336-2962ad0c69cmr84798795ad.3.1762394268826;
        Wed, 05 Nov 2025 17:57:48 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c93e5dsm9115725ad.81.2025.11.05.17.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 17:57:48 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 06 Nov 2025 09:57:25 +0800
Subject: [PATCH v2 1/2] dt-binding: arm: add CTCU device for hamoa
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
In-Reply-To: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762394259; l=810;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=RRDIkxdP3/Y5/4hhAVkauK6PkEknJbU5v3IcJnyja+Y=;
 b=b+jg9yIcubqqfZIx2HeucxfIf5o1xDhfJ8DsBfAWnF0jp5PejL45b8VoS5Mmixa19l5Sd7XL9
 uK3HnQX0Oa6C/oZv5ahpyUKZqxrSoK8KfjPkguP+asQtpvxdNWl6nS+
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: MM9AmFCYq-ZrfLAVb2SMNJFe57qlAiGe
X-Authority-Analysis: v=2.4 cv=P443RyAu c=1 sm=1 tr=0 ts=690c009e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AruyFUP6G_q06T9m-PEA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAxNSBTYWx0ZWRfX5PWm3hJ1DwtK
 Vf3vXwUzlPaH6eUsIKV8c0a06gqM2V7n3M5NFDFdh1LYfu4bxgbFTHw5RuqmlsqKeDsuSderZhd
 iJsDUBW1uzkI5+SGc+swe+ZD57AJZevQ1sYpWG/e9Rx8AoFvraB7YnGUAc/p5R+Hc0Dm9HVrGmC
 4rtnPnaJS9MxNQpciW9PMNurqccR9si2N6tJqArq2ykH+DX6m8Yd1ckAvyJ2BNDtYeaE2Rm7Nn7
 t37yV5Cohedd7Tf9hySVyyvgyv6zCZA0g8qjJp0ZYV9irbrSmOKtcZKQMBfJqCqak0A3Drwxn6v
 PO+G0ndSjHS9ZUE/uvremUjspu0DZ+1Sqf41Tj5lm4+ns/mA6FvfG/Vz9VSWYqFQ4CiWIIPvrbv
 boplGwlpIs46KkCQxjS5Bx48e02WYA==
X-Proofpoint-ORIG-GUID: MM9AmFCYq-ZrfLAVb2SMNJFe57qlAiGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_175750_889459_B40FC24C 
X-CRM114-Status: GOOD (  12.98  )
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

Document the CTCU compatible for Hamoa, enabling support for the
CTCU device on the Hamoa platform.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 460f38ddbd73..57dede7a90e9 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -29,6 +29,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,hamoa-ctcu
               - qcom,qcs8300-ctcu
           - const: qcom,sa8775p-ctcu
       - enum:

-- 
2.34.1


