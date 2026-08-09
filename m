Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7C4C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1pPMazMPEW6NPGoSQF0dXImkD3ATvdg63Q5ta3NC/0=; b=ZbINTsCCJN+R7eB2LwSstdPHnK
	w9FkLdsAgyWTQsSu4LJzcoMtrG/vgOY9EUpZPp0BjCJkatkr88WWo1W18qf3iJ4IZSdBiOkMigrVS
	Rqbt91pJYMHArHMPM8H66pOzRxmG1yXPNSOMS0bX6Bpb8OqZHLMIWX6X4Q6e+ZIX3Q0BYuMfs5q9g
	0O8KvClhoU1EAAOce2iH3dV0K2lX6/Rx+EmOWODTZrl4e6aYwQOKe1DiKcQ2lM302yB5dUuAgoXPO
	5ByQrb1nZ07mkbjoks6lpNdMxkGkapZXDYm2+f7myqN01NQevi1mN4SDtz/020JTamnIo+Fm4JY0l
	0hrJjYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9w1-0000000Ae39-2U2p;
	Sun, 09 Aug 2026 20:15:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9vx-0000000Ae1p-1rz3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:15:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I9HqJ389499
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Aug 2026 20:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1pPMazMPEW6NPGoSQF0dXImkD3ATvdg63Q5ta3NC/0=; b=b05br5eEyxbjo2lB
	vkwKNNQkYLVBwgrvVl8DGcoNTzahrx4zULZnY4FieVVcnL7OBUkV0slm0WZDM9WU
	xfzg+n1NXrINvKMoEQa04DvH4SXANr2GxZqXQql8CYsSlly0lCN0NsbClVvFwlab
	9NtT61qkz7bgzvpALvJ+ouhZrND4iopLsqSbegoa0RpaWz7mufThhKUePLhWKJ/y
	kGIEfLWgqzvHPKFKT4bA4nQCdLIUKFv134hGSLH8AvO2uXXRGexUHBVDb/c3wqos
	U18odKwagBOInGCnvJoqMapVjY6z7QfzYJV0xDk02zle6E4kNxNJxtgecxaRZBsW
	K8saGw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwt5gkpna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 20:15:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90284139cceso30825176d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306548; x=1786911348; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1pPMazMPEW6NPGoSQF0dXImkD3ATvdg63Q5ta3NC/0=;
        b=EtccHXh0aumLE0pMOgFb6dlOFsulZiJ5uVnQrMMHztQO6aDYhI+u72e7kzB+de4XF1
         yWJy3B71AD6oXUyzw84Cw6ojsuoxzetb9+Ag+ZqPRNYVK12JMBMlNLxLbEhKCsEUvyhj
         Wmq5vUxgCBaCT3FwWf/fSl2HJMmINsUkDrBJEF+wNxClkUBCc10d79ZjTZzQjb98VB1a
         5AdCJX3e6zCmpE5+FEWKvqAj1nYMtsQcjR/IQe+8hlkM8VrJwR3kWj2PNskRUGms+I2d
         EbEltEFyzmj9TWFEWsD1fqGIFkTwsW4f2UD564LhnmNhQK14E0Sa61qEaCKT8eYHTVxo
         q8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306548; x=1786911348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1pPMazMPEW6NPGoSQF0dXImkD3ATvdg63Q5ta3NC/0=;
        b=Q6vit81QsqyWyQKaGhRj/HW5UVwcbUhZ7TktnZJOiW6EgA3NJ6hpwCXW4B/wEzm+El
         jPq8wCgpKvapC8sxznQYD4Wq0tzd00+IVjRZeC5BM6BXWsDGupc8hECLJVT0j7ReFBWM
         eKdgXjmHW1ibxVc0jUnuhaPE+9qay038n7sbAY5MMa1E0/ipgAYW6EfASb54e9Ob/bM4
         43dBNzle1COmZXXXBPBN/fXjFIbPpMFYAJBeLq3zzwZv6GvjUD/VyHiIfJltUBkkS9kM
         X3vKR6pBSQsW69p8f3OHVj0r5z/j/eEh5+1T0V7NG8nb3aoHKNhPn7v+TgYVBJnOZ6Ob
         uwaw==
X-Forwarded-Encrypted: i=1; AHgh+RqG3IOIXntbfKmWvp28WURgMjVOa3/YOC/i8zVR7j1XF1fid0d3PnqAdJd8vMzwBhopaZ4U0rFJWFlLlC7nfS2m@lists.infradead.org
X-Gm-Message-State: AOJu0YwLuYxvs+IEXU+IzkIpWDZZLClaEuMhII0ce4uUqMkkyINhCRMb
	a9EJXH8exhkHbE3BL6p0q2XiCGZm66w7HFqwsRTjgeo8sWRoaKqEMbpvQtLvoVrgApf7B9FsEoX
	Xri6/uRSJyuDGtpnRnH8vqk1WGN3A2eUhEdZ/RAy+7OBE2rMJcKwegl9ixEVdSpv5l3JzKzJ0O9
	oYNQ0xRo3yyA==
X-Gm-Gg: AR+sD13Zmptv4J7pwLhCSohF9YNFpQxMoA5ngmIzT6Jlu4JODWEXn3T9nfRLpM27dn7
	uj+IHtZ2sLpI+mwm4vyLgykSXQY/LFH0FyCOHYV959lrGFi+0CtJW9H6L2X2D+LK0Qgsl/1C5kQ
	3if6NHs9JQWhUvV7zSMnIAX2EggLEGKgRyGkqwSqksiFpA9uWsZqcQYz/uj1qwQZRhePuh93RXI
	77YfDfpSOZ5NYmHIL0C/Ht+kkABu+SYbOqHOclN0YhXYaP0HhrcyNJ8Xq7yE5JulzIuH6Ery93k
	0UwkPxQc1CQkL+prYR1gLGirO5S/5taXbAcXqBzZInnK4U7sq4K+sfanzDKK6XlUmxKAO/WcnDG
	fmE64Ln5SNBjjjg8FKAd2Rt9gVslvObk5bMmHoN0GHtgKQ1dA+VxRNZi5XRGfDjHzXVfQXYpQL3
	ad2ZT08J7S7vFZ6Q==
X-Received: by 2002:a05:6214:b6e:b0:908:598a:91d4 with SMTP id 6a1803df08f44-90a366e8fd0mr150744766d6.8.1786306547764;
        Sun, 09 Aug 2026 13:15:47 -0700 (PDT)
X-Received: by 2002:a05:6214:b6e:b0:908:598a:91d4 with SMTP id 6a1803df08f44-90a366e8fd0mr150744306d6.8.1786306547317;
        Sun, 09 Aug 2026 13:15:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:15:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:40 +0300
Subject: [PATCH 01/12] dt-bindings: iommu: qcom,iommu: document the MSM8974
 IOMMUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-1-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2499;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JQ9sc9byZNSc9Sh4d39mWgKgoacapHogPOICv0zdO3o=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1bF/bef/f3CDXK/+5ouUjU9mzw7PWi3SuSf6gyzdXl5q
 a2RK5Z0MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAin5rY/xd9c1TWm8y0y7lO
 2eOo2Yu1y/yuHEoNX2Zto5nZ8KhuXsUJnmK5KQt6LqSy+bJzTg1Y7HQ9O869RKL2xrmJwiy1fse
 Nm7bIuKqlCnJ/EjpmEHb6ifOB4L937O/veJHS25J9v0PxzOWbp5d86FbQlNGQ2V7ZpimdxPAyLJ
 91jUjnAd5Ve1aVnV2orPNJ7tunRHGWZVV6X9P9ZsfGar3TyZp86li9jLtfIhPbJh8+475rBZcv/
 cp6+t+0YwrXNL83ZRJc/Pr6rK9mbs5gexIleGFJiKSIrrTjikspP38Z3M1/wNY3g2PmJveU/z+N
 Vz2fXNrusrfKJk1cUDnofnyAsNb0ryUW/lZet1v5P5cAAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=c6Cbhx9l c=1 sm=1 tr=0 ts=6a78dff4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=MlIQwWTDgEZjFnBirR0A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfXywHwVQ6bOb1i
 OxwqiCJHf6GdvKjYNWWR146XbrvF4zLKUBF9gEx8dstS4JQCA967ATT/hgkVnuNtDKrnlNFs++d
 WKZ8NhD9cNEofPPM3tqXJUZwCkIr9CQ=
X-Proofpoint-ORIG-GUID: GcQE1Y4yTfDSNEzR4fwJPgqJwR2o89In
X-Proofpoint-GUID: GcQE1Y4yTfDSNEzR4fwJPgqJwR2o89In
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX3EIU/Y7nBcm4
 IulhAva4Lf3gbCPP8MncQ+5eECHBHgT0pM3lpcEFGaYWgaGtD6/HpcsL5Pz2Ahx2a4F/UgS/hZU
 n85dAbbzRFPgj9+SWzlVvuzDxR0Tjv8a+CXcJ3M4JuMb0aTI6kqvjOOcqJqc6Sb/m23n9vculja
 zqha78l673yBjtHVuncU92A7NRORI+xy+X2Ug7KjrSQyefjgaKZ3QZR81u1I33n3K7YaHTDfzY0
 xwptkjZaX7a0/l/sSpiFVU4dcdpsmDfNPz0AmCTkLtg/il0mmODwvC00jjOEROJcugxmvkjYxKv
 +JwlCDNXFs5XHR75DzlU/FA8IP63PhPq/5t6j5bmB5Sy6XoTDXjTkb+YsbNaS9ib3619VmI2Dsq
 AKqxt1tas+Ddo2aRJAkQdWB96xMnZwHOHHMU8BhwCSWfJ8nKeluzqH750FRc7mWYIONASkQ5GxC
 TcGHmUCA2y1rdttyBgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_131549_496163_70274061 
X-CRM114-Status: GOOD (  16.05  )
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

MSM8974 has several IOMMU instances, based on ARM SMMU v1 spec.
Nevertheless, the combination of implementation-specific registers and
the way TZ and hypervisor protect those instances make them not
compatible with the normal ARM SMMU programming sequences (nor with the
MSM8916 and later programming interfaces).

Add per-instance compatibles for the display, Venus and GPU MSM8974
IOMMU instances. The per-instance (rather than per-SoC) compatibles let
the driver carry the per-instance prefetch tuning tables and stream ID
maps, which are not derivable from the hardware. Document the extended
meaning of a missing qcom,iommu-secure-id and of reg on these instances.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
index 93a489025317..43dffe41e3b8 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
@@ -30,6 +30,10 @@ properties:
               - qcom,msm8953-iommu
               - qcom,msm8976-iommu
           - const: qcom,msm-iommu-v2
+      - enum:
+          - qcom,msm8974-gpu-iommu
+          - qcom,msm8974-mdp-iommu
+          - qcom,msm8974-venus-iommu
 
   clocks:
     minItems: 2
@@ -50,13 +54,23 @@ properties:
 
   reg:
     maxItems: 1
+    description:
+      For instances using the qcom,msm-iommu-v1/-v2 fallbacks, the
+      optional "SMMU local" register region used for interrupt routing
+      configuration. For instances with per-instance compatibles, the
+      SMMU global register space, used for stream mapping configuration
+      on non-secured instances and for the implementation-defined
+      prefetch registers on all instances.
 
   ranges: true
 
   qcom,iommu-secure-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      The SCM secure ID of the IOMMU instance.
+      The SCM secure ID of the IOMMU instance. When absent on instances
+      with per-instance compatibles, the instance is not managed by the
+      secure world and the OS programs the whole global register space
+      (stream mapping included) directly.
 
   '#address-cells':
     const: 1

-- 
2.47.3


