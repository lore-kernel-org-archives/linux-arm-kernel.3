Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12D2E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFzCtU30qR2oi/Is6fdl592GY3fZRLXfeluJtZi8G84=; b=dA/4Eav59Lpgr7iJ5M93Op0duA
	04J1Eq5dwK5yxdDbAGLL432O1Qn0XuIcnxUVAVqv6qR8JnyyVxU5ufc6nNl7ERClSWn049ZNbK4lp
	hzq8Nf1yhlIuFptirmbC+aGmXkNW49QM7EyE3DONZ0jt/sb2K25yWJSy0nIuUNd1vyOoAtf0Rro7G
	OjShtLztbVHCHDa7i9nekiDHo/GNUJzfqYh9LPEMAQewzvjkz5S2MWSaKXXl1qJga1qzxWXdIuDXW
	TZsvUMOo0SaAIEk8gbiNt7ePLrOH5oPkGnnnegbSBXVZzloCWA351iPrKd9/gOad7Ui8awFSW4mFL
	z6d0DR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuyN-0000000DffG-2CMf;
	Wed, 04 Dec 2024 19:23:43 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIupN-0000000Ddjv-0WmP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:14:26 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-5f1ee87f67aso136714eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 11:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339663; x=1733944463; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zFzCtU30qR2oi/Is6fdl592GY3fZRLXfeluJtZi8G84=;
        b=zJ18V22d1A6J7Xjo7Y5Ptt/AqmEtc32On6h1ITSLjd1q+FtPoR/l9LlEGk0HL87zdU
         Er4UsP5cqfepF0Xz0ZDdoJy8uueKO3TZeJMz9ywufzuhUuKsiWXWO89yeLWE2LwWG9Wc
         tSvlpNAfBJYeJXTZR0zn7QgMKrSjjIJ4Qgd53+nwEj5X+sp+ozlMiVgaDJI8QZ2mpQe1
         Uo15XnN+G1g3RVkPbNlRwHo0AJaMuFJffgZ6qWGUv4U8q0WIchvm4I/WeYYUbgq5UxqC
         SEEmKIXwy9arxPdWO64zYcdah4n5Su1jBYvw5KluRdvyUsJxChzhtDpy4MEB3joxHDwV
         keyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339663; x=1733944463;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFzCtU30qR2oi/Is6fdl592GY3fZRLXfeluJtZi8G84=;
        b=bzMON8JqhAQKQBuNVhJbe7pIUSw0xp4YOgZx6oKVENLuQjeY9Vofl/K3AxRFmyJ5Qy
         IxXNturuH6ETdq/k5RjpLwid/PZrNehfTkjdJRD6GoEsaHjMBdG93ik7er64uXvFPaIA
         Wp/AtyqxKZGEr1lgwd5dQuLYtg7IkkxjR1QRnXkTOHwZDq4op1ADpg2pkVbY5XbLeMEa
         qzeGtVWPy23EQWo5F8Vvi4bsRO5T5+x89RkLPWoTe3IKY05FHidDJYZII+vlFKIvkZnR
         XogAQySBdL29Te9aeQV2MM1yAPp1qI1m3E3cwC5X8ph1MV/9fYdgEiEsLyIwb+giNc7g
         vp+A==
X-Forwarded-Encrypted: i=1; AJvYcCXv7RfGIES8oN5biV3ONQfdxgpzZSv9qPAHhQCjQ1psd+oUNxW1UPM73T8UDP20l5MPn/LLTgxTJ3qMqnRrUw2z@lists.infradead.org
X-Gm-Message-State: AOJu0YzQuDqsf0mVkmz7LhZla6h8HGTRkEPi7for5Huyoz0+oLzo3SXn
	KHnEtvJCNYyfPFUqYEF2cffp/W87oo6SECnGaMkWko2mfqMWL1ISMdj+eRQxdYc/rbVJDHAC1No
	2CewzlBtu6WAS5otq4g==
X-Google-Smtp-Source: AGHT+IE0Bvu2wb5sZ62wPHnkPebE9DLvFVJFuHpqNaMFqI9+9IIU97LvrniH728q/X5uxBPvfLsjs32/EpieLb++
X-Received: from uad11.prod.google.com ([2002:a05:6130:800b:b0:855:e8c8:6d6c])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6218:2812:b0:1bc:45bc:81f0 with SMTP id e5c5f4694b2df-1caeaab608amr694161055d.11.1733339663073;
 Wed, 04 Dec 2024 11:14:23 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:43 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-9-jthoughton@google.com>
Subject: [PATCH v1 08/13] KVM: selftests: Fix prefault_mem logic
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_111425_184064_2961D98A 
X-CRM114-Status: GOOD (  14.45  )
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
2.47.0.338.g60cca15819-goog


