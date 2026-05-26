Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E402FCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBTg1eE/1oWssJcmckcNGbb5AVGahvXtqeWtCGgTeKw=; b=wtXZP7Tyt5I4lXCrnTariyhONl
	+iUMZ4jMJfr7Isj0eS6CHRyMC/r+Wv2FBRQS4ZSkfjD7K/ymCXiI3COOqsU5S27VfL/vZ2InUKWsp
	0gC6KBkoqeUP5iF2dk23CxvLw3EvWwwq4V0imBiTzY9PFbVzi81hVoot8qrQLIAFdRkFJk8cVICkW
	J+WVl+Ym6SkU70gTeWvOjdq1pM20WwNeHn2XnGb769KYeZR3fWaIj7UnmAblyWha28PUoMjKHRuRM
	G9mOGFeCnnew6wZN/5TwwAd8KkljwScUrRy3effehqkT/fznLA671MjmZgvrjcuWGapxdQvO/sp7Q
	tptigXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRusg-00000002Y7v-2ZhG;
	Tue, 26 May 2026 16:43:50 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRusZ-00000002Y4i-0ZQ2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:43:45 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QB7E0h3724400;
	Tue, 26 May 2026 09:43:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=BBTg1eE/1oWssJcmckcNGbb5A
	VGahvXtqeWtCGgTeKw=; b=hlJXfCZBvFWMiIHwT5tTONZDoXWphtgv9oOQ5TAg/
	sw9XkATGxlr/LoaUrcoyS+P1DMjJ17JRzHWSjN8BldIcYQBbc5cQRu7L1HlNPQtg
	neapQurjdQ6hWakC+i6juixXJ+zZAqZ5LtBjDo1Piy/4Ece9ik7RpKXXfkVeFzre
	f5qHm05+NvgBNcJKvIzp1J0PdEHWagpnZptDnnPQJ6+kwmDZ0Y82F80jvZhLmWRQ
	heEeHfdPBEDq51wE6Qhh47Ya3TQG9HLqyqSbZg7soClK9wCrye3t3Gvry9sm120p
	sYgo972b2VTyFDLP7Q0sGv684NAk83O+ayBTLu28j196A==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4ec0g6eq0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 May 2026 09:43:37 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 26 May 2026 09:43:37 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Tue, 26 May 2026 09:43:37 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id 2FE463F70C7;
	Tue, 26 May 2026 09:43:33 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH v6 1/2] dt-bindings: perf: marvell: Extend CN10K DDR PMU binding for CN20K
Date: Tue, 26 May 2026 22:13:29 +0530
Message-ID: <20260526164330.23878-2-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260526164330.23878-1-gakula@marvell.com>
References: <20260526164330.23878-1-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=BK6DalQG c=1 sm=1 tr=0 ts=6a15cdb9 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=TtqV-g6YmW1Jfm2GSLaY:22 a=gEfo2CItAAAA:8 a=M5GUcnROAAAA:8
 a=9AufDOCnfQXnCl7mI70A:9 a=sptkURWiP4Gy88Gu7hUp:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: JQhONNLmzFy8JI3PRJUCM-A422-pjb_Y
X-Proofpoint-ORIG-GUID: JQhONNLmzFy8JI3PRJUCM-A422-pjb_Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0NSBTYWx0ZWRfX006vW+oEXb/Y
 CCjzbJ+03PZ3ZM8XCSuBJuVYruM9UO0OckfmNXadLxlISXRYTG5mPjfEqkq5LCODAJ0SBylUf/5
 /YFticxLj1VtBRVNQndjpUZenRRXUw38Ae7/vCrVOusDkKYqJ0GoYbVxXw8Dg2lShy/ICfFYCx/
 pPW6ZN4sdkmCvEqJBLXvfD6zG4uALfT0Nwokp21sACkgHTQ9ch1qSugkWVAHhDmO20jhonQ6X/o
 fuy9+cvRRLuWhsyO8YF2Ye8pbfGMGzIB52rVhsNxrqbRYecKj5pXb3hZYDNrPg4liDp6HizN1Rz
 pAMkmG2NP8Zzp9ieyCULBKVVODl+qZvYk8eNopURWUR9czrC0Pp07/k7B6YZblNOuTTSIv6k3vt
 BnBC8ySIDUYq+iOloTyhnR0hU/haS2I+q8Dzj7zrBYRUzta1dKDKsqtIYukc5hEUNvFJjORO07f
 2Xxk++TO8i4mjxZ+L5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_094343_179630_6665D37A 
X-CRM114-Status: GOOD (  11.84  )
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

Changes in v6:
- dt-bindings: Document CN20K in the existing marvell-cn10k-ddr.yaml;
  add maintainer, description, compatible enum entry, and a CN20K example
  with unit-address aligned to reg.

Signed-off-by: Geetha sowjanya <gakula@marvell.com>
---
 .../bindings/perf/marvell-cn10k-ddr.yaml       | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/perf/marvell-cn10k-ddr.yaml b/Documentation/devicetree/bindings/perf/marvell-cn10k-ddr.yaml
index a18dd0a8c43a..79fae9fdb6f1 100644
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
@@ -35,3 +41,13 @@ examples:
             reg = <0x87e1 0xc0000000 0x0 0x10000>;
         };
     };
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pmu@c20000000000 {
+            compatible = "marvell,cn20k-ddr-pmu";
+            reg = <0xc200 0x00000000 0x0 0x100000>;
+        };
+    };
-- 
2.25.1


