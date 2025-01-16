Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA13FC02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 22:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mo8wWiVSieP36PQBtcad/p/Y6sOL31Xn/K7FaizLB00=; b=JHwIl/3Pkx1damIu8Hk/hF3WRX
	B7UnQ+LySVQRootBpBCjRe33A0pCmFHBBLDPmaj3qP83cJizyeLbLUHPUex8UaF1ElJZijJ40FGUU
	d7D48Uc96cjKhsvL0bWI+aM4dz925abGdrdI6Y7eVxZk12wNNyMdX+bdDiBZFdW8y0Hk7AQ8Osf2h
	xdyS7brz1Dm/mV4oUo/dYoDhXEzoCz0hclrN+U2MEaJEnJLuurzdOtLIqc2/GqvGLPX3MF5u/L6mT
	8pnspypVrd84khntc26jsZVeMndy34dDyke2YDJdQYZIn9mlfI+GzFjCKy0vOwzKeqN80eUXGYyIL
	TnoRt0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYk7-0000000GFmq-0b2o;
	Thu, 16 Jan 2025 22:53:39 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYiL-0000000GFQd-2iwu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:51:50 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e39779a268bso2518142276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 14:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737067908; x=1737672708; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mo8wWiVSieP36PQBtcad/p/Y6sOL31Xn/K7FaizLB00=;
        b=gqSHgAy8Oq6JqYZ4u/ODFTFniBH+1spRme1XOrAWL8ftAbCh7YGe0h5OIBH5ooWaMZ
         4Dp/hnA+aBzG12NeANrH6g18HLZxKrw4MG2Vumw8uNF93tlZO8EW6+vNTdyRWHmBsxBG
         BfJ8Qv0Y1UFgsyUJzQIxuqvA/g5THbEVxq5oMfH1VGnQs3u85me3pYGBB3/rzZeqNLLt
         cJmA9WKkxrJTlk6fUvfdREM8RsAvxVIJczlNdgozGPyx4898KSKpW9qxLS6kQseVJ8GO
         GNg1R+X0kLoI6N8/fvW6Cc6Y4555RG/DbyW7txr+cqTY6498lDW8Rn/UYJMesl5NM3y/
         xo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737067908; x=1737672708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mo8wWiVSieP36PQBtcad/p/Y6sOL31Xn/K7FaizLB00=;
        b=k8UqZIqpv/Iuqpo52FSY4aLbMaMLY5bgWByYfaKSmZSAnnhuR5FD4xDW9Hle9FUoc3
         eCED6ZXpufdBBGNhgUfaMMnuVgL7xOFP+UM3Y4s+JT1WE5Fp/jV/VteOMbI9qr10Ltgz
         43PC796DT/dkNh8Gfk7xGaM0h++9h7hnWV6AB3PRlQu5UHL8OXn6Uagnj4M0zFbecltz
         pkkd6+KjDavQz32ISFVpq17RxU/+VBYVtoKcEB1WEybBwu3z1ciYK2EYDxial3DuUBEz
         be/p2fVRI2hrE7QIxkP/4EC2+hWTZymWV/ucgIg251X7tHA5i2TXYz/+Oo2kFEH3hEiz
         3SJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7sC7s+kUU11X6r4vd+uWqyD8d/1vxE+fk3pRJwaGAP/8a4iFc7x1dW5MOMyKgCbyEDKZYLCMw0qk7Az606bon@lists.infradead.org
X-Gm-Message-State: AOJu0YwoZwGhx8SezufLM2JVJxi0RwDCPx3ddZ7VagFraTXkMHOJEKbj
	2ruQW1wtBOyp9HbU0wraooIdk1aL+Avw1Q529BK3ZHpG60hAFu/WZryTH2U3WFF6PxnS2nLadQd
	EqvLlGgejkhgkfgoOJ4XDo4GYuw8xXSbctTsg
X-Gm-Gg: ASbGncsCDzOnXjZCkkKkrKpZrCsb8Wug3pdflIOvfSjA2eB+BkPxx+3NearXN0+hrix
	ftlc1wohB8Z6VKxyzxFE5mkVdntGB+Vz204w0ohLq6fKxEzrdtqq+BiU+eLvPYFaDguHb
X-Google-Smtp-Source: AGHT+IHDVU+IJsNlLjF83+Ds9RyEMFn3PvbsQABSjjSiGmmyVwS/zqJzA12leRcKXime5YwyEjpU/j8pOjxtozPQTYw=
X-Received: by 2002:a05:6902:1447:b0:e54:9a7a:bce1 with SMTP id
 3f1490d57ef6-e57b0c833demr376797276.20.1737067907684; Thu, 16 Jan 2025
 14:51:47 -0800 (PST)
MIME-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
 <Z2simHWeYbww90OZ@x1n> <CADrL8HUkP2ti1yWwp=1LwTX2Koit5Pk6LFcOyTpN2b+B3MfKuw@mail.gmail.com>
 <Z4lp5QzdOX0oYGOk@x1n> <Z4lsxgFSdiqpNtdG@x1n>
In-Reply-To: <Z4lsxgFSdiqpNtdG@x1n>
From: James Houghton <jthoughton@google.com>
Date: Thu, 16 Jan 2025 14:51:11 -0800
X-Gm-Features: AbW1kvYOIA-rxNht25vJwL_NVGMkqbp_NoziG0prE60wf6DVUh2TfK28c0IaFFg
Message-ID: <CADrL8HWRavCoZ_NtXJvcLOvjOiGDCor6ucWeEqkecA3VDY-adg@mail.gmail.com>
Subject: Re: [PATCH v1 00/13] KVM: Introduce KVM Userfault
To: Peter Xu <peterx@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Yan Zhao <yan.y.zhao@intel.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, 
	David Matlack <dmatlack@google.com>, Wei W <wei.w.wang@intel.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_145149_687299_46F8B31D 
X-CRM114-Status: GOOD (  36.41  )
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

On Thu, Jan 16, 2025 at 12:32=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote=
:
>
> On Thu, Jan 16, 2025 at 03:19:49PM -0500, Peter Xu wrote:
> > James,
> >
> > Sorry for a late reply.
> >
> > I still do have one or two pure questions, but nothing directly relevan=
t to
> > your series.
> >
> > On Thu, Jan 02, 2025 at 12:53:11PM -0500, James Houghton wrote:
> > > So I'm not pushing for KVM Userfault to replace userfaultfd; it's not
> > > worth the extra/duplicated complexity. And at LPC, Paolo and Sean
> > > indicated that this direction was indeed wrong. I have another way to
> > > make this work in mind. :)
> >
> > Do you still want to share it, more or less? :)

I think I'm referring to how to make 4K demand fetches for 1G-backed
guest memory work, and I kind of said what I was thinking a little
further down:

On Thu, Jan 2, 2025 at 9:53=E2=80=AFAM James Houghton <jthoughton@google.co=
m> wrote:
>
> FWIW, I think userspace mapping of gmem + userfaultfd support for
> userspace-mapped gmem + 1G page support for gmem =3D good 1G post-copy
> for QEMU (i.e., use gmem instead of hugetlbfs after gmem supports 1G
> pages).
>
> Remember the feedback I got from LSFMM a while ago? "don't use
> hugetlbfs." gmem seems like the natural replacement.

I guess this might not work if QEMU *needs* to use HugeTLB for
whatever reason, but Google's hypervisor just needs 1G pages; it
doesn't matter where they come from really.

> > > For the gmem case, userfaultfd cannot be used, so KVM Userfault isn't
> > > replacing it. And as of right now anyway, KVM Userfault *does* provid=
e
> > > a complete post-copy system for gmem.
> > >
> > > When gmem pages can be mapped into userspace, for post-copy to remain
> > > functional, userspace-mapped gmem will need userfaultfd integration.
> > > Keep in mind that even after this integration happens, userfaultfd
> > > alone will *not* be a complete post-copy solution, as vCPU faults
> > > won't be resolved via the userspace page tables.
> >
> > Do you know in context of CoCo, whether a private page can be accessed =
at
> > all outside of KVM?
> >
> > I think I'm pretty sure now a private page can never be mapped to
> > userspace.  However, can another module like vhost-kernel access it dur=
ing
> > postcopy?  My impression of that is still a yes, but then how about
> > vhost-user?
> >
> > Here, the "vhost-kernel" part represents a question on whether private
> > pages can be accessed at all outside KVM.  While "vhost-user" part
> > represents a question on whether, if the previous vhost-kernel question
> > answers as "yes it can", such access attempt can happen in another
> > process/task (hence, not only does it lack KVM context, but also not
> > sharing the same task context).
>
> Right after I sent it, I just recalled whenever a device needs to access
> the page, it needs to be converted to shared pages first..

Yep! This is my understanding anyway. Devices will need to GUP or use
the userspace page tables to access guest memory; both of which will
go to userfaultfd. And userspace hasn't told KVM to make some pages
shared, then these GUPs/faults will fail.

Maybe Trusted I/O changes some things here... let me reply to Sean. :)

> So I suppose the questions were not valid at all!  It is not about the
> context but that the pages will be shared always whenever a device in
> whatever form will access it..
>
> Fundamentally I'm thinking about whether userfaultfd must support (fd,
> offset) tuple.  Now I suppose it's not, because vCPUs accessing
> private/shared will all exit to userspace, while all non-vCPU / devices c=
an
> access shared pages only.
>
> In that case, looks like userfaultfd can support CoCo on device emulation=
s
> by sticking with virtual-address traps like before, at least from that
> specific POV.

Yeah, I don't think the userfaultfd API needs to change to support
gmem, because it's going to be using the VMAs / user mappings of gmem.

