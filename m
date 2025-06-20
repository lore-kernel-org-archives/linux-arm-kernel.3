Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC0EC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 20:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bt/+aWwyrkpIimxSl5BUL+43sm1rEuMKKgBDpLCw3jg=; b=fNJ6qh65u6fDgVZvBGfSzgEZcH
	9/rCAv5KLxilAHghTLmuaiSJM8V1vKCqFBby2vZn93sd+Wjr3+CXTOqKLa1NE/SyEyjk1Qdhf/t6+
	GlCzVU/JVqSKozhMMSM5fWO97muyYrimD1QofLOnRyZZoQjAGqBuBNxEiHw6YTnDGFM/fqdCHrLFZ
	WovEh06gtxqXybWKq5l0tanyvRsV+1XNMjSVrzjWy2H7VNASIp5xZ14k+X2x6z9YIvZVYQBLKrR5V
	AB3VCfpWrDTelw9n8PhwQyuY0J5g3qE2rT57Vef0BC8ENEImn0+9Uk5UuGbpYUQmnLZhb1E89XdJU
	we9RZnUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiRK-0000000GXxs-0dB5;
	Fri, 20 Jun 2025 20:34:22 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiP0-0000000GXYk-0hye
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 20:31:59 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3141a9a6888so2154555a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 13:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750451517; x=1751056317; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt/+aWwyrkpIimxSl5BUL+43sm1rEuMKKgBDpLCw3jg=;
        b=YF8gT9fw9SuJRLCqYy9mMgbQOLG2m9NUew8rnYIohF/aVz8A5jdAlVDeoR8ARQn7df
         IkrLGw2ij45RWqZu63O3Ihu2l2UD3x2ZH54oUyBvtJn4DVydQ/9IbhHDnGgLKONNHwf6
         fdTNuDOjjHbvL0w2SvhFuDQ71pyCvi5y3HyawV2sCAE0KMmi+jtV0rly+lTbHIeDjV20
         w6AcJr9+KH0ZuBq5mvKA/zevZoLXhkfKJBuDAdeiib3qNxDVH/kvhAXrspppvOxVTFjV
         jLlTQ46OVBsxHB82zOarUpOfyZkPIWyZZNqdC8p93efXMQW6DVtxcF8lcsCldZSuOJii
         IO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750451517; x=1751056317;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt/+aWwyrkpIimxSl5BUL+43sm1rEuMKKgBDpLCw3jg=;
        b=slrVM8ZyMVaDNAxmIAZ6grr0MEc7Bhys92Jlpnaxen8tLQZ7o7ydXfKwlZq6FSmba/
         i5WPYhbaiKjyuTt6XrLtdvMe6y8DuLxD48jxMomwudRFWHrtFVmJ//71sEA0gDZ8zdo/
         ssMgL9dZ6wT7/7EflFJTNuxICuqs3dyG76VeCtMDSVUg26CYaLQiMZ4FIHXxfnnQWi+y
         3gjW0aA60HfmTq8jlAOZjJCuRjM4pUQJ+tVHNgLqKWyfhRna/e4qxbNBzxZXur7gDmAb
         8ik3c94TTahMfH3VXspjqhUkws0bXDcs8h4qN1QZ3Je4THYh3f4flJQzMG7Hb9bdblbU
         918A==
X-Forwarded-Encrypted: i=1; AJvYcCWH1qwnhbEZMvBLgnkpQVLYrb+72EoQ+0tqM98Z03v8pG/lMapNkYokNKuuOKztRLjPUllX2PDaG5S0o55obQSp@lists.infradead.org
X-Gm-Message-State: AOJu0YxizN2ie6K2z2CCK+NcEbE+2fPsxNCAEFDI6ywWq1RVAsh3MxYe
	R79zX+l/Y7tXtGKFZpVaIeqaRsi+hul21sJ+tlylaDgtDGbKqkbPyXpCr+/g5C86c3gtx1qYcQM
	w5Vhvdg==
X-Google-Smtp-Source: AGHT+IENxgy3xkU/bYFGboojnHAxZAT6iEP2BT2EbQa3Q20JReS/EV7Fji9LhO0E/EbM/UcH2Oi/Nx+lNZo=
X-Received: from pjb7.prod.google.com ([2002:a17:90b:2f07:b0:312:f650:c7aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5212:b0:311:b3e7:fb3c
 with SMTP id 98e67ed59e1d1-3159d8fef6dmr5375179a91.31.1750451517093; Fri, 20
 Jun 2025 13:31:57 -0700 (PDT)
Date: Fri, 20 Jun 2025 13:31:55 -0700
In-Reply-To: <aFW2NISX0q11sop1@linux.dev>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-4-seanjc@google.com>
 <86tt4lcgs3.wl-maz@kernel.org> <aErlezuoFJ8u0ue-@google.com>
 <aEyOcJJsys9mm_Xs@linux.dev> <aFWY2LTVIxz5rfhh@google.com>
 <aFWtB6Vmn9MnfkEi@linux.dev> <aFWws7h3L-iN52sF@google.com> <aFW2NISX0q11sop1@linux.dev>
Message-ID: <aFXFO6_lVV5PpGW-@google.com>
Subject: Re: [PATCH v3 02/62] KVM: arm64: WARN if unmapping vLPI fails
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_133158_207611_E68765BB 
X-CRM114-Status: GOOD (  14.78  )
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

On Fri, Jun 20, 2025, Oliver Upton wrote:
> On Fri, Jun 20, 2025 at 12:04:19PM -0700, Sean Christopherson wrote:
> > If I post it as a standalone patch, could you/Marc put it into a stable topic
> > branch based on kvm/master? (kvm/master now has patch 1, yay!)  Then I can create
> > a topic branch for this mountain of stuff based on the arm64 topic branch.
> 
> Ok, how about making the arm64 piece patch 1 in your series and you take
> the whole pile. If we need it, I'll bug you for a ref that only has the
> first change.

Any preference as to whether I formally post the last version, or if I apply it
directly from this thread?

> That ok?

Ya, works for me.  What's the going bribe rate for an ack these days?  :-D

