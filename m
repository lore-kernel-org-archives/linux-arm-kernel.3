Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6029ACD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P57iD2S9EPfRAP36gj0JdTbFwtXxilaoUSFYn5CFF2o=; b=BIFvk3ctvoY8ZH4emv9vvP6hii
	WzygFqnJj2KPbmHE24gS7vunU+Qj4ekCBhOti1TE7GO2bZ2c/Lt95IV7YkdJNT+KcjgVD0j+Do6kI
	+R9UNYAPlF0zuHoAojtuJgERW4DT75ju4o4+LNL6ccYHkK2WwKwzIEzlgNGXLYJKIjPL72RYcYJYG
	3kaAkwax1uhZO6EVmay4gDP7Ndjs3041KLqQMfYM9SEDmEBSmuwZOgYltbLgONHxlL89obm7G3dDI
	TuDxJQ8VwiWwE7nQx62DMMA44cVzPi8o3Oxr54kUXVO2AfOb57cPTp1zAFZts/clpukf0NR5ofRRC
	xJ5b4jMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV28j-0000000GH4y-13BP;
	Thu, 04 Jun 2026 07:05:17 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV28g-0000000GGrl-0hrs;
	Thu, 04 Jun 2026 07:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780556659;
	bh=P57iD2S9EPfRAP36gj0JdTbFwtXxilaoUSFYn5CFF2o=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=VZfhVefLM/XDmudO8GbjCcJKnj3ASdHyNj6hsc0awoxg6ZzIRBMS08aqH6OVcmzks
	 pmyUheVMs9OXpisJtP2Hcopi3GC3tFNpdWjN5IzUTydPeYNy/YvPwUiAWG4tel6MTT
	 wUgV2lbBGry3kNz0gUlWZotZAa45jMs2GBDgjsrk=
X-QQ-mid: zesmtpsz4t1780556654tb32bb824
X-QQ-Originating-IP: PPa2v+lkVt/vNsQ6iSmnuR6BrhfKhuX7ejWkLBDo3GQ=
Received: from localhost.localdomain ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Jun 2026 15:03:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6328800719262846295
EX-QQ-RecipientCnt: 13
From: ZhaoJinming <zhaojinming@uniontech.com>
To: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	ZhaoJinming <zhaojinming@uniontech.com>
Subject: [PATCH net] net: airoha: Add NULL check for of_reserved_mem_lookup() in airoha_qdma_init_hfwd_queues()
Date: Thu,  4 Jun 2026 15:03:52 +0800
Message-Id: <20260604070352.2603077-1-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: N0mS+7D7RQfjnescUnQL6LLlhipBV6toT1YvXzbhTDKTucpfLuyjWHph
	CsZjaMgAT5Y7V1nIKAdtyBntQtyLlPdORxe3RYI8d71cNfSXjZxgBi0CyJ0KyB7aNNjIm6G
	JdRRgKuT3Ts6/Vbz0/tXHtTEmGtaGaui9Nb1yHz5ThdHf/jC47iEb5I9NQmKM8zAm0q3X6p
	6Jvn04qF+/7VFjlV6CmkexoJRw6K7li/Hes5BycD69RkLAfssbJ3czGvA204XwJRksU/Fip
	ok4h4F+tH9cWD4Gm9CJ55lzxMZt9dgxdHxZX9lLJ4gl5+utaYIeyD009mfozXz4+AHOSkoF
	pTY4cOw7PuZsRt1GVGWGX9szwVVL+9lGS/0aoioxCXgl0bQ/iDDW0YpXfUCl3P3ct8hUguI
	HDHwWKMTkkZB2piOJ/aEXldaEOdISHTLCP92t9NFs1ilVZJacq+XhzjqYB30aGwXOp3y/yr
	FNjIpKzUpWZhjyK5WD05C2sLnigdX+BOrixr8QTHkUvq/QAJGnxnW05lYVydffwhj/NgO5j
	9FnEZzamTSxhMZzm9FitFlMPnpGGiajXubw1lUjxrrdviu6jW07KpPR3P9nehbSE85Ex1Zl
	ar/Hgw8k+fEIZqZXPInIBjhLLomNNBLjGt0xdQ2z8xs7cWLyYH15P2eQsW8VspKjbNimepT
	B4wZ/MlN/dwknA8tpcMpCqhP9brKbCvjuj0Ey/f4efv0fxN9mG3jT0I4n7Y+aFXVaZ7GWpu
	Pr48Lram0lz0RvgVc7LP7PAbNjGAY0m9IJBHd3ywS4Rzmftk/c0pVm0C6cVpuSFRHM/dwyn
	/5MjYwp2fI8TBgryB+/QfCY3ue3IAWxBvKSaYKIyfCyJcbkmrYW6ouIuTaIXYz3QBPBqMXj
	700IsAYrN1yk+K2sDIMYDQhE38NB4gJ+G5hipL2OoHbpdWhebWrcMl4TK5H3eY/zECXQKEE
	DWDi6r26+TQTiKWPAENMQvo8E//6elCWSEJEnShkD4PIpG+8jHRy3FK9xfV4B8Wk8ZFwOnw
	ZwfjAQF292JNyaZPCS
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_000514_726689_20082ACE 
X-CRM114-Status: GOOD (  12.89  )
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

of_reserved_mem_lookup() may return NULL if the reserved memory region
referenced by the "memory-region" phandle is not found in the reserved
memory table (e.g. due to a misconfigured DTS or a removed
memory-region node).  The current code dereferences the returned
pointer without checking for NULL, leading to a kernel NULL pointer
dereference at the following lines:

    dma_addr = rmem->base;                          // line 1156
    num_desc = div_u64(rmem->size, buf_size);       // line 1160

Add a NULL check after of_reserved_mem_lookup() and return -ENODEV if
the lookup fails, which is consistent with the existing error handling
for of_parse_phandle() failure in the same code block.

Fixes: 3a1ce9e3d01b ("net: airoha: Add the capability to allocate hwfd buffers via reserved-memory")
Cc: stable@vger.kernel.org
Signed-off-by: ZhaoJinming<zhaojinming@uniontech.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index cecd66251dba..2444d3275a81 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1153,6 +1153,9 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 
 		rmem = of_reserved_mem_lookup(np);
 		of_node_put(np);
+		if (!rmem)
+			return -ENODEV;
+
 		dma_addr = rmem->base;
 		/* Compute the number of hw descriptors according to the
 		 * reserved memory size and the payload buffer size
-- 
2.25.1

