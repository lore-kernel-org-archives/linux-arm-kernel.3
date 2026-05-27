Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BC6CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 15:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDKaVgU/uqAUUgwIe7SfTOUIi/O764lV4nrmVXkUdWU=; b=zR/bSQ7ybVbK68yzR1ENEZERnS
	erhuFQNohGLerZAPL3JZCdrMD9gi7S/dG0MDtLIPwni6I9wSMm9/g79KtNzr+4vrErNYHhTkmMSpj
	avFvtxJMD452t60cidIeULwc+yFscsLnJmSUW2M9a6QItg0/oVB5DIzKvRWHgPuGF7Y5DEUUS9C5r
	pJKzZ+3gKZkFWnF/IsFwDWvGB6/NYcK3O5xUyOYyDNFTJd2ENQ/3gf3yD8sXT2f4NKhkGl9xpJynG
	QGbjLBZ4YMJE3mSMxRxdlAo+76V5eD17iasIoLXl28fmudlBc69y3QSfTbB7wd6s8n/axRHAJYkk5
	1H/XE7OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGO7-00000004QMy-2W4k;
	Wed, 27 May 2026 15:41:43 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGO1-00000004QLE-2iZ6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 15:41:39 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RAKh9i3853038;
	Wed, 27 May 2026 08:41:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=iDKaVgU/uqAUUgwIe7SfTOUIi
	/O764lV4nrmVXkUdWU=; b=baKAW8cgGMK6Plelv1f/b2xdDj+K4hLeYjptvaCJ4
	dnd/mieCSXh2oDLFq5tQ1QSZM/p/x67WPxwEUS/5TKduKkL10KaRigPSq/EjvHmA
	jbtwP31nmuPPVrDjlb29gcoBDZeVRwqaWJJOWxVUbvL87K1xd/ZJwEw1yVsRFp8C
	ExO7fCcJsXMQ4E35AByWzTCuyE3eHtl5ssJOdEmdOpFKhG/Ji8NTEY6nR07NFfXT
	FhK1DNCB24205hO47uOkMuxzKH5unUyJtTzQNgNvfnnmqTtXTQ0obyTLQd+AGf96
	BXpFJ+eV4qZvYDCPkGK/4cNcMCYCd2wZNx9UiacpS9zJQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4edxs6gueh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 May 2026 08:41:26 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 27 May 2026 08:41:25 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Wed, 27 May 2026 08:41:25 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id AF6933F7068;
	Wed, 27 May 2026 08:41:22 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH v7 1/2] dt-bindings: perf: marvell: Add CN20K DDR PMU binding
Date: Wed, 27 May 2026 21:11:17 +0530
Message-ID: <20260527154118.12884-2-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260527154118.12884-1-gakula@marvell.com>
References: <20260527154118.12884-1-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: FhN5udkyJK38i6kh7tk-dKGWiK1kg3kZ
X-Authority-Analysis: v=2.4 cv=ScjHsPRu c=1 sm=1 tr=0 ts=6a1710a6 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=qit2iCtTFQkLgVSMPQTB:22 a=gEfo2CItAAAA:8 a=M5GUcnROAAAA:8
 a=cPq5-T7l7yds4WLDPVIA:9 a=sptkURWiP4Gy88Gu7hUp:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: FhN5udkyJK38i6kh7tk-dKGWiK1kg3kZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE1NyBTYWx0ZWRfXwec3TSnidsLJ
 RknTZ+LNq2b8sxC0NT8i2Y2dGIefKfoM4OqQ1gUeLvkUjyZrscMt5TMYFUIl48hPFZjUhWAECuG
 r/3XofHhsPg/bFUnkZdscEi02pDl4iLa1xLZFDetYiYVImnu7zhiqMoztcW4KD/7Zxu8LH6r8it
 aIOL4Wr+rdL4DFWrFIXKNXpMYeR2kY/U16TDXtDFpQIo2whdgroK/Ype8lmspeoRMJHpjjtVfXG
 ArSlXz/dVWd5SckGOlbuVe1vS5wzVc/afVBnFOm2H2RkzUppU3sXR6J/+0aVSkgTlLK55lYLi6/
 4qTmeJKZeFKUDT/8/P81iWPR0JVsl0jPufadSjbWdEYgj+uV5bJ1NamoOcZgJy85HJEJdiqyyd2
 rzsnW850dHFya/CULaSH0/UKac51Bz1J6NWj9/SMovKsiT+mN8Qx9DqcvaVp6cEoo1ta/oiHJES
 tjf8m644B3SowUJdE9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_084137_808636_DAA05686 
X-CRM114-Status: GOOD (  11.20  )
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

Marvell CN20K SoCs integrate a DDR Performance Monitoring Unit (PMU)
associated with the DDR controller. The block provides hardware counters
to monitor DDR traffic and performance events and is accessed via a
dedicated MMIO region.

The CN20K DDR PMU is functionally equivalent to the CN10K DDR PMU, with
minor register offset differences.

Signed-off-by: Geetha sowjanya <gakula@marvell.com>
---

Changes in v7:
- Dropped the CN20K DeviceTree example.

Changes in v6:
- dt-bindings: Document CN20K in the existing marvell-cn10k-ddr.yaml;
  add maintainer, description, compatible enum entry, and a CN20K example
  with unit-address aligned to reg.

 .../devicetree/bindings/perf/marvell-cn10k-ddr.yaml       | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/perf/marvell-cn10k-ddr.yaml b/Documentation/devicetree/bindings/perf/marvell-cn10k-ddr.yaml
index a18dd0a8c43a..f2f0d6b61eac 100644
--- a/Documentation/devicetree/bindings/perf/marvell-cn10k-ddr.yaml
+++ b/Documentation/devicetree/bindings/perf/marvell-cn10k-ddr.yaml
@@ -4,16 +4,22 @@
 $id: http://devicetree.org/schemas/perf/marvell-cn10k-ddr.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Marvell CN10K DDR performance monitor
+title: Marvell CN10K / CN20K DDR performance monitor
+
+description:
+  Performance Monitoring Unit (PMU) for the DDR controller on Marvell
+  CN10K and CN20K SoCs. The block is accessed via a dedicated MMIO region.
 
 maintainers:
   - Bharat Bhushan <bbhushan2@marvell.com>
+  - Geetha sowjanya <gakula@marvell.com>
 
 properties:
   compatible:
     items:
       - enum:
           - marvell,cn10k-ddr-pmu
+          - marvell,cn20k-ddr-pmu
 
   reg:
     maxItems: 1
-- 
2.25.1


