Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCD8CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3D0xuQZnlofHgVx2W5KKpDjK2IflolNZaSZteTp/rM=; b=KTSs2YeO1ietQayBSE3seGj0/k
	yvgR/0tQ84b+w1hXHlQuqtrz1qeV/tnvGCCIyyGdnsAVZbff0XLcdNLFEwWBwRJT7oGDNV3HNtdhc
	o11wpLAKmHYt4wm9aBgHUpEbHni38hdDp0wLMu/l/q8Aq0FM7zzNTbdLBjxHTzwB9+RREhkP4OGi8
	3pVt6RF0wdE5tCeg5q6VTJpDmS4PaSDWF3ck6QWXc6gYKancNxOoP1SoBJkS68JjYJfAfnSUhk0bE
	N/IEoxByyJxr1/+QbEBi0iw5Kjy4UQPt6Gp2oDFL6XumhtdlbpOZYOJ+hH8k+e5bhLL7YGYTZ7Iq+
	6kOBlhGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1GT-0000000Ahk0-3f78;
	Fri, 26 Jun 2026 07:46:17 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1GM-0000000Ahdv-2eq3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:46:11 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490cc1ae292so4002915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 00:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782459968; x=1783064768; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A3D0xuQZnlofHgVx2W5KKpDjK2IflolNZaSZteTp/rM=;
        b=jS53aQNVU+3dBjLdyZQu1k2E5aZcfb8Y+2+8MMBRimWKvYZtX5VYEOide1S0WOSTum
         81ciDvfCqLDvOLazKe3iuAwng3VH0YCqHsHYnJkmQEZuR82I3Ue/QUXxdwlxI4hN1xey
         95n7iOprj6RjluZb9jwtGvaXlVKML6IZ2kOH/WUd0yOo8FqGTcfBLg5g2n7rSX4/p0G+
         oZjv24yeZgPl55Dyxun/E5pEshKg7h+izAc2HEFmABkTFnsmTc6CknFVDs/mWOAvXmEd
         iYoNdDevukcX4nm1ks2zsFojVfoNECoHsCwQqYkZA8kYYODVkG49t/7ugewxYLk6szyu
         xi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782459968; x=1783064768;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A3D0xuQZnlofHgVx2W5KKpDjK2IflolNZaSZteTp/rM=;
        b=XsmIHNu6stZPyW67wPdLxM5hNZHEAf8xmDw/gUdQ+4CrC+LfCV27Jzll8DJNp3EuRG
         +H1tdtTQfurJ0t6BhRPwM87ArmreCZgZWSiq0p98on8TZZqOKdoR2NrSis65ax4hdjsY
         uRgre9Vb/GIrmPVTGoiJBpq0icJ4hepdqUz0YZ7RoxAsGMXpeFL+4v1s9BuOxJ51PHZo
         ZXnofKj+zkaCjEzuJeY8JUmsJ4NHNV5xKPyM0FOq3Q1AhVhxtA8rgg8vmEMhNjs+mXTP
         rHhMRS9A9CTkI+QshYlbmn8OiAoaUkj/jFbNzgoBG+59yqJqSPg0/j4HhgLuw6MGXQo8
         f6ew==
X-Forwarded-Encrypted: i=1; AFNElJ+qxc8HBnDBk2sEmJYZglDYnB7IT5XsbcJ2OrQUPZMngw/ZBxwdoXF6jAeCxVjpWWv5c9vsxZfsaXaD1bcmZxsV@lists.infradead.org
X-Gm-Message-State: AOJu0YyBfKoKd6nc1U3/T5nIYeYfHaQK5xHZGN+lx7gwrqK79Gv2g7hU
	tSKk6CpLNLt1+HnsBe2gUcAjQGjYiqXmxqmEVjfMx5ZcJVWQviGUUSH6N27X0hSknN2j3zOfHql
	j6kJzYuwmN9K4dEKWXjhJrZ9Yx8D7aQ==
X-Received: from wmbc6.prod.google.com ([2002:a7b:c006:0:b0:48e:6f63:7624])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3587:b0:492:4871:7e21 with SMTP id 5b1f17b1804b1-4926641b4c3mr65384045e9.10.1782459966937;
 Fri, 26 Jun 2026 00:46:06 -0700 (PDT)
Date: Fri, 26 Jun 2026 07:45:43 +0000
In-Reply-To: <20260626074545.433234-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260626074545.433234-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626074545.433234-6-sebastianene@google.com>
Subject: [PATCH v6 5/7] KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
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
X-CRM114-CacheID: sfid-20260626_004610_695390_B5D88D86 
X-CRM114-Status: GOOD (  11.97  )
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

Allow FF-A notification GET messages to be proxied from the pKVM
hypervisor to Trustzone and verify the arguments sent from the host
driver.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 2bb16aa414f9..c22fe4514741 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -679,7 +679,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
@@ -938,6 +937,27 @@ static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_get(struct arm_smccc_1_2_regs *res,
+			     struct kvm_cpu_context *ctxt)
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
+	if (flags & GENMASK(31, 4)) {
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
@@ -1009,6 +1029,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_SET:
 		do_ffa_notif_set(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_GET:
+		do_ffa_notif_get(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.rc0.799.gd6f94ed593-goog


