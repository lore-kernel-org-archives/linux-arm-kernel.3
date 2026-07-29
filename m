Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA141C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVYKMhOgYVvCC+zk5/t2FdOwyXguvLtb1E7ngjK3egQ=; b=nd4HyayQLmespG2RMFbK3OFBKN
	nmen4lufyWYzkq+T+Jr+N950UJJEm1uhNpPiVsvROua7GAx/QpGWVFF0GSh+S0VtVwbzi3h7fZvMZ
	mAFVB6bIIrfzId8XjaEvsQlshd5lvi/GBVwN8EKBaRsOzvqB/MaE/bojXZI4iXgPaD6PNKXtKEREn
	Hdgx9CRW6oa7VuD77ocL4bOzLHv3fov1P2DBG9pZu0NZ1FOSs3QkbyAovV9aEQfar7ZKIfgO2HBEg
	0M2GBLzNyjCai3Gh0WZriYWK6b5le2JNcQaqwQtFEC4tSkU3rH+AmW3eqvtruZuKsJ8vP1WEHqmNT
	qXXyuSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3AY-00000007qmN-2aDu;
	Wed, 29 Jul 2026 12:13:54 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3AM-00000007qeD-1ZnP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:13:43 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c1f74261f67so119579166b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 05:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785327220; x=1785932020; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVYKMhOgYVvCC+zk5/t2FdOwyXguvLtb1E7ngjK3egQ=;
        b=KLQhpAQWaDrkKQDSPcgVj7lgr2W2AxnocnFnVyMf9BUd72ZrZZ/GTLaU2NWEFeSEQ5
         eg50ZgeAKpOdEsC7Fe0fbHLwTb+bJapHNwSkT2EMXcZ2VCDrMrUTAxikTdbhF60DKfqd
         lDUDTYgBI4YZYtWWJqtDiZk4KgnFlsAbAo/DoHKDvw7W9EyH2ft1WpaC/5ZUtKIBsU8u
         OWu63MVDV3/bsoMz+6Y0sGJEpmTS6Am+kVUum+/6gVfT8zgjXAUj+NMb0kxXlmUvK36b
         n0RWlRUYqYbbdGaPZQV3CyW9k1CftPcFVl2zgzlkTpUdVXMPi8zLH2sujOt6UL0AAeC9
         0K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327220; x=1785932020;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bVYKMhOgYVvCC+zk5/t2FdOwyXguvLtb1E7ngjK3egQ=;
        b=lzr7FPjyUpDNtGVcjoqWAqxiDukxbIiA1kd2RoczbCJzmMDECs4cKt+8JLUTWGyBiG
         CWkmNNTMP4FPB4s/6V+zUmYOy+5nbNuKBRYiyMqilz0Kr3lur1lk1WkOtSzuaAJV6v40
         JP7ACANNGHe+kK1D+zekbN3jCQ9sVpE7kh3EC/TM1axaYGEDQiAipJKyFVxWafMYFC5P
         YxoF4Z82F1VZm6SyXqC9TPuGDaJFaQrm5IG8MtWJNhBnOdv4zVuCDp+Rm5iHKxFHNXmK
         xiazgr28jDYd5ywKmoBe18faof+J39kpQ5q1pmIHGQAgO2/JivxqK0I5Y7eb1kHkTNpL
         /FJw==
X-Forwarded-Encrypted: i=1; AHgh+RpAAezzsZLIrFA/05QjNv/kH2Pn+qpkyX5L/nLfwjwjIfmunhwIGWAUEQOqYuk0cDMKAOCb1y6a+eLkVHb4+ceC@lists.infradead.org
X-Gm-Message-State: AOJu0YxCbH9iiLT02noavKpCSl7ztcu7pP9iwaydcnv36YiwUq0O23kl
	TzWCnKym+JtZC+iwIlerUZ42BqV6TlfttE14AK1upDOIWOxNyYTY0L0UfGoLEthT78173iWOm3A
	BWPekb5+D3+hY2/7m2ZlHIUiX/uuCKQ==
X-Received: from ejckk19.prod.google.com ([2002:a17:907:7673:b0:c12:533f:6b88])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c80e:b0:c12:34ed:da14 with SMTP id a640c23a62f3a-c1f72504745mr341409866b.64.1785327220002;
 Wed, 29 Jul 2026 05:13:40 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:13:04 +0000
In-Reply-To: <20260729121306.1519473-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260729121306.1519473-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260729121306.1519473-6-sebastianene@google.com>
Subject: [PATCH v8 4/7] KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
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
X-CRM114-CacheID: sfid-20260729_051342_430736_3A0BD88A 
X-CRM114-Status: GOOD (  13.86  )
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

Allow FF-A notification SET messages to be proxied from the pKVM
hypervisor to Trustzone and verify the arguments.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index d52d7c4d5e7f..2bb16aa414f9 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -43,6 +43,7 @@
 #define HOST_FFA_ID	0
 
 #define FFA_NOTIF_RECEIVER_ENDP_MASK	GENMASK(15, 0)
+#define FFA_NOTIF_SENDER_ENDP_MASK	GENMASK(31, 16)
 
 /*
  * A buffer to hold the maximum descriptor size we can see from the host,
@@ -678,7 +679,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
@@ -917,6 +917,27 @@ static void do_ffa_notif_unbind(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
+			     struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, flags, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (FIELD_GET(FFA_NOTIF_SENDER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (flags & GENMASK(15, 2)) {
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
@@ -985,6 +1006,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_UNBIND:
 		do_ffa_notif_unbind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_SET:
+		do_ffa_notif_set(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.487.gaf234c4eb3-goog


