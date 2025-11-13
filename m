Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571A0CDB463
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=; b=AbAxZekaABoLenc+dZa83h2egt
	IuUIkniAKm1bs839Yu7gi0AH0XXakplbphi58iSvKNttkt7e7+RGoMRUlOii/5qE+Wl7egnyQMOVg
	mQon6ZToxn/Nlmqy83JnPWusksQW8B203ZTd/qqSYkm0Gquje0q1J0/LbZwMKqeUP81fh3ypwcYHC
	vQn8rIEHKpHqAf2/59WNAYCvIXGmmKJU2ALLaE2n88XkTnaBI0QyZLEz2+gbMXHxUMTdr2pclk/8D
	Fc9MW145WclZWUDnrhwaPySgYr585VvO1lw0yrwumJHQBKAYArltSMLHw1MyJwdP6k2nh1KF9WTsM
	lJUs0D0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgnY-0000000BHxD-07Nw;
	Thu, 13 Nov 2025 23:32:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgnS-0000000BHse-2NLf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:32:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb6S41694033
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=; b=a4d0xxhxjAelyvzC
	14qB1RZU5SzKhTR/+8uaIytjkRy615Ki7P82uR95s3soKwi8eYt4+fVbmC68iRZ1
	cbe/m4YgKDZ5Qr+q0IEYv0hqlcQu9CxDIb9C43JVtTCoaRId43Hisw5E0Q/n4KoN
	/EVgjaHKveYm7TrD2OA4QrJ61Gc2nG3OYuth7Zq6XZWaeHFImep4FTP3BYgGQL5k
	ALEDs0hgul8ieiSqAoIJFPE0N3Bm823Na8XfbUWBaZW9MNXm1/6gZLJhjaXo7NCK
	0+72Fh1qLvBCq/a70+gXsIdjmjsYEHHTPQfcd6B0klU/bo/daVsp9Rira1EA52W4
	9VeP+A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g04fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:32:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a26485fc5dso1377706b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 15:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076728; x=1763681528; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
        b=f5WBrde8IujdiXK+53Xd8/B6oGLemGw6BJFrgV+Bb122NdSYB8lGg6dMxwtHI/CF1s
         x90rEPQ6h2KICoy3KJqmjAbF3bxBUnZjEdnC9GAvZGdcd10FoPy+K1g6x4GMAEuPt5+X
         s9FPPHkXEAvJ7QVGblJ5F9fxt7Qn/knePGpqTFIcJljXLtdqDdyhFhT4ilqRimFZ+1/X
         4JLhg32b1j4szyvx7JLELF12IwRujBsrNU5t1UAmYBzAIahNHSAN9hfg1WSGjBUytVK9
         lcjJjrGAE8mZx2eOojCJfdmGi8XGBJtZvae1FsDB+03wxuvGWpZu39pHeOCMpKYdmVAd
         /gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076728; x=1763681528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
        b=k4eg/g/M/76Cv64BjKKoyYFgcvgCTb2ETFMJErkYWpETaJk4hIscIebYRoagbniqRd
         yKrBj0PGiPTmVQi6eFyu/pv81ubzhcy5BJ8qYYD75h6q+G2qnUaZkyqwXak6sLs5Gner
         QZZ8WdKqTSZ1fErEXvufK8jOA35NUgxBMe3rYSMYpmq+qB1BXE2JW0gedrRarYX0+Jp2
         3ElO4Ae4UGFs2B1xGoAbIqj7pgNHGPTCFmdzXzsKnx24GrHchXIuqcqv3hOCo6D5uyUZ
         ih00YWVbRBXN1mBf+WVtcNNSg5M0nNZRHt2m12RhPnu1GEWtZ1KATUd21ILoLz1fYHMq
         0Y9A==
X-Forwarded-Encrypted: i=1; AJvYcCVUyfGbMThFjecj7eh+CpfPdfoYd+J7ZS3TccAHtItvGjUzk3TaDHoxgMSkC+VYvGik5jcChdEZrhdYvS4uCu8r@lists.infradead.org
X-Gm-Message-State: AOJu0Yy22+xcHM4zoJp24bLGuF4q+6FQ2+epWph9VZ6o7euqbXtmBKKU
	m07BWaFxhPdFmortsj5J+ltj7JQFvFxwIZdcw4UkX1K6MH/EW+eDWO0++WP+uQfO5gOnkZ6G5X+
	Gu9W3czOCSUu8pu2r5mak/MFVogfL5q9ypfIEleJnrZsxSMnUzOR/S8PUVUkW92J+Z4kKDGlZ7u
	GGKA==
X-Gm-Gg: ASbGncusAEbI1sf/0nySQjwXF1FLCpB+HmcRZNqx1DMou4bVKUErmxxqH2G6p5VIBMA
	Dt5Gfvh4o2nV/zFyCrGsT3AyZAZr0MHIinqrez1vXCFAhg5NrQ8b0UNbSZpP8EM83THc+uVYibr
	Lvk8DcYupk76+lu0eXBt6X0+A9QVarj7MCsOrf0QkjvMUlsHl2jB2LeELJ6ya1RhFNJ6HfEroAR
	q18a1HA/6B6o1LLyZugSWiqoEDGMTMs8NGOR1EYOnf8pLvGjvW2ehg6O/Fu5uCo9+HmdQzGOVsk
	ARbjpFIF2EVZb5qE3bR62eEuYE7csmCq9VsWtsqaOCP3TRzE2WBarA8Ne9RZchabZcH83sFqKup
	7KiJCPYVDbzAvgHmbkCF698Q=
X-Received: by 2002:a05:6a20:6a05:b0:344:bf35:2bfa with SMTP id adf61e73a8af0-35ba22a50b8mr1324545637.33.1763076728243;
        Thu, 13 Nov 2025 15:32:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6uREXH/Pc10p/MC0DwkzSPYkXnu24e85a2vO48Pf1B0J1ZDbHns3wpDriZyiRRICYi3KciA==
X-Received: by 2002:a05:6a20:6a05:b0:344:bf35:2bfa with SMTP id adf61e73a8af0-35ba22a50b8mr1324510637.33.1763076727731;
        Thu, 13 Nov 2025 15:32:07 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:32:07 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:16 +0530
Subject: [PATCH v3 19/20] dt-bindings: display/msm/gmu: Add Adreno 840 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-19-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=1792;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NcxT59isJ8a73ABBo5632Wjovo4V8SjmsWcRhDa2gQw=;
 b=1I/n72yonmFfJu99nuC9pKcCGZtwySI6gaBDPVUw9OgLX+cy2aGKw/hC07Gf38Zy4Sr4ku1tk
 cZ+/e9WMsW/Bium1P82WjaCDgxrkdRPqz4svvg+Jow+9tYBM2ylPeAi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: _yaoeuTnudj1T0KRRMnha0Y6ELLj5_z4
X-Proofpoint-ORIG-GUID: _yaoeuTnudj1T0KRRMnha0Y6ELLj5_z4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX/gq8XyNf+Nmj
 lQPP2DccbD7yNdjtMZC9YF70vO9Yp1fivh8mGmuXcR7f2eLvAaRl1k7Wq9/3nnGoeXTMReocCf8
 OGWGTVmzWDA3h74NkMfjhzj0IfDCRNb5Zub+I5KB/ENSb2jtBtgJA9NNKzhTi4Wx0aC+bbU9aMD
 7YYBXR+Rmy99wry8GICbFCZoYXG+Nny5NcLldiRaN0EK958gqBMJWwnAS2HcB6wN/DP8VFZvFZ2
 nFe0aKTfMEtDrta9EnK7di2uQhNlXEAtCXyOd2zxd14DK6DmC2+2eTK/1oXxWK8SZgOIrcRD3Gf
 cWpIXqnWd64pky8U32eHU6+bC8fz0dzBwirYV542C0xUPGEv75Nj4+nJOtSaG/EkY3jbiWeYbjf
 oZ1K+b67QXfCr606pQsi10pn5xpaSQ==
X-Authority-Analysis: v=2.4 cv=IM8PywvG c=1 sm=1 tr=0 ts=69166a79 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=e8idWDajkKX97RI96f4A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_153210_842699_255AA780 
X-CRM114-Status: GOOD (  11.91  )
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


