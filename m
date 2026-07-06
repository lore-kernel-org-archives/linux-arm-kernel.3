Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3C3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trWQgM2b/pmHXMfLQPuDpI6xP9R+E9nF5QwkDxcB2UU=; b=VS4a8JnuaVD/bir5IEa0zD4zWY
	nRTyZ5AjHkmbfNlM69kvfhUTn3fttJM7owo0euOWNSpTuZZENtwfFwXLOHr7V30tAwFAp+IdeR2LG
	RqUNb2xlIXH+TGOwfr5XGhMmhrBiRgQhZdHmnjZm7PduFbf46/mz5637CyBQs30lRzQth3/grn4Hy
	RtsWuc0VDKIsF45K06xg2bCYWNsdb/WnFBxKKFThKbJ97bNUgmP3vnJ+xLr1gTi5xN/CkrTihMdwJ
	LIhditWcC0wtbuhLAgrZeQxAeG0w5hBSgz5HviHHryoPMLyoSEwVJNmZoVhU3pDy8ULoUe6nA9Yzg
	lFxNhAiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnX0-0000000DG7H-31z5;
	Mon, 06 Jul 2026 17:54:58 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWi-0000000DFg4-109o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:54:41 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-493a6fe9ebdso17703135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360478; x=1783965278; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=trWQgM2b/pmHXMfLQPuDpI6xP9R+E9nF5QwkDxcB2UU=;
        b=KGDpv7weq9T8g0+6MqvgX3QxR9EWqissRaX48gGl30cnaYek7mJgSADQ5DIRW35Jo4
         JGizBgyRC93hLHTohX0FE+W4z4oguVCKz8CL3J0IZkFQ25B6+bA1dAmSDlWLiKeQfr6t
         2wi+T9prsSAg0RPNKZ0PlhsUnstRG6Hs6t7znYijMcrxM2YAO0ujO7qPVBNRN9uXZdx3
         k6w4sI4337BYUIYdMZf9Og+VYrQGuT9yMbJpE1bAv6daT491qfAU8AN5xqhIFxKWbPAq
         +eej8yBJAFNV5oGnNVGTJ4NbgavJuu7EuS3wCab+N12YBAZxVKiuhAvzGc3li07XBEy4
         dM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360478; x=1783965278;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=trWQgM2b/pmHXMfLQPuDpI6xP9R+E9nF5QwkDxcB2UU=;
        b=tVLvAHmXvVg3vwCJvtrRyzcFPwPYoyE0OSTGaoouqb2/O/XhY1ewWO9yADJ3pWHdr4
         p6YaDUiSxOn3WapjN4M7+DWW59fI813ibunNZ2DYh6xa1AZJAeP91asph2270geBNAqx
         VL8o3z6CoGYnMauLE8s2+B45hmLC+srVCKrJdDPVO+Fvzu+mnYbiGOB5sbjhrszfVkVs
         93Gv7FBEw/DNZV7QOKjX1aKB5+yyWyKxQ74Z+9aThD3Usq890EzHva/37PHF7H7+DHbl
         1hCOUD2aq7Vup1W/Aj5TgcMG2pO7ZyfFg2lmuupV2vAl2sccqLzH2dTp0NFoChjKwmT5
         Jg6Q==
X-Gm-Message-State: AOJu0YxsQCbjvaDAeYDbyvi4vZIYycdxim+Lp1MHNqjWjfwCREi1NUwE
	joS9ERcNp1Gbz45j6DjUgqD3Nc8k+hV1h2j1yEzlFSjYnrikWy0oWKfslodsbiApaOql3VNEk3I
	rxMhNzwD28IK9m9/0v1Q7gg==
X-Received: from wmge10.prod.google.com ([2002:a05:600c:13ca:b0:492:49e7:fff3])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:c4d5:0:b0:493:c633:9cf1 with SMTP id 5b1f17b1804b1-493df062c26mr13727105e9.3.1783360477456;
 Mon, 06 Jul 2026 10:54:37 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:54:11 +0100
In-Reply-To: <20260706175415.2604046-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175415.2604046-15-vdonnefort@google.com>
Subject: [PATCH v2 14/18] KVM: arm64: Use noclear for PGD in __pkvm_init_vm
 error path
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_105440_289422_7B8482DB 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

In the error path of __pkvm_init_vm(), use unmap_donated_memory_noclear()
instead of the clearing variant to release the donated stage-2 PGD back
to the host.

This intends to eliminate the clearing variant of
unmap_donated_memory(), as zeroing the PGD memory before returning it to
the host is unnecessary in this failure path.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index d9ab58226889..0c82f1ddb93d 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -861,7 +861,7 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 	kvm_guest_destroy_stage2(hyp_vm);
 err_remove_mappings:
 	unmap_donated_memory(hyp_vm, vm_size);
-	unmap_donated_memory(pgd, pgd_size);
+	unmap_donated_memory_noclear(pgd, pgd_size);
 err_unpin_kvm:
 	hyp_unpin_shared_mem(host_kvm, host_kvm + 1);
 	return ret;
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


