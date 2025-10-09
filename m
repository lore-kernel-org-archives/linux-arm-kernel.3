Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BA4CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 21:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyG7Vshnn1y3ko5tY/OsDeeGP+hnaQE19ZgqRlKar30=; b=o5DIHvx8k7dQdhk8WIFu2Ibkq5
	0lUhDx/NjEzDZhOfvwvU5TodzBc+SjCUDsMSFWU+FB9bq86Kmm1IOfVeZHWAm7RSlKAdVzBbEeMZG
	x2xp6eVd5KQaHzWaFtPccsJXym+e6m8KmFLka3a5fhIkiokeHWDYP0492Eom2+rATJxNKkfj353PU
	hdGihG2bFFDfK+rylNZvAfRtD0eOztY9sQDpKAQswZZfTcQZzx8S0KX/XuVnmD0ksjBT3F72vfFN4
	g4KDbqxUBYOWSuRIbModmNdA8eTsYGff/G1bB1gPuC5ybTO18Y3Y37q/sz5iLYf669EXibz5QGpto
	ZaN9XTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6yAG-000000079l6-2jjj;
	Thu, 09 Oct 2025 21:27:08 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6yAD-000000079km-1qtJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 21:27:06 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-782063922ceso1739036b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760045224; x=1760650024; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VyG7Vshnn1y3ko5tY/OsDeeGP+hnaQE19ZgqRlKar30=;
        b=nDlblVv20JYsUcU/X4b/OrH3gMRtizfKB7Gm1dLwGUBeL+m1mWZY0qR47PZnykFh0e
         sC2ppSQRV09b9KMiWrMo9dH87aJWDAGtKPIXo+wnM4QrexGIW4tIQviTC4vLTLv39z8B
         dHNW+o+8G/EalckAlUbwXCKwp2ePKiwdlM6SHqn42W3vECwtoWvSxU0LxdqwQoB+pTnm
         fQOcRo2fFjOXuT5SYdmXecXInnCi9B5k1bZkSBOyRSPRRSalmqrrhuxtpxRJ5G0VkuAS
         t6A0v3Xw5k2R4vZLBhXa2PvLNam48iC/qnWkSXYo6SCvfTExh6hBePQnjZmZjcJEop38
         cp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760045224; x=1760650024;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VyG7Vshnn1y3ko5tY/OsDeeGP+hnaQE19ZgqRlKar30=;
        b=ethTEHpGYVkNEKCrMffNXskkaq+t7GThtR3euV2HqgA51Pbrr03isDuCRPs3tAAAOR
         peFpauXYmITPwJ8RZCVjXQkdYke94CaCj5uORGllHxU8hVtAbAlrG4M25AXDteDIs4Ik
         pxHWCzq11Wu3qC32Ug4EJQn3e2oH0ndclslSIDsHYW8A0bzk1UY24CW2u8nfToqilso3
         z6MPC/4LfbjENRgY8K37Oq6aNmmW9Pn2cPrSqaMC2wNlZ+mRVzAFycxGNp57uHakNjzx
         w86kKTxUAR7ai3olrzmFhuvtjR+FTrH/swJ12EEEBCsAzz/shPIG75TbQ9+5bVKTiDYU
         CsDA==
X-Gm-Message-State: AOJu0YxpDswnRtzCRxN3AGyyAhQ+kSD06Lao1JkgH/MPAMBdTqxXtShE
	8P8dD1x0kSOw9jc2eL44XlLg3kKb8faotz4zELLqHFa1+Kze22M+oTMDyXTVF5/282X1ef5aqSI
	ATzGSBeuu7dghBDGd18nbPh/YeQ==
X-Google-Smtp-Source: AGHT+IEXSCT7Ge93/eS1ZLL+wIsHzqCvUWVK2zdip6A/DIomUySbaHDcPWrDH/GuqrKumWfw/V6m+o1hEtdfCxTDkQ==
X-Received: from pjbms8.prod.google.com ([2002:a17:90b:2348:b0:33b:51fe:1a80])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:33a6:b0:32a:6d26:fb5a with SMTP id adf61e73a8af0-32da80b8305mr11558495637.4.1760045224327;
 Thu, 09 Oct 2025 14:27:04 -0700 (PDT)
Date: Thu, 09 Oct 2025 14:27:02 -0700
In-Reply-To: <20251007221420.344669-3-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com> <20251007221420.344669-3-seanjc@google.com>
Message-ID: <diqzwm53hil5.fsf@google.com>
Subject: Re: [PATCH v12 02/12] KVM: guest_memfd: Add macro to iterate over
 gmem_files for a mapping/inode
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_142705_485845_E70A3A9E 
X-CRM114-Status: GOOD (  17.96  )
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

Sean Christopherson <seanjc@google.com> writes:

> Add a kvm_gmem_for_each_file() to make it more obvious that KVM is
> iterating over guest_memfd _files_, not guest_memfd instances, as could
> be assumed given the name "gmem_list".
>

Can we also add to .clang-format:

diff --git i/.clang-format w/.clang-format
index 48405c54ef271..e4df86f2d3cf7 100644
--- i/.clang-format
+++ w/.clang-format
@@ -541,6 +541,7 @@ ForEachMacros:
   - 'kvm_for_each_memslot'
   - 'kvm_for_each_memslot_in_gfn_range'
   - 'kvm_for_each_vcpu'
+  - 'kvm_gmem_for_each_file'
   - 'libbpf_nla_for_each_attr'
   - 'list_for_each'
   - 'list_for_each_codec'

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Tested-by: Ackerley Tng <ackerleytng@google.com>

> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/guest_memfd.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 3c57fb42f12c..9b9e239b3073 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -22,6 +22,9 @@ struct gmem_file {
>  	struct list_head entry;
>  };
>  
> +#define kvm_gmem_for_each_file(f, mapping) \
> +	list_for_each_entry(f, &(mapping)->i_private_list, entry)
> +
>  /**
>   * folio_file_pfn - like folio_file_page, but return a pfn.
>   * @folio: The folio which contains this index.
> @@ -159,13 +162,12 @@ static void __kvm_gmem_invalidate_begin(struct gmem_file *f, pgoff_t start,
>  static void kvm_gmem_invalidate_begin(struct inode *inode, pgoff_t start,
>  				      pgoff_t end)
>  {
> -	struct list_head *gmem_list = &inode->i_mapping->i_private_list;
>  	enum kvm_gfn_range_filter attr_filter;
>  	struct gmem_file *f;
>  
>  	attr_filter = kvm_gmem_get_invalidate_filter(inode);
>  
> -	list_for_each_entry(f, gmem_list, entry)
> +	kvm_gmem_for_each_file(f, inode->i_mapping)
>  		__kvm_gmem_invalidate_begin(f, start, end, attr_filter);
>  }
>  
> @@ -184,10 +186,9 @@ static void __kvm_gmem_invalidate_end(struct gmem_file *f, pgoff_t start,
>  static void kvm_gmem_invalidate_end(struct inode *inode, pgoff_t start,
>  				    pgoff_t end)
>  {
> -	struct list_head *gmem_list = &inode->i_mapping->i_private_list;
>  	struct gmem_file *f;
>  
> -	list_for_each_entry(f, gmem_list, entry)
> +	kvm_gmem_for_each_file(f, inode->i_mapping)
>  		__kvm_gmem_invalidate_end(f, start, end);
>  }
>  
> -- 
> 2.51.0.710.ga91ca5db03-goog

