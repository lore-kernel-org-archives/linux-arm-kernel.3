Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8BECD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DT19M6pQKyGnQLXpjshESdaPdBCoE5uHW9FdeRhlQs=; b=skOVAyGwbXszjqXKY3/2OCGcHb
	9wqdP1t1P31C2RAveshJIh/AKnzqU9kInzTD17obPiN6SKfOEWFUt6D6TvopnKE/d0ht+pjCk3iBd
	GD5KfWdR4SJfzA75UENCMI4TIbx2r8Vg/n4Adx9REAu9k0oJ2kRZ0MdM0I4ZDkKbs/PlBItGaiLNn
	v+kLZi9HwdOZSJtIi6IaLSMIWh2SEoDGIIxceIFqJQDRUsyGz4cdj9NLP3xccj5GDvM/f5sIDJvHU
	qzlEuQCkgNQFYJO/wk6yu59ERYNplidAwOcm5Ve1Lu1CuYqH/uNSNR1qFpDbH+oAzKjOA95Zw1onJ
	0IO0TGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRszE-00000002CAT-3QjZ;
	Tue, 26 May 2026 14:42:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRszC-00000002C91-2ZPx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:42:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsXO52496622
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DT19M6pQKyGnQLXpjshESdaPdBCoE5uHW9FdeRhlQs=; b=Ow2REcvVjz6jJYV0
	+/mToHCztuG2rvHawhNLJKSbRd6Ky0UQiP9f9cau83gCW4ILJS3JERFThYAYxvdw
	+o+xs6UNuixwE7fyC4kGaIA7eFmKV+kLRCDdMJa245Hdifn5JaSHwZAK1E8gpPuy
	Jsv7QeI8XAhBLZ9FGY6EYttPm+7kw6UAOKsaERbbLSKp1senvUjDSpEfF5NFYJMm
	NKbIyxhbPB0U7pps9EQO5vE7uKLZE4wLKzJJPIZ5Jp0dsS4/szXX5KHjvTuRLF27
	4B/XkjOFDA1/qJgYH3zlz9gxUtD4i3uoigJ2dI++hTRvGfrh2B+T3Y2LQR9I7g8T
	1B6wPg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqmwdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:42:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8525f0807aso5058394a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806545; x=1780411345; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DT19M6pQKyGnQLXpjshESdaPdBCoE5uHW9FdeRhlQs=;
        b=UusiAdNg3keYzzNRgBtU+lhPxvLM99OSAmvlCmy7AtmdbQm2/ENJCrMjT8B7RCKNXr
         Cd9kOXy9UnsnrWYexT1fkIr5vmWp7XRFQ1rPykpZJ7lXIQEItOnMHu64DarkOVTbrm36
         HN1q3OY2o4IpWaisIyeQcKt6SHdrfTlTBKngAwKqYCFuT1NErQFfT80a5d9ExNGkFaXJ
         ut3UOCMH3qfGJscfpk3jD0Uz1fy/3l+yX5v4M7uOj/6lrteTykj9YjAdAH+3OAkJK//I
         +CuMgZ0LFpfWV0NkC2RTiP+ZS4/klx6oqdQNOyGAo5MVx0pP1Rb5mKUzp0oHrYm2Dguv
         nHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806545; x=1780411345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8DT19M6pQKyGnQLXpjshESdaPdBCoE5uHW9FdeRhlQs=;
        b=cY9URoEVc4DjoiK5p+XFf/GeVJfAP/FHMUljZ73rNk7Y31DeW/zRw9Rcz1AxhhQZYt
         7EXEFAQNjxaHgnlHZ8S/k+eR+IzgU3TlZemSHFiXR5j1mgw0G/YphVuL5cd0QpTQ33RR
         UfNuEIGbekqRmnkdj5ENCQKCYrCq/9pt4C1Pg3r0dD5j6d9ClixNaYDJ2xt8obaL3rdO
         KHbFPVMslhyOTU9lRwKNmzpuNFBINEEVj5I/LQ/0OY3/+8Se8VAyQX0tMElSMHU53UGB
         PztwkVA+F+YulUek1oG6Vk9AtlKgBmfKJbT5HMbF57vd14yB0xDJDaIxOEc857kracMG
         cASg==
X-Gm-Message-State: AOJu0YwvQjbRVVmV0vOxz8cnP+15pTmXfRXDy/1tZjgXAq5Smxitc23C
	JLRyoJ9LrzPsv/g1aQsyye9sXFyntO2iXMixkdJ59eqQwAopcjwwU3ZfS9o+CD9vEfrgRjn6xD7
	at+NVtSJUCP3TqwvNNiqW2tZSe0IV7E9pQghnEha4Fbu/tcMtxtdk0F7c6hHEyyFKiMoYfyzqNa
	jXKg==
X-Gm-Gg: Acq92OFQyXuOii9Lq7KaNacQf/NdugFgWz7z9hzbshJ6+RsvDNjV4q0RkJJOOcZA+wn
	vaWfc1dqJpvuj8jgh6dQllrqVjpfYd3z5ngbUco+0A9Fp6m+YUvGhMRMoHIr0xnrz2rNjz0NMiZ
	5isPT2xxKj967YgEL8G0u+kvQQ5rgXSM7jFNCCb0y+S5TtwWNOuHyfUgC4REMZfslbLyvKQMEQK
	1QnYJsifdVRoA4HbCiL89XcWhRyy9JkxHTWrnT9bfnY1pwlgOECZwYNWu26ifRh+Y8KCpodgmY5
	ZVQmDJsC/cpbHMueZsrCAXxCHB1YS830uxqwkT6FktHp0dFyMXnbNHkQo8BrN1x2DgxjKPbYkmG
	uwaz/+oQk6rC09CXVAG+JKCCp0rwjUqyRLbXKqXM9/QjWAr2x3O81
X-Received: by 2002:a05:6a00:1f11:b0:841:58b0:82c7 with SMTP id d2e1a72fcca58-8415f0efd10mr18388716b3a.8.1779806545499;
        Tue, 26 May 2026 07:42:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f11:b0:841:58b0:82c7 with SMTP id d2e1a72fcca58-8415f0efd10mr18388677b3a.8.1779806544992;
        Tue, 26 May 2026 07:42:24 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:24 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:04 +0530
Subject: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806527; l=1054;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=PUiL1di5z0y6rI3EPmKa71j71HOBjYrvAPS2lyn5wcU=;
 b=qwyYNob3QeroNmM+O1jx6rx5POgtChtC5hM3Hm5uGPCBB2RsdsoypthoZmgjsMf2N3zHCsl/e
 Oftw2IUs38qBTANvoudZtqGM2uTv4xEXg5SKwkblpLX5wNzNwyE1z/g
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a15b152 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wmxX9RSyIuGEu2EnybwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: h5rAnLwdFXQPdUIkzqw68LjbmY-q_F4N
X-Proofpoint-ORIG-GUID: h5rAnLwdFXQPdUIkzqw68LjbmY-q_F4N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX9pgYSMx4Q1ly
 b9QWSu5ILlGqeqfeRc0bD7hV8M+pPVyDCTtGe9o/iRyXadzSkrqJJuKJBEl9Ti9i/Xkp54J1DtK
 36jcMJtxObcnTJ+zPZ319bC54de9SEyBcq8Y6RaTgtPrW6LSIOgr09QAyLu2+ABmNNFfVJzmPTC
 BPJWGQgUflqZ4F/aR9SimMbIaRD+Kh2A2JVWHBO81EF3s2piHlbG0zwA5o/ur9Yp725UsSggwc2
 q14+NHA9XjlqSWvUqzKe5n+f48GKhlIF2vxla49018vbQHb6eiulsPziKFNudjg0Lb9CBu6K754
 uvbN57lpS9kTI1dTgOTA/2Ai2nNK/X4rpX1acPGxPB3X6toLwLdIveqB8o9VctuhxN06qS3Bwly
 Nv3QE7w1wX8z198qWmy4BeeHiwyz5IGLWuHyu972kZSo71LZG53KMT9XRGml6UwjYDgPWPoPJwL
 7Q2HpZE3jTtVC+7MSag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_074226_669227_BB2E5DFB 
X-CRM114-Status: GOOD (  13.10  )
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

On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gfx_0_tbu: tbu@3dd9000 {

-- 
2.34.1


