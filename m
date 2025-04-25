Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD81C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhnk6SSgfomPmCfcGwVXghFWX4Fy/d/emuU0HBNmZgI=; b=VplkleVh6NFZ2e8VyYuANIJNkJ
	UGs/CWT8J5sw7/Ah8U6YMsV03eElYlI67IXiVSYyMoq2M6H0/Z0aVzz8lPLo0tNsRIzhfW/33V6Eu
	Wpx04pLGN5/JVrK2R6AMuS2PEjI/l6sdnxUV0Ake7y8tgOi6A0vg7U5g5C6mT0h9nrnAJTTZZ/3Hx
	2hfJGDD98Ng0TVJyESbnPPNMvZMEcWE9tkbq+A/5j7S4Z9l2rWrO1dxwWolqVwecYSHU7kvJnn4ou
	q7vGZh1u5usmFH80F8EM6707U+bR1cHW4JZr20ryc+pP0Xzd9T+HTIRUMxAIuDZ1DwLsOTXU+a8Pu
	5Oxu9s/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Nc0-00000000Vrb-1ytc;
	Fri, 25 Apr 2025 18:17:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N90-00000000Rcx-1w3S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 17:47:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwwF011522
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zhnk6SSgfomPmCfcGwVXghFWX4Fy/d/emuU0HBNmZgI=; b=AcyWkx4XzeiO9Il9
	s1j7pEUeaWfbuMvXnAv7+p97vGZvhiFH26iQhomeGjdvS+C6FMY5DSjJUFG/gf+a
	/j3tD0G5POLIfguBs/Pp1urdT50p9cubuycbsDMTobosEzzHIItHdF7/4zpyQkn8
	LCTDs4ZyoUUbCbBO5VYjKCgaazrnqJzBJc7yPF4lQd5fzCBdKMBcB4w0vBEoPClk
	Ya5/TuFbjyRv0MNAHeSzgbI6lp+nsdlTYySfV7n/VvVyNkwkJPCAuYLjjTFKa+fR
	TVbap5Tttx/tH3i4oAAswkXJQUMHo1tsIBgCDEEXnP+5jQux8dlUH/Ksg8lowWq7
	2Enyyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3stg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c95e424b62so245052185a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603241; x=1746208041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhnk6SSgfomPmCfcGwVXghFWX4Fy/d/emuU0HBNmZgI=;
        b=WjWSah798Y7rSoE6CZ+YyxiHuARmehxyEpnpWPAmEUcVzYwX/9lY+B7AA10ydsNAfh
         HFonzkcqlkTYA1xjtU8VeQDHI4Wmd5wg4cZvJHpX+o2vu9vGvN6fdOLUA3GYlFkDB7fb
         Li/l7J0l+A++fnmHPajKVXqx++miN+DtkMRnRt9YMnkmkQEJalN8TDHwUbYdw0DIV6+O
         JHG+yKuWeLlNSNtOHkdityLA2DCcPt6ITQDBI1/JIWoxFywcBjN7brPIalXyBTqzW3mz
         1vARErV9iCf7+qwvK2SOU2xwTJX/FR7DwN3okU1ICCRZSWGLbCokdq9MBAMWQJGc/Oqd
         +Bow==
X-Forwarded-Encrypted: i=1; AJvYcCVHjEjcdeo2RNMdGkm5dU8AxaXBVDT6Y/2ItRD1OGgRpdPLbehu57EB2/XiYMckdFB4hsRu9Jcgdn0fmLKTg9U7@lists.infradead.org
X-Gm-Message-State: AOJu0YwFi3/tKa7hipZMrYcq2cA5TTYOwmSNC0f31wJfjFydjL07z1Wx
	+Whgi5gcwVBrKN7ytR7WZzOcQNsPwG+R1BPc6HPfp+Sn4unbzvWLxlBPiY3GDZmG69eJ/ImMwNA
	oUUPz6QVMy+JWr89l/6iJ43/vCYNBG/TVZpXO39EmfcbzGfDhnguMx8xbNsKF0J+AdpXwERcMug
	==
X-Gm-Gg: ASbGncu5+65KMdGP2585uZPxzCAAbPptNWyykDMJYKnEAeusmM9Jqi9O6WYacuThXt/
	p20V0zfF8fQgd/9+sjC+fgJKGOkGFKN88jm5KeZeJY1evMwr7e294oweRkdI0L7qYNs6l96XpXV
	JcrayXrOBlCFQUB0HP/XiZ9YIIFpaAteVoUOP84MGMM1U7t3rNgBai4VoDgJPo4ICAmLKOI2Be1
	zunyiDQa92hEsStoIvr6j+dwVV23IJyV+LfVDG9nKXaEssTalCgZMkcxQ9c2+GP9zQdll5GCgt7
	H7uKBLVAx/TSSeyoYjhG8EqeKpWpjilpHrWpZleZvW7AKFIYcegWPwcs6+hyq8dYmwTkbhcjuU7
	aYRVArLSEZPr5PMHZaPZt3zj/
X-Received: by 2002:a05:620a:40ce:b0:7c9:230f:904a with SMTP id af79cd13be357-7c9585e1f74mr1027151885a.14.1745603240696;
        Fri, 25 Apr 2025 10:47:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF1OMILgqcMRBKDsI/gW82SYrhxky6zn26t5qp8XKhWVFRLacJKvCEjJhdpZqwtvrIl/ynpw==
X-Received: by 2002:a05:620a:40ce:b0:7c9:230f:904a with SMTP id af79cd13be357-7c9585e1f74mr1027146085a.14.1745603240078;
        Fri, 25 Apr 2025 10:47:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:06 +0300
Subject: [PATCH v3 06/11] dt-bindings: arm:
 arm,coresight-static-replicator: add optional clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-6-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1445;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5HBnCldiWHLrXedPtP0eh7tSY9v0q49sDGZQ3m9ia6s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qaZmynFljv4w6xMUGoHpAJkHDp5672WeqRE
 D/14aaybTOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmgAKCRCLPIo+Aiko
 1emIB/9l333ri39KxaMB53NlK1gyiMEjNLjnvFIEVAJxwCwhtYdqBrZgFgdToNy+ycpYzSTWq4l
 IRh4/aSli9s1i3reS7uGeOsM8lHpmTe18zlJwK92JCc5eT1D0H28FllNZYWXMidVH7JlUGSC5pU
 rRaSs1t0EtnDzl7gYiG/7gpPXz58ty0JN9u7elZHKCL8gAdKuMJCBlk9vgVG2NuAJqWPik9Egfi
 nVIKXQDYpmMGwVIcGHMTVcGLSE+s1YeM1UTTbiJSIwtdC/BbF1yTP67odyyWSIgC0MvqKd1MA8R
 kyrk6t+l50g3VsJ1Alv3LqrJx2BuIW0f2zm6MfDFmGyj6vkl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 72BmU2f5MW03m-yjwINP5yjNxXlUSI52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX3PtAMJskqGph fLJXHkE2bzfJfewQKfq/5UCyq2n/WBMQOuCmCYDpPB2SR38HHM2llJUQPSav85/ceKtcoFonrbR B1C8ghoMnYl6UFx+3zsFvKR5uxWTei8/uEAk2owMVj4SvzcSl3N3KvxEEsmzbjfxFJLUBXj5xKK
 ydndTpi0sL78ken/aQ9SjgowPy+yWpA5SXGfBJrtkKzmg5639s4K7i1jXy0HKJ0MrCc1sG8wCKt lKvWfNTqmDHrAdEej9AgxHJxWhO/cmWg5ts2EorcKc1Dk0jXGgVKO9CGbQsVckyQf4kJL0CNfMg EMipk6Ni34D2I/rFYrwbsKx6bfjN8/HdMQ3RxWet6CMQZSJOr+9P07UycDs1qJCGLi7LpVMwjIT
 obo3TR8FUBFq8rfRicshjMOqTjuX4z0pckzzSXabkr4C8YqpK3SyMaMmqFvLhXb7pYd4XSBf
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680bcaa9 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kFHV7R2MqMk9-nUzAmsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 72BmU2f5MW03m-yjwINP5yjNxXlUSI52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_104722_626242_EB690D01 
X-CRM114-Status: GOOD (  12.78  )
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

As most other CoreSight devices the replicator can use either of the
optional clocks. Document those optional clocks in the schema.
Additionally document the one-off case of Zynq-7000 platforms which uses
apb_pclk and two additional debug clocks.

Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/arm/arm,coresight-static-replicator.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..0c1017affbad2f03892b250ad864d9a5dc8d02f1 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -30,6 +30,19 @@ properties:
   power-domains:
     maxItems: 1
 
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    oneOf:
+      - items:
+          - enum: [apb_pclk, atclk]
+      - items: # Zynq-700
+          - const: apb_pclk
+          - const: dbg_trc
+          - const: dbg_apb
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false

-- 
2.39.5


