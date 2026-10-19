Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCBFCCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGmjTl0WYTodj16FKC7BqXqbPxH6xsiMEijaRRuXBds=; b=TS6AGUile9qED0oH72cvFY6I33
	QstekkdP9UalWeZnMwUwqCFUDPk9yRo5pKlXxoz7Wwyn6dmlAf4CSSt0/EAPX7HxY7Pa2fYjB5ptj
	0g6qFWVjBSDHkYWzenzqyPmooQmlx2iYHH6JQsRzD0/N911baJn9ydWUMsTWsg0kxhjGkjV5jEOXI
	GWyHswN/2JuK9a7FZDx+hvevQ1TT5fIBWDsaVz2OVsWbA60QsZpp6KLxlMBN36hoTRQoL20hdM5ch
	tChS+vbMACSRMFYqL55nZ0yIEOZAYJ0+wIRM8q0r/euz8lanoYB8jUy96zSIlGFOiKIdKguRoT08J
	51oOFGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImdz-00000007PRt-1FbA;
	Mon, 19 Oct 2026 12:39:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImdw-00000007PRN-01JP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:39:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso9489735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 05:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792413546; x=1793018346; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TGmjTl0WYTodj16FKC7BqXqbPxH6xsiMEijaRRuXBds=;
        b=DG6DMS4naxFWK41h0mRyp1ecgFOmrfxii3Mp847FY0wibPJPQFoQncsvU5XE3A8nG+
         uZKBRtlEE/qHkzvSKm27sNCiEgdAko3vKCfzy6lgqdhqJPUaxMeozspLGROoibA/Lwb/
         2IpCdpBdT+FGtFHZc2DMhBPnYziI4XzSEyhtLAqxYN8/Ml45ROpPBHnL60N5CFIbt3F0
         3wDzRBs6tLcDuWluhH3GTS6p6NlaIteEyXHcDWI6e9VGXTaehmscFxJ1XZPl4Mdu8MQV
         w351J29q7iaCOwRX5vuZOx/3HBXKTyz/EuBzRLyM0uvu9aN6g5R1jK5iG4KoV+0FAuZP
         aU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413546; x=1793018346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGmjTl0WYTodj16FKC7BqXqbPxH6xsiMEijaRRuXBds=;
        b=YiH2PpuKGhQwx0IIi6yH7NBXlSIR2Ovj5J8uNyl78qWvMfWybAN3PKxGEh7csi35MB
         NKP76SVQH/BSC6XMgiC328pngUi6fjSThACzldoyIWYh/TtYn231seRz1EiRGlMKCst7
         civb85EYyzO2sZAWqzEdvc0RvQloddRhJ/7drrnngS2+XszLvSlvwt1f97V7rkxgW1Yt
         RA5e/dKuONnQ+59LDIqvWqXuZdwfCfHxVAK7YlzJPvqJGZcROs0mP7Miw/1gXsbPNnO1
         tpzzEkYW2klcvd5wNkFdPetsZeB9mLpVp6VEDaYfnlZXAU0dNI5I2i9Drb9Tz3M+uTjF
         ujiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxF3U/bhNm2GcMsb02NA9YeqoNmBWpPEXttP7lXJCLhm4myd8yBYGG7wSUcdqlFyib2up84+9WUw6pIpqojD0Xj@lists.infradead.org
X-Gm-Message-State: AFq9FYKIgGd7YOyKbajANZ48+wuHFuHfUwKAcOHqf4aa/M0g2FIakykF
	OcJoB+O79sECFDIZqmJCUxchDoGsm/l1Kl1yh0Xm25eg0OZmRFY/YSWfzKVsXMOODw==
X-Gm-Gg: AYBFou3LUGaTfvzYbdLVCBSezSIeXkFmStIUQQQI4Rn3ZQ3hYvmDHMzTetSBXSOOvIY
	LEIuwJ57aAKSsM+rCi7f/hW5XNsDnYR7KDyBgMTGLj3O80iwMJkwXD9UKLoku7PEe9duf/WsjKD
	CIXbmftzkblaSSGj+i+sY4qyvseX9siNHdC1i6bT/7jimCjZlIf59EMMjpMZSX4f55dqsxh2gWW
	G47cbEAtvWI5LWvcUknNTp9QZpLNL4PSd5A2c6qsIo2BxcRH+lgAT48y3nnonSSPhsM8tzSVjsA
	kv7d08GfDKa/QvXmVzDI2X1Gf4FOBcMglgpT9mhEMlSbYIVC9h2Z+QVyOXFCc411qjSSEuGqFsC
	+Wf5aQ1WI1XDxDBKTLIj7enqK5JvxJ235Tf/vJpwS2hBZib4mBJ9jrbq4aiqfGZfEMJlbfiev5p
	QKRQgxGhlj1ekxMXPFsXU1eoWwP3/VEtLadYmwSuJ7xJ4xxGTm2x8hm/Z1lccaVR63VFfmlA2nU
	6ksLT0QXAisl7lkNCTG20v/80HwhQzwCg8nmQ4ehn7Ar2K3UNeeGg==
X-Received: by 2002:a05:600c:a417:b0:4a1:efd3:987a with SMTP id 5b1f17b1804b1-4a1efd39a78mr14321995e9.6.1792413545350;
        Mon, 19 Oct 2026 05:39:05 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d85f92d9sm199554545e9.4.2026.10.19.05.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:39:04 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:39:01 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Ensure TLBs and I-cache are private to
 each vCPU in pKVM
Message-ID: <atYPZeJuw2grFDlz@google.com>
References: <20261014125510.2928306-1-fuad.tabba@linux.dev>
 <20261014125510.2928306-3-fuad.tabba@linux.dev>
 <atXqLxU5bBtJ8U9W@google.com>
 <20261019114357.3528498-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019114357.3528498-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_053908_059585_DAA248FF 
X-CRM114-Status: GOOD (  19.20  )
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

On Mon, Oct 19, 2026 at 12:43:57PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Mon, 19 Oct 2026 11:00:15 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
> [...]
> > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> [...]
> > > @@ -54,6 +54,9 @@ struct pkvm_hyp_vm {
> > >          unsigned short refcount;
> > >          hyp_spinlock_t lock;
> > >  
> > > +        /* Per physical CPU, the vcpu_idx of the last vCPU of this VM loaded there. */
> > > +        int *last_vcpu_ran;
> > 
> > Unlikely to be a problem in pratice, but vcpu_idx is "unsigned int". I wonder if
> > this shouldn't be unsigned int here too and initialised to UINT_MAX?
> 
> I'd copied int and -1 from the host's mmu->last_vcpu_ran, but the
> vcpu_idx it's comparing against here is unsigned int, so I'll switch to
> unsigned int and UINT_MAX in v2.
> 
> Thanks,
> /fuad

Also,

as it is always allocated when pkvm_hyp_vm is, Would it make sense to add this
to pkvm_get_hyp_vm_size() instead of allocating separately?

-- 
Vincent

