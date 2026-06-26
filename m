Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AA6CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo7XiKMHdspymNDo6dR1D3/Gy/nMI+SU7DuWBG2vcCM=; b=y1E9bBreyh4NLfNpW0zpSZZCBa
	51kBQa53T9JlF3lX/+I4ekvuSat3nbuxabMUFdSwDm24nvWlOiEKLYtP2mYQmngq6BBNAS7lWwCmw
	MeaaDpCqeQ8wv9Xc1Gaft1n+Dxjs59mQrGy0Yi2k9tRnYSurtknVNffxm0/vSHcWWY4EPoF2edU3N
	p2SalEFVUldMHCZS+y2bhcQsyoHsRJt2MSW1ZpUxmDc3bxrydOnSpLI3WtRZ4BX4R+Je18sV3/038
	sKnqwVxqSaeCAsgy92iCREfHtf1H3oxeOwqUBaJSh9HyG72Sa8FIfMOsHmn+vmhaO4j1w/g5liPKZ
	qQu0e9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1GI-0000000AhbR-16pb;
	Fri, 26 Jun 2026 07:46:06 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1GD-0000000AhXU-2oVg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:46:02 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-46cffa7200bso392210f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 00:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782459958; x=1783064758; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jo7XiKMHdspymNDo6dR1D3/Gy/nMI+SU7DuWBG2vcCM=;
        b=VTNMB3LENKYxbU7TgpZ5Njv9+Y813tV9MD0Vea6mBkTgUprZC7B8nw+bCCbt7Jm9XW
         AjT768Ygyy8TByYHlPmusl8POGaDTG5c+ayrYH8W5M3QhUxPiHDxzM2UpgH0j53/DdEL
         FrkEfr9vpriYwLuImROK+9D8unIItMzr5UEzaIa4qH5xqeayEwcdAdH3ERApOlhyMphY
         3o6aW1KcccXfSACsU+iJ/9DA7Ys2XAbtHZ9rHZBIVgjTtlcNyhMD8G++RQ6+AwySSa9R
         Khu2Zll9Wq1g61v5IieF+0w7zv4wacKDPHkqGhecJLcMOsmybwaU8jZIIVlru0O7kyCT
         pCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782459958; x=1783064758;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jo7XiKMHdspymNDo6dR1D3/Gy/nMI+SU7DuWBG2vcCM=;
        b=rvfQVFIpGdBJQ6FGmApDbOAu3rlYtJxZQFRoR08tkSKsEjLqfOs6Cprni6v+ZVKloX
         eD+9scsrwRyl//oQIqH772gfnFqegBim462jYcwNR2rQkT/S4RtnC2lRsjFjVuqaCCrN
         MNC5b6crnrELv52nbV9Dhtvu1aNYGsMDPr+5RGdr2xSNCDhbZB61Ga7yfQz1Cg3DKYyG
         tQNUns5M9O7GG7i4HvQvGOOrT5O2vyeocJOwMpbk73oKa+W+BFgdCsI4A4uw+EwvYCIs
         CiC/BM8sDNffxLy+yeQgfgDiykVmKsAiUge3eBX0S/89tBatRZKOakkGV0hkbpGYgca2
         0RcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCxGrXG/FvRp4lK70tpdbTuAMfbfQlHMxVjphYnqpFLNNHCFxMSTPeSCQTkrJAYoocdQb/j0P5HfHKzqXJUfz8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9UekeGETHFPyjlqyhlrzKk7mQluktUs3xip+6N5CrQctLKVOQ
	ZYnodtb2eqtvjUrB8nO8dyLPCvBgU4XXuhFJw8JUefrhXVFr5kaIJ/oq91cLYEZe4hI5XHth7W9
	eIpgUXsg/F3FYPUQFqu8xFeG6ipXniQ==
X-Received: from wraz16.prod.google.com ([2002:a05:6000:4690:b0:46d:a402:82a8])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f4d:0:b0:460:395c:7404 with SMTP id ffacd0b85a97d-46da9aceb40mr8969961f8f.20.1782459957735;
 Fri, 26 Jun 2026 00:45:57 -0700 (PDT)
Date: Fri, 26 Jun 2026 07:45:39 +0000
In-Reply-To: <20260626074545.433234-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260626074545.433234-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626074545.433234-2-sebastianene@google.com>
Subject: [PATCH v6 1/7] KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
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
X-CRM114-CacheID: sfid-20260626_004601_723656_149E17EE 
X-CRM114-Status: GOOD (  12.03  )
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


