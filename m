Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B7DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 00:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYKvlAfMuP2ktBfEDhDytfcvSdR/S4IqDZKQdTsYjuw=; b=b5dXPLMUE1a9xuSO+bS1oIcCth
	3uD++9LIgg/oYNXZaZKQL560YNwTWusyQtU0hOf+IOv1pWm2kAVGAm5fcGi4CmpnHFsQYfcL12cSe
	8PVD8AEfT0bAKUQbY4IZ9YoQUJcH3cm59yPUjBUxCV5veq2qUi+lPFQTTCKBiAG80WRaWrifXeotI
	iCaZXnX+koBrsVlyHnNuMmUzVqLmzzhmzNUTvQWPp6vuP2NWcUgcMnDJ289pqvQHx2YR8utE7t60z
	OKdVS0YQb1/DcDl5HMoqo5D16uB2pkxQy/ltGiWOf5bF/w25zLOx3KgGMFvLAfPpUZCYjOyke9wOZ
	82yP5hDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPoM-0000000HRcT-1S5y;
	Sat, 11 Jan 2025 00:57:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiS-0000000HQNp-0c1g
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 11 Jan 2025 00:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OYKvlAfMuP2ktBfEDhDytfcvSdR/S4IqDZKQdTsYjuw=; b=p+2thsV1/0XAtPS0ZKPsnN6aSv
	Y9Iu/2nw0BxJwl9Hit2sS380HZ4GSrKl2Nqk0uWOF01mg7HU7PT+AsXI5M9TD/w/2DBP37+RElasZ
	lHtVXfKQqEiDZUzuuPuwDsxzIMII1ZrUmLv2u0Ztf54LFHouGW3mwvfER6Yb5umBaYEMpVh7NKVe2
	MdE6cUXD1YsIrhZP+9uyefVPbVCrQ5/qAD65daZo+R4/iEKmCNXVH5TEueLTZhW4CN6V7udnEKYyx
	1hnLIJNbPPQGrpIch7aSpJMLgSGRAoyZY6k76sPZwqCf/TeLriK65fcDxMYm+TtLPl097ZLyq12A7
	bQ+U3AUg==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiK-00000009yL6-15xb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 00:51:02 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso4788195a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 16:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556653; x=1737161453; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OYKvlAfMuP2ktBfEDhDytfcvSdR/S4IqDZKQdTsYjuw=;
        b=OA69/A4/KfX4HzRof7rHdAncGhFb3FwgK/3Z4ZVmAI1CkrSYi41sh1GllhZfpO5pH1
         d/Mzdh6MT3moHhGgljTpBlnVBdxXYmbNpsk3g0bBCyxErFGUb9ACJo+7Pdy5HhdR+qlP
         bp6VoLc5/dKzvIeqBIwiHLyiYL7V+72WIBoIxb2MDhWRN5fWuCWrWq+fW017dgTCoZow
         QSsxXfrkuGwBdvZSTM35KMkrzRO0BCUjPD2NEzNfof2Otc771Ol8512bu0HqwWI5fJff
         q+8G5YFSv+eFLmBy60/j+IylJ5Epmdx4vIeQhnaQbnm15/6SyhbZWTbJ116zSDfhcj6O
         PPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556653; x=1737161453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYKvlAfMuP2ktBfEDhDytfcvSdR/S4IqDZKQdTsYjuw=;
        b=CjdmfQhInsIwCtElB43wbrC/oWMveKqr837N1v70mATGZclePNZcsWU0wNQpvLlfWp
         KQ7Pqev1rP15CwTarZPLMh8ao4YZPXoSSjW6mn0ZCmz5DOTKo+qjoNsX0cfTR36PPPbD
         51jtGLE3fpuJrHVEx2jFrylcE7HaxNBXIuZDL4VhhEFbYIEo31epvyfX6qcjoVgQhmzP
         /TLfe1zm+dco+RQZpU/Zp2AX/p6SfWe8vg+GSDxQur92wV2IiGnzoda8LW/w/83z+wGJ
         HB5/+SaglZEwiPIsgC6kKoAnB7IrBMmpyOYUHWqm3REioUNo39hgGovV7lx1FI0X3sE5
         TGYQ==
X-Gm-Message-State: AOJu0YxT0eMcTIEUWtKYKBiCWOeL7W7la4FNrgN5Ced86Psl3P2N5Tic
	AGTqUWz4sdCxnKmNeHpgm7QNejaqI09zgYG46wXiCIID//+GUjNac7suroOYuheQogiJh3EYfJU
	j+g==
X-Google-Smtp-Source: AGHT+IHC7L4dio3zRElUKJK6ZXLcnIeUcETaJFiIoDB9K4Jc3JVwsDgdf+5YQVS28IyDhPWQi08akvDOKi0=
X-Received: from pjbqi14.prod.google.com ([2002:a17:90b:274e:b0:2ef:d283:5089])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f0e:b0:2f4:49d8:e718
 with SMTP id 98e67ed59e1d1-2f548eac0bfmr19303629a91.9.1736556653508; Fri, 10
 Jan 2025 16:50:53 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:41 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-2-seanjc@google.com>
Subject: [PATCH v2 1/9] KVM: selftests: Fix mostly theoretical leak of VM's
 binary stats FD
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_005056_415262_343A7E42 
X-CRM114-Status: GOOD (  12.62  )
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

When allocating and freeing a VM's cached binary stats info, check for a
NULL descriptor, not a '0' file descriptor, as '0' is a legal FD.  E.g. in
the unlikely scenario the kernel installs the stats FD at entry '0',
selftests would reallocate on the next __vm_get_stat() and/or fail to free
the stats in kvm_vm_free().

Fixes: 83f6e109f562 ("KVM: selftests: Cache binary stats metadata for duration of test")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 33fefeb3ca44..91d295ef5d02 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -749,7 +749,7 @@ void kvm_vm_free(struct kvm_vm *vmp)
 		return;
 
 	/* Free cached stats metadata and close FD */
-	if (vmp->stats_fd) {
+	if (vmp->stats_desc) {
 		free(vmp->stats_desc);
 		close(vmp->stats_fd);
 	}
@@ -2218,7 +2218,7 @@ void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
 	size_t size_desc;
 	int i;
 
-	if (!vm->stats_fd) {
+	if (!vm->stats_desc) {
 		vm->stats_fd = vm_get_stats_fd(vm);
 		read_stats_header(vm->stats_fd, &vm->stats_header);
 		vm->stats_desc = read_stats_descriptors(vm->stats_fd,
-- 
2.47.1.613.gc27f4b7a9f-goog


