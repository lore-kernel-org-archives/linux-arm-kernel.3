Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8F4E7314A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENzMwMoZWO8vLhCKa/do6yK+Nqm+qfwsFu4e8Q1TWrM=; b=m0BACSLnJ6MGfNDsGUr9JPPTpp
	agtX+ETM+CqLpWbJyFqL/1ugVbAcEz28d1jHj3ElFrnHmhJzeM7gWhm2Aqs+K550YqGP6xzCeddyK
	n/Ba2tDVugcywGZTnGe64xhrjNanYvZiQDwGwNcpwenHPCbchsUhGZUkcNiQfvzLJkOVVcgs2N3R3
	IlsY15ousQrC2YW79Bfewbh2oCjPwjaztgJ9xAtlwWNdD4wxC4Of6S24Skk1va1m6k0ka05+bVVgJ
	Hma5m0Fd5xUISWleZNmB+jYbiFsQz+YdAJHKU5VOmUNZsqSi4U/z/HPKR/NJuLF8qW2snhuw+Bj+J
	5qlmUqsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqgJ-00000004kdV-3s8k;
	Mon, 02 Feb 2026 09:57:19 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqgH-00000004kd8-2IDP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 09:57:18 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48079ae1001so30384235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 01:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770026235; x=1770631035; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ENzMwMoZWO8vLhCKa/do6yK+Nqm+qfwsFu4e8Q1TWrM=;
        b=plwor+36XeZ+7HPt32MWqLcB5zXqLRy6HANdkSiYj31fwHzuxp9Y3ZO4gRHd2KB+MB
         pfOk2XZU7DCGAq34dBP7opMry4mfqMD5sZuWb3V4ej6IFVmx/jm9R0jvZib0JfdWepmh
         GmX5Ewo9Khc7fX31ZDETz3RAdP6D5aSD1Ov5vJeX6e9tSH5ZLfBHd2kguHr7IdsuedaS
         OteNpDBJ9Qg1MmSDCD/wpzkfWmDtOuuue5VmkmLRH11N7L8y+Oji0WnfYF4InbNHAstg
         P5ZFzY8gf5O0mM13qXyilAPSpjTTj/gbsyku8XfXiQAAFFmTl6P5eYjsRH6tPFLMhvBh
         4qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026235; x=1770631035;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ENzMwMoZWO8vLhCKa/do6yK+Nqm+qfwsFu4e8Q1TWrM=;
        b=tTPhxOfOQpOS3X9CO5VRLsby8zFhawJJ8B2vLpv2+1P8/dCRN0qC0ziRG01/DcbRun
         6IVUC9VxIIVGruCToCsaJQpeWovi4czek0IJ56qS39IBi/TYcmAvKrifxkqPULxuTbbM
         UcAWZ9xbhUzp9CiWsoLkmf8Ff66r+MYK/2BOoBn64ZR1HDIO8oA9qtzpDnASunLt6qBc
         w58Df10WXLS8Xl/n3AVZS+Hm2iCmaYgvdptvG8n09dut2HehCLTFjapRkJsNXZxeE4TL
         Z9r22fRqRNXic9TwFw/4gwGJFxd6d0S92EDw5e29kUaEoomwYy8dQehHMTZwjEiQbmDQ
         +tgg==
X-Forwarded-Encrypted: i=1; AJvYcCUgqsiFDzXPs8YjD/mxaDugzvvevHkkOvtCD1UTdmWQ01F50bxan7aOKPveGpmvpbshZFh9X1IyXNhcFFaCtp6h@lists.infradead.org
X-Gm-Message-State: AOJu0YzAoF9HZW6BU8m6E7+yIQwjRcKWYD68KQAmcWO1e6mMkTSZ9Lfz
	c0flRJskOnCrnpgqFPORFGD5D06buCedAP2skyrZHO90IC+y+/mlSW3y8h2ncrDvynqsx1rKfBO
	X/w==
X-Received: from wmbdn5.prod.google.com ([2002:a05:600c:6545:b0:480:69c2:3949])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:82cd:b0:482:ef72:5787
 with SMTP id 5b1f17b1804b1-482ef725dc0mr51293805e9.1.1770026235054; Mon, 02
 Feb 2026 01:57:15 -0800 (PST)
Date: Mon,  2 Feb 2026 09:57:14 +0000
In-Reply-To: <86wm0va4ni.wl-maz@kernel.org>
Mime-Version: 1.0
References: <86wm0va4ni.wl-maz@kernel.org>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260202095714.4038391-1-tabba@google.com>
Subject: Re: [PATCH 20/20] KVM: arm64: Add debugfs file dumping computed RESx values
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	oupton@kernel.org, yuzenghui@huawei.com, will@kernel.org, 
	catalin.marinas@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_015717_670431_C2AA7B52 
X-CRM114-Status: GOOD (  17.64  )
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

...

>
> Yes please. We might as well do the right thing, and I can fold that
> into my current series with you as a co-author.
>
> Thanks,

Here you go.

Cheers,
/fuad

---
 arch/arm64/include/asm/kvm_host.h |  1 -
 arch/arm64/kvm/sys_regs.c         | 42 +++++--------------------------
 2 files changed, 6 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 54072f6ec9d4..c82b071ade2a 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -375,7 +375,6 @@ struct kvm_arch {
 
 	/* Iterator for idreg debugfs */
 	u8	idreg_debugfs_iter;
-	u16	sr_resx_iter;
 
 	/* Hypercall features firmware registers' descriptor */
 	struct kvm_smccc_features smccc_feat;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index f3f92b489b58..d33c39ea8fad 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5090,7 +5090,7 @@ static const struct seq_operations idregs_debug_sops = {
 
 DEFINE_SEQ_ATTRIBUTE(idregs_debug);
 
-static const struct sys_reg_desc *sr_resx_find(struct kvm *kvm, u16 pos)
+static const struct sys_reg_desc *sr_resx_find(struct kvm *kvm, loff_t pos)
 {
 	unsigned long i, sr_idx = 0;
 
@@ -5100,10 +5100,8 @@ static const struct sys_reg_desc *sr_resx_find(struct kvm *kvm, u16 pos)
 		if (r->reg < __SANITISED_REG_START__)
 			continue;
 
-		if (sr_idx == pos)
+		if (sr_idx++ == pos)
 			return r;
-
-		sr_idx++;
 	}
 
 	return NULL;
@@ -5112,22 +5110,11 @@ static const struct sys_reg_desc *sr_resx_find(struct kvm *kvm, u16 pos)
 static void *sr_resx_start(struct seq_file *s, loff_t *pos)
 {
 	struct kvm *kvm = s->private;
-	u16 *iter;
-
-	guard(mutex)(&kvm->arch.config_lock);
 
 	if (!kvm->arch.sysreg_masks)
 		return NULL;
 
-	iter = &kvm->arch.sr_resx_iter;
-	if (*iter != (u16)~0)
-		return ERR_PTR(-EBUSY);
-
-	*iter = *pos;
-	if (!sr_resx_find(kvm, *iter))
-		iter = NULL;
-
-	return iter;
+	return (void *)sr_resx_find(kvm, *pos);
 }
 
 static void *sr_resx_next(struct seq_file *s, void *v, loff_t *pos)
@@ -5136,36 +5123,20 @@ static void *sr_resx_next(struct seq_file *s, void *v, loff_t *pos)
 
 	(*pos)++;
 
-	if (sr_resx_find(kvm, kvm->arch.sr_resx_iter + 1)) {
-		kvm->arch.sr_resx_iter++;
-
-		return &kvm->arch.sr_resx_iter;
-	}
-
-	return NULL;
+	return (void *)sr_resx_find(kvm, *pos);
 }
 
 static void sr_resx_stop(struct seq_file *s, void *v)
 {
-	struct kvm *kvm = s->private;
-
-	if (IS_ERR(v))
-		return;
-
-	guard(mutex)(&kvm->arch.config_lock);
-
-	kvm->arch.sr_resx_iter = ~0;
 }
 
 static int sr_resx_show(struct seq_file *s, void *v)
 {
-	const struct sys_reg_desc *desc;
+	const struct sys_reg_desc *desc = v;
 	struct kvm *kvm = s->private;
 	struct resx resx;
 
-	desc = sr_resx_find(kvm, kvm->arch.sr_resx_iter);
-
-	if (!desc->name)
+	if (!desc)
 		return 0;
 
 	resx = kvm_get_sysreg_resx(kvm, desc->reg);
@@ -5188,7 +5159,6 @@ DEFINE_SEQ_ATTRIBUTE(sr_resx);
 void kvm_sys_regs_create_debugfs(struct kvm *kvm)
 {
 	kvm->arch.idreg_debugfs_iter = ~0;
-	kvm->arch.sr_resx_iter = ~0;
 
 	debugfs_create_file("idregs", 0444, kvm->debugfs_dentry, kvm,
 			    &idregs_debug_fops);
-- 
2.53.0.rc1.225.gd81095ad13-goog


