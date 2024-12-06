Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA3BE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 22:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xOebWP/M8X2cP/fdZF9vXfDo8byCjFk2C5X5FbCC10=; b=2cJ/zpST3fH3r94Qyv+/jHaRVE
	oZjhkGnbUx12EKZjSYoWB+eC6QlZHdZyfmvL15EaTn7VRyA5A2hUpgasuSfYwIUt//zT3Fr2HhaK8
	IFVcehmZMs0dTTaeVLS0SjyAhCpEC42drPwpT0UKApMDTQucNVSfp/E/9EyQlIyqSlbIaNMYRtFfp
	bZk2QAyav0QEv+Oxzfr/bGMetGpN5L7mkP3+sQYnq7Kntf/+eewEi7/ON5fcyL0h9uOivlTUlKREA
	IlcplLWhqSujsLkM+8+ODmGTeWWFTCqESbzAVK1Jc0UZlk5RUPwGZBg4ramB0/lXsl1qAfAFIKZaT
	DS1zLS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJh7F-00000002xVi-1aTJ;
	Fri, 06 Dec 2024 22:48:05 +0000
Received: from mail-vk1-xa49.google.com ([2607:f8b0:4864:20::a49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJh6D-00000002xOc-1KBK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 22:47:02 +0000
Received: by mail-vk1-xa49.google.com with SMTP id 71dfb90a1353d-515cf198890so445362e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733525219; x=1734130019; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8xOebWP/M8X2cP/fdZF9vXfDo8byCjFk2C5X5FbCC10=;
        b=2B1vlN27ma7Z9B1mSWnq0LTuash1tmbkhat85Z20D66nuLWlK0pLN6xQVFjBr/MCzX
         8jNNh4VQMsWJQ9aWMLqzbkv4q1yCCeOqedsWAQfQGU74X/qWPOXscBbrpXlWITSPbPeS
         jF6gtefy2iQJrlhSxBY+hmzmfT0XQXk2T8FUosm0TlAAbXdURjrsOMGrkZZPvvr8MaHQ
         l9tH/XUpxAFYwQb82t8bmLFWzaS8Hc6ucqgkC6K5GGpoz/nk9QvkWH3og2Mt0cwvtwhZ
         o2dTxo9TUZa1F1viSDYzWlwZW62/r/oigNuXHNAmkXJ7MBgy9MsqAMYDgWmNw13SdXgS
         nkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733525219; x=1734130019;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xOebWP/M8X2cP/fdZF9vXfDo8byCjFk2C5X5FbCC10=;
        b=aGt1UVMe1K+XbnlEwM/Pzq4WlClS+FOLefj7LEJdVfpQu/7Mb+OLorplDfBJtbgt0E
         ZNems+KschQ7kimFWTlcHi/cL2lHbMWgGUeBZE3lx6Fdkvb+mm2n26Ibh3/HSNTMf4aU
         AQdmhT+CayhODNxwyS6DUa+qud5FbHCQm5wUOjH8IKSZcuKHjuUgdS501hDCt5FamVBm
         /3FXTLNtPuJy8f0Ck15IFoPabCa59VV6+se6sSb8pjZ1EGWWt2df1hRd9Y+CToA7sSLG
         l4DGsVXIpGz0AO15lYdlOTqUgVfMn+GZzgpiQJtvaWokIucB+r4VpC4Cy/8U6uXV6E+k
         SkBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkYTB4cKSbRZeRY2lxz5S/S+jgoOLUHJEi7RMTz0Mlo97WllhcZ4HdQr7Wt2zBYPy17OT2rIaFT+zBgT1m/Dfd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmut5Ie1sh5EZmRxkkQpLzyFNMZ/FFd0L1aRp6RE0jSGtNKxsZ
	/+d/rjHzbwOX3dsG5NCfge4O39mr6bruZgtj/woffMZyvkrcw1i4O2rL/JLd7QtDF9fgD0Fmo90
	9d39Lt88QOm+b4kIOXQ==
X-Google-Smtp-Source: AGHT+IFWYRH0ZDfG1SCEobsGl/BiWTfQRI31egCmHBP1UIFLmQh8g16wMoeT9PBzM1Kkhhw9DuLZq6uIHa5tY1W0
X-Received: from vkbes1.prod.google.com ([2002:a05:6122:1b81:b0:50d:806e:dfd0])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6122:1da1:b0:50b:e9a5:cd7b with SMTP id 71dfb90a1353d-515fcae70a3mr5700023e0c.9.1733525219486;
 Fri, 06 Dec 2024 14:46:59 -0800 (PST)
Date: Fri,  6 Dec 2024 22:46:58 +0000
In-Reply-To: <202412052133.pTg3UAQm-lkp@intel.com>
Mime-Version: 1.0
References: <202412052133.pTg3UAQm-lkp@intel.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241206224658.2833655-1-jthoughton@google.com>
Subject: Re: [PATCH v1 01/13] KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
From: James Houghton <jthoughton@google.com>
To: lkp@intel.com
Cc: amoorthy@google.com, corbet@lwn.net, dmatlack@google.com, 
	jthoughton@google.com, kalyazin@amazon.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, maz@kernel.org, 
	oe-kbuild-all@lists.linux.dev, oliver.upton@linux.dev, pbonzini@redhat.com, 
	peterx@redhat.com, pgonda@google.com, seanjc@google.com, wei.w.wang@intel.com, 
	yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_144701_356099_9CE71CEA 
X-CRM114-Status: GOOD (  10.67  )
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

>    arch/x86/kvm/../../../virt/kvm/kvm_main.c: In function '__kvm_set_memory_region':
> >> arch/x86/kvm/../../../virt/kvm/kvm_main.c:2049:41: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     2049 |                 new->userfault_bitmap = (unsigned long *)mem->userfault_bitmap;
>          |                                         ^

I realize that, not only have I done this cast slightly wrong, I'm
missing a few checks on userfault_bitmap that I should have. Applying
this diff, or at least something like it, to fix it:

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b552cdef2850..30f09141df64 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1977,6 +1977,12 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		return -EINVAL;
 	if ((mem->memory_size >> PAGE_SHIFT) > KVM_MEM_MAX_NR_PAGES)
 		return -EINVAL;
+	if (mem->flags & KVM_MEM_USERFAULT &&
+	    ((mem->userfault_bitmap != untagged_addr(mem->userfault_bitmap)) ||
+	     !access_ok((void __user *)(unsigned long)mem->userfault_bitmap,
+			DIV_ROUND_UP(mem->memory_size >> PAGE_SHIFT, BITS_PER_LONG)
+			 * sizeof(long))))
+		return -EINVAL;
 
 	slots = __kvm_memslots(kvm, as_id);
 
@@ -2053,7 +2059,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			goto out;
 	}
 	if (mem->flags & KVM_MEM_USERFAULT)
-		new->userfault_bitmap = (unsigned long *)mem->userfault_bitmap;
+		new->userfault_bitmap =
+		  (unsigned long __user *)(unsigned long)mem->userfault_bitmap;
 
 	r = kvm_set_memslot(kvm, old, new, change);
 	if (r)

