Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05223C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yud1zWjg0T0unucnpCnDX+16TCQDlpqp9KH31E+tKFs=; b=mPozGvQBWwPTJroq+H/Hfnvwxk
	UIAKsFqpfrTewN4E/8rd3HiBCM02JTEaBWG+MewqCTUzgxRwJIvmkZFp0PpAdSIq4Qj2VpoKFZZab
	hZ3B5xTPbLvROi+Qcz2OwtnxJab4gCYaEsmLk3EVF+/k33OXnONr6b6ySFADEdJk+50PisAQiFixU
	//gZpp7J6ebaIC2nz9d0mQInUWRLRhbHJvzkLQbpmA9ZlrOQmvnfBACpb19xFNCRp1p8hClN/+CxL
	M3CH45XWtS9STYLQVry75LY1R+4GNf0H2F3bzKcd7gNqf8EsS+xsGbrJ5nrP4I2p2zFywHgsQZZQD
	MzQ3wtjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ANg-00000000BAe-00vD;
	Thu, 03 Sep 2026 16:33:40 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ANd-00000000BAA-3LHn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:33:39 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2d7151120d6so19075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 09:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788453216; x=1789058016; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yud1zWjg0T0unucnpCnDX+16TCQDlpqp9KH31E+tKFs=;
        b=iJOg2RWs2OdvU2gZN1XxTzEEbpoie1oznkj6UUbZD4z2V7he9SRvenrXqPi33vrFTS
         lxww477Tpzg/wx4I0az1S8yeX+FYQKrrJ+mhCdg8lPakiJ0Fo17A+Jl6976wimQKY8QI
         liAT1Cf+wrJ5K2IjIz+izlAmsR+jP+/Gdv9KC/nPvxhn0NQcsVKPPLXF0CaW3sA3dGCq
         E8MfZcLNiYQXzABO/KDfMPc68KoTsV9oBOaL5ee42AGrMOE18I80ijzQp9zxswit+PhX
         wpj42uIfT5+Nt9RvVUypCPfnugBQkHMJQxZS2yahN8gvsOSR6JuHSpWSUZsQzyoTBjkU
         YjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788453216; x=1789058016;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yud1zWjg0T0unucnpCnDX+16TCQDlpqp9KH31E+tKFs=;
        b=ZDgNY+hIcORQejFIpg+PNnnalna7aVRdAxXzDJ76jmVFoJK+MpDTflKB61UQ4wynXl
         T2un1yW61Y4/ni2ydGjI2FgAlpgrH4dDetxe6Jag614xz6p7BnnbLF8zBTzmiNwsE8d6
         StzsOh72aLyDRxDzAoc6LrwimANwPr8uJlhkWu7HV3ebScfafBjcWYYcK39/GFIkhrRN
         C+J183OLDOVO/1a8OK3+QOgsjYgwEkhCuOXdHb7iX3GwkpknZe82x7yqs7x8BuHMG68U
         eKETb4L4ifBDEJjDFJWpCjGjoZ1rwI1C/yW2B1r2pN6gh//zPI3e0PnopLA51lwtsFOU
         LtjA==
X-Forwarded-Encrypted: i=1; AKwUvBwANFMGCKgS9t7qzmA63hEzFsGIThXEqZ9pdZVDz1HjWtQppc+KXWp1uLttWmF0dyC6KmW+oduaBFzuR8lGHN5S@lists.infradead.org
X-Gm-Message-State: AFuF++kX0iHrlTypwnzoeLJIShafcb90csmcOH6bT2t0FWnsu/d/DcAG
	go4CQTpWBNnMI8NT5Zk1iY7B8iV9uW88YglfC79T1Gl53j4ixEo/r/tky5+jsIcvthJ5VTRqIia
	M6e36VQ==
X-Received: from plcl4.prod.google.com ([2002:a17:902:e2c4:b0:2ca:ceab:34a3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:9cf:b0:2d8:d4d1:313a
 with SMTP id d9443c01a7336-2db12634535mr3213635ad.17.1788453215940; Thu, 03
 Sep 2026 09:33:35 -0700 (PDT)
Date: Thu, 3 Sep 2026 09:33:35 -0700
In-Reply-To: <20260903154317.246414-A-seiden@linux.ibm.com>
Mime-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-24-seiden@linux.ibm.com>
 <aphMx5hsoXwIpNjt@google.com> <20260903083857.33034-B-seiden@linux.ibm.com>
 <apmHrnxRLl9BuVhn@google.com> <20260903154317.246414-A-seiden@linux.ibm.com>
Message-ID: <apmhX8H-WUc3U4_N@google.com>
Subject: Re: [PATCH v7 23/23] KVM: s390: arm64: Add KVM_S390_ARM64 Kconfig and Makefile
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
X-CRM114-CacheID: sfid-20260903_093337_836107_7BEE2C0A 
X-CRM114-Status: GOOD (  22.29  )
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

On Thu, Sep 03, 2026, Steffen Eiden wrote:
> On Thu, Sep 03, 2026 at 07:43:58AM -0700, Sean Christopherson wrote:
> > And FWIW, while it might seem daunting, from my perspective it's not actually that
> > much churn to do things "right".  Provide KVM_S390_NATIVE, and then have KVM reflect
> > the "weakest" of S390_NATIVE vs. S390_ARCH.  I.e. make KVM=m if either of the "real"
> > KVMs will be a module.  That requires some creative shenanigans, but it's not hard,
> > just weird.
> 
> FYI the first versions of this series had a 3 configs approach very
> similar to yours. 
> 
> IIRC it was not so much the churn we have in (upstream) kernel code but
> more on the distro side and to everyone building the kernel in their
> favourite architecture (s390 :))

How many people are running distro kernels on s390 hardware?  And how many distros
actually change the default KVM settings, e.g. to build KVM as a module instead of
baking it into the kernel?  My guess is "not many" and "almost none", i.e. the
actual impact on downstream users is likely miniscule.

> Suddenly the KVM config changed its behaviour (effectively becoming a noop)

Not really, because "KVM" itself is inaccessible (well, unless someone is hand-
editing .configs or generating them by script, but that's their own fault).
E.g. upgrading to a new kernel will explicitly prompt the user to choose for both
KVM_S390_NATIVE and KVM_S390_ARM64 (or whatever they get called).

> I am starting to think that having no separate config option for arm on
> s390 might be the easisest way. Just KVM and guard both modules behind
> it. It reduces the config space bloat and I do not see a reason why somoeone
> should only compile one KVM module but not the other. kvm-arm64 won't
> load if you do not have the hardware anyways.

Because there may be an unforseen need down the road?  Smushing things together
after the fact is generally easy, pulling things apart without breaking everything
is usually much, much harder.

> But I am not opposed to the x86 approach. Just thinking loud.
> 
> Anyways, I am off for vacation expect a reduced reply frequency from my
> side :) 

Enjoy your holiday!

