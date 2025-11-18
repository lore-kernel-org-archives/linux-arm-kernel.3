Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AFACEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=; b=fEeHyRlKZ9nmsWptLspn79krn5
	7FplAs+lN3E5aMw6O0c2uDyZVRcZjRP/GoWNlhOi3S7BAmgCOEVyEZwo8NN4jPwb1KZSiplMNzI+f
	b34wKteCBbCReJeTY04t/+Hww4bxaI+qQ7nx7DIEpSvnU2RHLqkfBwbMcCxNCXLSW8hRE9E7pj9aQ
	VIoSS1H6YflGC2JV3/EuHJqFTe7U6ttCUKCReW2Kurt+r52sEQxC5Cz+XJ3GzThuxKwMTtE9sL9Zj
	zd0zlqhKMWHHtuwO654UiIUsBxUdlSyW7H89EpGZt//QS/1IKrPjDmgki0xXC/CdysSb9eHbXenqW
	AvAnkkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHTM-000000006dv-1QnM;
	Tue, 18 Nov 2025 08:54:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHTG-000000006Zc-0g88
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:53:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6dD7X623877
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=; b=acW4vh2C0OBfNK+0
	49zxa4PHlVX/A2qjaLVG/Ltde/DKv2Q8gYXmRe9mSmhL0WU44TeCRR+t1HZ3dSPg
	goarJ/7XHxjsCkDNpR4SmgxNJQwfRey9hFcQDQYG36ZVeNWSjsS4nxCstUQGGx7g
	WD+MbDEcOsXqJ9PUZfbZC2orkJqCu1oyF3hDhP8+qy+ocrDF1zck813KYG3sTxOD
	yqB8MTSbwq/TYvVvePacP2UB1gHNek3BIpXm1o2dJdx0OtuX3Oa5Y6ACWSu+4RZA
	uDZztcrI2M+P8rojhfCjits1PxtYkU+qcJau3x4/m7VGHFlz9Jg9UIxFG+HH0lkM
	qTF1nA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahf9ste-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:53:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-299ddb0269eso27185965ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763456033; x=1764060833; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
        b=Kddu2aAf6fBK5joRjaQvtEcBVX7G1OKb7l2V9B0uZfPBP2fSuVUzqYy5/Kwo4tvV3t
         kmB2icD68ckaKhYQeiDJDQIbnwFg857MYqmNYBKYGp4CWbbAgR4K70cjoeDZTNmirmPc
         qlmFqFSSUUhFtT/4YrG5n2P9ZtrZLMF4CaS+01aJcnEPs9CnmKiMo1u6R4uKHECycBSk
         EMg+okaRiKW4hV7vJfUh87ocyvngaoqdiCLsDa4+6Mux3QT3mV46Il7F0IehTrQEBQlX
         QueYz1RqegehHcwDWdG4bhm2a7m5DeKgx205HLZNbSkQYX3Jj+7kAenFecNNHitCBmGJ
         OneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763456033; x=1764060833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
        b=ZBTDVpLxP9Geq65m64HeNw9mmfQVZ5vNUGla1k9oUntTW4DldEGFx5CJtkg/7kaCxf
         /0hjMv0+na4PD7/NQPqIQKGNh8pDlpJlEL+77wYaY0gz76Au+06zh1IpJ7L9t/tsZdwm
         Da8zF36nU+TFa9oE5k2hq5MzmUyzrqwDX6uDQ9af8nAxKPZm2WmVWvZQCco1Whc9DbjC
         Ay9tDIbuRqR58SlJQ60xe73cciKFBlaH4vTjmUEQSLsBU7BDSNjHagnbqRZ5duf7I8HO
         pU5o12vGJBchxrWDy0toeAkIUGRdzJ7zk2y0RteOEfkRXdzJy4rz/x9RBsk/4iuBkVKG
         dLzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJbr0VxTqBRIhBHSlGzM7MOoGHwtIzGNwu/HTLG6fRoo/gqT3ymSoEQnUNwrETjJRsI9uM7ME9V/8ISNXfTdLM@lists.infradead.org
X-Gm-Message-State: AOJu0YzZHblRDnPiBiCxGIn8tDka9/5g/jO2NDRNOLYh+5tszkg+9SNb
	PaYlpcV8zyi9yxnYIGMijd5D4/OY9bIkDj0be86M6IXj8KAETV/ozNGa2QcxdiQyXghCWam+Lqj
	4hv7kYTsMbgB814EX423zgL+lgJXppBaIMDhqIWPdJrqaJo5H0y3/+8/Lp3/82fO9J9sLmxCcs4
	NSTQ==
X-Gm-Gg: ASbGnctCsKcfV5XNC1Pu7OS+SjLz2tiNgx27inhTun2c6FZs6NafhbYsv8XpTBpw7Rx
	03JHZvQtmgL0KOL2A1e799z8/DHOGW3ji9DMHqKGiT0QYL31M3DxEiFsiJ9Fl5y1Jy1QVUHgV5h
	ToL0VJAxX9xdp+zH/lteQbyVwRQlyizd7zIenRKr2IgXZLHLPecPANDbEBB8kzIARtwQJAARc2m
	oaN3JlOsP23VHtdZf7O+ASv7BEPMde0N7yWQOH8KaetUdT/NvIdia+/+K2y1A71k6s3BckDBbn/
	GO9K7ppOqDmUfHMr9eSUfSiAtqWMlKLZpbel9qNBOEOVnGFdDccFT8ZmqaPYBT4G2CeQA1yd8xx
	saG/lhW8S14WaLWIoJaWaRcQ=
X-Received: by 2002:a17:903:1a2e:b0:295:f508:9d32 with SMTP id d9443c01a7336-2986a733373mr199739915ad.37.1763456032917;
        Tue, 18 Nov 2025 00:53:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAYYS70u+Ee2zagd/j5aTO/ulost5I9qswBrR/l8KD04TpBbwpgzQvRoU7wV90gj86EvfwBQ==
X-Received: by 2002:a17:903:1a2e:b0:295:f508:9d32 with SMTP id d9443c01a7336-2986a733373mr199739635ad.37.1763456032365;
        Tue, 18 Nov 2025 00:53:52 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:53:52 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:47 +0530
Subject: [PATCH v4 20/22] dt-bindings: display/msm/gmu: Add Adreno 840 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-20-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1792;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NcxT59isJ8a73ABBo5632Wjovo4V8SjmsWcRhDa2gQw=;
 b=j7F8HzU/j38mbjoyk5aE6lcoDgwRxl8yKHoa/I9iVW6SXOUfEtgqkULnZ3q2RFEcVTcBHYZqN
 5H9tDBA4YdZBkuxB8GVxkab8xAf7MHBF8hHFiFj7sxlD9y89W4liF17
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX0wUmsKlicswD
 BOfLDLH2ZsjooXRZRoXiPdOqVa2JLmEb2LyZHggWVy2UCey5vsNDy7KeEF0+cpyyuomSseq/ATv
 PXuqpPH3vEbhwqZL0u2SI7NyvkmNfSfxeH+XHWFMbuLpXVbDMEvrtByUcaXmzlAjkWppw+5LZJF
 ijbymPWMOMFFvPs7YogMIB9RVFq9sTOlvjhOLCXXFBR3Qdv6Dy9xKgmYAQ+acZLeOHLIxvcxU1Y
 O0Q5cEi9ylRMqpka1twXAfdLH1tNhqArHcXqfBkGS+YpW9KK4XRL/8v+VnZYTiZa2upMWd0G6JE
 S4SAIn6WFmmafMYZmi4VWhCIlyWLVVZcgDZPWS9AfMP1OHD6neDwURvn9FKwyqKcFzkqifkMbCO
 Kv1iNFh7uZjvfel/teFm5xUU6iEckQ==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c3421 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=e8idWDajkKX97RI96f4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: KAFkx50rGlqnELAzyA5IQfV_yj2eBDME
X-Proofpoint-GUID: KAFkx50rGlqnELAzyA5IQfV_yj2eBDME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_005354_256769_75CE70BC 
X-CRM114-Status: GOOD (  12.77  )
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

Document Adreno 840 GMU in the dt-binding specification.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index afc187935744..2ef8fd7e9f52 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -21,7 +21,7 @@ properties:
   compatible:
     oneOf:
       - items:
-          - pattern: '^qcom,adreno-gmu-[67][0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-gmu-[6-8][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
       - items:
           - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
@@ -299,6 +299,34 @@ allOf:
       required:
         - qcom,qmp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-840.1
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
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: hub
+
   - if:
       properties:
         compatible:

-- 
2.51.0


