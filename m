Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95861D6D24F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 01:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnpBHLYkUch4fOHU4hkMVn/ClZoihkAVUxnB9ZaI9Pw=; b=NnIuDN1aJFMfwLMPLlsfxpCi6A
	YbwG0d+wgLXomCv8pcJ3xNVNRWS2G92tl6W91FewLwQzKGWEv/XMulJfNlUh1Qbiu5d+tki97gYGB
	JsWsw6oLJT/AUeXoEtsMssfL+Ef0ip5rfvT5N0Exiru958bvSwxbLZk8ka/3fwwfnWcFht+pAp+h7
	3hQoeIvEcPoxyp5/QvK0Jj2RU2vFBDdfmbVwTvnRk6FgZRmMlskb8/XuigFM3EKY/l4gaTz0/gnID
	V0pz5qcytzpAwUpnC6d8MixGCVONQaynxY10M/mZevdotkCJj0s0zogWmDfwthIfEjmK7Lqef7n0m
	JR8z+eLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGStp-0000000ENt1-1fV5;
	Thu, 28 Nov 2024 01:00:53 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSp4-0000000ELp1-14ax
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 00:55:59 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ea21082c99so271522a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 16:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755357; x=1733360157; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VnpBHLYkUch4fOHU4hkMVn/ClZoihkAVUxnB9ZaI9Pw=;
        b=uyZytIfV4tgcRS7pBUro4SJNyYzDfT8W5RYRcTPMrpSiPGNevTDuVIwB8vxQIPkGvV
         5QGQ1ysQfo4UkfAjnG7606jetHnd0D4Pv/zTCk71/VTpew0hTNCMdAMk4cyf4gDjvhiB
         lxJ6jOMHsr6UtIExwSOsk/Tr6PJh+XbK8m+VaWTNpRm+wzWfIGcaww4FEfEiO3L+g3ZN
         XF45TdVQpspTCo+QDa51A4CSu3QKYEdIkKEFwQ5g5oMcnCtJgem0SECpUJXbD6qvCxOh
         okRsgh6/1gIBVzThGGJTT+QKIzHdOzjKDvQMIPxIfP9APRxu1HGvYaauxdkvANfJG+qV
         MJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755357; x=1733360157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnpBHLYkUch4fOHU4hkMVn/ClZoihkAVUxnB9ZaI9Pw=;
        b=Ly5XPm3vwFWur83VNF9qNSCAM1aaIvNK5yNXe/vBdB+zY8fGf411HNZDQB/IJLM4Q4
         fUQNImrSkbs0errZlfCg4PzvDYB8zOsGyNswIQpTgBrap2uIlz/CnRkxqiQv1h5H2Cax
         p/eRV1L/XQtATri9/wkFYcWcN08WFX1ytUaMBrGLegkOO63m3WnohUuo0FsWSvFhZ8sE
         LNT01+cvsHx6hH5gj97u0why3smM10xjC7QBPqOX7C/AquolwvCdQlsq3A3L6Qn+jaqP
         VfaHKqcgY5ntfImjgJCYnnyekS/u70cpbjUHNyLLRiwp8BTLW5wq52unFk+DlEFUJMFJ
         1Tmw==
X-Gm-Message-State: AOJu0Yz0LpthYeUERcjnASt7dOdK5XKJ87ZHLAkCnbtowNvsKro0WxgK
	X0vshTH+zZuCENoNqOOOPZjVbOtnTcwWiunqhfo7Rjlc0/AYbYPlVgaeuoY3XrPQLVXNYj2MGpe
	zFg==
X-Google-Smtp-Source: AGHT+IGNjVu9IbM8M8x4FgAf0ptLY31wfGw0nWSewj8xLv7iHu7ExU2Pbfe7utzxkDM6gVPdI3CzS8OquPA=
X-Received: from pjbsc10.prod.google.com ([2002:a17:90b:510a:b0:2ea:d2de:f7ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fe06:b0:2ea:83a0:4798
 with SMTP id 98e67ed59e1d1-2ee08e9f0f7mr7211038a91.3.1732755357079; Wed, 27
 Nov 2024 16:55:57 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:35 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-5-seanjc@google.com>
Subject: [PATCH v4 04/16] KVM: selftests: Check for a potential unhandled
 exception iff KVM_RUN succeeded
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_165558_312418_C0DE30B4 
X-CRM114-Status: GOOD (  10.97  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Don't check for an unhandled exception if KVM_RUN failed, e.g. if it
returned errno=EFAULT, as reporting unhandled exceptions is done via a
ucall, i.e. requires KVM_RUN to exit cleanly.  Theoretically, checking
for a ucall on a failed KVM_RUN could get a false positive, e.g. if there
were stale data in vcpu->run from a previous exit.

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 480e3a40d197..33fefeb3ca44 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1648,7 +1648,8 @@ int _vcpu_run(struct kvm_vcpu *vcpu)
 		rc = __vcpu_run(vcpu);
 	} while (rc == -1 && errno == EINTR);
 
-	assert_on_unhandled_exception(vcpu);
+	if (!rc)
+		assert_on_unhandled_exception(vcpu);
 
 	return rc;
 }
-- 
2.47.0.338.g60cca15819-goog


