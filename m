Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E98EF8FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 17:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=; b=Y9AT6/ezzUusxPAx4bwwzTN0TN
	9f64Oo33AkM+Fwyti2MwijfXRlQ6dAoITu6IMuYYw5BSqFwPzboCENfHCaShT0CXnv2hk5vQaiBYr
	6xfbTJ8k5ohdMuDQmHWnEiU/4YHsQ2Yo/sqWwZ0EeKeEL6M+mx2+Fg89Q+p/po8tcUhMSoJ+sbMZ6
	lt6jbWGF/fxuzh1L0RbUmBDh3J7X8mAZdlOypIQtnYxsxaiPiosmfU/dMqZpuUGvN4+5dcz/zSg2a
	+Or8+tBCvu9IBDxTGysySBFuKYnxVt/mHBIADhvTgB5tPBYgvmjWD+n+P1mVMB1OkPozTjf7mjgQC
	nSftIlQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCTQ-00000002Ik2-46ck;
	Thu, 05 Mar 2026 17:26:57 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCTN-00000002Iia-3Jyo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 17:26:55 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59e4a04f059so2677004e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:26:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772731611; cv=none;
        d=google.com; s=arc-20240605;
        b=B6Z7AD9DD8hRomwDWBnIWeme7IUuAX2kkPQ9iKqPxTiV8zJkSS7Hf57a7c9qFchfPf
         a5sZevBL7L0XYUXmAlLB38Dg2OLkRTqB3ZWT7jzZcyZd3Fr/oPryZag4gtD3gTZrak8b
         qZ+89kvjB8EmtdiRqFcFFf6WwBPobJ+4qfTqMR84Pj0mLidz1xtIweaoLawkYBt1Ib3K
         w/m7PGj6w46YhXVtbjnptJtGFYFuCTXbnZB6UDgy8yEozZq/8cr8FF8lMVB3q+FOF4nb
         Ze0n4v9h12qbZZDTD0fZKy5nMWQrV/Pur+yKmw/1GWG5sJoMpqDy7pEEc3mpyAcBEd5b
         WNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        fh=bWTLu7KwB4W6imIQ1o2MiA0o7g9S7LUOdOw6yg8krQ8=;
        b=FRCknCtjqdPfv557xqe2bROvu2dDWChvu7Itdm5YCrhdCRLh4Y4SfKgFbzUsXUzN2T
         /o38rW4gYZpLjgh2JzSC6xnbCgNzJcJWErlzbMjN6L0R0dOL7hecVR1RAOsdYp32MQal
         BosAyTyXPeK89XOe9T2COHq/YSKU98iDBqZjS5NTnUUxGq3eLXb1dw4yh8dCyjUJI0yv
         xCP77zOdbEtkC8c0bjiHoqGbXWpQBoZqHZ4xj1gMsJT0s+UO6sek3W9FkfOB7+ZaALqQ
         8HDAgVCC2lerTXlQ4C7Mk4TWhS8B9KWOF+taIe5lRMxRtl/rBnh+c9iHNrjZMyVaj0Wz
         JxlA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772731611; x=1773336411; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        b=tJM+5WiyXHIkTBItRsVXNII23tawwOogmqTUCQyeg90SQCR9hJ2YpPdHzIAK+xQMNM
         u064CrnRw0O6dCcKQtTZMhcXO1NHIHro9SkxNjFHaAVq7SY4igNFoAq/bmNucfQZJlhQ
         AAfIXFfYJLkgG1nL+J20HFEPkGziDWHcOyY6C02n+kIMYn/eETzH9vu5TNfxW3GbIckn
         FxC1AvpAbNmLlZlKz1D5g7TuUQtta07P2MPow9dxmRXb27THEDvLxdrx7eBKLyUTzQeL
         5VwRtdgTVub1BJdzByzE0POK3raTwhkBsaD6k4HkMRk+pF0fvj/fGimfOh+IS5MBfjJf
         aNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731611; x=1773336411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        b=EMzdA5SjYWTCTA3EfWRuzf0N3RMvbWsNULN+8HhZycQvUvSWkQpVrf+sYEeqpBJKqY
         vVHdiEWijAjhROeE0/aHdnp/w5cVYk1nYojs8RR49g8uHuU8MAsdEzJUa6fdJYPET60w
         6+59ytzzTTQidDb9NKeVghpqOrot8+7w/eDfxJ7GLkHFPeeQKTa0JOdStVvEaXTcoGZw
         Havgv5YiaRVdxSRxuHo3kLh5R3Xg8dunfS02ZrasjYMoTjpE5G/V6zRsyaC94QM114sd
         xbCZOHuNQXRWONrVZIkK5yPOB5lOq+RUC4upRv63UahMADkdxlNMvnROWdJvoVi5Dvh0
         d1Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWjJxoYqjvJ9dIjQd7fddJM4shDqfjClHvkCiuAUIwhNjg/GOLcR65rCc3VskQkmml6oxU7DwjRRXVRl1gKX/wa@lists.infradead.org
X-Gm-Message-State: AOJu0YzH5dXgQVVvAm3V6aIxk4ererktyjKsitpZTj5PfVOHMg7MK9Co
	rUzFe57LbPUttmGTYW1oLQv7ljzCjneV4rBrhhjCwlnbM3R9SpgxsLNHMrJfCPGodbRnWl48OmM
	2PfADPNzZruScxV7HRjMAwUPMbyBHU2vyAuwSakc1
X-Gm-Gg: ATEYQzyFk9j4CRKccBj7EADhNx+fIx2XfQXzWB8ODx1ctvbzg3LVl9Y0dtY+8OGgIv1
	aLP2Ccg5TwEZ2zMBVQaYVuE7St17hvQ39mThrFieXDks6nJEn/y+pGKzDYulqHY9suyCYZAjIqI
	iBp18OUeHdnuQsncO+cz5ljQ01pzTEGbPYgevjL9EOKGyS5vcvp6Qg7P+WoeSKKruO6seQd0vj9
	/eAPxgEVicd3uXBtLVjlE8LQust8odkRMfKoxlN+PP+Ya0+FFEl2OHXpZnF5U+584YQ9kxH6Gcn
	Aqw4M3uw
X-Received: by 2002:a05:6512:696:b0:5a1:2f18:5e19 with SMTP id
 2adb3069b0e04-5a12f185e8bmr1324271e87.22.1772731610293; Thu, 05 Mar 2026
 09:26:50 -0800 (PST)
MIME-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <aam77t8fe5RKSr2Q@google.com>
In-Reply-To: <aam77t8fe5RKSr2Q@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Mar 2026 09:26:22 -0800
X-Gm-Features: AaiRm52LsX1aPJ2JM5xqUBPHr_QH0uBSIJaRMA7nyUfm3apWkfHV7m2i8095U3w
Message-ID: <CALzav=etzo9A7FNQrbLCmj=pNLN5fO-a5isP1k6MuTDkJw1bqQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] KVM: selftests: Use kernel-style integer and
 g[vp]a_t types
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_092653_851077_38E5BB3B 
X-CRM114-Status: GOOD (  16.42  )
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

On Thu, Mar 5, 2026 at 9:22=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Fri, Feb 20, 2026, David Matlack wrote:
> > This series renames types across all KVM selftests to more align with
> > types used in the kernel:
> >
> >   vm_vaddr_t -> gva_t
> >   vm_paddr_t -> gpa_t
> >
> >   uint64_t -> u64
> >   uint32_t -> u32
> >   uint16_t -> u16
> >   uint8_t  -> u8
> >
> >   int64_t -> s64
> >   int32_t -> s32
> >   int16_t -> s16
> >   int8_t  -> s8
> >
> > The goal of this series is to make the KVM selftests code more concise
> > (the new type names are shorter) and more similar to the kernel, since
> > selftests are developed by kernel developers.
> >
> > v2:
> >  - Reapply the series on top of kvm/queue
> >
> > v1: https://lore.kernel.org/kvm/20250501183304.2433192-1-dmatlack@googl=
e.com
>
> Sorry, I was too slow and missed the window to get this into kvm/next wit=
hout
> causing a disaster of merge conflicts.
>
> I don't think you need to send a v3 though.  I'll prep a v3, a branch, an=
d send
> Paolo a pull request during the next merge window.

Sounds good, thanks Sean.

