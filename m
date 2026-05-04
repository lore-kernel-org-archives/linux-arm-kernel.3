Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62912CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCE6JH9CRlAZCEsBvLqMNoyr3/ZelpavSG/0UEYXErs=; b=0cZXnPtX9JvLAbRhaP3mL/BxYG
	CCX5GCmwm7TYi9CqUXyYGoxlYPvCk+/RjfEfbK5rkLD7HzwqsBDfC4hFEatqiy/1WcV5NU3W0KJb/
	wQChHjNjtu6l+T2r9GWKQOvHW+eGcXwwUzh+zH8zGeeFcTycRnD5sh/EzEFH6ocgk/zdq1znYCn1L
	Nd9GsY1TXCurc0t6/7hunzJqJDeb6F0WGSS/e3yE7KoXZv7nRCqIdZu28E1mKv3GgvBDZOw0rF06p
	XUICkH70C1LiTjk/CfkwCz/wX/+ftrcdb8NJkNvDElpxj5ouC/wSXNmRDmNcXpo7PK1h3u9OIGURl
	Z3nevL9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtUD-0000000DKNU-3clV;
	Mon, 04 May 2026 13:37:25 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtUB-0000000DKMd-0pF7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 13:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1777901843; x=1809437843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mCE6JH9CRlAZCEsBvLqMNoyr3/ZelpavSG/0UEYXErs=;
  b=TxYD41t9UNnFtOr48aYnlL16YWpkuQ3UftikWRrj1clawvpatIK6NLmc
   XaXREcbCdO8DRMQoVh9yzahe0qL6oL6OimrsizuBUNEeljWc5yWXoWrwu
   dnTG1Otq0lMa3YRv4RSGrU9uP5XTjOuWmMbxral2OssNOOm1NqvdPIzKD
   mhtBETxJ1y66xBzZDbft0cApTPay4kcvjEQIRdBjIt2GlZFCd7otscYE7
   foqGEKxvFRfibiM0ef5Lo/6Bm9liV+gDrh6FN3ij8fpswig3ZcXOU72y4
   7LReJbgS81h21Wls2Eo8GMbU5j/DlWRUxan+Zy7Io74mGUqM6YMDv8CrK
   g==;
X-CSE-ConnectionGUID: j5BOBbQAQvGWv871vytCSw==
X-CSE-MsgGUID: Z3/mLQI3S7Kp38xE9hy0Jg==
X-IronPort-AV: E=Sophos;i="6.23,215,1770595200"; 
   d="scan'208";a="18775859"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 13:37:17 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:8570]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.227:2525] with esmtp (Farcaster)
 id 382ad3c0-3a31-436a-aa72-fa9330aea906; Mon, 4 May 2026 13:37:16 +0000 (UTC)
X-Farcaster-Flow-ID: 382ad3c0-3a31-436a-aa72-fa9330aea906
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Mon, 4 May 2026 13:37:16 +0000
Received: from dev-dsk-avivb-1b-e28f450e.eu-west-1.amazon.com (10.15.33.9) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Mon, 4 May 2026 13:37:15 +0000
From: Aviv Bakal <avivb@amazon.com>
To: <sashiko-bot@kernel.org>
CC: <robin.murphy@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <zeev@amazon.com>, <blakgeof@amazon.com>
Subject: Re: [PATCH] perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5
Date: Mon, 4 May 2026 16:37:10 +0300
Message-ID: <20260504133712.21085-1-avivb@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260503162039.E185EC2BCB4@smtp.kernel.org>
References: <20260503162039.E185EC2BCB4@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.15.33.9]
X-ClientProxiedBy: EX19D036UWB002.ant.amazon.com (10.13.139.139) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_063723_290904_E0629F30 
X-CRM114-Status: GOOD (  13.32  )
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

> Will this cross-wire the DTC domains?
> In arm_cmn_init_dtcs(), the cmn->dns array is sorted by logid, and the
> cmn->dtc array is populated sequentially based on this sorted order.
> During PMU event programming, the driver uses the domain ID (dn->dtc) as an
> index into the cmn->dtc array.
> If the physical layout of the DTC XPs causes their xp->logid values (typically
> y * mesh_x + x) to sort differently than their computed domain IDs, wouldn't
> the cmn->dtc array be misaligned?
> For example, a Domain 1 DTC at (5,0) has a smaller logid (5) than a Domain 0
> DTC at (0,6) (60), meaning Domain 1 would incorrectly occupy cmn->dtc[0]. This
> cross-wiring could cause PMU events to program the wrong physical DTC hardware
> and map IRQs to the wrong domains, resulting in incorrect performance
> statistics and unhandled interrupts.
> Would it be better to assign the computed domain ID to the logical ID here
> using dn->logid = xp->dtc?

Good catch on the cleanliness — I'll switch to dn->logid = xp->dtc.

That said, the two approaches are equivalent on this hardware. The four
DTCs discovered on Graviton5 are:

  pmu_base    xp->dtc  xp->logid
  c030d900    0        0
  e430d900    1        9
  c370d900    2        130
  e770d900    3        139

The xp->logid values (0, 9, 130, 139) sort in the same order as the
domain IDs (0, 1, 2, 3), so arm_cmn_node_cmp produces the same sorted
sequence either way, and dtc_idx++ assigns the same indices.

This follows from the topology: arm_cmn_graviton5_dtc_domain() computes
domain = (x/5) + (y/7)*2 over the 10x14 mesh, which increases
monotonically with the row-major XP position that logid encodes. So the
sort orders can't diverge for this mesh geometry.

Still, using xp->dtc is cleaner and more obviously correct — the logid
directly reflects the domain ID rather than relying on sort-order
equivalence. I'll update the patch.

