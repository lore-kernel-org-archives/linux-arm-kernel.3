Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18CEC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZntm8VORvDjKObm+3e5kg7isnusBSNzR7FkdFCW7YM=; b=1iFbKqjsevX11jhBtX7np5NA40
	oyoIq2hAj0sbM+V0WAMS1HAfjzzH2AaToZTu3uirUWhoe38ODcK9E+tCYOa3O0xoL518hcefdghjK
	6uodRwhI3vDBRoSfP4Na1nMgmWEBjSphoD1T30kyEycY8fOkKdrMq8Mue+72LRXEAO87ZvvIlRCag
	u/c5kn3uWLI8NbdFNSWpSwemSLWT779aomZK5t/x1edxrCgHOtpfU+ctmX8Ax/4i34HPb08nCBuw/
	mvMkuiZlutS1DvFvrE6MC+d0J0q9n/tjcdaWumseROfgSFLRq0Ddm3Fl9GzGDEwjkQxV3rWyvvWQV
	7nE9m7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfl-00000008S7j-1EpH;
	Fri, 07 Aug 2026 16:43:53 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNff-00000008S1h-1b8f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:43:49 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49561facb1dso21895485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786121025; x=1786725825; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iZntm8VORvDjKObm+3e5kg7isnusBSNzR7FkdFCW7YM=;
        b=PNd2rimVnySaL+wVRn9zu3JxNW/qy9fy2m/UyRmJCVuKb2bfm+ZKkpNOD6sWu54oNY
         gOphOQzKluAEcWQr9lYUiZHqa2sXYGMRVQ+tHi16ug8J5hIe7ymMeRgE9AWGLbjo5z1K
         /Gsd652ny71PYUx4GrFYCsuYJezMqyFVc3yV+XXAAuDK2WxVn0lvg+JPWUBZZ+cWPkW+
         hwS102dT5I3cfSz3MFZgu4MdkHVSahVfKZgMeeNdo5MRaNe6pG5S3/Cyh9sEIaLkpNxF
         n8Nz+AghNNQHHhb0U/204/WfJ5RGoaLKU1PYbPyOw58CWWoiuS9tNeAIe2V4FK0VniIz
         /euQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121025; x=1786725825;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZntm8VORvDjKObm+3e5kg7isnusBSNzR7FkdFCW7YM=;
        b=L4qTig+QxuANU20CbeEeh5uDr7ejmTAbPrleOR4B0kc3Bpc+IELUpiX0x7wa85EyB/
         8KkFJsCzji8j31bYSTCC7yH9+ppEvmIgOhKsTM7w2nU4E+AOh+Yf5w3ez9iehcnQrT/I
         1YRTcDjhK1Z6zsKj6+04UhLwi9lm7N9PlWbX5ozHSy2YKyEpmLi7D9oIPFiGRo8xgByQ
         Yo6gU8GRxULWXorDbHTOk4ZDsW9zCCHgsbzyniA3uLOxc7y87Vn8TLPTVg0hcsWhmdwX
         aFJIgWajQNf9Fax8ZxWQuKVIy+ws62btnzyRprHY91RdVcT3BZqnuWLHViNyxZCajH8r
         7rew==
X-Forwarded-Encrypted: i=1; AHgh+RqKB2SESdykgMaVp4uZCO7Ke+6/9kQOSNRJvSgv/dWhC+ZBG7zwl7sxp+8u777hJSS/nP6M345791glpq2WqYc1@lists.infradead.org
X-Gm-Message-State: AOJu0YwHdHuvuju8+gR4NShLtCx9GAQx+2W+mW/46g+06CKsf4fLV3o1
	ZFOIBVyrCJWuuyALiwLlczmvDLi4htIYkBi3QBnaqI4ThDNoc44EfBE+kCwmmv7cyNiAcp23T5R
	Bc6uKkQqTlO7xKrrZVXks1VJhKdmm/g==
X-Received: from wmsk23-n2.prod.google.com ([2002:a05:600d:8497:20b0:493:c773:ff79])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ed3:b0:493:e983:806e with SMTP id 5b1f17b1804b1-4994e72f795mr337802465e9.3.1786121025032;
 Fri, 07 Aug 2026 09:43:45 -0700 (PDT)
Date: Fri,  7 Aug 2026 16:43:15 +0000
In-Reply-To: <20260807164322.2970811-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260807164322.2970811-7-sebastianene@google.com>
Subject: [PATCH v2 05/13] irqchip/gic-v3-its: Add support for the ITS
 emulation setup
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, fuad.tabba@linux.dev, joey.gouly@arm.com, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org
Cc: kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, sebastianene@google.com, 
	seiden@linux.ibm.com, smostafa@google.com, tglx@kernel.org, 
	vdonnefort@google.com, vladimir.murzin@arm.com, yuzenghui@huawei.com, 
	zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094347_462664_0977A11D 
X-CRM114-Status: GOOD (  33.47  )
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

Introduce two new helper functions to allow locking the ITS and setting
up a copy of the host ITS state that will be given to the pKVM
emulation. The caller of these functions is responsible to implement a
callback which will be used to setup the emulation layer. The calling
flow is expected to do the following:

pkvm_its_emulate_setup(its_phys, host)
	// allocate memory for the priv state of the ITS emulation
	// call the its emulation setup(its_phys, host, priv_state);

pkvm_drop_host_privileges()
	its_emulate_acquire_locks(&flags);
		on_each_cpu(_kvm_host_prot_finalize, &ret, 1);
	its_emulate_release_locks(ret, &flags, pkvm_its_emulate_setup);

Augment the its_baser structure with a new fiels that will hold a
pointer to the base table copy. The gic ITS driver will use the pointer
to the base table copy when emulation is enabled, as this allows us to
hide away the original first level of an indirect table to prevent the
following:

// assumming an indirect Device Table layout
1. malicious host patches an entry in the 1st level table with an
   address that it wants to write to.
2. malicious host issues MAPD to install a DTE in the table pointed by
   the address from (1).

As the driver only manipulates a copy of the table, the emulation is
responsible for looking at the updates from the copy table, sanitizing
them and updating the original table before talking to the hardware.

In a simillar fashion, when emulation is in place we no longer let the
gic ITS driver use the original command queue but we present the driver
a copy of it and we hide away the original command queue from the driver
as this will be used entirely by the emulation layer.

Co-authored-by: Bart=C5=82omiej Grzesik <bgrzesik@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 drivers/irqchip/irq-gic-v3-its.c   | 157 +++++++++++++++++++++++++++--
 include/linux/irqchip/arm-gic-v3.h |  39 +++++++
 2 files changed, 185 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-=
its.c
index 6f5811aae59c..e74ae9220af5 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -78,17 +78,6 @@ struct its_collection {
 	u16			col_id;
 };
=20
-/*
- * The ITS_BASER structure - contains memory information, cached
- * value of BASER register configuration and ITS page size.
- */
-struct its_baser {
-	void		*base;
-	u64		val;
-	u32		order;
-	u32		psz;
-};
-
 struct its_device;
=20
 /*
@@ -5226,6 +5215,152 @@ static int __init its_compute_its_list_map(struct i=
ts_node *its)
 	return its_number;
 }
=20
+static void its_free_snapshot(struct its_host_state *snapshot)
+{
+	int i;
+
+	if (snapshot->cmd_host_copy)
+		its_free_pages(snapshot->cmd_host_copy, get_order(ITS_CMD_QUEUE_SZ));
+
+	for (i =3D 0; i < GITS_BASER_NR_REGS; i++) {
+		if (!snapshot->tables[i].base_snapshot)
+			continue;
+
+		its_free_pages(snapshot->tables[i].base_snapshot, snapshot->tables[i].or=
der);
+	}
+
+	its_free_pages(snapshot, 0);
+}
+
+static struct its_host_state *its_snapshot_host_state(struct its_node *its=
)
+{
+	void *page;
+	struct its_host_state *snapshot;
+	int i;
+
+	page =3D its_alloc_pages_node(its->numa_node, GFP_ATOMIC | __GFP_ZERO, 0)=
;
+	if (!page)
+		return NULL;
+
+	snapshot =3D (void *)page_address(page);
+	page =3D its_alloc_pages_node(its->numa_node, GFP_ATOMIC | __GFP_ZERO,
+				    get_order(ITS_CMD_QUEUE_SZ));
+	if (!page)
+		goto err_alloc;
+
+	snapshot->cmd_host_copy	=3D page_address(page);
+	snapshot->cmdq_len	=3D ITS_CMD_QUEUE_SZ;
+	snapshot->cmd_original	=3D its->cmd_base;
+	snapshot->cmd_write	=3D its->cmd_write;
+
+	memcpy(snapshot->tables, its->tables, sizeof(struct its_baser) * GITS_BAS=
ER_NR_REGS);
+
+	for (i =3D 0; i < GITS_BASER_NR_REGS; i++) {
+		if (!(snapshot->tables[i].val & GITS_BASER_VALID))
+			continue;
+
+		if (!(snapshot->tables[i].val & GITS_BASER_INDIRECT))
+			continue;
+
+		page =3D its_alloc_pages_node(its->numa_node,
+					    GFP_ATOMIC | __GFP_ZERO,
+					    snapshot->tables[i].order);
+		if (!page)
+			goto err_alloc;
+
+		snapshot->tables[i].base_snapshot =3D page_address(page);
+
+		memcpy(snapshot->tables[i].base_snapshot, snapshot->tables[i].base,
+		       PAGE_ORDER_TO_SIZE(snapshot->tables[i].order));
+	}
+
+	return snapshot;
+
+err_alloc:
+	its_free_snapshot(snapshot);
+	return NULL;
+}
+
+static int its_emulate_switch_queues_locked(struct its_node *its, its_emul=
ate_setup cb)
+{
+	struct its_host_state *host_snaphsot, host;
+	int i, ret;
+	u64 baser_phys;
+
+	host_snaphsot =3D its_snapshot_host_state(its);
+	if (!host_snaphsot)
+		return -ENOMEM;
+
+	/*
+	 * The snapshot of the ITS state will be given to the emulation, make a c=
opy of it
+	 * so that we don't go in weeds.
+	 */
+	memcpy(&host, host_snaphsot, sizeof(host));
+
+	ret =3D cb(its->phys_base, host_snaphsot);
+	if (ret) {
+		its_free_snapshot(host_snaphsot);
+		return ret;
+	}
+
+	/* Switch the driver command queue to use the host copy and update the wr=
ite index */
+	its->cmd_write =3D (its->cmd_write - its->cmd_base) +
+		(struct its_cmd_block *)host.cmd_host_copy;
+	its->cmd_base =3D host.cmd_host_copy;
+
+	/*
+	 * Replace the first level of the indirect tables with the snapshot table=
 as the
+	 * emulation layer will make it innaccessible to the host.
+	 */
+	for (i =3D 0; i < GITS_BASER_NR_REGS; i++) {
+		if (!(host.tables[i].val & GITS_BASER_INDIRECT))
+			continue;
+
+		baser_phys =3D virt_to_phys(host.tables[i].base_snapshot);
+		if (IS_ENABLED(CONFIG_ARM64_64K_PAGES) && (baser_phys >> 48))
+			baser_phys =3D GITS_BASER_PHYS_52_to_48(baser_phys);
+
+		its->tables[i].val &=3D ~GENMASK(47, 12);
+		its->tables[i].val |=3D baser_phys;
+		its->tables[i].base =3D host.tables[i].base_snapshot;
+	}
+
+	return 0;
+}
+
+void its_emulate_acquire_locks(unsigned long *flags)
+{
+	struct its_node *its;
+
+	if (WARN_ON(!flags))
+		return;
+
+	raw_spin_lock_irqsave(&its_lock, *flags);
+
+	list_for_each_entry(its, &its_nodes, entry)
+		raw_spin_lock(&its->lock);
+}
+
+int its_emulate_release_locks(int ret_pkvm_finalize, unsigned long *flags,=
 its_emulate_setup cb)
+{
+	struct its_node *its;
+	int ret =3D 0;
+
+	if (WARN_ON(!flags || !cb))
+		ret =3D -EINVAL;
+
+	list_for_each_entry(its, &its_nodes, entry) {
+		if (!ret_pkvm_finalize && !ret)
+			ret =3D its_emulate_switch_queues_locked(its, cb);
+
+		raw_spin_unlock(&its->lock);
+	}
+
+	raw_spin_unlock_irqrestore(&its_lock, *flags);
+
+	return ret;
+}
+
 static int __init its_probe_one(struct its_node *its)
 {
 	u64 baser, tmp;
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm=
-gic-v3.h
index ea5fd2374ebe..b75f82cef4bf 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -657,6 +657,45 @@ static inline bool gic_enable_sre(void)
 	return !!(val & ICC_SRE_EL1_SRE);
 }
=20
+/*
+ * The ITS_BASER structure - contains memory information, cached
+ * value of BASER register configuration and ITS page size.
+ */
+struct its_baser {
+	void		*base;
+
+	/*
+	 * The table used when emulation is in place and indirect layout is
+	 * configured.
+	 */
+	void		*base_snapshot;
+	u64		val;
+	u32		order;
+	u32		psz;
+};
+
+struct its_host_state {
+	struct its_baser	tables[GITS_BASER_NR_REGS];
+
+	/* The command queue used after the emulation is in place */
+	void			*cmd_host_copy;
+
+	/* The command queue configured by the ITS driver at boot */
+	void			*cmd_original;
+	void			*cmd_write;
+	size_t			cmdq_len;
+};
+
+/*
+ * Callback used to initialize the emulation. It is expected to allocate m=
emory for the private
+ * state of the emulation and receive as arguments copy of the host ITS dr=
iver state along
+ * with the address of the ITS.
+ */
+typedef int (*its_emulate_setup)(phys_addr_t its_phys_base, struct its_hos=
t_state *host);
+
+void its_emulate_acquire_locks(unsigned long *flags);
+int its_emulate_release_locks(int ret_pkvm_finalize, unsigned long *flags,=
 its_emulate_setup cb);
+
 #endif
=20
 #endif
--=20
2.55.0.654.g21b8a5bc05-goog


