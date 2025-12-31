Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A65EE6428
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 11:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZNP5yC0LQm6TwkzUFLaybwwhqxxTEH3fOF2tQoEAqCs=; b=ZCCRDXfT7GUihH0PjIcG9M67ut
	j8toMgqBgN2c8JNlBphVkydfduCrCzDWvJhZAqzLvGh9JWuke+Lo5XGlaX2GwqbFF5L9dE8yfrMq0
	hySHBFRGkGKTYxFPL0t9QxIVoK3Ch2TvNRYG57ubiN4XypgpJZo93eNr9haK5dd13JF7i6BCEqlW9
	U3cquiLzz47lPIb/etXgKLZyzfL79wCvUUChWsvlMgBf7S5qH1fjqdgLARPhPt+deXUdEhrwI1HrV
	vdzFz3T0/bAzwYe8eD7syiRnCdcRnVQIAHlFgMsu2fi9/f6ZS5+f+frSjin+R9Ngp8NEbdsWNYZQj
	IJRugM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vauPZ-00000005vJs-2cRF;
	Wed, 31 Dec 2025 11:30:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vauPW-00000005vJO-3WmL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 11:30:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BULtiZ42723178
	for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 11:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZNP5yC0LQm6TwkzUFLaybwwhqxxTEH3fOF2
	tQoEAqCs=; b=jfYMCGoRDiZn5qfmMUz+APKb5q5zs5KfjbE7U0SKK5NlCJ8rXdR
	pZpltIDABhozj00Gb4WGc5UE84vhgFRUNZui/8IukjIDqql4B6L517myKZ5AFvFG
	PqHE2nDb3K7BWs+IP/WhYPoqCwudNg7W8tGEaOu3zj4iU4DZYhztcXmTbdfOz9Pj
	ppbtmzSiiBlAgW7NIAIkupaRcilA06S+NS0N9MA6Lp7fymwgdIjmpV8fpsQdX4wd
	kXved2XXppSRZkk/fBC3DYSYXtJd4qK3uRNhKiMT4HYPhyhBsfC7l8ucz5MIt+9a
	5RsgKQ515/qgxIxHEy1a9F5LjN44NTIncCg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0vdm7fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 11:30:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0c495fc7aso153675835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 03:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767180636; x=1767785436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNP5yC0LQm6TwkzUFLaybwwhqxxTEH3fOF2tQoEAqCs=;
        b=glvXtknV5cIgKnhCyRMJ/o4qFQHB4gc4Vt7iRz9Kt4X8ga/yca91gsiklCihXqKoxO
         0B9ysebSjnTTHr1Y2i3TmLu7qoSYb+bF13fQjyYXygc2M23tIp4sOOPX8RK0VtGjYzor
         WhLkQakKl/xNn21nQDUdqpiUehzwMgEWTRreFrylmT8Nv1xzdb2FHucInpjaOE2cHTkD
         Lg7w4omB7fR+Ja7RXK91UW932JAeMqfTOHtY5o96i7rB3J5oBAGW9gpXIQhQUvbU/nzN
         F0+tXf5k+mMnDqNsJ/INutwbDtqUY/Q8RG20IeBU4at3mG+nlSza4BnHYI/pvz+o+B5a
         z7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767180636; x=1767785436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNP5yC0LQm6TwkzUFLaybwwhqxxTEH3fOF2tQoEAqCs=;
        b=V1DKzufDLopiMFMOKqHHILGiSXAMRXRQAOdUP/JBclAOQc/Xm+RR+kxOQq3MZYtO+h
         g+Wit7+DNjgJWKpKaM/ajuS0aJ/ua2kUR0xlFf/jt5eTqPDC6FZHXCwqSzpuEJxXLVHD
         qlbfDs7wqku/VBlSkfJPK6AmDziBlyakVLetQ+kYb/wXzFZ89e+fp6uMysUfnx8LloiX
         pt7ImHs2Ve8E8MWRoHLKNREBWfVFXXnELYQir9R9AqT67+c7ibYvnlDxb4Pe8h/b/7hQ
         hmJUe92uOZZEO+DV5DsmQnpGtG9q+J5KEfKpTcn2PK5h4AYfUADae+J1dH0FlzHXL0Nh
         +xAg==
X-Gm-Message-State: AOJu0YybGkbXIuxsV3ECHtVJFzPgFP3SXLzwrDrEFzMiNikTDbHqB45j
	ExCnlozvj5s/1tWfHQSI8Jz8LK5oVy+ZeWmah9bcEjOmLinTYi268AB4+KyA4sabuXoG9DMaFQ0
	ObVTD2KeAuv0nuwn/yMRrwLOyfaOgmiG9CK0Jeq0jbF43VhnEehTh7J22D3ENwADhGkvRrc5MRu
	2zGw==
X-Gm-Gg: AY/fxX4jsIyAz6Oh4wXyfR6w7sEbgMT/nAr23fEpeCeH76a1Hspv48lnygQ1L0n9wKy
	0Zmf/maoCrAF7O0OkbR58jlA4tGi8HDZZv9arAZuVSeGyAEWYdwt/8AnRYADOTIAj24tr9lwG47
	Ym/l7EwIPmMOg7MyzbAW/uUPla3Cbyeg4N57aOtOZgq/IjAH5NF+VTvBRRdEKBDr9cTRuEHEoJG
	Llg++o+rHc45e1Wq8SbxRUTkCqNRqpzUDqv85T3OGfARO3FVpt4SV8oQwXYAwzOVNJXDZjTre/0
	Bs4A/ida1oImPUOS8coguDd2+TatTglIv672qWben1I+hVxjDPxZMVUM5l6teo3eu9Zt8AMJwMD
	g/u+BAMY/ZXkEUIoVEp61YCoktdnf3aD0vj7NZWssW8WM+v0w1wiIwuqd73WyboIwrICFLIBa1F
	mpBlhJ0cDTg1u9nCJ91freJSS/O9J/dg==
X-Received: by 2002:a17:902:ea10:b0:295:5da6:6011 with SMTP id d9443c01a7336-2a2f2202e57mr356267705ad.11.1767180636301;
        Wed, 31 Dec 2025 03:30:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHthg58OBNQG/Lt4JRwDWGGDzbSvGU/ATfkOZO4w2trkTgWW1svBGwDniNHui3fRK8h1zqsIw==
X-Received: by 2002:a17:902:ea10:b0:295:5da6:6011 with SMTP id d9443c01a7336-2a2f2202e57mr356267415ad.11.1767180635804;
        Wed, 31 Dec 2025 03:30:35 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66634sm328219835ad.12.2025.12.31.03.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 03:30:35 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: maz@kernel.org, tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: arm: Drop redundant node name restrictions
Date: Wed, 31 Dec 2025 17:00:26 +0530
Message-Id: <20251231113026.2480092-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767180626; l=1390; i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject; bh=tQf77PodBdqmbolNBCutYqS5tt8KzbwybEq/MlTmp/M=; b=/7NEJLwAd/ctXb/QqKYMOgJmmsgB5b8b4yLqtitiiaD2g1v+aMRDtrwCneUo0Lcg2kGkCBQAT nbGpyYES5QgBBYHpyEJqGLoFhMN/Aa5udRZu81mcukWc/HmteV2UFVq
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519; pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=6955095d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JG_jA3zTBri8dChhomsA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwMSBTYWx0ZWRfXx5oQnQGH7X6K
 vSVsZUmUZKeeVnu2Z6uhxasfSHK01TaQIGlc9ravKt8Ns/jPC6HAELg7MPSudbAroFaPekQdKP8
 Ta6EXM5ckK2R/DYhlfl8iMmRzkiPdw6tW2uxiQNK/kfgYOtHmRowFhovW7q15XOHgwkpCWw8VWc
 yTmHpff5mSarmzTNKCLjaxnr25q8ilQnVpD1g7rtAumx1ba1MzqVh668ZEHfgct7hHyC2ut6CUQ
 ROWaGOqXhPC39U2oqyn1kp76Yf+b8Pz9Rk0MBUGup/ioNOeieXcNOtCC1J/WjkUBCIZtMgCb4xD
 tp7gen0+I8/EdjPpLxAK+nuBUuXrBlpZL0PkpYuf4osLOh4/+1EsZsWE4z+lEabjh9SsZp1ANX4
 1ZN0Y/N5ihczmk85Io0Mc//2o71dCTyal/vxZ2D4OhSRlK/9g7+pleRrEBxTbVMMY6tseGmYYo3
 2ABExi5Q1srDV6n5HgQ==
X-Proofpoint-GUID: R_10zkH3DsVEGtpJNUfLYMeFiz6vawl_
X-Proofpoint-ORIG-GUID: R_10zkH3DsVEGtpJNUfLYMeFiz6vawl_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_033039_004912_57D075AF 
X-CRM114-Status: GOOD (  12.80  )
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

Drop the redundant 'false' patterns so that allowed names
('msi-controller', 'gic-its', and 'interrupt-controller') work as intended

GICv3 binding currently disallows child nodes named 'gic-its@' and
'interrupt-controller@' via patternProperties set to 'false'. However,
these names are already permitted (though not preferred) by a subsequent
pattern that applies the correct schema.

Since the 'false' patterns take precedence, valid nodes such as
'gic-its@<addr>' and 'interrupt-controller@<addr>' fail dtbs_check with
"False schema does not allow" errors

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/arm,gic-v3.yaml    | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
index bfd30aae682b..462305f8047d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
@@ -186,8 +186,6 @@ required:
   - reg
 
 patternProperties:
-  "^gic-its@": false
-  "^interrupt-controller@[0-9a-f]+$": false
   # msi-controller is preferred, but allow other names
   "^(msi-controller|gic-its|interrupt-controller)@[0-9a-f]+$":
     type: object
-- 
2.34.1


