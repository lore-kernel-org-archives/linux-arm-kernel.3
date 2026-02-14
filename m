Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC0BEF5855
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 21:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErBSkw+qsT894iqDmcRKRX3ClWoCNhw1vF99xVYmVT0=; b=tOFiFgliWjdHoD76pEiOAmgfx/
	Yfz54ziOxBctm+K7GO09F16uLDMpZIvhT0XY0e6oUgzeBhS6V+Qf1wwthCitO6FuPmVSwbJwiVabQ
	u+UxnKFzyajQwzh9ELGCl4GDnV9iCkC2C+FBf2i/oZ8af3Ga3lqSfQQND0WmbGc3SVShFN1r1Vd3I
	Cc2y0a9oLH7sP6+ZvCvdpWSjT9bQ/3aw3p9Wt5Vg8cI2ti1VlHtc8bHlQxUDtezEgTe1sBIXnNdmu
	j/ZCJsPKKeE0+ktOzDd7VH5klJcJKy+PCjWIL4a922HcNR12x72A99L2rI6oV5WFfc3bS099RgSVv
	xYsgy+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrN9M-00000004wuC-05lP;
	Sat, 14 Feb 2026 21:26:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrN9J-00000004wt9-2u2w;
	Sat, 14 Feb 2026 21:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECAA6415F2;
	Sat, 14 Feb 2026 21:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0559C19422;
	Sat, 14 Feb 2026 21:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771104356;
	bh=wXXapwFeYVgtQZwgGByrjTAqhAfXkHTGrYtefsyZo9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mkOcGjHS+MbvpM5d1YKV1UJ+L9uNRLis4jTZ6Yz6eHiEohtOmJlP05sEqhUIhXQZb
	 fP19pi33tJwsvTOFVUBSYIRQ3swen5FvPfnCfNvy8ZZHJU2Au3O4gj8g6uwxETv+u9
	 2z5gTIiRzv7+rlAI07jbnzf2RhzrnHN+GERNkymZ83lIuH+OGSpfanR+qE2VYHWq1x
	 eCp0bKyrVemD3G1LPjjGhvUS1fb/1eR4I//dUlPxKOEIFJX+NsCvmh/TIPYpPad6ty
	 8PA91dvf+4b5wQHpPDByY7EkICmF/A9FXD1QpUTR1n61Ri2mY5HyFcq4KXw6II7+dZ
	 i+ikxghzSluBQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Johnny-CC Chang <Johnny-CC.Chang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-5.10] PCI: Mark Nvidia GB10 to avoid bus reset
Date: Sat, 14 Feb 2026 16:23:02 -0500
Message-ID: <20260214212452.782265-37-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214212452.782265-1-sashal@kernel.org>
References: <20260214212452.782265-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_132557_791581_4B62371A 
X-CRM114-Status: GOOD (  15.17  )
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

From: Johnny-CC Chang <Johnny-CC.Chang@mediatek.com>

[ Upstream commit c81a2ce6b6a844d1a57d2a69833a9d0f00403f00 ]

After asserting Secondary Bus Reset to downstream devices via a GB10 Root
Port, the link may not retrain correctly, e.g., the link may retrain with a
lower lane count or config accesses to downstream devices may fail.

Prevent use of Secondary Bus Reset for devices below GB10.

Signed-off-by: Johnny-CC Chang <Johnny-CC.Chang@mediatek.com>
[bhelgaas: drop pci_ids.h update (only used once), update commit log]
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://patch.msgid.link/20251113084441.2124737-1-Johnny-CC.Chang@mediatek.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of PCI Quirk for Nvidia GB10 Bus Reset

### Commit Message Analysis

The commit adds a PCI quirk to prevent Secondary Bus Reset (SBR) for
devices behind Nvidia GB10 Root Ports. The problem is clearly stated:
after asserting SBR, the link may not retrain correctly — leading to
reduced lane count or complete failure of config accesses to downstream
devices. This is a real hardware bug with concrete symptoms (link
degradation, device inaccessibility).

### Code Change Analysis

The change is minimal and surgical:
- Two `DECLARE_PCI_FIXUP_HEADER` lines are added for two specific Nvidia
  device IDs (`0x22CE` and `0x22D0`)
- Both call the existing `quirk_no_bus_reset()` function, which simply
  sets `PCI_DEV_FLAGS_NO_BUS_RESET` on the device
- A comment block explains why the quirk is needed, with a link to the
  mailing list discussion

The diff also shows context that there's already a similar quirk pattern
for other Nvidia GPU devices (`quirk_nvidia_no_bus_reset` matching
`0x2340` range), as well as Atheros devices. This is a well-established
pattern in the kernel.

### Classification: Hardware Quirk

This falls squarely into the **hardware quirk** category, which is
explicitly listed as a strong YES signal for stable backporting.
Hardware quirks:
- Fix real-world hardware issues
- Are trivial additions to existing infrastructure
- Have near-zero risk of regression (they only affect the specific
  hardware identified by the PCI IDs)

### Scope and Risk Assessment

- **Lines changed**: ~8 lines (2 macro invocations + comment block)
- **Files touched**: 1 (`drivers/pci/quirks.c`)
- **Complexity**: Minimal — uses existing `quirk_no_bus_reset()`
  function
- **Risk**: Extremely low — only affects devices with vendor ID
  `PCI_VENDOR_ID_NVIDIA` and device IDs `0x22CE` or `0x22D0`
- **No dependencies**: The `quirk_no_bus_reset()` function and
  `DECLARE_PCI_FIXUP_HEADER` macro have existed in the kernel for a very
  long time

### User Impact

- **Who is affected**: Users with Nvidia GB10 Root Ports (likely
  MediaTek platforms given the author's affiliation)
- **Severity without fix**: Bus reset can cause downstream devices to
  become inaccessible (config accesses fail) or degrade link performance
  (lower lane count). This can manifest as device failures, system
  hangs, or degraded performance
- **Severity with fix**: Bus reset is avoided for these specific root
  ports, preventing the link training failure

### Stability Indicators

- **Reviewed-by**: Manivannan Sadhasivam (PCI subsystem reviewer)
- **Committed by**: Bjorn Helgaas (PCI subsystem maintainer), who also
  edited the commit log
- **Mailing list link**: Provided for traceability
- The pattern is identical to many existing quirks in the same file

### Dependency Check

No dependencies. The `quirk_no_bus_reset()` function exists in all
stable trees. `DECLARE_PCI_FIXUP_HEADER` and `PCI_VENDOR_ID_NVIDIA` are
long-established. This will apply cleanly to any stable tree.

### Conclusion

This is a textbook hardware quirk addition — small, self-contained, zero
regression risk, fixes a real hardware issue (bus reset failure causing
device inaccessibility), uses existing well-tested infrastructure,
reviewed and committed by the PCI subsystem maintainer. It meets all
stable kernel criteria.

**YES**

 drivers/pci/quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 54c76ba9a767e..5782dfb863cad 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3748,6 +3748,14 @@ static void quirk_no_bus_reset(struct pci_dev *dev)
 	dev->dev_flags |= PCI_DEV_FLAGS_NO_BUS_RESET;
 }
 
+/*
+ * After asserting Secondary Bus Reset to downstream devices via a GB10
+ * Root Port, the link may not retrain correctly.
+ * https://lore.kernel.org/r/20251113084441.2124737-1-Johnny-CC.Chang@mediatek.com
+ */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x22CE, quirk_no_bus_reset);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NVIDIA, 0x22D0, quirk_no_bus_reset);
+
 /*
  * Some NVIDIA GPU devices do not work with bus reset, SBR needs to be
  * prevented for those affected devices.
-- 
2.51.0


