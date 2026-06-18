Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047A4CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qac8FDS3yeT2+4VM8TKuhIc6uI5EZlyUNr1jGR9SzEs=; b=CIkCP8tNCl23IeAKqTh3Ue3wXR
	Oj6/VuqYGbU5JizAQY8Yt7xptsmbXlmaD7EF3FPgGYEVcpPDcOq/kcpeu32DjmlGh0tcG8mK8amhQ
	za5Y5TBGasILPepJDp7My7vjH1odejyKxD/skFBh5TfYJfuDCIbBvFzt/KlQeyIfzcLiDuYWCTo1x
	LMMOLnQOQeWxIpnETURyCyNWD797C/7aMVMRL+ytiLFIn5AXI1MrkiGOMrEiAjBny1Bl6Fbzi3Z6r
	A0qdG72Sth73hy3w6fIKpnrNOEQXIyLSIfwwlB7CqI7D/eKe2vgS/vpI3hquptiLqjjZblqvL/xfL
	Z1CbrggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8d1-00000000tDo-0Gcc;
	Thu, 18 Jun 2026 09:01:39 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8cx-00000000tBm-3zL8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:01:37 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-c074ac8a2ddso62636866b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 02:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781773293; x=1782378093; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qac8FDS3yeT2+4VM8TKuhIc6uI5EZlyUNr1jGR9SzEs=;
        b=eyKiSep3YqimPA/s9GyU/N2IOxtxaHi0KFzv7nxLGQQUi21ZJQnxtIGTJoWaHKk8a6
         YZNjibp1JlG6q9lDWk6EhYS3apl/6bp2UWGNCMjC0ysu93V64lQrerCT2kWU7+Mffg2W
         33C2ZGYMhiu+F/GefHQb3RH4wqCEKRtllcvA9vuwGJPkOgClROoaoVVdWO3MHwUxMz8w
         E81skuIKFdTlz+CQR6vzdhGdg/ZuLR9CdxBr+XBEa5S/14pgf76yM8Z5XFDl7sNmBJDM
         EYNEHUHC+GA4cPvQWM0pV8MUFgOEzYGNPyUTRpyplRw9J3nAKSUjPRJ9imYzwNNDRPrE
         NBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773293; x=1782378093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qac8FDS3yeT2+4VM8TKuhIc6uI5EZlyUNr1jGR9SzEs=;
        b=SqVUpPlLQVzXKVfyRYXq0vnDrpbi5QQqFRJC4v+ogHnB6ttZ9XM//6Ua57ZMsvHJSC
         whmAEt/mUo5aEx0O1CY6C25yuvF0UFCDrDqQNQ9LFtqgxc0ulNaXx83SwKSJSvoHf14n
         1p5/cifXFaIvkmopo8PGBCy+QRzrbcwEMNHvY/VirnVw5Eb+BUbMdCqCcNdX8tJUCybJ
         KXBHo4NSgQxNeVUVHOBuW7wIgpCXI6MRqZsmmCn4dkfNcJeY9xnsPp3vdkRAjU8TCHgY
         Mueuz/ZslKqvRShZDdsUNjEseXCusRtua3XriJ0YUUYbZfuHKbF8gtiHHA8zHhvRkjrK
         m1FA==
X-Forwarded-Encrypted: i=1; AFNElJ/tqHEjjIY8+UkFFLQHzg+fN6ZyaDGfm78qgwZgUYFyLevFQr2V2g9vDuGCWguLnotsDI59l3IcO8LLHs2x6pBm@lists.infradead.org
X-Gm-Message-State: AOJu0YyYt17as3CV8KZWiWEjX8R+vpDIcHWl67cvmne3KdpL1TppIdph
	UZBhUxprM0lMm7WMxKUB9s5EgW3ZX1rjBXk9QNBttogZbDWDIhbFd1firYibx5CJjvHcBImAO0T
	l2w==
X-Received: from wrbfu2.prod.google.com ([2002:a05:6000:25e2:b0:461:e741:9a7])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:26cb:b0:bd0:df77:98bb
 with SMTP id a640c23a62f3a-c05a1f461femr458002566b.9.1781773292698; Thu, 18
 Jun 2026 02:01:32 -0700 (PDT)
Date: Thu, 18 Jun 2026 10:01:27 +0100
In-Reply-To: <20260618090128.3913688-1-tabba@google.com>
Mime-Version: 1.0
References: <20260618090128.3913688-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
Message-ID: <20260618090128.3913688-3-tabba@google.com>
Subject: [PATCH 2/3] KVM: arm64: Remove unreachable early checks in pkvm_init_host_vm()
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Keir Fraser <keirf@google.com>, 
	Hyunwoo Kim <imv4bel@gmail.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_020135_993435_95834E05 
X-CRM114-Status: GOOD (  11.59  )
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

pkvm_init_host_vm() runs once from kvm_arch_init_vm(), while the VM is
still being allocated and is not yet reachable by another thread. Both
early checks therefore test impossible state: is_created is still false
(it is only set on first vCPU run) and the handle is still zero (this
function is what reserves it). Neither branch can be taken.

Remove them.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/pkvm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 053e4f733e4b..67b90a58fbea 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -230,13 +230,6 @@ int pkvm_init_host_vm(struct kvm *kvm, unsigned long type)
 	int ret;
 	bool protected = type & KVM_VM_TYPE_ARM_PROTECTED;
 
-	if (pkvm_hyp_vm_is_created(kvm))
-		return -EINVAL;
-
-	/* VM is already reserved, no need to proceed. */
-	if (kvm->arch.pkvm.handle)
-		return 0;
-
 	/* Reserve the VM in hyp and obtain a hyp handle for the VM. */
 	ret = kvm_call_hyp_nvhe(__pkvm_reserve_vm);
 	if (ret < 0)
-- 
2.54.0.1189.g8c84645362-goog


