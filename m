Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F51C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 17:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfmVEdWuub4CI3JVXdpcy9od0u589O5saOKcmY0n2jY=; b=MIT7IMCYhZVx6r7rDzY6ykRrBb
	HU52AYLxt0Mm2AB10vnuqJzkNHxYy1NIT2qk5TwGkqKj8L4ll+xTTguQgdxkhX29/HRStn8/IChxS
	uIDDFwwbFVKPNwcXigtGcPhxtYWhmJujgfd4lA2MOY1UcNC9rrzmuocB6lkcdF6zweC76yOpuFqnq
	Wd80YTbOkjjb6NAbU0DxrxUi4UFahyUjgCJlN8sVspZ9+u39M6oS6GBUjNDytpnkSi1JelWk4YqCC
	UWzC8mtFp8+y1T4y4w8IUQdfxj55zJN2uyPgVQ//usDk9SOJdZFR0cmij5k/9JXvSU2icfUq7fBQm
	fc7TpAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3CA-00000001L4B-04FD;
	Fri, 30 May 2025 17:07:02 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2uP-00000001FFf-2CZE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:48:43 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so313a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 09:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748623720; x=1749228520; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfmVEdWuub4CI3JVXdpcy9od0u589O5saOKcmY0n2jY=;
        b=WGk8VSiVZKeiyc2ULEmhNh5bDsSHjEcNV8gcU8I21NWh/eqKekcyoWB3pRG2N7DaMA
         oThxCB0pBPLUuFqRfCl1Dq9lHaoE/Dc21RT5AjQ2FNdZsPwEzo0jBz/RiRzoB5Rw/Ds7
         PkV3WVcOnD9Q2R67zFaZCfsjywd1fKCHIvUlbXrJ880I03Rv+VBJnNfD4glV1fORkYah
         VuVvq9h9SXkVev93vg8ox56/qKjaoVoQnnEfWaj5THEddu/KSaWinTKp79w0RG2hjRio
         bi6+tmpYGlqSV04rKDcot2lfMlP6rehuNLfhWTghU2nMRIv3LLLQFjqwXz2mbgq/SLRn
         7zXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748623720; x=1749228520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfmVEdWuub4CI3JVXdpcy9od0u589O5saOKcmY0n2jY=;
        b=RTSQXLzwdPmi9qqHl+luZ9uFa3At827fEHD52fAgqCF2Io/uzhAlnOLqOAqavncyeK
         mk/1PtGaZ6qED3DktvMM3wotwbdAHo+MKCrms9DYT+UpzdD2hDO5OF8U6e85sE9zaTNT
         VZNHIauusFakm09WtPxDkQnwDYsg+xknkILBzSrkOd67Xhjo20eN50/VQSPY2Duwgfik
         abP7PaMFkn64N/DG8x9tiKWyfgBn8i0iJF+0gj+EvekhRt4EGLXVFJaye/6Ha4QdftLS
         dYcuaWYWZBv7Oa5WMAHhrkNzaRkeQ/fatACmjZ/x3bxbNBMsz2EktNos2TWe5ixBPRLq
         NaqA==
X-Forwarded-Encrypted: i=1; AJvYcCUCIuP71EhvU8+TpMByOaWX2/J/bdWc5Mc7Xiq97fg8y62I6geUlrTRsG0P1meH5Uq15FNGyczOdP8BEMlF8U0S@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1uv68hs+KFQzxBPPqji9iatsmC/j8ATXx9qBOTsYBct2u/jyB
	4xuzII1Ih7JfHiTDNBKj87XFmaPoLULV51lEVtgAIM3j/CQpiYSWn3yxTuoYtYg8rBpocNAK0U/
	/4uQ+JXTnYcukR1kgruY3dZnECGitwieE+pysOOSA
X-Gm-Gg: ASbGncs0EXNXED3OIrFALA8b279/+7DU5T04EudqKzeEWV6HnesNqxzN24OQiaB85K2
	iLA8r3CQjcFBhf+hhJWUt4Ll5YQimnvhhcOR14pUKGKva8lq4CWa8ivz6mvShUI+LpEY5Dj7TCH
	95gRdmUE2Z5SGm0zvNL4DGbsL24vilpdijsapdgaKe0rvHu0s97LF0IXbeuZBqqgKHmjV/q4ifV
	fgghqydrg==
X-Google-Smtp-Source: AGHT+IE4j04MEyqUQCgfbrapQs0vaUyWF/djR96KweNRHT1cvPKfDr7hIyG719V7LSGCiiciPXhWHE48ON6aHoH7Fnc=
X-Received: by 2002:a50:d781:0:b0:601:7b94:b80e with SMTP id
 4fb4d7f45d1cf-60577a3ffadmr87988a12.3.1748623719573; Fri, 30 May 2025
 09:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
 <20250530140446.2387131-2-ryan.roberts@arm.com> <CAG48ez2k6ZmM-335EQjXeL6OtKzuOjVPWQDuJ75ww9Z6NMeg5w@mail.gmail.com>
 <d183b3ff-ab61-4dc4-98c8-7ab9c1f6a4aa@arm.com>
In-Reply-To: <d183b3ff-ab61-4dc4-98c8-7ab9c1f6a4aa@arm.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 30 May 2025 18:48:03 +0200
X-Gm-Features: AX0GCFuAT1zEtvLEHv4Z2Un3xyWjY8-HX0RQ4IFigWsX-k02Th9HNwh8AhT-yZ8
Message-ID: <CAG48ez27zfTAPrm-UX7_oqLs5S14-Miw9qreKyq2sMjxkn7q7A@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/6] fs/proc/task_mmu: Fix pte update and tlb
 maintenance ordering in pagemap_scan_pmd_entry()
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mm@kvack.org, 
	Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_094841_573664_B565B655 
X-CRM114-Status: GOOD (  24.40  )
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

On Fri, May 30, 2025 at 6:45=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
> On 30/05/2025 17:26, Jann Horn wrote:
> > On Fri, May 30, 2025 at 4:04=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.=
com> wrote:
> >> pagemap_scan_pmd_entry() was previously modifying ptes while in lazy m=
mu
> >> mode, then performing tlb maintenance for the modified ptes, then
> >> leaving lazy mmu mode. But any pte modifications during lazy mmu mode
> >> may be deferred until arch_leave_lazy_mmu_mode(), inverting the requir=
ed
> >> ordering between pte modificaiton and tlb maintenance.
> >>
> >> Let's fix that by leaving mmu mode, forcing all the pte updates to be
> >> actioned, before doing the tlb maintenance.
> >>
> >> This is a theorectical bug discovered during code review.
> >>
> >> Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and opt=
ionally clear info about PTEs")
> >
> > Hmm... isn't lazy mmu mode supposed to also delay TLB flushes, and
> > preserve the ordering of PTE modifications and TLB flushes?
> >
> > Looking at the existing implementations of lazy MMU:
> >
> >  - In Xen PV implementation of lazy MMU, I see that TLB flush
> > hypercalls are delayed as well (xen_flush_tlb(),
> > xen_flush_tlb_one_user() and xen_flush_tlb_multi() all use
> > xen_mc_issue(XEN_LAZY_MMU) which delays issuing if lazymmu is active).
> >  - The sparc version also seems to delay TLB flushes, and sparc's
> > arch_leave_lazy_mmu_mode() seems to do TLB flushes via
> > flush_tlb_pending() if necessary.
> >  - powerpc's arch_leave_lazy_mmu_mode() also seems to do TLB flushes.
> >
> > Am I missing something?
>
> I doubt it. I suspect this was just my misunderstanding then. I hadn't
> appreciated that lazy mmu is also guarranteed to maintain flush ordering;=
 it's
> chronically under-documented. Sorry for the noise here. On that basis, I =
expect
> the first 2 patches can definitely be dropped.

Yeah looking at this code I agree that it could use significantly more
verbose comments on the API contract.

