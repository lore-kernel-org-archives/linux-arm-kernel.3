Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D096C55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i7nVKeMcCmrPSAlaMzrZkMXb8FR+2oHKNn3SPXNfhnQ=; b=aLndrcw38cYMyTyEiQ4F6IVEQO
	bOWzUOhO3YHZyGF2Jm7d1hUhAfapBe5RqmsMHCGR5FSEZUrqAkmgwARfDAcMr2naXuXPdolcPLAVt
	joHWC16YSMnnGjL4DGUllDSZGhwczDw0+3+2+jMYJozeF6fszpIpm6wu+9QtFv66s7CoPSdy0Sjkd
	jFF72O1QgFR7LS+Xa0zg7LHQa1O+LFNGKSVoW5S1bJjNkQlcsDd5GVnW6koRn0qCpSP9BXrglpIVI
	D/a9zWlLoodVcsX+j1eUJEHdgur9psbB9QDM56cGEC5gJmGfdQXtZfhv6qSl15H1wUvjuAHT9Gj3r
	EdaHahNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqp8d-0000000GhoZ-39zU;
	Mon, 03 Aug 2026 09:39:15 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqp8b-0000000Ghnn-0eQU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:39:14 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-493fa6e28a7so22385555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 02:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785749950; x=1786354750; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i7nVKeMcCmrPSAlaMzrZkMXb8FR+2oHKNn3SPXNfhnQ=;
        b=UpCI3hW7D1I699/hWcWcLMuauG22wHpTqVNr54wbPhGu2SNCBu7z3vvrxilCHQOOtu
         Y1PdOcXNt5+soz+M/mmAn2BSRcpq5fIhtJpEBWQjq2ywAE0nAkJzy3hl9n8dxmQS/BN4
         i6RHQwOZGMwfkTmKdY9L56Azi3AvQv+AoxoYQ7iyx953J3TaHflLWCSHtV0nch5/IMQ1
         BCmFZE29BbCKMP+Y9cmWFhIuIQGrwZs/mogf20RMNp38bChXd7/AOB6S7LH3rr0tIf3Z
         V4t9hVrkHbxeQLC5TXq+wC2VmMBfJ/05i3U9xjWwhEA8rmaY82t+7IUgAPhlZScrZwcv
         wucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785749950; x=1786354750;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7nVKeMcCmrPSAlaMzrZkMXb8FR+2oHKNn3SPXNfhnQ=;
        b=iu9MeKMeyL/i6wgbKSkJQmZLQbHnpwtqz7ZAlgtnIW7JJnLVGFHhHO5dIrGrClMBjU
         YnOZ6DRJ69zXbmzTnlAoc0l5worvca6S3x7wXrhD6C635w55LtRw/OiCaeCyqKv3tmLG
         2kdMktggg0SOX+3nsmk4CJrs1TbvqknSaCKizsmc54yxOUyJFLWwM8z+DVdJ4fAM60p6
         voboOphLTydOnxl0tQxE72xbrUfZqtea7eWXxLDsTgx4w63AxQDcwv71hCMjBZjydpN2
         YEfT/05p867eIANQntCp7PPS+mexAZGKNEslwwHfAeOdwrgHhxEu5fNfFCr6hdGTu1XL
         fzKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAKADq9T/tcRUcA3ac9oT1IQsttwv4X8vZb099VVAtlTzvV+AkjFUo/6CiC4cTufcsX0VKTkRe0wke3bq27Cvr@lists.infradead.org
X-Gm-Message-State: AOJu0YyzUZLeE6YHWJOlUfkJNw4pa418P1m98ZMFZWgQwq+oUIh8jFYs
	JjigEDz9O0QNOvJz+J+qGI66BLQxRsPZF4KHoDEcb7l211g8S9gJl8Tmtj/nD1kZlF0jzX/1ZTf
	0GNG57iY+7Py5Sy77zcYqUA==
X-Received: from wmbe4.prod.google.com ([2002:a05:600c:5904:b0:488:9b69:9379])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c113:b0:495:4689:1e98 with SMTP id 5b1f17b1804b1-4980c674e1dmr159181765e9.10.1785749949727;
 Mon, 03 Aug 2026 02:39:09 -0700 (PDT)
Date: Mon,  3 Aug 2026 10:39:06 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803093906.3531699-1-vdonnefort@google.com>
Subject: [PATCH v2] KVM: arm64: Drop %pB on nVHE panic when stage-2 is active
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_023913_213075_EF606FFF 
X-CRM114-Status: GOOD (  10.87  )
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

With pKVM, the host stage-2 is lazily mapped. kallsyms, accessed via
the modifier %pB is therefore potentially unmapped. If the hyp panic
occurred while the host stage-2 lock was held, handling this fault
deadlocks.

Skip %pB formatting unless the host stage-2 is disabled.

Fixes: 6ccf9cb557bd ("KVM: arm64: Symbolize the nVHE HYP addresses")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

---
v1 -> v2:
 - Introduce nvhe_hyp_panic_host_s2_disabled()
 - Collect Fuad's tags
 - v1: https://lore.kernel.org/all/20260731182231.1277064-1-vdonnefort@google.com/

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 54aedf93c78b..88dcb8cb36f3 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -507,10 +507,20 @@ void handle_exit_early(struct kvm_vcpu *vcpu, int exception_index)
 		kvm_handle_guest_serror(vcpu, kvm_vcpu_get_esr(vcpu));
 }
 
+static bool nvhe_hyp_panic_host_s2_disabled(void)
+{
+	return !is_protected_kvm_enabled() ||
+	       IS_ENABLED(CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC);
+}
+
 static void print_nvhe_hyp_panic(const char *name, u64 panic_addr)
 {
-	kvm_err("nVHE hyp %s at: [<%016llx>] %pB!\n", name, panic_addr,
-		(void *)(panic_addr + kaslr_offset()));
+	/* Kallsyms might not be mapped in the host stage-2 */
+	if (nvhe_hyp_panic_host_s2_disabled())
+		kvm_err("nVHE hyp %s at: [<%016llx>] %pB!\n", name, panic_addr,
+			(void *)(panic_addr + kaslr_offset()));
+	else
+		kvm_err("nVHE hyp %s at: %016llx!\n", name, panic_addr);
 }
 
 static void kvm_nvhe_report_cfi_failure(u64 panic_addr)
@@ -538,8 +548,7 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr,
 		unsigned int line = 0;
 
 		/* All hyp bugs, including warnings, are treated as fatal. */
-		if (!is_protected_kvm_enabled() ||
-		    IS_ENABLED(CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC)) {
+		if (nvhe_hyp_panic_host_s2_disabled()) {
 			struct bug_entry *bug = find_bug(elr_in_kimg);
 
 			if (bug)

base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
-- 
2.55.0.508.g3f0d502094-goog


