Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB36ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 16:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZI9ODdX6ORvvNcsgJ7oo1WgK+EIuef6wWBrwvKtHGRo=; b=f8Ewj2X2sEeGbXLVywNO46yy0I
	NhKC/2gb+UZstmoMHmLFSfz5rESbcfsw3i5ct5xWCF+UVQ9+RibYmG9F72wySAU1hlTzB8WvLtESM
	RYWunealvc8fpDOfkr6iMa5ZZblVVStDBtRWyhobDL4VMoSakDenelaQTQcKEvreFqibv4Ry8Ruq2
	RMdg7Vxmp/cXjqzNzyJ4UYDvGi5YM1jiw4J2s/kj/V42hqj+gRaUqdNfKfG+WcyH/Siuz5IShnNSr
	4dROlTJWNyVGU6xwClWo4MeZaUOdPEXKgWQ+YCJPMIa/lraGo9s5bRcFCkujkro4d3gkfgfyc+aeY
	m2kPbY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t3x-00000006bus-0OzD;
	Thu, 09 Oct 2025 16:00:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t3u-00000006bsY-2Kp1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 16:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30E19445E6;
	Thu,  9 Oct 2025 16:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD2CC4CEE7;
	Thu,  9 Oct 2025 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025614;
	bh=HFLLAvtd9FSIID8d9a2EEj/FAoRntAfuRU132G5VBIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OBmBD1SiQkZBlE6pAt4RxQ6U+5ZJL88UhH+T7MZrixoEp0fVI0fM4br7WerkpVhjW
	 lSoNAXl+sRf5lXCAXwOHGlGJgMxHE5C0TYU8JHrSksxm3F4DGKD2HDOsdQBGkcdDpr
	 PjBlDctlpwdUz8PyodNZ40nEVdQcaAH+VtU1Oih/dXSOJcZjJxQADIbwicTYc94raX
	 WmpfFChO5jBPrHv22ahRHDdYBcSXx31faaIhH1C95kYC8XX2xN55OfVP5CA/Q92Nxv
	 31UgnpH6BNBKGYbKfiqp0j20a992KjJfYSvfOVHEgGrUd8b/Iu9bsgdXrAnC1HwAx6
	 OROj1jY4NF+GA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Quanyang Wang <quanyang.wang@windriver.com>,
	Michal Simek <michal.simek@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	tomi.valkeinen@ideasonboard.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.12] arm64: zynqmp: Disable coresight by default
Date: Thu,  9 Oct 2025 11:55:41 -0400
Message-ID: <20251009155752.773732-75-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009155752.773732-1-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_090014_644665_841489C4 
X-CRM114-Status: GOOD (  12.58  )
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

From: Quanyang Wang <quanyang.wang@windriver.com>

[ Upstream commit 0e3f9140ad04dca9a6a93dd6a6decdc53fd665ca ]

When secure-boot mode of bootloader is enabled, the registers of
coresight are not permitted to access that's why disable it by default.

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
Link: https://lore.kernel.org/r/7e308b8efe977c4912079b4d1b1ab3d24908559e.1756799774.git.michal.simek@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES – default‑disabling the ZynqMP CPU debug Coresight nodes is a
necessary regression fix for stable kernels that picked up the earlier
enablement.

- **Regression introduced**: Commit `fbce12d2899c4` (“arm64: zynqmp: Add
  coresight cpu debug support”) first added the `cpu[0-3]_debug` nodes
  without a `status` property, so they now probe by default; this change
  landed in v6.11 (`arch/arm64/boot/dts/xilinx/zynqmp.dtsi:548`, `:555`,
  `:562`, `:569`).
- **Failure mode**: On secure‑boot deployments the firmware prevents
  access to those debug registers, causing the `coresight-cpu-debug`
  driver to hit denied reads/writes during probe (see the unconditional
  register accesses in `drivers/hwtracing/coresight/coresight-cpu-
  debug.c:135` and :327). Because the driver auto-loads (module alias on
  the AMBA bus) with `CONFIG_CORESIGHT_CPU_DEBUG=m`
  (`arch/arm64/configs/defconfig`), this results in synchronous
  aborts/panics rather than a recoverable error.
- **What the patch does**: Adding `status = "disabled";` to each node
  (`arch/arm64/boot/dts/xilinx/zynqmp.dtsi:548`, `:555`, `:562`, `:569`)
  restores the pre‑v6.11 behavior: the coresight CPU debug blocks stay
  off unless a board DTS explicitly re-enables them. This mirrors how
  other SoCs handle similar hardware constraints (e.g.
  `arch/arm64/boot/dts/qcom/msm8916.dtsi` already defaults these nodes
  to `"disabled"`), and keeps the existing clock wiring in `zynqmp-clk-
  ccf.dtsi` harmless for boards that opt in.
- **Risk assessment**: The change is minimal, device-tree only, and
  reverts functionality that was never present before v6.11. Systems
  depending on the new default-on behavior can still override the status
  in board-specific DTS, while the patch prevents fatal boot failures on
  secure-booted systems. No additional dependencies are required for
  stable backports.

Given the severity of the regression and the contained nature of the
fix, this commit is a solid candidate for backporting to all stable
series that include `fbce12d2899c4`.

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index e11d282462bd3..23d867c03263d 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -550,6 +550,7 @@ cpu0_debug: debug@fec10000 {
 			reg = <0x0 0xfec10000 0x0 0x1000>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu0>;
+			status = "disabled";
 		};
 
 		cpu1_debug: debug@fed10000 {
@@ -557,6 +558,7 @@ cpu1_debug: debug@fed10000 {
 			reg = <0x0 0xfed10000 0x0 0x1000>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu1>;
+			status = "disabled";
 		};
 
 		cpu2_debug: debug@fee10000 {
@@ -564,6 +566,7 @@ cpu2_debug: debug@fee10000 {
 			reg = <0x0 0xfee10000 0x0 0x1000>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu2>;
+			status = "disabled";
 		};
 
 		cpu3_debug: debug@fef10000 {
@@ -571,6 +574,7 @@ cpu3_debug: debug@fef10000 {
 			reg = <0x0 0xfef10000 0x0 0x1000>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu3>;
+			status = "disabled";
 		};
 
 		/* GDMA */
-- 
2.51.0


