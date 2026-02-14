Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D6FEF5855
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 21:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NC4RAuXa9QkXBkJf5qMYPyfW8/4MH66oAKSGNmtDnrw=; b=B6wbSpiTqznAr/qA1CwNEPJI17
	ryfglEfyrag8W3NXuBRwj71SNpYFXSzse4m0aKnpHpxdaMox8hD0e9HN+bHsiwNkTAf8XDKyqrVkD
	NoNPzRHg3V6xk2B8j6w2di7AK97yy8O9kUaxKbesE66goIhHj59tCK/dTzSS+TMMwZ27mCmu/03BB
	l3qvhfEcZRBB3F0uQKrvjWSOph5exaKp5f3ywnvr+6NAVWRsVSUn1WHCGlpiO7xd1vT8riAADDeAc
	q5gN0L2h/a9hWSaGMr4lTZ0PZkPzpGi48h1Pa9MotKz/r1sLhkxbHFYVB4woVVzshW5s7uHtiAzLW
	rh0K3GeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrNAD-00000004xLg-35lh;
	Sat, 14 Feb 2026 21:26:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrNAC-00000004xLJ-2mdA;
	Sat, 14 Feb 2026 21:26:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C927600BB;
	Sat, 14 Feb 2026 21:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B97C19422;
	Sat, 14 Feb 2026 21:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771104411;
	bh=spBe1UGw1ARs3IgEvRYC5YF/E9lmPPeTNpVViA6Fnso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nWr7AfVPmprttSt+USWUPrqGCX3tmWTVeMrFEOY6HPamGPxjqDCLFYwspQ/FSRn3i
	 BI0DuJOlELKE+r28nR9JNRz893j5tp30EE4QkIFVFINPpr6CGZdzxwekKbrBo2TER0
	 /axbeQxDsaUUFIzUXyaTmsdvam/CsJYflY+J6KkBJm0F+D5PTNAX79S+yPSodgEaL4
	 DVLw6Dzpu+28n7DBpN8BljxhM+uzA04xcNVQ81txIKwuyS2LWsWQq2h9XXzUzc9ATc
	 YjNFi0ZZb7DFHEq1QkOA5rCipapEMo/jv9PSdnWYbqVNSGq1dnAb/2qNPnFbJ4830X
	 JV4J+0bBk3m4A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	heiko@sntech.de,
	cassel@kernel.org,
	18255117159@163.com,
	bhelgaas@google.com,
	yelangyan@huaqin.corp-partner.google.com,
	linux.amoon@gmail.com,
	nicolas.frattaroli@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-6.1] PCI: dw-rockchip: Disable BAR 0 and BAR 1 for Root Port
Date: Sat, 14 Feb 2026 16:23:34 -0500
Message-ID: <20260214212452.782265-69-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214212452.782265-1-sashal@kernel.org>
References: <20260214212452.782265-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
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

From: Shawn Lin <shawn.lin@rock-chips.com>

[ Upstream commit b5d712e5b87fc56ff838684afb1bae359eb8069f ]

Some Rockchip PCIe Root Ports report bogus size of 1GiB for the BAR
memories and they cause below resource allocation issue during probe.

  pci 0000:00:00.0: [1d87:3588] type 01 class 0x060400 PCIe Root Port
  pci 0000:00:00.0: BAR 0 [mem 0x00000000-0x3fffffff]
  pci 0000:00:00.0: BAR 1 [mem 0x00000000-0x3fffffff]
  pci 0000:00:00.0: ROM [mem 0x00000000-0x0000ffff pref]
	...
  pci 0000:00:00.0: BAR 0 [mem 0x900000000-0x93fffffff]: assigned
  pci 0000:00:00.0: BAR 1 [mem size 0x40000000]: can't assign; no space
  pci 0000:00:00.0: BAR 1 [mem size 0x40000000]: failed to assign
  pci 0000:00:00.0: ROM [mem 0xf0200000-0xf020ffff pref]: assigned
  pci 0000:00:00.0: BAR 0 [mem 0x900000000-0x93fffffff]: releasing
  pci 0000:00:00.0: ROM [mem 0xf0200000-0xf020ffff pref]: releasing
  pci 0000:00:00.0: BAR 0 [mem 0x900000000-0x93fffffff]: assigned
  pci 0000:00:00.0: BAR 1 [mem size 0x40000000]: can't assign; no space
  pci 0000:00:00.0: BAR 1 [mem size 0x40000000]: failed to assign

Since there is no use of the Root Port BAR memories, disable both of them.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
[mani: reworded the description and comment]
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://patch.msgid.link/1766570461-138256-1-git-send-email-shawn.lin@rock-chips.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

### Key Findings from Investigation

1. **`dw_pcie_writel_dbi2`** is a well-established helper available
   since 2023 (the static inline wrapper) with the underlying
   `dw_pcie_write_dbi2` available since 2019. It should be present in
   recent stable kernels.

2. **`dbi_base2` setup pattern**: The standard DWC code has a default
   fallback of `pci->dbi_base + SZ_4K` (4KB offset). However, the
   Rockchip hardware uses a different offset of `0x100000` (1MB). This
   commit explicitly sets `pci->dbi_base2 = pci->dbi_base +
   PCIE_TYPE0_HDR_DBI2_OFFSET` because the generic fallback would use
   the wrong offset for this hardware.

3. **The rockchip DWC driver** has been present since 2021, so it exists
   in all active stable trees.

### Risk vs. Benefit

**Benefit**: Fixes a real resource allocation failure during PCIe probe
on Rockchip platforms (RK3588 and potentially others). Without this fix,
BAR allocation consumes 2GiB of address space needlessly, potentially
causing downstream device BAR allocation failures. The log output
clearly shows "can't assign; no space" errors.

**Risk**: Very low. The fix:
- Only affects Rockchip DWC PCIe in host (Root Port) mode
- Disables BARs that are not used by the Root Port
- Uses well-established DWC infrastructure (`dw_pcie_writel_dbi2`)
- The DBI2 offset is hardware-specific and correct for this platform

### Potential Concern

One thing to verify is whether `dbi_base2` might already be set by the
generic DWC code before `rockchip_pcie_host_init` is called. If the
generic code sets it to `dbi_base + SZ_4K` first, this override to
`dbi_base + 0x100000` is essential for correctness. If it's not set at
all, then both the setup AND the BAR disable writes are needed.

### User Impact

- **Moderate-High**: RK3588 is a widely used ARM SoC in Single Board
  Computers (SBCs), NAS devices, and embedded systems. PCIe resource
  allocation failures directly impact users trying to use PCIe devices
  (NVMe SSDs, network cards, etc.) on these platforms.

### Stable Criteria Assessment

| Criteria | Assessment |
|----------|------------|
| Obviously correct and tested | Yes - simple BAR disable using standard
DWC mechanism |
| Fixes a real bug | Yes - bogus BAR sizes cause resource allocation
failures |
| Important issue | Yes - PCIe device failures on popular ARM platform |
| Small and contained | Yes - ~10 lines in one file |
| No new features | Correct - this is a hardware workaround |
| Applies cleanly | Likely yes for recent stable trees |

### Conclusion

This is a hardware quirk/workaround that fixes a real resource
allocation problem on Rockchip RK3588 PCIe Root Ports. The bogus 1GiB
BAR sizes waste address space and cause downstream device allocation
failures. The fix is small, well-scoped, uses existing infrastructure,
and only affects Rockchip platforms. It clearly falls into the "hardware
quirks" exception category that is explicitly appropriate for stable
backporting.

**YES**

 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index f8605fe61a415..c5f3c8935098f 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -80,6 +80,8 @@
 #define  PCIE_LINKUP_MASK		GENMASK(17, 16)
 #define  PCIE_LTSSM_STATUS_MASK		GENMASK(5, 0)
 
+#define PCIE_TYPE0_HDR_DBI2_OFFSET      0x100000
+
 struct rockchip_pcie {
 	struct dw_pcie pci;
 	void __iomem *apb_base;
@@ -292,6 +294,8 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
 	if (irq < 0)
 		return irq;
 
+	pci->dbi_base2 = pci->dbi_base + PCIE_TYPE0_HDR_DBI2_OFFSET;
+
 	ret = rockchip_pcie_init_irq_domain(rockchip);
 	if (ret < 0)
 		dev_err(dev, "failed to init irq domain\n");
@@ -302,6 +306,10 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
 	rockchip_pcie_configure_l1ss(pci);
 	rockchip_pcie_enable_l0s(pci);
 
+	/* Disable Root Ports BAR0 and BAR1 as they report bogus size */
+	dw_pcie_writel_dbi2(pci, PCI_BASE_ADDRESS_0, 0x0);
+	dw_pcie_writel_dbi2(pci, PCI_BASE_ADDRESS_1, 0x0);
+
 	return 0;
 }
 
-- 
2.51.0


