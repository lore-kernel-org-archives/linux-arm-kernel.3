Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F63C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 00:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RbMsOViwveRCYkE4QBif5f+VJEJqCwBELRRpJ5wszA=; b=f4E54hWMvsQR/tQGdz8c6kqexr
	luzr+mpa+EONaSaYj/PyLxTi+F288Er1FpXB+iELHPL8BoBDd8ETgj/AtCJ6qHrJ7/h6T/Y6fHcNS
	0WBKhRqhdl5N3IuN9fywVGBAAN4TKsoDTW+Mpk4VFaj4CLJGkq83YcKJFI00sQZ/6VoI3lS3GoMV6
	sxZ5MBZzPmz3cIROk/102pHK/ngQewSHtEyv/1zPVSvb2TodBCSvDH3WPxa36C450usSp9MzKVNEq
	+hViBmGvFOJ9BWLWl3b02m4vhd0f8ZoewaSV8fVfWRSK3XbtbRxdpirFIaVDbmXEcbh/pgPNbZAJK
	bBFD1JzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uijHe-00000009MmQ-3zOE;
	Mon, 04 Aug 2025 00:42:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uij2q-00000009Ky6-3Qj6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 00:27:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25946A54EF2;
	Mon,  4 Aug 2025 00:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595CBC4CEEB;
	Mon,  4 Aug 2025 00:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267235;
	bh=bfLHrI+KHBL420kB9LvWPzH5vg3kP5L2x0mod4WtyLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vCz1pFdKep/vbP6kNZC4csa2RpxO1qUhal+fqT2nUH7aNloimtXucmSQWCGSgBHvV
	 640qb9rLhASbiWJo2ni/MUw+FyPMSg3b1G66jgqA9RwMavyYtuxXso9W/rpVeHHoMv
	 rKHTG0HWdM+WF3rMy4qo6uD+Ba2zVGb7Id3DhlUNV8J1UupPzve/WpJNxfGlQo0k/U
	 /641xP96c5Sk4TLAeE/NJyGDyn2daHFG3sQhLSt/yGGVviKFJxBRkuJPsbCu8fs0Hv
	 XK8OS5ry4GKpaMwvRNHYTVpvE7i2CDOSDuQDfhXi14Figrnls+JMqUvB+eLIVXVRld
	 Lx8+mb5L9C2cg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	michal.simek@amd.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.16 74/85] usb: dwc3: xilinx: add shutdown callback
Date: Sun,  3 Aug 2025 20:23:23 -0400
Message-Id: <20250804002335.3613254-74-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804002335.3613254-1-sashal@kernel.org>
References: <20250804002335.3613254-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_172716_985330_637AF174 
X-CRM114-Status: GOOD (  16.44  )
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

From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

[ Upstream commit 70627bf82e36e61c40c3315e1206e4ea4c02e668 ]

Adds a shutdown callback to ensure that the XHCI stack is properly
shutdown in reboot/shutdown path.

In kexec flow, kernel_restart_prepare() performs actions necessary
to prepare the system for a restart and invokes device_shutdown. To
ensure proper shutdown attach the dwc3 shutdown implementation which
mirrors the remove method.

$ kexec -e

<snip>
xhci-hcd xhci-hcd.0.auto: remove, state 1
usb usb1: USB disconnect, device number 1
usb 1-1: USB disconnect, device number 6
xhci-hcd xhci-hcd.0.auto: USB bus 1 deregistered
kexec_core: Starting new kernel

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Link: https://lore.kernel.org/r/1748977771-714153-1-git-send-email-radhey.shyam.pandey@amd.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees. Here's my
detailed analysis:

## Analysis of the Commit

### 1. **Bug Fix Nature**
This commit fixes a real bug where the USB XHCI stack is not properly
shut down during kexec operations. The commit message explicitly shows
the issue - when `kexec -e` is executed, the XHCI controller is removed
but without a proper shutdown sequence, which can lead to:
- Memory corruption if the controller continues DMA operations
- System instability during kexec transitions
- Potential crashes after kexec

### 2. **Simple and Contained Fix**
The code change is minimal and low-risk:
```diff
+       .shutdown       = dwc3_xlnx_remove,
```
It simply reuses the existing `dwc3_xlnx_remove` function as the
shutdown callback. This is a common pattern in kernel drivers.

### 3. **Follows Established Pattern**
My analysis shows this follows an established pattern in the dwc3 driver
family:
- `dwc3-of-simple.c` uses its remove function for shutdown
- `dwc3-rtk.c` has a dedicated shutdown function that calls similar
  cleanup
- The recent Tegra XUSB commit (3a3be3a1ebf0) added a shutdown callback
  for similar reasons (preventing SMMU-related crashes)

### 4. **Clear Side Effects**
The `dwc3_xlnx_remove` function performs standard cleanup:
- Depopulates child devices (`of_platform_depopulate`)
- Disables and unprepares clocks
- Manages runtime PM state

These are all safe operations for shutdown context.

### 5. **Meets Stable Criteria**
- **Fixes a real bug**: Prevents potential system instability during
  kexec
- **Small change**: Single line addition
- **Low risk**: Reuses existing, tested code path
- **No new features**: Pure bug fix
- **Clear benefit**: Improves system reliability during reboot/kexec
  operations

### 6. **Similar Issues in Other Drivers**
The pattern of missing shutdown callbacks causing issues during
kexec/reboot is well-documented in the kernel, particularly for devices
that perform DMA operations.

The fix ensures proper hardware shutdown sequence during system
reboot/shutdown, preventing the USB controller from accessing memory
after the system has started transitioning to a new kernel or shutting
down. This is especially important for systems using kexec for fast
reboots or crash dump collection.

 drivers/usb/dwc3/dwc3-xilinx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 4ca7f6240d07..09c3c5c226ab 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -422,6 +422,7 @@ static const struct dev_pm_ops dwc3_xlnx_dev_pm_ops = {
 static struct platform_driver dwc3_xlnx_driver = {
 	.probe		= dwc3_xlnx_probe,
 	.remove		= dwc3_xlnx_remove,
+	.shutdown	= dwc3_xlnx_remove,
 	.driver		= {
 		.name		= "dwc3-xilinx",
 		.of_match_table	= dwc3_xlnx_of_match,
-- 
2.39.5


