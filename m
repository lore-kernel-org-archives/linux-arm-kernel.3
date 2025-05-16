Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB5CC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 18:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6K4DAi8oh2JImogQbX7MYeT2JhKWy+PA/O4SxBmk53g=; b=HznAqcO7buiFpXvZpaOexSQ/Ch
	TcjYQmOAJYahd3+E6TTnscatIt3pg+AoQhcB7Sdbp+uA5cfLo5wY0O/CKMEvEhyUdw2otLwLy+Wbp
	zZrykoZ5zVvOyVVWW6mmZqKWRp/Z7Y6Y1BQ/FfQ/LJKSHzoCOKMwzmvDUw5RpMWElrhVgZqLBm2I1
	53VqSDSIjRssZbq4KUPFZbJF2nfhiDdOhwwaRk+3SXzS2kHjO1txzaUQEJCVXQeFNDCsJFcwEO6JC
	RlDEOalRwpITOzT3YI9ygF6rn3mX1hMItVjsJjNZeeg4NGtmM76l2E2bsM3zCTNMYgYQYlKu1Buap
	JR8bA2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzvq-00000004LZC-2lbY;
	Fri, 16 May 2025 18:37:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzOz-00000004FeQ-0VGN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 18:03:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-441ab63a415so25222385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 11:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747418599; x=1748023399; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6K4DAi8oh2JImogQbX7MYeT2JhKWy+PA/O4SxBmk53g=;
        b=wcNFYpSdFnH4WdmIzk6Bx4S5mcehje3dcrF+SIFjnbEfsW6VjXR7gGIXwTH28HG5ti
         EL9INfg6PyI3obIrdzaD5aiW/nuGkrE+iKXBL8GPEiXpfQoXAYy1wiT4zCEYsnb+SKho
         duECmSLkbZiQrt3kgzzProzmmIq6US1pnmIbhLdRETklok6yM6bqRc/BSgY+U4hhfTQi
         2xC7uei5SOqJgu54T9OoTHJ54U50AjXiG2onmAIv/deNLJoW3JqdZlqwny8nOzeNma5q
         4dMIupayGtQtOwcVwnBH+SyuBGAM4DHllpVB5WDpeNDXcIPOm6DImktXm6btiEk0AnDA
         cFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747418599; x=1748023399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6K4DAi8oh2JImogQbX7MYeT2JhKWy+PA/O4SxBmk53g=;
        b=Wh+BAddT4sMkVMVzvGYGEQuuBfbc5IKVTt26d54+yEpk01Awzb+q6Yr0DsUaPuLj2H
         /t16JkroO3V3GnwuHQP50FctLjK1ieHtMteD9eiQXNjUuxAjbwL8tQ81oKWvZ+3vyUW1
         pw0cydS2nktT5W3nQeA3kkRihCicz5VUTsMwjly4yxEKYCWynYlCkozMpuUQHpsQAwQ9
         uKCUxBbHEhvNaArslOfFKQEz+SvroA4l+MhjOAKFzdr86VDiyYk8B2TIuTcuB9B9Almn
         zur4fqvOz8fyo4I/dm/AUMnORea49aEYEKIqHLapWR6sZciaIVw5nUaCXe4oXsyudAiN
         J9vQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+R7gMHT/gfdkHuMJg0WaxuYD2Xha5iHupJI61xZzAduaP+YvHdCpW1CZuRgxmaRd8LrprMUGlfKcCmBhu7yNe@lists.infradead.org
X-Gm-Message-State: AOJu0Yycp9QTB9+nJ+4r7s1cww5AyVpggKEF/aVt7w/cVw/SGR4IB73W
	q/MyBwZKMBqpCuGF0WDdbn/r830NVoDn3gL0WlxPrWOwK1MYvIKoGK91n8nfbZicXg==
X-Gm-Gg: ASbGnctWFzSA/DTcEAH5LcxMXyViECLp2sJ7931L3EMPNKNfrY199eFNLSWOMSlImVH
	kq2ENTG9JO0xvmZvUKBBrXN/wL4Y2Ya9tE8kQAGzo+0n/xi4Tf08MgsoknksYGvvqQD2NeoDoOi
	JARu2jfHNFukrSL/RDZncMeVfNaDihAU79m50xhNe0Em0Fvzrg4FHAv2WGqsu9+Rs/ixoIfXBTB
	ce9cWZPngmmgo6CgN7s9s5K2UIBpE/pF1mbyP7ONF22VbKmJHVNotAn0IjjtAkvEPLbdxuT9PcT
	qd/U3cTsFxbqFFdKHrzi/gWfqfkh4xsqrWbE66V6co7sFk8HtB5hL0yqrr9ZXMKB2+PpRv3PmqN
	OcQ0AcBnTCj5xD7ny
X-Google-Smtp-Source: AGHT+IFQSsiI9vrwradpXzloXrnGaAlmo3vSdM82TZe2t7ORRAfPE4k7Pcg48JUAfkH5OLuMwkRHsQ==
X-Received: by 2002:a05:600c:1c18:b0:43d:40b0:5b with SMTP id 5b1f17b1804b1-442fd6607eamr37352735e9.25.1747418599028;
        Fri, 16 May 2025 11:03:19 -0700 (PDT)
Received: from google.com (218.131.22.34.bc.googleusercontent.com. [34.22.131.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380539sm118985205e9.16.2025.05.16.11.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 11:03:18 -0700 (PDT)
Date: Fri, 16 May 2025 19:03:14 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v4 10/10] KVM: arm64: np-guest CMOs with PMD_SIZE fixmap
Message-ID: <aCd94sBdThAj6jT9@google.com>
References: <20250509131706.2336138-1-vdonnefort@google.com>
 <20250509131706.2336138-11-vdonnefort@google.com>
 <864ixkfynk.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864ixkfynk.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_110321_158625_330C6C60 
X-CRM114-Status: GOOD (  12.60  )
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

> > +}
> > +
> >  static void clean_dcache_guest_page(void *va, size_t size)
> >  {
> >  	WARN_ON(!PAGE_ALIGNED(size));
> >  
> >  	while (size) {
> > -		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
> > -					  PAGE_SIZE);
> > -		hyp_fixmap_unmap();
> > -		va += PAGE_SIZE;
> > -		size -= PAGE_SIZE;
> > +		size_t fixmap_size = size == PMD_SIZE ? size : PAGE_SIZE;
> > +		void *addr = __fixmap_guest_page(va, &fixmap_size);
> > +
> > +		__clean_dcache_guest_page(addr, fixmap_size);
> > +		__fixunmap_guest_page(fixmap_size);
> > +
> > +		size -= fixmap_size;
> > +		va += fixmap_size;
> 
> Can this ever be called with a *multiple* of PMD_SIZE? In this case
> you'd still end-up doing PAGE_SIZEd-bite CMOs until there is only
> PMD_SIZE left, ruining the optimisation.
> 
> I think this needs fixing.

So this can be only called with size either equal to PAGE_SIZE or PMD_SIZE. I
wasn't sure if it was worth to make it more generic than it needs.

But like for the first patch, I can make it more future-proof by handling size >
PMD_SIZE.

> 
> >  	}
> >  }
> >

[...]

