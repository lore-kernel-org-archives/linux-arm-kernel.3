Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1150BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=WgQu9L7j9OBb7t7iHJoxCQB38xuGz728zo4Ep+7BnWw=; b=u1jWFgplPekbAhPAH1TMNGXNjC
	Ju5gGVgJWIW37X3uhg6Z9+uNMQv6O/BJHZYKF5mi5OjSfiuW+jf9zNbuShzrBjJEwfQVm4JjnuZXz
	aj8FCkkdSnOQpqQGEB6f6BpbLRpLZl6dWa2AHOrCu/KvVPvRwh6bMDHQQBwsxmeMd+n2p+ALec6Jq
	iww5PZp/Ua5uY8VrOxu88kosw6EOXMlnz8PbFR62jPvkgxiwlnPUTFOWa/YBiXNnufFewhIeGkiKW
	1HZ4SwMANnbTFWiQOiN2ZDnnHPl9U/VDoVdrysW2HxhDxr3FTzev/L7qj9mv0tryFkVuptlNm5KKu
	Ug4XE+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9rw-0000000Fabe-2zi4;
	Tue, 07 Jul 2026 17:46:04 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9rp-0000000FaYd-3oPe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 17:46:02 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260707174556euoutp013a1260e0d1efc36f67b21cd26102207e~AEwMMFmoC0074200742euoutp016
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 17:45:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260707174556euoutp013a1260e0d1efc36f67b21cd26102207e~AEwMMFmoC0074200742euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783446356;
	bh=WgQu9L7j9OBb7t7iHJoxCQB38xuGz728zo4Ep+7BnWw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=se/0Ogn5oNOEXZQx8AQFkm4+U8AuS8l9SYu8JX+QgNIu7r5Ro3bB3qFMtm1RQs6iX
	 R6U51xqYZZPvumwdzPupFz9o8j8Wt3agUP3fj7gRsAmtpnGt03TZf5toMoWG5sEZVq
	 pUwKhk3umqPCqnZTzhg80tY+3Ylrd0DecKa5Bl0c=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260707174555eucas1p231d122ef4cc791f59dd36cb78378954c~AEwLZVOtI2928229282eucas1p24;
	Tue,  7 Jul 2026 17:45:55 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260707174554eusmtip2eb6f48a3c36fb6ce749dd9fd23dd9ab7~AEwKvfykK1463414634eusmtip2Q;
	Tue,  7 Jul 2026 17:45:54 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: k.tegowski@samsung.com, k.domagalski@samsung.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jakub
	Raczynski <j.raczynski@samsung.com>
Subject: [PATCH net v3 0/2] net/stmmac: Fix panic during interface shutdown
 & apply STMMAC_DOWN flag
Date: Tue,  7 Jul 2026 19:45:49 +0200
Message-Id: <20260707174551.1264558-1-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260707174555eucas1p231d122ef4cc791f59dd36cb78378954c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260707174555eucas1p231d122ef4cc791f59dd36cb78378954c
X-EPHeader: CA
X-CMS-RootMailID: 20260707174555eucas1p231d122ef4cc791f59dd36cb78378954c
References: <CGME20260707174555eucas1p231d122ef4cc791f59dd36cb78378954c@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_104558_777905_9DE6FD5E 
X-CRM114-Status: GOOD (  12.43  )
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

When testing interface shutdown during XDP operation using stmmac driver,
we have encountered kernel panics, either poison overwritten or wrong
memory access, caused by XDP processing data after shutting down NAPI.

To fix this problem:
- Add STMMAC_DOWN handling to all XDP paths
- Change location of synchronize_rcu() to proper place
- Apply STMMAC_DOWN flag on interface open()/release().
  This flag is used for XDP only and does improve handling in edge cases

Proper order of ensuring proper XDP shutdown is already present in functions
from stmmac_xdp.c during xdp_disable_pool(), since XDP can still have
data with NAPI disabled, as disabling NAPI does not ensure XDP finish.
synchronize_rcu() must be executed after IRQ's & DMA channels are disabled to
flush data.

---
Changes in v3:
- Discard almost all changes from v2.
  This was a mistake as napi_disable() does ensure napi_synchronize() and
  it didn't fix anything in the end.
- Return STMMAC_DOWN flag set/clear
- Create new function that executes synchronize_rcu() and call it from
  proper places
- Remove synchronize_rcu() from stmmac_disable_all_queues()
- Remove barren stmmac_disable_all_queues() and replace it with
  __stmmac_disable_all_queues()
- Fix memory leak in STMMAC_DOWN handling in modified XDP paths

Changes in v2:
- Split patch into two: one for XDP paths and second for general fix
- Change commit messages & title
- Fix all cases of NAPI release, not only XDP, via modyfying
  stmmac_disable_all_queues() instead of separate later call
- Drop setting/clearing of STMMAC_DOWN flag in release()/open()

Link to v2:
https://lore.kernel.org/all/20260601163258.554300-3-j.raczynski@samsung.com
Link to v1:
https://lore.kernel.org/all/20260511165045.3091475-1-j.raczynski@samsung.com


Jakub Raczynski (2):
  net/stmmac: Check for STMMAC_DOWN flag in all XDP paths
  net/stmmac: Fix free-after-use panic when interface goes does with XDP

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 ++++++++++++++-----
 1 file changed, 31 insertions(+), 9 deletions(-)

-- 
2.34.1


