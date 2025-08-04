Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6CDC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 01:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RO7MTN7rJTsidI9fx2uOdTluBSTc9yFGAjBXATWZFK4=; b=MVbrWUfNOPrVat14bA05x8Ndf7
	crcl7apL2M/0VRCcQkF2PgN6xsPgYsU4xiN9sVHsC/9aQjk+ioy/1gBrmq9uSCfCo5KRbmxJ23b6W
	fo1lPAZ+L9ZGvp+Z+dVO6sXH/WYekTQzcDmDhnuzyrpuju0K0oUn1Mi7FSVwwgtcFsw/VAVcud6MH
	4XNo+IqNEX1r5a0Si9CWeISNh+N13sOUifhrwW5+dP0Hh8LDT3nIp7pV3qK//xSTcmt73CpzY980r
	x3N7PzkYdS34qL+fYoDYks/p8nHYjcoQmIODU4xBffADMq6CbDzXI5Y4fRA/J4dNKG3vllDXsYVHI
	VbuxzvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uik7H-00000009RGz-3vDD;
	Mon, 04 Aug 2025 01:35:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uijCO-00000009M5y-0Hw4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 00:37:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2282D5C12E9;
	Mon,  4 Aug 2025 00:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EB1C4CEEB;
	Mon,  4 Aug 2025 00:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267826;
	bh=BlfZYz60IGMGAxA+cCD9L/qRFhnLBG5MQ7RPwZoB5aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HK4Ek0WbldELOHbDIl3F8+zJnWlMKscou88wn81d/Fx/bZJAHj+Rts2CN4Jl19hdh
	 /4LQi+TlKPxug6uRD5aMgJ5rlh7Xl2Te8asw+qvg6HW8I6BI32KLocxLjXydldoabY
	 RcKKCJ9ONzTuRTW0LZMVclirJZzMGiO+tCXimXEEuOarQaaE/1p0s0zfizrsTW9yO4
	 FRRt6WQB7JKhYmB/BY1dbFf80l8N8S8BnhUrcP3OohW4VsTstvC4vcm7yvSjyqqTaa
	 F7Kdqf/eFlgL4hQC5S/tDKYPRD666+BU0AloZZVGKyML8zJggg/i4iNX7YYWbSh4B6
	 z3kgTFk7+S2ZQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hiago De Franco <hiago.franco@toradex.com>,
	Peng Fan <peng.fan@nxp.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	andersson@kernel.org,
	shawnguo@kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 09/51] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Sun,  3 Aug 2025 20:36:01 -0400
Message-Id: <20250804003643.3625204-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804003643.3625204-1-sashal@kernel.org>
References: <20250804003643.3625204-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.147
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_173708_300471_0CF8B8E2 
X-CRM114-Status: GOOD (  22.10  )
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

From: Hiago De Franco <hiago.franco@toradex.com>

[ Upstream commit 496deecb020d14ba89ba7084fbc3024f91687023 ]

For the i.MX8X and i.MX8 family SoCs, when the Cortex-M core is powered
up and started by the Cortex-A core using the bootloader (e.g., via the
U-Boot bootaux command), both M-core and Linux run within the same SCFW
(System Controller Firmware) partition. With that, Linux has permission
to control the M-core.

But once the M-core is started by the bootloader, the SCFW automatically
enables its clock and sets the clock rate. If Linux later attempts to
enable the same clock via clk_prepare_enable(), the SCFW returns a
'LOCKED' error, as the clock is already configured by the SCFW. This
causes the probe function in imx_rproc.c to fail, leading to the M-core
power domain being shut down while the core is still running. This
results in a fault from the SCU (System Controller Unit) and triggers a
system reset.

To address this issue, ignore handling the clk for i.MX8X and i.MX8
M-core, as SCFW already takes care of enabling and configuring the
clock.

Suggested-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Link: https://lore.kernel.org/r/20250629172512.14857-3-hiagofranco@gmail.com
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis, I can now provide a definitive answer:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Critical bug fix preventing system reset**: The commit fixes a
   serious issue where the probe function failure causes the M-core
   power domain to be shut down while the core is still running,
   resulting in a fault from the SCU and triggering a system reset. This
   is a severe user-impacting bug that can cause unexpected system
   reboots.

2. **Minimal and contained change**: The fix is very simple - it just
   adds `|| dcfg->method == IMX_RPROC_SCU_API` to an existing condition
   in the `imx_rproc_clk_enable()` function. This is a one-line change
   that only affects the clock handling logic for i.MX8X and i.MX8
   family SoCs when using SCU API method.

3. **Clear root cause**: The commit message clearly explains the issue -
   when the M-core is started by the bootloader, the SCFW automatically
   enables its clock. If Linux later attempts to enable the same clock,
   SCFW returns a 'LOCKED' error, causing probe failure and subsequent
   power domain shutdown while the core is running.

4. **No architectural changes**: This is purely a bug fix that doesn't
   introduce new features or change the driver architecture. It simply
   skips clock operations for a specific configuration where the clock
   is already managed by the SCFW.

5. **Platform-specific fix with no regression risk**: The change only
   affects i.MX8X and i.MX8 platforms using the SCU API method
   (`IMX_RPROC_SCU_API`). Other platforms and methods are unaffected,
   minimizing the risk of regression.

6. **Prevents data corruption/loss**: System resets caused by this bug
   could potentially lead to data loss or corruption, making this fix
   important for system stability.

The specific code change in `imx_rproc_clk_enable()` at line 1033 simply
extends the existing check from:
```c
if (dcfg->method == IMX_RPROC_NONE)
```
to:
```c
if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
```

This ensures that for SCU-managed cores, Linux doesn't attempt to enable
clocks that are already controlled by the SCFW, preventing the probe
failure and subsequent system reset.

 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index bbaba453383d..ff7acc326f09 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -750,8 +750,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	struct device *dev = priv->dev;
 	int ret;
 
-	/* Remote core is not under control of Linux */
-	if (dcfg->method == IMX_RPROC_NONE)
+	/* Remote core is not under control of Linux or it is managed by SCU API */
+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
 		return 0;
 
 	priv->clk = devm_clk_get(dev, NULL);
-- 
2.39.5


