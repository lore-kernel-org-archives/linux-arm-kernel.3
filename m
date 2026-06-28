Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7A3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 18:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9p3oCZzvqstazXxppdDmSZcGrd5rTD5PgWo89uABCs=; b=UEu8pmP5uN2CZOisyPtgAf/NTV
	0EnlI2/J6wnzl3Pqzd0U9XZwbyTtKJ1ypFVxt4XjoxM+EMitrYsYsHYU3UaR0QnvF6+da5/1RXfof
	ZeGy4s7Y8QL9VrAT6SvScVcCAJ0YfBILNEvA+jlhawug/mNCXv0K7MImwj1U1EOQVH0Lqtbfe4z3H
	NBSJRN9k4zbK4MKZkxR++ssNEvVX2/Sim4zGWQs0FE8xR8JLMaSw7rWiKulF6Y1p1FQx7HIRR3PWD
	wr5etKrUJqxNLIZ/OguU1D9Eim5MKv3iC36XTKiG2ktWlwbRcFNkof2QAyv8Ev/VgPjo5WqTgdmV5
	8kO/XNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduBX-0000000DGqp-3l2j;
	Sun, 28 Jun 2026 18:24:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduBV-0000000DGpt-3O99
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 18:24:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHio1j416060
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9p3oCZzvqstazXxppdDmSZcGrd5rTD5PgWo89uABCs=; b=ilWAAZOfBhBzCFZb
	hQXPU2IHDPhZvPfe1PqWl8u9gK6zCsOvHAI8y+u9c9gtTG4jOQoJ4tpfm3sO6mEo
	xc30qaUKFlAz5+xqmZslKmMQCUEBN3yfMULQvChnGob2uZ8BBZ0EOkfLxgOjKiyZ
	UihblrL4LyigsylWQIX2SYXhLPcdo6Um4+Cu8JXfsZDJUb1CZEfQ+K+w63jU8tQv
	4FP2SNE87g6m7cFdAoQie1TWhOo4jgQN/++eGW+5+AADTpB7Ob2QEonVOFR8XTk5
	RmECGeVhcL+I7bioixGx3FOG3KFhWPR5ZPdbLBa5xwPcBVSmcGn9Mk0g35SJIhwr
	Jsg1bg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7u9d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:24:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bccca5620so3792655eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671089; x=1783275889; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9p3oCZzvqstazXxppdDmSZcGrd5rTD5PgWo89uABCs=;
        b=bJR9uA3qXpxTGtXJIcDseYESMeNX8D8LowJEA78vHc6aUNBBZu0c8gkRfcLRtxCi8M
         TqjkYEi39GT/w1Jxh/0s7iWw1B7Q44ftlfuy16pyK44M7hbTl7Z4+nDaOpqJRhvmcU9P
         Ym8aNjD5yR2wnlGd6RWM4MaYLV4m10AceLxNyv/gWQQ5MjoQXriBrloCQ0TbAITfbr/H
         NOzv7+5ZcpZ4FdPN/6aI8zcrDhPKUTNF4DtR3cniySfdNYqLvyNDH7ZMpTm7kuVzsTXy
         bYcIa6smr2AlEfQDhy0JLvbfZdDmVDpT3WlWvBzmQoeW1bgfIPN6icGxifL9zwASBuXU
         dsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671089; x=1783275889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9p3oCZzvqstazXxppdDmSZcGrd5rTD5PgWo89uABCs=;
        b=OhfbREoYsaEp6BpHH/wo4q9pfte2ZvLTpjGxewyalOoO25HcqLW/WUnYpu1QoDnKkO
         5B1IPNUyB5zlZOUEP72gQ9ha48HVEuCbi0LXmEIswKBzpC2pdnz1UsQVdEjRRYT3REFK
         0trfPAlIMClWv/hPI3/d+H7yGw3uLfIAkCmsxW+ioSl6WUZhZuJNWxbEYBkXYehM1ZcU
         T3h2Y/oAYleZrODhWleGPmxZjacakvQ5REs7GCRTTdkg7I/YnwRbRvdNe/V6XPhZt263
         gcIBxIg09ED4XgRDdKGgk2d4gE3BzTHn95KUbh7cBKKkYW1ei+qw/IaHODghuAt00aNR
         DC1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpCf7YF+DMsyjPDYjos4Q5+sgyEg1QmifX62mUuTKgo0AUMXPAtXuJo1phmn/xUGvBMkb+Cmj+Hqw85xqAH/jj7@lists.infradead.org
X-Gm-Message-State: AOJu0YyrNkYZRCr1fMPmWDaXU6D/Uas929F/jAO0TeFCUDczXWfUcTKh
	V37CM4DlDTCyl5+BlQ4BHqbs3mS2yHUX9uqKocyn9KMcSIrOgZ7P6jKqL4cPcYNzRM+Yh4xAWDa
	TuRkS3oehe2TiUKh6nTvdvpPUO8rC93zNkamB1OQ3TnP0Ib7ZVDhdYZLT4RBZtiiUjtLdg7xv4g
	O6Pw==
X-Gm-Gg: AfdE7cmkINaZFCC6zYewd1REanaK1baTb4Mw86508DDiYyvQ+aXPWyZJuJMgveZR/K3
	BJoj8vPai+H3za80+xyTNJoH3iV2yWopo58ye2Pm4qreEQm1DamI61g3k2lFiLVS+LiIiD1BZx5
	SGo/FGmhdwomdWfDv7OyI/jJAcs84R7u2PJK91kIAdW4XsPn+q2Binhf/HRAU6Enz3Xa8ngDSEJ
	4YN8GMNtNr4fGLiGO8hPcR3M6CjdSLE3B/5Q0VvA/f+/+K83WKS+3UvtammRdgCIBn3Fs5zB8bY
	rVDqMN5joa1OjauJY6G6R1WBp7r30H6zQOINcPotwSmA5MTwtGsihbXDFmHrNqWg+ovX3cjMCGe
	P3O597HLqGsANJsyw0IGz4y+o6aJvONDWb7Y=
X-Received: by 2002:a05:7301:6003:b0:307:91f9:c1d9 with SMTP id 5a478bee46e88-30c84f77b05mr14159300eec.29.1782671088544;
        Sun, 28 Jun 2026 11:24:48 -0700 (PDT)
X-Received: by 2002:a05:7301:6003:b0:307:91f9:c1d9 with SMTP id 5a478bee46e88-30c84f77b05mr14159282eec.29.1782671088092;
        Sun, 28 Jun 2026 11:24:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:24:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:56 +0530
Subject: [PATCH v3 3/8] dt-bindings: arm-smmu: Document GPU SMMU for Shikra
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-3-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=1298;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ab2FJciDIqw7/jxV1YWmBTVegZUhQ2SXaZRIypzuWaI=;
 b=DtAI8ypsLKBEX36oBYU18khootZJoi9iiNXb/fY1RbtwZTn86qyHcgIO51NjZJDUqackd5Lan
 UFQMxskGcxLBwd0K8GC7ROWRU2OWVZkcEAJqKGI7ITqTZV+Phs2p2eS
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX2SIj8fiIEq6l
 JhHvMfRJV6MzbqKXRif9e6i0MT9LnsDaUaPUc44glaLjnNpgTBOXvKt/6/ZexQx0RC0HDOpH3Cd
 2j6xwQ78bAQieiGGlGb2e9e9TqU8DgnL2l9j8L8Hyf10aAU0oQHdEOPHoaUvqmWzPaz21cT+aHN
 uPy+1046uLGCEmWx8G1yxo0552V665iz6odZvRqOkY/gi+U2bRZ9pHJLc0H7uXYN8dEM2kKwwsc
 p0gFRggKWH/ngnDeY8cUgskQmpmu7xGbkeFSmYM6XGYTTFqJ6GNsT+cquh6h67Rn/3Y+v6ceYuw
 2OZahkx+oSspSayJZ2hmXRQDV6vxPC04yFANhc+ah2AG+XKcOVG7Qzo3BavVI944ZwyhQKzfjaU
 4eEUegeU9dd6gXcOSo93jSFzva/83QgVXfXRWMwoEJDQ3Icc9l6gg90th8dbcbj1xAxRKaQ0Y9h
 bfINSqcteYSEFSkjL6g==
X-Proofpoint-GUID: wTmTsVD18RHMwrVFncMBsuIVtqjdvs37
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfXxoaQkMeWwzwJ
 cFEYYJ2M5IA1u9H5sIP97aVKjHo8C/VRbSBMRvlDoQe5QaIpNOBBnBsENlTGGDycDiSH34BEaR+
 mi60JuwsyIZj9xB//mmYSdtIx0O68qQ=
X-Proofpoint-ORIG-GUID: wTmTsVD18RHMwrVFncMBsuIVtqjdvs37
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a4166f1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_112449_858430_A122D301 
X-CRM114-Status: GOOD (  12.05  )
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

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add specific compatible strings to document the GPU SMMU present
in the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ad15fda5c25e 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -108,6 +108,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
+              - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
               - qcom,sm8150-smmu-500
@@ -543,6 +544,7 @@ allOf:
             - enum:
                 - qcom,milos-smmu-500
                 - qcom,sar2130p-smmu-500
+                - qcom,shikra-smmu-500
                 - qcom,sm8550-smmu-500
                 - qcom,sm8650-smmu-500
                 - qcom,x1e80100-smmu-500

-- 
2.51.0


