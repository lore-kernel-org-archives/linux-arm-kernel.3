Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE56C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TXLJIzu0sdUTbcYifBsweWW0qiwt6RC0AmUjCHWXcg=; b=uSxri0nR61QapGP4v936k4qQK1
	lUiLoQzU3gaDI9ZBMrEoIXI55v9Q1G0GxkSoRU7JcwDm+cIOiXeTbMhdVZAX7XzKqAmsKRW7XNWjd
	qY1XWwkdRfibGGpufUGIADtN4Npzi/fHSNJqx3aWakpQaXRGm9g13iLLIbxiTIWZOBTI5kiQyDX/D
	Kxf49uqTFevUtXfv4Sh2HQX41P/EVLnSLJ3zaoNcuLl8dFVmYp0o8mYlIEYOyNSSr1/1CIYYT3vZw
	3C9C8SvjvPACHzb5yjLZlzm0eANQpVySg2rVtVqVMGeQ+30XFXsAqvIrE6c5JIM+0P6b8bYnvZu/y
	9Q3+1eDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfx-00000008SOR-1K1T;
	Fri, 07 Aug 2026 16:44:05 +0000
Received: from mail-lj1-x248.google.com ([2a00:1450:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfp-00000008SBJ-3wFR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:43:59 +0000
Received: by mail-lj1-x248.google.com with SMTP id 38308e7fff4ca-39f72d86889so10742651fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786121035; x=1786725835; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TXLJIzu0sdUTbcYifBsweWW0qiwt6RC0AmUjCHWXcg=;
        b=XEcgbO+i60uk046PdL5Kip2A6tuWMLVaRsnHE3yRB6HGKN4JSwEchC40cY+8hbcb0e
         wwYamLWv/Vm0ZlTNX+B8Xs6sla5k1fIsbmeHiaZwvWLyEZZPSR68Qmlso2ogpKCaNxYX
         uvSKVKDXDJ6qePrjIXBHZEfVKVoWyxPI3+nWbSbo6vINGinizN1IJBtOHWDtRx464bfx
         MmeGaxA6reOjp6jDb6RHvomZDdBcMEhjeJptIUPNul7fy2tZePOfwnNfSuTeceQAW1Pk
         k2eqoZks5q7wrlfJF1hL8pMJvBo+lAmpyJU8u2kZxWbyj68dPSVTX5PncF2iZ3Slmesd
         nMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121035; x=1786725835;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7TXLJIzu0sdUTbcYifBsweWW0qiwt6RC0AmUjCHWXcg=;
        b=Nf1cPm84Nc/isNO4yiRrlsm+eI2BwShAYI0xWvXb3LUZeR34gJtKa6bF5Ru8hGM79/
         sW53U9ohFGPWSLPJwQ5Enz0L0aTMU7PgKgjtgL60jNFoG4FNl3jQM63ZEJFkTIe3rys5
         DuEiGmEez8cqDVz/W6bww1hTYo6LSnRf9oXO1BYmhTRirCN5+rr8hB7DPW/W6QEZrouU
         SC2ZW/YmDOjHVRJVUaq6OcMpCEiH0Z8uw5zI/oYKamgHkbr0fw2GO5HWjoIf8/LRqfKk
         zSfD+zsrIvhgiehdhVaZJqtpo25vRO9N3nM8WShCfo25Hin8Rzx52bAe1fKDeD8/9wO2
         bELQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2+VJFQrDcoPY/YILO0AHYC+MU3uxfGrfF9/e6BJM58PhiIQuluShFidODfRoM7m0D8P6liW86q5itlA52x+/d@lists.infradead.org
X-Gm-Message-State: AOJu0YwLnNyrlYv8VlA5aBSzNGuWdazNoZ/O0bIa4J5kpn3wZ0FAOJ28
	3GdJxulhcdtwENTg3FwtrF3fs9MPn7zkegFuECWxgwOjBu12Q49UvjtGTpI4YcXKKuBFwVzYxoF
	WOmrFSbcPfpav8rx5/hr09/cUR/anbg==
X-Received: from ljik18.prod.google.com ([2002:a2e:8892:0:b0:397:f415:3317])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a2e:bc0d:0:b0:39b:f64:1af3 with SMTP id 38308e7fff4ca-39fe56728b1mr2004231fa.8.1786121034668;
 Fri, 07 Aug 2026 09:43:54 -0700 (PDT)
Date: Fri,  7 Aug 2026 16:43:21 +0000
In-Reply-To: <20260807164322.2970811-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260807164322.2970811-13-sebastianene@google.com>
Subject: [PATCH v2 11/13] KVM: arm64: Prevent the host from specifying a
 different command queue
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
X-CRM114-CacheID: sfid-20260807_094358_033452_51259F8C 
X-CRM114-Status: GOOD (  13.33  )
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

Don't let a malicious host re-program the command queue register with a
different address and size to bypass the commands sanitization.
Prevent unpredictable hardware behavior and restrict updates to the
GITS_CBASER while the ITS is enabled or not in a quiescent state.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index b9b71aa18d48..97cfa31d90d1 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -429,9 +429,41 @@ static void ctlr_write(struct pkvm_protected_reg *region, u64 offset, u64 value)
 	writel_relaxed(value, its->base + GITS_CTLR);
 }
 
+static void cbaser_write(struct pkvm_protected_reg *region, u64 offset, u64 value)
+{
+	struct its_priv_state *its = region->priv;
+	int num_pages;
+	u64 ctlr;
+
+	ctlr = readl_relaxed(its->base + GITS_CTLR);
+	if ((ctlr & GITS_CTLR_ENABLE) || !(ctlr & GITS_CTLR_QUIESCENT))
+		return;
+
+	num_pages = its->host_state->cmdq_len / SZ_4K;
+
+	/* Don't let the host program a different command queue */
+	value &= ~(GENMASK(7, 0) | GENMASK_ULL(51, 12));
+	value |= (num_pages - 1) & GENMASK(7, 0);
+	value |= __hyp_pa(its->cmd_original) & GENMASK_ULL(51, 12);
+	its->needs_flush = (value & GITS_CBASER_SHAREABILITY_MASK) != GITS_CBASER_InnerShareable;
+
+	writeq_relaxed(value, its->base + GITS_CBASER);
+
+	/* Restart the CMDQ to read from 0 */
+	its->cmd_offset = 0;
+	writeq_relaxed(0, its->base + GITS_CWRITER);
+}
+
+static void cbaser_read(struct pkvm_protected_reg *region, u64 offset, u64 *read)
+{
+	struct its_priv_state *its = region->priv;
+	*read = readq_relaxed(its->base + GITS_CBASER);
+}
+
 static struct its_handler its_handlers[] = {
 	ITS_HANDLER(GITS_CWRITER, sizeof(u64), cwriter_write, cwriter_read),
 	ITS_HANDLER(GITS_CTLR, sizeof(u32), ctlr_write, ctlr_read),
+	ITS_HANDLER(GITS_CBASER, sizeof(u64), cbaser_write, cbaser_read),
 	{},
 };
 
-- 
2.55.0.654.g21b8a5bc05-goog


