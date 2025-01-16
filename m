Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5084CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ownLtPpk0wxf6r6Wq9E4jSgq7bXvrdC32yvYQuD3YI=; b=IeF3HuLXG9vUtBXhQ5DqgYJsoH
	k+URL079ALcM89Q4pwCy4oRGcfV29W+gYrjrIboyz9YNKmtI2+NKGuHPYVFEewzDEUx5bEnn8IV4M
	1xajvk2IVfe89eMv5E3o03x0nkPRYKSA+7asJFfKjjPoe3HUbXhzqMTaM5skSdbexyet1Q/p25L2M
	mL1ujDRiB+PRtscT7p59TTwfn7BuIpap06FcT9//k/PotSKtvo4+a5eX8c2HiE5oivC4SQgEBxAhU
	XNb4gu1EsD3S3rHGm7Rfco7hNyDpzSLKCSDzrpcwVVdkjkSlwURzULPXrjV65h6yKVQXYuQ9qG4Ru
	Kmt/OzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYwl-0000000GIJn-06lL;
	Thu, 16 Jan 2025 23:06:43 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYvS-0000000GHrX-1N7M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:05:23 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e398484b60bso2478563276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 15:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737068721; x=1737673521; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ownLtPpk0wxf6r6Wq9E4jSgq7bXvrdC32yvYQuD3YI=;
        b=pIJ14XIwJKSE5I3dBhefzB0g2POs7SazuIsVPs1enqioSP/yrf83ibJyBFiIO5qUAz
         VtTCtqnNTmRkqVEcJMZQqHAE9g2dZYg8jY1Hm0h5gG16RDdphh/hRnde/TpHZYezDLBp
         JxtDzD84vMOUiyqi98U+6qEiZASr5HWX/kTkds+yzn9T7LGxw9Xf1QATPcO4BtnLbsvk
         aZ0V4G3p0+rw+ChUMR8gOYu9yxyZa18frHeIgb/zUm5CMgIgAkqsQxkkXLGhEOj4Rkvb
         GA7LdXN318Ld1kjUb+IyJwMRxmyaKR9EXlql4lXmaTvcX8GRCagcFyvTIvKKKz4d7JdX
         Ngjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737068721; x=1737673521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ownLtPpk0wxf6r6Wq9E4jSgq7bXvrdC32yvYQuD3YI=;
        b=rGBDNH+PmVHE6h0X/gcZ2rhWKshwAgOCrbtft7zou1LVnzk2BTXQ2pWRiMcWVYRKti
         hVkhIiab2Pqt4NqXnHFIxamZc0xFREMF7DgkevMogH0PDJzQG/2tFZFXQPigvnPAtBRQ
         E+73zpuRt2ZZMsyb6tAdSuVJL/GhHJyQbAjUC+D4YB8N4QZDsiNJKnrS+jSdXkyWGnZv
         zqNw2i3AudENytopf9jUCYA+VAxZq9puBUIQsDQydgL7RiH4Jq8k4njX8So7Q3P0CoQc
         ZTTO+AlayhJZsbV46wnhNG7+Z1S3N+fixZ4H01WG8HWFGMf/i+k2FJdx6wo6B/ZnsHW9
         2PoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjVo/83kIZdxx6U+YLdS/sy58d06DrljKV436YsTdqZlaeDl8Tq19MGVUFMRd3ERF+tfXkvhponPTeBhLCgmWF@lists.infradead.org
X-Gm-Message-State: AOJu0YwpAVdVQUXFVMBEq6xtGxvgZ11lQl3QmqdEnBfe8aT5Hj0yYw9x
	Xh6APdhyVBWClZitODDhzXcXZ9CAT7n2f6RbThvlCcL5RIhk2/WWveP8glxHCPZJJ5Y4wtxJU2w
	OpdYvYBoV44U4Dy/dxViIOx4hCfYRoblg8mD9
X-Gm-Gg: ASbGncu2f8hLFM+kSOjvqVcr6iqQZFBnYTNhF5/cyIXO6/OAVNTWb5UukaPqCRBl+cX
	eaVAyCk72NAplthy1miURqYgN9KSaoKDQiuO+xCcY8POEpcuFjlvdxVzevvq7VcA7p+oJ
X-Google-Smtp-Source: AGHT+IHMnqWCK1543bGJ7is63MhDeR0ycyx0XklGqD/4LG6uvyEtx2Qm3xFEDxKFZ6o5qY44BdR/OD9k5OQNQTNdcJY=
X-Received: by 2002:a05:6902:707:b0:e38:8749:815e with SMTP id
 3f1490d57ef6-e57b1310a25mr249418276.30.1737068721056; Thu, 16 Jan 2025
 15:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
 <Z2simHWeYbww90OZ@x1n> <CADrL8HUkP2ti1yWwp=1LwTX2Koit5Pk6LFcOyTpN2b+B3MfKuw@mail.gmail.com>
 <Z4lp5QzdOX0oYGOk@x1n> <Z4lsxgFSdiqpNtdG@x1n> <Z4mFL8wfHjvz6F1Y@google.com>
In-Reply-To: <Z4mFL8wfHjvz6F1Y@google.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 16 Jan 2025 15:04:45 -0800
X-Gm-Features: AbW1kvYhIT_qdEvLNggXEyTtjFcK3iljN13YOJGI8jYSmtn1o-5KlOinkDsaqTE
Message-ID: <CADrL8HW_hgKZBX98Z17eNqC3iJruwLJcFv=pswgT8hKayMYbzw@mail.gmail.com>
Subject: Re: [PATCH v1 00/13] KVM: Introduce KVM Userfault
To: Sean Christopherson <seanjc@google.com>
Cc: Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Yan Zhao <yan.y.zhao@intel.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, 
	David Matlack <dmatlack@google.com>, Wei W <wei.w.wang@intel.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_150522_374182_EAF63290 
X-CRM114-Status: GOOD (  24.96  )
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

On Thu, Jan 16, 2025 at 2:16=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Jan 16, 2025, Peter Xu wrote:
> > On Thu, Jan 16, 2025 at 03:19:49PM -0500, Peter Xu wrote:
> > > > For the gmem case, userfaultfd cannot be used, so KVM Userfault isn=
't
> > > > replacing it. And as of right now anyway, KVM Userfault *does* prov=
ide
> > > > a complete post-copy system for gmem.
> > > >
> > > > When gmem pages can be mapped into userspace, for post-copy to rema=
in
> > > > functional, userspace-mapped gmem will need userfaultfd integration=
.
> > > > Keep in mind that even after this integration happens, userfaultfd
> > > > alone will *not* be a complete post-copy solution, as vCPU faults
> > > > won't be resolved via the userspace page tables.
> > >
> > > Do you know in context of CoCo, whether a private page can be accesse=
d at
> > > all outside of KVM?
> > >
> > > I think I'm pretty sure now a private page can never be mapped to
> > > userspace.  However, can another module like vhost-kernel access it d=
uring
> > > postcopy?  My impression of that is still a yes, but then how about
> > > vhost-user?
> > >
> > > Here, the "vhost-kernel" part represents a question on whether privat=
e
> > > pages can be accessed at all outside KVM.  While "vhost-user" part
> > > represents a question on whether, if the previous vhost-kernel questi=
on
> > > answers as "yes it can", such access attempt can happen in another
> > > process/task (hence, not only does it lack KVM context, but also not
> > > sharing the same task context).
> >
> > Right after I sent it, I just recalled whenever a device needs to acces=
s
> > the page, it needs to be converted to shared pages first..
>
> FWIW, once Trusted I/O comes along, "trusted" devices will be able to acc=
ess guest
> private memory.  The basic gist is that the IOMMU will enforce access to =
private
> memory, e.g. on AMD the IOMMU will check the RMP[*], and I believe the pl=
an for
> TDX is to have the IOMMU share the Secure-EPT tables that are used by the=
 CPU.
>
> [*] https://www.amd.com/content/dam/amd/en/documents/developer/sev-tio-wh=
itepaper.pdf

Hi Sean,

Do you know what API the IOMMU driver would use to get the private
pages to map? Normally it'd use GUP, but GUP would/should fail for
guest-private pages, right?

