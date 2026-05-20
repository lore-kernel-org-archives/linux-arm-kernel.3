Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A61CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AvYd5tbvhBUHZMwEcf9N1zyeQ7mj2VpD36mkIvdywsA=; b=cHdb+y6zXIpADqVvWyFsHqiuDe
	a8AtLuYUbVeJTSVp9XqIFWullIXfe1FtGAgl2TYy+ow8CKYgMlBqFkBQS1lX9aQqqsxZ6roooRMo6
	fzqq9CLLE8L5zu7sahAN0egJfqj7VMd/c/ox9T9O6aE/1Z7LpgfAU/eeIUOi9PT/MuIWW0ses3WDn
	xIEZ2MDdXqYgEQ8DVepEJUf/jexX47Y4y58rEP3pUV73f5DFtsKqil1XEy+KbQnrBiOhNwjj0YPzQ
	rrv74SsY1gmpojMelTyvSFrPwrpsSw1ER1Yv8XZqIhJJcIFWEnsxjT/+r1iz+ZGcyc3RunK2p4x8d
	ZBEKkLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbSG-00000003oXF-1M2v;
	Wed, 20 May 2026 07:35:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbSD-00000003oWT-1TtC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:34:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K773Pm1238657
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 07:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AvYd5tbvhBUHZMwEcf9N1zyeQ7mj2VpD36m
	kIvdywsA=; b=EM1GfqNloprxHWcEUMGvA3c/hj29XVH+CA1K5gPn+AxZGUJe8Nf
	8vltS7Jl0wTQkIdMzbZO1vC6s4TlYoFOZ31ksCgGvyPA1TF9zMtKTgSvryjdCSbh
	UXcapC8jeYwlo4YAcCJnVZUgF57XGij+oZ253fM9ilHPROt2mLO0g/bkbaDZOV+s
	gSEPOSOao94eE12k5i1rEbxpcmcL7EUCooMxs4Na1JlDR9Jl6Y69Hj2qDR9SoO4J
	+4zxciTfnAaL15ZyCYdMyKicXauXaEJx+6frHvHY1v4QifYIzDsL3FEoDAd+gN8r
	kz9HZpA9FS7zNECuDvPuhrybNLU27ylZmBQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sup0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 07:34:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba6fe41283so45887565ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 00:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779262495; x=1779867295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AvYd5tbvhBUHZMwEcf9N1zyeQ7mj2VpD36mkIvdywsA=;
        b=A5ea9d9XyCzxv+CWCe3MVMltszjHJunqp/dj97WjN1L5liN8fur6OhdzR3dSJcNdRR
         Y+RYrWfqlZPjlprBVdBJ7mT54W3gtOnBTazdr/b7yRV/VP1f+rynCUkDPv9qPSdhOeAO
         2zntVym3QsPXqWGg7QQ5gUaA62SsUTjKXm5R9i/OCxajEF0diRJoyIDJrK+haKzRjlkO
         QDPaXd71AVygNP1g1b3+gW6wZclrvpq9YC99WlGjBisPl6sDhGfD5iAy8reXKyfMbyuS
         TNq8Xo72yzcJu3Th8HnNyecgJKEadKSRy2rE5GUGpzujcD2w+oqzenfrruLx4tWQwkAR
         KTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779262495; x=1779867295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvYd5tbvhBUHZMwEcf9N1zyeQ7mj2VpD36mkIvdywsA=;
        b=UWQ4jYujTRA4oSoxQaHsHVE5/voBT4j5EX4htWR63MJBosn1AkI6YSZuZ9deiHLcln
         D4AEM5puYLNUzMzzFKRIz5xOlHouW0rar31Eln9fbThM945N0LwLtRFjGpceaLz9cDwZ
         CBIGdvAH8T3Ky0coB8wTLW/FXA+kngoCnuzP2BsZ4m1239eyDEIoR+5X/MSFPR8ZbDnQ
         I9YE3IViwrSkahVqdzq+yvfgEK2twNG8hblpCYXt8meFSpYaiEzARSuYtMtisbitV1yK
         TWFKNrrMOpXCJs03izpk/nTuUso4uE0T5sTfqcatefq+oELSYqmaSpnmQ3Lckh0LQ0tQ
         ALdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tZ+ljsFAfBxI3tmCDJdUjwsLRGG5Zdv62U1Ov+utoRz6nSeJHD1XGHNWJPuKEf0LMDVPrlTOCgV3YFr530174@lists.infradead.org
X-Gm-Message-State: AOJu0YxaQ+JQSU/vhnlmbC/sX3QEIlVUhC1uEkqG7HzD5PMpBxqtbh6W
	4l/t3qdmVm01wv8Zflq2vihqQksBRqthHzXX9AH568hyCq05pJZLnpSpy4W9ax1BOQMWVHTh09l
	nFaysW4iBtTOFcRf0oxD7w9PhVM65++FYsuCZF27jlDMpVyXBWm/88mjJzv+hoxMldSlQHLcM6H
	eVSA==
X-Gm-Gg: Acq92OGpSmpb445ZnTVouTj0kMTRbTe/TTFw43gCi6vqRR/7Kr5KxL9Kx5WaJiJ9qHe
	e5vA+QDe901RJ82fDfoweyYM/5qFUdRXsWZqDbTvUdJwECtZ4NFlcxiG6TO2cYTYM1wIwebYf+d
	USOLLuK4netYdnRg70jWNhiG5AQ3KSaZp5gVywRs16BAPTruuYPJR/N6u9rjK3vlzHq/vfpg/Pg
	MfT71+KXQ8AGo1oNSOgBvmjwTdh1bbGJEGFKHPf5h3oz3i+s2wIUXMwks9mVfJ3gemaOrW3iqCr
	vmpVNsbAwsX+eK4mq1pHKKC27XeRfhn3ZCcELFSbxTRfTqP4edOfxf9Px+fQTWcMdoaDnhSra18
	Hp4tPhQ0KmkACXii/M0bcHD12JkpN/HAJ9zk7aVxw79E38/O8
X-Received: by 2002:a17:903:1a8f:b0:2b7:86be:7673 with SMTP id d9443c01a7336-2bd7e85fce5mr245719045ad.6.1779262495341;
        Wed, 20 May 2026 00:34:55 -0700 (PDT)
X-Received: by 2002:a17:903:1a8f:b0:2b7:86be:7673 with SMTP id d9443c01a7336-2bd7e85fce5mr245718585ad.6.1779262494646;
        Wed, 20 May 2026 00:34:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49c9sm213562825ad.49.2026.05.20.00.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:34:54 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: arm-smmu: qcom: Constrain clocks for Hawi SoC
Date: Wed, 20 May 2026 13:04:47 +0530
Message-ID: <20260520073447.2138384-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eU71zqSJ5c3oDfphnWyXS_M36FdBuTbi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3MSBTYWx0ZWRfXw0nlDwBatkL+
 mC514Y3rPRv0bRrYbqv4LUOKbpR9gIZsymGRTwzbVwlPo6ZKBo8anjBMR09Cz3ZK68LlA+EorZr
 JA8gvTCdILMsmYZ4UQUiRwHAWUnA0rgSvzzTrTe/cg1U1z8sm9WeuDfdV/i6N5iM6i9/ZDO+KRz
 +GPv9RgHqT2CFix+iAgynoVngVqKURLMnlNMP0yY4bSFl6ZfU3DMoUnzOXwG2Ozuu9dilhnM/5H
 ClG3xTUZmw+HgnKj6MAfv2+dcl8Q4/fi4Ur4jrpW5oysd9tO0bl5CqzR7FUVYQbVv+1Vzp/0ii3
 /jUMMRQuhIYsNqud11sipnYFjHiLCMTvr89j+HPOt+amEzh02cOkQAWiFVukqJY8yvLF7w3rBF7
 URYIVhGWPvEJLUUXU8H0sWDequVxTx9CcqVF9M1yUzAfIJhjdyt8ZrcBpKdCXxcJo2IiYRETfj8
 HCKhiptzTwf0B0gxIeQ==
X-Proofpoint-ORIG-GUID: eU71zqSJ5c3oDfphnWyXS_M36FdBuTbi
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0d6420 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xU9kCb1ocPNtrCwW_qAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_003457_395335_7D9CDC6D 
X-CRM114-Status: GOOD (  12.71  )
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

The Hawi SoC has two SMMU instances with different clock requirements.
The Adreno GPU SMMU uses the qcom,adreno-smmu fallback and requires a
single HLOS vote clock, matching the pattern already established for
Glymur and SM8750. The Application Processor SMMU (APSS) uses the
qcom,smmu-500 fallback and has no controllable clocks.

Add qcom,hawi-smmu-500 to the single-clock constraint block for the
Adreno GPU SMMU and to the no-clocks constraint block for the APSS SMMU,
following the pattern how it is done for other SoCs.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
This patch is on based on  arm/smmu/bindings branch here in
https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 25fd3efa2420..e413564ce55d 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -570,6 +570,7 @@ allOf:
           items:
             - enum:
                 - qcom,glymur-smmu-500
+                - qcom,hawi-smmu-500
                 - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
@@ -616,6 +617,7 @@ allOf:
             - enum:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
+                - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500
                 - qcom,milos-smmu-500
                 - qcom,qcs615-smmu-500
-- 
2.53.0


