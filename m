Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F829CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5D86mAe9tSQpu4IKDYiGm3Glbc2HX616Avlpwus9lwA=; b=4gNal62NHdxVb207N9+3Y4g62Z
	bZNLqxuJwdgJhdREjF+c/CD7YWozTYyC69SP+/Eha8kF77Ziw6CgOYR3u0WbL0lg62q6HMv7yCUHt
	xrR5aDbI5AQOt5OgyP1BVyn5pNMQR751o7IGQdO99plXEm0gWIfDSHNIK0DBEs+mVlpzF+btCYz3K
	H2ojQMP3co5abVzrWmYNc76ys1vW5hFtn7wOn7hte84pZyRsEdisY5yLurM/UbFzi4udogWuekFQH
	cge9aq5x2ALEsRTakhRzj+RzdFmCNX7ohNc2KwTccvxfrMv1/Y/+y04/hf7IKQZtPZDNQIzZxMtCU
	hXbuNw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTx9U-0000000AJ0S-1hUx;
	Mon, 01 Jun 2026 07:33:36 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTx9P-0000000AIxW-2PpR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 07:33:34 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6511JVLY3684155;
	Mon, 1 Jun 2026 00:33:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=5D86mAe9tSQpu4IKDYiGm3Glb
	c2HX616Avlpwus9lwA=; b=K98d+YzK415Bo5VKUCrK9TqGEvMdLLOp4qIlPPGTt
	wgTjzoHa5HQKap/UrO3uBlVJOKPfxvdK1cOL1k+wLIxVj86Te8mRz6slRCO5sXWc
	T5IbGv8UjSzgSH4IMn6aJqT4VgpEl7X/LKAeKHA7EQ98xXAHuCV6ETOSQaYSQVLN
	TRL/Aln33JTea+8N3dktHyX956gv8hgYwp946l+krn80P/9wFQcjy08wkoGZj/XM
	loKXVm/io+FtjzkrfkqqPr0eAebBRNOSSJ0ZrFANTZefzUsuwyZg/i6Rekui4/NP
	qSU1fpEgni5ne8i33NP0n1+Tx3KjK4rePTNRHy91gumKw==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4eggn8atcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 00:33:25 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 1 Jun 2026 00:33:25 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Mon, 1 Jun 2026 00:33:25 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id 9C0533F7082;
	Mon,  1 Jun 2026 00:33:22 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH v8 1/3] dt-bindings: perf: marvell: Add CN20K DDR PMU binding
Date: Mon, 1 Jun 2026 13:03:16 +0530
Message-ID: <20260601073318.7098-2-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260601073318.7098-1-gakula@marvell.com>
References: <20260601073318.7098-1-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9BlceYkm59T64dSh0wUrpjjBh0EGlP_b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA3NSBTYWx0ZWRfX0V3GqUKlrVXS
 jwJ0QJ5H+HcZVHUiRFqaLDv1yMjADpesMvW5Y3KQNF5826xVHivdQLVjWjirlEYSVmj9s/mEROi
 Jxra8Q21Xi9BGfBmVBKxYIGw/5H1jT/EbWPXKVsIkVpUO1xWT9799A8qnP8/9XJk8rMJMDFTRvi
 +Bjf6vgIMDLJ/d7GVXrqOcTsykXGuaPQVu+Hk8rrzUxhGTxFE24bB2jbLZk4zG2Qb4uuOQBvLmO
 Qzghhxvrbchc+UuJ+NF4wpEuyR9SSDzjV6A3EUdwd9Z/YPG0EHwMzFk8DVVnC2peVGbTD/8aPUM
 UzDGdJFjYI94UfQITm7R7oOUNIrg7K9L7FFx4WfZzlhPAay9FuyXS84xILWEMD223cihfPvzCq4
 rGea7KesumPzmsjtJX8R6P86d9kwfpKsKcJ5/Eab2EIyVtqQqz4AUld6Xl4xSH57RT4mY2z6HQZ
 mQOitvoSf2pyOq3suxA==
X-Proofpoint-GUID: 9BlceYkm59T64dSh0wUrpjjBh0EGlP_b
X-Authority-Analysis: v=2.4 cv=ON0XGyaB c=1 sm=1 tr=0 ts=6a1d35c6 cx=c_pps
 a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=qit2iCtTFQkLgVSMPQTB:22 a=gEfo2CItAAAA:8 a=M5GUcnROAAAA:8 a=EUspDBNiAAAA:8
 a=cPq5-T7l7yds4WLDPVIA:9 a=sptkURWiP4Gy88Gu7hUp:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_003331_731783_B334019E 
X-CRM114-Status: GOOD (  10.84  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

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


