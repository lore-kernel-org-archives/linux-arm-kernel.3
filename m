Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0B8C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 20:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L632ql4Sd/RozUuu0s8fdwZF7MOouQPT9rB6yRaOm7Q=; b=Ns/oP++Ds7bo9s+R+5JmmmkO3m
	8zL0/9YpCWbS9L/bs1EUbT4jPWvvwgjoT0Tg6u36rMbis2sqoF5p8fthJZ1Epi+d21U53xGLUiE+G
	FUTw1kWhFT6liKzxq0+ewxjB/6FZFGbGFDYI8Y7/63CR5fp5xkM9PseJjPL9SrqZlJH5Vp6QSGPoj
	ISsk2mFvdONgmpwU4pyRg5yuYfvAqJvrnVtTnWE6Y99UgG9rVIsZeB5GpBvbJ/5dxuIKB/2jYP5NN
	+ZCbxCePnedTb45YvxQ83WN0CQs415rEAZfYAmkc9lkKF+Ul3iSc0bSlW40EaxcKy7dFdZOWTJRY7
	Ku2PdlhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EVq-00000000bCJ-1KNs;
	Thu, 03 Sep 2026 20:58:22 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EVn-00000000bBr-3Gnb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 20:58:20 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2d6f80c76e6so4663155ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 13:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788469098; x=1789073898; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L632ql4Sd/RozUuu0s8fdwZF7MOouQPT9rB6yRaOm7Q=;
        b=RhZp1g9BJm6zF1FiE5uDjerwII3W5ySaFtmJVVPAJxRjJogc7yFxRitxcPhGVHCoDr
         qyClLHjGPNLTbZT62/y+4oXkERtc1Hy7bqBLL2jdI3tqroGxefRHJFWHPZqa6q/Toenm
         Uwna5M4P/TErCXbXhKQ8mTlnhrr5tmMohOCvXdOIg4SVZ1YKMEuxZcK70K8Vc4kStDaz
         NfCU2ND6rc/A6eIUJKBcbRzypM+KUaFYIbY4YQgGyx7M77t7R+4vttPKq5KhSm8UOGnL
         6U+4g4dGTjdnzALOiTBAIpHfIUx4CHPe4WKlL3sdzviH7ELXcA/nOLRXsVKQ2yx3/H+v
         jUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788469098; x=1789073898;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L632ql4Sd/RozUuu0s8fdwZF7MOouQPT9rB6yRaOm7Q=;
        b=GW0hD0rIwFRT/dx6H+NUUS4899Wn379LBfLJhK0QVXRUYJUMjY8z+C/wKeYGNYKyut
         QqJTO/Ks1Epd10H+Fk8vMCl47hTWKU9nf8uFm5oWS48HyieQG1XN3EEFsqEzzOi1DhAt
         n7wZO+Ngx0RMsh7ZoNNqHZQVypJhZXz5KQKCLt/qJeWTh3mXmk1yg6mNSDA4Ml83Ltc1
         eXEWBzoPOQbhgdTdRx/y2a35G34+I6Rf3dbMN6+FH8vdWKwWJlVanCybSCWXg553DGLg
         rNRFh8jMBywu1ew8BmfeLPRnXnRLe7zMGicSiyhNoAhPetEjClBfBPvPPZ+SesxnhcrL
         Ryeg==
X-Forwarded-Encrypted: i=1; AKwUvBzLiv/9uLuRgxh6aIwvZs25dP9pA9adQS0CVF8CyzKml8XDNpblnMeLBxJWcH9s36pyclTRZAojWhpfdVU3k/VL@lists.infradead.org
X-Gm-Message-State: AFuF++llaZlkBCKlpJ+5o8GZANVpHa3C+3umyGfZGLvwgnoWtEcaMofd
	qq75ASkxjzf69BFBtKl6XP4nScg4+AcbrKK4t0bRW5PBHlT8sNV+wNa7WeJ3mE3OVpSsMjbHtJx
	VyfiD+A==
X-Received: from plxj7.prod.google.com ([2002:a17:902:da87:b0:2d9:1c43:7134])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:120d:b0:2d8:d4cc:be65
 with SMTP id d9443c01a7336-2db12873c1fmr17910145ad.18.1788469097697; Thu, 03
 Sep 2026 13:58:17 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:58:17 -0700
In-Reply-To: <CABgObfZL-qNSaNkNZDj0Kk41zw6UZ30vkSxc6T8wb-pOKab9Wg@mail.gmail.com>
Mime-Version: 1.0
References: <apdweRfqt4dTxcU9@google.com> <20260902075028.231001-D-seiden@linux.ibm.com>
 <aphLXQL1H2zYZgTi@google.com> <20260903114241.33034-C-seiden@linux.ibm.com>
 <apmEi1NmOUvmUBFP@google.com> <apmFClPZ2WcDINmT@google.com>
 <apmIGgMEN8w-kQAm@google.com> <19d4feb1-d703-4c62-8622-a6d5e9d6394c@redhat.com>
 <apmYPMMPCNzK9ZEA@google.com> <CABgObfZL-qNSaNkNZDj0Kk41zw6UZ30vkSxc6T8wb-pOKab9Wg@mail.gmail.com>
Message-ID: <apnfaeWZoZTIsoZS@google.com>
Subject: Re: [PATCH v7 02/23] KVM: Make device name configurable
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
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
	Suzuki K Poulose <suzuki.poulose@arm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_135819_818362_684C7D2D 
X-CRM114-Status: GOOD (  13.92  )
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

On Thu, Sep 03, 2026, Paolo Bonzini wrote:
> On Thu, Sep 3, 2026 at 5:54=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> > > I don't want KVM to be the. one that does things differently *once mo=
re*.
> >
> > Too late :-D
> >
> > arch/arm64/kvm/hyp/nvhe/Makefile:ccflags-y :=3D -D__KVM_NVHE_HYPERVISOR=
__ -D__DISABLE_EXPORTS -D__DISABLE_TRACE_MMIO__
> > arch/arm64/kvm/hyp/vhe/Makefile:ccflags-y :=3D -D__KVM_VHE_HYPERVISOR__
>=20
> Sure, VHE/nVHE is fair game because the nVHE case is in the same boat
> as vDSO, arch/*/boot, and so on.
>=20
> Looking at a grep for (cflags|CFLAGS).*\-D most are -DDEBUG,
> -DDISABLE_BRANCH_PROFILING, -DDEFAULT_SYMBOL_NAMESPACE, etc. and in
> most cases they seem like a bad idea. Don't do it for KVM please;
> requiring -D for all architectures and for random pieces of config,
> when you can put it in asm/kvm_host.h, is just as bad if not worse.

Boo, it's never fun when a parent shows up and takes away your toys :-D

