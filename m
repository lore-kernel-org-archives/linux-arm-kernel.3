Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57279D2CE1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 03:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uA42B2J5fwSQfu5FlZ7N38XeuATahpsmHOfzhfbeNbE=; b=pUzFd4ZQL9CaQMGqDmtBOSEqcZ
	7nPT4QsadaP7Dif5f5t6EahHWTtEIYdceifp1CmLYFQUEtRsb1FaQGcU5Xw2/6vut3shOWeG6Jeu/
	XNwRwpzjLeE7VpgL7MrxdaEiQITEVVXHJI2GFyrilcMttTx+jJAHfpKG0FD9hNUTzv7/9H9UFktOF
	G50dKKA+KonrlYbIAsKqv72cM//DKPj3UKcIEJDs0F7PdBqDg+oNmn1XXpCXiAofZDw6RkKDjOLgh
	uPmXx+3pQnIXSW3fLP4mOeDxbm3p3ft+jz4+JkH76qGQUowNV3tKUyrJoXvPKkv/O91qYRDex4x+v
	ZfMpm3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRMsJ-00000008zIh-1uKr;
	Fri, 05 Dec 2025 03:52:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRMsI-00000008zI3-25lz;
	Fri, 05 Dec 2025 03:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 879E760209;
	Fri,  5 Dec 2025 03:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18DCC116B1;
	Fri,  5 Dec 2025 03:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764906773;
	bh=aCnktdb+wTVLC3gj9nec1duNC0hS3OcJnFItNItmnAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T2RxtvSMdslKaWhoOtZaHjmqC/MSnyHnAd9TLVevkydFuHJVs0P4nxWnDAhkzIvKl
	 zVdbFFUVq4w5tVg3ormyLggB4Xp8OujJMTUsUcvrQgIqSTdUsPhD+pVSUxqgqoJ3b1
	 wrp1x4EU4NiaWo6qeFVTyQWTOVH9qullRl+codpIW8Iqf1ihXhQN5iS2ndBdzSdRUS
	 edzNBDushAKlMltIAmRH4lpJTAHMgg1OBWX9WTYlPadxktRcuSWmKofDfe3r+lNUK6
	 r+DJWrvEP4bHqydVtgwq2vW8IxvfHqlP6UHaPSL/GIWAWTpBbx8V4hG0XYZ4KHI3WH
	 QKKmEma42gNKA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Shuhao Fu <sfual@cse.ust.hk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	rafael@kernel.org,
	krzk@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.18-5.10] cpufreq: s5pv210: fix refcount leak
Date: Thu,  4 Dec 2025 22:52:34 -0500
Message-ID: <20251205035239.341989-5-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251205035239.341989-1-sashal@kernel.org>
References: <20251205035239.341989-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Shuhao Fu <sfual@cse.ust.hk>

[ Upstream commit 2de5cb96060a1664880d65b120e59485a73588a8 ]

In function `s5pv210_cpu_init`, a possible refcount inconsistency has
been identified, causing a resource leak.

Why it is a bug:
1. For every clk_get, there should be a matching clk_put on every
successive error handling path.
2. After calling `clk_get(dmc1_clk)`, variable `dmc1_clk` will not be
freed even if any error happens.

How it is fixed: For every failed path, an extra goto label is added to
ensure `dmc1_clk` will be freed regardlessly.

Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

### 1. COMMIT MESSAGE ANALYSIS

The commit message describes a refcount leak:
- Subject: "cpufreq: s5pv210: fix refcount leak"
- Explains the bug: `dmc1_clk` is not freed on error paths
- Explains the fix: adds a new `out:` label to ensure cleanup
- Signed-off-by: Shuhao Fu and Viresh Kumar (cpufreq maintainer)

Missing tags:
- No "Cc: stable@vger.kernel.org"
- No "Fixes:" tag pointing to the commit that introduced the bug
  (4911ca1031c2ad from 2011)

### 2. CODE CHANGE ANALYSIS

The bug:
- In `s5pv210_cpu_init()`, after `dmc1_clk = clk_get(...)` succeeds, two
  error paths jump to `out_dmc1`:
  1. `policy->cpu != 0` (line 521)
  2. Unsupported memory type (line 533)
- `out_dmc1` only frees `dmc0_clk` and `policy->clk`, not `dmc1_clk`,
  causing a refcount leak.

The fix:
- Adds a new `out:` label that calls `clk_put(dmc1_clk)`
- Changes the two error paths to `goto out;` instead of `goto out_dmc1;`
- `out:` falls through to `out_dmc1` for the rest of cleanup

Change size: 4 lines added, 2 lines modified (minimal change)

### 3. CLASSIFICATION

- Bug fix: fixes a resource leak
- Not a feature addition
- Not a new API
- Standard error handling pattern

### 4. SCOPE AND RISK ASSESSMENT

- Scope: single function, error paths only
- Risk: low
  - Only affects error paths
  - Standard cleanup pattern
  - No logic changes beyond cleanup
- Subsystem: cpufreq (mature)
- Dependencies: none; self-contained

### 5. USER IMPACT

- Affected users: systems using the S5PV210/S5PC110 cpufreq driver
- Severity: resource leak (not a crash, but still a bug)
- Trigger conditions:
  1. `policy->cpu != 0` (non-zero CPU)
  2. Unsupported memory type (not LPDDR/LPDDR2)
- Impact: clock reference leak on error paths

Historical context:
- Driver introduced in v2.6.37 (2010)
- Bug introduced in commit 4911ca1031c2ad (2011-06-06)
- Present in all stable trees since 2011

### 6. STABILITY INDICATORS

- Tested: no "Tested-by:" tag
- Reviewed: signed by Viresh Kumar (maintainer)
- Age: commit is recent (Oct 2025), but the bug is old

### 7. DEPENDENCY CHECK

- No dependencies
- Code exists in stable trees (driver present since v2.6.37)
- Fix applies cleanly to stable trees

### 8. COMPARISON WITH SIMILAR FIXES

Similar refcount leak fixes in cpufreq:
- `cpufreq: nforce2: fix reference count leak` (9600156bb9985)
- `cpufreq: mediatek: fix device leak on probe failure` (ebc4ed14a4dbf)
- `cpufreq: qcom-nvmem: fix memory leaks in probe error paths`
  (e3fd01a810537)

These follow the same pattern and are appropriate for stable.

### 9. STABLE KERNEL RULES COMPLIANCE

- Obviously correct: yes — standard cleanup pattern
- Fixes a real bug: yes — resource leak
- Important issue: moderate — resource leak, not a crash
- Small and contained: yes — 6 lines changed
- No new features: yes — only fixes cleanup
- Applies cleanly: yes — no dependencies

### 10. RISK VS BENEFIT TRADE-OFF

Benefits:
- Fixes a long-standing bug (14 years)
- Prevents resource leaks
- Low risk, small change
- Standard pattern

Risks:
- Minimal — only touches error paths
- No functional changes

Concerns:
- No explicit stable request tag
- Driver targets older ARM SoCs (may have limited current use)
- Leak only occurs on error paths

### FINAL ASSESSMENT

This is a valid bug fix that meets stable criteria:
1. Fixes a real resource leak
2. Small, contained change
3. Low risk
4. No new features
5. Standard error handling pattern

The lack of a "Cc: stable" tag is not a blocker; maintainers may add it,
or it may have been missed. The fix is appropriate for stable backport.

**YES**

 drivers/cpufreq/s5pv210-cpufreq.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index 4215621deb3fe..ba8a1c96427a1 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -518,7 +518,7 @@ static int s5pv210_cpu_init(struct cpufreq_policy *policy)
 
 	if (policy->cpu != 0) {
 		ret = -EINVAL;
-		goto out_dmc1;
+		goto out;
 	}
 
 	/*
@@ -530,7 +530,7 @@ static int s5pv210_cpu_init(struct cpufreq_policy *policy)
 	if ((mem_type != LPDDR) && (mem_type != LPDDR2)) {
 		pr_err("CPUFreq doesn't support this memory type\n");
 		ret = -EINVAL;
-		goto out_dmc1;
+		goto out;
 	}
 
 	/* Find current refresh counter and frequency each DMC */
@@ -544,6 +544,8 @@ static int s5pv210_cpu_init(struct cpufreq_policy *policy)
 	cpufreq_generic_init(policy, s5pv210_freq_table, 40000);
 	return 0;
 
+out:
+	clk_put(dmc1_clk);
 out_dmc1:
 	clk_put(dmc0_clk);
 out_dmc0:
-- 
2.51.0


