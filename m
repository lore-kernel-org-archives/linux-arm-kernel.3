Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1BEC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vP3yNQFVcfgKGjLZALOVCCo1UbDDvYZyPV7i1DghxEU=; b=lSL1oBteOheF5GX14f4wrZHGzU
	2sS4LwMymDfGxmJvO/2NPPaSS/Xb0PwbyMrlcXnl6DHG6NH5nc5/sgSIzMPz+DQR3LaqUwBBnqD9j
	nVbISyAbWaMI8/WI8hXatAZGiJEQWyh0t3pE7+KS77GMyxnMtMSCpzkndPAPXqeUqERYmZ6URty+K
	yNn+xs14KM19qh74onXrQyfwUjd/42ZgWzO/jSTS3e9L6Doy0pgqbGMUlkee+zfKoeQn/1JiF1jqL
	Ltjm6m1EoB6PYFJg6qUjfSQH4QKczIU7O799IMek+k1O9q1BUIw7+NfjQz8OYReESeEwkVxr/gCDK
	tHAJIgEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprQR-0000000DIrU-1y9z;
	Fri, 31 Jul 2026 17:53:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprPy-0000000DId7-3rAx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:53:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE6D922D7;
	Fri, 31 Jul 2026 10:53:05 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A87C3F66F;
	Fri, 31 Jul 2026 10:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785520389; bh=e+GDVTsiiQHjxn9DnZ/B/cyVczsgf7yzQAgZ9/4fzy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OpOlszYFs2MrrJ2SroW3KXFQttNyXdLdSWAIhyoPpWI5sIdS9Wuazu/7HRl1eGMdO
	 HTQ9iYW1J74jt4IFEKPFQGPkuvstDtO7nn5qu7suvO5w2F3e2sSK/WTwHW97by00u7
	 pcuXXv6IInfUnfjpTwDhryZiYziT+6jhGqPG4GtY=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com,
	will@kernel.org
Cc: james.morse@arm.com,
	fenghuay@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	andre.przywara@arm.com,
	gshan@redhat.com,
	tan.shaopeng@jp.fujitsu.com,
	sdonthineni@nvidia.com,
	jonathan.cameron@oss.qualcomm.com
Subject: [PATCH 6/6] arm_mpam: Apply T241-MPAM-6 to 63-bit counters
Date: Fri, 31 Jul 2026 18:52:43 +0100
Message-ID: <20260731175243.904730-7-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731175243.904730-1-ben.horgan@arm.com>
References: <20260731175243.904730-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_105311_005786_9B815B00 
X-CRM114-Status: GOOD (  10.14  )
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

From: Shanker Donthineni <sdonthineni@nvidia.com>

T241-MPAM-6 causes all MBWU counter formats to count 64-byte
requests instead of bytes. Commit dc48eb1ff27c excluded the 63-bit
MSMON_MBWU_LWD format while scaling the shorter counters. Systems
selecting the preferred 63-bit counter consequently report bandwidth
values that are 64 times too small.

Apply the scale to both the sampled value and overflow correction for
the 63-bit format. Unsigned arithmetic retains modulo-u64 behavior
when the scaled counter range exceeds u64.

Fixes: dc48eb1ff27c ("arm_mpam: Add workaround for T241-MPAM-6")
Link: https://lore.kernel.org/lkml/20240816131432.993859-1-sdonthineni@nvidia.com/
Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b69f99488111..53942b331269 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1196,8 +1196,7 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
 {
 	u64 overflow_val = __mpam_msmon_overflow_val(type);
 
-	if (mpam_has_quirk(T241_MBW_COUNTER_SCALE_64, msc) &&
-	    type != mpam_feat_msmon_mbwu_63counter)
+	if (mpam_has_quirk(T241_MBW_COUNTER_SCALE_64, msc))
 		overflow_val *= 64;
 
 	return overflow_val;
@@ -1293,8 +1292,7 @@ static void __ris_msmon_read(void *arg)
 			now = FIELD_GET(MSMON___VALUE, now);
 		}
 
-		if (mpam_has_quirk(T241_MBW_COUNTER_SCALE_64, msc) &&
-		    m->type != mpam_feat_msmon_mbwu_63counter)
+		if (mpam_has_quirk(T241_MBW_COUNTER_SCALE_64, msc))
 			now *= 64;
 
 		if (nrdy)
-- 
2.43.0


