Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41453CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 01:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8PC/2z6b1J/yxwlQIdPRi1d3K7LRrs3VyP+EIQ+Duw0=; b=fTcq76475WAyaG
	PX0FMC/Sf2KeUEjsKjOrnGWPIGJEwrPIhURtDdrrPiYLXqP87O6JKnpbFT7ykXwLFyCiM7RV3cnJ/
	QD9UaFQJUbV62f9Alg1cAO2C442rZiBC5l+BpbxswqqOFeS5s9kopbu1wXpMASzNufNbWvcgc1881
	fxCossVeGjV2IvZYWnm8otRQQjOC2dBIHFrVPr0MsFEJTnj4l+Tgs1OaS3AncPl22tIyR8G/D3wIs
	hXvOqTO/6a0L1wHb3fPMU0R2RBhah5iBhJ/jMIAMzGoTMw1ydRkeV/XgcLIDVYnzLJg2oXPaCtCjp
	2OGAvI9q1tiSYpZJvJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpG1-0000000EidU-26tI;
	Thu, 06 Nov 2025 01:57:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpFy-0000000Eid6-1d5J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 01:57:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KF5bs1688931
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Nov 2025 01:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8PC/2z6b1J/yxwlQIdPRi1
	d3K7LRrs3VyP+EIQ+Duw0=; b=N+OsXPQeij5LSyEG0IL+zwYpp4dUVf/1j653Ya
	kB8VOYeLVKq+/rGqwJbD5O7IidxvCnJYC1GyOWMTKzABLuRmvHv2H3eXATSfsLNg
	4A3RyGm0WOfHJUW821Fcf7xzB7mTSw8ujPUxwwVc59n3IuH1HAeRP12cvNBipWxO
	15pIgzW+nnCyLySeFb8F0ougNrOItxsTQ7uLDKGDiteZuvyCc2+pNVgvIfWz+utb
	082Y+PWVGrBpG8/uyL8hAM0cGdfvHHVYE0KMRyMwsnz2oIKKy9zJeDkpHSQ/fAKd
	0NxJ9WjkpBqRfrG8b9R9HI//+iM+E7S67enNbwIyAsU4crXA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a88pj9ur9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 01:57:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295093f614cso6746285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 17:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762394264; x=1762999064; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PC/2z6b1J/yxwlQIdPRi1d3K7LRrs3VyP+EIQ+Duw0=;
        b=Hy0LNnXdjdxi1BWTE1scozQgnPojlgKZhlYVZlGkcwu8qsSTWZUbEV3DzLBMn+oG8j
         8Xb/Grbo84tUguuvtTK1fkTQ1uB26IhUdaMiHmf+xZ6JDY7f38knA2udX0EamKBlVnaM
         ny79SKDt/5YpWgnjgP/3H2N1D2MpRc03j+MWtRT3XqgumMgxuWSnMFpuw/mvkp13P7Bk
         bwRGQ+2NyMdXKnWzXMdGnFInSJo+IYSq3KOWO3wTjwibz6Ef7WAZrp3p+u+L9NhblFym
         j6mBfl6Mg3xuxpCtRenhVxH3aKPDK7w7uq2DeSS1gT6vvNJvbNcDje0uf8p63o6hA8NX
         SG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762394264; x=1762999064;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PC/2z6b1J/yxwlQIdPRi1d3K7LRrs3VyP+EIQ+Duw0=;
        b=J9A9EuVTkFMjIO4ijMP79Ha6/tBnHBo/tzD7OuaLt3/FLD9QzfIxDZTPcUhN0fg8Lt
         HTXLN19ZDZbyTQHCDiDovdMVP7Z8dZtFOtvsExchRvshXmpiUoQwup28W31VPYwzZYC4
         qOdSNrL25nsgpaLb1k/I+sx8IaM9IPqOxM77V9PYoAGlHypuKLO/xSPWvrbJABGOSFUZ
         m0rSik71qN9H64fCpXlaEg9mkS4GJv6eowu7VO89/M0HGeHlcCwzGgpvHLjFtbb5F5c1
         5eSJlSpCQwTICaV7L4eKah/Xx5c95Gv3MJxLwn8ZPETLoG5rjbfsEIbeIISWo2ry3llU
         /G1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXd4V7xNf1OPx7EUVBkq2dpUB3BVHNm7BChhT3aWyZdzbHBRR362VxbaKQKFQ4oCD0A6/skDdQOGxiTW4P4mxUy@lists.infradead.org
X-Gm-Message-State: AOJu0YzVvfAjm48Spbc45rO2AUh0ssp42s2kDjHyN81COq6hOFj3RQrD
	DXzWOTlOhuSUmUX77VjYRRGQPJDDf4D7fofp9qwo00yAqszFjqENlH9Q9Fvr68QedLIAZJrAEP8
	p3Xn3lDHRN8VqphPRnxbrXmAWJYArCtfT2knq2b9v0mxt6OF2PM9aeYX8RChxOtw8RSKjbDTcU8
	cLCw==
X-Gm-Gg: ASbGncstukZ9wMLPR1f7JLHQt6EAp804hwLbjXezrqRaJupQFzZMIY0kqgv7YCYDuPr
	+2H1Ge+8r0GA/G0MQvxIHu9tqVOEWPUOePMgvXLxEQUjjb+31wbf7uJUpkRF2sbVchmcZrdN2MI
	nYFEBDhEYLgINNV76/8T+iFiZln7eRAdYCP8xxT//qdMiW8rQwbVOhyNCXnhKQ4HYnPfcRxRh3k
	6tnpk2b71rxrVN2q+vZFrDMcnwC1z6QE75+5K4QvdXP7iXNYysKiLYmFV6dvSPOWzcCqgkp3B35
	iNvyl2i0BvpyaAGcZ102WccP0DC9k2/AZu8TaKIiBL5prGJJ3CUYZbcChQr9GmtULWWrI/bNpcz
	o0Tzq7TOekU4bjqaMYXmY54uqGvurAvH4tVVVQAScZ12BsKSshi6wCoud8pK5cQ==
X-Received: by 2002:a17:902:d4cc:b0:295:6117:c597 with SMTP id d9443c01a7336-2965084026amr20185475ad.5.1762394264488;
        Wed, 05 Nov 2025 17:57:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmUGkZSvsUeTTnsilPJaPGGMkBkQb0ls+edvSO9i2m5uGuoNph4NlzwX5lLH6hyj7ACY4dBw==
X-Received: by 2002:a17:902:d4cc:b0:295:6117:c597 with SMTP id d9443c01a7336-2965084026amr20185125ad.5.1762394263979;
        Wed, 05 Nov 2025 17:57:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c93e5dsm9115725ad.81.2025.11.05.17.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 17:57:43 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable ETR and CTCU device for hamoa
Date: Thu, 06 Nov 2025 09:57:24 +0800
Message-Id: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIYADGkC/42PQW7DIBBFr2KxLhEMpjZe9R5VFgMMNVJsErCtR
 FHuXhKr7babkf5o9N+8OyuUIxU2NHeWaYslprkGeGuYG3H+Ih59zQwEaClFy2lGeyJOS+Y4e+4
 Wt/KQMh9xSsi1d63RhlrVE6sd50whXl/9n8eax1iWlG8v3Caf2/82b5ILjkFrcMEaAe4jlXK4r
 HhyaZoOdbDjYydmuqxVZNmxfx5Va2epH9YvY0ozusSFt6DB+yCkGLb2aWCx1LuKiMvQmB6UBGG
 E6bp3ax3qHpXTmoIM0PnWQK+cDKq+8vgGEN1qAFsBAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762394259; l=1207;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=t6ULjax0uh7L+bPG7+WgBNnKAukjdK5N+1IRTLoMutY=;
 b=Np7STajOLOX3KQaJcttBtap2LpgDeSchLLIDNb6bsujzOUj82lg/iKtHRsnIm3rwBMT9KJjtq
 Sv+i7n32bgqDpljDCfLrn/Q+P90o4FwEDxJyJOtwcGA7Tva6cA/iRHb
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: ck5UXw-jqBI0Miq-JMYDup9mv-0KmR2T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAxNSBTYWx0ZWRfX1L3NegmKm3O4
 lV8I8zX7zbsGVWGu73CfOoWC7PT7u4M7j31aFEa1rWoG6XUpwea8pTmecQnJvEljP1jT4hCenrO
 NbNqkHhRBEJmFRlhrX2cetxvQt/Jr4cvV6rMV4OWu4IeyT8sB2XpOZQuJZBq5R1HEMmBOP/9ZDK
 /16l3JAwbfA2evMZ5pLIRrPkgtIJEvxqnD2jt0gODLwf3IHyyu0K07cu0Zrbl2D8DRuNXmk0xRk
 d7bAoKp+iv8Mx4Sozs/khovx8/M4A4oGt/czoWeZEBmkJLauM9Bklkp19tOzaYtkB2tdPecqdjV
 +ypfpefJD8ysBkvd6UTpaFeNLDDF64ybnyU8XBmF4Sle5HQqcxeyw98ANcmR2kEJPRzASZvadyW
 Tw/yTPZ1uK4fGlbxLGnsPTkBsQNacg==
X-Proofpoint-ORIG-GUID: ck5UXw-jqBI0Miq-JMYDup9mv-0KmR2T
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=690c0099 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6fBNxW2ai29DZFBfugQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_175746_453027_68CC464A 
X-CRM114-Status: GOOD (  12.92  )
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

Enable support for ETR and CTCU devices on the Hamoa platform. The
newly added CTCU compatible will fallback to qcom,sa8775p-ctcu for device
probing.

Dependency of the binding patch:
https://lore.kernel.org/all/20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- fix space issue.
- Link to v1: https://lore.kernel.org/r/20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com

---
Jie Gan (2):
      dt-binding: arm: add CTCU device for hamoa
      arm64: dts: qcom: hamoa: enable ETR and CTCU devices

 .../bindings/arm/qcom,coresight-ctcu.yaml          |   1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 ++++++++++++++++++++-
 2 files changed, 160 insertions(+), 1 deletion(-)
---
base-commit: 9823120909776bbca58a3c55ef1f27d49283c1f3
change-id: 20251104-enable-etr-and-ctcu-for-hamoa-5dc4959e438e
prerequisite-change-id: 20251103-enable-ctcu-for-monaco-0db252ddf010:v4
prerequisite-patch-id: 24741288526740f3ac246613ce8398433d5c61c9
prerequisite-patch-id: b361d3a1a00bd5a94aef678c052e8728f7583339

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


