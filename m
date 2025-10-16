Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159C8CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 05:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I0tZsr+X9rb2BkuKPKohL8wWGapUv709og7lMSnyxu8=; b=ctHNhWyuF4S6nl
	iYF3KqJQHnX0R5CNWXUg4eMsCGrdcGyjjKnsp7UbbN4Cvb+TZ5M2eLLuYOC2fJxCgBSaIzeidag2g
	pw3PaSJOqn2pph93kEVYgR23rD32qWlUyEwg+t578aavLb8NGWtcPDSNOnwXWUNZp3YyEkWidQ3mW
	gSU50vyPJq8YcQ0YjkZlcf6Ora3M+BVhEtrCGLjQdJDfnHTIDwDzjzNntlOLl2sExZYL65B68uOyC
	a0kJBeEpJ4jsQZ7hQEhRLSUr0JUbv3wc71d6TKuJDHpZKP8sUV0+Dx/GRdg2BY8l50q8MnYaMHrVN
	RpLY6/duYs3yASiV7dLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Gru-00000003Wz0-12uL;
	Thu, 16 Oct 2025 05:49:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Grr-00000003Wxm-0iDz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 05:49:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FK1rZ4015343
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 05:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I0tZsr+X9rb2BkuKPKohL8
	wWGapUv709og7lMSnyxu8=; b=CnD6QQF8FLP6PSSuQz7seslyPRmsm7yJz2mbfZ
	d1yESe+nLBhWcj8HvqsIufGA0lUGP8IP7rpHOEpG6zB8vWbnm/HuFu00Q7E5vfhm
	Zak5EwNKfnh+f33ceb3EJq0Jlu/p+rfpD7RJjHiqIhVqq5UyI/m7cWLUCPVxey8X
	vKdNO4A97UMdYxdk/JeBgCkQEVcJ+xw6Dg4eVql0ZlKdyNlZzc+LGNFs5Cs0DgxZ
	veM79BT07k2Nl+slYSJxzOEcZWOlKg/KMb6RMM6J534kpdGx7gWZJvHnIkyofEQr
	nPwME65qaYAWBQbyoBq8FEJHuAqrJKRCbmmNHOmRmxJaeVeQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5q7en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 05:49:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780d26fb6b4so341728b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 22:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760593776; x=1761198576;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0tZsr+X9rb2BkuKPKohL8wWGapUv709og7lMSnyxu8=;
        b=GA15cozi0wv+shCqoWWAT8947XzZx4pE0OYf2zTU5LbU2NwNQX+L4BT8DKwN1v4e4r
         ZNaZRRgXnw3MlHDcGUtTUzEhB7xt/Xar+Mahovbt6aWIZMvHWMsMUaQ8IsA3i6oqQ1mn
         vdAYbCQgKYh1i3PVAutjqedLmeJbIPredFkyTOW9T0Bd0nH5q34RehoSFx3uqdw9dO1t
         IY1CxptFlHIpaxaYSbJg4Qe6kyPdompWbecNDdkswN3e2Hkr3mnOFAmzck7DliNPpN5m
         j6Yx/dQaq34Pt4XvHXGLy7KJHhGd3+62+rZZTBjicfdqm4XWR82rFNzILBmukAXgkUQf
         MR9w==
X-Forwarded-Encrypted: i=1; AJvYcCWmHzobwsqAdfXKD//GTlEXNSIENFZQyDqyE6mmLUxDdWorfzL7tvx/v0PTgCYKC71QWh7lKL7eoX0JjsD37ooS@lists.infradead.org
X-Gm-Message-State: AOJu0YzddamtH+RizOBsLul/QUIUHr5J3DITNZJzd4nRAG+oIDKpgbZR
	+kRGQF/jAhUSay+z/GxMSxuhg3WOiZTZLYvMw53I243kdnRdiPnedDM5gCa4CDUPyhYx/OffIVE
	Wxk7I9usj9YMU0Jp1fV2tL5cmxkJkB7LxA8RiMjH7ByaVq41XMApm6o9xZsL/afO0RUu5GUYK8S
	/98Q==
X-Gm-Gg: ASbGnctE/7tI8pVfvzXrro1PPFoMIKxtNIstCNhVs9RLHEDFvMNUQbQPGzmY/Rxc/w2
	U3tn1hfdM7S/0A6uqvKXupN2mjhEDQJM20ixD71SwBh3XZ/EgpdIqYbpkfKD40AYyRITiHw+joj
	anka25bJRKd9C55joaYA0B46+S+n0gbbFvUtQYT1wposgm4cjWpDEYaIPAds6aJhtdTT1tMBtRV
	cq9iN38MIERT9kzaI9ulOrDBlZH7pawLblQsTIDNyDntzuxCqVnnGDLGesuOSReYQyuWAlzYebD
	5deua3KWH+sTuUDmJGdrpO42KsRGb0qnOcxcJ9EuICc3EWNep0VP/yEQozcctpjWtUFxDaRu5uO
	SGSK43RTyFo6YxUUdf9QvhVBeYgH9LO9rugobH9x4QWLU/PTyzWax2nKj
X-Received: by 2002:a05:6a00:1741:b0:781:239d:f2da with SMTP id d2e1a72fcca58-793881ed30emr38449559b3a.31.1760593776125;
        Wed, 15 Oct 2025 22:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOEd8rbHYWJ4eDFljVCyqfTRjJpdU/axG94GWTg9wQOR3qSxhEvQY8QQFNQQjxay2ed5LGew==
X-Received: by 2002:a05:6a00:1741:b0:781:239d:f2da with SMTP id d2e1a72fcca58-793881ed30emr38449528b3a.31.1760593775634;
        Wed, 15 Oct 2025 22:49:35 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm20657931b3a.59.2025.10.15.22.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 22:49:35 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH v5 0/3] coresight-tnoc: Add support for Interconnect TNOC
Date: Wed, 15 Oct 2025 22:49:29 -0700
Message-Id: <20251015-itnoc-v5-0-d7ca2b1cc6df@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGmH8GgC/3XM0QrCIBTG8VcZXmfoUTfrqveILpweS2iz5hrF2
 LvngsGIuhE+Ob//SBJ2ARPZFyPpcAgpxDYPtSmIvZj2jDS4vAkwUExzRUPfRktlyaASjteaWZJ
 vbx368Px0jqe8LyH1sXt9sgOff78LA6eMlmA1Sl8ZJ+AQU9reH+ZqY9Ns80Pm0ABrvFswZAyOY
 VmjlAj+DxYrDHrBImPPa6UcmspA9QfLFRZ8wXLGzNcMvQYw6geepukNutT3HVgBAAA=
X-Change-ID: 20250815-itnoc-460273d1b80c
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760593774; l=2209;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=tBet7xd9Ix+7i7/6lFaf25DY48b+0wTDWRETSg/THcQ=;
 b=RnRTpb6h4DuPTqsO4yzM0bLovGuaYSg4CV2VXLkDeCrzyef6OtHsSZnX/b+LiQSpbecFSzirM
 zZUkt9VJfKVBAN6+piSxOV0Aw0ILK4ICDei1gMGApxtmXJVIvXynMfA
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: 6ISi5BhpPuncYZJk12WyHtlfK5PY6d1F
X-Proofpoint-ORIG-GUID: 6ISi5BhpPuncYZJk12WyHtlfK5PY6d1F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX461jrZa5Dnj9
 ytonERAdfEWNRZs/G+tGCPpkcaGWqjyr+qOG+96E3AuTb/hWVvmwKuGhqjY14PPCfY677c/8WYG
 zhsbZEIxPItI5taQqA2DIgjmdUatg/okbtjrNR3O0yWISnBerMlnSilRcMQKcheoys/dSzQruMM
 dzGgv6bGMnNHhSBILWvcQAuaDpr5b/zNXlVMPK3Zib90zGVxDyDht+KOpNJz3MAo2wUeCaSjSza
 3jMMbF6tIqR0oA7hmAy8e+4KlkvyzTyl/1t7PKoEiuUNEhEuhh5jdD3GeRhEqTedLxiq/uuMjrP
 MMibk3oKOUlAEIUEnBjOIP4gBFW9YIXONnJuxeXzeC2LX4AZaSf2E0AxvZIlBvdeLVsm7zldf4B
 ZYSFx76Zmx1c2+CSmEKh4lRCRTLx7A==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f08771 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G-CQVniXWX8y_UMPSkYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_224939_355571_BFCCB887 
X-CRM114-Status: GOOD (  17.54  )
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

This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
(Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
this block does not support aggregation or ATID assignment.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
Changes in v5:
- Add the missing review-by tag for patch 3.
- Link to v4: https://lore.kernel.org/r/20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com

Changes in v4:
- Fix unintended blank line removals in trace_noc_enable_hw.
- Link to v3: https://lore.kernel.org/r/20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com

Changes in v3:
- Add detail for changes in V2.
- Remove '#address-cells' and '#size-cells' properties from in-ports field.
- Fix comment indentation for packet description.
- Link to v2: https://lore.kernel.org/r/20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com

Changes in v2:
- Removed the trailing '|' after the description in qcom,coresight-itnoc.yaml.
- Dropped the 'select' section from the YAML file.
- Updated node name to use a more generic naming convention.
- Removed the 'items' property from the compatible field.
- Deleted the description for the reg property.
- Dropped clock-names and adjusted the order of clock-names and clocks.
- Moved additionalProperties to follow the $ref of out-ports.
- Change "atid" type from u32 to int, set it as "-EOPNOTSUPP" for non-AMBA device.
- Link to v1: https://lore.kernel.org/r/20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com

---
Yuanfang Zhang (3):
      dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
      coresight-tnoc: add platform driver to support Interconnect TNOC
      coresight-tnoc: Add runtime PM support for Interconnect TNOC

 .../bindings/arm/qcom,coresight-itnoc.yaml         |  90 ++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.c       | 136 +++++++++++++++++++--
 2 files changed, 215 insertions(+), 11 deletions(-)
---
base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
change-id: 20250815-itnoc-460273d1b80c

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


