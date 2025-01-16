Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CDDC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+30IFm68jg6NDwHeVAkv6hKYafQ3ykW53j/B6i3wSI=; b=jgICE5Y9xZNcSGKOO3QrbCoCVj
	CsS7Iv9EeCVArtqXztgVd9kJ8utFku1bm/uFWJO4FmR5y7cD3a+mvTZhAUS+Sb67uFY/Tylz3t3RA
	LKal4pUxR1L8asrZEOY3R3tAml6t2kljtsXt/uKuWQzbHGBHqaDwOibZraMU32h8ALDOkbfwYFiOf
	QUilkvWo4mSQoBgcfN5Z953+Yx6H6I7ty9WXLTOGpYLOtSpEIC1hZqIXQXCfjC0JZg0j4RIyJKbh7
	eadrXrhMWOlmxKSPONpPMM0tC1JvrS+AvHjZksTBwljHyomKZhghrYWwd2W8DunjgSKl1Z9JCLEcx
	WoMhELIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZf1-0000000Gecr-37Na;
	Thu, 16 Jan 2025 23:52:27 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZZh-0000000GcYm-39Rg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:46:59 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2161d185f04so20174345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 15:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737071216; x=1737676016; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+30IFm68jg6NDwHeVAkv6hKYafQ3ykW53j/B6i3wSI=;
        b=ul3ZhcVR9rNOFtxlCw8WkvRUrzrK/vTbQ3lMrGNoDe0+r3mBvmGCGR8BciehY0Ll1I
         ohRA4YKhgwUvBdATpfevn4txNr8E1bqC6dtVZjdZaRWOLdoChYstXx+tLr14k4IcrMBo
         ZA5iOFYzFLamuz+PwI1jkCWXxAmV7MYIRiNgraIr++0y5lYWWeAPiqRcbF3ElyIRxIWi
         Y3Z2+Uv7EqTHmi6DnyZiSzRVUiF77WJrMsO6RM55kpaU5QR+0+ZlGBcVyf4TUlAftyvH
         FiljENfSOBdBqPVzspaAlAIX4Ecd8K8oIP2/ylvv3IiDiV936alcYnJPd3W10QIh0N3i
         NpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737071216; x=1737676016;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B+30IFm68jg6NDwHeVAkv6hKYafQ3ykW53j/B6i3wSI=;
        b=NpOVKF/QhtaNEpjMqB+D5M2ydqQVkKOhbgglSKEncJBKBaUvxtkvM/SNUg1cvJnp2B
         BTm3B9kxQqXggWYS/BMPHTEqjMZAnZdhi0BUyHOzVRMqsvRN4Oy/6sqZfx7lFVeGuYcF
         ReoVphQdk4l0rrUNtV1l2u3j7rL7l5GmT0gwZUXHdgqZcZLW/HVUpeo/iG2RSAMqo6Um
         R2SkJ3tGlja5czPGR203/qoZDx+jIhX5rOtzRTXzv5VsbS6cm0dYIW6NaY4xeeIxraJJ
         CBwpaWRx95c4Bf4IwRWtgaoqZ1XXBLyXogvYhSXYK4jOwxWlyG1Rno92S/A5pIUM535t
         XT9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUU4a3nEr5rLndDgXBwTO/KpHYdL8XTkEKE78ggumb6VsV7BKHczUCPdAO5zglLg61C48lOo+ihexQ5FTlwrs0k@lists.infradead.org
X-Gm-Message-State: AOJu0Yywl/wPDm10Ay55UwRX6MHlhxW9x12t8AmleVWaZhIa7rLUQELC
	DUyFogUBBHqZfeGaYp+/sVzFx8juXXRlTX7Y2FBwxdFs03xfNr9LuUpWby1ZCHwdFBLRUTiWcPa
	pmA==
X-Google-Smtp-Source: AGHT+IHZR21brkH4uVP110TgbprGaxMRRHTjbTHJnd3oJv8cZv6zsGMgvWQaUzQjRW3B/1TQyJ2Gb8Ip7wA=
X-Received: from pfbhx8.prod.google.com ([2002:a05:6a00:8988:b0:725:eccc:e998])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2da5:b0:725:f1ca:fd8a
 with SMTP id d2e1a72fcca58-72dafb5580cmr1293395b3a.19.1737071216234; Thu, 16
 Jan 2025 15:46:56 -0800 (PST)
Date: Thu, 16 Jan 2025 15:46:54 -0800
In-Reply-To: <Z4mTdOc35hF26PeY@x1n>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
 <Z2simHWeYbww90OZ@x1n> <CADrL8HUkP2ti1yWwp=1LwTX2Koit5Pk6LFcOyTpN2b+B3MfKuw@mail.gmail.com>
 <Z4lp5QzdOX0oYGOk@x1n> <Z4lsxgFSdiqpNtdG@x1n> <Z4mFL8wfHjvz6F1Y@google.com>
 <CADrL8HW_hgKZBX98Z17eNqC3iJruwLJcFv=pswgT8hKayMYbzw@mail.gmail.com> <Z4mTdOc35hF26PeY@x1n>
Message-ID: <Z4mablD78z45k1u6@google.com>
Subject: Re: [PATCH v1 00/13] KVM: Introduce KVM Userfault
From: Sean Christopherson <seanjc@google.com>
To: Peter Xu <peterx@redhat.com>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Yan Zhao <yan.y.zhao@intel.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, 
	David Matlack <dmatlack@google.com>, Wei W <wei.w.wang@intel.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_154657_809222_AA4F7F37 
X-CRM114-Status: GOOD (  34.76  )
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

On Thu, Jan 16, 2025, Peter Xu wrote:
> On Thu, Jan 16, 2025 at 03:04:45PM -0800, James Houghton wrote:
> > On Thu, Jan 16, 2025 at 2:16=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > On Thu, Jan 16, 2025, Peter Xu wrote:
> > > > On Thu, Jan 16, 2025 at 03:19:49PM -0500, Peter Xu wrote:
> > > > > > For the gmem case, userfaultfd cannot be used, so KVM Userfault=
 isn't
> > > > > > replacing it. And as of right now anyway, KVM Userfault *does* =
provide
> > > > > > a complete post-copy system for gmem.
> > > > > >
> > > > > > When gmem pages can be mapped into userspace, for post-copy to =
remain
> > > > > > functional, userspace-mapped gmem will need userfaultfd integra=
tion.
> > > > > > Keep in mind that even after this integration happens, userfaul=
tfd
> > > > > > alone will *not* be a complete post-copy solution, as vCPU faul=
ts
> > > > > > won't be resolved via the userspace page tables.
> > > > >
> > > > > Do you know in context of CoCo, whether a private page can be acc=
essed at
> > > > > all outside of KVM?
> > > > >
> > > > > I think I'm pretty sure now a private page can never be mapped to
> > > > > userspace.  However, can another module like vhost-kernel access =
it during
> > > > > postcopy?  My impression of that is still a yes, but then how abo=
ut
> > > > > vhost-user?
> > > > >
> > > > > Here, the "vhost-kernel" part represents a question on whether pr=
ivate
> > > > > pages can be accessed at all outside KVM.  While "vhost-user" par=
t
> > > > > represents a question on whether, if the previous vhost-kernel qu=
estion
> > > > > answers as "yes it can", such access attempt can happen in anothe=
r
> > > > > process/task (hence, not only does it lack KVM context, but also =
not
> > > > > sharing the same task context).
> > > >
> > > > Right after I sent it, I just recalled whenever a device needs to a=
ccess
> > > > the page, it needs to be converted to shared pages first..
> > >
> > > FWIW, once Trusted I/O comes along, "trusted" devices will be able to=
 access guest
> > > private memory.  The basic gist is that the IOMMU will enforce access=
 to private
> > > memory, e.g. on AMD the IOMMU will check the RMP[*], and I believe th=
e plan for
> > > TDX is to have the IOMMU share the Secure-EPT tables that are used by=
 the CPU.
> > >
> > > [*] https://www.amd.com/content/dam/amd/en/documents/developer/sev-ti=
o-whitepaper.pdf
>=20
> Thanks, Sean.  This is interesting to know..
>=20
> >=20
> > Hi Sean,
> >=20
> > Do you know what API the IOMMU driver would use to get the private
> > pages to map? Normally it'd use GUP, but GUP would/should fail for
> > guest-private pages, right?
>=20
> James,
>=20
> I'm still reading the link Sean shared, looks like there's answer in the
> white paper on this on assigned devices:
>=20
>         TDIs access memory via either guest virtual address (GVA) space o=
r
>         guest physical address (GPA) space.  The I/O Memory Management Un=
it
>         (IOMMU) in the host hardware is responsible for translating the
>         provided GVAs or GPAs into system physical addresses
>         (SPAs). Because SEV-SNP enforces access control at the time of
>         translation, the IOMMU performs RMP entry lookups on translation
>=20
> So I suppose after the device is attested and trusted, it can directly ma=
p
> everything if wanted, and DMA directly to the encrypted pages.

But as James called out, the kernel still needs to actually map guest_memfd
memory (all other memory is shared), and guest_memfd does not and will not =
ever
support GUP/mmap() of *private* memory.

There's an RFC that's under heavy discussion that I assume will handle some=
/all?
of this (I have largely ignored the thread).

https://lore.kernel.org/all/20250107142719.179636-1-yilun.xu@linux.intel.co=
m

> OTOH, for my specific question (on vhost-kernel, or vhost-user), I suppos=
e
> they cannot be attested but still be part of host software.. so I'm
> guessing they'll need to still stick with shared pages, and use a bounce
> buffer to do DMAs..

Yep.  There's no sane way to attest software that runs in "regular" mode on=
 the
CPU, and so things like device emulation and vhost will always be restricte=
d to
shared memory.

