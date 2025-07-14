Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D0FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 00:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iOGpP4CYObW6TJoKReZkE58pvm1MMN7jUbcZjFio7c=; b=c9py3D6x+GFky2yAc07wj5t4Qx
	2Joy2pAQ+gWuHhNbBj2GdTfVqJNmAqA3W2MLpunf/y/wQVdTc6o/KASqPJGyzrNGqHLp5lVK5XpZf
	xqJZt0ublWRxU/6kG92mwb+EbkpBBMYltb/DH7LJwphTcL8DvUgWadpQtmBRQPE4ktCJbeoJWoQEL
	kMVlRk99cnuKYlsMSGoOuZv1gWuMfT2WNvOxQ3YzKrDl04D+tQWTGm1i8CTMXCWEg3EVa6G6iH0Io
	c4OSYNboN/IOJ4SJmrzGPcZdnKfdKGWT7U7c/pB7uzhwalJfNJ75iM8Wr3qCq4lf3nATXKjmaeftc
	WB766WhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTFC-00000003bbF-3rww;
	Tue, 15 Jul 2025 00:10:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSGc-00000003UiL-3kAl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 23:07:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E8E8A52241;
	Mon, 14 Jul 2025 23:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD905C4CEED;
	Mon, 14 Jul 2025 23:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752534445;
	bh=C1k9lU7XeTOf/vBkVFi9Mnm79Lv+pfE5K8WGkyuGhDk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HJBvwY2Bb2PNSVTxlFyWdNZ4yzUcBTeGBUew3HWI7ZYVeTDKqDCmOTYyTD4PNHCNK
	 RAPgSakHZaalVwz+cUx9OcrZsrncM/wWJVcvoAjKy7BfRJ2/2b9qWe7xoh+FheiG8I
	 SObIfFQ3vDgvLJBkU00fYpFBjwgVQhg52Sq8tEuGAzDD1DxrSnPs8Y5FzuND9/xdPy
	 q9XwWXiP1gh8qVhwEdMA7gITSjEl61AAU4RkSpGpLGBEbtP9ckVBW7+DAwKD8DYsS5
	 9k1tH2FAkGipIEPssmW3rpBP0oN+i0f+lalvYnyzbkWcMzZp9MWJSCoB4qEc8K19EF
	 271CezEtibCXg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alok Tiwari <alok.a.tiwari@oracle.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	sgoutham@marvell.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 04/12] net: thunderx: avoid direct MTU assignment after WRITE_ONCE()
Date: Mon, 14 Jul 2025 19:07:07 -0400
Message-Id: <20250714230715.3710039-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250714230715.3710039-1-sashal@kernel.org>
References: <20250714230715.3710039-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.38
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_160727_069049_543FDDE6 
X-CRM114-Status: GOOD (  19.44  )
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

From: Alok Tiwari <alok.a.tiwari@oracle.com>

[ Upstream commit 849704b8b2115647e12436e5076b8e7a4944f21a ]

The current logic in nicvf_change_mtu() writes the new MTU to
netdev->mtu using WRITE_ONCE() before verifying if the hardware
update succeeds. However on hardware update failure, it attempts
to revert to the original MTU using a direct assignment
(netdev->mtu = orig_mtu)
which violates the intended of WRITE_ONCE protection introduced in
commit 1eb2cded45b3 ("net: annotate writes on dev->mtu from
ndo_change_mtu()")

Additionally, WRITE_ONCE(netdev->mtu, new_mtu) is unnecessarily
performed even when the device is not running.

Fix this by:
  Only writing netdev->mtu after successfully updating the hardware.
  Skipping hardware update when the device is down, and setting MTU
  directly. Remove unused variable orig_mtu.

This ensures that all writes to netdev->mtu are consistent with
WRITE_ONCE expectations and avoids unintended state corruption
on failure paths.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Link: https://patch.msgid.link/20250706194327.1369390-1-alok.a.tiwari@oracle.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**YES**, this commit should be backported to stable kernel trees.

## Extensive Explanation:

### 1. **This fixes a real bug introduced by incomplete conversion to
WRITE_ONCE()**

The commit message clearly identifies that this fixes a violation of
WRITE_ONCE() protection introduced in commit 1eb2cded45b3. Looking at
the code changes:

```c
// BEFORE - Problematic code:
int orig_mtu = netdev->mtu;
WRITE_ONCE(netdev->mtu, new_mtu);  // Uses WRITE_ONCE

if (!netif_running(netdev))
    return 0;

if (nicvf_update_hw_max_frs(nic, new_mtu)) {
    netdev->mtu = orig_mtu;  // Direct assignment - VIOLATES WRITE_ONCE!
    return -EINVAL;
}
```

This mixing of WRITE_ONCE() and direct assignment breaks the memory
ordering guarantees that WRITE_ONCE() is designed to provide,
potentially causing data races.

### 2. **The fix is minimal and correct**

The fixed code properly ensures all MTU writes use WRITE_ONCE():

```c
// AFTER - Fixed code:
if (netif_running(netdev) && nicvf_update_hw_max_frs(nic, new_mtu))
    return -EINVAL;

WRITE_ONCE(netdev->mtu, new_mtu);  // Only update after HW success
```

The fix:
- Removes the problematic revert path entirely
- Only updates MTU after confirming hardware update succeeds
- Maintains WRITE_ONCE() consistency throughout

### 3. **This affects stable kernels v6.10+**

From my analysis:
- Commit 1eb2cded45b3 that introduced WRITE_ONCE() annotations was
  merged in v6.10-rc1
- This means all stable kernels from v6.10 onwards have the incomplete
  WRITE_ONCE() conversion
- The thunderx driver's error path was missed in that mass conversion

### 4. **The bug has real potential for causing issues**

While the commit message doesn't explicitly state observed failures, the
inconsistent use of WRITE_ONCE() can cause:
- Data races when MTU is read concurrently without locks (using
  READ_ONCE())
- Potential for seeing stale or partially updated MTU values
- Violation of the memory ordering guarantees the kernel depends on

### 5. **Meets all stable kernel criteria**

According to stable kernel rules, this commit:
- ✓ Fixes a bug (data race/memory ordering issue)
- ✓ Is minimal (12 lines changed)
- ✓ Has been reviewed and accepted upstream
- ✓ Doesn't add new features
- ✓ The fix is obviously correct

### 6. **Historical context from similar commits**

Looking at the reference commits provided:
- Similar commit #1 (1eb2cded45b3) with "Backport Status: NO" was the
  mass conversion that introduced WRITE_ONCE() - this was a large change
  touching 153 files
- However, this current commit is different - it's a targeted bug fix
  for an error path that was missed

The fact that the mass conversion wasn't backported doesn't mean
individual bug fixes for violations shouldn't be backported.

### Recommendation:

This commit should be submitted to stable maintainers for inclusion in
v6.10+ stable branches with appropriate Fixes: tag referencing commit
1eb2cded45b3.

 drivers/net/ethernet/cavium/thunder/nicvf_main.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_main.c b/drivers/net/ethernet/cavium/thunder/nicvf_main.c
index aebb9fef3f6eb..1be2dc40a1a63 100644
--- a/drivers/net/ethernet/cavium/thunder/nicvf_main.c
+++ b/drivers/net/ethernet/cavium/thunder/nicvf_main.c
@@ -1578,7 +1578,6 @@ int nicvf_open(struct net_device *netdev)
 static int nicvf_change_mtu(struct net_device *netdev, int new_mtu)
 {
 	struct nicvf *nic = netdev_priv(netdev);
-	int orig_mtu = netdev->mtu;
 
 	/* For now just support only the usual MTU sized frames,
 	 * plus some headroom for VLAN, QinQ.
@@ -1589,15 +1588,10 @@ static int nicvf_change_mtu(struct net_device *netdev, int new_mtu)
 		return -EINVAL;
 	}
 
-	WRITE_ONCE(netdev->mtu, new_mtu);
-
-	if (!netif_running(netdev))
-		return 0;
-
-	if (nicvf_update_hw_max_frs(nic, new_mtu)) {
-		netdev->mtu = orig_mtu;
+	if (netif_running(netdev) && nicvf_update_hw_max_frs(nic, new_mtu))
 		return -EINVAL;
-	}
+
+	WRITE_ONCE(netdev->mtu, new_mtu);
 
 	return 0;
 }
-- 
2.39.5


