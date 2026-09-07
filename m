Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8187DC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0Sf8m75gFeh91WC+y7QYQ8hJssugbj/b/PWhI9KP38=; b=2A/ptljExIsnzJMRX0jiY/wtEt
	iaKnm0+yMv2VEWF6R9Yklp07U318kKZhKS9/jHUTD2EXxVyheaJ0Tnxvvd+NtX+xLO5ypCBgS9/Rd
	PU++JYIINb9ZANaNaZKOnDAloxPvbggYGAug+ybigqMY+TSedXtqv5ERgNhz7rsQwRwn18GGmdzGn
	QZ+VEOMw2diVSTIMrMzErJ5t/KHD3PXniR6VcqFkw1ClGkTkjDBSl4EBLlCJID5xBDN31oF3m+AQQ
	/Kdle9DIQf5oBgjHN8ETsYzWCchdqYrOr8/gardK60bdXkURdbfY+WVTkECTqcppp418NM6uWOCAm
	mHvhzS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d0Z-00000007Syn-2cI1;
	Mon, 07 Sep 2026 17:19:51 +0000
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d0Q-00000007Sta-1PpP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:19:45 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-6a5f9a387faso4370728a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 10:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788801579; x=1789406379; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0Sf8m75gFeh91WC+y7QYQ8hJssugbj/b/PWhI9KP38=;
        b=t/XPZ2IwVUWgyma04xRrJ1ZhQ7Aieih5VShJdCYDRMXNBTKnSxj1K4/nk4a/ZyCHRC
         KyyLQrW3lP49HMXdeXRSeqAVG+VWUORRw3cL2J2XjzNmfoIDcVEoMX4K/CMf80L+yu8R
         /ngk/Y+smUOwku8HkSe4129F14ZcbM+OIWKDbuSUBYJIAhd+SB93zf1IA4cZX0wpAjat
         IHl7quL/enYcxn5XQUc+2xF9w5YRXTpqE696oArYGvyY+IkTycnYt6yQ9daHifu28N4H
         DeUNS7zzZLlT7rtjmyvKuqaLfH+EehvNreDbTPJ4T5F24MohbW13FuTMYFmS/aszvu9i
         2/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801579; x=1789406379;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0Sf8m75gFeh91WC+y7QYQ8hJssugbj/b/PWhI9KP38=;
        b=tNG5fR0ahIMt+nCO4+ZbYe4N95HZ97kIcGKkg8888fRNyUUS3gUYd6Cre1m3O/sSn7
         8tEVaQKoCoKCYfCFkpzdc2G9Snu4qmwwfBn6fZm7DEwf8kTfBGebhXN5sDYsA5DSvSjP
         kihDBQojoagrP0DvkR8mM0H+ZjJ7wBRsBN9j8Zs39ySzGXuYz2fV4rZsqHC8k8PeiVlI
         y7LQZSfRkgqfrTOX8ag0sJ99VwV3Q6hDMEuhAyW7Gm+DnKrEIAFnpnRgFQAHLNG9eEGI
         GnaXJU5XJKSH/kNPQI7ZyZC6kzLV+drocRm6l2yxRF/YBNaa3Piq6d0cJb6ENo6NNM5m
         hcKA==
X-Forwarded-Encrypted: i=1; AKwUvByIUnm7wRMZThb0NhSoomxqXqY8OnLqKZ3Lcs7JEbRSXMX0dC7eNU1DKew3olPS/ZTLko97JhKW2hI1TL8QdiBW@lists.infradead.org
X-Gm-Message-State: AFuF++lFruyK3F7qdxczN6USjePW2v+cdmiNXIu5OIjA27HEeyDvRZnV
	h+w4oWUgWpJ0IPAw/bsRCJZCjlnf08NmlBBNDJwFjBj3wUbVn4Ka08H1NWxYo2mWQB21r1B1F2/
	apXFLiV0UnRCl3tbN+6RcyLtnVOc0KQ==
X-Received: from edyg17.prod.google.com ([2002:a05:6402:1811:b0:6a6:781e:6d4a])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:13d1:b0:6a8:30a:7ceb with SMTP id 4fb4d7f45d1cf-6a8030a7d90mr5253391a12.32.1788801579063;
 Mon, 07 Sep 2026 10:19:39 -0700 (PDT)
Date: Mon,  7 Sep 2026 17:19:24 +0000
In-Reply-To: <20260907171930.4037166-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260907171930.4037166-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907171930.4037166-3-sebastianene@google.com>
Subject: [PATCH v9 2/7] KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
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
X-CRM114-CacheID: sfid-20260907_101942_406696_57DA304D 
X-CRM114-Status: GOOD (  15.42  )
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

Verify the arguments of the FF-A notification bind call and forward the
message to Trustzone.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index aa82c58380a8..89872e12f9d4 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -42,6 +42,8 @@
  */
 #define HOST_FFA_ID	0
 
+#define FFA_NOTIF_RECEIVER_ENDP_MASK	GENMASK(15, 0)
+
 /*
  * A buffer to hold the maximum descriptor size we can see from the host,
  * which is required when the SPMD returns a fragmented FFA_MEM_RETRIEVE_RESP
@@ -692,7 +694,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_BIND:
 	case FFA_NOTIFICATION_UNBIND:
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
@@ -891,6 +892,27 @@ static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_bind(struct arm_smccc_1_2_regs *res,
+			      struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, flags, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (FIELD_GET(FFA_NOTIF_RECEIVER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (flags > 1) {
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
@@ -953,6 +975,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_BITMAP_DESTROY:
 		do_ffa_notif_bitmap(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_BIND:
+		do_ffa_notif_bind(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.979.g7e5102b832-goog


