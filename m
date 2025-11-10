Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00A3CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YW7kalD2buUlilIlPcd/kOSgkuR2289vzcuRgzPf1Wo=; b=BjvKY360++0pmv3FrzxaJe/dlh
	KucSEnMNcsafwE2v8kzeZD2DiN1njkEXgT0gFvW5W7Np+Y84i17fV9ROdZMZX9bxYskNxoWzzHy+O
	Ale+0a+LerJsA+RQWmFwcIhZMQ9CyWMQMZ1fpUD575+4WIKmnsxhP/8k5b7r5g7+41QF92XiZKZOw
	O6NpTnceUE9ieyzYMBlPAGy7w7B3UWRvX8T0VhRqMpgN9KgxDHGZdwqIBibwUxdos4Fahz2PQGU4i
	DRSnQhdll1ExmdmCjZPwBYltVswzrcWAFmZ0PkJBPQLzp3rTSdWHgPxn2lrU/AEfYTGMm5Uo6+QlL
	xKhMk2mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUwp-00000005pzB-0AmH;
	Mon, 10 Nov 2025 16:40:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUwm-00000005pwm-0a3l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:40:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACOJ7d2407325
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YW7kalD2buUlilIlPcd/kOSgkuR2289vzcuRgzPf1Wo=; b=LqDjD+AxC0ozDLV3
	DZesPF2KWyNxNUxlnx6q8UyFS2ZMJU28gRU0nLSP0MoiEEFfbh2eao9SZtrUl0sd
	e8DgOZAVM3ynTyOaFIwBkTrjN+Soh6oYgFKKnunmsBUnnhv0/e1ytARgQU7DRV5d
	XhgK1sZJ9eME5jmY0pDBXVk8ovbQnPmosf//dauSBmhReO5lV/BQwBpRzAdvK4sl
	E+G6+JJ3/DKp2R7kefUfAshI04MU9P5vViXA+Xm8TgUopVg8HURmMPcprBMEYbnf
	Mbbzlv4t4Y+4YzwquiDoGYYFTMfRk12JjwwHetWzIdsPxs2H1WP+gbNHRjezsgXm
	AlhY1w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abatd9v1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:40:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340bb1bf12aso7923478a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 08:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792851; x=1763397651; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YW7kalD2buUlilIlPcd/kOSgkuR2289vzcuRgzPf1Wo=;
        b=NejukvS3mKuJUqfgfnOkPh47T+suigOFi2VCIUaBSdz7QmXW4HszQ2DwMDqkhsOyy9
         7HQ/kekFQ/Q0jx/QpcozmzCvCQoQyWLjiJkLpvnzE2KpBWrhrsE+iJqacTslOgfMBUyi
         6cjvHU1ZXF9WQfdq7wgikrG2hN+aywmX7QViQeVLeAPN2GiA+difb72RXnjSGkqHNoU/
         L4B8vtw7IaDr7i1C8saioXv0s6MBZnqqKt8osrGDz/FcdUkobKsvyw8GUO2WylijDBTT
         dkqxGf9ktBRs1vgR/WKkMDWtudcEuGzgJzIyV9CC4rIRlgbafpOg52x/Em6MRirRvqU2
         aZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792851; x=1763397651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YW7kalD2buUlilIlPcd/kOSgkuR2289vzcuRgzPf1Wo=;
        b=mee1yI5HYAcHvzJNrdKWidEmvqMc1Td+9lw6rRSONot7l17bT7K9PGj8eM8NmExS1y
         7HYqor6C6YFeCpqiBtlTAptbAjz3KSBnB53CRRBpFWQqgZ+42fZF2RHyK5NZwNgYWMAL
         P3vS9O1TVtoOm+DglSEzJZLKLkHw679brXFlhcdtpaLzd8inWERTmb9u1lybLIAAr//f
         bRwJB9iusIPr6V3J0PCQDA5ZgOLVHaDUZ9UaBpLChqXGYTxp2APdyngTovUdNHqN8lxN
         NHO4sZjSy8S6QBxJEyXIy/7nL7Zx2dR0T6qa0heepijdpdjBPRrwjXpadS3ST53hNxGS
         akaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6W8JsQ6GNwZk5ep0Daau/1b8Uy5Kwjnnn7Dpn7wbL7q4Jz1h22q4GKhUz98igZ05XnklGE1LoHzu9zB8sPdwf@lists.infradead.org
X-Gm-Message-State: AOJu0YyfOyWzPYV4XJ6i6o0IrnMoR97/WwlhbyBB9+T+vWk7h8UG0/dC
	ykSzMruzO3buECOZ870ZKrtI/HW60mkwPigmdA7qnrK6tjLlPlAwtIsvnzC+TVjSDuG+sqCUq5L
	nDqzgqjZ8v/KxjZNrKr22GbPmzHzswozRYMThnDUBSe5h5eFLdko4v6atP81JvcjA+K37Gr2e+V
	gHBA==
X-Gm-Gg: ASbGnctVujusPQ8AYJ8x8UO4wW59x7Ze2maNIn8hx5d0zAzJd7tsTntj82AAa92b3MO
	MwjaWB/BwJVkZ4QONpc/9QeeyPt1rhMHiVGuH1BhZ9RbcgwUZ8c+3XwMDtr4cmcquF6dC3YakVy
	vNFyN49Ebl3ak32op0V0GQCZlyb10E6EWZv+LoCvrU1e8opLpByRLjIIMH+6a8WmIbtHoKGhswK
	GLPRrrCMWfEzQtbn838TH8g7PYUCYXRA28Q56s8noZWHDNUFK79gAyrHje81FtPYTbapuiS3kHm
	N60wtJlZ+dCBhHffuAxc9+E7ln6qHuCvRUrOJdUarjMaN/8CPAkqoE/hKffV7RBYCiR+mcJq32f
	UDYc5qMszexWRGzdgsIfXRQo=
X-Received: by 2002:a17:90b:3145:b0:340:e529:5572 with SMTP id 98e67ed59e1d1-3436cb118f4mr9615747a91.8.1762792850873;
        Mon, 10 Nov 2025 08:40:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9pMY9BOOQfsUqFBoMftON8+gbyhMo9vgaZeaC/P2wd397OdPBRxrPP6VrHlsLz8Ax5SqN6w==
X-Received: by 2002:a17:90b:3145:b0:340:e529:5572 with SMTP id 98e67ed59e1d1-3436cb118f4mr9615700a91.8.1762792850322;
        Mon, 10 Nov 2025 08:40:50 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:40:50 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:26 +0530
Subject: [PATCH v2 20/21] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-20-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=1613;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=i/XuvOyeT2JCaHOlG1NFL84HKMryUVDsLqPOa9zMe8U=;
 b=Rl0fX8fht+QUdLlWazjj2MS5zkr170ArJ5QP1nziu2DVWhQTh/19rZUXUtypkQfxsojWb1Q2h
 Ei7iatRwVopCf/T2t6JmwEaKOde31BcZ5fbInGGq30cfsAbYCW1oUR+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: VQQT58AdcvEwzLtuga8s1kSgamIDK08T
X-Authority-Analysis: v=2.4 cv=eZowvrEH c=1 sm=1 tr=0 ts=69121593 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_Uo5JhhLEGw40-SN2AoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: VQQT58AdcvEwzLtuga8s1kSgamIDK08T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfXzPN5MsKoA2n2
 5s/FqclDtXMXtpiYugnRbFSfnD4dVqslACtMd8WpMFRb6oX0PDsjRUzTphOIZ8GxxYw+UuD2KPf
 Y6eJz0PmqO9fJvrhmxDr/JH+xBOuIsCqnGuOturVtxddUimGxmMKNRh3z0w3u/CSLWxuXyhxkgz
 LsXOfoChO7OHk1R1TH/y56H6uzBxU6TEgI+CyYj7rcAJuD7WFGfJs8A3LrytFkBO+txI1JwGBRl
 b1EzJ0pbGI7o41GWUWOrIec1pzPUS+on8vg69K2PBcrcmXz+TcjeevtbVF95p+8A9tTvM37U0ew
 Tq/EgSqNWd/szGRXSZVNoW9no6OYhbrukez7X60RdIGM+GIQtUf09CUbOUmh9XFx8fAHPjPCzKg
 ngogQkhFUn97TPZX1A9neiAVGmj+Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_084052_197606_D553E648 
X-CRM114-Status: GOOD (  12.57  )
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

Document Adreno X2-85 GMU found in Glymur chipsets in the
dt-binding specification. It is very similar to Adreno 840
GMU with the additional requirement of RSCC HUB clock.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 2ef8fd7e9f52..e32056ae0f5d 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -327,6 +327,36 @@ allOf:
             - const: memnoc
             - const: hub
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-x285.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+            - description: GMU RSCC HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: hub
+            - const: rscc
+
   - if:
       properties:
         compatible:

-- 
2.51.0


