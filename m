Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B368C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVR8QujnOvE/gsZcroLlAokjVOxh8pMAit+Zm+cALWs=; b=ikxDo8PnWAmxKpIkqsh83HgWna
	ZKDAkVRtrN2/6XT94ousa6yzf8p5sc43CsxSrlxaSU6ertuUxO+RuaCBg7vuaJuRqorC6QeRPjKLB
	Rq9W+8x7nDIcTBASowt34xZB9/g52SlInTeCjeVAcApVFpyERsJUy3pPo5cO1gQzutOY7CAkNnCRC
	UjQ3noXLc1d8cYQXXGcR4k+1B1WuqTtqdN6iIEouq4imIsmEpGogKsxgKOCRbPUL/F60KkkhIY5Cl
	E2JPS27x0+IRA+Cha5ycwKvOwoTJ8hXt9t/uEJKVu+lvzupH0L0Bp3KqrhxB8TMxnf7grmBtKtPpP
	outj2puQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpuz8-0000000Dd8V-1KWM;
	Fri, 31 Jul 2026 21:41:42 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpuz6-0000000Dd88-27D5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 21:41:41 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2cfe48ca1efso20263665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 14:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785534099; x=1786138899; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PVR8QujnOvE/gsZcroLlAokjVOxh8pMAit+Zm+cALWs=;
        b=iPLg4cvGQvXVF+t2/tP043TJL2+l9XEGQHxRL+lgZm5/KVFYGb4P6H/CL5GeqdGANX
         bJl1KSSqkLjan2yJKLjkR9o4hju/IkTUZ1g4ZGo2NsLec+ExPIGGaIRD3/k/0TF9UhOP
         z7QOgV9JZ/8IKBvngQTY+6vXLdWx/MByET5hTsyym7Bv9eWuPlfQ9VIUxNaBBhjiQiCl
         SAZotZqQ2DwUMfRzP7oy1gk4k1QM9YjQw1azgDlO7BkBtwAmEk5fJw/pZ1HZiO05bEV7
         VmlJDW1+UVrPS8N1c68Bx9mXzIzBwdrDOcjcPyj58yDTvaQKvQtWn2DB9wqSQi2Piv/g
         /zQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785534099; x=1786138899;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVR8QujnOvE/gsZcroLlAokjVOxh8pMAit+Zm+cALWs=;
        b=qjIcctkr1HA5nYBmAqEJ1mAmV8cceYnm7/8RbHEZRh0ApXm+E0tTJbxUAiMrgVqQ4y
         YJAc3KOOOyZqRGv5kRdHEbiq2v9Zuf60pyxxZdUtinNiIeAVckZrJaIVsU2eNxgamOFz
         oIGz0UzKN4Ifn1BYS/Uwk15j2dg60TytJCNppd2Z4YiBIBlIIf7TNvp/2QVgx9VFo9k7
         4WNAgUvz1O05BpPG88fNZae7c+D4uCAxLTcu1e5VfKt9akNkxRf5YHz2bKH1msjNKrMT
         VDPDBMhrLNSsfwmmD2MHvykhwqmCaMOBWZyWdv42SsjeFT2iAxHvje3VvtfnaW/7VbuN
         WyjA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9Lklw6Frr6bTVCzyKB8OXxR+HscBdnDb18/io95efZIxKk/xj+ew3St/N25JeZCyGFlsDDyT9IS0Jvwxh5BKS@lists.infradead.org
X-Gm-Message-State: AOJu0YxBvfPI0uwRykArBsEyxWayL70QzOBFn8y9y5l7rcI+30OIs1MG
	gLHaGsS3E4JVoKO1ZkTEShWLY3UQt6QpSnzc7O9So3GnN01FV1PYHHDOAGNK38mJ9pevfEvm+rZ
	8B9IXgg==
X-Received: from plpm7.prod.google.com ([2002:a17:903:3de7:b0:2cc:77e3:3ef0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2d1:b0:2cc:6817:d9bc
 with SMTP id d9443c01a7336-2d0523e6ee5mr13779535ad.38.1785534098681; Fri, 31
 Jul 2026 14:41:38 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:41:37 -0700
In-Reply-To: <CAO9r8zO-eCz-4Gpa_FUjRKPaDj82PP7et7KON4S5QfhRU2J-Ug@mail.gmail.com>
Mime-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com> <CAO9r8zO-eCz-4Gpa_FUjRKPaDj82PP7et7KON4S5QfhRU2J-Ug@mail.gmail.com>
Message-ID: <am0Wkak_vhy1n_xu@google.com>
Subject: Re: [PATCH v3 00/12] KVM: selftests: Add more syscall wrappers, fix hardware_disable_test
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_144140_566014_7139FECB 
X-CRM114-Status: GOOD (  13.29  )
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

On Fri, Jul 31, 2026, Yosry Ahmed wrote:
> On Fri, Jul 31, 2026 at 12:56=E2=80=AFPM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >
> > Third time's a charm.  Sorry for the spam.
> >
> > Buried in the middle of this is a fix for the hardware_disable_test whe=
re
> > it can end up with a runtime of multiple minutes when running a preempt=
ible
> > kernels on a large NUMA system.  Turns out my analysis/guess in v1 was =
wrong;
> > the problem isn't direct CPU contention, it's that letting the workers =
do any
> > amount of "real" work on any CPUs leads to pthread_create() slowdowns f=
rom
> > the perspective of the caller.
>=20
> How long does the test take to run with this series?

Less than 5 seconds if nothing else is running.  ~12 seconds if I run it
concurrently with mmu_stress_test using default settings, and ~25 seconds i=
f I
run it on an overloaded system (naively running all selftests in parallel).

