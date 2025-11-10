Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4B1CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=; b=i9MT8bnvZszPZc9UGcjsj8Osqk
	waBw7JD4ZVSP2xEbSEzlhfogztLCGYS5Dfb9LtTtbZfHuf0E++QY1WqZe6HDRtTEoPkfc2WX7SFtT
	/JQqUm2qhUuxCBCwmrX98sxV4FHHjprOZIXeIVGfC+Dg2fixIig90LmKWWzoGm43pUq0F/tvpYrBn
	w79kQdznkdenQ41N+jlCnec5/CmTii36aECFTGS81opAc1qbcs6SsZtsHL1QKXweg5ZwJvJx+rLGS
	8nGwrJgHnmpJ6+mE7ee0cC5HJg4BcR6PBHnDnzbqCzavv33b4a6z7bRK8CxaPX4jP5L77Ym/bDMi7
	97itcCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUwm-00000005px5-2YzI;
	Mon, 10 Nov 2025 16:40:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUwe-00000005pqV-1Pdo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:40:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGIpEs2992484
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=; b=mfb5RfcMzuKHoEwN
	bE/7sAthi6igUtT7/JkWPEeev5XN9rHHFoloGCk0VSPlSTJG/dFXReEi9t/AFBwF
	rLZOEj5lM0LS5lQodxix27ElTFsUVSWdWpfmnn0RI2jvTQB1wyMIgul1RZmgYMNX
	9rP9bkQNkRJEz4VpaQgvOBKccWu5MbtL1J8lX2xtbaws10fA2Zng1C49+WajOKC3
	ZghEAo8v/AcssjoShvDRK9kH66nbQ+SZsP4d71kPVOoCbMlwdNpKrQC3jhjDbrRs
	M+y7S8EKKJQTlh7J1QFtJij2Nhtgxngc65a8UVrLyawJGF4EKvPz7jU8rxty20MU
	UvZ+hA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88sb00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:40:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3436d53e990so2095058a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 08:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792843; x=1763397643; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
        b=EE6/5JAZpYE5jOiK33BfU02Zw6DJtdPZDLHtGXGg7JsIDJa5IMjYKvsFR9jGx/IC9n
         MYrwcJGe5d3LOvHsMoO2Kh7tc/mKLth0HBi+Ltb+BRf89gcqrWh9FuExVK7OW4CYJbMh
         sksZlRLHMsT70kuCRkbsZb5IdnV9ERi+gsXWco8wFDcn+4m66uAAomgT5cM2b8JWnmIn
         XycXiwh2kofEZrqMSUw541SbI0JlMY+1CcrfHhhaBkD04/NucutAFkoXWKbkafkSe8DB
         +5fw8l1qUAuoOBjb8yu+YPT3eeHaRhIy+EMRQmQFLhwQLC/4vfZWRY4WCqNw+ahC1nZx
         s41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792843; x=1763397643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
        b=a3zCXW4p3lNhm+dOCVq2sOFmuw415xcXtcOx90bnBm/ZC+LFW+mzsC+O1G3e52RA8L
         E5d6zIKViRDm9bUteAPQbu1024pN4qiiGDev8iQol1/zGPotcVvqh6AkISch1i/x8mVR
         QDIBlLNPvo0doKdBgbkLoMaTO31XOEH7v2d+Kqw54EGJLnebNz/UNnFBPmJDIRRZMQQX
         m12ikJTteAGFC9ghGUmuPPd3OR5hmYSZpOBqsqUx5MVK9AYpDrsi4upKCIuhqIxj9tcq
         AXcAMVO1+tncXaYfZa7wnvJQLwftssgLq171BTHDd6kSrQRLxvPfC0mExbaL+hqw+aqI
         3Xww==
X-Forwarded-Encrypted: i=1; AJvYcCVn6YloXHADn8aarVlFJHXs0t14TP4n0l1UCdUpKdKhcMoTxX+TCsQSOwvxFNJFCqw2SO+wbkNwFjGhzQHNVM0C@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9onei9W/D4Mh0RWXibugilHikAtYRNEjknWBgn+bQES5Ly+Gd
	U0OC4OAFkqr0SzX36zQD9XM11Y8UvrxDP4QkOCJFGQg1iMAraHsElTFSlh/pEs22LqFDoOaR2Hz
	3XzvJrLCwiT8sgzSs72eev8UAJQ1FlaG4YRm5jK04ImcfeJkItX2pDZk7P0Z/7aenTTo77HihKq
	M4rQ==
X-Gm-Gg: ASbGncspsvnXtZ4lo4RHzD5Ip80/oGIxl2WqEDnXaL/ufmKQADObLdj7SRJf4COPqUK
	c4ZvqH3vh4Iho3/Fb9oEJ5/PisQAwhdzgcsnIZca/a2aSaQhwHsj3bm/5KLWeCB+04exL3ALGoY
	60IVe/TtsOBFGj4oYKeDAasi7qLOZcR8ooUAlqyIUVQ3uri2GUNC/ZZvlww8BRFj9gosV+65ZZ/
	IoRJF/NfkBzdja574qfH31g0+rJXJr5Ydh+D697+pk1SZE4V/pSswrDw86Gmli8TtLyUCskDEo4
	JDkndnCe/NtWDhhweeCEeAjEBR25NkFd2M6aOuZPQNZYmnCuF7QcEPhf4YNrE9B36HBRVLD7nw8
	A1w/OFOVla0mvO975hNczuFQ=
X-Received: by 2002:a17:90b:3bcb:b0:340:b152:efe7 with SMTP id 98e67ed59e1d1-3436cb91d57mr10342281a91.11.1762792842942;
        Mon, 10 Nov 2025 08:40:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKgiLlV4ge4N7aykjwSwNvV4o0Enwd4Uv2Fhb5/BsT0fXjzUdfmFl0uh16HkMMpYGhsNkY5A==
X-Received: by 2002:a17:90b:3bcb:b0:340:b152:efe7 with SMTP id 98e67ed59e1d1-3436cb91d57mr10342217a91.11.1762792842430;
        Mon, 10 Nov 2025 08:40:42 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:40:42 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:25 +0530
Subject: [PATCH v2 19/21] dt-bindings: display/msm/gmu: Add Adreno 840 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-19-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=1792;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NcxT59isJ8a73ABBo5632Wjovo4V8SjmsWcRhDa2gQw=;
 b=eQNZUxkw5igOzSHswIKdod1+5/8HKSYuY9+tGDZhsMU72Rcrco55Fm5uE0tPCMdIF2KWAnNZM
 /YOiz8V/KyiDqaG+09P3D1DWGc74RvvkXZCpIovZE2CAEjx+EVlVC6f
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: -Ea2Jn6LAxYeJMyTti7LGFuoJc2BhNNq
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=6912158b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=e8idWDajkKX97RI96f4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX07qncmxr39p1
 LR/93SNmfzR9nfDdnXxtwcezQWHdMr3m/JMg6oGvRyEWGZ4b+mQK/2eDjtt4zlZTuI0N6OdB1/2
 J5uccwr6IHJQRgMgmhpRIe4PHtE9c5orxI9xYmG8kLYuIyeg6Ze0uxvZp9HBIOjdIaurqQYGm3L
 SJPb+LDxquUqKJdIFjAMSstqv9bDZZzND8JsBlsLj8+tYJ9mICZyu1JvaQ0Hcy4/PRR+G2NNnGu
 F3ZnOh4KVEIahxJjP+FcNebey+mf76aETCYK9XXGzEp7WYUBbsFQU7V7mlattU96ZijzjHwxhGJ
 xRo14RxpL73Bu4CyekBYdMfBcFCh49vvWYJHJlcYn8TSWcreNVkHzujwDdIh+koGtanQNdASXCc
 JGPS0GkUhW+V3d0S/lMRx124j9pK8g==
X-Proofpoint-ORIG-GUID: -Ea2Jn6LAxYeJMyTti7LGFuoJc2BhNNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_084045_154755_AE0C3835 
X-CRM114-Status: GOOD (  13.44  )
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


