Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8876C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 07:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=38e/h0rBiS/Qf7sZDXyxGkbtU/FLkAzEU1CnnW8iABQ=; b=A+NZqfyFzbBxkE+3eFvK1S21Cg
	d60UlH5uUbhd5PJkKikVbSfD910J5/TchSE4wu94SY6o1DtTmns5tooZqBfOzPyq+BnbG54sAkfs9
	99jNARavDO1cQ0D1ERhXzj1Bak2cNjjLzN6474940/v9NKkpQ1QcbDGhKgcrAN+BdBE3AH8RiD4Wq
	ODvAcpGKuosWQfM5MlKqioqXoo3MvB4mpLFXqWtpcdLfdKUsU2YITSsdjQmYe81RmUo+nAWEZsIS3
	zlChKq7KjDl1fPgdZ3vlP6IHtUX8GpVFAV0h3/Ob/cNaV3fsWgRJR/R+kKBBlqCNLQYT1SjvULnc5
	ADcFHzvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYfd-00000006J0d-3jew;
	Fri, 03 Jul 2026 07:50:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYfa-00000006Izy-3geW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 07:50:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rlRt3108960
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 07:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=38e/h0rBiS/Qf7sZDXyxGk
	btU/FLkAzEU1CnnW8iABQ=; b=ZkSY2tDHk40SQB4KRiTxhHXS7h8f1FocnhMrWr
	FL5bCRoSftRFfMrnKqiAafOEAs71JnxeqVADyC4YW2DX2y83WMxNbT912QhmIgEu
	8xlVr5+R5bnEh3flKSkK6aVgu+UBPe3Is0VMxL//4dDaDsMXfbRaZxoYmUTYpclf
	2n3NwdJrZLognY13Lyljc1OAV6F1zHa0IXviiL8sqJw9B8N7c3d2zSuZdvbO3xiG
	UFqoSPvNgjv6ylQwxcM3F5G+cdJMRHkd9RLQGT4i1jaFuHTtBC22QM5QdeUfCtyM
	MdaFELLaetQV2XXSMDFtr17ul3j9ZzV2nvmeLHMwd9LKDiCA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60ey9ygd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 07:50:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88d7a75507so592679a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 00:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783065040; x=1783669840; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=38e/h0rBiS/Qf7sZDXyxGkbtU/FLkAzEU1CnnW8iABQ=;
        b=BHPbd3uBvkTvcW52FWS8WZ/e26YDMfGB5oG5qWX0ySRw/4R7AwDgEUGbqy22gqzkLn
         PZhfrUHVrA7w7sUJK+HrN/sIbtg+7RY54YZhfP/K2wFQLnoVkTRKrfDka+GYlGdpeMfc
         EUOTiwbo45sUjSsI7UJ9pXnVbtnxJJqAa5SxKS9qjbchtf+H2Lj+PPBf3keijesyu97s
         lRxl8aavgFPrit2VQzjOvbWTEj3LqIVdLsPHKWhwLfQekRkMu32SEX+pN6rC4PcJrAAw
         3DKHN94RacvlYv0wmUYBEskRcT2HUIjnIR/X3Ok+WeRkInUQTwVkcIy5CcyQhNRtrlTk
         v1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065040; x=1783669840;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38e/h0rBiS/Qf7sZDXyxGkbtU/FLkAzEU1CnnW8iABQ=;
        b=Eqt5fPSQdfdVqL7qLE1j6yo7xz9EBBo8amkgbNiBQG1sISkMRjYTNDLdArvkJTQhy7
         qbAXoxNvXmy4gMynFzn0KCx4MvEC/JUMHkx+1C/SEGNR4uMtOcgrK9zD/vHna6nhYPVy
         ZKRgkqJyGv3y05A56rp1aC6q2lNIQXBWhk76K4RNSsxjpdPnSL9j6ZFnGkhQTTdpvOrW
         1ARzZpYRaLGhnjGqVCsdIqqpT24dJP1ZUzsjHZsOPmi9t5pvGy7EXXFFU3X0QZunOQre
         ld3lWBWi8n1HdxeAs1uNs9idRfVC5M1mLrzeEAXJsX1Q6zjYDRV6lxXBg+y4gpDRTPGx
         QLtA==
X-Forwarded-Encrypted: i=1; AFNElJ+cAm7AvCWpHf+HyMleY9dChVztF3AwhRznETAnvRpOpyIqxYkBxCg9dZ2U4+W0uIQ+wnGD6epUqaYjjrGQ5UHl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1LEJKfgojtwp8EWpGlSoLyexDyh3t3iEqidKRgGgn0C5LIIqx
	4/8tUmByEqwfA4eILNuqzj/OYHoDdSN7Uz2aaTtmfWu/FDF1udB4BES6hoAjIOya7coD+JC56WS
	LFhO2hpJlnNEQn8uUKriMljWitPmdOPh18bz6eeQ3BqHKLr3Qpoqqjve9QfPlfG0QXx7Z0GAkkI
	sGaQ==
X-Gm-Gg: AfdE7cnIeeXrz+t0VGND9x7+X+bUJqJDyhmXcZqs7PY8JxRixenzdzYfPZZcIss2GDQ
	9MwMAz2UR4cYOYlHsVL1OIKhphb2oADZezvYkSBRE+qqT/CKRlMvYrVto6t0u9D0z+wohlf+BKa
	5k6LgSrzTHZ8dF6IgB3iUx6gfMDtEcQH3mPLhd40gMNda2ladKhjaRKrFtGSd8yqii2d/XkAxfz
	RKK8ZSHkkGRNzR51kj9dDlQOA3um/XmpJjMJ1NgD+MaoRtXwH5ACt3lKMIOxICYyO+wxQlsug8q
	OU/HG0yKsuzcBGklMlfuAge2WH/MHMUetx/uqu69DfwXp7ZGJhyg7/JXnVe7apzg230zj7nyk1s
	cMf36reL3aIsojZ7YHqvQNRKz1SqZIL8hZvrwwwjdh1KMIJW2djBiAR6Aox+g9w==
X-Received: by 2002:a05:6a20:d52c:b0:3bd:229c:dcab with SMTP id adf61e73a8af0-3bfed274077mr11178603637.17.1783065039647;
        Fri, 03 Jul 2026 00:50:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:d52c:b0:3bd:229c:dcab with SMTP id adf61e73a8af0-3bfed274077mr11178571637.17.1783065039177;
        Fri, 03 Jul 2026 00:50:39 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm20729977c88.12.2026.07.03.00.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:50:38 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:50:33 -0700
Subject: [PATCH v3] dt-bindings: arm-smmu: qcom: Add compatible for Maili
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-maili-smmu-v3-1-b48de6f5ae4a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMhpR2oC/22Oyw7CIBBFf6VhLU2hL3TlfxgXU5haklIULNE0/
 XehLjTGzSQnuffcWYhHp9GTQ7YQh0F7bacI5S4jcoDpglSryIQXvCkaLqgBPWrqjZnpHlXRc8n
 EHhSJhavDXj822ekcuQOPtHMwySEpYr1JsUH7u3XPbTKwFH7ba1592wOjjKIUdcd4r0CUR+t9f
 pthlNaYPB6SRgL/GH7+CzwaRFtVAtqmFSj/GNZ1fQHj9U1+BAEAAA==
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783065038; l=1717;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=U38Exkn5F4K0dBOTHvXgeHPpIHPzDyvOnWH1mlmNjsc=;
 b=/pzt0aDH3YX449O3+iIsthLRn64BLGWMr+/DRFBjwkhN6NDmKQrVxdpjzhWYxZ6/GMr3MGJtQ
 jFu1jgHClwLAFGXkjHXQIczQcnEK++d27l2UNsEZKMVdqt7yhcf2wYl
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MyBTYWx0ZWRfX4JbAkaRNovf4
 fSWPIUr+Jplg11cZrlj3a6ChGwsvrmTKom2lSivxnlo9xtMiWkUnXkIuGx4iMi3lh9hOUiuTmDQ
 5+6GcdSTeRxHJGxFfFAnsmWf+ujqNAAK+2VnJ3WUEHxXp9V1FWnaUApSwsX2nLo48Z/aDrZiJNc
 OT3DENi5ZZkj50+V1EtWjQ8K+y/NanPGE3QjdbF9yGEX1/rtNk1rBGMD0n5aCgYc4w+MlzpSOkD
 vO44WWrmmRJi+C2aplv2R8rZJoiOJ754cLVR8+so1rYIJ8JBSvtSd/ZNexTay8doSu7QNZNs6aj
 K7bWtB5neBdlAz8TdiVhUueo90SK0eubqdJIbR7saG7JQBHnF11cbr8aDBKv2nyAacXusM31MMr
 DYF+fRTwptQ9RKMxG0E1uqgfnWCqVJYS0J2dtPuJ1ccNeJMTbUyy82Pzyox3TG8z0hCNqQ+qP6P
 UMi+hF8zFX4v8pF4jOQ==
X-Proofpoint-GUID: GsDPQfHMetW8pDhlffn0WSKabZrrbwSL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MyBTYWx0ZWRfX3CgH679QdlIf
 gHdOkuA6q8rU16z/yMkQWMhWy50My58+4f0mk+BPRZExK2bQkyoulFcoHIT7joY4afLNQAQE73P
 4jKOHbm4dkOhJ2+Gn5cRqYjo2vBXrjM=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a4769d0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: GsDPQfHMetW8pDhlffn0WSKabZrrbwSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_005043_036614_413AA470 
X-CRM114-Status: GOOD (  12.49  )
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

Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
which is used to translate device-visible virtual addresses to
physical addresses. Add compatible for it.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v3:
- add smmu binding to the block that disallows clocks
- Link to v2: https://lore.kernel.org/r/20260628-maili-smmu-v2-1-87448a7678ec@oss.qualcomm.com

Changes in v2:
- patch rebase
- Link to v1: https://lore.kernel.org/r/20260524-maili-smmu-v1-1-ec85b12fda83@oss.qualcomm.com
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..fd095161f6be 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,glymur-smmu-500
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
+              - qcom,maili-smmu-500
               - qcom,milos-smmu-500
               - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
@@ -621,6 +622,7 @@ allOf:
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500
+                - qcom,maili-smmu-500
                 - qcom,milos-smmu-500
                 - qcom,nord-smmu-500
                 - qcom,qcs615-smmu-500

---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260628-maili-smmu-9ed0f2c189ad

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


