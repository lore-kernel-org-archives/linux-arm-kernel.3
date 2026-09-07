Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE502C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nteL4njDpbIytNAvu2VP8USt+sQ1w/IhgUr/WfH7fOI=; b=LkJpJlc4Et/nJkM29biviiH4TW
	HS05q1NJk5pPouHAXGM3cz5YLfqtKuiuIvCetwiumag9UvimW3hXrBvdLzfhzUCh56JtQoHbVVmbv
	WT9aZLxz820530SLDjq80RwW+56I76lzPKoZNFa16bYjZPRimDLydK5yVOnUOMHgYnL6Ms/eTwL0a
	TQl6jy7ZxzQ+khPBL4K5i6KKsX/l9GG1pd2nMNlAiurtHfUeseha5BJ+tTJuJ/xVW7R8gwJPiJTUy
	1p2dd+aOJPyb2pTPn1EhD3J9vRKMoiXoNX0dtBu2xL70qVc4Wq/WMJykSxOQRZXI1I4HYHICJFIlr
	zJRGiYKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d0W-00000007SxY-01SK;
	Mon, 07 Sep 2026 17:19:51 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d0O-00000007StL-2AYY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:19:42 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-499b99a8a10so34502575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 10:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788801578; x=1789406378; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nteL4njDpbIytNAvu2VP8USt+sQ1w/IhgUr/WfH7fOI=;
        b=qhksTF964inayz2RQ8ert6T2nZAhhJS8CnmMxdJRpo+BKiBKYa6K03uo7UQEi08ksF
         +Lxa2WmPFPYZD4+78ghb83CzoPlzDdgveDiEarv+40QqgASQAGFslcxEz0iOmqoCTHB4
         AMqMfHA19K/0CyYfPX2MckdRdXZi3fmTQD9ra7SeiLphWtn1vJBaXR2ItGWMMmzZYxcl
         Nj9SSqsmU6jvTdmmiktcsk02kAj8NaeDpASR0G9AWiCUjWevbfqIZJVGNS+665PGDjgV
         oMMfaFrhrWF6rfH5Ej6lp1qcf2EQV2plV5e6Uht+TwPBdjQUuCqJBe9HxinUnTkpwfqX
         13SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801578; x=1789406378;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nteL4njDpbIytNAvu2VP8USt+sQ1w/IhgUr/WfH7fOI=;
        b=Cro65NFsKHIqX2Fw+lbSVeexHsFNIu9CFcybErJqrs4BmA4j3u+UrINCSNBIB4Cv+K
         nAgd6wpSeMkZV1OepaNU0NDdJ4EOA7PqoDHVpVdxmYblfkddH1B8VF8lVbZksNuzGnRs
         UtHIRlGtm7eDO0q17TvlwBsJWZ9XjfNEOq4O4hKFo+0OHUnPO9gL+8qXEp3wc6oiQtJs
         o0LAmvjBJrdG2A21Imw1h6fwwC4a4yqzG6KeNIHy/k4TxATAFIt5uE3dZWCD6sHZP8Qf
         Q6WxuV27gMXqvbIJ7EV3jvs56NYvXN3qI9+mUrNlM9PzlsDj63+aGBnaoVkZhEV10Qzc
         lNcw==
X-Forwarded-Encrypted: i=1; AKwUvBz40sOy+kKVzLNSA8tiTyDtnIXy/iQ2in7AGet6qewmC1+MUuAPzMjrzhAgV7f8Kv5kDHy+JS4G5d08YJuhK86I@lists.infradead.org
X-Gm-Message-State: AFuF++kF/fbRSaT6IpDqGTx1V52SPiWfCmHjQxraZG9dsOvodfD3PQCZ
	lOq1wK4G6TyJ/+3zY6IC4voCA/zAd5tvSlcPJ0COLzKHiyyi61e/leJ4EXaVnM2ccKlWM9Lw6p4
	t7Mlwv6LxGdcdEOFUXmpo0suGjIjxgQ==
X-Received: from wmpw23.prod.google.com ([2002:a05:600c:997:b0:49d:74b:4e06])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fd6:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49d1754ecbfmr25030805e9.5.1788801577617;
 Mon, 07 Sep 2026 10:19:37 -0700 (PDT)
Date: Mon,  7 Sep 2026 17:19:23 +0000
In-Reply-To: <20260907171930.4037166-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260907171930.4037166-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907171930.4037166-2-sebastianene@google.com>
Subject: [PATCH v9 1/7] KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
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
X-CRM114-CacheID: sfid-20260907_101940_569954_0393F805 
X-CRM114-Status: GOOD (  13.54  )
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
index a327c2bbb6b6..aa82c58380a8 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -692,8 +692,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BITMAP_CREATE:
-	case FFA_NOTIFICATION_BITMAP_DESTROY:
 	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
@@ -878,6 +876,21 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
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
 	struct arm_smccc_1_2_regs res = {0};
@@ -936,6 +949,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
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
2.55.0.979.g7e5102b832-goog


