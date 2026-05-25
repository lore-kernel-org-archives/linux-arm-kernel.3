Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BF5CD5BC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 06:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LJX57Ht5s74mV+xzZtIacnVMiPk98gL3JtBjflkMkrQ=; b=FeUxnxGAT562KzmrBzpLRKO70O
	1rc5T1+5+VmdF3620IgR8VBMVYs3DCV22Z7P0654CORyO4783ZOMh14Vw9wWYfc7hPQJq5ANUEqV/
	G8HoXZuj8nWF5m6v/q5rvTiKYT3+VSMla7bECyb4FmjLn3KfnGL9xSr8XJVa3v5ps/qOUU3JNpxDn
	wJNUvfGoHgYx4NZ8gahdhAQnMXhI7JNmB9C1f8h+Ewe77SwColib4PjFextMDd2wm4UT0fHZAxdS3
	z9mxj8VjsrvCf1/JxrbajHoD9UYSVR7JIVso5hnvR+7+zAuZwKVhskekgewcJ7n1uVb476BP8Xdw5
	clRqU6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wROdI-0000000GOkX-49Wr;
	Mon, 25 May 2026 06:17:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wROdG-0000000GOjs-1BNF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 06:17:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OMD1SP2840543
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 06:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LJX57Ht5s74mV+xzZtIacn
	VMiPk98gL3JtBjflkMkrQ=; b=ifskVIAYtzSY5iQodV85d/BVjSRUCbYtKjXITA
	gn00aJalBMgzbZyZmkCDiue4ol4Xi4dZXJaOfpobcTVS0RLvAM9d7WRNIYEhw7Ae
	pWkiJCfZW/leaW99R4r6fDSMu5fS2uhuQK1xiWVP0SWtAu2PLkQOlH1vbCMi/AL+
	NHAOX6n3NAqUetz/Us/vDgAkWqSmITqSIjutljM6Lxzrq4kuB2b715VRWrTWwa0X
	zW/dI+zebApoWKmd2QEeJjGzO8bGfdsxzg6X2m3VD8mJ7nkTD1x6UbeRTjBYmpJV
	wsOH5tgZvSJA9Mz+9Ic8jB6W9sZDPn4YVgMoGBcxDNv36Glg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb50fw4np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 06:17:44 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-132d631edaaso2419858c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 23:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779689864; x=1780294664; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJX57Ht5s74mV+xzZtIacnVMiPk98gL3JtBjflkMkrQ=;
        b=De3A82SoH6N360pxZPFTxLazOl31BxARG1zzdg1yhzOveFSAeajnxBG/6BKHdEMDV6
         186Na/yVj4L9EUmZATpblG7Dw0dAKBfzVaEH00TNQtVnaeXths52BOXBgoBlym5mJHvG
         wE4kMy/z2R4hPuZcLh9Llvn8aRsW9mjP6B1TyN2oRK6Dg6EPw9XSgBBRNSklhiUA0t2Z
         LXWv8z4hJeYB9CYIlBjSP3pHWCiTsdm/ZWivIWxYzKkH38YUsnd+lg5XbPgLjo6PegrK
         ZUkJStBhDuSubqWSvhYPW/tLy3nVQad6xa5pRcRMk3c8SPHm7I45DdW/YWeTFgZKCxRa
         m0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779689864; x=1780294664;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJX57Ht5s74mV+xzZtIacnVMiPk98gL3JtBjflkMkrQ=;
        b=DgB86SMRWc+lKd+4smkve1WAvxcEaKi4V64S+k6wZ+eDIhn/wJIN6kLTsmAMGy/3s4
         LN/TTxa7jMRfpvF95yRdqSGweL4JAjM35cRtugSBKX1PT0UFeIlp/YpfbU1FuOWtK48b
         cujdWU94lm8b22DH89rW4aOuJDSkvGNMfrsGpndxZh2rqxHwfBkzEzv8L+4Uq252mttc
         XndrlnygIjE8VIe78UHYKTXprUxnMDl8uKVS5gLtLI1XUWvKetp3AjkZFHW+fK2ot/Ef
         6hkBdFKb9FTWjS/N1XLPBozXnUeyH6AjKb3afpB6iU2Nrt/FckWrR3iuAynBIZ4hZAT2
         9mcg==
X-Forwarded-Encrypted: i=1; AFNElJ+70QGYmT3rLbUtqYPsu8pKXJYeghwFj33/NuJxgJQwMe/K8llHCA+IYwJ/cq4C4M4IdV5kUlYg0LK8aCvvKgFB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3/AS4Z0KnUuwCEcmTBBmKsic09aZv7VCVtPgaMDyagKjKOf06
	irYAPZhrYEn3mqniqivmTIk+k7NH9dcf1bCiOzpHyJzmi/EMjnVAdzig6Bv5BEWyooX2wGizJBi
	VUOFOxy7FJtAdOvanJXBlC/Z1MCEZ0eClI1xDj8bdMV4COe7QM5Oth6zv4wvH5XC8WH7XL7QeUy
	l1Yw==
X-Gm-Gg: Acq92OEheiuPatZ5M/uPQ3q6BGiKNazojWHSZVv5IMWB5hmtjeIQ3c1zZ939RQBKwAc
	e1o0dCuruFuWxJWdG8XRzmUOgsbJvRaJyJ9O7MGV3+7OudgRS9cVIow6bbn/0i7cRlJdsKd5b76
	RbJroYd3yvDT62kmYlI9YCK/R9gfdKYVF088h+uni4IG+6lrfBhDEze6nNoZ0IY8LjIavnq+M8/
	HhQd/q76EAh7/+dA0ox/svurB/2ix647yS9xeL60Adbx6D06RRb+QD+D+Jy6pUhXtZIHIw1XSOC
	eOD84yJ5ukMtI78N4VmTgyohCRlCpCt8Yb8aQpcGg2V7ZR7AyB4LVvAEK62aaaUBxks3ZgiCEg2
	onLYLSRPuQeg0x6f3VyHuZ5cfl7cXlTOJ/IRNs+2twQ5kz/fJvTOyArNuKSJ+Eo4AJyM1dsnLBi
	+1iCQ+xXs=
X-Received: by 2002:a05:7301:578a:b0:2d8:97d6:6abc with SMTP id 5a478bee46e88-3044915ff8fmr5978842eec.22.1779689863603;
        Sun, 24 May 2026 23:17:43 -0700 (PDT)
X-Received: by 2002:a05:7301:578a:b0:2d8:97d6:6abc with SMTP id 5a478bee46e88-3044915ff8fmr5978831eec.22.1779689863079;
        Sun, 24 May 2026 23:17:43 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452230f1bsm6942271eec.14.2026.05.24.23.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:17:42 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 24 May 2026 23:17:34 -0700
Subject: [PATCH] dt-bindings: arm-smmu: qcom: Add compatible for Maili SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-maili-smmu-v1-1-ec85b12fda83@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH3pE2oC/x3MTQqDQAxA4atI1g1kfmyhVyldzGisgc60TFAK4
 t0bXX6L9zZQbsIK926DxquofKrBXToY5lRfjDKawZO/Uu8jliRvQS1lQUcUp+hyoFsAC76NJ/m
 ds8fTnJMy5pbqMB8Lyz3s+x/fMR/mcwAAAA==
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779689862; l=1104;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=+m9rqksL9CcrcdAyKNuiMdVbpebT0DR9bi9FjEL4MaM=;
 b=FdaYxV0ad4yvCaLBOHVjfmVKs1TzMIdM2JDbZ/NmYG2SZFVmfunAdmtiOXIT/hElu2NtLGciP
 TEpgiOa7sdHBSYd3m1iunT8kG0Pp/vBgvtUts92OpXv1+0EvTN9L3Lr
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MCBTYWx0ZWRfXwc4lBYNjI+kh
 oGVpu5/RM3y0ymDG9rbfVH3wYWtIwBGpoGg30XcyqhoZnYzdRk0yw8YGImNISj2Zh8JBdFh+rKz
 pysOFi+3PUwTCTwTmKc3f8jrAqJ4n9oy404JwVivhxoy75c4MNECw40SxtR4jhjN974ovZ5znt4
 g8I4tnIHdGTD5ODqIgCvrFAzfRiledwyOnTOBuZ3gQEGPN2eDuK/vW3Xrjx4fa4EWsKVWEnGHZU
 VZSpvTH13G/k9lB/Bu9wCMvnXSumB3/vzrYlPZII0/zS2Gg4FYAx/Rgb1erIJrBr56hNUg6s97v
 mr5mGNC2Vakt0KK5akffFAnChJyNOAGuiHo9XpzIoCf5wTSz227X/M+66eZ8pnVHvE1yq+Ue0jB
 koJJ71WEY1Mhuu+6eTM9iemdA3lI6K28X+VuUn9LJZitQO4+MhzVm09KaQe7vDg9Yjm9kz5FeLV
 79FrVvRiKl4JJuUbbzw==
X-Proofpoint-ORIG-GUID: 6zEW8BzfRg_NlZOchDKB0XD3ehTQ2vXb
X-Authority-Analysis: v=2.4 cv=UdBhjqSN c=1 sm=1 tr=0 ts=6a13e988 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0vWZlYpcnXXQiWOWdZUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 6zEW8BzfRg_NlZOchDKB0XD3ehTQ2vXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_231746_341914_53030B7D 
X-CRM114-Status: GOOD (  11.62  )
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
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..4bd31aadc405 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -38,6 +38,7 @@ properties:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
               - qcom,kaanapali-smmu-500
+              - qcom,maili-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260524-maili-smmu-1004f41b3073

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


