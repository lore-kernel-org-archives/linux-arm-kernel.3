Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86A8D6CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 04:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgTNu3Z2zxrjR7vpMz2hp/RsnF/RlUrjFOhnE+0RhLg=; b=AyjAbuSXyGemvRSPXSZ9tW+Hlq
	b9jyFgaSXUK9Db3fRx5PElTdUrX97+prvQ445KXkh9FQFghHpcw0JBalzcfkC6gTwVzhR9oNAeHXs
	eh5WLEtQuuaYmgCufHX51W/s8brdSvn29kkt9b4fXkS8L9xkpilbULuVUgFIp+pkPUEzJoUv4hnRj
	moiHsCYY+SQBFKtIbLjFQO7Hi4UWJvZRD1ziSTSZ1/u53q5xRcSjNIJmLcCDlHQzLmD/zpxIdhxp1
	rI4JMf2EAcKES33C4kpkcjLUywJY7N5CIYFALXO98TRVA8Hb9zSbXyd/zvgUqZwJWf7A1aMZzGhMl
	wbiuG+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8tG-00000008Cg0-3Hq6;
	Fri, 23 Jan 2026 04:35:22 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8t9-00000008Ce3-2mDt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 04:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769142916; x=1800678916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E20KvvUHj07LhgVAFxu8+QqX2a/r8ZIupvRwxelIVQU=;
  b=lSg8Qkus1BjGcEBHF1+GAMO6wunLqweFSjT2t5GIkJW59vetkaA0sA99
   8knn2FGFdyWTX4vXBvNux92jRnrRUAsLuc1R68YARAVabRV2KS43GaMqh
   3h5S44LIVDhN4o2nb6Kw6N9ouBC+agxoFF9dIyoq7wKhAZJ3Uv+QhlG64
   N8VuIkjW6t+M6bBnhFPI8mgehbIxzk3OFNSm/AqgEVPhCIbR2v+DEztgR
   7ERd/xyUayN+vRFv+NdsCoUTxvQGJzFW7WsGYES6fjp6KvJ53K76l1TRD
   Iz0TepHKGKNiOozjc/2bz9+H81xSyZhUZc55sR2oqpvwET3gOXgdjdesF
   g==;
X-CSE-ConnectionGUID: whRGScA4SK6l+SbUSm5pJg==
X-CSE-MsgGUID: xLo75q+3SXmV90ZZSBaLZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="226750035"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="226750035"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:35:13 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id C0B31733C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:35:12 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 778981C100B9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:35:12 +0000 (UTC)
Received: from sm-arm-grace06.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 6188E1001536;
	Fri, 23 Jan 2026 04:35:08 +0000 (UTC)
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
Subject: [RFC PATCH 2/5] kselftests/resctrl: enable noncont_cat for MPAM
Date: Fri, 23 Jan 2026 13:40:28 +0900
Message-ID: <20260123044034.141247-3-tan.shaopeng@fujitsu.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_203515_985046_56ADC595 
X-CRM114-Status: GOOD (  11.58  )
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

Arm(MPAM driver) also supports non-contiguous CBM.
So enable noncont_cat for Arm.

Signed-off-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
---
 tools/testing/selftests/resctrl/cat_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index 94cfdba5308d..e1b30ab4cef5 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -291,7 +291,8 @@ static int cat_run_test(const struct resctrl_test *test, const struct user_param
 static bool arch_supports_noncont_cat(const struct resctrl_test *test)
 {
 	/* AMD always supports non-contiguous CBM. */
-	if (get_vendor() == ARCH_AMD)
+	/* ARM(MPAM driver) also supports non-contiguous CBM. */
+	if (get_vendor() == ARCH_AMD || get_vendor() == ARCH_ARM)
 		return true;
 
 #if defined(__i386__) || defined(__x86_64__) /* arch */
-- 
2.47.3


