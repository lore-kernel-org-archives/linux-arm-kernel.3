Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE7CCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 22:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3d+b2xcvsjVrWaPpn6WtYYoLjMGe7dIwqDd2QcDn+XI=; b=EF1gKIwKCHwdzRAC+uCdhMdumB
	HNf4idZvFIwPaYbQf6vi+yvNzL5BvxITaBdQuPv24R1AVTeQiu798Y9rdtI1ISrz/7NQuRjvaEXNo
	buG690P4H7MEePBdX7l1RwlVyapkFW+p5W4ZflSlfk5AJRiwCSap+75NTHEwlbT7XawtUK4sfrnbE
	IcemT+GJe5kp3OxSrFo5w+VfqBkD+n+n9p32g0wdEowPyLELv1M7YwwRb2Wbe9tf1GD9u/aaeQIZS
	SjkgM7GHoN57j/4ym9M9bWFxM8TYiGOflJyEkU1nN2kM9PCED++i1SijHmDaZmDNdoAVjrLeDewj/
	8zFWR0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wToLU-00000009vQy-0s54;
	Sun, 31 May 2026 22:09:24 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wToLQ-00000009vQb-2vTv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 22:09:22 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780265354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3d+b2xcvsjVrWaPpn6WtYYoLjMGe7dIwqDd2QcDn+XI=;
	b=wfj553VrOZTCoyYd+rEsZYHjR1OFjh6BOTtCOL0u14gNbkiM2Sbfv/HFD47a+S/9+QI0k5
	Ub4aEl/2PfafVpVFcNZbxpv2tYLCvYL5aIFCx46NPqSxFGPf++P6n9fYqcVrkcKWMKXvCN
	+xL1IQce4rhs15YmFgiKxa1FC6cMAUM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: patching: replace min_t with min in __text_poke
Date: Mon,  1 Jun 2026 00:08:16 +0200
Message-ID: <20260531220817.738904-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=804; i=thorsten.blum@linux.dev; h=from:subject; bh=XM4Mj8knoES15YzfCHRN5BQR3Hmdw/AP4VY7DvQniQE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkyGwP9zm+X+53me1vG7cUByc6Z/GY9+Ttu3Sr13vilz eLzAv6ejlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZiI1SSG/74cIhzP+5g7FAJX /zHk3pDccOtqjrJDc0iU5aemlJVySxkZ/r9rPnT+urQWu9g/3s0N+83ZTHiVu3d9llHa4St7/aY 7NwA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_150921_456129_F36D1C71 
X-CRM114-Status: UNSURE (   8.58  )
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

Use the simpler min() macro since both values are unsigned and
compatible.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm64/kernel/patching.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 1041bc67a3ee..09f019c6547a 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -116,8 +116,7 @@ static void *__text_poke(text_poke_f func, void *addr, void *src, size_t len)
 
 	while (patched < len) {
 		ptr = addr + patched;
-		size = min_t(size_t, PAGE_SIZE - offset_in_page(ptr),
-			     len - patched);
+		size = min(PAGE_SIZE - offset_in_page(ptr), len - patched);
 
 		waddr = patch_map(ptr, FIX_TEXT_POKE0);
 		func(waddr, src, patched, size);

