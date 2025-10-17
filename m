Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A38ECCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 22:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoqzKQNFCddpnwTwWMxWSsHCHOracpeEvFEON9b+5D0=; b=E9D60nbnoRxMhPdne+elo0woqh
	sS0DCeoOlPGAcvirCWP/Rxz9vIwEs7wNGoJR/OOo9RaewsR0K+pR3Fqc/UiVeZgILZUbpXyokjz5G
	MS5wfqJf0Q9Ygd98A9Cq+/XrPr8VawViJ+XpEumhSyCVXFdmh7KO5NOsbxdUaSrZUVtbPrgbimr6F
	VV+L22gBAYgU4DOaGAgmYQ/TOSrkMI+6D6IWAAwevGOrXdBegYBdyfhW/AVNFAuLgb6zXY46jqnqS
	hAPR+YefZ+DAwuAXGEfbVKNYBDZUWz4NqQhZ6iCHq98NJDX84KwI5vbayPUJZVASihY0UiuKPc068
	UA+BATSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9t6U-000000098Du-3laT;
	Fri, 17 Oct 2025 22:39:18 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9t6R-000000098CW-33KM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 22:39:17 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5818de29d15so2957988e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760740753; x=1761345553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoqzKQNFCddpnwTwWMxWSsHCHOracpeEvFEON9b+5D0=;
        b=RSNEZMv+B+Pw9n60M6YAQCbXx2XBqc2gPj1nDGQICv7TMBR8dJKUE+/qqzEfbIRBQv
         95R/k4SAaWd2WuhEAhInlA0S/dQFyNihtz8uqA9LxOu7iCw1XL0IfPhAqmb7VzztMQEG
         nhtLd4+WygnMW364oK1EEmKkFu3aG5Nrm8y7iBkD+8pdsJKaFYKz8mhMyLEOrlj8L4MY
         ZLFG6nNNNo3GLZmT5F7aNPqqpNRgvfRzUAJAr/7PqXAlH5fJWUS70Z8iEGU+vbOOYyBa
         d2yEQLcRHRRWZtmJbAFNAiA6QDOLYG7pUhQTPw+sOvv8EL5s/BsDCkFADu0+fJZ6v7XT
         gpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760740753; x=1761345553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoqzKQNFCddpnwTwWMxWSsHCHOracpeEvFEON9b+5D0=;
        b=WOnjH2fCBrDbGkIF3NUaxcPAegVu9ZZX7VHbsaF1NUBQUZZQAIPoYkvkNE/Jcho+0F
         JmILkPEuRkM8E7+MktFLZGV9XCBZLTwHC5lJLXDF0e4nqCK/lgnpV3W/Hjb54tydTdiT
         UMzl5Y+fpqnpeVYVcFZTc0eV+HIOlheyNOSUL1pNWV2JpTnQVaPqb7Wu6Jx8wdWPX5s6
         70cPEAlUZCNSXx9VPAJK0F8DbM34Ih3l3yoK5t4xqdlPVO9Qk2NDJWlT4oOxKRmXy9oo
         G8vOa2yovp+M0YR3PGt0e+jRKcY3KyfsEYZFSnfTmOsB9ImdeCQhj8TxjGOg6G0Z3uoj
         BDpg==
X-Forwarded-Encrypted: i=1; AJvYcCU019aI5LMQ+uYEQyo9pko1pWkc0BQKANIACAlgj4yJhXEs4gK2T1dC7971gDXDcLV4gB6iKq3f5phbEU3sAQsp@lists.infradead.org
X-Gm-Message-State: AOJu0YxYJn3tPCf5OFKcQ6bKF5AfIqeOkWsYzDoM/5LBnEaEdL4dYkT3
	84D8Xjd/JtF+6C3oLovF8rcvgH+MaApCnTKZE4j9PKugs8EaNZrqlTUFIQRwo0uCf/y7kfcJf7/
	lhYK81eSA88LzPgFEZjQbGTYbSzFEWwAJ7HLS0+iP
X-Gm-Gg: ASbGncsObBlny5iQDsfGr0aCZffzMnHN9s9XKVL9nuz98HfvEorGl0j+1E3Zv7d1PbO
	1jdcEB1tbH6EidNcXaFlCG3fEnOh0uAqDWYWBDmzzdDoCttbMlJ61DH5T/ee/IDISBGRuom3las
	V0SJ3zWZXTGSO+UH8uiJ7lpmo1oHT0SD2cP1Dq371BFlOiagmBJaMaAPZW4jq5hzKNXqsyYEr0l
	OHrg+chANhJ2GdTUAzRVMichcV1fGODkorrjKifkunq3htJeQJ2yiQBYsdhEdV8e7rQX0gq
X-Google-Smtp-Source: AGHT+IHS0n4/1zDhYDG11j/phEtQioVcSLIhzKZxyKRafka2oa60va2EzlIsG9E+0PXvk8E7U9fUvkCXKxOf+kRpoho=
X-Received: by 2002:a05:6512:131d:b0:590:6119:6b73 with SMTP id
 2adb3069b0e04-591d85aa092mr1710058e87.48.1760740752394; Fri, 17 Oct 2025
 15:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com> <aBPhs39MJz-rt_Ob@google.com>
In-Reply-To: <aBPhs39MJz-rt_Ob@google.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 17 Oct 2025 15:38:45 -0700
X-Gm-Features: AS18NWAC2AsnIEyOuBJBf6AwyLhxj7CRd7TcYAURWBeq_wPcJYz0GvazO3M1Rc0
Message-ID: <CALzav=eqv0Fh9pzaBgjZ-fehwFbD4YscoLQz0=o0TKQT_zLTwQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
To: Sean Christopherson <seanjc@google.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_153915_783278_D1360F58 
X-CRM114-Status: GOOD (  12.80  )
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

On Thu, May 1, 2025 at 2:03=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
> On Thu, May 01, 2025, David Matlack wrote:
> > This series renames types across all KVM selftests to more align with
> > types used in the kernel:
> >
> >   vm_vaddr_t -> gva_t
> >   vm_paddr_t -> gpa_t
>
> 10000% on these.
>
> >   uint64_t -> u64
> >   uint32_t -> u32
> >   uint16_t -> u16
> >   uint8_t  -> u8
> >
> >   int64_t -> s64
> >   int32_t -> s32
> >   int16_t -> s16
> >   int8_t  -> s8
>
> I'm definitely in favor of these renames.  I thought I was the only one t=
hat
> tripped over the uintNN_t stuff; at this point, I've probably lost hours =
of my
> life trying to type those things out.

What should the next step be here? I'd be happy to spin a new version
whenever on whatever base commit you prefer.

