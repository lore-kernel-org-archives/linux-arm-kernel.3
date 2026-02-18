Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7AAE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 21:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccWJDzJ7m4S4l+nz4VuzRpZZrXnjyW9kyBaNIifc8MY=; b=DJFMoTz49ra2FhBS/bud61/PuH
	xtfbJjaYBdao5fTSmD8AxosOk+hLuFKjJHWwwdF21Kfu6yIGK9Z5QdnyXDPaTQa5YgHsd3G7Qz0UT
	vXwd84AeskNhk6mf2MAcBi6A2PaaAehVg0K0stK7FBlj2UOOEHilY5i7qOS3yxatdLKdOkmknE4kr
	2fM7Z1JcscUKQpAJFYAmgk1Y/rQJod4JCqNBMF+xvYHmnVjsTyVbyO0b6jYzwW23iu5sGwHnW/m1O
	fLkGnM9pQBocP42oIZ57lXU15XRmOhFEwWP/v+urHMMWAAqQtBIEhrVxa5Iq1d7Hr9E3O1/2wWKvU
	wdIUZw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsokQ-0000000AQLr-1ysO;
	Wed, 18 Feb 2026 21:06:14 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsokN-0000000AQKS-0nLu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 21:06:12 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-356236ae3c1so353664a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 13:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771448769; x=1772053569; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccWJDzJ7m4S4l+nz4VuzRpZZrXnjyW9kyBaNIifc8MY=;
        b=YNY80BqNjB+Y1BWl0u6kQHx0Yl5dS3K8LHx9UrJBmIidMd7qedtPqsNfXoO7LMXs5D
         EHmFrLJ75Z/4/z5GMPom9zd/71UIlLdW8dLFZzwY2QSjYeJqe4fE1eNTmu/EKQ0vOEzs
         8e3ppoT3kdyWCv2/aBb3UZ8o28/Fr14o/5fNKdr/7j5oekFpTJmMXj+mT5c1iifGXKFG
         Xq0EqXpcklGmi2u1pW8YKKBIrKKtT6XRa0W9ZCkmeN2Cuadisq9ADhmcNZisw1+2RpPJ
         r6WrslBOhUhCu7I5D2VjVsNMy5sa5m5fRRUlro1fYNSDyhJZiuYpmlhANiQYXed0d3tA
         mMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448769; x=1772053569;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ccWJDzJ7m4S4l+nz4VuzRpZZrXnjyW9kyBaNIifc8MY=;
        b=YfEfWtMfWeuPjTxT96ujE9li3z7fRkja9mDRTi3L9zfMwgQ7ystVLr2OdaC8f50Oux
         WPd6xAjkezsud9YgpQEvi2G0SUots2/x5Avgsg1D87loQ5EQ/2OJWkN5/77wNk1EY2dN
         M8j7OyWPjq7dd9rU0itfE1i+JikkC4c5yCARG1Hz08Yn4MsRZPzYGaHB8GVv0UGXsZRm
         rtUrlwb1IeA1qsASrz0n1Ru02DHFM47g49bCQyghRjpxf+IAAxHF+grGsi5nnX0SBfPD
         BErmAF2fM1gd3gdqOPrxEoK6lpDcAnW/pSKIy9ql8S/EoNGl4JcEsdRmRVi464Y2pMlx
         A9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJVMHsN7n2Ac/OCy59iGZYkiDFlIak7iNOjjVxgoZlQtgGzTfcqBy2WYq7dU0qXX8nBD8PFpOutCKlviZj2kdn@lists.infradead.org
X-Gm-Message-State: AOJu0YzFmVI3ILFXznsXyxc9OOK5xRNUXJSmGBq9YpnOqoGDafrLY1WF
	b01T1hqr2bqx/juQQMBgCmDDNoQrnaonJFa2y2LfIdfj/18PCPWZyTYLl6VCuwZxbSBwmO+qkZs
	xXkWYxA==
X-Received: from pjbne18.prod.google.com ([2002:a17:90b:3752:b0:356:1da4:5dd1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5584:b0:34a:c671:50df
 with SMTP id 98e67ed59e1d1-35888d58b61mr2639291a91.17.1771448768639; Wed, 18
 Feb 2026 13:06:08 -0800 (PST)
Date: Wed, 18 Feb 2026 13:06:07 -0800
In-Reply-To: <CALzav=fN4FpZsfzwbdLeNSj4nx4OpRkwHvKiZNVgP8S-zsUvJA@mail.gmail.com>
Mime-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com> <aBPhs39MJz-rt_Ob@google.com>
 <CALzav=eqv0Fh9pzaBgjZ-fehwFbD4YscoLQz0=o0TKQT_zLTwQ@mail.gmail.com>
 <aRZ9SQ_G2lsmXtur@google.com> <CALzav=fN4FpZsfzwbdLeNSj4nx4OpRkwHvKiZNVgP8S-zsUvJA@mail.gmail.com>
Message-ID: <aZYpv6O15YMlGkzT@google.com>
Subject: Re: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Eric Auger <eric.auger@redhat.com>, 
	James Houghton <jthoughton@google.com>, Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_130611_237991_1B75EFDA 
X-CRM114-Status: GOOD (  18.47  )
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

On Wed, Dec 03, 2025, David Matlack wrote:
> On Thu, Nov 13, 2025 at 4:52=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > My slowness is largely because I'm not sure how to land/approach this. =
 I'm 100%
> > in favor of the renames, it's the timing and coordination I'm unsure of=
.
> >
> > In hindsight, it probably would have best to squeeze it into 6.18, so a=
t least
> > the most recent LTS wouldn't generate conflicts all over the place.  Th=
e next
> > best option would probably be to spin a new version, bribe Paolo to app=
ly it at
> > the end of the next merge window, and tag the whole thing for stable@ (=
maybe
> > limited to 6.18+?) to minimize downstream pain.
>=20
> With LPC coming up I won't have cycles to post a new version before
> the 6.19 merge window closes.
>=20
> I'm tempted to say let's just wait for the next LTS release and merge
> it in then. This is low priorit, so I'm fine with waiting.

I ran this by Paolo in last week's PUCK, and he's in favor of the renames (=
or at
least, is a-ok with us doing it).  If you can prep a new version in the nex=
t week
or so, we can get it applied for 7.1 shortly after the merge window closes.

We don't send all that many selftests patches to LTS kernels, so IMO it's n=
ot
worth waiting for the next LTS to come around.

