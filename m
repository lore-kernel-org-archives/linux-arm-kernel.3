Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA1BCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjoY/Y//bNqM95eGJvwXGt/YGARtJeL2jF1lkb5NGWs=; b=cdtAtZg9hFel6upTm9fLg2KZwc
	UsgLn/GLIS3SbgtXQCAb28PqDQunIHLJfDlu2APPkWeXiVTZfpiZSNZN0AJ/4RATKCsv7tpxzBGAb
	B+Est5ignKmrONu6JcZlnXaSalLUMYXcZQNmtS6W5wuU520OdUnnmlD5LbtByqjme1lAYxvPSDdup
	DQyvMJSrtfsyvyQa8VJb7ZQFNYX6QARScIWWrrVKuZ2OS4okB+U3/SvIMmylL5W/fGRlzo15RbJLa
	4p+BYHw7v7xvzl1Gwh7De1ElpMgCs9go/ERPzOZCioT5Ija8fUYYBsQed3yR2AI73yEaROoOi1G+N
	JQqUEalg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfdQ-00000002jQd-0H7N;
	Fri, 16 Oct 2026 10:58:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfdN-00000002jPn-0Bte
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:57:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49d05d51553so20608365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792148275; x=1792753075; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JjoY/Y//bNqM95eGJvwXGt/YGARtJeL2jF1lkb5NGWs=;
        b=VnqIkE2qbbYFPmmyvnVRag0g0UeBK74AwJA6EObM2tIqqkAZp6dVgwPiZRcjnTeL4Q
         g16FlixBdn5gbn3cTosRCWxqQId6iYC9TdFIxaPvlzR4dDr/qACVWsL7ARwlSoMS8bT7
         XZemdZkL6g+eYWTB5qrAQIBema2C0boUItGjg8Yo4zwkMkeRDZMpKA+p5BhCHjmoOdmK
         Xl6j1mYIxpWvtZ+w+nFPHEWwlxek5FcHJnz1oUcTLHrinqbzhXeyDBhyOZtWmtcZY1Hg
         wiHhe8WXitjZ6bCVRf8Vs4r/mae1eYvvGuiA5sevzKGsTTZ/l7herdYS5TOKxDSU4UFL
         kYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148275; x=1792753075;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjoY/Y//bNqM95eGJvwXGt/YGARtJeL2jF1lkb5NGWs=;
        b=pXzI1dt0dkA+uU/joa8eIGAv9pI1IdmDepXAT9rTY4Zwe0b2mx1sSWsCHubxa73WeP
         v0dJSEoaXbeVxdmQ0DGeZnTxPHEiOHtN7uQAPsGeGzALPJjQJjDY7I1JSqICbBdrhm04
         +K0sPwpWMqlGzGIFsPvKn0vrL3467DGl/mys19JhNxkE3+OGKx37IyNvy4OARb7mhNi6
         kLqKK7r/X0zXlcVbR20//1LBQ8w153cdIDkeN8EQAIEbQ1wuQcXubBPgA+8RzWsswXbH
         aYYY5kl+evTIYF+Yy6ud87KLOxDs5yjZ2rchuFdcP7615hYNN/5i51bwOiOSxcZB4BeY
         wHiw==
X-Forwarded-Encrypted: i=1; AKwUvBz3QFWWtl3bU6E7f9e6pFyjfTfhTJB4GvwlSJur9fkMcUHE/bF0GL1sonzhXom4exK/mh8hFD8vUIjLjW2q4ND+@lists.infradead.org
X-Gm-Message-State: AFq9FYLqgyTsv3CjOiil7lN1+GxJ3Md4sHjy3T+/FnDQHJgcnN+zapyA
	Emw+ZbxspatLfpfsx8A05Lvl8pDq0Xi2D6meXLaAWed8q/ZGsTnzoJpj
X-Gm-Gg: AYBFou34PayXN+Q6bpkDG8UXJM7LRHxi4Ap1SGrJ3WNnvPkQ4oUh+kIw+hZUPhqR1U1
	6OJOlZe3x7KkeR3WXB7iisTly3CglewWjC+xc0TvaMBUAXYXDnG3baleEcQWYbTUrVaApuiMFpZ
	6YOXIDo0gBBwdGp8rqenGP8tmuSKPQ0hzEdjPQd6zAwNFThIhs1oH+MpFe4/JkVik9HP7O8OLIA
	eGG8zxP5tBLVzq86CiRqBrV1Gis2euIUDUUD7gb7scQLKylSHX+pSeglFwBpMUP1ztyvlJOB6yW
	tZyyD3t5FiYnzSIWxRIdIRTLynxY+F/p3EQFcz3/+zY21fyEtLZLQudk119kSoMlq7Ud5tv5Sia
	ML0NLCe1y7HEesmFHJ7CVYHkRR56VXdQSHQAcXkEqnl4FT5rEkBAKazTPHxJb/yDr/iH2eEeVAV
	QADmXxZlyYkLRNlWmXlCMcnrVDPbgf3oHtdrzqTHAEXIpnQ6Zmr88SJZF2r5xAU2fDV1BLYgmTC
	mInepanb7vWvIwsBdvoq7XX86eddhgHgywi4t10NBRx13G/mFz8xwNHzFLsGiIGldF7uQcubR6A
	C/qi3OVbGB2fzmHVbFHkF4WTdQ+SYex98Gg=
X-Received: by 2002:a05:600d:82c8:b0:4a1:cedc:ab51 with SMTP id 5b1f17b1804b1-4a1cedcac09mr30065765e9.35.1792148274917;
        Fri, 16 Oct 2026 03:57:54 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ae6d2esm50003685e9.6.2026.10.16.03.57.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:57:54 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 00/11] mm: Memory providers for guest_memfd and iommufd
Date: Fri, 16 Oct 2026 10:57:52 +0000
Message-ID: <20261016105752.68015-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <yq5a4iem57qv.fsf@kernel.org>
References: <20261014093733.90312-1-griffoul@gmail.com> <yq5a4iem57qv.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_035757_118121_0AB14319 
X-CRM114-Status: GOOD (  28.69  )
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

Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:

> What confused me was the introduction of memory providers as a subsystem
> in their own. What we really need is the ability to map PFNs from
> other subsystems into KVM stage-2 and into subsystems such as iommufd?.
>
> Restricting the scope to the above, at least initially, would make this
> much easier to reason about.

Thanks for looking at it. I should have explained this better in the
cover letter.

A memory provider is the driver that owns some memory, like a carve-out
or a device BAR. It lends pages to whoever maps them, and it can take
any of them back later. guest_memfd is one user of that memory, and
iommufd is another, but neither depends on the other.

With this series, iommufd can map a provider file without any VM. Today
it cannot map such memory, because memory without struct page cannot be
pinned. For example, a host service that recycles provider memory
between VMs could clear it with a DMA engine driven through VFIO and
iommufd, instead of the CPU. And since such memory can outlive the
process, or a kexec of the host, a network or storage dataplane could
restart or be updated without losing its DMA buffers.

> For my use case, the VFIO fd becomes the backing provider (referred to
> as backend below). We can create a guest_memfd using that
> resource_fd, allowing MMIO BAR ranges to be mapped into KVM stage-2.

That fits well. VFIO could be a provider for its BARs: get_page()
reports the BAR frames with the MMIO type. guest_memfd takes the VFIO fd
as resource_fd, and iommufd can map the same fd. That could also replace
the dma-buf plus symbol_get() path that iommufd uses for vfio-pci today.

> Another feature provided by this series is the ability to map the same
> range into iommufd. We probably want to restrict this to shared ranges.
> It may be simpler for guest_memfd to drive this.

Agreed that guest_memfd must drive shared and private. I replied to
Ackerley on how that could work with the provider interface:

  https://lore.kernel.org/all/20261015171746.51538-1-griffoul@gmail.com/

In short, on a conversion to private, guest_memfd claims the range on
the provider file. The provider code in mm then revokes it for every
other consumer, iommufd included, and hands them holes until guest_memfd
unclaims it. So guest_memfd stays in charge of conversions, and
iommufd only ever maps shared pages, without going through guest_memfd.

> Currently, a private-to-shared conversion causes a VM exit, followed by
> an IOAS_MAP for the newly shared range. Could using guest_memfd with
> IOAS_MAP_FILE avoid this?

Yes, the IOAS_MAP goes away. The conversion itself still comes through
the VMM, but once guest_memfd unclaims the range, iommufd maps the
pages again on its own.

> Perhaps the series could be rearranged as follows:
>
> - Allow a guest_memfd fd to be used with IOAS_MAP_FILE.
> - Add a VFIO or other backend for guest_memfd, without calling it a provider.
> - Add support for guest_memfd to provide guest PFNs to other subsystems
>   through its file descriptor.

I'd rather not make guest_memfd the only way in. With kvm_gmem_ops,
each backend implements a guest_memfd: it binds memslots, invalidates
KVM's mappings, handles the host mapping, and for confidential VMs
prepares the frames and gives them back to the host. That puts KVM
internals in every driver. With a provider, the driver only reports its
frames and revokes them, and guest_memfd does the KVM side once, for
every provider.

Your diagram already uses mem_provider_ops between guest_memfd and
iommufd. It is the same interface: get the frame behind a page, and
revoke a range. So I'd define it once and let drivers use it too. That
also covers the cases above, where there is no VM and no guest_memfd to
go through.

guest_memfd can still provide its own file to iommufd where there is no
provider behind it, for a guest_memfd that allocates folios. That would
use the same interface, and the same iommufd code.

Would that work for your VFIO case?

Thanks,
Fred

