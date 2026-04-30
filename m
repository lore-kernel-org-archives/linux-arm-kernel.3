Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E007FFF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jiRe8cM1xmTVogAyyDIKzjsaynJQK1XUXAfnmLXh/uY=; b=T4IOJgkMquzyqaijwds9R9K2th
	2WBYg2rM+f0BnDULBKZqM4sKJtggFgmjT16GsmY7T39iO1jL+9+RRHTw+gf7tmSyWr20BOMyTKAVL
	Qgc8LURnPreYrzSgvYZdAt1ZBo6Zaxp5LTwqg3YnlKvF1ndhTb5FayFYk6/mPruSjAr/5yeNeUYO1
	fPd0J1xMjMob21slFfRbcPeirlQGWNEM8dvoCABna85tlgeZWCk1ORhn0p0c32JpeNX1s0jzEfaWD
	IzeAxHlAClhESRCbXwCvVY2+oPn4uilJ7ZzX1210av0C5RNqM6YPsaawFtLrWJewQucZWHK23tRn7
	QGv1pOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQRs-00000005SHa-0gxC;
	Thu, 30 Apr 2026 12:24:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQRp-00000005SGi-0vUz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 12:24:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UADoG5007714
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jiRe8cM1xmTVogAyyDIKzj
	saynJQK1XUXAfnmLXh/uY=; b=AQ2dFKLy8GjJTg2Z/P/g1YUNN/LGcctCHOufbT
	8PnOyK6P9bqyC/e20sJSNIBk+/59H34vBtIZ1XjbwqVrsiYhnBbfQCEK1XRq1V1P
	WhhYxSx55/J2hKuH0PAf1t3tEbhcBvF/Q4lKUl4GpEeb6WgCF2x9Er4qPswkRk2N
	lzhhsl0XFrrRaYtGNOvhyZLiHtnqVPW6oXHjDceoUa9NZlGbLKA39YZwdC1Voxc4
	FBAfLlLx9HEJrdGr5FGapPToZrp7+YRoMSjgqog5uPBEq4QuprymK0Ukl6ltt1LA
	WFVtkHDf8zLnXTyb9waJDV0bzQLMBE0Ibp3KyOQYah6An6Tw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv54w8me9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:24:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso1587332a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777551891; x=1778156691; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jiRe8cM1xmTVogAyyDIKzjsaynJQK1XUXAfnmLXh/uY=;
        b=Tsobt0XVJ1ACdyuIhrrDZqwHD7Fl3O+UHpLbwx2n6nmuRTmGa26dHg6S1PioUXLHSB
         l+u2eAXNoCnSKA56hlmQl8FAVErM/Aqg/m93eJlW+RpHCWqOVTTo/LdN0rFaSU0TD7ZO
         dQgKcGwFXS3jEhyYPqBYJb1U4uInJMgcOZKJQKey7Mh+3NRpR+muYGrnu0yKYfTF8QT3
         lU4CqjJLTxj+qP+TjDMfY7lWCsdZEAAQWArfhkdLU4V/UA2d3wl+1yjIAaPrrTeYXfYn
         udphapOvkQ2IZapFKzN+J+ANK85IGW0LPtsS9llijyEtJMeVkgmG7wb70nz/v0mEKIa3
         FO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777551891; x=1778156691;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiRe8cM1xmTVogAyyDIKzjsaynJQK1XUXAfnmLXh/uY=;
        b=EHlVOShemIgYQXmVUN0OjmbNfQEvGJeOhMxZxiMc7P4ZdA6iKX/xhMAiki3zQp9/VW
         MYwijq580PHKh2Hxw5/EK50JRuumiwq0JDaNpSJa3PvhZEVxeBZ7e+zsdwf57j1DdiR/
         RupWyjpBp0EMhuS3nOHVWpQZgv3PhArTUjOETcwWlXWDDV55Fgpge89t35iRLQtjFXCp
         6UYLWqxvQ5pVLc+Qg+ymAaPX8g1KFSpqJvYGORoZ6bkNzok6gs3BCGKuu3xsa4DMZUb2
         VsEGECMa/zDvChE+vTihd+Aee2uNSy5SemfR8oj3YepUJeZd46hUZcjhYLJJ05G96tnG
         HymQ==
X-Gm-Message-State: AOJu0Yyr+kz4TFGBFOvh2FsqtHV8vF9XMkzA1C1PwHfrQEEYh2PcZsFq
	5L7qS7BALlvr9cIF+hov1GCJG1TqybazoHpUQ7YsrbZjNUEQJfCys3LhaAEubb7tDnoc916Pawu
	lfJL9vsDXdn3NUT/hyD3M4WNTO4f4XiaouAHM7RmbtTjUEct9G9x8GpDvRnRQ5mB43JHY/xg/ta
	ywJQ==
X-Gm-Gg: AeBDietwFogTwMi0i3l+bPW7WfEnt2kjMG4B4sNgTPWYrYelI0S4u/xQwEM42XuTsVp
	/HzcKi/NHDcXArfsNJaMhqFwGUPStQK8yNWFKCti4fLHCHPl6Wiacn5fXA7YVAiHL5M/jue2QO9
	exTy1ojg8KPZbHrwfSd6FWvnEYzYLBWo1gkDQ3fxOy4vGLlebB1ClcPCc/DUVKAVIOthmtAM9Vs
	jgyg3m5FZchAiOzV7RJL7v0hE7ZcZOyqXtd3FYGPpeXzTa0t+vmLwnm6IqjdU7MNW7MTGnNbIEw
	y64vuGYi/QOeFx5+TEqb0tJgIseYPLfomLLAqXsC+ZNyBUJgGoPDwSBzhJ3qfcn+cbPkkV94s++
	MNpJXF8UD9nggTbylN1GVNIqsUx7Y3VTjKGpZUdMFEV2YXE4=
X-Received: by 2002:a17:90a:d448:b0:362:bc8a:9c22 with SMTP id 98e67ed59e1d1-364c3126f20mr2972344a91.27.1777551890692;
        Thu, 30 Apr 2026 05:24:50 -0700 (PDT)
X-Received: by 2002:a17:90a:d448:b0:362:bc8a:9c22 with SMTP id 98e67ed59e1d1-364c3126f20mr2972318a91.27.1777551890241;
        Thu, 30 Apr 2026 05:24:50 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e79sm53756765ad.12.2026.04.30.05.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:24:49 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:54:44 +0530
Subject: [PATCH] dt-bindings: arm-smmu: qcom: Add compatible for Qualcomm
 Shikra SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-smmu-binding-v1-1-1a28572ebccf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAtK82kC/x3MTQqAIBBA4avErBsw+4OuEi20Rh0iC4ciiO6et
 PwW7z0glJgEhuKBRBcL7zGjKguYg4mekJds0Ep3qqkVSuA1GZRtO9FyXDh67C05alqanTaQyyO
 R4/u/jtP7foLAqQtlAAAA
X-Change-ID: 20260430-shikra-smmu-binding-7befe45ecf2a
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777551886; l=1113;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1sPp6qkgLL16bC9J8/CczkLx46Zc5+CObd4eTssOwD8=;
 b=FOl29HQGOmuqRAc/DitTXHvBc+Y1BIXIhzO7Gt6oy++8zB5/N7SvHf5+4YKAwQ4IiCQCXTRpl
 ugnuoIa8J4cCf9P1fU4RFKg86MoZAA/Bxqr/bS3fEJTyKFXiMJWkw1w
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: fO1CXpjglNUaLKTqBNwlaL5mgVUU8W-V
X-Authority-Analysis: v=2.4 cv=Rrf16imK c=1 sm=1 tr=0 ts=69f34a13 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nZKb0XQ6c_9jB4svJKQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: fO1CXpjglNUaLKTqBNwlaL5mgVUU8W-V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyNSBTYWx0ZWRfXwvN/+9v1Gkh8
 Eh/ktzD7+7+lKQgMdy/PWjwnVgWrFRqfaGKlCEryUj1/E0xGVPqOt/RDyeoIZvCFYWYvJsceICg
 fTpQXFuuydCBrZpgXEmeqPJz3n5+Pn9QW4c4VSyeS4itcstE5R6Mm87no5jY/OTKBfPpQKjIe/g
 RU7yyGtsQIj7e5qXyrZP2TY5A9UVRma7YUb9hdJR5KzZXE7i5S96t5jlIa7nUdlDLuHtjZXKnnA
 YtmS/40EAqIO7d+MDPCnbJXLScrGJqTPAWFtjlk3WscQDtaO/dnARdID+S5s4kjeMQWTtjXlMp8
 FNDqknHCgqv8N+ZxK0YokeUcMYLCZV2Jnlj+g/4y2zpoENYbgnvFntfGlt2NaLW82jfCH/z5vRe
 HkoBJ1dNZzv+vCtdrqoA0ZsqumH2nnBTXLJwhB9MngUMfxx9x+lk2OcUBMmRtlQyxRF/r/zjlQK
 cXhidHwM5DYaqSy9n1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_052453_392561_0F6ACDA8 
X-CRM114-Status: GOOD (  11.32  )
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

Qualcomm Shikra SoC includes an apps SMMU that implements arm,mmu-500,
which is used to translate device-visible virtual addresses to physical
addresses. Add compatible for it.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..1f544103b574 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -55,6 +55,7 @@ properties:
               - qcom,sdx55-smmu-500
               - qcom,sdx65-smmu-500
               - qcom,sdx75-smmu-500
+              - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
               - qcom,sm6350-smmu-500

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260430-shikra-smmu-binding-7befe45ecf2a

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


