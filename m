Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA48CCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 12:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jw0cReuBvl0p7xYPoFikX0tHkyYFstCR2xf8gOH3em0=; b=LbmbJ2CAw6yHkHk63twqjJcjP6
	3L56V4VhwRsCblo7yjlwoipgKKHRk+bOtK+r10LwXmjtSXV/+j5/fklWg4u/CHw6yBFNTg5BGFwEy
	Wj/4RZ4De6VpUoWx5cBafizjXK4MOaa0GP0SBgUDLze3Ya+uXiwRYHqZPSzo6xSyvzCGCclj3o6n2
	D9D+5YzQcAWrU2lohcH4xqt9xDo0Wqmll0Zjdyn6IT4fnAFfuUal31bXUzvPATYZWPhuDqOzqb5Pv
	BBH/RLq6BIMfD1SqkNYN8tI5F9OH1Hlw24vi/gQDMcDPyyKuBAbJ+Sd+e5K9HatQK8FtLwxwCl48P
	6V8jyCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOEDs-0000000AihY-3O45;
	Sat, 16 May 2026 12:34:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOEDo-0000000AigE-0TeH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 12:34:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G4eMVm002789
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 12:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jw0cReuBvl0p7xYPoFikX0tHkyYFstCR2xf8gOH3em0=; b=NQ4pcXERhzYssk+B
	N4JUNVLNprCKeNfSq4UTXr4H1qEwb8oqNeRCh9A23ITnl88Sqw4fcO7lUm1xAA1q
	8wKj84FLXmx3c4lhs3pzVfa7YPDi6z6kPVxHJIzMFxwhDZW251JciNtJ/lJVynxL
	adFwLBUhtMvkcaRUpDtE8Leode5vvOr9ZJZSC+xAPhpGohX4jV4gbgfSWac0R5ew
	Hy2O6nnt0KFBXi3GbeN4ldbCTCzmgmlnImgEMGnVT5xzOnhXYO3Qodtle1URdZJX
	rD3H5ms2e31hRDwK8KzkpEHyKqC6QBIXae5J5gYocOeA3BN5HlYTRtUuZZH+kYLn
	Hkan8A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hrggr50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 12:34:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c82751074c8so1029501a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 05:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778934863; x=1779539663; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jw0cReuBvl0p7xYPoFikX0tHkyYFstCR2xf8gOH3em0=;
        b=QEZUsU/FohTHROVdRXM0NJSra6Z6u6nFW/M/2jq92bf9xOhntSirLR6mqBSph4fjQK
         ++OkWpWcjjHZrTn5sSQ87HYXyQIrXA2l78XrqSC1HJfoxrRlLNqSEfMYBrTwh7pRF7Rm
         125+0rkseUj4/TIhmbt1pKLr1JkM+bQxc9vR7hTEGGRVkTVhD7mHGjCSLiVK3tXY/v3v
         j31FkxIYyjRdFcDBDIHacuQr6eEee/hdtf+FFN/sOxkO6GyXDtfPWw8q2tvaHRJlpkJ7
         i5fPCiArdzSjjwOG207s6DwQbvlm36aPYR2dE7GoUdVEs0cta8+TDpY8ZN0+ntIj0CAS
         QQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778934863; x=1779539663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jw0cReuBvl0p7xYPoFikX0tHkyYFstCR2xf8gOH3em0=;
        b=lzJ05t7LCBBVefYfcPXx9hlYqPBpOf8eH8NOjSS9+EgUCcCvaYGJPrj4aueqyPMxmv
         rDQxEj4LpMeANSY2P4qKxI3JDH501tDiHnEAV1c3ANzUiD0ZFqmVHZ7xSGN/+6Qd6XS1
         lli+kHq4mKE06lTNbV2gSIjUfWLPkwTdBn3p95lgS02oo97U10gfdyWnREv/7AQ65blt
         jrEFWOU2QdLqZ3FbTtPVha3vZCDn6dw8ugjvRzJWAyB5qemwzhTaIO31uPAcBWPlWYWn
         GB2CK9EgLjeCacgKokxjt67DBZVam+Jolcwj4UxJM/komqO9yXsajH3NRPrgxD+xkQSB
         f9xQ==
X-Gm-Message-State: AOJu0YwRBfobs6o5D4SszkhR53Z0GVGP1KiS+celMHRcYS7W4y3wqXJV
	5xbi5smiAOAhDV4B+iqxqVek85xHcRTOWKm23obSjlIWZDVCknS3lLYQ5oHuf499MVtYf6bk7nW
	/xgxKx/zv02Si3+EEfMumyMHmz/Jm1sZXmERrJA4SYi2c7OJvHQi1H3QoqrbLzMbjkMeFKY9McM
	Uc7Q==
X-Gm-Gg: Acq92OFoePuoAN4lhCHZWdVBPr5ta31NisFGePt+y4J3/GPs6j1it7mVDiRdhPlj/1E
	bLynOigCeuZhqvksGRu0bvNYV+i0SGm7Nm2I+D50ZBRASXSJ06PSHM1OQp6HU2vhCTfhETXiZui
	KrCMxuh04ERNzk/ScL2xOYntTz1pKE8A/FCztmvMWvFrifyDdrjq29mVI8f4W7cERVN0ztGVZYb
	eMzQ9wU/vIxad7MOsuDwR1Ho3dn3zaq1h4XnCHYO6FTKuFxKf3NbeVxQQlYWoK/+lQXXaC3emGh
	6MNN3M+zlu7h49ZTy7dOx7bFON+7qDYuP0/7qpjWDtdtES07dndzzD+BmLZhgpZuDMUiF9efAx9
	x0SB/wqnJ1fwSLTOftG991cIwUJHf0I55MblGuh0FgnMFS6FyykeM
X-Received: by 2002:a05:6a00:330c:b0:83f:9c6:9c with SMTP id d2e1a72fcca58-83f33c32d67mr8367660b3a.10.1778934863046;
        Sat, 16 May 2026 05:34:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:330c:b0:83f:9c6:9c with SMTP id d2e1a72fcca58-83f33c32d67mr8367629b3a.10.1778934862594;
        Sat, 16 May 2026 05:34:22 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cc9asm11405217b3a.53.2026.05.16.05.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:34:22 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Sat, 16 May 2026 18:04:03 +0530
Subject: [PATCH 1/2] dt-bindings: iommu: arm,smmu: Document optional
 interconnects property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-smmu_interconnect_addition-v1-1-f889d933f5c1@oss.qualcomm.com>
References: <20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com>
In-Reply-To: <20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778934854; l=1523;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=+ZLfc3QA+QBsQTaKp+HhzOK7CJ71bHrL5yqZzxvE/mg=;
 b=cApZ3bZQJ/56u9eFXAcmzjTKWoxsGgJHT9Bi/cl0ETuWX9o9MT14b3Fo6lOx3Pt0yomP7WFkP
 q9xu2/KDLtlAEnmD60hjWV+2pIhb9TEKp1TLdexxsINRIILaVNMoHF6
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-GUID: giWoYia2DeHKR4JAlS0Rhl_IgdxFXGz0
X-Authority-Analysis: v=2.4 cv=ApLeGu9P c=1 sm=1 tr=0 ts=6a08644f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=h2u_PYqE-o0iKWOXq5gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: giWoYia2DeHKR4JAlS0Rhl_IgdxFXGz0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDEyMyBTYWx0ZWRfX924BItoHrD8u
 etlR5TgSf9BL7K4+qr+yGqSsdHdscjuWBZgu/uRyuHSKzLGcL8lneogakPmjUgynYZVherozJGL
 8Rrc8Z6zCwlo7isp+ZiOAV5kMZUiqfaTWtbDYl6ZoZhULlbLNBIZisP7TEflf5/IuoZZ/FMc3Ng
 xajLYOHygbZT8ugx9xrEYSku0Ob0f6dh2a5vf2bHSzTvHcT2iIAiQeY9mNl6tT8rt07BEX7qJh3
 j4D8AgtCN0jN0pjQz/hV6/Fjzflg0GXfqpurzSN8/xdREjn8NDUrKpGG+c91TBhWv0RNu3nL8ow
 Li5gNtayW7arOuueLfzlitp5kg3WklLbFpc5pyAEoIjYKm/eY9MujW5e3bSn0mjQo5jGOWZmVRR
 Iv2BYJEHeOgF2q6sbYA7mGyY3ENGXg2XHFmrbRqb99kN2+MLPMvdrZMeMYQqlCUWM0/+O9/z2Kr
 x6PKpiOHoYKDUqAcBPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_053424_162601_D2BF41E3 
X-CRM114-Status: GOOD (  15.01  )
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

Some SoC implementations require a bandwidth vote on an interconnect
path before the SMMU register space is accessible. Add the optional
'interconnects' property to the binding to allow platform DT nodes
to describe this path.

The arm-smmu driver uses these properties to vote for bandwidth before
accessing any SMMU registers and releases the vote on runtime suspend.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547cb7a92823adc2772b94f747376a6..5cbf944f2d3e178b3723d4dbaa19ee0d33446979 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -243,6 +243,15 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+    description:
+      Optional interconnect path to the SMMU register space. On some SoCs
+      the SMMU registers are only accessible after a bandwidth vote has been
+      placed on the interconnect fabric. When present the driver votes for
+      bandwidth on this path before accessing any SMMU registers and releases
+      the vote on runtime suspend.
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.

-- 
2.34.1


