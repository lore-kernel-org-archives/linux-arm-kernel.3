Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13533CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 20:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92VK8FOPojooOIWV+l2v1FHmJALxyLmlS2dAJ/3Uzy4=; b=DwwxkdDw8ER/RwaP3HHZFOPYN4
	otVuRCKeJWCWk6LZffwqS43ABSWI0n5tySpnEtvMLN5Fs6hy/kpx6NKD+QKunwcrWHomSainiCqMx
	YBJO4C/n9eyIntBrOW3saG+oAU5wHcHDPEDxWqXpjHzcYtJ9hBSTRIihhuvOED8Zq8MbJoDymKsCJ
	m4fqw2SRDwKXOj2zLKwlMfeApC23uLg94tRqNPPOxclbCvwi4+WRJSY8mth73JThjoPGoh50w+Adp
	jbJDC/ucStTN2unNP/qO4Eoo4hCu+14Mp5SItMsgPZ1M2/OlBZbwKSWnVU2p/+oHC2yqppPghqZqe
	ENNdtG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9UaT-00000005tPs-04pl;
	Thu, 16 Oct 2025 20:28:37 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9UaR-00000005tPA-1AJv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 20:28:36 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-339d5dbf58aso2660881a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760646514; x=1761251314; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=92VK8FOPojooOIWV+l2v1FHmJALxyLmlS2dAJ/3Uzy4=;
        b=A9bXOFAYrzXkCkcHB0/AGb+ydHqnYgTKDhJRep658YQhgXpoN+LEA+vnvszuTPv5n4
         nQORs/pcTMmZqrFBAWQLKBSJ7oXLJdJxhbnxs4kW9nDlszPx4Y8tEGZhutNbS+/iibe2
         h85Ohem0RxPMz1H169FgbT1mjLLJYbA1KpA5dS6Wjz611x+VUpg6ymC8tTgi30CZ0xKR
         fJ5aGpoIARvmqjOf96GM/5F1FXJ2p6DV0vYe2413vmzDrqouu0lxx8wQ9dkeEQfTrIGT
         6fK2BiLCu/20CNYwSMUGK4qUy3qKLQlntT5AiXyrbtw29VqI3YPEUuAgMuMcwegBgCzJ
         qdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760646514; x=1761251314;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=92VK8FOPojooOIWV+l2v1FHmJALxyLmlS2dAJ/3Uzy4=;
        b=hn+Nw5vl/t7h75xqFmV/TkGdtGtQwFFbaG1Mx6JzqziZO2T2zPnkw5U9EkhRc0O2u4
         kEVx2mSUrDbHzD9N9COKZZmAha1TwOKgUZ0GaeGnGjMLun4klYj7UwN2Mlo9J22CE5JO
         WiugUnckiO3NbfzAhuSJQjuluXAE4Y5pXiI5ncGq+smbAxOYy6vDweoOofH8Rpi8CWmT
         CHpC7EjYt32EpDUKERMWyPts0dxewxFSp0dpS7MqzyL1ry6rir7zQt3Wwm59k+3M2KQH
         TEJKtP8oGG6e/9/rNR+VcYLF+ie1gOw7A+HF/8oeCrYnF1BCCWSQjpWAy7ylGUkeuy1y
         ngyA==
X-Forwarded-Encrypted: i=1; AJvYcCXkN2i/VofCaJUQZzgpxUCU/ZXLlebeIEdoQh1IBiX22O8+hfsCbscQKzfngpDfGD/6f2xIqe/z9CFJA67V/e9M@lists.infradead.org
X-Gm-Message-State: AOJu0YwmEB2r7Og5kntGZM6svZefZf91s5dcM69qE+fGtcMfdvAbUYXw
	2Lnci/fiJA51e9AvCwydT1kkQjXxJu7tamDda1+cAetrrUFdBjLdt4yeUaFowJ3EHtDu4oBvOkz
	lBsxmTg==
X-Google-Smtp-Source: AGHT+IG21/MmBPeuGnH22iEw5Q/v7OFmPy0dksEdBEvBnL6MuloU0P55WAZNWStQXjZRcej0BNndSKWVUlQ=
X-Received: from pjbgz13.prod.google.com ([2002:a17:90b:ecd:b0:33b:51fe:1a72])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4f:b0:330:6c5a:4af4
 with SMTP id 98e67ed59e1d1-33bcf93fbd3mr1383934a91.35.1760646514081; Thu, 16
 Oct 2025 13:28:34 -0700 (PDT)
Date: Thu, 16 Oct 2025 13:28:32 -0700
In-Reply-To: <CANiq72ntKAeXRT_fEGJteUfuQuNUSjobmJCbQOuJWAcNFb1+9w@mail.gmail.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com> <CANiq72ntKAeXRT_fEGJteUfuQuNUSjobmJCbQOuJWAcNFb1+9w@mail.gmail.com>
Message-ID: <aPFVcMdfFlxhgGZh@google.com>
Subject: Re: [PATCH v13 00/12] KVM: guest_memfd: Add NUMA mempolicy support
From: Sean Christopherson <seanjc@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_132835_333780_360CB9AE 
X-CRM114-Status: GOOD (  19.13  )
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

On Thu, Oct 16, 2025, Miguel Ojeda wrote:
> On Thu, Oct 16, 2025 at 7:30=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > Miguel, you got pulled in due to a one-line change to add a new iterato=
r
> > macros in .clang-format.
>=20
> Thanks!
>=20
> The macro is not in `include/`, right? That means that, currently,
> when I rerun the command to update the list it will go away.

Oh, I take it .clang-format is auto-generated?  Is it a "formal" script, or=
 do
you literally just run the grep command in the comment?

  # Taken from:
  #   git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*(' include/ t=
ools/ \
  #   | sed "s,^#define \([^[:space:]]*for_each[^[:space:]]*\)(.*$,  - '\1'=
," \
  #   | LC_ALL=3DC sort -u

> If that is correct, and you want to have it in the list,

I don't think I care if it's in the list?  I honestly don't know for sure, =
because
it's entirely possible I'm consuming .clang-format without knowing it.  I a=
dded
the entry based on someone else's request.

Ackerley?

> then we should add e.g. `virt/` there or similar, or we could have a few
> separate lines at the top that are independent of the ones generated
> by the command.

Is it possible, and sensible, to have per-subsystem .clang-format files?  K=
VM
(virt/kvm) and KVM x86 (arch/x86/kvm) both have has several for_each macros=
,
pretty much all of which are more interesting than kvm_gmem_for_each_file()=
.

Adding arch/x86/kvm to the "script" in .clang-format feels wrong.

E.g.

$ git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*(' arch/x86/kvm/ =
| \
  sed "s,^#define \([^[:space:]]*for_each[^[:space:]]*\)(.*$,  - '\1'," | \
  LC_ALL=3DC sort -u
  - '__for_each_rmap_spte'
  - '__for_each_tdp_mmu_root'
  - '__for_each_tdp_mmu_root_yield_safe'
  - 'for_each_gfn_valid_sp_with_gptes'
  - 'for_each_rmap_spte'
  - 'for_each_rmap_spte_lockless'
  - 'for_each_shadow_entry'
  - 'for_each_shadow_entry_lockless'
  - 'for_each_shadow_entry_using_root'
  - 'for_each_slot_rmap_range'
  - 'for_each_sp'
  - 'for_each_tdp_mmu_root_rcu'
  - 'for_each_tdp_mmu_root_yield_safe'
  - 'for_each_tdp_pte'
  - 'for_each_tdp_pte_min_level'
  - 'for_each_tdp_pte_min_level_all'
  - 'for_each_valid_sp'
  - 'for_each_valid_tdp_mmu_root'
  - 'for_each_valid_tdp_mmu_root_yield_safe'
  - 'kvm_for_each_pmc'
  - 'tdp_root_for_each_leaf_pte'
  - 'tdp_root_for_each_pte'

