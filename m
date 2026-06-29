Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53646C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo7XiKMHdspymNDo6dR1D3/Gy/nMI+SU7DuWBG2vcCM=; b=RHBNTtZMA2FaaqrBmI896uksT7
	0zMoSQsuRoannGbEqRyRdNwch9pKINy94DdXFBEWmooF8EGYVJAMIiXYDQ3FRAeqPZ/6Fy/iOvTM5
	iaYLUqgdK+bZhwlJeTYm2NZt5QSffAswcwi55g+wGXinBWThlbL68Svfg+OIqa0n6RIb7O7pbmi82
	qGV02A7zz6d4DkCjEeMy15vr6cPw1qM9uYt3pzDCRG8IB0vpxhfC2UPdD7+WwQbhh4KXEzNUxhoKT
	ALPmJKStlKFwo+3mr8cqgPFCDGTO2HSnfYgU/H+2gyJb1uYhEWlqj9Bw0Sc1ufn17E6TG38lfwTXR
	1xKDIvXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8PY-0000000EBR2-0Bop;
	Mon, 29 Jun 2026 09:36:16 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8PT-0000000EBOq-3zpj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:36:13 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-47416fc1674so375999f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782725769; x=1783330569; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jo7XiKMHdspymNDo6dR1D3/Gy/nMI+SU7DuWBG2vcCM=;
        b=exW6pz2ZdSY3mcN3SpnsaAaG+Amtylr363fq2C/H6HnJOhrl6GK70tdmnoowNzSumP
         mQ2a95u87l6SP9JtdtTw7ZCfjmP5BZKAB2wssaJv0b013Brj5qtqjosStiRprvPzVgkL
         HtMM4ijBHzlkF+ZN+oAGRXYWkkJ64br9UyL7YdPfDbxBW8KxB5BdArUU6Tke+UWwqQwN
         BBxvKf8CmyfKIOD5HZpq9vhZIFZ2K8cSMYQhHS7VFO8ryMbA9S4kqE2jgLGGWauRqqQ3
         syBER43ZqevOwZTipDEXHyUnXYvPpr9u9J/x1irl/DAuo9tpMCsbart/l5/j/weQPYdf
         ci9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725769; x=1783330569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jo7XiKMHdspymNDo6dR1D3/Gy/nMI+SU7DuWBG2vcCM=;
        b=UyvOTqcwd3ZP5BQErlDB/nnoQSCYJRf8fv9VxrPO61sz5+gnV3MMwPEn724Bvf7CIv
         AVSaYxWfeaDZr1P5/HjHrP9t1Nzb5yqh3vXqsBLcb8ecjgFuSvlVZHlpQmVZnI2EqTlx
         Ng8I/eaoYnRg8034t97NiuiuR+NCla++82KTrss4/BSkpvc2QtaCNbP+ig4dlfHpyXRY
         hUv8VrbzqbBDvc4agX4Rih7aRLyJCPUN6xyEgRyrYTaWiIiaSigw3TbMfTM3epvAwniq
         LXmuEw4gby1RBGC9yLtcdksrP/SzLY31U3Qr70i7N/670Bdd/Lf+JmSWN6BpjCqKn2/y
         ExYA==
X-Forwarded-Encrypted: i=1; AFNElJ8xccs0TvLlYzeVvUDQL/MQ1s/gFDOek8b6JeKGHTM4ZDgoFNMgYeyVviapT5M55CGaHxu5gNMaHnRIxuUZkxrf@lists.infradead.org
X-Gm-Message-State: AOJu0YzwAnl/Fo2L3OLafUo+53i07QnYSqmoohOp1MRkQ2SdHl/BAPxz
	czte3ZA/5Dym+mTFMSPewNmDAjaO1CzAoZEDhaGE0+/6YMe6Opys4vOeYMvBgtwZqUytJqJqhpp
	mIG0dyNRpyyrVCNw7nttbd/oVofmF8g==
X-Received: from wmbes26.prod.google.com ([2002:a05:600c:811a:b0:492:61fa:f2ce])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154a:b0:493:a535:5527 with SMTP id 5b1f17b1804b1-493a5355530mr93865845e9.21.1782725768465;
 Mon, 29 Jun 2026 02:36:08 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:35:52 +0000
In-Reply-To: <20260629093558.2425257-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260629093558.2425257-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260629093558.2425257-2-sebastianene@google.com>
Subject: [PATCH v7 1/7] KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_023611_996951_02D61A7A 
X-CRM114-Status: GOOD (  12.65  )
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

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
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
2.55.0.rc0.799.gd6f94ed593-goog


