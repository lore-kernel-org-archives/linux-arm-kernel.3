Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9BAE69186
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 18:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sYuGQL1WZhF2hZ3J+JuipVRSYMiUCSOWCts3kbR50A=; b=JPZv6hSh1z6uEDVL0VdcTzdPpG
	T9ehtYBXBB3NfAhgufIEa8gu/Wn2DnjmKZt8urTukb+QsIEKsCZy6SVoygaa53zA4ywybCoqhcQ1c
	IDnJJTfSHfwqyR5ijjv6uDRZie6IDgvQ6q9nbvDM/OiL93XNNc985bJ7XAqPAuSYS7n1Xi3CucPrS
	OBO+kOchS5d5FH8IJxTG+xdfbVZeXxWjKxNvSj8BxtV+ZVNRMhjjr3PtAb527MASLl/ijFyZbdLOA
	x91kB3ebifd5woMMERglBjehb8af8tDnWr8rS+WUaKPhXDR/AhUAJ+YZd1YP/7auDLQeQpCTmXnuh
	WQsNbuLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEYJx-000000036gH-2Hfm;
	Fri, 22 Nov 2024 18:23:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEYJ2-000000036Tj-00lD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Nov 2024 18:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9sYuGQL1WZhF2hZ3J+JuipVRSYMiUCSOWCts3kbR50A=; b=cbSvla7iPzxM6su8n80MIGoprm
	S+XTGfyXS26q0XPJZk402JCQashv0FVUmR9e5nqkM6A4/NUqk5ACCwY41XdwkX5lAWwZEOxa/YED3
	kxiKQOnp/rEYGoNa/EgL9HQ5Ds2fh3wiDja8v6+l1FmxXDjmCMPwfS+dMG2LkeFHpOq7/8b+mGuNt
	N3n5B3uye5L1DQ7tDPrmPgwy7GOFVso//2eg+HA3Pi55t0t8nnuPEt4kG1AgBRXmmawAToDF8P+7v
	ayC6bo0RQ0Bed9NsmeCJhHPgZmrfoiFQgDyBLTFMyiTbQUCB46To4bPPbgO6MCzScg1su5w8aiUWf
	GK6C7cQg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tEYIw-000000088Di-12lh;
	Fri, 22 Nov 2024 18:22:54 +0000
Date: Fri, 22 Nov 2024 18:22:54 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Fuad Tabba <tabba@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	James Gowans <jgowans@amazon.com>, Mike Day <michael.day@amd.com>,
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-nfs@vger.kernel.org,
	devel@lists.orangefs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/2] filemap: Pass address_space mapping to
 ->free_folio()
Message-ID: <Z0DL_jL4Tw_Z1LKD@casper.infradead.org>
References: <20241122-guestmem-library-v5-0-450e92951a15@quicinc.com>
 <20241122-guestmem-library-v5-1-450e92951a15@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-guestmem-library-v5-1-450e92951a15@quicinc.com>
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

On Fri, Nov 22, 2024 at 09:29:38AM -0800, Elliot Berman wrote:
> When guest_memfd becomes a library, a callback will need to be made to
> the owner (KVM SEV) to update the RMP entry for the page back to shared
> state. This is currently being done as part of .free_folio() operation,
> but this callback shouldn't assume that folio->mapping is set/valid.

I think this could be slightly clearer ...

guest_memfd wants to inform the owner of the page that the folio has
been removed from the mapping.  The best place to do this is in the
free_folio() callback, but the folio's mapping pointer has already been
cleared.  Pass the mapping in so that the callback knows which mapping
the folio has been removed from.

> ---
>  Documentation/filesystems/locking.rst |  2 +-

Because life is hard, we also have documentation in vfs.rst.  Can you
please update that one too?

> +++ b/virt/kvm/guest_memfd.c
> @@ -358,7 +358,8 @@ static int kvm_gmem_error_folio(struct address_space *mapping, struct folio *fol
>  }
>  
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
> -static void kvm_gmem_free_folio(struct folio *folio)
> +static void kvm_gmem_free_folio(struct address_space *mapping,
> +				struct folio *folio)
>  {
>  	struct page *page = folio_page(folio, 0);
>  	kvm_pfn_t pfn = page_to_pfn(page);

You could just use folio_pfn() here; maybe sneak it in as part of this
patch or do a separate patch for it.

