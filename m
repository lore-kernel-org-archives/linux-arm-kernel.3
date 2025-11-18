Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E993CEBF93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=; b=XEu+U6Qv7H3QEaazS1a8n5c3Bq
	4dLFD5YJjq3q97+GeWtp95gwcDcfdJKQpqNLscIe7I1VxKkPYnl4S3JSm76GuQL8DZKq3nPWQpq37
	xH9QejJuvoq+4zrA/yzBWHTXOY5vNJmVB5JJOyAle3zPsG2lQEw3fH2NsrGyMG2wWtheZpEoNAead
	08ddajoPmyKdRNSDp0g4SV2kt1rxciIL2OlMFFuu+BjBtjcXJZt9YzEtRB0RzpUd+MDAwT9IcbZ41
	Fw1+baC5fWVtz6NI6mc9bBf2A4dw78pG7j7/suduXai4VMppIrlITWjLudqcWd02Jhhx31zVbKveQ
	5Ig4ezrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHTP-000000006hm-3a8A;
	Tue, 18 Nov 2025 08:54:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHTO-000000006fq-0IkY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:54:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8VMvZ2249858
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=; b=nap4cjrQxREJ+aqK
	PMnvSbH2enVOsFMEJyhgwLWy24fFoEzavVDEgPpIkfjN8F9f/ZYSFxZgNbUB2EtM
	EUp2seF+tODO4xhwSfP3i/+/OFYSo7wc2lKhgoLEqnzXButwH+S78fcnjAI2JbYD
	Nv+il9pNolq6yf5W6DMSFVFSD3Xd+kLSAsx4SP3vQsMWqrX+EC0XDq7L37gJOmae
	gYcxjJnbNc9fha9vY1R4XLiTENeHb1ZUMZTXMf5VZg/6QI4XM13sbQCSdrEDsN9B
	obQcXXwVJB73dvRA9L7/boItF8/sbLgEBYlf/R6FJ363KSh5I0eQoOvSTzygwvQZ
	O0wyUw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnc5g21j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:54:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297f8a2ba9eso140816755ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763456041; x=1764060841; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=;
        b=Qd30nSj69ADDrWLcZVDWEuiZkzgrTgShA+h6W1j8ILpym3sARPp6fvXtKY0iDReI+8
         pwEddDPys8BrbiCTgVU+25cKgMRMJUTjN+a1/rJquPdSgatbwpeTZKTiQmtoxaa/kNdV
         IL415GZ+isGAu1VIXUvYD6fHBOgVjsh4gpFbH4EPRbSMVVExgWABSx0ebIM2xPyU7tnj
         1CpqtBkpoXSbadWRcSyEyRwC1USZZjbnO7Hz67oCycyXQp75U8hcHHgouT3DL6WHpyIX
         LeUbxaANiusjQ/3tgV7b2HtVJNdtuKFSf765SOFoi2ugN/aO9wn+xvdCDNX3wAkRS/vF
         DSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763456041; x=1764060841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=;
        b=lZcafdrx9Jy2nPxIIW31PtPqYtXrpHzvZ8Djgk7hA6AoVN0UHeCh53UC9vRvpg3X7B
         CH7O8YODzp6k4ReKCEF2OTDdM3PliBcueKH67LwUg8G3PSIgfXSrhoREtd2Xb/qJV4GC
         rvQVW/STqElBfk+7hSVfuo+umckh/xH+6LzAIKWYcugHM0gHewgVtpVgxBPFYMTEoZHy
         suM03aoyEM30SX4mwQ77POsZZA0eZB82nPC0H/NaPdPWcVb0gC7I6O9fv3BoxJN/sJXh
         TS4nLIxZb7CqvwMZilx74wc3lc7QwlXef/dVb67wEETE/FTM0VKRyr76L2YzIbDGtA2N
         n6rw==
X-Forwarded-Encrypted: i=1; AJvYcCUpJDlDuRdnrJ4cNDHfPuY0MGBJFZytBETJmHz/TP6fOb5lW7nISmqrRWbVgdA8DMwLnQ+gxmCV/2sd2g/aMQGQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwjtPQjZn7JuP2QgVf8b+c9hHf76tvukhS/tgrZjDexcTQWYitB
	XgGmWwck3a/XDMg62E/nrKdiWv7tblLPvrg5gcQx+XM+R2SP+iKTSYClDRVLchcOrQSw/2FTSZa
	UPWwIj7nUfiZ5ApbxGLHN+p9o+7FZ0XUmWOGMB2/P39Da/ciBqdqnLdaz/SjlUAlksj78IwsEZj
	A+Tw==
X-Gm-Gg: ASbGnctaAyUKok5RH5i298PofJLgAQvmFLjBPgf9zeXhvdvb5dGn84uqVgZGxhXI1I/
	Rflxmho6IDsu3tUIDgftIodQdpmFaHZbeZUmVmUa7n6844BZhnzNq0E6TVps2x8LlbVrSRd2JuQ
	LbSt0Ry/7qTZQyLrr0Xym929vQCtJlstlp2Wd718VVPYU+5HKP+4vnxmtwMvpUbiG95RoJU/a3q
	R8AW3IWSit3RFbSrFZAw7Ujitth1TBDpndm+sUBQbU1MEP2Qp5EcqdzA+qIc0fCDU2Ge9mcGHPw
	iNkD6Z/VW5FPTiVPLJlvfu0QjWncnB8H1TalnFnFsIW+1NG9VVzhwdNEWJzTfW8+avJPnGQyGl4
	cBjNLKol7FTMpDRuj7gKuryc=
X-Received: by 2002:a17:903:244a:b0:298:1422:510d with SMTP id d9443c01a7336-2986a7435cfmr202036445ad.48.1763456040680;
        Tue, 18 Nov 2025 00:54:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfC5w5rOHD0/xHuLdWAeU6V8QfxoC4sF9cyqENeOkg8O/0IIShO5Ep+df4JjWBBzLhi9J5rg==
X-Received: by 2002:a17:903:244a:b0:298:1422:510d with SMTP id d9443c01a7336-2986a7435cfmr202035865ad.48.1763456040119;
        Tue, 18 Nov 2025 00:54:00 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:53:59 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:48 +0530
Subject: [PATCH v4 21/22] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-21-86eeb8e93fb6@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1677;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=DBrZfc4GPezP/e0loWuAe+68GknA5/X9CxqWpGUm6+w=;
 b=zvvisBZ9CDm655u/GMKAP2PN/vQQB431xxPZEb3DHkoURhax7xrlKi9CfUl8Bnj4wPgFckzyS
 rVSm5NWKKI0C2AxbhYwWPl9F7iIfqVGVFQNNrX2VVi4eTv0FFh7U6BD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: IvsQM8W2OMf58wKw8Uubu0-Zf6nGJmHh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfXxs4IJu1nh2jX
 cxxvRn13OHK0Pda+7hEKpgone/KGMqwV0a7dQYJUd18aDe/gURgWoBxe2iwqkoyxh2z8FOvOk7o
 5T05hUnpnUjX6kVHYCAjMusASeo72OrcWRQbyp4LXMigRNT3BNFHV0b3ZeLjW5K4gV/6JCoDv6D
 d/2daZK3gSHEjlYvMYmMh/qhpdst/HkC+qVmvbNpiIR4st4Kq66x3KjzjEFMvb86AAURxFG8CjI
 I0Ft6pQAT48Uq8P+qBb90yCrCF8u/OKaaOYyW7PlBeeea5Ia/oRd9oOGRLpi6IW+bR5LOtsv+Dn
 uQWT931/OOy1jyICcaXw1qdCGQXeSaF1UaqpnLCzTI4IfzpmcnKCLDykml6ihsT8CD7cBed0YUF
 PjjKgm5DLq6/OJiKzUZrih9cmcVe5g==
X-Authority-Analysis: v=2.4 cv=BYTVE7t2 c=1 sm=1 tr=0 ts=691c3429 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_Uo5JhhLEGw40-SN2AoA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IvsQM8W2OMf58wKw8Uubu0-Zf6nGJmHh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_005402_134097_EFAF1020 
X-CRM114-Status: GOOD (  11.51  )
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


