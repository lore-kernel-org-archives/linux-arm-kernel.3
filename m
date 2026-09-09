Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33203C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 19:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rN/co/MiO63+I4OwBOH7CBrIhRmyKBo1K8jSxxz7cd0=; b=apXfFttbgxdXa6zEft7f0mtBvJ
	pKYGBcdeQuTsL/bF6WHBwl9njeWTfERGEi3pP2saj8zI+2SXURy+poBwpuImBE8s3huAmK+J8+9kW
	ylev6O8D6H3ZADRkHfoWhLMSgcF3iAAwILEWAbQOnMiG32LgCqsmTGplAwOMG7rKo4dF8ZYw4ELnp
	U/0oRigRvSFmH/tOX60SSLEHesaBuvbez1OTwb9uoWxnkTFiKHQDt4Ap5X+rr6XtnMyBbvt/Ub+MP
	RSD/hUrURYnZZxBQCOEynFaCrnoJa631m0Vfwdj/KTS2/DkhgLxgGblxY/la1Kd0fbN0fTvI8EBT6
	Wh6EfLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O6w-0000000CjB4-0kvO;
	Wed, 09 Sep 2026 19:37:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O6u-0000000Cj9s-2NKA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 19:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rN/co/MiO63+I4OwBOH7CBrIhRmyKBo1K8jSxxz7cd0=; b=XG4CbCM6O8Fx1fMTMW+JxLDoxo
	PMY4Vo+2gD+E/AyZrXSNNe79Bcze7fJOtlAd+xAttoihJ+kxOEBxDjRBYkMfY1iKp81cziP0qsLDU
	j4mJ8jcPImQLxs2yMW7OCNPNJhKLRb/OvtWNrrh+gxhmUz/QW0pjTePMd2Sww9B1uFeijEirNzKA+
	M9p2UXiIq4Hxy4TgVAz8+aFlGhIUFcslUHnxfHozHEjGFFGga7hGNpDfh66yZXpJyHalDSq3zLFFs
	thbzj+r3WJxHpF/DTPzPTwGhyMfIcjO7BfQeMHtL9V9AFgMJceqYEIyM82EY66sH+XZqI0Nofgqzs
	V82Q9E8Q==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4O6r-00000001bhy-011F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 19:37:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so48858265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 12:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982647; x=1789587447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rN/co/MiO63+I4OwBOH7CBrIhRmyKBo1K8jSxxz7cd0=;
        b=DNuQo06SJO/SvWY298YeFlQ0SGZ5nlnLwUJPsMvVqucTKn+eWZdfR1b1adWV6ZSFs1
         Y0CotOK+M+W71sxPc/FgyOIp3UbDftnJ5W0qiJNKzwvTrJxY5ksi0g+CgkFa+jS+q3pg
         7NDybgBKrCzv2rtRRjFJvD56fNIbbjvO09FlPXmKVg749edlBpIi6grTBs0yvU8gRVtI
         p1EarX08IYuRgbR6jrBnXMoxKwGiN0ohoBitWX5D4mPECWIW4JQ92hLgkhv6BpkmWoJ5
         U3bmH0rnbOhRirCwJYyAq1SxJH+ZgxLT7N/VnbNjss8TDcw3Ng+Bv6Stic5z+XJYV9K6
         ExLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982647; x=1789587447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rN/co/MiO63+I4OwBOH7CBrIhRmyKBo1K8jSxxz7cd0=;
        b=FdMhAk3vbgxPvPg17ltkVg/iSeToVO7COifsy41tBmyUNOl6sm819D4t6tztRGLBSM
         IeBzsNov153s5fjFbi8RFMr92zA3pRhrexcSssrQxyb3NJ34xRRRIlN8hRtw33FxGNug
         OyfejS7XkM0MoNErdNB60VOYfog5ZHfYuZerqsAA1euT0tPWp4/ESIZ2VEsf0oJg33BI
         TJhpLVmfkzy7ke9WPKe1s0g3AEKQxSj3XWNGj4+p4ML3zcoIGEYcAEx9VmQQcGYGQQOW
         qG+Nx/yFZl4y4k6SIu116y91Q7K/G10POfqJiujlaGWnBek1CJgAV7mweC8Cr7jLII5L
         U6cg==
X-Forwarded-Encrypted: i=1; AKwUvBzE5gJx7Fk7vcXyqo606X7WkkXz2/PGooF/ofT6y+o/DewVX6ePxmhCnu/MNsKwiL6xyAUw5TmDXJG5QQHAfkPv@lists.infradead.org
X-Gm-Message-State: AFuF++mAXYAT3QdxzZFnzBRuiv26orjTX7loWGDikxPgz19h2bTl+8LC
	4h5NbRKZgDRbHN7doEBIL/cBXJHQAB9UxjfX/tRHcOgPcHFm9vtH3iJ8
X-Gm-Gg: AYBFou2XhE+agAczCHCp3p/OS5OkUSlhoG6o74jV7lu8Yx2dcPn1nkq0JXWzUO6KGrN
	5rw+NmgA/H7l0ZND9roVApVg1WGfBlSA+kqdCm7JR9oqzkdF00bhDkf0i7iaEWDVl0mFRQSIeWc
	uwqlWsGlYFKeqPM+5Ysuk5r85B4gKnLaasDZ2chJeTsdrRlNsajd0AY5pZaceFHyvmlnr5BzKSE
	UQaLJ7pIMWjbpv8Nvj1Y0DS4LWBg/9gomBO6eKNPGFvFeRwly4WdnBN56y9df05/Gsi3JhcYoTv
	xXqBq4BpT9MSGwPR5hqROgjJ8aRGPtDOKkIcQeA4n1Vnt1spAW7ZZKzdQI3GwRW70nnUg6X6eG3
	RdX1PgU7gFgx9/EOzZq0zOruGpvmQkUVzuU2crTX53wck4uJN5zKWlZ2vdX2dljCvjLtvKq2PU/
	VYMCRzXrnapeSoZL7BbdvsS9U4jTQa/cbUhgmLwuG5E2ZePswjncXOlRA7jF561JVDRXa4MZq3j
	5aqIw9LoJ3+/EMkt0oE00mxFSuUil0gdeSKjjZohyQRj2IEl/M0yrdGfojLr1ZNT9NGWzdOKmFW
	O+l4A7Rwew==
X-Received: by 2002:a05:600c:474a:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49cf823f60amr335765905e9.11.1788982646565;
        Wed, 09 Sep 2026 12:37:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:d357:e592:d56c:d3b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm13123995e9.6.2026.09.09.12.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 1/3] soc: renesas: rz-sysc: Configure AOF registers from dma-ranges
Date: Wed,  9 Sep 2026 20:36:37 +0100
Message-ID: <20260909193640.8069-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_203729_160570_4B2088F0 
X-CRM114-Status: GOOD (  30.54  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Some RZ SoCs contain bus masters that can only generate 32-bit addresses
but need to access memory located above the 4 GiB boundary. The System
Controller (SYSC) provides Address Offset Function (AOF) registers that
translate the upper address bits on a per-master basis to extend the
accessible physical address range.

Each such master only ever places bits [29:0] of its own address
directly onto the interconnect. Bits [31:30] of that same 32-bit
address are not used as address bits at all -- instead they select
one of four 6-bit fields (Reg0-Reg3) in the master's SYS_AOFn
register. The selected field supplies the corresponding bits [34:30]
or [35:30] of the actual bus transaction, effectively splitting the
master's native 4 GiB address space into four independently
relocatable 1 GiB windows and letting each be redirected anywhere in
a 35-bit (masters limited to DDR0/DDR1 access) or 36-bit (masters
that can also reach PCIe0/PCIe1) physical address space.

Add generic infrastructure to configure the AOF registers from the
firmware-provided dma-ranges property instead of relying on hardcoded
register programming. Each supported bus master is described by its MMIO
base address, corresponding SYS_AOF register index, and address width.
At probe time, the driver matches the bus master against this
description -- via the addressable child node of a devicetree
"simple-bus" wrapper carrying dma-ranges -- and programs the appropriate
AOF register by decomposing each dma-ranges entry into the 1 GiB-aligned
segments it maps to, translating the child (device-side) address into
the field it selects and the parent (physical) address into the value
written to that field.

Validate the dma-ranges entries before programming the hardware by
checking 1 GiB alignment on both the child and parent addresses,
ensuring the described child range does not exceed the master's own
4 GiB address space (i.e. does not require more than the four available
1 GiB translation windows), and verifying that the requested physical
target is representable within the bus master's address width.

Populate the AOF description table for the RZ/V2H SDHI controllers,
which use SYS_AOF16-18.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/r9a09g057-sys.c |   9 +++
 drivers/soc/renesas/rz-sysc.c       | 118 ++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.h       |  22 ++++++
 3 files changed, 149 insertions(+)

diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index 308492c31acb..960fcba668b3 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -82,6 +82,12 @@ static void rzv2h_sys_print_id(struct device *dev,
 		dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n");
 }
 
+static const struct rz_aof_unit rzv2h_aof_units[] = {
+	{ .base = 0x15c00000, .index = 16, .addr_bits = 35 }, /* SDHI0 -> SYS_AOF16 */
+	{ .base = 0x15c10000, .index = 17, .addr_bits = 35 }, /* SDHI1 -> SYS_AOF17 */
+	{ .base = 0x15c20000, .index = 18, .addr_bits = 35 }, /* SDHI2 -> SYS_AOF18 */
+};
+
 static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initconst = {
 	.family = "RZ/V2H",
 	.id = 0x847a447,
@@ -89,6 +95,9 @@ static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initco
 	.revision_mask = GENMASK(31, 28),
 	.specific_id_mask = GENMASK(27, 0),
 	.print_id = rzv2h_sys_print_id,
+	.aof_units = rzv2h_aof_units,
+	.num_aof_units = ARRAY_SIZE(rzv2h_aof_units),
+	.aof_base = 0x0500,
 };
 
 static bool rzv2h_regmap_readable_writeable_reg(unsigned int reg)
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index 0e92c415d4be..2dae4a0de99b 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -28,6 +29,121 @@ struct rz_sysc {
 	struct device *dev;
 };
 
+static const struct rz_aof_unit *
+rz_aof_lookup(const struct rz_sysc_soc_id_init_data *soc_data, u32 base)
+{
+	unsigned int i;
+
+	for (i = 0; i < soc_data->num_aof_units; i++)
+		if (soc_data->aof_units[i].base == base)
+			return &soc_data->aof_units[i];
+
+	return NULL;
+}
+
+static int rz_aof_parse_bus(struct rz_sysc *sysc,
+			    const struct rz_sysc_soc_id_init_data *soc_data,
+			    struct device_node *bus_np)
+{
+	const struct rz_aof_unit *unit;
+	struct device_node *child;
+	struct resource res;
+	const __be32 *ranges;
+	int naddr, nsize, cell_sz, len, nentries, i;
+	u32 reg_val = 0;
+
+	child = NULL;
+	for_each_child_of_node(bus_np, child) {
+		if (of_address_to_resource(child, 0, &res) == 0)
+			break;
+	}
+	if (!child) {
+		dev_warn(sysc->dev, "%pOF: no addressable child found\n", bus_np);
+		return -EINVAL;
+	}
+
+	if (!of_device_is_available(child)) {
+		dev_dbg(sysc->dev, "%pOF: %pOF is disabled, skipping AOF setup\n",
+			bus_np, child);
+		of_node_put(child);
+		return 0;
+	}
+
+	unit = rz_aof_lookup(soc_data, (u32)res.start);
+	of_node_put(child);
+	if (!unit) {
+		dev_warn(sysc->dev, "%pOF: no AOF unit for base %pa\n", bus_np, &res.start);
+		return -ENODEV;
+	}
+
+	naddr = of_n_addr_cells(bus_np);
+	nsize = of_n_size_cells(bus_np);
+	cell_sz = (naddr * 2 + nsize) * sizeof(u32);
+
+	ranges = of_get_property(bus_np, "dma-ranges", &len);
+	if (!ranges || !cell_sz || len % cell_sz) {
+		dev_err(sysc->dev, "%pOF: malformed dma-ranges\n", bus_np);
+		return -EINVAL;
+	}
+	nentries = len / cell_sz;
+
+	for (i = 0; i < nentries; i++) {
+		const __be32 *p = ranges + i * (naddr * 2 + nsize);
+		u64 child_addr = of_read_number(p, naddr);
+		u64 parent_addr = of_read_number(p + naddr, naddr);
+		u64 size = of_read_number(p + 2 * naddr, nsize);
+		unsigned int nseg = DIV_ROUND_UP_ULL(size, SZ_1G);
+		unsigned int sel0 = (child_addr >> 30) & 0x3;
+		u64 tgt0 = parent_addr >> 30;
+		unsigned int s;
+
+		if (child_addr & (SZ_1G - 1) || parent_addr & (SZ_1G - 1)) {
+			dev_err(sysc->dev, "%pOF: entry %d not 1GiB aligned\n", bus_np, i);
+			return -EINVAL;
+		}
+
+		for (s = 0; s < nseg; s++) {
+			unsigned int sel = sel0 + s;
+			u64 tgt = tgt0 + s;
+
+			if (sel > 3) {
+				dev_err(sysc->dev, "%pOF: entry %d overflows the 4 fields\n",
+					bus_np, i);
+				return -EINVAL;
+			}
+			if (unit->addr_bits == 35 && (tgt & BIT(5))) {
+				dev_err(sysc->dev,
+					"%pOF: target 0x%llx needs bit[5], unit is 35-bit only\n",
+					bus_np, tgt << 30);
+				return -EINVAL;
+			}
+			reg_val &= ~(0x3fu << (sel * 8));
+			reg_val |= (tgt & 0x3f) << (sel * 8);
+		}
+	}
+
+	writel(reg_val, sysc->base + SYS_AOF_OFFSET(soc_data->aof_base, unit->index));
+
+	return 0;
+}
+
+static void rz_sysc_setup_aof(struct rz_sysc *sysc,
+			      const struct rz_sysc_soc_id_init_data *soc_data)
+{
+	struct device_node *np;
+
+	if (!soc_data->aof_units || !soc_data->num_aof_units)
+		return;
+
+	for_each_node_with_property(np, "dma-ranges") {
+		if (!of_device_is_compatible(np, "simple-bus"))
+			continue;
+
+		if (rz_aof_parse_bus(sysc, soc_data, np))
+			dev_warn(sysc->dev, "AOF setup failed for %pOF\n", np);
+	}
+}
+
 static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *match)
 {
 	const struct rz_sysc_init_data *sysc_data = match->data;
@@ -137,6 +253,8 @@ static int rz_sysc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	rz_sysc_setup_aof(sysc, data->soc_id_init_data);
+
 	regmap_cfg->name = "rz_sysc_regs";
 	regmap_cfg->reg_bits = 32;
 	regmap_cfg->reg_stride = 4;
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index e55f3258d703..481d5d5a0577 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -12,6 +12,18 @@
 #include <linux/sys_soc.h>
 #include <linux/types.h>
 
+/**
+ * struct rz_aof_unit - RZ AOF unit description
+ * @base: MMIO base of the master IP (low 32 bits; all < 4G)
+ * @index: index of SYS_AOFn (0-based)
+ * @addr_bits: address width of the master IP (35 or 36 bits)
+ */
+struct rz_aof_unit {
+	u32 base;
+	u8 index;
+	u8 addr_bits;
+};
+
 /**
  * struct rz_syc_soc_id_init_data - RZ SYSC SoC identification initialization data
  * @family: RZ SoC family
@@ -21,6 +33,10 @@
  * @specific_id_mask: SYSC SoC ID specific ID mask
  * @print_id: print SoC-specific extended device identification
  * @pwrrdy_pwrseq: has pwrrdy register controlled through power sequencer
+ * @aof_units: array of AOF units for this SoC, or NULL if it has none
+ * @num_aof_units: number of entries in @aof_units
+ * @aof_base: offset of SYS_AOF0 from the SYSC base; ignored if @aof_units is NULL
+ *            (this offset is SoC-specific, unlike the fixed inter-register stride)
  */
 struct rz_sysc_soc_id_init_data {
 	const char * const family;
@@ -31,8 +47,14 @@ struct rz_sysc_soc_id_init_data {
 	void (*print_id)(struct device *dev, void __iomem *sysc_base,
 			 struct soc_device_attribute *soc_dev_attr);
 	bool pwrrdy_pwrseq;
+	const struct rz_aof_unit *aof_units;
+	unsigned int num_aof_units;
+	u32 aof_base;
 };
 
+#define SYS_AOF_STRIDE			0x0004
+#define SYS_AOF_OFFSET(aof_base, n)	((aof_base) + ((n) * SYS_AOF_STRIDE))
+
 /**
  * struct rz_sysc_init_data - RZ SYSC initialization data
  * @soc_id_init_data: RZ SYSC SoC ID initialization data
-- 
2.55.0


