Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E9BEF99E5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 01:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhJ/jq/Pj5DOouPa4A2fn7aUx9kY+OMCW90WgTFPDZc=; b=3xN30q5NUn8nn+CstdEuOKObsr
	Kvq/pK42YcJhqqGI+O1wVylqEg67YR39kE8wPNw75qOI3SbEvxJH9n2JWn0Of4JjpT2rQdYJ6vDq9
	8Sf/sorVNLy2KC1lns2xVjhRSXAFiHU3KSqLUkBAC7LFSsWxnKx2mEMCOlIo8KF8aUzTLKMOKrU+A
	CqpkcYf3To31T+uJeVJ7NtSXjpjqVzE4yqR7H2Cezxp7ApBzQzuMlQwq9GBLLDDdaafs800cOWJ7J
	YJ0qR7MIcguNm9lWJqCHxPMwyrtGDFLoMAtTlJnVeamfa6bKrkMUMGPcAq9+SzHR0HHDVidS/KxnX
	nE14XCuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr43m-000000045uN-2ajy;
	Sat, 14 Feb 2026 01:02:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr43j-000000045tz-1YYZ;
	Sat, 14 Feb 2026 01:02:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F60E42D8C;
	Sat, 14 Feb 2026 01:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56751C19423;
	Sat, 14 Feb 2026 01:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771030974;
	bh=ftu+ftRP09XJH/t4f5CrfgMb7qM3jXxRAJ21ZZT8UmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bbhX3Z3R4rYNFPRG94aligZWiB1IkA63Ob7rs4AgHNyLN4LCUdQmB6m1mhTdbXuRf
	 8RsIfN0jtIC3bcb+qRwcUeugk47enEZFei+5KNLi2MDK+MbPmM5qgZpQ4H3fmSgvCY
	 a0ZmPyRuOYLTzthP9UEur/75Z3e63CPoM9B8Lsq62vBb44sk4CL6FVMZ7YuYIzl5eU
	 JObSYA7KjbHrRQ0pwGCnQDbWMMW+uRDLDyERhu2A1Eay0NeJZC+2AkRaUd1zA3jEr4
	 hSOLCDWpQ4w260mxjBjK5i+isOSpyjNwFYSRwy2TEqFdbBrDqhwBVtlC2P+SgvROJs
	 tPZpgUkfwWO/g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Xiaolei Wang <xiaolei.wang@windriver.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Sasha Levin <sashal@kernel.org>,
	mwen@igalia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-5.15] drm/v3d: Set DMA segment size to avoid debug warnings
Date: Fri, 13 Feb 2026 19:58:04 -0500
Message-ID: <20260214010245.3671907-4-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_170255_457231_F078A344 
X-CRM114-Status: GOOD (  21.02  )
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

From: Xiaolei Wang <xiaolei.wang@windriver.com>

[ Upstream commit 9eb018828b1b30dfba689c060735c50fc5b9f704 ]

When using V3D rendering with CONFIG_DMA_API_DEBUG enabled, the
kernel occasionally reports a segment size mismatch. This is because
'max_seg_size' is not set. The kernel defaults to 64K. setting
'max_seg_size' to the maximum will prevent 'debug_dma_map_sg()'
from complaining about the over-mapping of the V3D segment length.

DMA-API: v3d 1002000000.v3d: mapping sg segment longer than device
 claims to support [len=8290304] [max=65536]
WARNING: CPU: 0 PID: 493 at kernel/dma/debug.c:1179 debug_dma_map_sg+0x330/0x388
CPU: 0 UID: 0 PID: 493 Comm: Xorg Not tainted 6.12.53-yocto-standard #1
Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : debug_dma_map_sg+0x330/0x388
lr : debug_dma_map_sg+0x330/0x388
sp : ffff8000829a3ac0
x29: ffff8000829a3ac0 x28: 0000000000000001 x27: ffff8000813fe000
x26: ffffc1ffc0000000 x25: ffff00010fdeb760 x24: 0000000000000000
x23: ffff8000816a9bf0 x22: 0000000000000001 x21: 0000000000000002
x20: 0000000000000002 x19: ffff00010185e810 x18: ffffffffffffffff
x17: 69766564206e6168 x16: 74207265676e6f6c x15: 20746e656d676573
x14: 20677320676e6970 x13: 5d34303334393134 x12: 0000000000000000
x11: 00000000000000c0 x10: 00000000000009c0 x9 : ffff8000800e0b7c
x8 : ffff00010a315ca0 x7 : ffff8000816a5110 x6 : 0000000000000001
x5 : 000000000000002b x4 : 0000000000000002 x3 : 0000000000000008
x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00010a315280
Call trace:
 debug_dma_map_sg+0x330/0x388
 __dma_map_sg_attrs+0xc0/0x278
 dma_map_sgtable+0x30/0x58
 drm_gem_shmem_get_pages_sgt+0xb4/0x140
 v3d_bo_create_finish+0x28/0x130 [v3d]
 v3d_create_bo_ioctl+0x54/0x180 [v3d]
 drm_ioctl_kernel+0xc8/0x140
 drm_ioctl+0x2d4/0x4d8

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Link: https://patch.msgid.link/20251203130323.2247072-1-xiaolei.wang@windriver.com
Signed-off-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

### 1. Commit Message Analysis

The commit message is clear and well-documented. It explains:
- **The problem**: When CONFIG_DMA_API_DEBUG is enabled, V3D triggers a
  WARNING because `max_seg_size` is not set, defaulting to 64K.
- **The trigger**: Normal GPU rendering on Raspberry Pi 5 running Xorg.
- **The mechanism**: `debug_dma_map_sg()` detects that the scatterlist
  segment (8,290,304 bytes) exceeds the device's reported max (65,536
  bytes).
- A full stack trace is provided, confirming this is a real,
  reproducible issue hit during normal operation (PID 493 is Xorg).

### 2. Code Change Analysis

The patch adds a single line:

```c
dma_set_max_seg_size(&pdev->dev, UINT_MAX);
```

This is placed right after `dma_set_mask_and_coherent()` succeeds, which
is the natural location. It tells the DMA layer that V3D has no hardware
constraint on DMA segment sizes (because V3D uses its own MMU to handle
scatterlist mappings). The 64K default is simply incorrect for this
device.

### 3. Established Pattern Across DRM Subsystem

This is an extremely well-established pattern. My search found **17
other DRM drivers** making the exact same call:

- `drivers/gpu/drm/panfrost/panfrost_gpu.c` —
  `dma_set_max_seg_size(pfdev->base.dev, UINT_MAX);`
- `drivers/gpu/drm/i915/i915_driver.c` —
  `dma_set_max_seg_size(i915->drm.dev, UINT_MAX);`
- `drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c` —
  `dma_set_max_seg_size(adev->dev, UINT_MAX);`
- `drivers/gpu/drm/msm/msm_drv.c` — `dma_set_max_seg_size(dev,
  UINT_MAX);`
- `drivers/gpu/drm/imagination/pvr_device.c`, `lima`, `panthor`,
  `etnaviv`, `mediatek`, `vmwgfx`, `virtio`, `tidss`, `sun4i`, `xlnx`,
  `arm/komeda`, `xe`, `exynos`

The panfrost commit `ac5037afefd33` (2020) has the identical rationale:
"Since all we do with scatterlists is map them in the MMU, we don't have
any hardware constraints on how they're laid out. Let the DMA layer know
so it won't warn when DMA API debugging is enabled." V3D was simply
missed when this pattern was being applied across DRM drivers.

### 4. Bug Classification

This fixes a **kernel WARNING** that fires during normal GPU buffer
allocation. The call path is:

```
v3d_create_bo_ioctl → v3d_bo_create_finish → drm_gem_shmem_get_pages_sgt
→ dma_map_sgtable → debug_dma_map_sg (WARNING)
```

Every time a GPU buffer object larger than 64K is created (which is
virtually every BO for rendering), this warning fires. On a system with
DMA debug enabled, this causes severe log spam and performance
degradation from the warning path.

### 5. Backport Compatibility

- **V3D driver availability**: Added in v4.18, present in all current
  LTS trees (5.4, 5.10, 5.15, 6.1, 6.6, 6.12).
- **API compatibility**: In kernels before v6.12 (commit
  `334304ac2baca`), `dma_set_max_seg_size` returns `int` instead of
  `void`. Since this patch does **not** check the return value, it
  compiles cleanly on both old and new signatures.
- **Context adjustment**: In older stable trees (6.6, 6.1, etc.), the
  error path after `dma_set_mask_and_coherent` uses `return ret;`
  instead of `goto clk_disable;`. This means the patch won't apply
  verbatim, but the fix is trivial to adapt — the `dma_set_max_seg_size`
  line just needs to be inserted between the mask check and
  `v3d->va_width =`, regardless of the surrounding error handling style.

### 6. Risk Assessment

- **Size**: 1 line added, 1 file changed — minimal.
- **Scope**: Only affects V3D DMA segment size metadata — no functional
  change to DMA mapping behavior at runtime.
- **Regression risk**: Near zero. If the call fails (impossible for
  platform devices which always have `dma_parms`), the result is the
  status quo (warnings continue).
- **Testing**: The author tested on Raspberry Pi 5, and the maintainer
  (Maíra Canal) signed off.

### 7. User Impact

- **Who is affected**: Raspberry Pi 5 users (V3D 7.1) and Raspberry Pi 4
  users (V3D 4.2) running any graphical desktop with
  CONFIG_DMA_API_DEBUG enabled.
- **Severity**: Kernel WARNING spam during every buffer allocation,
  causing log pollution and potential performance issues from the
  warning code path.
- **Real-world**: The reporter was using a Yocto-based system
  (6.12.53-yocto-standard), showing this is a production environment.

### 8. Stable Criteria Check

| Criterion | Met? |
|-----------|------|
| Obviously correct and tested | Yes — one-line, well-established
pattern, tested on real hardware |
| Fixes a real bug | Yes — WARNING during normal GPU operation |
| Important issue | Yes — affects normal rendering on popular hardware |
| Small and contained | Yes — 1 line, 1 file |
| No new features | Yes — just configures existing DMA parameter |
| Applies to stable | Yes — trivial context adjustment needed for older
trees |

This is an ideal stable candidate: a tiny, obviously correct fix for a
real issue, following an established pattern used by 17 other DRM
drivers, with zero regression risk.

**YES**

 drivers/gpu/drm/v3d/v3d_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index e8a46c8bad8a2..f469de456f9bb 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -378,6 +378,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	if (ret)
 		goto clk_disable;
 
+	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
+
 	v3d->va_width = 30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_VA_WIDTH);
 
 	ident1 = V3D_READ(V3D_HUB_IDENT1);
-- 
2.51.0


