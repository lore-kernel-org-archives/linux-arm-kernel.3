Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6285C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTVefapbptpCkdGjL+1kDLjlNC/ag2PzDpk3DPL7XNw=; b=t9u7De3EnnHbclp2rwHarMmbIQ
	5+9rfdvVXIUJ278KgQLPssK1VvS2clZYP9lDmeyaZok6LUximptBuUNaW3OIbzaR11xRftpr+bDqw
	4hXUvOUSaUD+YNNNGTAqtD5DCzz67bwd+B9FIeFRUN3K22PveVN6gcgbw5fOZyyJscW6csejr70I7
	i0r8YSmWSdFeEUbpphqX96G66cSwlxgbRfh5fiwCjP5Cme3ELD0WRytW+zX/LVTpJKzUGFUVZ/gvB
	+X7DnTjqCHS24GNZD6jTRSnz4NRY5qo4k7RULSoAZ+R5+eatlTxXD96TnqMnRlLoAnU/FuQBs+tiO
	ZoGaWbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfx-00000008SP2-1wwI;
	Fri, 07 Aug 2026 16:44:05 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfq-00000008SCP-32gw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:43:59 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c1f472eaafbso210087066b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786121036; x=1786725836; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTVefapbptpCkdGjL+1kDLjlNC/ag2PzDpk3DPL7XNw=;
        b=XjXSzwXaTni4mN9CbvsfMPdHyGRWRA4i0Ef6PGSi16EKwQygMAmo9xUbwcY22I3UHL
         mLxPEDl7LZ0TYcdHwZPheAeOWzMe1HG1KX9J2u55IcrQpJLdlfgVtOymTWRjwv7UpCWG
         kUnwE/5x2HNN8uBx24oQ6TwKAmHr+8y78ZH47ouPEmLCMnXhBJBoefXx8X3Rqm1Rh9ps
         TwHPSsv89yBIYySewfBX5LA7McZfBtRgvUkMi2yO6tP0FPeF+u/IW/yq/WaMD7cMehhv
         8hqRCzATbeqpqF3WDbjnn8i43pgecihlo+8sbJIDycdu0Bu++7Ud+wToqsdzj5p2N3Sk
         hhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121036; x=1786725836;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kTVefapbptpCkdGjL+1kDLjlNC/ag2PzDpk3DPL7XNw=;
        b=SNva2gkZ590tGHdAtpEBXsuB/ekob6ob36h71ZjJBwtE8lS8QrBsQi9ZSPj+rGXGWz
         zmyz3mgkQ/nuI8dp+HMVS+vdR7B0uj0eh5w6Js6SK+QQ5St9ki12ILL4yofc03vJT/C5
         kzSpC8Hj2VNfkYXgbBg650hk/10aTE3AaLh57BsgswDs3AqzIZpowcSwlJ7OAvPAM/rF
         1DMsNlSrxAkc+s3t+WC1Ec9WMoVdIUUSS11v1vfUrN++UWs6wy7SdjJSj5pdsnpF8dHE
         lbdGmplyTmhK+N50UGAXUlaz1dq0fmkZXbgmcZDp0d9h+CTvrqqD5l/0VXuW7PfFag/J
         NQpQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEzKeW73286kGpM4E8Ax2GJAiuknQQ4CUzSKdAep6W7YNI+bxyHWdvf7BCPzz3yEIJ+bG35RPM2u4J0WQq5Hnz@lists.infradead.org
X-Gm-Message-State: AOJu0Yww2qrcpRwujNRj5rkD0E53uDprBxdV7S/7L/uVTR+pNTyBIXOO
	4ZaUlHuz4MArzDIpJ2k9cfPAW58k8YT5gE1Jw5rhdjrOEg3NkGDRSnYmFbbb6lUmLRfNjd1js/v
	ua5NW+4jSveriMa+5Kgq0IMJRsjLMwQ==
X-Received: from ejoz15.prod.google.com ([2002:a17:906:668f:b0:c12:533f:6b88])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:2ad4:b0:c20:61e0:e3ab with SMTP id a640c23a62f3a-c2061e10ffbmr524125066b.3.1786121036039;
 Fri, 07 Aug 2026 09:43:56 -0700 (PDT)
Date: Fri,  7 Aug 2026 16:43:22 +0000
In-Reply-To: <20260807164322.2970811-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260807164322.2970811-14-sebastianene@google.com>
Subject: [PATCH v2 12/13] KVM: arm64: Prevent the host from programming new
 GITS_BASER tables
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094358_778610_A3981C88 
X-CRM114-Status: GOOD (  17.61  )
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

Don't allow the host to change the layout of the tables or to modify the
address programmed in the GITS_BASER registers to point to new tables
and bypass the sanitization.
Prevent the host from updating the ITS tables while the ITS is enabled
and the tables are set to prevent undefined behavior.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 44 +++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 97cfa31d90d1..82dc60dcde68 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -42,18 +42,23 @@ void its_emulate_forward_req(struct pkvm_protected_reg *region, u64 offset, bool
 struct its_handler {
 	u64	offset;
 	u8	access_size;
+	u8	num_registers;
 	void	(*write)(struct pkvm_protected_reg *region, u64 offset, u64 value);
 	void	(*read)(struct pkvm_protected_reg *region, u64 offset, u64 *read);
 };
 
-#define ITS_HANDLER(off, sz, write_cb, read_cb)		\
+#define ITS_HANDLER_REG_PAIR(off, sz, registers, write_cb, read_cb)	\
 {							\
 	.offset = (off),				\
 	.access_size = (sz),				\
+	.num_registers = (registers),			\
 	.write = (write_cb),				\
 	.read = (read_cb),				\
 }
 
+#define ITS_HANDLER(off, sz, write_cb, read_cb)		\
+	ITS_HANDLER_REG_PAIR(off, sz, 1, write_cb, read_cb)
+
 struct dte_entry {
 	u32	device_id;
 	u64	itt_pfn;
@@ -460,10 +465,42 @@ static void cbaser_read(struct pkvm_protected_reg *region, u64 offset, u64 *read
 	*read = readq_relaxed(its->base + GITS_CBASER);
 }
 
+static void baser_write(struct pkvm_protected_reg *region, u64 offset, u64 value)
+{
+	struct its_priv_state *its = region->priv;
+	u32 ctlr = readl_relaxed(its->base + GITS_CTLR);
+	int baser_idx;
+	u64 baser;
+
+	if ((ctlr & GITS_CTLR_ENABLE) || !(ctlr & GITS_CTLR_QUIESCENT))
+		return;
+
+	baser_idx = (offset - GITS_BASER) >> 3;
+	baser = its->host_state->tables[baser_idx].val;
+
+	/* Prevent if it tries to change from direct layout to indirect layout */
+	if ((value & GITS_BASER_INDIRECT) != (baser & GITS_BASER_INDIRECT))
+		return;
+
+	/* Don't allow the host to point to new tables or new attributes */
+	value &= ~(GENMASK_ULL(47, 12) | GENMASK_ULL(9, 0));
+	value |= (baser & GENMASK_ULL(47, 12)) | (baser & GENMASK_ULL(9, 0));
+
+	writeq_relaxed(value, its->base + offset);
+}
+
+static void baser_read(struct pkvm_protected_reg *region, u64 offset, u64 *read)
+{
+	struct its_priv_state *its = region->priv;
+	*read = readq_relaxed(its->base + offset);
+}
+
 static struct its_handler its_handlers[] = {
 	ITS_HANDLER(GITS_CWRITER, sizeof(u64), cwriter_write, cwriter_read),
 	ITS_HANDLER(GITS_CTLR, sizeof(u32), ctlr_write, ctlr_read),
 	ITS_HANDLER(GITS_CBASER, sizeof(u64), cbaser_write, cbaser_read),
+
+	ITS_HANDLER_REG_PAIR(GITS_BASER, sizeof(u64), 8, baser_write, baser_read),
 	{},
 };
 
@@ -472,13 +509,14 @@ void pkvm_its_emulate_handler(struct pkvm_protected_reg *region, u64 offset, boo
 {
 	struct its_priv_state *priv = region->priv;
 	struct its_handler *reg_handler;
+	u64 end;
 
 	if (!priv || !IS_ALIGNED(offset, reg_size))
 		return;
 
 	for (reg_handler = its_handlers; reg_handler->access_size; reg_handler++) {
-		if (reg_handler->offset > offset ||
-		    reg_handler->offset + reg_handler->access_size <= offset)
+		end = reg_handler->offset + reg_handler->access_size * reg_handler->num_registers;
+		if (reg_handler->offset > offset || end <= offset)
 			continue;
 
 		if (reg_handler->access_size < reg_size)
-- 
2.55.0.654.g21b8a5bc05-goog


