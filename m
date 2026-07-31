Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923BFC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ytOyVvVUp1+iOjUCBAJJ+Zr5Yli10sJrrWCx9PaxhI=; b=xUwNFz4azY65NtezqI6orQoi4Z
	q5ywb7sT2pdhwY7mZSpINdzc4hfONedlgFGWbiIAXYhglKO43JvK1sfNGp1yARL3ZpJrvjaf7CUDr
	UoOXszOE95UcyYmapH3H/O6RFj01VLDZ/ZcY4wY1gMk/dqAiaLtESgjhUUxDsG5d+KceZdHzKXtr2
	X7ymQeZQMIEwgsw9pNRw1mASoC+WhjxD6FWUzGde0vaSHzHkLnOyMD7fnh+43Ad8eAVKnC1ldZGCB
	aZpt7RuIuz0O02NZn+jNt1kVn97X7cJ5ao3SG2eHMfRdObC9KmfNuJYKtTxv23MGWaBG9pUO1Al1v
	UNng6EOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpptt-0000000CySs-2OBn;
	Fri, 31 Jul 2026 16:15:57 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpptq-0000000CyRh-0QFj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:15:55 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2cfe48ca1efso16425555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 09:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785514553; x=1786119353; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ytOyVvVUp1+iOjUCBAJJ+Zr5Yli10sJrrWCx9PaxhI=;
        b=T5U8bdwRuUZ5sXNBDc43hPLH/3UGwyNbWQVYr8kT/De0Mu7KsVRs7wpUR6OW50rRBk
         M4NOHmJmSkfmwnu/rGsVPHYEH76IiPqC65pCgZLulIOb1XQvXblL3SbpfkCRyQZDL37N
         T4yU1AVFaaFuYpKPwZKBB7n3J7fiRSVTiTanCE+P6ISJ79deQHKRAEn5OJJlBgj4KQdm
         ecvOrRc7R8ECmG/D5i4JYMpGLlavdXKUmEPSWTQsRwzvrZ1eBHdIziMBxNvo/S9BYYZA
         VUijOcGv2MK7cQuk1H9GTWf/V7LYROENNfFMbBoEkQ/vqGvyQtOjz+r9Sb56Zh7gTtsB
         WCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514553; x=1786119353;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ytOyVvVUp1+iOjUCBAJJ+Zr5Yli10sJrrWCx9PaxhI=;
        b=acYTm5NQ+sUIjj2PIe98e7hmYOd/bE32FNBEL6omcUaLSZIm6Awo7J9R67gieTuU88
         WwmPD58OhsN2ZbdYNId0seZpXBRSduZY8hOIZBffo14IWT0d5XTKqlW+UWGoCvbzmu4j
         SBFcPkSyskfBOMq+tcgAQH4CU2x3pRqvfymGW+XkSHyHsJXlBLcFG5r151zK5JCZ9l1H
         0GdlBaU1sTtXrCeV2FrlxSmvO4XNf5uqdpDlhkWD3f/MJQVk/qIFRq1tsPl3hRF0/WE+
         fnpNUBtHbNPaSaMJOISu/0l0fQ+xEc2hPyUx77vJTzNPZJS7YfUTeYumHz15zFg+S3tb
         JoGg==
X-Forwarded-Encrypted: i=1; AHgh+RrYRn64rmogDqo0ePsVK2EFikeRPzLaPpRA7w/SBQrCJSzNtC4pyDeYGnrFx6uxcvJf3yEjRHb/i7vIyp7hhfmX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh58We0USInUK0jMdVs2gupxHq6REklsVQ9xgOGCWundRlzHcQ
	VsKoY4209SNn7kiIXdmZpKoy++5aIODJSsKCGZ2BPqW2e1Ksef2wNoDNFuGUSBg9hMj469Jhdjo
	sCXcuog==
X-Received: from plbjg5.prod.google.com ([2002:a17:903:26c5:b0:2d0:40fa:a53d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2410:b0:2d0:4021:bb62
 with SMTP id d9443c01a7336-2d0521bcc4dmr5824855ad.16.1785514552447; Fri, 31
 Jul 2026 09:15:52 -0700 (PDT)
Date: Fri, 31 Jul 2026 09:15:51 -0700
In-Reply-To: <20260731145435.1016137-B-seiden@linux.ibm.com>
Mime-Version: 1.0
References: <20260731130902.654679-1-seiden@linux.ibm.com> <20260731130902.654679-2-seiden@linux.ibm.com>
 <20260731145435.1016137-B-seiden@linux.ibm.com>
Message-ID: <amzKNzYWD1ngXdOZ@google.com>
Subject: Re: [PATCH v5 01/31] vfio: Use file-based reference counting for KVM
From: Sean Christopherson <seanjc@google.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_091554_144020_3B755FB5 
X-CRM114-Status: GOOD (  17.47  )
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

On Fri, Jul 31, 2026, Steffen Eiden wrote:
> On Fri, Jul 31, 2026 at 03:08:29PM +0200, Steffen Eiden wrote:
> > Replace manual module reference counting with file-based reference
> > counting for KVM integration. Previously, VFIO used symbol_get() to
> > obtain function pointers for kvm_get_kvm_safe() and kvm_put_kvm(),
> > then manually tracked module references through these symbols. This
> > approach required storing the put_kvm function pointer in each device
> > and carefully managing symbol references.
> > 
> > Pass struct file pointers instead of struct kvm pointers throughout the
> > VFIO-KVM interface. This leverages the kernel's existing file reference
> > counting mechanism via get_file_active() and fput(), eliminating the
> > need for manual module reference tracking. The file->private_data field
> > provides access to the underlying struct kvm when needed.
> > 
> > This simplifies the code and removes all remaining externally exported
> > symbols for KVM, paving the path for a second concurrent KVM module.
> > 
> > Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> > Suggested-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
> > ---
> >  arch/x86/include/asm/kvm_page_track.h |  8 ++---
> >  arch/x86/kvm/Makefile                 |  3 --
> >  arch/x86/kvm/mmu/page_track.c         | 16 +++++----
> >  drivers/s390/crypto/vfio_ap_ops.c     | 24 ++++++++++---
> >  drivers/vfio/group.c                  |  2 +-
> >  drivers/vfio/pci/vfio_pci_zdev.c      |  7 +++-
> >  drivers/vfio/vfio.h                   | 10 +++---
> >  drivers/vfio/vfio_main.c              | 49 ++++++---------------------
> >  include/linux/kvm_host.h              |  2 ++
> >  include/linux/vfio.h                  |  4 +--
> >  virt/kvm/kvm_main.c                   | 23 ++++++++++---
> >  virt/kvm/vfio.c                       |  8 ++---
> >  12 files changed, 81 insertions(+), 75 deletions(-)
> 
> @sean: This is based on your draft in https://lore.kernel.org/all/adkFk3ZN4HJtpLA3@google.com/
> do you want another/more attribution? 

No preference.  Do whatever feels right to you, you'll know better than me how
much of the final code came from me.  If you want to give me a Co-developed-by,
here's my:

  Signed-off-by: Sean Christopherson <seanjc@google.com>

