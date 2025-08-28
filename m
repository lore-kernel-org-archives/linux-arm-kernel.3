Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E25CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+R9FlvtB5DBD9MbgaBe0G9oR+n+eBr41Ts62Yq9hEFA=; b=Jnv5/MM2CTpWiN
	s5I/LFxtm7Zo/mUhF3ThSoguqoHV5Xp8uB7f4OgeC2U0RMlOsDOgIs3RuUPSGa/3IDDeSdh9IdMuY
	iaMWtoiJZl4AGjROMQH/d4ivPU6z9IXD9bc21orF4Ac4ORE5ybU/yPq6v+fu0dkgc0G6JGxQ7cg3l
	F6ZuopRmMCRtkR5SNYks9733Tl1Pds/OOnbFg6kwyzjUwpEiSqSyRLDf5gm86C5wE0d9NWLSk/EOB
	dbY9d6qTXaPs7LMbILy0AE74IDxlIbUw9DlCm2OztJQ0OnzLFaHJDWsk4sG2n+w+1tt/Op2TeMyeF
	JtnbO88mzngII57SrBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZkY-000000017qz-0bAK;
	Thu, 28 Aug 2025 10:20:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYun-00000000xjq-0b4z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:27:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S51TEj029322
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+R9FlvtB5DBD9MbgaBe0G9
	oR+n+eBr41Ts62Yq9hEFA=; b=FqeLVVHgNUrUFUccrdByhf8d7BEAeH7Q8u4jmB
	2RoWLGv0WmXidDQHub+XHpq7WBHRjzQ3hZZ3tA04xZMOpGYqj9A3O8XTURouXu3A
	jtVy5XI6ug8wXUw9568htF3N2s6q0ma7OSM52bNnLvGybzqC0uAeRJohm0Ql+Wgo
	pl2ApNDTJAOIkQofpHy1Mf9SfvKpVdzZ46iiBSLoa0nCTUzKatMjZCoRqBdIvlEF
	vUZATbqJjruvJIrSQKkyBkwviR4Hx00nZJ2gVdF6ua7WcWnr1xiMajgFIJnFJ/X3
	yQ06XHkjZYJjHmDB7eCHVDAtZiPHaiR0HJgF6EdG2b82R4iQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2yvj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:27:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-246de620e6bso19639385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 02:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756373247; x=1756978047;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+R9FlvtB5DBD9MbgaBe0G9oR+n+eBr41Ts62Yq9hEFA=;
        b=hErElufJBDodDF8SMouZoPbY1L/PjqLMBeVYHlZxomKeO4b3CBbTQ8H0ZlMcWlwX4q
         9++ToE68L88vZ/HNNyDcqi5rOslGypyZOwZFjpvYb2lhceuh09GiLyCZR7MMjv09GPc5
         jF1OYrgBETuQL+I9EwRXJ1C4pQSxwOC4WgLKp/Od+WKW6PR+byBnSuYdVUXS9SBT2KJh
         pkyifvX2w+bLkgX+7n1Wu2Y+46+v1N/JBcuvA0pHA4hJcKR4pj0AlkE+7FQ9uOcvivf9
         P8ty99d8f+KoMxaEt8rdUutULu4Cb1nMg1x2sDaO5HG8RQ7soJ3PHvsIrdVRdiXue9Ps
         uosQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0cnOA2eBKaGghU34EJqXKYi8aMtFbKaVt2ubn5LqTBWmtTyKyt8lE8XYWOOJWlSErebmj0FV247jbdJEMqu0o@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+vzhjFQo7o1RGeYkJe/ibSE0InlXqkFmPKVAFImvti15oubiP
	yo/s9kMmf1LuchOj8yUsfPZyu1PArnDdJOnXA62PEggktpB0WENQ/RBmHNhEcKZBqvrSPqv2GCG
	vPtJgS1w1xik5IZKgjtJRGiUNPgdroDdq5BmTlddXlhMvHyEnCR0uOhkPS4zgXIU3EAYW6ufsJl
	7LlQ==
X-Gm-Gg: ASbGncvuxJ36UmTTdl9v9oO7s9kNVElPJEgA3TjnKjrZEmj/M/ddKRpn0PS8h7BlZE4
	U87ztUIRk0iNIy5p2jbRNpH3WuFGrkQsm8yzDw1iT+ki2ntNT0d4gT917Uga4Be5IiICbAVd0OH
	fD/5XgCa+UBQUCCJMkKewT29nF+Rrxdd5YX4AtmvZ/hvsAmbkw8By0seNbApp2LTdUgaI2c+K4S
	5mR581AdHXXJolZHSzOtiWg4m+44IMJWPi8nKi8lo4gotHwZuF5sF4VAUKvqExMDpX/uncVgV6o
	cLSp0kMSwxfaWoPij8OAoQPlE3LqITjfDikWgZ2A68qmYQjm0KHpOEVvUxQFw6nxcBqPsU6b7tq
	UA7p83aqyuRSlbaEr8T1LAQ==
X-Received: by 2002:a17:903:38cc:b0:246:2cb3:5768 with SMTP id d9443c01a7336-248753a2bd8mr119449305ad.30.1756373246916;
        Thu, 28 Aug 2025 02:27:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxz54QfBeeANm1Mg3jqliReUDNjYOnWOmNkEg2Int6lFhWZh1T5+xjUbSHeCwCMBvkxsM8RQ==
X-Received: by 2002:a17:903:38cc:b0:246:2cb3:5768 with SMTP id d9443c01a7336-248753a2bd8mr119448925ad.30.1756373246396;
        Thu, 28 Aug 2025 02:27:26 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246ed91ee20sm92497015ad.136.2025.08.28.02.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 02:27:26 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH v3 0/3] coresight-tnoc: Add support for Interconnect TNOC
Date: Thu, 28 Aug 2025 02:27:21 -0700
Message-Id: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPogsGgC/22MzQrCMBAGX6XkbEqySX/05HuIhzbZ2gXbaFKDU
 vrupgVBxMvCLN/MzAJ6wsAO2cw8RgrkxgRqlzHTN+MFOdnEDAQUopYFp2l0hutSQKWsbGthWNr
 ePHb03Dqnc+KewuT8a8tGuX5/C1FywUswNequaqyCowshvz+aq3HDkKfD1lCEb3n/kSHJYAWWL
 WqN0P2Rl2V5A/SpbjveAAAA
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756373245; l=1882;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=UZn1e/0QvG5mcFs0SicONTgp5MkJcxhTgH/qXUOPqHM=;
 b=5VRyT8mvsMZTvKcbUoKzMdYJSJHBUeFfYA72DcRGlU9FwKOHc3xVkJXJ0DKDPy1rLuzZyvRMr
 bBSAjcTFTVKAPlKlLEDBXtfxAFVXeekAglNonHiaB8LbqnCy41XIA8K
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68b020ff cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=s8j_kBg_6ddNrZYoh_kA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX0NNbgS7Y39ZJ
 1FJ7PvbuDsUtA8+YSbVC6teBWV98BrXZsHmiDNsNhhBPfRl1jeDktw8v7LScBgMl/dngaD2kgpV
 O+bmuawsqoBInLEL7AMdjf5OUoiY9Ot7GQA4B8XjrhLzOVve+GU57w4n5Si0dZy9aSiBmBDhxOL
 PpLgwK3WMaShXmogQNbEC6Qp/fWzMUg59ufubDXXeD754F1NnH8ehRelq4Srm9SAaBcA1CcSJeF
 JRvPLmsKLDd5D0db6JUlQbf9FNU10NThy0uqk2LmbGQuEXY/9X6C/M+lmb/Q2G4+VpljUt73mdt
 MFPj/9BTxRFgrDX9IhRWca/efLxHAB5j6tYQfic0eiNHl9914dPZuWbLKumh7vrKvEbig++SUTI
 5T7HESSJ
X-Proofpoint-GUID: WOZPxjHQKVSVaxFh_osizMBo98FzoKIo
X-Proofpoint-ORIG-GUID: WOZPxjHQKVSVaxFh_osizMBo98FzoKIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_022729_192049_D13F7531 
X-CRM114-Status: GOOD (  17.37  )
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

 .../bindings/arm/qcom,coresight-itnoc.yaml         |  90 +++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.c       | 139 +++++++++++++++++++--
 2 files changed, 216 insertions(+), 13 deletions(-)
---
base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
change-id: 20250815-itnoc-460273d1b80c

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


