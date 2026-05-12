Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD43CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 19:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6K3yheIQTvNblsixGApswikdFYlZRnnf5XfM5ye4b6k=; b=xau+7FuOcegfHJh53GMGbKcCh8
	EzSUZoet5DeSdVFc4EgFNQ+QMfv8ilWddaaBHt1v6oGNplWCC7GaXas1VLmwmroUX/h+En2V83XjH
	zirU5JUFe/h9bSpTATVNLXX1wYjGLq4Sg0YuYXcby2yh+EuOz+01WUe29A7IV9+KtstR4SUk7T76w
	BiqMmYW/9mxJbDHpXGxylnT8vnVm4fUL3eDJD1olMGEzzcM40gp6DtKkAtWkjGOV8xgxsVSybQROg
	XK+mL0e5CacmQF9PwBbgS8V5ZZh40mGO8RVW2QzTUbEg9dyYzMIXb+NDIowcdE9ax+o1vlEp6oRC9
	AWORZ+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMsgD-00000000CtH-3TPt;
	Tue, 12 May 2026 19:22:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMsgB-00000000Cry-1iw4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 19:22:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CFLWf93422487
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 19:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6K3yheIQTvNblsixGApswikdFYlZRnnf5XfM5ye4b6k=; b=mJakw1D6cVqieOmn
	f10Zv4ujgl/+bv8kijme+B507ip9cG5AQPru7SOfLm5m1mCzkjPRn/Zb9GskcdXW
	H/xmhPBw1TJ/925r2vDYSj1si4leuJm5zSAElbXAnBqsSxK/lCLpzlWIyQfkmRjl
	3v+XgfDYF3m4SFkTQLbDdEHavpFc415EpCk3IRfpaCVaUR+U7Ottq2v90qtT5h+E
	5K7farLe5Z0XEh4OAo3EXQbhg/rxjWXqBCU0RyMtYyTaSbyV/26JxALHR6mjkpEd
	mBn2v/G/JRgRU2pitgagSaMIn7wg6cBw4o+m5Du9/q71FgTOwJpplMzqCLWIV//H
	ZVakRw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9rycm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 19:22:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso18950925ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 12:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778613725; x=1779218525; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6K3yheIQTvNblsixGApswikdFYlZRnnf5XfM5ye4b6k=;
        b=Qwma1C3hwMKUSaoePtvSceK/DZJVcMicYOE7RjscTpQ1vm7JaOtMa+KF2f5xlZkouC
         YdxkIQ1ZxuecZTCjcfnbKr3v56azJq0xTvHli3C1Qfz9Lihq8nddtNWrB6jMgrfQpu91
         XMcA2r86b/xSZuGtwkwjYwJKMTBecaIL+jaavP6cNtyir2TTc9zs98AchjQf9rS2X+FS
         mARKrk+cMIwbNuzbhORMJkxqyiedY/6uOlD9OEyVPzL6C7y3qd8S8+PKZbfE3imTGCN+
         7pEhVoZOYXYYEAxLQ5eKh9FpuaIw7UHNXHs63xacjz0qgmFlfJ7TjOV//nl62SsoqodG
         0MDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778613725; x=1779218525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6K3yheIQTvNblsixGApswikdFYlZRnnf5XfM5ye4b6k=;
        b=hG2KaHdnbnCOW90NaIwOr3p/G9i4YBg9cZswcS7OHeeD1tHaMMtRqTJSo1KAVnvMFh
         LqWjMnUmCq9gnuIYiPnqSlFzk7BhEapIw0+nqgz29mkxMJlhnP8Tr6PQcUF858eH8vXF
         1/MqH984kQZM8hbw73K5kewSBVC3K5ciZ4qqrsVykUG71r/jhHWfR8pTu5CdTjtzyKfP
         Wop0YBHSr+e1rMysxXqqI7IhgPRICROMyLPmYl9grL+AbVuHsOxLdI0m0uqGpb4qwEVX
         IssusnLheuLKjoaonnz9hDEPl6wuwAraKISqXb/vbimceVVgJGLHr/69zlSXZoO9bZPt
         JWaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9B/a0aiXZ1AXmu8ZKbH3NDNrxXjYdZMX6tSXyuGaUcesas44jmA6TCdV1KzSXRzOF1cBNzp+1CtT8AiaJ6P3uh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0ZQ78AeiEfuym4VVGNpxYCbmrty6ThDwDCk/z7khzWV8iwcva
	VnuzVYNcp5vWCI2zldBnar7q4oE19Kj7bZpTmdbPsfjKj1s9CD5p770PqwbPMS4vfxswpEpf3Av
	HmqwI+Va+C2b3jtQRs1yyRTmghtHY3p8WGZlkLxU/Q3IcLy6s8z3mNHYBIGkU/kElVGoUxsIM91
	z/Kw==
X-Gm-Gg: Acq92OEbqtYRfOdGv1z+UcDvPLYBZLDmzHqkgYYY4z9cOjufOkgMSxKAODoJ0EXyBg1
	rr61/stJo5H8VqiHeWyGiSteGzj7vKGs3qJVHAXCIh6l8Lj5E2ExHtC4WeQRkdTqmh09oyow9jO
	VCjaZAAu2i3CTCxhgncIKVlhGS/cLm6cunW1Daae5YwvqH3MZSnnsGJcwt0fJ0ORhqxoREBM6mt
	3rxAi+PbSzYfKF70IvUE+uPgyL+9fKi9kGCUuo2h6roKPrMgLvkPdDw/qu1UWmlev8T7MPXQA4p
	TRmAOX+YUD6+OyxlGDktrEPMrwooPnUHOBV4SUOlqkUlOnvogMb2PeJascXrCxkF9Xi3cu7+DJW
	2lqRjrxSzbzDA4H5nmlV/EWX/VdXZuIAXFJTvuPkMpCBXLQ==
X-Received: by 2002:a17:902:70c8:b0:2ba:df8c:11d3 with SMTP id d9443c01a7336-2bd275d00a3mr2773175ad.32.1778613725153;
        Tue, 12 May 2026 12:22:05 -0700 (PDT)
X-Received: by 2002:a17:902:70c8:b0:2ba:df8c:11d3 with SMTP id d9443c01a7336-2bd275d00a3mr2772965ad.32.1778613724679;
        Tue, 12 May 2026 12:22:04 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm141250585ad.72.2026.05.12.12.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:22:04 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 00:51:19 +0530
Subject: [PATCH v4 2/6] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-glymur-gpu-dt-v4-2-f83832c3bc9a@oss.qualcomm.com>
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
In-Reply-To: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778613699; l=1607;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Mpr6Q33aJKvJH4hPu7N8/Msc5ivh6tKB28dTURNeqko=;
 b=Gx9R8cnM6dmWa7xP8HG35i9llcmnCvT54E/MmvyhWf9dgg+yrc2NmmfCLxs6WzuV6JSZJdKkD
 rwYBNyfDpaABoe22B55Lf5pwSwQzUZVwZXKhfFNU6SBGUwmDH0uqd6A
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIwMCBTYWx0ZWRfX1dmyJgB9+H79
 PdZB/4o4Mi+/nTDuHPdVtGWQVyN51X/tqfQVBMQlKu3+X+Y1FC7DO5Pk/RsZYh3COH4VZ+ULX6E
 0DsrzNIrmfBsvLWCJn+/OGrgKkyCrKorL+4Loxwz3fOM7Ow6/e6jtRFxZ0zXJBPrtb/NTNAAyo4
 QTtokuajgLPfHYbm4BRnvIjgSSLiVcnFzfARf/0Pi9rCIY1r0usswqEOg8QqGlfNNmq3cuDQnQ5
 mMsGGCsyHXDfmvpx00FUwZJh7qRznhckJEohxgdU8fDnEKc28KgH6iXAO31fCi8G2gv+EnnPTqI
 HqGFV5dqi475TheTiCGAJ+G4mkRly71lTwhv67vvwF2ROiUlUQ27WLch+cWBWTfx6iSQkRqydBx
 ncuWT7LzzBGi9wAHUw+Lp9c30HiTvT8BXAkxPPfH3bergp4DCE6Bb0U9g2mtfWR0Ew6//UPxZPd
 PT0wxRUE1+n9/erVm/w==
X-Proofpoint-GUID: VoPqUFWZ6LlKqyQyqkC_148bwJI3YOlK
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a037dde cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aapufVXKjK5bSyzaIfAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: VoPqUFWZ6LlKqyQyqkC_148bwJI3YOlK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_122207_571607_793228CB 
X-CRM114-Status: GOOD (  13.05  )
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

Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
It features a new slice architecture with 4 slices, significantly higher
bandwidth throughput compared to mobile counterparts, raytracing support,
and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
other improvements. Update the dt bindings documentation to describe this
GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 04b2328903ca..e67cd708dda2 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -411,6 +411,22 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-44070001
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+
   - if:
       properties:
         compatible:
@@ -434,6 +450,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node
       properties:

-- 
2.51.0


