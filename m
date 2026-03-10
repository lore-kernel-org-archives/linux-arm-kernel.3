Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED3EFD2D73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ok3Trxc1drhi1LSuLE9o9e58C6eJmakQglQiNgbjypE=; b=Z8RMdnfFFLETxFXmxdCs3a4803
	Lq6rT5kKsj3KpEYanXXBbN2tH0ij6mo28oJVlseL9ejMV2l4YROAD1vyE7z6+YppfQj4Kwt9H8byO
	3IsaRd7Ru8WKtW4e3ibCRIS+BHy2mDYoXVpfuQlwm2kDyet6qd+VdpEfJpc34OVDoU4FI0xaFZgpF
	H99hUT7vV9g5Ismq3Ekrae8lbtqV28aiggYfb1fyivM1aIWH1cbEQwaWLkt4Pq602m0WNU+WXlXpo
	KPmaujb/KjP0LnNn9M88/c8e2+yQ9n7GOEDPFnPwQkqZrttpuS8v0PWjDTWVG9n4DXq012t8XMv9E
	s6Ps/glg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwXE-00000009WKf-46gi;
	Tue, 10 Mar 2026 12:50:04 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwXA-00000009WCX-0fX0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:50:01 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48535f4d5e1so21042205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773146998; x=1773751798; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ok3Trxc1drhi1LSuLE9o9e58C6eJmakQglQiNgbjypE=;
        b=SDOisbw5Lyd/cBDvLaD6f1O6Ee1wcPgSbTX8xpg3wlpBu+e+7kgWzn0yWZZxBWZxAv
         sYnqGwj+sfeZ1UIGTCptZBsB4EiwJWAHjcJ+QDIIn9+ljsyiVGVDyS7zROf6YKw3VJJt
         mao9CFs7nCydbH0xNPCwqexwibinQA+KnqFx5d8n6NnBvfUUa747Ct35DvsNBKxLIn7V
         uav0Q2PsInS1Ek8M51XS8JmLghBjx1A7YKa85VrwsF7hASDA0gOQweq+aPlEIhC4lIPF
         J7i3ySj0cNNOvza0sVyXlemBUbeckXnLwQcEvtVaR7BWSxB1aPlXZMh2lGRzHZkNDDOb
         7DWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146998; x=1773751798;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ok3Trxc1drhi1LSuLE9o9e58C6eJmakQglQiNgbjypE=;
        b=huY3ugcu6WLqY894j+nq/5/LjhESiQkL2N2D4WkGPQa1cTpO2l2B38tlalS3T2drev
         p0/JqTX8O17w9wzzPx+X3gbFMA3y19R1vaj9zdfPnIdl9RPhHspJvyUTC3Alxf2SnXyE
         zs7m/quJu7SNhJZDA5otgPqSROCN8ptVpkuczzTtlNPVfmqYwLYEk6GtXSQOMHHa6B9S
         LvkVYZNnn4VY9uszwMjwwedYJZs3nc6+4g/ipI1ZPTI3vghO8QYR0onb58zOqtg3/IUe
         rrfpFiLbhYb9jrcrb9H0DMZQOVE3hNGtGM9EAZHFbxyqHud2C7I+AhrUCyipoMaKB/ma
         N+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUpDF8nMnu13PJo0sjJWlexyMwpkgbrqMH5FHKgWYvA62EaViYee2fMW/zA3XZSIrSJVG6uyRZdHtzo7r3RhLvE@lists.infradead.org
X-Gm-Message-State: AOJu0YyVQ6F3keix8Q8ZoofZZDT4eRLtU0Gv95ie1EUoYR9sQUnTGlzE
	ZfySiQGj+nuXN5nb9IaBta2STosBLdJRXKf0yvsOlQiV3/AG9cUnNmfOVLO6rHgkB31bhu2XFRW
	ErXmhpHEz9+pe0nDDNGVvJgTCgCSlEw==
X-Received: from wrbeh2.prod.google.com ([2002:a05:6000:4102:b0:439:e77e:e4b4])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8708:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-4853c39afc4mr90731285e9.23.1773146998009;
 Tue, 10 Mar 2026 05:49:58 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:49:32 +0000
In-Reply-To: <20260310124933.830025-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310124933.830025-14-sebastianene@google.com>
Subject: [PATCH 13/14] KVM: arm64: Restrict host updates to GITS_BASER
From: Sebastian Ene <sebastianene@google.com>
To: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: catalin.marinas@arm.com, dbrazdil@google.com, joey.gouly@arm.com, 
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	perlarsen@google.com, qperret@google.com, rananta@google.com, 
	sebastianene@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_055000_218040_2BB632F5 
X-CRM114-Status: GOOD (  15.45  )
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

Prevent the host from updating the ITS tables while
the ITS is enabled and the tables are already set.
This enforcement prevents unpredictable hardware behavior
and ensures the host cannot update the hardware with
an unverified table address or size or change its layout.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 45 +++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 9715f15cd432..e4136a4a2ecb 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -22,6 +22,7 @@ struct its_priv_state {
 struct its_handler {
 	u64 offset;
 	u8 access_size;
+	u8 num_registers;
 	void (*write)(struct its_priv_state *its, u64 offset, u64 value);
 	void (*read)(struct its_priv_state *its, u64 offset, u64 *read);
 };
@@ -315,18 +316,48 @@ static void cbaser_read(struct its_priv_state *its, u64 offset, u64 *read)
 	*read = readq_relaxed(its->base + GITS_CBASER);
 }
 
-#define ITS_HANDLER(off, sz, write_cb, read_cb)	\
+static void baser_write(struct its_priv_state *its, u64 offset, u64 value)
+{
+	u64 baser, ctlr = readq_relaxed(its->base + GITS_CTLR);
+	int baser_idx;
+
+	if ((ctlr & GITS_CTLR_ENABLE) ||
+	    !(ctlr & GITS_CTLR_QUIESCENT))
+		return;
+
+	baser_idx = (offset - GITS_BASER) >> 3;
+	baser = its->shadow->tables[baser_idx].val;
+	if ((value & GITS_BASER_INDIRECT) != (baser & GITS_BASER_INDIRECT))
+		return;
+
+	value &= ~GENMASK(47, 12) | ~GENMASK(9, 0);
+	value |= (baser & GENMASK(47, 12)) | (baser & GENMASK(9, 0));
+
+	writeq_relaxed(value, its->base + offset);
+}
+
+static void baser_read(struct its_priv_state *its, u64 offset, u64 *read)
+{
+	*read = readq_relaxed(its->base + offset);
+}
+
+#define ITS_HANDLER(off, sz, num, write_cb, read_cb)	\
 {							\
 	.offset = (off),				\
 	.access_size = (sz),				\
+	.num_registers = (num),				\
 	.write = (write_cb),				\
 	.read = (read_cb),				\
 }
 
+#define ITS_REG(off, sz, write_cb, read_cb)	\
+	ITS_HANDLER(off, sz, 1, write_cb, read_cb)
+
 static struct its_handler its_handlers[] = {
-	ITS_HANDLER(GITS_CWRITER, sizeof(u64), cwriter_write, cwriter_read),
-	ITS_HANDLER(GITS_CTLR, sizeof(u64), ctlr_write, ctlr_read),
-	ITS_HANDLER(GITS_CBASER, sizeof(u64), cbaser_write, cbaser_read),
+	ITS_REG(GITS_CWRITER, sizeof(u64), cwriter_write, cwriter_read),
+	ITS_REG(GITS_CTLR, sizeof(u64), ctlr_write, ctlr_read),
+	ITS_REG(GITS_CBASER, sizeof(u64), cbaser_write, cbaser_read),
+	ITS_HANDLER(GITS_BASER, sizeof(u64), 8, baser_write, baser_read),
 	{},
 };
 
@@ -354,14 +385,16 @@ void pkvm_handle_gic_emulation(struct pkvm_protected_reg *region, u64 offset, bo
 	struct its_priv_state *its_priv = region->priv;
 	void __iomem *addr;
 	struct its_handler *reg_handler;
+	u64 end;
 
 	if (!its_priv)
 		return;
 
 	addr = its_priv->base + offset;
 	for (reg_handler = its_handlers; reg_handler->access_size; reg_handler++) {
-		if (reg_handler->offset > offset ||
-		    reg_handler->offset + reg_handler->access_size <= offset)
+		end = reg_handler->offset + reg_handler->access_size * reg_handler->num_registers;
+
+		if (reg_handler->offset > offset || end <= offset)
 			continue;
 
 		if (reg_handler->access_size & (reg_size - 1))
-- 
2.53.0.473.g4a7958ca14-goog


