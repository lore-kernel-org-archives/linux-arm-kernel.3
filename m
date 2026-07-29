Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55FFC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thsyczRLbjXAiylyvIOhzxaR9c8IJTQiSChj+R7W6P4=; b=ewRd2RP+GW6jRt7cd65V0JZvy0
	aK6qyAYmplLPv/bNdTMFa4WTTSLRMujZxTFA45tfTN7Nmx5Vub2cEt/bCQKJBGS/Zuf+mZGSbF64i
	fQHMIu5d6MCm93/DbSdKn95FDSztQy8PSl4xzfZqioBuwFlMDyH/evZ+hcG2q5KQsn0FWDL0VvOUr
	2bUtA/PSzN/ADWkT2TF0OQazSk7vMW/0Hf3DuGPx9m6O3KXmqDGGUF5qTqR/cary7rbj3yDeznmjT
	4WVCpgAkz9qwYXquNvFsfgn8CQwAezrMNhfLOm2c1ms3cygElR5c0pMmydG/AKc8iXe3juh8MsCGa
	DuQ85PHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3AL-00000007qeU-1DfF;
	Wed, 29 Jul 2026 12:13:41 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3AE-00000007qaM-2bbi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:13:35 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49561facb1dso6395895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 05:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785327212; x=1785932012; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thsyczRLbjXAiylyvIOhzxaR9c8IJTQiSChj+R7W6P4=;
        b=QW/wmjB9RAOdst4tBcsEKLFTN7JCum9fYyvUJRRzefLHtsSKMjdP/5o1JdUGImoZGg
         nFOfLHnsEs++udfbwgMoq6rLAv1tKzjiB9lxoYPD1PNLgf72obzpl/AOFxlTN9WdQfEt
         XRBcF++PmGhYL5zx9L5WzfateJ7OQRIvqMSRzovNnuKHzaRpbsT+KCPKu26WRzZsYjYW
         ImMHba6MvUU9x/j3O7493IeWRo8GFpYwPsb5x+IsFqDFarWpHvvIjdq7VpwP3rcBoHBY
         CcrmnOCwar0kp4pPQB4xjzax8J/eBNDo6MPWOlK19/wNlUI5qsH89dBwY/DWyEMTUPP2
         FSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327212; x=1785932012;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thsyczRLbjXAiylyvIOhzxaR9c8IJTQiSChj+R7W6P4=;
        b=AXMCywXeVyQ85dvpALvdeL/BxnPgVsnqbXKsLnKbAbD7gXBVXALKVumI2wLkjkW+Eq
         ObNq3IWIC7YKgloip4u+PJq03a1Kv9XOwZoQcKgM7eM4v1v1zxIg7MZph3TdGm75NeAB
         YcqVSya5/ltSyhuXaM3mX+zRQ2S2pSFfHxVDYeOmD62oSCQVshSbeXHVU0iGmK5CTGvh
         cEVOp9NySlSyjarRm8upJ9api+59w78D0NAj1DWewdjBeYLtjfPYFMT0Y10jZeResGuk
         8Pog1xEkHT8ynVC5aC1H53loN6TnpincREGQ4olW+iTo5q9hEDjZi0GYOANKYww9zwY5
         jGEQ==
X-Forwarded-Encrypted: i=1; AHgh+RowLr0dYwdlMUhmJk18JGslb0iprJ1OBY+/nYtkTbWm+PixdstIvk3Ag+94QhYQHBn8QwGbbHkkuWExq3znhzf4@lists.infradead.org
X-Gm-Message-State: AOJu0YwGoGRPOrQbIGxpB5Q5H4nT9QQukvuoRyI+BRaZlPT0xJ54/lz5
	BmWosvvtqUD42Ua3b6ipqYyVvTcsj7T6lMEMJDmEg0XoTT4H183hnqqoGk8/B13wWP2meztKRdv
	qjANsi8qDl/u/PCW5K9f+Ciq17JKRkQ==
X-Received: from wmby12.prod.google.com ([2002:a05:600c:c04c:b0:493:e006:3161])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8010:b0:495:3f5e:e7a with SMTP id 5b1f17b1804b1-496c6588a7cmr78133495e9.34.1785327211938;
 Wed, 29 Jul 2026 05:13:31 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:13:01 +0000
In-Reply-To: <20260729121306.1519473-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260729121306.1519473-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260729121306.1519473-3-sebastianene@google.com>
Subject: [PATCH v8 1/7] KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	fuad.tabba@linux.dev, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_051334_675689_AAE1F162 
X-CRM114-Status: GOOD (  12.74  )
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

Allow FF-A notification bitmap messages to be forwarded to
Trustzone from the host kernel driver and enforce the host vmid
check.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1af722771178..ecc13b795f2c 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -676,8 +676,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BITMAP_CREATE:
-	case FFA_NOTIFICATION_BITMAP_DESTROY:
 	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
@@ -862,6 +860,21 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	hyp_spin_unlock(&host_buffers.lock);
 }
 
+static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
+				struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, vmid, ctxt, 1);
+	struct arm_smccc_1_2_regs *args;
+
+	if (vmid != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	args = (void *)&ctxt->regs.regs[0];
+	hyp_smccc_1_2_smc(args, res);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res;
@@ -920,6 +933,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_PARTITION_INFO_GET:
 		do_ffa_part_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_BITMAP_CREATE:
+	case FFA_NOTIFICATION_BITMAP_DESTROY:
+		do_ffa_notif_bitmap(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.487.gaf234c4eb3-goog


