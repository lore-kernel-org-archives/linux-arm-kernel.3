Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B3AD2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 03:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2u9tsd98lGmo0QOJXaJPZuwZVBgxx2lKl/D63YfmpiM=; b=WXbsUZZ6hRcpsfDdSgx02ClfRb
	v+RHLBywiqxfavfuehlaomKkXCmEoMnnMdWTyFwzg1NjheD7YjUVVER46gKmYPVBCvvx6IzNBlX4C
	axqcRsFq/il0G62y6hYuuXBTWCB3Qq552jQ4PW1NlTraePZ7x6nMzlgETDrF4CQvoeZ03rLhDO+0Z
	xDulziXEOguIBdcH2RyECf//Q7dDlvxxHxIbg1BsovTa9R2P7QXUiOKgAMODOr61mVqtgul4cJ8dF
	dzOFEHkV2B9s/CAngi2KvE8u1K650RfDtuabtOWaq8J12t/3OaCT++l7suHGeiOGMIGDK4U6kHPE9
	aLIJXl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTBDA-0000000F4G1-3XYH;
	Wed, 10 Dec 2025 03:49:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTBD8-0000000F4FL-2BUo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 03:49:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94A7443C18;
	Wed, 10 Dec 2025 03:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FC8C4CEF1;
	Wed, 10 Dec 2025 03:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765338591;
	bh=qzSaSybZ/hCE2mmgCX5xvO5G6qJNLs6zE80wvIuZKG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gzYhrOaTHjSAr0nVJmBhyccXDwVKOO5q1ARM9tePM4dO2VuGT99sFzap2iLhSHqfS
	 9Veccu/kHomVVTCJrzwmTF6rbAVimUSDAjdLNVrTzq1IMbGtPaT/xxj6iyphvf1gLi
	 xusERv92a5s36aegmM4t5lmvhFmpYuDv157OQRfSUjMCbfugwaduLA4QJlShtQ2pww
	 wk9URdU4T1PeRQ92Sf8KqMwyI31Ee2jSfbSzXUgyMZMhU2nACyf0CQmGLD51eRSRHw
	 8zIDvawhQVSew6yAtGEbZeBLmrUBIgPItzDE8FlfD40SmuGduanDuO44pwsyReE/Wn
	 8XC5T0c19nY7w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Josua Mayer <josua@solid-run.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	sebastian.hesselbarth@gmail.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.18-5.10] clk: mvebu: cp110 add CLK_IGNORE_UNUSED to pcie_x10, pcie_x11 & pcie_x4
Date: Tue,  9 Dec 2025 22:48:56 -0500
Message-ID: <20251210034915.2268617-15-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251210034915.2268617-1-sashal@kernel.org>
References: <20251210034915.2268617-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_194954_606220_6001638A 
X-CRM114-Status: GOOD (  23.65  )
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

From: Josua Mayer <josua@solid-run.com>

[ Upstream commit f0e6bc0c3ef4b4afb299bd6912586cafd5d864e9 ]

CP110 based platforms rely on the bootloader for pci port
initialization.
TF-A actively prevents non-uboot re-configuration of pci lanes, and many
boards do not have software control over the pci card reset.

If a pci port had link at boot-time and the clock is stopped at a later
point, the link fails and can not be recovered.

PCI controller driver probe - and by extension ownership of a driver for
the pci clocks - may be delayed especially on large modular kernels,
causing the clock core to start disabling unused clocks.

Add the CLK_IGNORE_UNUSED flag to the three pci port's clocks to ensure
they are not stopped before the pci controller driver has taken
ownership and tested for an existing link.

This fixes failed pci link detection when controller driver probes late,
e.g. with arm64 defconfig and CONFIG_PHY_MVEBU_CP110_COMPHY=m.

Closes: https://lore.kernel.org/r/b71596c7-461b-44b6-89ab-3cfbd492639f@solid-run.com
Signed-off-by: Josua Mayer <josua@solid-run.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Commit Analysis: clk: mvebu: cp110 add CLK_IGNORE_UNUSED to pcie_x10,
pcie_x11 & pcie_x4

### 1. COMMIT MESSAGE ANALYSIS

**Subject:** Adding CLK_IGNORE_UNUSED flag to three PCIe clock gates on
Marvell CP110 platforms.

**Key problem described:**
- CP110 platforms rely on bootloader for PCIe port initialization
- TF-A (Trusted Firmware-A) prevents non-U-Boot reconfiguration of PCIe
  lanes
- Many boards lack software control over PCIe card reset
- If a PCIe port had an active link at boot and the clock is stopped
  later, the link fails permanently and cannot be recovered
- PCIe controller driver probe may be delayed on large modular kernels,
  causing the clock framework to disable "unused" clocks before the
  driver takes ownership

**Important tags:**
- **No "Cc: stable@vger.kernel.org"** - maintainer didn't explicitly
  request backport
- **No "Fixes:" tag** - unclear when the issue was introduced
- **Reviewed-by: Andrew Lunn** - reputable ARM/networking kernel
  developer
- **Closes:** link to lore.kernel.org bug report - confirms real users
  hit this

### 2. CODE CHANGE ANALYSIS

The change adds a new `gate_flags()` helper function that returns
`CLK_IGNORE_UNUSED` for three specific clock gates:
- `CP110_GATE_PCIE_X1_0` (pcie_x10)
- `CP110_GATE_PCIE_X1_1` (pcie_x11)
- `CP110_GATE_PCIE_X4` (pcie_x4)

This flag is then passed to `init.flags` when registering gate clocks.

**Technical mechanism of the bug:**
1. Boot proceeds with PCIe link established by bootloader
2. Clock framework marks these PCIe clocks as "unused" (no driver
   claimed them yet)
3. Late in boot, clock framework garbage-collects unused clocks
4. PCIe clocks are disabled, breaking the active link
5. When PCIe driver finally probes (especially in modular configs), link
   is irrecoverably failed

**What CLK_IGNORE_UNUSED does:**
Tells the clock framework to never disable these clocks just because
they appear unclaimed. This is the standard mechanism for clocks that
must remain active until a driver explicitly takes ownership.

### 3. CLASSIFICATION

**Type:** Hardware workaround / quirk for platform-specific behavior

This falls into the "quirks and workarounds" exception category for
stable kernels. It's a workaround for the specific constraints of the
Marvell CP110 platform where:
- TF-A manages PCIe lane configuration
- Clock disable breaks PCIe links irreversibly
- Driver load timing varies across kernel configurations

### 4. SCOPE AND RISK ASSESSMENT

**Size:** ~21 lines added, 1 file changed, self-contained

**Risk level:** LOW
- Only affects Marvell CP110 platforms
- No changes to core clock framework
- Worst case: slightly higher power consumption (clocks stay on when
  could be off)
- No chance of breaking other subsystems

**Subsystem:** mvebu clock driver - mature platform-specific driver

### 5. USER IMPACT

**Affected users:** Marvell CP110-based platforms (Armada 7K/8K,
SolidRun products, etc.)

**Severity:** HIGH for affected users - PCIe devices completely fail to
be detected

**Real-world evidence:**
- Bug report on lore.kernel.org linked in commit
- Reproducible with "arm64 defconfig and
  CONFIG_PHY_MVEBU_CP110_COMPHY=m"

### 6. STABILITY INDICATORS

- **Reviewed-by:** Andrew Lunn (highly respected maintainer for this
  subsystem)
- The CP110 clock driver has existed for years - this isn't new code
- Change is isolated and uses standard clock framework mechanisms

### 7. DEPENDENCY CHECK

- Self-contained change, no dependencies on other commits
- The CP110 clock driver exists in stable trees
- No required prerequisite patches

### CONCERNS

1. **No explicit stable tag** - maintainer didn't mark for backport
2. **No Fixes: tag** - we don't know how far back this issue goes
3. **Workaround approach** - CLK_IGNORE_UNUSED is somewhat heavy-handed
   but appropriate here

### DECISION ANALYSIS

**For backporting:**
- Fixes real hardware failure (PCIe not working) on production hardware
- Small, surgical, self-contained fix
- Very low regression risk (only affects specific ARM platform)
- Follows the "hardware quirk" exception pattern for stable
- Uses standard clock framework mechanisms
- Has review from reputable subsystem maintainer

**Against backporting:**
- No Cc: stable from maintainer
- Affects relatively niche ARM SoC platform
- No indication of when bug was introduced

### Conclusion

This commit fixes a real, user-impacting bug where PCIe devices fail to
be detected on Marvell CP110-based platforms. The fix is a standard
hardware quirk/workaround pattern - adding CLK_IGNORE_UNUSED to prevent
premature clock disabling that breaks active PCIe links. The change is
small (~21 lines), isolated to a single platform-specific driver,
carries minimal regression risk, and has been reviewed by a reputable
kernel maintainer.

While there's no explicit stable tag, this fits the stable criteria for
hardware workarounds that fix real user-facing bugs. The worst case
(clocks stay on unnecessarily) is far preferable to the current bug
(PCIe completely broken).

**YES**

 drivers/clk/mvebu/cp110-system-controller.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/mvebu/cp110-system-controller.c b/drivers/clk/mvebu/cp110-system-controller.c
index 03c59bf221060..b47c869060466 100644
--- a/drivers/clk/mvebu/cp110-system-controller.c
+++ b/drivers/clk/mvebu/cp110-system-controller.c
@@ -110,6 +110,25 @@ static const char * const gate_base_names[] = {
 	[CP110_GATE_EIP197]	= "eip197"
 };
 
+static unsigned long gate_flags(const u8 bit_idx)
+{
+	switch (bit_idx) {
+	case CP110_GATE_PCIE_X1_0:
+	case CP110_GATE_PCIE_X1_1:
+	case CP110_GATE_PCIE_X4:
+		/*
+		 * If a port had an active link at boot time, stopping
+		 * the clock creates a failed state from which controller
+		 * driver can not recover.
+		 * Prevent stopping this clock till after a driver has taken
+		 * ownership.
+		 */
+		return CLK_IGNORE_UNUSED;
+	default:
+		return 0;
+	}
+};
+
 struct cp110_gate_clk {
 	struct clk_hw hw;
 	struct regmap *regmap;
@@ -171,6 +190,7 @@ static struct clk_hw *cp110_register_gate(const char *name,
 	init.ops = &cp110_gate_ops;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
+	init.flags = gate_flags(bit_idx);
 
 	gate->regmap = regmap;
 	gate->bit_idx = bit_idx;
-- 
2.51.0


