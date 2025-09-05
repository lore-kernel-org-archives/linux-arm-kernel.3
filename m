Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B420CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEtLYmY8JOalgrgOv2U5MLx2Oeht0cmwE/ZJBlYZqa4=; b=dbIHYWCpD3oQvLCRDm7KfDAlzO
	z5y39iCZNT6KDp0yXD18DtZWObIrE09H+KG6210TYlh0lXptRKdmxjj9fX/IuXoTgfYj3SvsnqX+G
	rwPFB2a8nDT83hJGtfLvEto1AxrTmj/NSQum8GqZ+wCcX0RJWGYfOWJSoEMd1i+ud2HQLcZrMSEMH
	ZnvJJYnx5+7Al5xizwnRdKc8E1u85HdqvGgHC93o16pKTCWgEh3N1kv8jJXLTqi026VluwzHgV8BD
	YhOAMx4wWlLk/Zdn7xCALlJpSGyUoYw8n3Aeqk1ADHuXB+E9G6LpUkmexpBH0dAzIia1yj0ee0bcc
	MaIK3wsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZ3S-000000031I4-21ut;
	Fri, 05 Sep 2025 16:12:50 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVX9-00000001gnF-3EP0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 12:27:16 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32bc286bc1eso1418553a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 05:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757075234; x=1757680034; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEtLYmY8JOalgrgOv2U5MLx2Oeht0cmwE/ZJBlYZqa4=;
        b=Fov6lNziR9lwkggIilujHMP10/BZTA9Ixo5ybJY2TSa2SUOypv/3d+67HQSnkT8cLC
         fInJ7QY1Gu8JF9KbhtH+Ydf1/7/GJwRkYjKECjIK8CE5Z8UqZsKmPbsJynw89WRIxvzb
         kT8eO5jborlqRcJe6X2mK/7KtIKXOfAW9a6anCsTttsHIpkLbk63rEoIFv0SZWJtDzk0
         nn+yDRx7KKUJt+WEMsCGU2r5AvfjLnG/wpF0zEAZXh0XyFzX3gRVm6ozkOkmVFXadmTX
         XDpFXpIZDBAs1Xmrq0aP27a3DpdiYb89hHCZGPNkAQgL/dopD54H33DlVJlVaFMq98oq
         j5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757075234; x=1757680034;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uEtLYmY8JOalgrgOv2U5MLx2Oeht0cmwE/ZJBlYZqa4=;
        b=C0Av1R0fsEnFF+1jHBbzYBpbgD6XhtV5zKGAdfguRgAiAzgFfT/B/yrbqtbWLu9sAz
         Q6j7rpMgaAwgA7vGIhUU2hbtbJ8tf435daf3QCCdIA6TNfv3bB1xaiLpBO6nkWNeFjy0
         owlHdS85swgqEJ2Yvvi3jraBNucI5OiHcSXBEQT/GPcFhF/4eFDgw/0hALgVanJqa34Q
         3XmV6GzylP5SPhb1sc/H8KIS9/415EHAZVeThwyylhYU1i8UljU250BOjJ1gJU3ELChM
         dEpQeeuAwWy2PzzKOYo17mWn1s1wDIcCSYmxxxE7+kBuoc9K65HEe130bkqKakkjrG6w
         QY2g==
X-Forwarded-Encrypted: i=1; AJvYcCWqvZqvWfUqGwiaVNWrVyFp6302m6p6zpib55g2b+suBirtXXan5dhUCUQOelWLX47p2DjxvJ9V+f1zAM9nkiy4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjsa68NXXi7eTTKopoBzbhbohvQXmGwNS4qsZvGnovfGJhbrTR
	tvxwXTOm1Ce50kXUzRxKarH2dcla8f4cDHtCM8gWGb3OzOGDb+TyiRzWXFjm/MurGaqUpjqNufv
	SBr8kKA==
X-Google-Smtp-Source: AGHT+IGL6U3Es4ziofS/w8+rJpx7HwQEqsdYgzJc5tlMCihXPtFAaEH2AeP3MpoxcgsR8e9ya+5ty4Rf6kk=
X-Received: from pjbmf13.prod.google.com ([2002:a17:90b:184d:b0:32b:35fb:187f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1a8b:b0:32b:b26e:1569
 with SMTP id 98e67ed59e1d1-32bb26e2965mr6479994a91.15.1757075233964; Fri, 05
 Sep 2025 05:27:13 -0700 (PDT)
Date: Fri, 5 Sep 2025 05:27:01 -0700
In-Reply-To: <CADrL8HVxvwB4JrnUf6QtDCyzZojEvR4tr-ELEn+fL8=1cnbMQQ@mail.gmail.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
 <de7da4d8-0e9d-46f2-88ec-cfd5dc14421c@amazon.com> <CADrL8HVxvwB4JrnUf6QtDCyzZojEvR4tr-ELEn+fL8=1cnbMQQ@mail.gmail.com>
Message-ID: <aLrXFWDgDkHqPQda@google.com>
Subject: Re: [PATCH v3 00/15] KVM: Introduce KVM Userfault
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: kalyazin@amazon.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Yan Zhao <yan.y.zhao@intel.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_052715_805170_1ED76712 
X-CRM114-Status: GOOD (  21.74  )
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

On Thu, Sep 04, 2025, James Houghton wrote:
> On Thu, Sep 4, 2025 at 9:43=E2=80=AFAM Nikita Kalyazin <kalyazin@amazon.c=
om> wrote:
> > Are there any blockers for merging this series?  We would like to use
> > the functionality in Firecracker for restoring guest_memfd-backed VMs
> > from snapshots via UFFD [1].  [2] is a Firecracker feature branch that
> > builds on top of KVM userfault, along with direct map removal [3], writ=
e
> > syscall [4] and UFFD support [5] in guest_memfd (currently in discussio=
n
> > with MM at [6]) series.
>=20
> Glad to hear that you need this series. :)

Likewise (though I had slightly-advanced warning from Patrick that Firecrac=
ker
wants KVM Userfault).  The main reason I haven't pushed harder on this seri=
es is
that I didn't think anyone wanted to use it within the next ~year.

> I am on the hook to get some QEMU patches to demonstrate that KVM
> Userfault can work well with it. I'll try to get that done ASAP now
> that you've expressed interest. The firecracker patches are a nice
> demonstration that this could work too... (I wish the VMM I work on
> was open-source).
>=20
> I think the current "blocker" is the kvm_page_fault stuff[*]; KVM
> Userfault will be the first user of this API. I'll review that series
> in the next few days. I'm pretty sure Sean doesn't have any conceptual
> issues with KVM Userfault as implemented in this series.

Yep, Oliver and I (and anyone else that has an opinion) just need to align =
on the
interface for arch-neutral code.  I think that's mostly on me to spin a v2,=
 and
maybe to show how it all looks when integrated with the userfault stuff.

