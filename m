Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1529BCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjfO9SOxMjcqAbIgumxNQ0k4LXx/d2l2hM63+y8xMpo=; b=DvqxwbDeXXi1IRgb0CTpedGdJE
	7z2oXj/kGQLL5pRiLpJM9WHb0r50OlNwLmEibDAlH+iwqh+8WufB4tfSzFZNNPebEouPnvbtkchah
	RE7eBuKs+FvPoQ6xklKHagb/CVAlxZFn04NHvfzrG6bHhXuW0gAebgdXf2KXRXV9o9rxmnEfXbUKp
	/l7wihlO2WAY/Wp3g44vRw/s0l5lxP3K+R5XP4ymIKZufL7o+SwQUjsRO69OX423GNeAajz6SAS7N
	viewQ/GfQYd4tkhjwkL5zAePYO4EpLwkC0MmtOcGuuwU3wPw8RHt1CxvcHmqnFV43rtHX/CcVtsTd
	dmu2PU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRsz8-00000002C7B-2dFm;
	Tue, 26 May 2026 14:42:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRsz4-00000002C57-3YF5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:42:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsVDR2385457
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjfO9SOxMjcqAbIgumxNQ0k4LXx/d2l2hM63+y8xMpo=; b=VXlAaWIwmJK5EYUI
	UkNs+7BBkpbO1UL0oXq+c0lLegdgaJC9cDD9iveZQAs9x6GLbsP5WmM2BPtNjjXy
	5qT+hqq/dxwDAMLR1hapv6QISvpJfbyEqH/IWvx0Bhs1UcvyKfDvUwhnONr5tTBe
	dRsll0eVDUw/4IJ6v6MB1l9TpZ1mKvTi4YLholuJbaP+Od02RhQB5H156G844wWh
	gF4H/8Xtbe1YlMIgtBzaArJFbdiYcq0AQ/1qLdJ+j4EGd0JOuaROltR/+NufQlFC
	XfsOQV3/aZ/IS1FhlxFbnEjXBjgxJKqCRAlF38KVdGgZr9frKMiGuH2esQksf5wS
	zL5GQw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs598k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:42:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso6315290b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806536; x=1780411336; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjfO9SOxMjcqAbIgumxNQ0k4LXx/d2l2hM63+y8xMpo=;
        b=jIvG+aF8g+JyGnWhQEjFargQ3y9lf6j78RWSSpOoLryo5Lye2JYZdANE/7/Ax+vTS0
         opcfJ4zH4wYBWPeALB/Igy+a1wKhn2m1yhkIm0J8rc1Q4sBISOEtTECiu/tOq5hQ+SA8
         vx6zxW3rmHWdu4J6Jn4oUaKhjB/slgpfNIRW12Zw9sINWtK7QWOfys10RBxJg+pdG3+e
         izKlhrz1hAhjq4+KjSeRfeF46oZncSgyCuREYvig7eH76oEioUExNv48xX5V1tHkaCwU
         V7u7tQLZ6FN092uISYNhX1gUZFs0HXlWkgiE4dWOjOk7/fPJj+E1/b/ZheJ/4DhQmVac
         5WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806536; x=1780411336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jjfO9SOxMjcqAbIgumxNQ0k4LXx/d2l2hM63+y8xMpo=;
        b=ArXL1lkHwLctjxEU0f5VFX2Y96lh2Yj5HZzN2dyT4cdwvEoXGbCrVEP94oE0xEFBrJ
         6hGd7eWf/KKHidvsFO8oM9bMl14NqZ2aG7hNe12P40oY48ew/Jf/k88bp917mt6nPo7O
         EgnqI5xo9OzKE6uH0vjqs4wOmKxoEoMEHTo2f150cW9CD6yHdWHBX7VVoGzm/axIcbh7
         LNZZ8ZZRhbUvsZ+IypqRuT5MZhq9mTLrfVkHoTII++NBFYsa3WDIzWr5sy3H4KTttLZ0
         Ql1o8v9+OfQR4A4vL+9vGxxCpNOY1b+GZTRRiv2FqT5uuHlPC1hgQ11N91VpyO0BQ5tg
         gs4Q==
X-Gm-Message-State: AOJu0YzJ4xznnE+dPao6E2lMsySDsO2eRLtE3f9/LQyiesOl53J9OgGq
	R0SJqTt6iABxZO28Nx5augkHRZvUIMa7Ocv+AmmL4PhEgFZQKr+0N/oba6LG45l0NLXiJ9tob5G
	0DigAOtaZKC9ZnuO38bTuZ0PWRJqSEUO28PbuJsH7h+HUV0qZhM9NGR3m1Zzl91cHf8YDa06K9K
	BLIL0VnrBrjw==
X-Gm-Gg: Acq92OGa2jIDYGcSV3xekW2u22Bu0qjt8brMhj2WK8qVD/zYYCdPAzOpo1wZBBda4AO
	wHGOHseZawpkvOi3wbXx5TK8Zr44WAwdkJneb06ykIwAUHXgDBIywM2mHX+tiIiHpUs72NnUmij
	g30rHVrKRGJRWi3vMtiB4tFrL9pGJ2G2EJtuUkJg2kzB9AW5RBs4w/H2cLxz2gljkdS5C/czsg+
	8AmIu6evfGpsO6yJBDgi04xUo1xagyR/xSuqnc1CZ7xBq9CmXdWdTTrI2s+HAiEZlahRzfeNIXr
	SJfU+2cEvTCkG+3M7cvhU5iYvWDhOO55+N60de7ongPzsH0QtIqgbHUDlhnJSiqx1mECtYLf51R
	H3HxnhIpsDfO+kAQdOCsZQh+WlYocnHCfzppkngYIfulPTK6rbOqb
X-Received: by 2002:a05:6a00:8c12:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-8415f32e8c8mr19004456b3a.27.1779806536441;
        Tue, 26 May 2026 07:42:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c12:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-8415f32e8c8mr19004412b3a.27.1779806535918;
        Tue, 26 May 2026 07:42:15 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:15 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:02 +0530
Subject: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806526; l=1894;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=hEmrpLF0MW67gYArKBeGVtgmYcIX/5PJzRk7wSNO0Vc=;
 b=gaaHTeaT5YX7h0T0xeiCVH4zAimV20AfMBwiZOwwyrQIHqghXmhre0IZwn4uUza43qcyBi++z
 8neeKvagCaEDa8iau4fEqoE+egqDn/IUaoJFNmaGYUy3FbRK4uKdxQq
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a15b149 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=h2u_PYqE-o0iKWOXq5gA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: f_iPgfj7TtSwfAc1ialtsmzuovTChf1K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX9YpOj0TlIPOi
 8vOPYbBdw9iYjEyVgdhmwihy5TLetr6MmHPw303eBzxv1Ve1GQ+hGgPTQPWw2CdRZQpTh4tgd+3
 bGm5giDLUHqMoltd5HVeJvQ6Agev1CFaoYJQsu1tEfgb5C7lVMa5JtnItf92Jofyz/Mg7tDS5x4
 qFg9gSU1YqQqm9M7rpSlRajp1OoxDxvf5Dq9tq653KRcA6isZAUY2tbzWHlkrxRmorfZWp3Gjbt
 VsvTSzPfBV9JgyT+QlPQvNIgJVVk5lFzBUeh4NYgwfD03ZWTDTVopMnOKw++04IZiM/fuKwT3hd
 nYd9e0mrCTQUEpJyCn8urprXhJeWmw9t9K5eVCroXHY4mMsoUtUg6NDhrBOz2bFpHS+DU92/IpH
 J9CXWnBgqKZeGhyGH89JA7Ns5g7RuDfIrrLGJvUqFrXd0l+ZpTvos9EI6nphi4tBDZ8G6bbhgpj
 CqgUwQHu1DtpOKBpkEg==
X-Proofpoint-ORIG-GUID: f_iPgfj7TtSwfAc1ialtsmzuovTChf1K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_074219_013794_98968BC4 
X-CRM114-Status: GOOD (  15.74  )
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

Some SoC implementations require a bandwidth vote on an interconnect
path before the SMMU register space is accessible. Add the optional
'interconnects' property to the binding to allow platform DT nodes
to describe this path.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -243,6 +243,13 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+    description:
+      Interconnect path to the SMMU register space. Required on SoCs
+      where the SMMU registers are only accessible after a bandwidth
+      vote has been placed on the interconnect fabric.
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
@@ -602,6 +609,26 @@ allOf:
         clock-names: false
         clocks: false
 
+  - if:
+      properties:
+        compatible:
+          items:
+            - enum:
+                - qcom,qcs615-smmu-500
+                - qcom,qcs8300-smmu-500
+                - qcom,sa8775p-smmu-500
+                - qcom,sc7280-smmu-500
+            - const: qcom,adreno-smmu
+            - const: qcom,smmu-500
+            - const: arm,mmu-500
+    then:
+      properties:
+        interconnects:
+          maxItems: 1
+    else:
+      properties:
+        interconnects: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1


