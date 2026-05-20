Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695D3CD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3rJL/Yi2DgP7I/iMEJLiWJwqpREFgZnSjxLrASERUQ=; b=AEmcTncKDNay4t6WC4MaUW01mh
	ujRbJjeuJuOT19Bl4lhSV9t7xVdMdghAaW8eBT8hn8ajdQubgNjVaOCwRuR8kVMd6SRmzxPv34LJA
	GmULzcLWDcY/xycUJZWPvQD3Nw0l4e/amG+cdeJ4yS6hFHMjqIdYlc0Y2Um3Q7URDCCQJOt/slD4G
	/SoOHPlsrVxLgrdhtcqCkXkhTTjN8rphWeayK4Me+Diq1Wecnysn/t3P+izjw9in1uWQ8S7ImAOB6
	w1YiSJeWtpq8YHvz7Ew/RDCBd6ohtRQ60Afr4vDEj6uyfU2wUUhGCOWn2UbFlKQQQXfQOSKIr1T9V
	o8DwMaIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipj-00000004zKv-3Tsn;
	Wed, 20 May 2026 15:27:43 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipY-00000004z9G-0YGN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:27:33 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-45e80183514so3050320f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290850; x=1779895650; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O3rJL/Yi2DgP7I/iMEJLiWJwqpREFgZnSjxLrASERUQ=;
        b=hxjJkbLC03Re6xGV2QpJou5mLi3tXh32OxKKhDKNlFYishXLn+8+NtCXwLKlcVcbf9
         awiFoyX0pMcS9WI+uoODBfdIZKnf/D7R6qHOYgEKMaSoTO83EN/q5kyYo2scO2X27zIH
         taBIqcELSKu4E88YIjaiHxAEUsWdh26aXEzpTzcbysRKtSD9OsUuJ8EROgEZKPW976Yu
         oEosu2ZMPtq26Gy07UvZh+sMyjaBISsDuRlllWjie2BnNvr+qCC4uIUB3c3xPFowC4eE
         cqXvd0JLflQMKnNENVd7NbkB3urvW1NcizRJoIwvwOmR8opve59T/MmoEsrLkWU02nsC
         RP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290850; x=1779895650;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3rJL/Yi2DgP7I/iMEJLiWJwqpREFgZnSjxLrASERUQ=;
        b=MPqTP1OWQoBZN3SkPQ0Td818BJ9ayW73pzjCVbe6zTcz6tq4o3TZrCj7l0z2ZGK0d2
         xQJGf0aDTcCWWWV+oZ/WWumvjq/F6zcaUyPRzs5wqORhToM8LJsS05lWAezmVUIsUEYO
         OwO50ha6p/nLD6ZhALFw8HRo1YanVa10qdj2t7m/vHJSYp6proXXMGjkNpypdpUm7uDT
         HoDCqKo42vlJo7jC+sE6vNDvKW199AxfjET93v+G8L6fMhWjQ6tI0Kq5Htc/Pt5VLaSn
         YIyHVrhn16gZrCIuBaOv60XeFmEad5sq0ULz2IYdbrbxMdJG+BUfrWLL6VQPLoXZBv7l
         Zmcg==
X-Gm-Message-State: AOJu0YzJnF6C2OvrKJ1lleiBvmX3ApdEhsLLTgypbdx2CDVO2EylSabJ
	ZyJEAoiR/m/CY+pXADO2rDQWoOnjr6siSJ3WfpIiwPKBZN2J69ZTVXwOPZxNqGJ5JU29dveBUEX
	nuqE6q9dQEFJQmWaeu85stw==
X-Received: from wroz5.prod.google.com ([2002:adf:f1c5:0:b0:43d:7b52:1f8c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2313:b0:448:7049:a6c9 with SMTP id ffacd0b85a97d-45e5c5b387bmr38092483f8f.5.1779290849666;
 Wed, 20 May 2026 08:27:29 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:47 +0100
In-Reply-To: <20260520152650.4107895-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260520152650.4107895-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520152650.4107895-15-vdonnefort@google.com>
Subject: [PATCH 14/17] KVM: arm64: Use noclear for PGD in __pkvm_init_vm error path
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082732_191241_A749CE31 
X-CRM114-Status: UNSURE (   7.59  )
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
index ebdbe9c92689..3e7f7606a3da 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -845,7 +845,7 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 
 err_remove_mappings:
 	unmap_donated_memory(hyp_vm, vm_size);
-	unmap_donated_memory(pgd, pgd_size);
+	unmap_donated_memory_noclear(pgd, pgd_size);
 err_unpin_kvm:
 	hyp_unpin_shared_mem(host_kvm, host_kvm + 1);
 	return ret;
-- 
2.54.0.631.ge1b05301d1-goog


