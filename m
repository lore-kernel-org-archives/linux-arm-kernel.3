Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A118CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 14:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igg3zobfFtydVGAelA7JZ01NRykTuhkzUPbgteiqM9Q=; b=3Z+PPJ/5VS2pNRB4pyAE8j6NgZ
	51YLgc2kKW7pvhRiITt5rBWTlM3iPKLccQ2RG7xcs4kxdKbvahTT8OdvxMCVWvAI71GoupJJc/F59
	bo+ibC/rT8sp3x+5U0SIEgwv0cisc9jPZ82gr/B3OJ4HCibgUpP2iR6wVk0Bw2ivXt04NrecMWGif
	pUqoaawlHfqv+vdwlDWRKX2YCezQoCYgVugfurNChhGFzZc0znXEUP6rWySYnNqJSSKJ5GPFSPX4y
	zJF/IVmcuTTT7u5d7hO7elH4OLGwqrNu3IcC5Km+Iq/UnEe97rtJ6fVsrfAgEIECMUWvS1MZ93xr4
	vzV4JQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ltn-000000098XI-0AKI;
	Thu, 03 Apr 2025 14:50:31 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Lry-0000000983Q-1zyG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 14:48:39 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-736a7d0b82fso1292461b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743691717; x=1744296517; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=igg3zobfFtydVGAelA7JZ01NRykTuhkzUPbgteiqM9Q=;
        b=xQPNxKOAhkj1WCheIAaqGbaA1CJM6iI+QgEVJ+No7NEXXosOIhtukY1Ul2iIzgxrKX
         dC/tBafqZSVfNboxqXuf4O+twpNptsBDcLwc58SAK3AP38O4HVDdvf88uoAB+OSI+SAv
         hR4OX27UYvY3dY0Yua38ceV0I+0xZQYF4Z9OSr3ZAaL1eTN1eLNr1TGq+R3firX2MHxf
         qPVBl8nnp3f/RIfTylHz2nwZZZOlVcfoGKAvx92cTJDdIBkGYTJb/WIb2aa1CZLsCRKf
         d4h5Jb1V28wmEE9d/6sLCCjVjJTgYEtmVUBfa0ZdrRAoCuLIZWdO11wfxkkTl0h0QlSw
         3Tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691717; x=1744296517;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igg3zobfFtydVGAelA7JZ01NRykTuhkzUPbgteiqM9Q=;
        b=Qfzjc/l+Vwy1LJ6UwrVbXJuexvU0f16mQHLKiTCjAW3aIH+A2X6iBrp/oRzCWCn/zl
         xXVU0Fgkm71KgZzU7sfNuECytJNVIGFd0O0ThZcxAgzx1eIauB40Qzf0gQiN8bFZ4yUa
         7wC+H1FvDE0W7LNSgFLYeLH5gxyGhgSf5+NOUCASzMTjBIbjODGlUZt6RIr3tkAjdsix
         6OomjQA6UxXn/Oi25dWD8B3nnYo+67cUyAQDo/09B9bO6iRUuPcqZxHkKeFt96srjKyL
         BSEvaissPQUrZD6jhcm1OfHyOcEuXwfKYnTElAR3hKnEEqH4slilfR9aF56B9gdZTljy
         TM0g==
X-Forwarded-Encrypted: i=1; AJvYcCXZdsLxoLMhNK7/4SkDD5HXiPMT9Ltek98gfVRRYmrfY4i3w566OpfNr8fk5Y6wuFjjVut0PBkHwI7A1OsIsI58@lists.infradead.org
X-Gm-Message-State: AOJu0YyH39Qk8K418okWvKTf8hcIsZ3YMPM6535NGBtuqr6FaOxSTahe
	w3zgr3sb1CGLq1JmJT08PTr8rZlPe9/l1s9JITgtBci85lpOYfdNdFLSg8MMP1Qur6/kfRhp/RG
	VrA==
X-Google-Smtp-Source: AGHT+IG9IJrC2WV7WLtmMSWgTecisx21a4/DmbtG4CGcCIp6FaiyOk56NSQtsUf8hBMYnyjC9Po0xvGrGdU=
X-Received: from pfam26.prod.google.com ([2002:aa7:8a1a:0:b0:734:6f4e:794])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:848:b0:736:5b85:a911
 with SMTP id d2e1a72fcca58-73980399504mr32373172b3a.8.1743691716806; Thu, 03
 Apr 2025 07:48:36 -0700 (PDT)
Date: Thu, 3 Apr 2025 07:48:35 -0700
In-Reply-To: <Z0DOdTRAaK3whZKW@casper.infradead.org>
Mime-Version: 1.0
References: <20241122-guestmem-library-v5-0-450e92951a15@quicinc.com>
 <20241122-guestmem-library-v5-2-450e92951a15@quicinc.com> <Z0DOdTRAaK3whZKW@casper.infradead.org>
Message-ID: <Z-6fw8VuDTk4soN8@google.com>
Subject: Re: [PATCH v5 2/2] mm: guestmem: Convert address_space operations to
 guestmem library
From: Sean Christopherson <seanjc@google.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Elliot Berman <quic_eberman@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Mike Rapoport <rppt@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	James Gowans <jgowans@amazon.com>, Mike Day <michael.day@amd.com>, linux-fsdevel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-nfs@vger.kernel.org, 
	devel@lists.orangefs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_074838_512746_95CA4E9B 
X-CRM114-Status: GOOD (  14.89  )
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

On Fri, Nov 22, 2024, Matthew Wilcox wrote:
> On Fri, Nov 22, 2024 at 09:29:39AM -0800, Elliot Berman wrote:
> > A few near-term features are coming to guest_memfd which make sense to
> > create a built-in library.
> 
> You haven't created a library, you've created a middle-layer.  This
> file primarily consists of functions which redispatch to a function
> pointer.  I think you'd be better off creating a library!  That is,
> have the consumers register their own address_space_operations and
> have functions in this library which provide useful implementations.

Or, go even further and move the overwhelming majority of guest_memfd code into
mm/.  But I suspect that will be practically infeasible, in which case I think I
agree with Matthew.

Either way, the Gunyah usage of the library/middle-layer needs to be included in
the series.  It's impossible to review the code split and APIs without seeing
both KVM's usage and Gunyah's usage.  E.g. this series allows
__guestmem_invalidate_begin() to fail, without any explanation as to while that's
legal or desirable.

