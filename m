Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A3FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 06:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xOux2gDggREnIc5Op1Tbz5VNmuHn30UOA4c59Lv6Txk=; b=x2b1PYwCy2gRzWBdzpp+DJqJfp
	N+lKJLIbNcVj8qL0Gagys5gqXF7T6NnEpL/ok6sgZlMtEWVJlhIC27a0UjgXCySQCxDarnAMRWe+z
	iwXGOrJzM+2uAhq27ia4R1+6y9jEwT46cdoOAEUcIFbuQcJkJNjLKvR8hzCzZFtP3jTsbg0Mh3xVD
	X8L9zhd4USz4YyMjLoTA+WBdQd95ZuiPRVmWhWnxTyBU2e8maTQbjmqWYYCodXKVxULQYHlD234E0
	ACzyhR/70gPXl5P/jP62s0W0Uy5n+gs5IqsoGVHwOERr36CyC7bg6AEOj4YYJZjEG8mK3IfgWY2NC
	V7CjX/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5vY-0000000Dp14-3kn1;
	Mon, 29 Jun 2026 06:57:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5vV-0000000Dp0b-40Rb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 06:57:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rSuE2124846
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 06:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xOux2gDggREnIc5Op1Tbz5
	VNmuHn30UOA4c59Lv6Txk=; b=giUQhWByJkMkmkHPncSBlK/cyD2BmCue3wQBYq
	yZhoLgsoHppyLJC0d8I3gc778X98oq2/voWWPMorovgyoPInub1k5PLB7jubcYni
	iVzM9sjOqm0FjTVFio1Z3PEK8T8nJBL4XXMSnwwUCYUaqiOgu70Yv0XpkIVqAKih
	O7OjsgVdo4cJc2XGG2e2CY2nnqB8bKrt88BTutjFAVOVklkyFUB3Zv17aJHDG8aX
	1lp8hcNylwDa9s9BKceta+7wsxaTELPwnwd9yiRwumdJAs1WybZNWYxVg7So6CMO
	76NEgYMQZvfvdVnqPvDwVPCvbtZdNnvuDBjFVvH7ILBxyicA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f273355yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 06:57:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ed53abff8so342871eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 23:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782716223; x=1783321023; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xOux2gDggREnIc5Op1Tbz5VNmuHn30UOA4c59Lv6Txk=;
        b=B44a4ErseEXffaTbgBHiROwlEw5ALvhR/wFBA4EfZ0rDB829crfIrmdIdg7XAMT3eN
         uXFb1GoT9EpSaYnpD6mQA5AIrOr807ZNTY4zq4vc1rx22X0bhlIPdd+mWKtjxe50cVMi
         YMo6PVbnebXNY02dmtoZKABayrmA6s8tsofdo6Dm2FssYyk1zDj7N5xyI6Ng9+Yyo2qz
         AOw+PYC4VlzU0zJ/rhnVrNSwxCxJ0HnTvCDY5amLjei7mG7M9vG9gg9Y0IUtDMrTTgfW
         ovNTmEw1wlW4SPyCIYWBU/crhS4anXplZsh62ku9ANSHY3e6Qx+J7kk8uTx8W/c5uxJB
         poaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716223; x=1783321023;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOux2gDggREnIc5Op1Tbz5VNmuHn30UOA4c59Lv6Txk=;
        b=S1iogJdTuPHrTLVlrNY5xuoCnqqdIqBMvNyeniaIZ3mfUFVFBqzvtQENxMYDw+7BTX
         XwOPJ4L3i5FfQNFFRYo/MnvGYTwaXYgWZ/wDaM932cn6SiwutVFWgFuzeqP8iPgRFXzl
         5S5/alhTsJ3thf1PK0B67jhQ3GvVdIqQe42gElu1fZtMD9iQ0EpTHCvPJaqFVDLZ8I1W
         NsuLZb+1DJJpgk2gDeQPRdEtV9SLvoeUXAIM2B2OwUPZ36HZQ9VcKkCXkx9uwDekRX3F
         /hx9CfFzkANZmQ/5ExmDBdLUJFdTayAYufoGLPYnZKRdBhs9zSoUUJdc99iA+A66blKg
         LKvw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4sln2un357u14b5UyYA5dOWyy1b4YXyskGTOnEtgbwAr3OGRG6woYsS6d6/YVBsPPZ1aLPUOJKJt8FIhIvm6y@lists.infradead.org
X-Gm-Message-State: AOJu0YzRDcbYQ+yvcZY3lFOZ3bxRUnUpazx4Gewl2BZVKh9W6ibTjuYI
	Jd3ZRQmraI+PcQWjcV8qm1baDlX1OIVr1AeuMw9ldbvCd+Ehs5a1QK8Pn7qUtYJOsBjCQyN6p/n
	oovXHzF7+pqjLNgwyWgQAlx10+fSruqTiOVoDfFu1w+o02GSCAKhVyT+v5yoixLYXXomdelucOw
	UjXg==
X-Gm-Gg: AfdE7ckN85LpBgArk23PncDpPjqUFXTpKuDr9wkSPAyndoU64cPDho/0TMPLs6gR1p+
	mxMFgTLhl3sQ576lg/+fTtrzRbYcYs8qQD3Vn9YkamCfbXmHaTkyp+NKg5SJxwnnO4sDxPpvv10
	WVA1IKNKpKo2oC5/BuVdkiKxKxJd0JSaEHzvbH/BI20a5d+W6PKFhDVWV6CzDhTGZ3wlbtrW6+a
	21TGnJ8iYHav8Pi2x6cLkcGdjIzW6qVVzqH0u3sXtJKIHrNc92Q6e5zULZEzqA11Bhk0iiy3klm
	x7nMXci2AGA1w6tbY6s2wVX+GEpBxgPE1Mw7Fx+MGGzXnWN2V5xwKFKmKWRHiJsI0pBl8X2nuVQ
	ES3UYTTI2yGvnQVAI5mHz3BjWkVNl6aTuKJDSH0+D0ECk61p/LZue1qPM+sHH/g==
X-Received: by 2002:a05:7301:6003:b0:307:91f9:c1d9 with SMTP id 5a478bee46e88-30c84f77b05mr15366611eec.29.1782716222306;
        Sun, 28 Jun 2026 23:57:02 -0700 (PDT)
X-Received: by 2002:a05:7301:6003:b0:307:91f9:c1d9 with SMTP id 5a478bee46e88-30c84f77b05mr15366587eec.29.1782716221797;
        Sun, 28 Jun 2026 23:57:01 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c6c2sm44995600eec.10.2026.06.28.23.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:57:01 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:56:53 -0700
Subject: [PATCH v2] dt-bindings: arm-smmu: qcom: Add compatible for Maili
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-maili-smmu-v2-1-87448a7678ec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADQXQmoC/02NwQ6CMBBEf4X0bAldhRRP/ofhUNpFNqEUu0I0h
 H+34MXLJC+ZebMKxkjI4pqtIuJCTGFMAKdM2N6MD5TkEgsooCoq0NIbGkiy97Os0RUdWKVr40Q
 aTBE7eh+ye5O4NYyyjWa0/a5I82qv9cSvED/H5aL28s9ewuXfviipJFpdtgo6Z/T5Fpjz52wGG
 7zPU4hm27YvrJsaD8IAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782716221; l=1234;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=BtkPFNWwQb2PwuusYf/8KN3qcU9Gir40fUa8c/oqJ5I=;
 b=QnqI2Z0FwP7IqQVq1stRSgL3Kmyg9mkoHLOBdkzpbuoDBBSGghBhnyoHaLBqYkrOJfrh+vpgx
 a/mQgHR0MfwCp7N0ENAXOw6pmh8hAexhgtVK9oM3H0P1619SRkyGQzp
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a421740 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0vWZlYpcnXXQiWOWdZUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: D4rJ5Ctg7stCWParWwwbH5foOuYwwpTb
X-Proofpoint-ORIG-GUID: D4rJ5Ctg7stCWParWwwbH5foOuYwwpTb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfXySWC+hhnytlL
 UxjJaBSBdeF/pFk+HiCOajpiAKXOCFQfkM7Dq12uXLerr9ahZSChbAR1shEuy3J7I4MnXoA1C1B
 Hq+tL2WoW3NOYyrEWYNGRvwh8zLkSg+RqnRNqzcmp+5mI9Vl3g5G90OgUUp31LlR2y1EgYlCug7
 eJAbz2g7iLOUt6NdrjRKHF3ofDpb+MWpRIVJUBKGfaBF2XlPdME4871ySn2/3Tgy6iWhDync7S1
 5/Mx+Xfvpwbrmzf83rp0/7FQJqXHkisNagycQhfF4FONHgGFX7Un6ccsZhq8x0fyy5sWJPFWVIB
 eQd4t/pR1sPffmJT/ipYdKtMiOD2O7Dmt9RohkmLTfMhCaeysjJHSzzD5w/7YUhAFILPOTpAGgU
 A/LEHa9M10UIXh2TITSm8A0ZWqOBBTeBjWI5nJ6AbHeUqut/aZIPdzujK4hEDEb7xuxiNL+eic2
 89x9O0ODOj9NTft8MZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfX1r5RFLIwe0xY
 0vucqcaD+2clj2nobJ/CK8dNYHU6a/me2Bbtr5JA/9f9zGRNyGOX2gGMFr7UzC+z8L9PjR1wjux
 equ2/TXl/tVgX6101xzuWLxgIW86epA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_235706_120265_70E40461 
X-CRM114-Status: GOOD (  12.54  )
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
Changes in v2:
- patch rebase
- Link to v1: https://lore.kernel.org/r/20260524-maili-smmu-v1-1-ec85b12fda83@oss.qualcomm.com
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..c48e9de1a2bd 100644
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

---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260628-maili-smmu-9ed0f2c189ad

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


