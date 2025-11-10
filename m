Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D69BCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 19:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4oYFrd/5w7dMd4//OhpE1mR7N/05+YOjdq1/QX/Zrg=; b=gt687puzzJD9GnaD+ec/Hr8uSX
	FLjvP78PLaILH7xULrTdkIiF9H/9gW15Rcr/bA0gyslQuIzxfGNgZ/7+K3iL9+H3VPnE/qSiFDUcE
	D8RIe+q1c99rpPh3i4kmm/fXhsY1XL83mU0gIQkSDNFRhhGARRqAY0xMQfXqCUTYwcaNrX1tdYJwt
	GLbAwCgrJCWNeEQNixL+YQv/Xe+fo3qS2VG9ICmAk/io0vZLdjdVW5PuwhWeO/1PKW/rAaz1uUECF
	49AJCGLOA6IAEVBJdJKx7130W4ls/fp4Yo30ejnMsd8D8mMFy/dsW86GDl0CNBni+fzj2oALYBv6n
	5pnE74Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIY16-0000000634W-2UwM;
	Mon, 10 Nov 2025 19:57:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIY13-0000000634A-0bLr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 19:57:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E941940809;
	Mon, 10 Nov 2025 19:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEBFC16AAE;
	Mon, 10 Nov 2025 19:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762804647;
	bh=7qoRu0+RlFlou80SR1CpX/1QJvwjgZWdZwchm3F0+R4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MwX1ndXsEPnx1OdZ0JL/opQXXrG6Z5jRcmuPfkE/5execmaAgpAaIG1bk2BZzaX6z
	 Odq6EZ7+6e1STaRxM3p+xOx9rHsCa+qIEf/bpQ2bdVVFsInoXiMgHb0JxaDxalOYpd
	 YzkiZv14LI9afF4MB4I7/bOScsTJyTW1aACr4zjEEXCVUW5By5cKuR9k3RN7qQkWE8
	 oUFmug+Ir0gZICWJIfmHQ2z8dT+4FPQpWaEkOCyh0eQ3HUI4NUJE5emLfT374l/2nL
	 +d1A9My/NMk/Z1ZEUZbCxtlSSR64Th4EWY0+v4+2NWbNgG3g6odHqoFr4LfSNwJNz9
	 5bQXjQbh8oIlw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Nishanth Menon <nm@ti.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	alexandre.f.demers@gmail.com,
	alexander.deucher@amd.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-5.4] net: ethernet: ti: netcp: Standardize knav_dma_open_channel to return NULL on error
Date: Mon, 10 Nov 2025 14:57:03 -0500
Message-ID: <20251110195718.859919-3-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110195718.859919-1-sashal@kernel.org>
References: <20251110195718.859919-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_115729_256064_DB65E517 
X-CRM114-Status: GOOD (  24.12  )
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

From: Nishanth Menon <nm@ti.com>

[ Upstream commit 90a88306eb874fe4bbdd860e6c9787f5bbc588b5 ]

Make knav_dma_open_channel consistently return NULL on error instead
of ERR_PTR. Currently the header include/linux/soc/ti/knav_dma.h
returns NULL when the driver is disabled, but the driver
implementation does not even return NULL or ERR_PTR on failure,
causing inconsistency in the users. This results in a crash in
netcp_free_navigator_resources as followed (trimmed):

Unhandled fault: alignment exception (0x221) at 0xfffffff2
[fffffff2] *pgd=80000800207003, *pmd=82ffda003, *pte=00000000
Internal error: : 221 [#1] SMP ARM
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc7 #1 NONE
Hardware name: Keystone
PC is at knav_dma_close_channel+0x30/0x19c
LR is at netcp_free_navigator_resources+0x2c/0x28c

[... TRIM...]

Call trace:
 knav_dma_close_channel from netcp_free_navigator_resources+0x2c/0x28c
 netcp_free_navigator_resources from netcp_ndo_open+0x430/0x46c
 netcp_ndo_open from __dev_open+0x114/0x29c
 __dev_open from __dev_change_flags+0x190/0x208
 __dev_change_flags from netif_change_flags+0x1c/0x58
 netif_change_flags from dev_change_flags+0x38/0xa0
 dev_change_flags from ip_auto_config+0x2c4/0x11f0
 ip_auto_config from do_one_initcall+0x58/0x200
 do_one_initcall from kernel_init_freeable+0x1cc/0x238
 kernel_init_freeable from kernel_init+0x1c/0x12c
 kernel_init from ret_from_fork+0x14/0x38
[... TRIM...]

Standardize the error handling by making the function return NULL on
all error conditions. The API is used in just the netcp_core.c so the
impact is limited.

Note, this change, in effect reverts commit 5b6cb43b4d62 ("net:
ethernet: ti: netcp_core: return error while dma channel open issue"),
but provides a less error prone implementation.

Suggested-by: Simon Horman <horms@kernel.org>
Suggested-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Link: https://patch.msgid.link/20251103162811.3730055-1-nm@ti.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my comprehensive analysis using semantic code analysis tools
and kernel repository examination, here is my determination:

## **YES** - This commit SHOULD be backported to stable kernel trees

---

## Analysis Summary

### Semantic Analysis Tools Used:

1. **mcp__semcode__find_function** - Located all affected functions
2. **mcp__semcode__find_callers** - Identified call sites and impact
   scope
3. **mcp__semcode__find_callchain** - Traced execution paths from user-
   space
4. **Read** - Examined header file and code structure
5. **Grep** - Verified net_device_ops assignment
6. **git log/show** - Investigated bug history and kernel version
   presence

### Key Findings:

#### 1. **User-Space Triggerable Crash** (CRITICAL)
- **Impact**: The bug causes a kernel crash (alignment exception at
  0xfffffff2) when opening a network interface
- **Trigger path**: User command (`ifconfig eth0 up` or `ip link set
  eth0 up`) → `__dev_open()` → `netcp_ndo_open()`
  (drivers/net/ethernet/ti/netcp_core.c:1942) →
  `netcp_setup_navigator_resources()` → `knav_dma_open_channel()`
- **Call graph analysis** shows `netcp_ndo_open` is assigned to
  `.ndo_open` in `netcp_netdev_ops` structure, making it directly user-
  triggerable

#### 2. **Root Cause Analysis**
The crash occurs due to inconsistent error handling:
- **Header stub** (include/linux/soc/ti/knav_dma.h:168): Returns `NULL`
  when driver disabled
- **Driver implementation** (drivers/soc/ti/knav_dma.c:407-487): Returns
  `(void *)-EINVAL` (ERR_PTR) on errors
- **Callers** check `IS_ERR()` after calling `knav_dma_open_channel()`
- **Cleanup code** in `netcp_free_navigator_resources()` (line 1548)
  only checks `if (netcp->rx_channel)` before calling
  `knav_dma_close_channel()`
- When `rx_channel` contains `-EINVAL` (0xfffffff2), it's non-NULL, so
  the check passes
- `knav_dma_close_channel()` attempts to dereference this invalid
  pointer → alignment exception crash

#### 3. **Impact Scope** (from mcp__semcode__find_callers)
- **Limited scope**: Only 2 callers of `knav_dma_open_channel()`:
  - `netcp_setup_navigator_resources()`
    (drivers/net/ethernet/ti/netcp_core.c:1582)
  - `netcp_txpipe_open()` (drivers/net/ethernet/ti/netcp_core.c:1326)
- **Affected hardware**: TI Keystone SoC users with NetCP driver
- **Files changed**: Only 2 files, both in the same subsystem

#### 4. **Bug Longevity**
- **Introduced**: v4.12 (2017) by commit 5b6cb43b4d625
- **Duration**: ~7-8 years of existence
- **Fixed in**: v6.18-rc5 (November 2024)
- Verified the buggy pattern exists in v6.6 LTS kernel

#### 5. **Change Characteristics**
- **Type**: Pure bug fix (crash fix)
- **Size**: Small and contained
  (drivers/net/ethernet/ti/netcp_core.c:1326-1366
  netcp_core.c:1582-1694, drivers/soc/ti/knav_dma.c:407-487)
- **Semantic changes** (from code inspection):
  - Standardizes return value from ERR_PTR to NULL on all error paths
  - Updates callers from `IS_ERR()` checks to simple NULL checks
  - Updates cleanup from `IS_ERR_OR_NULL()` to simple NULL checks
  - Changes error code from `PTR_ERR()` extraction to fixed `-EINVAL`
- **No architectural changes**: No struct modifications, no API
  additions
- **No new features**: Only error handling standardization

#### 6. **Backport Risk Assessment**
- **Risk level**: LOW
  - Changes are localized to error handling paths
  - Makes behavior consistent with header stub
  - No complex dependencies identified
  - Code structure in v6.6 is compatible (verified)
- **Regression potential**: Minimal
  - Affects only error paths that were already broken
  - Improves consistency between header and implementation
  - All callers updated in same commit

#### 7. **Stable Tree Compliance**
- ✅ **Fixes important bug**: Kernel crash
- ✅ **Small and contained**: 2 files, error handling only
- ✅ **No new features**: Pure bug fix
- ✅ **No architectural changes**: No struct/API changes
- ✅ **Obvious and correct**: Crash trace in commit message proves the
  fix
- ✅ **Self-contained**: No dependencies on other commits
- ❌ **Missing stable tags**: No "Cc: stable@vger.kernel.org" or "Fixes:"
  tag (oversight)

### Specific Code Reference Points:

1. **drivers/soc/ti/knav_dma.c:407-487**: Changed all error returns from
   `(void *)-EINVAL` to `NULL`
2. **drivers/net/ethernet/ti/netcp_core.c:1339**: Changed from
   `IS_ERR(tx_pipe->dma_channel)` to `!tx_pipe->dma_channel`
3. **drivers/net/ethernet/ti/netcp_core.c:1361**: Changed from
   `IS_ERR_OR_NULL()` to simple NULL check in cleanup
4. **drivers/net/ethernet/ti/netcp_core.c:1680**: Changed from
   `IS_ERR(netcp->rx_channel)` to `!netcp->rx_channel`

### Conclusion:

This commit is an **excellent candidate for stable backporting**:
- Fixes a real, user-triggerable kernel crash with documented stack
  trace
- Affects users of TI Keystone SoCs who configure network interfaces
- Small, well-contained, low-risk change
- Bug has existed since v4.12 (2017) affecting all stable trees
- Should be backported to all active stable kernels (at minimum v6.1+,
  v6.6+, v6.12+)

The absence of stable/Fixes tags appears to be an oversight and should
not prevent backporting given the clear evidence of crash and the
straightforward nature of the fix.

 drivers/net/ethernet/ti/netcp_core.c | 10 +++++-----
 drivers/soc/ti/knav_dma.c            | 14 +++++++-------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/ti/netcp_core.c b/drivers/net/ethernet/ti/netcp_core.c
index 857820657bac5..5ee13db568f08 100644
--- a/drivers/net/ethernet/ti/netcp_core.c
+++ b/drivers/net/ethernet/ti/netcp_core.c
@@ -1338,10 +1338,10 @@ int netcp_txpipe_open(struct netcp_tx_pipe *tx_pipe)
 
 	tx_pipe->dma_channel = knav_dma_open_channel(dev,
 				tx_pipe->dma_chan_name, &config);
-	if (IS_ERR(tx_pipe->dma_channel)) {
+	if (!tx_pipe->dma_channel) {
 		dev_err(dev, "failed opening tx chan(%s)\n",
 			tx_pipe->dma_chan_name);
-		ret = PTR_ERR(tx_pipe->dma_channel);
+		ret = -EINVAL;
 		goto err;
 	}
 
@@ -1359,7 +1359,7 @@ int netcp_txpipe_open(struct netcp_tx_pipe *tx_pipe)
 	return 0;
 
 err:
-	if (!IS_ERR_OR_NULL(tx_pipe->dma_channel))
+	if (tx_pipe->dma_channel)
 		knav_dma_close_channel(tx_pipe->dma_channel);
 	tx_pipe->dma_channel = NULL;
 	return ret;
@@ -1678,10 +1678,10 @@ static int netcp_setup_navigator_resources(struct net_device *ndev)
 
 	netcp->rx_channel = knav_dma_open_channel(netcp->netcp_device->device,
 					netcp->dma_chan_name, &config);
-	if (IS_ERR(netcp->rx_channel)) {
+	if (!netcp->rx_channel) {
 		dev_err(netcp->ndev_dev, "failed opening rx chan(%s\n",
 			netcp->dma_chan_name);
-		ret = PTR_ERR(netcp->rx_channel);
+		ret = -EINVAL;
 		goto fail;
 	}
 
diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index a25ebe6cd5030..553ae7ee20f16 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -402,7 +402,7 @@ static int of_channel_match_helper(struct device_node *np, const char *name,
  * @name:	slave channel name
  * @config:	dma configuration parameters
  *
- * Returns pointer to appropriate DMA channel on success or error.
+ * Return: Pointer to appropriate DMA channel on success or NULL on error.
  */
 void *knav_dma_open_channel(struct device *dev, const char *name,
 					struct knav_dma_cfg *config)
@@ -414,13 +414,13 @@ void *knav_dma_open_channel(struct device *dev, const char *name,
 
 	if (!kdev) {
 		pr_err("keystone-navigator-dma driver not registered\n");
-		return (void *)-EINVAL;
+		return NULL;
 	}
 
 	chan_num = of_channel_match_helper(dev->of_node, name, &instance);
 	if (chan_num < 0) {
 		dev_err(kdev->dev, "No DMA instance with name %s\n", name);
-		return (void *)-EINVAL;
+		return NULL;
 	}
 
 	dev_dbg(kdev->dev, "initializing %s channel %d from DMA %s\n",
@@ -431,7 +431,7 @@ void *knav_dma_open_channel(struct device *dev, const char *name,
 	if (config->direction != DMA_MEM_TO_DEV &&
 	    config->direction != DMA_DEV_TO_MEM) {
 		dev_err(kdev->dev, "bad direction\n");
-		return (void *)-EINVAL;
+		return NULL;
 	}
 
 	/* Look for correct dma instance */
@@ -443,7 +443,7 @@ void *knav_dma_open_channel(struct device *dev, const char *name,
 	}
 	if (!dma) {
 		dev_err(kdev->dev, "No DMA instance with name %s\n", instance);
-		return (void *)-EINVAL;
+		return NULL;
 	}
 
 	/* Look for correct dma channel from dma instance */
@@ -463,14 +463,14 @@ void *knav_dma_open_channel(struct device *dev, const char *name,
 	if (!chan) {
 		dev_err(kdev->dev, "channel %d is not in DMA %s\n",
 				chan_num, instance);
-		return (void *)-EINVAL;
+		return NULL;
 	}
 
 	if (atomic_read(&chan->ref_count) >= 1) {
 		if (!check_config(chan, config)) {
 			dev_err(kdev->dev, "channel %d config miss-match\n",
 				chan_num);
-			return (void *)-EINVAL;
+			return NULL;
 		}
 	}
 
-- 
2.51.0


