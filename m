Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC52CE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O767jE59AeAMsTglDWemPeR1CkI5EMgHAt7K2sI2JAg=; b=Y3LxgdCcFiEajXdU2ex1roxs8P
	6Lmx334XQR+XDqVR/IxUUALE/F2/oi38JkxNC16tN84+zrx+KBfwMoTEqeZDSjUksZAPsUwVoj1U/
	zXrrm/xp6C6qhVN30MWvhx3yZD9RWn6DAU81MtBBEoJ1E/5eIwfznjNqrvq+OcN8DnhdVD+Hkk/wC
	Ti47MYn2hk53FVPOb+k8t7xI3zNT0hDdhT60NIqt9idsAGvO6+e9T99BZZAaeC61LamCI8p+k/DXm
	BKeLbBLIjKgN2A6Qx5he+pzbJSnB94rOxs/i7VvdDEAsewQvqGUvPESl8RXMCqXmYPp5qgi8Dferq
	DBc0rDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzfF-0000000DJCK-46ul;
	Thu, 09 Jan 2025 21:02:01 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzTf-0000000DGZB-2pMr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:50:05 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id 6a1803df08f44-6d8edc021f9so20742826d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 12:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455802; x=1737060602; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O767jE59AeAMsTglDWemPeR1CkI5EMgHAt7K2sI2JAg=;
        b=m8dxgQ0tWtGpne8PxZmu9xKQzM/gw9ThIzrS59xnSzR28tfiaK4bjDHEnGBozpYAYJ
         Rj9zqX7BK0YG0nGaT+AgmH4tYQsglwCX+mbPQ4GZo0NGgjYXfueTaxPjSOmWiqiaDwXw
         F52Qr3rHM/3+2ivDM0Y99mg89+t4IO3IsJe9Z79j+4ZFwLrpgp1AqwVHwcWAan6PgOKw
         yhB6FHhhpZ3WAQsWv5DbjqNkC7svs6iAktoTnkbk9FCRufY+8oj4c+SmpWQeNGC8H6vS
         Deo4pPZAV9LSxQNrPj9ZOYucPUKtn6XjfijPYSZZnJ36pUOroijXXjPOnXGp4K25S0Ep
         gl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455802; x=1737060602;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O767jE59AeAMsTglDWemPeR1CkI5EMgHAt7K2sI2JAg=;
        b=nWpk9M+xHWLrRhSO8VRDhqlaaNz14uNJ9SyDATWOmxXZSgdKYDEP+C+brSCGZpqACu
         P75XHeavaISPW3LKk6v85NKWCcA/XSoBqW7v81JJD8/vj5A/I3KZQoLP20hK17y6mkT+
         ZOoclK3mKug/4IF+e95pNpi7m99LhnmocLzGmHovqJVS+fdwuGsJK/lKxIfVdxGwwoB/
         9Ap5SjD1UGR9H5k9LoiOLIeplOJcd9GwPAXzXJ1ZkbUdGqLSO5IxZN6nX1E3hticI0+6
         BtBr5+qdMW0F03QLrgAbElKLUHz96KgWJaWFBqNPc+k410lPhHV+gkQuzytw7PPXVxON
         KvOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHljnq+aOaXBhSF+hONptYHueEoT3MfbwoNOMe09jqemMHXPuynxg7HP4X4/EAd5CctRkmomkQMJGqbiOVFyFf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzay1optbadnoFGBTJsxq3y1+wxQXnEtPQkig/b0izVHN8QpHuA
	SRQNN5CCMW2UWT7YjZ9Y+qbi1zG+XxxNlO7GhodN7YW/0DfgkxLsxzJt0CoRBhvPXul+ccbyA8w
	I9j4W35cQ7Q4oMzv6XA==
X-Google-Smtp-Source: AGHT+IFgx6gAPenNPcGigBK2pqFto4Hhpu9WmCDI55SJzVOesvWzc1cj0nZb4kbFOEWQTb6nHd4wPYt7OTvCG9XJ
X-Received: from qvboq1.prod.google.com ([2002:a05:6214:4601:b0:6d8:f326:1f33])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6214:2688:b0:6d4:1c9d:4f47 with SMTP id 6a1803df08f44-6df9b238643mr125150226d6.13.1736455802071;
 Thu, 09 Jan 2025 12:50:02 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:24 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-9-jthoughton@google.com>
Subject: [PATCH v2 08/13] KVM: selftests: Fix prefault_mem logic
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_125003_721945_3B8CB4F3 
X-CRM114-Status: GOOD (  14.04  )
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

The previous logic didn't handle the case where memory was partitioned
AND we were using a single userfaultfd. It would only prefault the first
vCPU's memory and not the rest.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/demand_paging_test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/demand_paging_test.c b/tools/testing/selftests/kvm/demand_paging_test.c
index 0202b78f8680..315f5c9037b4 100644
--- a/tools/testing/selftests/kvm/demand_paging_test.c
+++ b/tools/testing/selftests/kvm/demand_paging_test.c
@@ -172,11 +172,13 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 	memset(guest_data_prototype, 0xAB, demand_paging_size);
 
 	if (p->uffd_mode == UFFDIO_REGISTER_MODE_MINOR) {
-		num_uffds = p->single_uffd ? 1 : nr_vcpus;
-		for (i = 0; i < num_uffds; i++) {
+		for (i = 0; i < nr_vcpus; i++) {
 			vcpu_args = &memstress_args.vcpu_args[i];
 			prefault_mem(addr_gpa2alias(vm, vcpu_args->gpa),
 				     vcpu_args->pages * memstress_args.guest_page_size);
+			if (!p->partition_vcpu_memory_access)
+				/* We prefaulted everything */
+				break;
 		}
 	}
 
-- 
2.47.1.613.gc27f4b7a9f-goog


