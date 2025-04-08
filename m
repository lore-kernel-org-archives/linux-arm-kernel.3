Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E547FC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 04:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pKWwXjEbgKR5LRjh8ynqM9FjtxFCrhpKInGKB0rNh8c=; b=q0hCgy7vjyLdPQWQfkJec/LxJ+
	mt22xXK/gqmvOHO7C/laLiU3CYs3XpjdyALqa7RzsxrhzPK3Acr+ElJN5wq4gPrrSwpqHa6y6pRDP
	YNltTfZbODxlu5MY3T+EsOkzxAT/DlqL15ozbaAFrRySPLHRUhtN5dA+UHiYLo2Bx8KUqm5uvr11t
	dPkqupSgktFNT/EcThEmMkgaScqaq3ZwUAv/aCJbYjdJ4Bn+5t1hUkw0eCF5cU76YKXlF16wvvnGK
	yeQ77Bf8jXdPyhuyzk+cWK6n0yxGN0zt1N+9O9o8Y62F92rjtmdMflw3cEA7teCkpqeKO+5dRALYw
	IDr2TZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u20QH-00000002gOL-1Woj;
	Tue, 08 Apr 2025 04:18:53 +0000
Received: from esa9.hc1455-7.c3s2.iphmx.com ([139.138.36.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u20OV-00000002gIu-3Msz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 04:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744085823; x=1775621823;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O/Tn1U4L5YYmQ1KHlDb+KfX9uYMb4KE782y8YRNBRxc=;
  b=psFh+jtWV+uatjQmmr2VCOBOFbiQCN6KP6WrJIcGcPnjobWhrsDaBNVm
   0V87BorWqFIsCXF1igpvNeOgwtG+d5ceklPAwxiP+9M2hi3oi6KIccMyS
   ETytZqoziihJ0Eg+FhMZshDZNgyRZeTd8zx5/S2XsV7qlQKkJVy4FxEWl
   /iRE2J/yL4SYNQEgFoIE69xqq6OXBk9iSXLJGEvI/akEsE4GIjU3UXnAj
   En8Gll0VTCNt8XdGlTWLtA2MjK8huQKhIgS+xUcvoBTbrKazAa9iIaeS4
   FdyxRwFGX7Pd30o3ryA5+y63J5nuXovYplu3t3CIxKw6Rv2AOKkz414/L
   g==;
X-CSE-ConnectionGUID: C0st4PAESaWC7Qw3pL5Ppg==
X-CSE-MsgGUID: ZcgtHuqwTXedgEp/aNaSLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="184140419"
X-IronPort-AV: E=Sophos;i="6.15,197,1739804400"; 
   d="scan'208";a="184140419"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 13:16:58 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 24853D6EA9
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Apr 2025 13:16:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DBE6AD9687
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Apr 2025 13:16:55 +0900 (JST)
Received: from iaas-rpma.. (unknown [10.167.135.44])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2F7731A0078;
	Tue,  8 Apr 2025 12:16:54 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Li Zhijian <lizhijian@fujitsu.com>,
	Erhard Furtner <erhard_f@mailbox.org>
Subject: [PATCH] crypto/testmgr: Fix acomp_req leak
Date: Tue,  8 Apr 2025 12:16:47 +0800
Message-Id: <20250408041647.88489-1-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_211704_258916_AD7AFAC0 
X-CRM114-Status: GOOD (  11.67  )
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

The kmemleak reported that
...
unreferenced object 0xffff888108d6c300 (size 256):
  comm "cryptomgr_test", pid 183, jiffies 4294700957
  hex dump (first 32 bytes):
    00 c1 d6 08 81 88 ff ff 00 cb d6 08 81 88 ff ff  ................
    50 cd a7 81 ff ff ff ff b8 fb 93 02 00 c9 ff ff  P...............
  backtrace (crc 29cca632):
    __kmalloc_noprof+0x2fa/0x430
    test_acomp+0x174/0x960
    alg_test_comp+0x6f/0x90
    alg_test.part.26+0x105/0x410
    cryptomgr_test+0x20/0x40
    kthread+0x10c/0x250
    ret_from_fork+0x30/0x40
    ret_from_fork_asm+0x1a/0x30
unreferenced object 0xffff888108d6c100 (size 256):
  comm "cryptomgr_test", pid 183, jiffies 4294700972
  hex dump (first 32 bytes):
    00 1d da 08 81 88 ff ff 00 c3 d6 08 81 88 ff ff  ................
    50 cd a7 81 ff ff ff ff b8 fb 93 02 00 c9 ff ff  P...............
  backtrace (crc 3047d62b):
    __kmalloc_noprof+0x2fa/0x430
    test_acomp+0x174/0x960
    alg_test_comp+0x6f/0x90
    alg_test.part.26+0x105/0x410
    cryptomgr_test+0x20/0x40
    kthread+0x10c/0x250
    ret_from_fork+0x30/0x40
    ret_from_fork_asm+0x1a/0x30

acomp_request will be chained to req[0], however,
acomp_request_free(), it will not free the whole chain.

Fix it by freeing them one by one.

Fixes: 99585c2192cb ("crypto: testmgr - Add multibuffer acomp testing")
Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Closes: https://lore.kernel.org/linux-crypto/20250408002741.089f1e9a@outsider.home/
Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---
 crypto/testmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index abd609d4c8ef..7f02feee9fb6 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -3498,10 +3498,10 @@ static int test_acomp(struct crypto_acomp *tfm,
 	ret = 0;
 
 out:
-	acomp_request_free(reqs[0]);
 	for (i = 0; i < MAX_MB_MSGS; i++) {
 		kfree(output[i]);
 		kfree(decomp_out[i]);
+		acomp_request_free(reqs[i]);
 	}
 	kfree(dst);
 	kfree(src);
-- 
2.27.0


