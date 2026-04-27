Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63DEFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mPZQf9l2Yx8cErRRrYkPxqjTtFZs4BkKr7pTWDEvXa0=; b=XDGp+zssy6tIy44ECAggbhXsCO
	sATW6sEG+xcAdIM+GZ0MfniTRZlhApQawHXLWDoCoWfSVWvxatQPqO0l3oU8XUhpSm/Db3f3whEjM
	8cI1oqY5K0Ja4l7/+iIEszCad/31jYJq47FUF6n9elCrAcCr5gJgbS7kqeh9kMvsRwWxuZdA7BKi0
	27cPRFV45xb8qD+8YHCbddTRlAZl11cJdGMNSmje9lldSAXYF/XnQQv/UBLfD0tGHvQ4go5275yMF
	1otHaZ4dZnsU2yXJMLnboKDjkK2/XxVtlO8zJOS+VsgtwrIuZ655ciz6m4hdIr2O5a9ptMV1XLG1N
	flXyfT9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQ5J-0000000HVtq-49VF;
	Mon, 27 Apr 2026 17:49:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQ5H-0000000HVtP-235Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:49:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RFLhZH3760914
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mPZQf9l2Yx8cErRRrYkPxqjTtFZs4BkKr7p
	TWDEvXa0=; b=JsoPaSWUEBLGINmiNmjpT59Op0tQVAupsQpgdMHLN06WzJJSZUj
	65ILntdgXa5ZYOf3BrMYD3mf+FoTSwriK0SCdrMP5zfgy6lJMS7bTcAkRPXxtGqv
	RdYck8wL7clfpQHuvtiCxBc+iRoG3UjMd7Pd86OdS+4yki4uxpwjCk0DOtX0wC1N
	n8mypiz9FLTlGTL3oko0frEClCLxpWJcAMYgEoJNtZsnMjc/vt3DMchNd3wSS8gy
	nhQhPIqweXHAfaEIfQ7GFkqvrGbGfEDIqKYCWO1sYL6eSOjX/wsRUT+TopzqCP6w
	ea0gSOSbQqPubtf0Rww2iqEBwqfa8NaLfnA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtacdrj96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:49:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adef9d486bso96220675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777312166; x=1777916966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mPZQf9l2Yx8cErRRrYkPxqjTtFZs4BkKr7pTWDEvXa0=;
        b=Eo4AwFCamhXsWaxl8kNeeNl14ImrPT//WiH5IVc63bgPbpurNNngqUN+/dUIZ+oywT
         GFE/u4S7yyMYp5nFFK9GdSBYAOdYltUkkRzbQprNR9Z3ZewZwF5UtLI2qIfTqtEduPoE
         szLPrUkaGaWJC48wLqksHI2gIV/y6s0XKAorKaT0c48v5HVjj15c6+eyStiNSIhR8zAf
         8jWg771Q9Cx1JQlRvVqYECkfnOEpR/Ur/lel7O7QKQ6EIlTJLGE3DgQwMzOAfcyZw5T9
         mtODZAQEzH4MOo6RlluPNJ4kiMXBtFvatpCwwtzsDDy7h0L73iFfWh14whUQRDuDXR0L
         e3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312166; x=1777916966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPZQf9l2Yx8cErRRrYkPxqjTtFZs4BkKr7pTWDEvXa0=;
        b=XNUEPRwPEQxS/viEGRFDlphtq65WdWiQastGmFlD4LO7Viz84x+ac2R+IpNVuzvooJ
         oYb3YIgyUQ9wTyU7Lhnj9jM/abn/W1eq8rMHWd9xtDBoFYcQe2o50ITOoXNpU0KJlrDj
         +gssuKf6a9Mv8AagGHjVUPVOO0GE28zTzHOhXm35w/sMJoy3WfPunmpNmWxTwVjO8poy
         Z2MsKY3jGDLN0K9uDpUNCWWzkzqcArx8/TGOzWyOAa10pdlPH5XfgooeBqcZ+y37JdJR
         8Cxs8GSyr9cpIsvfyMyPGXLYDMP+OxL+HnrRrpOJ6gpJff7sJAUfzQrHSzVBR57m27Kz
         kQdw==
X-Forwarded-Encrypted: i=1; AFNElJ9iwn6ocGAHMLAjVylUmHIji0E8qXaZ7rmkLHO0F6+fqODd/PW/1iR870PzxekyZCEuVlPa9rHqKLWGCnnT+tms@lists.infradead.org
X-Gm-Message-State: AOJu0YyiGNXKxcW2OR8kF3u0Ki84owOVdPHWDA9CpUaBWUf1nPKtB6Wb
	MVqcH6sEGlO2nv9QpQjuP5HujluwJdxpFjg/TmZOjz8tUaDN6ej7tfkim9EgoOYoxRixby8mHX3
	J7NzdNXDIbnMI1yP8Es2QwweWyZmlnswNBO4nLesiwzjcRt4KTWPmISqLbiEiU0Q8CWbv9mQm4i
	W2GQ==
X-Gm-Gg: AeBDievlRof72Spz3KF2Vx5iGzATCUBgSJMUwDz+nB1sFF35xX1mLa0HleDl0iJ2YZ6
	bHGvdO6uiu7AQ7qzmFF4MHyY9v/19dtiFWgKStMt5l/TkV/UUzCRpsIcKIU4filePhWk6eewdH4
	hUzZTAmf9c+njMKNdsoSXpn6H855tjnriinZ9ZfLo+jKW7MsG/o0KSGyRtbBl53rj/pAK1/pas1
	HIzWxqeEaL4jr9HIHNDBepp6WjdMayU0U/MHcwLOpHnhH1oyeefkxqLDDTYLmiKHqn/tB0y4yg8
	liRO7GNEBHNHF+YlMplLPnBKhU91vcCORZ+0uUr/pw5fXsLnggNEAn1b+XLlZSipihhx3APl4jS
	Jk8cBeLzsxE19+YyP11QzEUfaUSr9VTPEUolHH+Y2dgN7APl+CUOEl6Wrcf0=
X-Received: by 2002:a05:6a21:6d9c:b0:3a2:e8f1:b86d with SMTP id adf61e73a8af0-3a398df00bbmr395889637.31.1777312165781;
        Mon, 27 Apr 2026 10:49:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d9c:b0:3a2:e8f1:b86d with SMTP id adf61e73a8af0-3a398df00bbmr395849637.31.1777312165225;
        Mon, 27 Apr 2026 10:49:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f9dfc8sm27824123a12.12.2026.04.27.10.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:49:24 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robin Murphy <Robin.Murphy@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: arm-smmu: qcom: Add Hawi compatible for Application processor
Date: Mon, 27 Apr 2026 23:19:15 +0530
Message-ID: <20260427174915.3639641-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4OSBTYWx0ZWRfX3KBcIGox/Qov
 xecIXXtzsujSE4XCuzqOeM7pXOGa+RPr9E3M3y3VdHeOuogEZOggblURI6qS0gDsoBCUJCvPaBE
 zF4OSEBt0Jo21xP5tvpM1gnnK4WD+7mGc0i4kIlGG3cbw7EYI4IUeM6+FoQ66jD2aqwyDi2+lWB
 7bmeo4G/Z0jzfnTJxlfFccHe8Jy2LQttqHKDEG0/Md0sBPqdtLA7eodnAwpTemi1GNixHFaEyYU
 0zSXHbfy3k+Fg2+MByhe/cXv32d0B1yo+BjiEqxy08OqFz79qDx6uEzglO8BB1dAH2hVR+Rul5p
 3YpQet9xSsZKo5aLRO8j63xU6NFKa166F++H7cly8qOxDhButSdKB8NaX3eAG2xSmEqVo8PZ9Qp
 VZN04Y7fKUYjVru2MgqbPQKJEuKBQP+eDkuI10Uy6lRHNQ5eUPBNiadtDBSIe56k8tBEAH0D0ui
 OOJy/vCrBBbvKWx0B3Q==
X-Authority-Analysis: v=2.4 cv=QsduG1yd c=1 sm=1 tr=0 ts=69efa1a6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Fuqji3Hwj9YOp--83a4A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: _x2WtMFHuGfaF_Kfms0-H3-6F3hZAxLs
X-Proofpoint-ORIG-GUID: _x2WtMFHuGfaF_Kfms0-H3-6F3hZAxLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_104927_549386_D2A26BA2 
X-CRM114-Status: GOOD (  12.87  )
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

Commit 5e8323c3d528 ("dt-bindings: arm-smmu: qcom: Add compatible for
Hawi SoC") was intended for the APSS SMMU but was mistakenly placed
under the Adreno GPU SMMU section. Since that compatible is also valid
for the Hawi GPU SMMU, keep that commit as-is and add proper
documentation for the Hawi APSS SMMU here.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2: https://lore.kernel.org/lkml/20260422083329.885979-1-mukesh.ojha@oss.qualcomm.com/
 - Not a fix commit after discussion.
 - Not removing the earlier commit change instead add one for APSS
   SMMU.

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..07b71b347205 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
-- 
2.53.0


