Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E254BD6CFC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 04:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/l1S2/XkhKxi0y8V4e1zyGeS8o6irIB+Fs2D4iyt10=; b=1cX4lxXkChqcgvdLhjqXIcABt/
	ErpiEKx5Fx+KwdAYqyPAO7YY333H1MNCVSJJkW71RdqlM/pNjjygUnlaBqEQ0GoYH+IJxG4GCTRuy
	xzoNOP9M1z+AgIdGRrWwpFktkni/gxu2bBHDVZ6hgy1jJbK/22tmhMQdZ+OAmay7Rctikpb4yjKKm
	u/dV9JskkZ0VL+4UY3VRBFyoWb+KtnX82/FejtN5vsxZPq7PjRTAfj1yfXBQXr7L0rbhj5WZHpcUq
	mzLdn9nyT5DzR88jq1pE0Gkqsikn3fFathdUXUBYlNDWh1kVpZ1a234rYzUF7fb8EtFy9oddqfiMy
	gBiVUq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8tH-00000008CgH-0JLC;
	Fri, 23 Jan 2026 04:35:23 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8tB-00000008Ce3-1uw0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 04:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769142918; x=1800678918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AzrEWpdPn2lbCETjVwdiRVnFETmfw9lnNXNoG37WWGs=;
  b=je4sNEtrq0Erz/v/uECKXHkdq3U2sT9dlvF1XRivzz2pIpzuktPu6Lzv
   lnkfLYvWTLNmg50GuiJS9ITsnvfOmVErFselhESBu7H3ErjpVLGgS1YUW
   sHi60ZJ12qmQjS/NP2jhAMjuEI4G9khjcMCF3g6kYZzE0j7vAMw2+mzIj
   Vbik1Xy5LOaZlXtc+EtWyTaaJ1x3vokkkDK5PXMWKX0SddUf6iPDzVNem
   vPiPIPhPrIejEIH9+xG/XMBT6Zp7eA2PFOAtRJuuvPoi7LXlsTllMx15F
   Dt0g7L42jcMpOIqWG89e/gQXMu09oJ6m5b6Ul5CO+R9bGbQ2yxdU5pEWb
   w==;
X-CSE-ConnectionGUID: E0J5wDaSR+iUOVdA6G6oTA==
X-CSE-MsgGUID: 4N91+rf8QcaucwcWbpZ3Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="226750043"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="226750043"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:35:17 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 2463C1002836
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:35:16 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D1A56C060BB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:35:15 +0000 (UTC)
Received: from sm-arm-grace06.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 9F5A71001525;
	Fri, 23 Jan 2026 04:35:11 +0000 (UTC)
From: Shaopeng Tan <tan.shaopeng@fujitsu.com>
To: fenghuay@nvidia.com,
	reinette.chatre@intel.com,
	ben.horgan@arm.com,
	james.morse@arm.com,
	shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tan.shaopeng@fujitsu.com
Subject: [RFC PATCH 3/5] kselftests/resctrl: remove unnecessary exclude_idle
Date: Fri, 23 Jan 2026 13:40:29 +0900
Message-ID: <20260123044034.141247-4-tan.shaopeng@fujitsu.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_203517_775155_B21E0D36 
X-CRM114-Status: GOOD (  11.63  )
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

The Linux manual states regarding exclude_idle: "While you can currently
enable this for any event type, it is ignored for all but software events."
Also, it appears exclude_idle is not supported on Arm.
Therefore, remove it.

Signed-off-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
---
 tools/testing/selftests/resctrl/cache.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/cache.c b/tools/testing/selftests/resctrl/cache.c
index 1ff1104e6575..9a4a6c52b14c 100644
--- a/tools/testing/selftests/resctrl/cache.c
+++ b/tools/testing/selftests/resctrl/cache.c
@@ -13,7 +13,6 @@ void perf_event_attr_initialize(struct perf_event_attr *pea, __u64 config)
 	pea->read_format = PERF_FORMAT_GROUP;
 	pea->exclude_kernel = 1;
 	pea->exclude_hv = 1;
-	pea->exclude_idle = 1;
 	pea->exclude_callchain_kernel = 1;
 	pea->inherit = 1;
 	pea->exclude_guest = 1;
-- 
2.47.3


