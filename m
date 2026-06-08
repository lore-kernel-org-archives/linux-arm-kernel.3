Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFDFCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgnNHCiglWyE1dRfo9bMlmn2W0ut6mUT68P6HrXKuCQ=; b=2K0GyrWWGMq9ifPJu/aKrAIuwK
	zS/BAJnGpsW7IugC77H9jmniaaiMhGSM1sWoTYwaL79rjwT+izUQwUsmB1YdLHDWLvFnlZhXXrpLV
	j2H1ZHbFweg7vJcsRRTSvMiaipL72dk+l2l6q94QyoqGNV/DblmsLR16Ig2C+XAUCdP0O+zUsuyvg
	EK4Cv7SU5AS2MXSNW2j3yE70TbaOwTHJzsuPDJEDWbGabP10yq7fqxLcCpUnumgVkvIZVCvIBJX8C
	MEgmPs6NFcH57NeR3ahvYdKen4awy7X7LfTsbUPy4wugudd4aOY+GaxVgitkRKpKetGJE32wPo6nf
	aPGBjJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGb-000000047Km-0MgU;
	Mon, 08 Jun 2026 16:56:01 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGZ-000000047J8-0hxy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:56:00 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso36932125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780937756; x=1781542556; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SgnNHCiglWyE1dRfo9bMlmn2W0ut6mUT68P6HrXKuCQ=;
        b=RfTWRDqhod0k9iXxgd7pv/WVyzbkf8/7V0FMPP11ibQS8hhsU029mmTLst9LptoEXk
         4fWqlZ3S+35V2Xzf7Z7LaanL8kWZwN/MP5a/QlsLDD6qvOm9b4r/dbtk2rzxf5f+sXgG
         Q6Ju6HNeLlUOnRiPCZwemxiIa9O1QNpAdRSnvP2BK/7U/BPd/baQVyDBo20r//OrpIrS
         PP6xiZpFpMQg67e5yaMASedFlwfSNY4CP7bAuhTRnxRMR6BiKdvCTv6WXUVraVKffxG5
         YYpKXVH+GtAS6vbITU3DDGoxuRCzccGdX0GsRlLRlACuemQwCYTAq0w7Cg/P7TUvp6wT
         NdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780937756; x=1781542556;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgnNHCiglWyE1dRfo9bMlmn2W0ut6mUT68P6HrXKuCQ=;
        b=IP3Xh3z8xWylGzz6N1w+Zkjnrh+63ElbENom+TlOKTlDHQlZA1CMfLXo8rcnrbtY/u
         Bhx6XNRfIlRwoe1sevCRNLB+NG21CjxN+q9D74AUMEBDjnkltpkcmYD7S+80GzqOxaTM
         O3ad0pV6s2/iMLevtR6xDwWc8JEQrAQMNDeqgTXlGYPfhZJ0zBMpTHdsULUz8LZUd7mU
         /983ZErxpTdUAolphmlO3DunhAJU+ko9GInik15VmGLDjlCp8auO1jgKkmOLcEnOT6Mm
         l5YL28LXdiHGyydjlsiueCkU/ECXrKqPdh/8VHgg0XavSEecvpW/ntM/bWxJOm9jfzzv
         RnoA==
X-Forwarded-Encrypted: i=1; AFNElJ9r4kwI1rJLrvSaJDKB+yTveECh1ISthV7G6c0wp1Jkx/ZQ4f6xykHm9vB9IIc8HTyqIoM3IrfI2o9WdGpzzpfK@lists.infradead.org
X-Gm-Message-State: AOJu0YwcKU3z3HP8RPrtY3v7XjDWcmj7DwLCEv75YGQYNGVasyCgy5Uk
	49Zjtbl0uUWhbAtiUb3m+O38UZcZme2MmgRHcb5vsn3hXP6cTu36cITxr6W1y84ukXkmvWivgMa
	XImgt5EkFBck5Jr7y5ZWUl9eikzBNLg==
X-Received: from wmxb10-n1.prod.google.com ([2002:a05:600d:844a:10b0:490:bb60:cdf4])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:620f:b0:490:b2c9:e284 with SMTP id 5b1f17b1804b1-490c2612c43mr262310685e9.30.1780937756547;
 Mon, 08 Jun 2026 09:55:56 -0700 (PDT)
Date: Mon,  8 Jun 2026 16:55:43 +0000
In-Reply-To: <20260608165549.1479409-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260608165549.1479409-1-sebastianene@google.com>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
Message-ID: <20260608165549.1479409-2-sebastianene@google.com>
Subject: [PATCH v2 1/7] KVM: arm64: Support FFA_NOTIFICATION_BITMAP_CREATE in
 host handler
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
X-CRM114-CacheID: sfid-20260608_095559_221742_15337E5E 
X-CRM114-Status: GOOD (  13.08  )
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

Allow FF-A notification bitmap creation messages to be forwarded to
Trustzone from the host and introduce a helper to check for SBZ
register fields.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 36 ++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1af722771178..c20d45191085 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -71,6 +71,18 @@ static u32 hyp_ffa_version;
 static bool has_version_negotiated;
 static hyp_spinlock_t version_lock;
 
+static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
+{
+	int reg;
+
+	for (reg = first_reg; reg < 17; reg++) {
+		if (cpu_reg(ctxt, reg))
+			return true;
+	}
+
+	return false;
+}
+
 static void ffa_to_smccc_error(struct arm_smccc_1_2_regs *res, u64 ffa_errno)
 {
 	*res = (struct arm_smccc_1_2_regs) {
@@ -676,7 +688,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BITMAP_CREATE:
 	case FFA_NOTIFICATION_BITMAP_DESTROY:
 	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
@@ -862,6 +873,26 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
 	hyp_spin_unlock(&host_buffers.lock);
 }
 
+static void do_ffa_notif_bitmap_create(struct arm_smccc_1_2_regs *res,
+				       struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, vmid, ctxt, 1);
+	struct arm_smccc_1_2_regs *args;
+
+	if (ffa_check_unused_args_sbz(ctxt, 3)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (vmid != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	args = (void *)&ctxt->regs.regs[0];
+	arm_smccc_1_2_smc(args, res);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res;
@@ -920,6 +951,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_PARTITION_INFO_GET:
 		do_ffa_part_get(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_BITMAP_CREATE:
+		do_ffa_notif_bitmap_create(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.54.0.1064.gd145956f57-goog


