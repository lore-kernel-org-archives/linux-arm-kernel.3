Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB630FD8741
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zjwds4Z8n6IYLF5dnZmswgQEZ5qdvju6jCMsGxe61A0=; b=nydy+6HZVi88dB23hMjuhDmBS5
	xuvL7U1ByRcIy8NAl8/SE3yLD2lJj322cpJERK2sR17CnvjxLrIoqVEwusO4kMRWQ1LaV6fXXNgh7
	UV2HTC/fb1r63E9xc1S2Ga9dafp1CQK6+1dCyTg3Bm867gkBvJQ2O3nfhWZ36ABhv9bJ/PlrgfYWO
	+ta9wXzptfTHPoT7dQqMbt6FoMn6bCoBNcYlVQBhTC8jdfmfTvqz2TH37q1hFDnRpJx6ejJAHELh4
	SuNHa68STXlE5OtqCpvcqNoNCiXoRwBydShBVlMCamgrokS0knuJoO5tsnzheDHgxeXQL55siIiPJ
	3JM1Unag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T3z-00000006FrB-1XGv;
	Tue, 17 Mar 2026 11:58:19 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T3u-00000006Fof-3uSD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:58:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773748684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zjwds4Z8n6IYLF5dnZmswgQEZ5qdvju6jCMsGxe61A0=;
	b=P7tZbnZgAX34zDtFfW6SJ+K0yhL/vqFP9y3FtcmkUwyTpewIbSrqEeSYyREQlCsbYYiLWI
	U52SrhG4Tn25UEvyxnCeDgNgdeT161flSX+StZfHSSTKd+wOwF1N0STkpTJDOVDt5FAZry
	0cCuE4GKRnp0q7kxwyzbIJQzCyZ+fEU=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] KVM: arm64: Fix the descriptor address in __kvm_at_swap_desc()
Date: Tue, 17 Mar 2026 19:57:48 +0800
Message-ID: <20260317115748.47332-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_045815_180618_35CCDDD1 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

Using "(u64 __user *)hva + offset" to get the virtual addresses of S1/S2
descriptors looks really wrong, if offset is not zero. What we want to get
for swapping is hva + offset, not hva + offset*8. ;-)

Fix it.

Fixes: f6927b41d573 ("KVM: arm64: Add helper for swapping guest descriptor")
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 arch/arm64/kvm/at.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index c5c5644b1878..a024d9a770dc 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1753,7 +1753,7 @@ int __kvm_at_swap_desc(struct kvm *kvm, gpa_t ipa, u64 old, u64 new)
 	if (!writable)
 		return -EPERM;
 
-	ptep = (u64 __user *)hva + offset;
+	ptep = (void __user *)hva + offset;
 	if (cpus_have_final_cap(ARM64_HAS_LSE_ATOMICS))
 		r = __lse_swap_desc(ptep, old, new);
 	else
-- 
2.53.0


