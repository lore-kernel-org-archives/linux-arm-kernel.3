Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD01ECCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ue9I/EQZfufXLjOyZFcJ/DZ1KJ5FB4+IbS7sciaL0Vk=; b=cbve5ormK/OZM0Zdxup/zEue8D
	7raRsjPCrhPgo/jKlGOGsx2hJ/aaHrxZMCnyPPyu3c+A8uyMP+/RZcwb1cDl8uVOOlCdYb+JBYMw7
	x2lBFCHgtDkJpsj2aflFB8YSmofx95CSq/IwDokIVyl0AZ2GH3KwfbnIvvnsIVIe2XWaYG/q+vVZr
	UxrA+I7QpGc0vK+AcHye+DqAhUktjDoOE/ydOO4mAPrDxXrAg2m1wUlnAb5Fb8KPDTlBvrqo5LVN6
	WX6AoM/Rz79swkcvB620Jon6UOtXi0wcKFziefCvALAyUWnmLJJBRh2H6CYQHZj7ky7DjvCNROIjO
	QwYH+81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD24Q-0000000CRkh-2F9t;
	Sun, 26 Oct 2025 14:50:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD24O-0000000CRjx-2PzY;
	Sun, 26 Oct 2025 14:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BE1D43E21;
	Sun, 26 Oct 2025 14:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2703C116B1;
	Sun, 26 Oct 2025 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490207;
	bh=8cx012AHIyAVT81End9yKPY7nr1ogoBemutO1syf4RE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qJy7xLpubR4b7Vqt55wzHVVDjZa3qy3B3jW3frp8cVH339QiJPRQrf1X0JhMfytq5
	 MrPoqSEOAtCoC1QSgqRV7goA6JFuwPteYB7X2PoBZBF9LxK9wMBoCpWudq+5wzGGD+
	 MM3opFxrq+Kj+L3iPyv2tiy/VzWcvDHHqO7y6yWh3C+44DdfSWdbSk45SvSxONEN3Z
	 0ZDKHCQy145YxEUNjGqSQSYKD4OvIeuRnNFs7Gkiyrppb3dstnUv7pLGfoBpzow6I+
	 83icfGhz5uYV93S89kajcbag6iSRLi79ALc6GL+X7BzlmTxkXkwj7IzdlRdQxTjMSj
	 auhVbZU5urQdg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Drew Fustini <fustini@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	guoren@kernel.org,
	wefu@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17] clk: thead: th1520-ap: set all AXI clocks to CLK_IS_CRITICAL
Date: Sun, 26 Oct 2025 10:48:43 -0400
Message-ID: <20251026144958.26750-5-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_075008_672669_A0A4CEA0 
X-CRM114-Status: GOOD (  14.26  )
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

From: Icenowy Zheng <uwu@icenowy.me>

[ Upstream commit c567bc5fc68c4388c00e11fc65fd14fe86b52070 ]

The AXI crossbar of TH1520 has no proper timeout handling, which means
gating AXI clocks can easily lead to bus timeout and thus system hang.

Set all AXI clock gates to CLK_IS_CRITICAL. All these clock gates are
ungated by default on system reset.

In addition, convert all current CLK_IGNORE_UNUSED usage to
CLK_IS_CRITICAL to prevent unwanted clock gating.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Backport Recommendation

**YES** - This commit should be backported to stable kernel trees.

---

## Executive Summary

This commit fixes a critical system stability issue on TH1520 SoC-based
systems (LicheePi 4A, BeagleV Ahead boards) by preventing AXI clock
gating, which causes bus timeouts and system hangs due to a hardware
limitation. The fix is small, localized, low-risk, and follows
established kernel patterns.

---

## Detailed Analysis

### 1. Problem Description

**Hardware Limitation**: The TH1520 SoC's AXI crossbar lacks proper
timeout handling. When AXI clocks are gated, bus transactions can
timeout indefinitely, causing complete system hangs.

**User Impact**: Without this fix, users experience:
- System hangs during boot (especially after "clk: Disabling unused
  clocks")
- Unresponsive devices when accessing peripherals
- Random freezes when the kernel's power-saving mechanisms gate AXI bus
  clocks

### 2. Code Changes Analysis

The commit makes **44 lines of mechanical flag changes** in
`drivers/clk/thead/clk-th1520-ap.c`:

**Two types of changes:**

1. **Converting `0` → `CLK_IS_CRITICAL`** (15 clocks):
   - `axi4_cpusys2_aclk` (drivers/clk/thead/clk-th1520-ap.c:483)
   - `axi_aclk` (drivers/clk/thead/clk-th1520-ap.c:505)
   - `vi_clk` (drivers/clk/thead/clk-th1520-ap.c:685)
   - `vo_axi_clk` (drivers/clk/thead/clk-th1520-ap.c:710)
   - `aon2cpu_a2x_clk` (drivers/clk/thead/clk-th1520-ap.c:794)
   - `x2x_cpusys_clk` (drivers/clk/thead/clk-th1520-ap.c:796)
   - `npu_axi_clk` (drivers/clk/thead/clk-th1520-ap.c:813)
   - `cpu2vp_clk` (drivers/clk/thead/clk-th1520-ap.c:814)
   - `axi4_vo_aclk` (drivers/clk/thead/clk-th1520-ap.c:858)
   - `gpu_cfg_aclk` (drivers/clk/thead/clk-th1520-ap.c:862)
   - `x2h_dpu1_aclk` (drivers/clk/thead/clk-th1520-ap.c:894)
   - `x2h_dpu_aclk` (drivers/clk/thead/clk-th1520-ap.c:896)
   - `iopmp_dpu1_aclk` (drivers/clk/thead/clk-th1520-ap.c:906)
   - `iopmp_dpu_aclk` (drivers/clk/thead/clk-th1520-ap.c:908)
   - `iopmp_gpu_aclk` (drivers/clk/thead/clk-th1520-ap.c:910)

2. **Converting `CLK_IGNORE_UNUSED` → `CLK_IS_CRITICAL`** (7 clocks):
   - `apb_pclk` (drivers/clk/thead/clk-th1520-ap.c:654)
   - `vp_axi_clk` (drivers/clk/thead/clk-th1520-ap.c:735)
   - `cpu2aon_x2h_clk` (drivers/clk/thead/clk-th1520-ap.c:798)
   - `cpu2peri_x2h_clk` (drivers/clk/thead/clk-th1520-ap.c:800)
   - `perisys_apb1_hclk` (drivers/clk/thead/clk-th1520-ap.c:802)
   - `perisys_apb2_hclk` (drivers/clk/thead/clk-th1520-ap.c:804)
   - `perisys_apb3_hclk` (drivers/clk/thead/clk-th1520-ap.c:806)

**Technical Significance**:
- `CLK_IGNORE_UNUSED` (BIT(3)): Only prevents gating during initial
  cleanup
- `CLK_IS_CRITICAL` (BIT(11)): Prevents gating at ALL times - enforced
  with WARN messages in clk core

### 3. Historical Context

The TH1520 clock driver has a history of clock gating issues:

**Timeline:**
- **v6.11** (July 2024): Driver introduced (ae81b69fd2b1e)
- **January 2025**: First fix added `CLK_IGNORE_UNUSED` to prevent boot
  hangs (037705e94bf6e)
  - Commit message: "Without this flag, the boot hangs after 'clk:
    Disabling unused clocks'"
- **June 2025**: More bus clocks marked `CLK_IGNORE_UNUSED`
  (0370395d45ca6)
  - Fixed boot hangs with PVT thermal sensor and PWM controller
  - Documented that alternative solutions (simple-pm-bus) were not
    viable
- **August 2025**: Current commit upgrades to `CLK_IS_CRITICAL`
  (c567bc5fc68c4)
  - Addresses root cause: AXI crossbar hardware limitation

**Pattern**: Progressive escalation shows that `CLK_IGNORE_UNUSED` was
insufficient, and the proper fix requires `CLK_IS_CRITICAL` to prevent
ANY clock gating, not just initial cleanup.

### 4. Validation Against Kernel Patterns

**Industry Standard Practice**: Using `CLK_IS_CRITICAL` for critical bus
clocks is well-established:

```bash
# Similar patterns found in:
- drivers/clk/imx/clk-imx6q.c: mmdc_ch0_axi (CLK_IS_CRITICAL)
- drivers/clk/imx/clk-imx6ul.c: axi (CLK_IS_CRITICAL)
- drivers/clk/imx/clk-imx7d.c: main_axi_root_clk (CLK_IS_CRITICAL)
- drivers/clk/imx/clk-imx93.c: wakeup_axi_root, nic_axi_root
  (CLK_IS_CRITICAL)
- drivers/clk/npcm/clk-npcm7xx.c: axi (CLK_IS_CRITICAL)
- drivers/clk/mediatek/: Multiple AXI/bus clocks (CLK_IS_CRITICAL)
```

This confirms the approach is not unusual and follows established best
practices.

### 5. Risk Assessment

**Risk of Backporting: VERY LOW**

**Positive factors:**
- ✅ Changes are purely flag modifications, no logic changes
- ✅ Only affects TH1520 SoC (narrow hardware scope)
- ✅ Change is conservative (prevents gating vs enabling new features)
- ✅ Hardware defaults already have these clocks ungated
- ✅ No dependencies on other commits
- ✅ No follow-up fixes or reverts found
- ✅ Follows kernel best practices
- ✅ Small, contained change (44 lines, single file)

**Potential side effects:**
- ⚠️ Slightly higher power consumption (clocks stay enabled)
  - **Mitigated**: Hardware already leaves these ungated by default
  - **Acceptable**: Stability > minor power savings for critical
    infrastructure

**Risk of NOT Backporting: HIGH**

Users on stable kernels (v6.11+) will experience:
- System hangs and freezes
- Boot failures
- Unresponsive peripherals
- Unreliable systems

### 6. Backport Criteria Compliance

| Criterion | Status | Details |
|-----------|--------|---------|
| **Fixes important bug** | ✅ YES | Fixes critical system hangs |
| **Affects users** | ✅ YES | All TH1520 hardware users affected |
| **Small and contained** | ✅ YES | 44 lines, single file, mechanical
changes |
| **No new features** | ✅ YES | Only prevents clock gating |
| **No architectural changes** | ✅ YES | Simple flag changes |
| **Minimal regression risk** | ✅ YES | Conservative change, hardware
limitation |
| **Confined to subsystem** | ✅ YES | Only affects TH1520 clock driver |
| **Clear side effects** | ✅ YES | Slightly higher power (acceptable
tradeoff) |

### 7. Target Stable Kernels

**Recommended backport targets:**
- v6.11+ stable trees (where TH1520 driver was introduced)
- Current LTS kernels that include TH1520 support

**Dependencies:** None - this is a standalone fix

### 8. Supporting Evidence

**Real Hardware Impact**: This affects actual production hardware:
- LicheePi 4A (RISC-V development board)
- BeagleV Ahead (RISC-V development board)
- Other TH1520-based systems

**Documentation**: Commit message clearly explains the rationale and
hardware limitation.

**Community Review**:
- Reviewed-by: Drew Fustini (TH1520 maintainer)
- Signed-off-by: Drew Fustini (subsystem maintainer)

---

## Conclusion

This commit is an **excellent candidate for backporting** to stable
kernel trees. It fixes a critical reliability issue (system hangs)
caused by a documented hardware limitation, uses a conservative and
well-established approach, has minimal regression risk, and is essential
for users of TH1520-based hardware. The change follows stable kernel
rules precisely: important bugfix, small and contained, no architectural
changes, minimal risk.

**Recommendation: BACKPORT to v6.11+ stable kernels**

 drivers/clk/thead/clk-th1520-ap.c | 44 +++++++++++++++----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index ec52726fbea95..6c1976aa1ae62 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -480,7 +480,7 @@ static struct ccu_div axi4_cpusys2_aclk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("axi4-cpusys2-aclk",
 					      gmac_pll_clk_parent,
 					      &ccu_div_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -502,7 +502,7 @@ static struct ccu_div axi_aclk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("axi-aclk",
 						      axi_parents,
 						      &ccu_div_ops,
-						      0),
+						      CLK_IS_CRITICAL),
 	},
 };
 
@@ -651,7 +651,7 @@ static struct ccu_div apb_pclk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA("apb-pclk",
 						      apb_parents,
 						      &ccu_div_ops,
-						      CLK_IGNORE_UNUSED),
+						      CLK_IS_CRITICAL),
 	},
 };
 
@@ -682,7 +682,7 @@ static struct ccu_div vi_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("vi",
 					      video_pll_clk_parent,
 					      &ccu_div_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -707,7 +707,7 @@ static struct ccu_div vo_axi_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("vo-axi",
 					      video_pll_clk_parent,
 					      &ccu_div_ops,
-					      0),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -732,7 +732,7 @@ static struct ccu_div vp_axi_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS_HW("vp-axi",
 					      video_pll_clk_parent,
 					      &ccu_div_ops,
-					      CLK_IGNORE_UNUSED),
+					      CLK_IS_CRITICAL),
 	},
 };
 
@@ -791,27 +791,27 @@ static const struct clk_parent_data emmc_sdio_ref_clk_pd[] = {
 static CCU_GATE(CLK_BROM, brom_clk, "brom", ahb2_cpusys_hclk_pd, 0x100, 4, 0);
 static CCU_GATE(CLK_BMU, bmu_clk, "bmu", axi4_cpusys2_aclk_pd, 0x100, 5, 0);
 static CCU_GATE(CLK_AON2CPU_A2X, aon2cpu_a2x_clk, "aon2cpu-a2x", axi4_cpusys2_aclk_pd,
-		0x134, 8, 0);
+		0x134, 8, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_X2X_CPUSYS, x2x_cpusys_clk, "x2x-cpusys", axi4_cpusys2_aclk_pd,
-		0x134, 7, 0);
+		0x134, 7, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_CPU2AON_X2H, cpu2aon_x2h_clk, "cpu2aon-x2h", axi_aclk_pd,
-		0x138, 8, CLK_IGNORE_UNUSED);
+		0x138, 8, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_CPU2PERI_X2H, cpu2peri_x2h_clk, "cpu2peri-x2h", axi4_cpusys2_aclk_pd,
-		0x140, 9, CLK_IGNORE_UNUSED);
+		0x140, 9, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_PERISYS_APB1_HCLK, perisys_apb1_hclk, "perisys-apb1-hclk", perisys_ahb_hclk_pd,
-		0x150, 9, CLK_IGNORE_UNUSED);
+		0x150, 9, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_PERISYS_APB2_HCLK, perisys_apb2_hclk, "perisys-apb2-hclk", perisys_ahb_hclk_pd,
-		0x150, 10, CLK_IGNORE_UNUSED);
+		0x150, 10, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_PERISYS_APB3_HCLK, perisys_apb3_hclk, "perisys-apb3-hclk", perisys_ahb_hclk_pd,
-		0x150, 11, CLK_IGNORE_UNUSED);
+		0x150, 11, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_PERISYS_APB4_HCLK, perisys_apb4_hclk, "perisys-apb4-hclk", perisys_ahb_hclk_pd,
 		0x150, 12, 0);
 static const struct clk_parent_data perisys_apb4_hclk_pd[] = {
 	{ .hw = &perisys_apb4_hclk.gate.hw },
 };
 
-static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, 5, 0);
-static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, 13, 0);
+static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, 5, CLK_IS_CRITICAL);
+static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, 13, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_EMMC_SDIO, emmc_sdio_clk, "emmc-sdio", emmc_sdio_ref_clk_pd, 0x204, 30, 0);
 static CCU_GATE(CLK_GMAC1, gmac1_clk, "gmac1", gmac_pll_clk_pd, 0x204, 26, 0);
 static CCU_GATE(CLK_PADCTRL1, padctrl1_clk, "padctrl1", perisys_apb_pclk_pd, 0x204, 24, 0);
@@ -855,11 +855,11 @@ static CCU_GATE(CLK_SRAM2, sram2_clk, "sram2", axi_aclk_pd, 0x20c, 2, 0);
 static CCU_GATE(CLK_SRAM3, sram3_clk, "sram3", axi_aclk_pd, 0x20c, 1, 0);
 
 static CCU_GATE(CLK_AXI4_VO_ACLK, axi4_vo_aclk, "axi4-vo-aclk",
-		video_pll_clk_pd, 0x0, 0, 0);
+		video_pll_clk_pd, 0x0, 0, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
 		0x0, 3, 0);
 static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
-		video_pll_clk_pd, 0x0, 4, 0);
+		video_pll_clk_pd, 0x0, 4, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
 		dpu0_clk_pd, 0x0, 5, 0);
 static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
@@ -891,9 +891,9 @@ static CCU_GATE(CLK_MIPI_DSI1_REFCLK, mipi_dsi1_refclk, "mipi-dsi1-refclk",
 static CCU_GATE(CLK_HDMI_I2S, hdmi_i2s_clk, "hdmi-i2s-clk", video_pll_clk_pd,
 		0x0, 19, 0);
 static CCU_GATE(CLK_X2H_DPU1_ACLK, x2h_dpu1_aclk, "x2h-dpu1-aclk",
-		video_pll_clk_pd, 0x0, 20, 0);
+		video_pll_clk_pd, 0x0, 20, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_X2H_DPU_ACLK, x2h_dpu_aclk, "x2h-dpu-aclk",
-		video_pll_clk_pd, 0x0, 21, 0);
+		video_pll_clk_pd, 0x0, 21, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_AXI4_VO_PCLK, axi4_vo_pclk, "axi4-vo-pclk",
 		video_pll_clk_pd, 0x0, 22, 0);
 static CCU_GATE(CLK_IOPMP_VOSYS_DPU_PCLK, iopmp_vosys_dpu_pclk,
@@ -903,11 +903,11 @@ static CCU_GATE(CLK_IOPMP_VOSYS_DPU1_PCLK, iopmp_vosys_dpu1_pclk,
 static CCU_GATE(CLK_IOPMP_VOSYS_GPU_PCLK, iopmp_vosys_gpu_pclk,
 		"iopmp-vosys-gpu-pclk", video_pll_clk_pd, 0x0, 25, 0);
 static CCU_GATE(CLK_IOPMP_DPU1_ACLK, iopmp_dpu1_aclk, "iopmp-dpu1-aclk",
-		video_pll_clk_pd, 0x0, 27, 0);
+		video_pll_clk_pd, 0x0, 27, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_IOPMP_DPU_ACLK, iopmp_dpu_aclk, "iopmp-dpu-aclk",
-		video_pll_clk_pd, 0x0, 28, 0);
+		video_pll_clk_pd, 0x0, 28, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_IOPMP_GPU_ACLK, iopmp_gpu_aclk, "iopmp-gpu-aclk",
-		video_pll_clk_pd, 0x0, 29, 0);
+		video_pll_clk_pd, 0x0, 29, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_MIPIDSI0_PIXCLK, mipi_dsi0_pixclk, "mipi-dsi0-pixclk",
 		video_pll_clk_pd, 0x0, 30, 0);
 static CCU_GATE(CLK_MIPIDSI1_PIXCLK, mipi_dsi1_pixclk, "mipi-dsi1-pixclk",
-- 
2.51.0


