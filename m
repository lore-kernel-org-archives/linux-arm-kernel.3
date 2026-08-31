Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B90EC61DE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 02:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZhT897pRpBM+tJ1kem0SH3LVJgXDEhaNUrTZzsCdCzY=; b=e0Biue9agdJkdUWVOKu4pwaA6H
	xC4tlFNpjrhSOKd1o3PoQNv6f48pYomAr7cIx2BK0AqOaOyKw43on/T2RfqFtX+m/deXuW4NJJV8a
	fQ9HiW9i8F9q9day6cs6z2H+LfD62Dxko0y4Fi9bNPbQ1NGCg/Us1uIYoGTTBMeOJaOwhP4EyvOOT
	Hz5Q4qaWKSLvjKTRg9dJ48/yN0BWJWZKJMRlq8k5jgf7ZehVjoVK7IaPG7rL8U6LcTVyxDrSDfcKj
	2qiZXT1AgRDD5zOxotDuO7nt613EgKxzHXuw5LZFIsTaf8EN9nc4Nzu9ozS93uJa48j8hItSQCTvf
	uM4J7T1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0s0H-00000008NEG-1zJq;
	Mon, 31 Aug 2026 02:44:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0s0F-00000008NDp-0ZXZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 02:44:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bMkI2179530
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 02:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZhT897pRpBM+tJ1kem0SH3
	LVJgXDEhaNUrTZzsCdCzY=; b=fFnrlXPD9K3X/8Mh5DZSOKTSit6U3Mkn2qO8T5
	mLY0gVCWx/Sc7SAmVg7LezJ4mdTYBXdief200KjLzrRhYhR+kMT2nw2YAJB6upNw
	89X99tW/Hz+Xi4bbqw4bVhF2s3x8gMwShrnX/yeOkLjKALHOfJq37/YuAVSv1eKT
	dpvD3Zz5xNZMzG3+U39mrFwQ9qGoha5fGK0eOn3eIuMEXHLLWj5hZt8My4W/CY+M
	5megf/0LffzvB1a67XIjkifBqWKgeHdxWIpDv+MK8tL5nr7vN2n0G1GYKks38F65
	dT7LWu1u4cIYEWMJFGqw3EfuRDpnCykIjwokQmQx7MMiuz2A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2m84k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 02:44:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc6dd43737so60674325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 19:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788144245; x=1788749045; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZhT897pRpBM+tJ1kem0SH3LVJgXDEhaNUrTZzsCdCzY=;
        b=N81qknJ/1swTgk1FwS5bjIv175//erbiEtnCl2O6AF4cpMGllxP8vzteu2SvZN03O5
         XwKjCXz9CC09X+Z3Sk0yFeF10Y0wXWciolm8LPbyt8wsbB7ZlNaAw74AVfJnfB7+/acn
         26bxsIRqPyZuvfcNkiqCvB97Btob9iFyaT8SWvEhamLCCTMDpagdEHtc5ZkEuOjkNuOy
         4ziDrGhjkZ2UNOAZmmR+vo1msmCKmuADaau/vIfqHPY94lpgq3PkjtfwjsZNsEeiwoIP
         +FJwrG3BOtngaRMtN0mroxgLWvyTd5QPjTOwbuPDcftcnAWX3ToJ2OsKo6VI/gRcYjiC
         VCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788144245; x=1788749045;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZhT897pRpBM+tJ1kem0SH3LVJgXDEhaNUrTZzsCdCzY=;
        b=UpnlZn4Wo3MNh2C6alX1fVgj/i+SfaoKEK0fBVt9iS7XkrnBEronDlGC5H2L9Y05lP
         DuYyv6HW3iMSUl0i4g2QwzyP6IahHlP/8i5f0n1yp6RuSqHx+JlXt7pSKMeCSKXQcMIu
         2HkV4nJJFsUGIzeXfRJIjW+7vwOx9sfvZ34DQZV1hBbxSzFCLTQmvs0qxxRGseKZrjsy
         DxswuidQsLSMqjsesmldsdUi3+aFNfbsa1ZGKVcMhjSPPxE9kqzWqqTFOZ927UMXSkSC
         Y1GIboBUh0Kd0r8kEq5uuMokXcLshxhxPPMFI/MSDH9DKimKTsBqzNpKSJa6v+uHnJDE
         rqwA==
X-Forwarded-Encrypted: i=1; AKwUvBy7wMHLtnlv7yGbBFG/borrR5IuSFv4dN33ewnRNg6yxvWKtIryFY9dOHAjxXQB4xmH96gufnHF0jXYWbMfxmqJ@lists.infradead.org
X-Gm-Message-State: AFuF++lJ502IOdgBm8QQDnvIN2TDQY3dycokxclAyD6guY87AJHvkO4K
	KM0rzJlR/gPUiiiE5pjS1pI2rZPSI2/7N5cLVMV5OSiSS2rOUxHAZKQZa95w5QHsDv1eH9Dj1qp
	ke01fjucHVyU14PXfbqG996TkAHDEWc6A7juQFCbOR0lIliox7NPEnJ8r/I7sKVA1uk5FqH1w44
	hKEw==
X-Gm-Gg: AYBFou1hDjVzk5jKVS+DD9S1VTFPTCqES5Hj55LvLDcOfGgqdqBCnDrTJt7U+1rplWL
	rqG/DeujiFRon52txqxL20d/93O8l/6DtvT0PhzEVtwpJ757aV3+jYsP4xnnIvPeEEBrpThpyqZ
	fBfBNtJ5X1rpM/PTXJvwvIiumVAd/AJgMLyD13INa93TZc28WVj0BzJJanZk0VsKUh2cwD0S+sE
	iKMtlzQFefrKb3X2AYA35fljxDcI53RHBFEVWHnCl6BiBxoE/ODKb5n/w25tivg8Em441GP7Sru
	OP89naviHNnQJ4STJQesWxLiAvsPsHbJFXwWm2ErEa1U0MLQ5apvtQQXqtLrTTeicCYU1pQYM6J
	bJ/oU9Ty5PNqJ/MOz4TyOzjFZ6TpW7JsHjaEzI+oDxc4g7A1d8yk=
X-Received: by 2002:a17:902:f685:b0:2d3:716e:e2ae with SMTP id d9443c01a7336-2d93f94ccc6mr3407045ad.6.1788144245459;
        Sun, 30 Aug 2026 19:44:05 -0700 (PDT)
X-Received: by 2002:a17:902:f685:b0:2d3:716e:e2ae with SMTP id d9443c01a7336-2d93f94ccc6mr3406595ad.6.1788144244994;
        Sun, 30 Aug 2026 19:44:04 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bf283sm27982915eec.8.2026.08.30.19.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:44:04 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 19:44:03 -0700
Subject: [PATCH] dt-bindings: arm-smmu: Document GPU SMMU on Qualcomm Maili
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHLqlGoC/x3MwQqDMAyA4VeRnBeI6dCyVxk71Bo1sHbSoAzEd
 1/n8Tv8/wEmRcXg0RxQZFfTT65obw3EJeRZUMdqYOKOvCNMQd+K87qhpbShcyNTbKd71zPUaC0
 y6fcaPl/VQzDBoYQcl/+GPHs4zx+Fon9wdwAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788144244; l=1316;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=PUDMY4WLXFBReBbRmBaTP6+PE4Cv4pgZHtjopE2nWgQ=;
 b=krsN/QHNnWo2ZNh6r/qHqaAjxKhPy5UC4KhZI3frkNdGfG0+mq/11lmoD+0xzxia4RJKXtfT5
 tlwXFEoOKHzDB4pbzbCndHHGOxah27KU6AAiho5NtqUTMk3egOPuUU9
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: Ko4lk9esz_pT2F5YVBPSJEu_y7jzCzfq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyMiBTYWx0ZWRfXwxUU5TKUFyFe
 G1OOEw7VRRJSoJWVQR61QHhGDFtUB9Ap7OMstVduFEGM7JCiY4M0C8W4xgEBBApLj6FvmxlBeES
 sZLADHOwgKgvYD57fM2IygeUv6bRm5OPSNP2xMVGwUcxQHnCLLXqPDsahyjkHIo7jL2Q60kJkUb
 MDA3Zv0AndJa0g6orVmXs3fo6oq+2WNwREM0pPXmiv/904P4zEwt6m6+2NuB2gYo/YiczDoIiMT
 qXpIoNa3gE4liZlS2ik8dVebJBFUPMwh9dbz4IHjqCjSbrngulHA1PyYUIDOPG3C5ZruhvYCJzJ
 gGsRm1xxXF27pR2rMvi677ZSCWEy/VL49L6/RnBSF8Fr4TZUtwZc6vA+ZLEurUtednLsAB8/Si6
 7Ar5d+BKmov64ybWa09JfkV/+RiM74KJKWTMObWi0idnVd3fxVYllLS28L4p1PHNtIIXtnQcRY4
 3rSrtdjbEARq6jdKOJQ==
X-Proofpoint-GUID: Ko4lk9esz_pT2F5YVBPSJEu_y7jzCzfq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyMiBTYWx0ZWRfX/N0ihnd9YXpA
 ai+OYX9on5qQn8JBM7R7vVBfrn5Xc82FEXyqdExao6QE2jjYT8LF+t8Qu2kr7QARoK5J5qKEACI
 R2DrWUhbqWe4elk6w8Pg8BnZqRuNrBQ=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a94ea76 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TpgbzC6p0oeasEHOM3UA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_194407_194603_5C7338DC 
X-CRM114-Status: GOOD (  12.07  )
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

Document GPU SMMU which uses "hlos" vote clock on Qualcomm Maili SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ffa33b7f4a96..187710fcc567 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -101,6 +101,7 @@ properties:
               - qcom,glymur-smmu-500
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
+              - qcom,maili-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
@@ -579,6 +580,7 @@ allOf:
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500
+                - qcom,maili-smmu-500
                 - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260830-maili-gpu-smmu-33d20c1f4672

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


