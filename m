Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98129C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=; b=tgioBnsVF0HPkLq5ZKi3boDWNI
	1Bdhd5zDl9pkTl6yJ5ctEp+nBAkh+aEPY9C928IREJvp19W1HMgfrr1MW9CRVMU0MuOXxGLZIPYBO
	rhNgjqt+dXEZJtHX/NPyLTL4z26rgc7Atef11xIOx8sD2I6CCK16jadh8+HbNNdn+mti6M2lkMP3v
	dJETiV1NzDQrB7ybjQy6m9L95i7blF2W+i9PGXWDzy2qTrJBsgpBeYKhktr4QM69ys6QPCBvnmWF2
	z3xlkMtV18zevBh/77FqpooKTDv5fogIEt3ecHqgr71HLGDqOHQs55LNJKUKz4bbMLjblypx4w5dU
	lLvPDapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkc0-00000007s09-0z8V;
	Fri, 03 Jul 2026 20:35:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkbx-00000007ryj-1Nb7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:35:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPRXv890134
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 20:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=; b=OomLeSBGdaXwW9nF
	k4zirJkKvIjQMNSCeeMHkgHg2Nu41+fTSH1hESfZCyqPqxPLdnBB6nyVzOsIP/1f
	npgRwIiurTWf0CEL6Q4jBVciA4VGbDTS9eCvC1/E1fOh+eaNJsRF/lSRshNXlsxB
	6pte5e140Wu3DOMLOzi5j74PoHdWQ+fRbH69UNzrVI/nOaQ/mRVRuorfoj4DlS7q
	aPbzZbNv8igCLD7FJa0Qx42Lwm2LKb7lsaBxh9pp95l5SHgjqdjWUe9cAJT0hmYy
	DSST4wfvfyJ8TwNN3aOfVPy66dRhq/kUMyzHieWnfmv0eXLU0R5jMx9FNZp2QMO+
	epyy/Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j030ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 20:35:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37e1f96b248so1552027a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110944; x=1783715744; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=HuoaTNyn+8Hok8pHOi6ZZ2gR3rCF7u8lkY+WT2UdFWWX41vKmO+xbWF4KhT5Aibi0J
         X1EFCoc/Y9C8Dgg+fKPfXPuAq1/EhNCAlyS1+I6YJ5LC5EdMudY6zOvewAC6ATjTKnoS
         CPMPavwlog20+GeiUteZSItD6NqfCzR5jR83eEbRxpH2MnAXTPBfEdCKEvB2xTpFy6ZJ
         yzSpo8uuCi5ad5AVkbGFfZxH33IzH2YAAUtuJOx7/k7/GZ4xd5ZT+OXv/wzS8wWNdCMp
         7OVhhbyEdz8j/IMjuKSGR7AuygwYWyrO25oHK/adC/mTSI4d2dyl0OvHl6aRA1iSSMSP
         mKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110944; x=1783715744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o57AaR11oY74r7NNNrEra2MutbnOlIvU5mENPfvHh4o=;
        b=KRNJYd5mVJwfX9KBkC/UwkVTKJtDLCUfSs2/BXKlD/0W8EvQ/iwExFlnVyvwhVIggZ
         JsliVV9AOIsCAdTRl+/diaIEyMYhECcHBiRdWbDHjShQgFVCE7u31ujaeyDCj+vCDizr
         qobdu93X8y8Pn2Kndx4M2g8phCOCCxKB4opRzqkqmSspEZIJJiVhyStZ4822+zySm2eE
         8b5Bwoty+lDu3FYK3pJ7/pxmYYvmX8fUDNN/iO5N3fOsYUbmICvP/P2TcIpRMvzXEqcw
         /1O/MXa7XwzW1Z6cAOxn2G2LpnPGXvJyG5KduqX+OKbcfvbgEiJI2mLEWjy1RMEpbhDe
         YVMg==
X-Forwarded-Encrypted: i=1; AHgh+RqfkfWwkoUueEv9KvbshSYqDTrOcEJjh8CsSwE+8FoywXgUL7Yhzuo/pf6voc61h9Z7NiM6ngVwomXr2p4PDDzf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi9elBIVkHSSZIPB6xjdOaq67JE6y5nyRskCgAfR2uw0StCNHV
	LoDnaIWLTOPYcNbYpm9FrqsX5kJ+hzDOqmbq/CfSHCnEDiSLsRRs+pfhmcHlJrUUv3qDpS3Xl+A
	/KHbxJa1Gb2HQkaYrtRq1nHMctt/Hq1s+Gp5FFK95EzXhU0Fx54XqF26ocaQo/3FyLFoXOi9yJL
	wpjQ==
X-Gm-Gg: AfdE7clp3KY9Yz9jCoMfl/yE7hwesvXzWy39U5Eiz6G+AIr11VhPxhVUnI6QxlqqGaZ
	1r84hYie60u4G8Muyb4cBTDerAP9glsYBxGX6Ia7/yijetIA5J+tEEfm+JSpQAzKr2VZA61+RP0
	qHt5zh4I6puT8QUmQQBivrKMF4OKKLSXOEmI0kE1dLL+TcAfmePfmye5IXgvP3WvhQggoYte4fD
	7CBc4vBd2rFBo072g97TVjWVs7YYexvkWXRurdSHmi/IwQA7ijAxNLw/iTHyek/0AZnGrU4Ih0/
	iQvV+TXfDrMk6QnqaoQPgsrRx54gXVwOsRg0z2Rjy0tZHr9zC5/kFhRBww2S/0LN0hk4T9EeuHQ
	qf60FD10ERANFGTfUH6YwZMbp9TJWeyDvQjo=
X-Received: by 2002:a17:90b:3808:b0:37f:9ce0:af31 with SMTP id 98e67ed59e1d1-3829f4e6e58mr957987a91.28.1783110944161;
        Fri, 03 Jul 2026 13:35:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3808:b0:37f:9ce0:af31 with SMTP id 98e67ed59e1d1-3829f4e6e58mr957959a91.28.1783110943675;
        Fri, 03 Jul 2026 13:35:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:35:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:29 +0530
Subject: [PATCH v4 3/9] dt-bindings: arm-smmu: Document GPU SMMU for Shikra
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-3-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=1298;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2jQmU1XEfwX7ksFDjORvPn6m0bWV65j9hgt3Tl3GEMo=;
 b=KNwcyIU5VqC/XQr4QH/U8KJlsgyT01EHf38v8j5tlJ2UjyZDi/yhU6ttLhTIayHlMRgIJ0PKZ
 lcgwcjlSFQYDI5rA10heEZb2fIAwdN9cVwv6HJVUEhVI+ZiVqtcHGSt
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 0IpuuJBZE6rTfvQrM8CT6NyhHBu7rgcr
X-Proofpoint-ORIG-GUID: 0IpuuJBZE6rTfvQrM8CT6NyhHBu7rgcr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX48AVpXD91Mas
 sguYJbIAOZWTuTN77y5atedTGBHsfpS9nY5E2Bk5PBFZztw8TdWnDNW1ArWfuT1sn1lEOmx77G3
 7dreT7hwpEtaKEL7NXVyAt4qBJlkirM=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a481d20 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX9zc/He4wG/F7
 jkqqhCJPwIv0OLgadj/9H7pVNyQbXVgd0It8wB25P7PwAcpenwd2tfs2Wi3ZuVTrBQz+6F1Q7vd
 oDLx9BWkHl+FIwVr02HryJMIjvYFQ24uKilZ5YxJLu2pH+o1/FKR8DaQ64c3vN6RN6CctM9/Smb
 NQ4gVyr/ck080yKV4c9YkC59T4bApEF5teGmHP56+ucB8B5jVpqsQrByURbewh9mgLXcPp8OsDM
 oseCcpzm18vYQmS2OG18iBfq2BNxFto+FhfFOoNQxjJFe4AYaHg6b61izwQUChUwbRr1sHgLloU
 4mV5LuYP1qZEHztb/KWfWqomxPbS5r3L5mEOo6/9JguC9upNv6PsuiDnKG5SA3b/+7rOWpTepbI
 Y8IK6BOKjU2G30EJAJheR1Q2ZWAokBG7sQg3HIfr7zd50KKMUuePKWvUDcWTZESLeCp0kBUIVKh
 /U6q/lhV2TFxvmpYxIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133545_380396_A3818667 
X-CRM114-Status: GOOD (  11.92  )
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
2.54.0


