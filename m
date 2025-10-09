Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8727CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 21:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAMGpTBb5JIMylmtnuNcSJ5s50b2UQUcn7vzXw649qs=; b=NXfK1J+k25oNO77a5/vYM2oahS
	iqBrbUbWUaqeN0b8ijcY86tbod5ydqcQXuwX2HSVgS7LUXJ463sIpl1LRpV7buYEw5osWr2f8+mp/
	LgqGf0FLEpzieGm8kJMEDLkT9C19Yk4kJEjp0DSXQzJIv1P/4rrPJyfLBDRlEZqUwyuSXvMbdscXT
	H/41ZobR+J83wWOkeHJS5nKM+8Oj1CUNUMwRw0CeSiHcLDi5muTM3wMDWZCMnS+AI3PAdYbDhX3h/
	IlNoMqpsnVMSllt7BiT9liZ9nHxrNdweXCTo4EjVd0C4+kiVoj6pzvkqEFv2WxUJDgdUZXdTziqfB
	QTWqLb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6yLw-00000007AoF-1WRR;
	Thu, 09 Oct 2025 21:39:12 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6yLu-00000007Anv-1k94
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 21:39:11 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b4c72281674so1754376a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760045949; x=1760650749; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GAMGpTBb5JIMylmtnuNcSJ5s50b2UQUcn7vzXw649qs=;
        b=Cxzd14Ni5aq9S+B2zNavUDrhUFdAsQ8Hh7+3WuQmjrENf29v58PJdRxjy4dkc9dSsH
         HgsDLI43Ywo+92Pv1Zsld0x/qgmKaeToKqWRxlOFiXHzQrY8MX70DcqSOJ9VJX4brpj7
         LntrP3dVouM1QhRY1GEM9F32hkSVqCfKQ4zAdEkO7SQ4wD6TOZJiniH7OQiWrGR6G0QQ
         AFra+krCBl+IvuEer5YMUENhZcwXS1FpiOokyI34M+tFpu3h2GiSvum6JhocCKvGzcKH
         w9sMjlM24c2ya+eMy8In2uW6/1PCr2wPzvvh+tuZM59pKgZQxjPjSbAMLKge8bSFrExT
         LXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760045949; x=1760650749;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GAMGpTBb5JIMylmtnuNcSJ5s50b2UQUcn7vzXw649qs=;
        b=LKW3Vw1lSfIIcMbrzTTwIDU559vyatrvLT2ou8APpVIdv/VfiZZZX8+wKdrqs16/4r
         WAvmQQEy7ZQ3foby0yowNl4VUl/17fJW+RYTxpyuRzHpe2JBX5bt2QDcB+0UqMcXqobE
         H9ueljhQs0Pklsr71rf7LRWV6rUK+p3acr72ap4wI4wOQ/MvNApCQjTgYoLQ5gdyEjNb
         qrvAmwFjyASmHlEKYYhpyDM+oAPkYilgsCXsI/zYF1HeBCDPMcTWp7KyHEyos4lo7GvX
         bD+36bJrIVY7eiiEZcqVwtkIJqvX40E/Btue9k5t+TWcBAGiUBgM7gOildmlcAJMEzoG
         VuvA==
X-Gm-Message-State: AOJu0YyQihs0yys61hic7f5hQ9d+S/gkzZLQ+goEXrG5KEulv++CoJdX
	azZABZsHaQ74lsO1FYRVQ9Nu87m1WH0Yivp7gUg08K62ah49PN3vyt3HmFsswpOuiyfAB+1f8ZF
	cn7pSeNcZuOaI2Vi0iHTXsjc8OQ==
X-Google-Smtp-Source: AGHT+IHiLO0Tc7T4efMeJ7arhzRn2QVrxkkt3xAe4o5ah0mgwx2R8IQxbSx0reBo3eWBl5LTjIgto1JJK2FqbDLCmg==
X-Received: from pjbne5.prod.google.com ([2002:a17:90b:3745:b0:330:8b1f:c4e7])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1b50:b0:332:250e:eec8 with SMTP id 98e67ed59e1d1-33b51168e20mr13156235a91.15.1760045949059;
 Thu, 09 Oct 2025 14:39:09 -0700 (PDT)
Date: Thu, 09 Oct 2025 14:39:07 -0700
In-Reply-To: <20251007221420.344669-5-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com> <20251007221420.344669-5-seanjc@google.com>
Message-ID: <diqztt07hi10.fsf@google.com>
Subject: Re: [PATCH v12 04/12] KVM: guest_memfd: Add slab-allocated inode cache
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_143910_455761_BF9188CE 
X-CRM114-Status: GOOD (  11.93  )
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

> From: Shivank Garg <shivankg@amd.com>
>
> Add a dedicated gmem_inode structure and a slab-allocateda inode cache for
> guest memory backing, similar to how shmem handles inodes.
>
> This adds the necessary allocation/destruction functions and prepares
> for upcoming guest_memfd NUMA policy support changes.  Using a dedicated
> structure will also allow for additional cleanups, e.g. to track flags in
> gmem_inode instead of i_private.
>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> Tested-by: Ashish Kalra <ashish.kalra@amd.com>
> [sean: s/kvm_gmem_inode_info/gmem_inode, name init_once()]
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Tested-by: Ackerley Tng <ackerleytng@google.com>

> ---
>  virt/kvm/guest_memfd.c | 77 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 1 deletion(-)
>
> 
> [...snip...]
> 

