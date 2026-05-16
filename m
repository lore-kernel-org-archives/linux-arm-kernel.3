Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2317CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v/qlA8PM2DTSSKhlDDk1SL7aX+U5Iuh8+Hnk2GoP4P0=; b=kD0ySzGvPXXtHI
	awmLQ+85NCbb+y7TiLvph7OupGV/qx4tCv02ozfe+B5WNNYhHkbdkLWmWb7jrvP4ccVM6V1r3myi8
	6MbKiUj7EYPAmKEdtweAMDLk1e0BBmF/kFp0CPKVunx4+9iFRF5gv4ko1rAZfBMUsNQJLBkLE1Lq8
	BDwy6BmVEe3FN8pFNS5nW5Qb3pn0G6dJSsirAYwMe0OTngERVEW8x96y2zP0gPQlwkBedbz/Zp+Aw
	VuG/Kg4Xrj7ojKibjVzVGheZj1VneEE1RG+U8sAElXcsV2VvvDictyUtRMbB4loCdCvg0Oasj5UVU
	bUJIucwSOspeXV/zskxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOEDo-0000000AigU-30Jf;
	Sat, 16 May 2026 12:34:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOEDl-0000000Aifj-1wIK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 12:34:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3iSTr3750636
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 12:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v/qlA8PM2DTSSKhlDDk1SL
	7aX+U5Iuh8+Hnk2GoP4P0=; b=NwCWa8Oe64/+tC+7G1YPgU4Sl+IxypHWpjZ6+U
	v3HMl/VIwq3Gz/+vSD82ELktoiGIT7WHPoFt62DX6rQnW/L9RElH0wySuO3lw2/c
	dPfxI/s7UH4sG0kKoFghl01BuSSVS3LbMNMgBN/IVeT3ffF5z9PS6ECcbxZj6W5z
	5m3nmPfPvUO9pQxUv00zgomy6m5ThIQ5ftSveZ8HSYnLuXzNXQVrw2C8+I+4WeE8
	/rVdErwnm1dpQVrvBg5FzMyBGHhF8tMPdwxCpxkNKQ803tv4vJR66AMj+5YOLzsx
	Bn5fnF0r4ulXRJiOkDVCLu2K4ChY0GytyDs3o2/PmyWqk/wA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6rtvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 12:34:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83536dc3be5so1103532b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 05:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778934859; x=1779539659; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/qlA8PM2DTSSKhlDDk1SL7aX+U5Iuh8+Hnk2GoP4P0=;
        b=OKBRaohCdqImtQs5q8StwfVOexd2iZg2QNLPgbSR2zmFAA7rCCv2G5iJDdWSisoXTy
         rYgRyg9u2OBCWCUnm8nOwQh5dQf1gQRurveTbPxILUZe5DvEXh2hgnN0TR1g9KQFjfZT
         rgdKdPyMzvXuF+HR8tfbGleozhCerI6Id5WxfNZH+rdntKrIHgXDDiibFWxUQNUaDrwj
         V691tra9KWyWyvvG5Hf80t0UQt18u0uhx4mr8dZmvofe+Li9TWpTF26hKlPKMLU9Wp7W
         Hql/FmL8FrVndk91YeCIesohv7DJK14uuzgC21UPwbx5xHOTTy7nSO0QLo26FPnBwydg
         Biyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778934859; x=1779539659;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/qlA8PM2DTSSKhlDDk1SL7aX+U5Iuh8+Hnk2GoP4P0=;
        b=CuAR1R3RBFA1Vpyn46d+VeEs7HBiumceuEJ+Q9fTw7Uv4XPglV2cabuBR89oud8lzv
         1HxTynD3ObmhH0rR4FtsGNFFA+8AI8r79qYbhMXijL8SXZ/E9a8xXepqDhPAQY9e/oMh
         CsvEFRN+AAtx0st3u8bGv+eW/GMNeqBe5/16B5eJBXWdKMy0/fqGgHFxQ2Fomu06r1p4
         HhoTPjq2NyRr+ci/dwA+eW5no8Zsew5qAGzX3LsAQFaStErebVf2DlWdCnz4iVb+tyPS
         a/DsGIsh92G7fkjyNATMbbBEfxZpoySrhFH7l1faXBEJDThzvAZTIM0TYjYExugSZnP2
         JEWQ==
X-Gm-Message-State: AOJu0Yyh+83JoAahzE4vRkdQg/Ua5kQ059X0Gkx/VAV2xjdJk4X5/B6V
	jYdegyqIzXEIn4rslnntWcLhgCbxmpXRwoMzwZG7xhwM/1Es6FIfHtpntajNO2/gKUPZCvO48qa
	QYPsw9YlkycdEYGzlYv+Hq+eVMXUaUoxzNfdg7BgiQgtvhHXAmYRmSIB4f/f18SsL7gKeACvhpi
	Q1WQ==
X-Gm-Gg: Acq92OHrtktEC0cJpxJ34yMUDNZ370o3lfLWndmYJUFlXRIwfonpebzMSsL6jf2Tt/3
	A4ENzsG181PdYJnMRoX2QioPrUVngNoscQOFSjdkaivo6UUnG+u+Cx9Waqem5JdgldLdNtSIapK
	eYjyZ1NqwPfubg28hiiz7+NTUQZcUNEo9KlNB3jAzN/bPZrr3abLn1GJY27HNbWqTuJ/v2+Lhqn
	ENlmQDPAoolN5eYqrS3ngONklPlTMZ2CsRtWT+7JwERSjRCOI5CC/cXuwStSw4TuIR4NewHgXjy
	UgRRRmiVtfXMSQ67k6uDoWGwZtIGrnMjZgDJe8Gl0IkL1jGZUDlQ9bacDufafuJL8KoZdT3j6kk
	sp6XS/ONlKT0l9UBjPcEWyRxAaH+450OCCFnKUAEZkG0wFlfFwWMb1Z50jUNGjbM=
X-Received: by 2002:a05:6a00:3028:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-83f33d9dc40mr8418947b3a.32.1778934858921;
        Sat, 16 May 2026 05:34:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-83f33d9dc40mr8418925b3a.32.1778934858440;
        Sat, 16 May 2026 05:34:18 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cc9asm11405217b3a.53.2026.05.16.05.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:34:18 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH 0/2] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Date: Sat, 16 May 2026 18:04:02 +0530
Message-Id: <20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADpkCGoC/x3MQQqAIBBA0avErBOsUKmrREQ4U82iKdQiiO6et
 HyL/x+IFJgidMUDgS6OvEtGVRbg10kWUozZUOvaalNZFbftHFkSBb+LkE/jhMgpZwpbY51pDLX
 oIA+OQDPf/7wf3vcDEL/MpGwAAAA=
X-Change-ID: 20260516-smmu_interconnect_addition-d9567535e9d7
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778934854; l=1960;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=wqpXfIpeij9xEfvUNcjaE+C+fgLfl5o0ZRfgRNcaWrA=;
 b=JhI5NIrTKt3Fz1WHFtw59UHAjtXkzMyTDK6UkYq9PmroRFC6ryp6bV7aLu3hq2ngBFuCBlEh4
 1OPRd2WhGNsD5MXrmvURzIV8+iuWhpm0brMLZ+Y/ntndjB1FeER/fa3
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-ORIG-GUID: nYDMUij2k2oGTPLxTLRpNVQvStijanK0
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a08644b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Z_0B4eLmBfDa8jkmzhEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: nYDMUij2k2oGTPLxTLRpNVQvStijanK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDEyMyBTYWx0ZWRfX2KFANKB3ncVx
 OScxr5KtgSV2BmdZqM1H2k4Tnsc3Q9Q760Z8ExA0fVYT9zwU/0OePQXCCr5D63SqqtL3n0Mfkov
 FRh/wxslzMBopOX4ZhJNMTqHbondRpqQ8h6ZGmF7SSJAmU2slYFZ+umCkLO/7ZrLvHXw4WtewIV
 LlyGOOGWQwr4zm4+zj70OiX4aTCx5RELXVMFqrIX/G7gd3bmu/s2+fn8vcL6JV+FpQYIR3oko2z
 hfVID4huRHjV6N3hvvyPExfcg2Asz6uYsrauAg+lXdJNGbYkk0l9vLVbaD+1hbMffVKhpsWk86J
 oXhBk1WnPHc9zPOpxirwpUItNVK4lxvR+IZUr5kDRl+5BjbyfRAUyTxuMnFn+dVg+5AD5mN3/B9
 vWYURfgnD+ih4+JOnkjMWCWbc6K375ntc5jwp3cpZnNC6nF3c0704Tt8vZnAH9zvrRZzO6D50Px
 sZke5h+8L/zz1Y1UqLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_053421_522167_4FC10591 
X-CRM114-Status: GOOD (  14.44  )
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

On some Qualcomm SoCs the SMMU register space is gated behind an
interconnect fabric that requires an active bandwidth vote before
registers can be accessed. In the common case this vote is held
implicitly by other clients (e.g. the GMU device holds a GEM_NOC
vote whenever the GPU is active), so the SMMU works without any
explicit vote from the driver.

However, during certain power transitions — specifically sleep/wakeup
sequences — the interconnect vote can be dropped before the SMMU is
powered down. If the SMMU is then accessed (e.g. during runtime
resume) while the vote is absent, register reads fail intermittently.
The precise ordering makes this difficult to reproduce consistently.

This series adds support for an optional interconnect path in the
arm-smmu driver. When an 'interconnects' property is present in the
SMMU device node, the driver acquires the path and votes for bandwidth
before any register access, releasing the vote on runtime suspend and
on error paths. Platforms that do not describe an interconnect path
are unaffected.

[PATCH 1/2] documents the optional 'interconnects' properties in the
arm,smmu DT binding.

[PATCH 2/2] implements the ICC path acquisition and bandwidth voting in
the arm-smmu driver.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
Bibek Kumar Patro (2):
      dt-bindings: iommu: arm,smmu: Document optional interconnects property
      iommu/arm-smmu: Add interconnect bandwidth voting support

 .../devicetree/bindings/iommu/arm,smmu.yaml        |  9 ++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c              | 53 +++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  2 +
 3 files changed, 63 insertions(+), 1 deletion(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260516-smmu_interconnect_addition-d9567535e9d7

Best regards,
-- 
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>


