Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B478C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EB89eWBtAEhmm8FUKfpQuGCPQOllZPpE/wyoIM85JbY=; b=mmc2YZP0LZ9y9vfOYd2FeVfE51
	gy1WCO6sHaSJeevpZT43pjR5E0qN/jLBNBKxMQO917Ksj77Qrg0xS+Lz+iZINvIF6otVaD8vDlmp5
	LgluBP+T3HVc8fUQEaMj8yUrcrgE9QGlPgkKNr8wKsBHg4VGmlPkoZvhl1A3EULLwPGahU7Z7KPk8
	NpgDCNYEl7e5u7xYMpt8uBUQqVOKVkGDEAadR9kA28cVPoslnp7PZkEcKM0zD4sYDRBJGDGEtwzSb
	sjq3WkezKjUSqQWqlLtHU6R9fi1ZGICAddbe5lxVnYeVNFJb6Fk9lLS1UVT0L7NrOjL/t7Strv8fn
	yrU+WDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ8G-0000000GNUz-3dlz;
	Thu, 16 Jan 2025 23:18:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ6y-0000000GMnM-07i0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737069434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EB89eWBtAEhmm8FUKfpQuGCPQOllZPpE/wyoIM85JbY=;
	b=G17lDhqQhMLvA0daQJIg8nNrFhnXJd+FU1/WHXHUFgBqlVQhjIzHe3nghYScxNCn63z2AN
	nvkNxq2wcr18pBoGn1CXlJgzoGKb2QcXOG8XTTXlHddDYJ0Qv/tBArSzM00v9mnchUCfnM
	WwBvYbW6v/4ok0iajQr4zyEY89RU0lM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-wnIw5pEzO_6MEp7HGocDoA-1; Thu, 16 Jan 2025 18:17:13 -0500
X-MC-Unique: wnIw5pEzO_6MEp7HGocDoA-1
X-Mimecast-MFC-AGG-ID: wnIw5pEzO_6MEp7HGocDoA
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e19e09cc20so30217726d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 15:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737069433; x=1737674233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EB89eWBtAEhmm8FUKfpQuGCPQOllZPpE/wyoIM85JbY=;
        b=By80pIKZU8iyU9R75VOPKDD3RvGe05ehhCNNnJJS/17MGowDzjrOwHPz1Q1SwPDn21
         5ckhZDz+QLkftqqCWULF1WHwQa/IgGPn8EpiLpwywjp0mlOuG4xtxCjzEox/1d/Eovqu
         oGzc3Rm746NkOccVt5AqoqyCtru8nno8CqH8Hqae7wro7tg4o+Ab8X+ZjBLhzxQFXxui
         v7ol2s+c05QQmZmE8fAzqdTXuvGIkLPMFlb9Xbn3eUSDLhHm3QqV4c0WAUgei7wQf7dX
         DtLRRgaxQ7GP+/RulOdXwHrc085bacBTwfoIj5MKkU5vV5GN3N/IJ8bkefA6mqAM9Fwm
         dAtg==
X-Forwarded-Encrypted: i=1; AJvYcCXfsluIea9h9t9hk9d7E7bDW3NDa+FfpoF5PWMgMXP6bu1bomfgnIkwqOdOY6Ug4KcwMe0j5QkLj6mq7lv/Hjga@lists.infradead.org
X-Gm-Message-State: AOJu0YyDJLTTLY7/K8R/JEyNvioX7NGJImTuMkofYYDpDg6aHzI3GH7i
	Lly4BqlbK5PfHECe597QLzXsLP1JgCZhnysp4fekd022BN3h5WI5B55PzvJqA1c2ZnuLjAh1CtP
	6BOnW7XJxSLIsf2Zx3Qev9iPByG1Lu4CwG6bBd7YwrwJsKVlKMqiEmaI6jOlPDtM4bO3KMMni
X-Gm-Gg: ASbGncuYJo2VqQKgc/Cf8iITbC2Hl+B1joRgReGGEbRqd5TWrh6Nz2fvt6rH9YMfj2Y
	E0cpI7GnjUx3hPV/ev8zTivqE7Q5b1rawZH0x8Tg6CbBcr+fc7h0k0aYAHzRQ0Fp555lLasgD+L
	NGn+G5mdIbRVqgAX9fj7iON9tUYebTkIdYrkkoy66DOXMSz81g/ASjuWkzAA9Pl/u5pT4HaXQgX
	zvN2zGfTgDVxWiO7KqhPS/AbJ/FtVWVI9cE3Thry3/OkY8+yr+5t0ZHokKpB4EnJrrCViXdq6rA
	aWlLbAsvcmxF+WWX5A==
X-Received: by 2002:a05:6214:23cd:b0:6cb:d4ed:aa59 with SMTP id 6a1803df08f44-6e1b216fee7mr12477426d6.4.1737069432815;
        Thu, 16 Jan 2025 15:17:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8korhN4Q9bg606UN+KlTOIfjhzGaV+azhKrqtWHtZLTeSAl38XfGALdtMDYi+K8qFwH+Sew==
X-Received: by 2002:a05:6214:23cd:b0:6cb:d4ed:aa59 with SMTP id 6a1803df08f44-6e1b216fee7mr12477126d6.4.1737069432480;
        Thu, 16 Jan 2025 15:17:12 -0800 (PST)
Received: from x1n (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e1042ecd1sm4941611cf.67.2025.01.16.15.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 15:17:11 -0800 (PST)
Date: Thu, 16 Jan 2025 18:17:08 -0500
From: Peter Xu <peterx@redhat.com>
To: James Houghton <jthoughton@google.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Anish Moorthy <amoorthy@google.com>,
	Peter Gonda <pgonda@google.com>,
	David Matlack <dmatlack@google.com>, Wei W <wei.w.wang@intel.com>,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v1 00/13] KVM: Introduce KVM Userfault
Message-ID: <Z4mTdOc35hF26PeY@x1n>
References: <20241204191349.1730936-1-jthoughton@google.com>
 <Z2simHWeYbww90OZ@x1n>
 <CADrL8HUkP2ti1yWwp=1LwTX2Koit5Pk6LFcOyTpN2b+B3MfKuw@mail.gmail.com>
 <Z4lp5QzdOX0oYGOk@x1n>
 <Z4lsxgFSdiqpNtdG@x1n>
 <Z4mFL8wfHjvz6F1Y@google.com>
 <CADrL8HW_hgKZBX98Z17eNqC3iJruwLJcFv=pswgT8hKayMYbzw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADrL8HW_hgKZBX98Z17eNqC3iJruwLJcFv=pswgT8hKayMYbzw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H9XAPXxp_6V47zz9Fqjwff5HX3I-2DstTFlvOMaumuE_1737069433
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_151716_141476_088E9E9E 
X-CRM114-Status: GOOD (  32.18  )
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

On Thu, Jan 16, 2025 at 03:04:45PM -0800, James Houghton wrote:
> On Thu, Jan 16, 2025 at 2:16 PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Thu, Jan 16, 2025, Peter Xu wrote:
> > > On Thu, Jan 16, 2025 at 03:19:49PM -0500, Peter Xu wrote:
> > > > > For the gmem case, userfaultfd cannot be used, so KVM Userfault isn't
> > > > > replacing it. And as of right now anyway, KVM Userfault *does* provide
> > > > > a complete post-copy system for gmem.
> > > > >
> > > > > When gmem pages can be mapped into userspace, for post-copy to remain
> > > > > functional, userspace-mapped gmem will need userfaultfd integration.
> > > > > Keep in mind that even after this integration happens, userfaultfd
> > > > > alone will *not* be a complete post-copy solution, as vCPU faults
> > > > > won't be resolved via the userspace page tables.
> > > >
> > > > Do you know in context of CoCo, whether a private page can be accessed at
> > > > all outside of KVM?
> > > >
> > > > I think I'm pretty sure now a private page can never be mapped to
> > > > userspace.  However, can another module like vhost-kernel access it during
> > > > postcopy?  My impression of that is still a yes, but then how about
> > > > vhost-user?
> > > >
> > > > Here, the "vhost-kernel" part represents a question on whether private
> > > > pages can be accessed at all outside KVM.  While "vhost-user" part
> > > > represents a question on whether, if the previous vhost-kernel question
> > > > answers as "yes it can", such access attempt can happen in another
> > > > process/task (hence, not only does it lack KVM context, but also not
> > > > sharing the same task context).
> > >
> > > Right after I sent it, I just recalled whenever a device needs to access
> > > the page, it needs to be converted to shared pages first..
> >
> > FWIW, once Trusted I/O comes along, "trusted" devices will be able to access guest
> > private memory.  The basic gist is that the IOMMU will enforce access to private
> > memory, e.g. on AMD the IOMMU will check the RMP[*], and I believe the plan for
> > TDX is to have the IOMMU share the Secure-EPT tables that are used by the CPU.
> >
> > [*] https://www.amd.com/content/dam/amd/en/documents/developer/sev-tio-whitepaper.pdf

Thanks, Sean.  This is interesting to know..

> 
> Hi Sean,
> 
> Do you know what API the IOMMU driver would use to get the private
> pages to map? Normally it'd use GUP, but GUP would/should fail for
> guest-private pages, right?

James,

I'm still reading the link Sean shared, looks like there's answer in the
white paper on this on assigned devices:

        TDIs access memory via either guest virtual address (GVA) space or
        guest physical address (GPA) space.  The I/O Memory Management Unit
        (IOMMU) in the host hardware is responsible for translating the
        provided GVAs or GPAs into system physical addresses
        (SPAs). Because SEV-SNP enforces access control at the time of
        translation, the IOMMU performs RMP entry lookups on translation

So I suppose after the device is attested and trusted, it can directly map
everything if wanted, and DMA directly to the encrypted pages.

OTOH, for my specific question (on vhost-kernel, or vhost-user), I suppose
they cannot be attested but still be part of host software.. so I'm
guessing they'll need to still stick with shared pages, and use a bounce
buffer to do DMAs..

-- 
Peter Xu


