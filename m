Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130C4CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMO3Rs3kVsbeR9kpL3G2iwG3KSDbb6leHyCteNZWJKU=; b=WhDRnefOiAMhTFNSCGfozKwTwh
	24KLYn/fXotp9UaknbHqZEKorIJA3xXnH2LvQOnhNrSEV+qgT7eapgMXacCpN1Tw5Rh25+hv3rnSc
	eys7WY3f+/3Pf9YDQfzA9U8N7zdjW5rkoZ7DF7BIX4KC1R4bx3hyR0dYEl2PMIakwbB7hyh5/9rHp
	1jFbBCIlrZgCu3TRPen0av7myH0zGLCvjla8q72O7x/IQI9GygUE8jcnbOo6AFyyvjY5Slih3LSlP
	O1ZWQttUGXCTC51+Ln0JWblzXY5Vt8s4mSaUMDHGJO7LMUEWkD59dxZn3jZdkgyZfdrPHwP95xtZz
	osDUhmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0v-0000000Fy69-3Exm;
	Fri, 05 Sep 2025 02:17:21 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEyG-0000000Di83-3BE1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:46:10 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-71d60528734so12811777b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757011567; x=1757616367; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMO3Rs3kVsbeR9kpL3G2iwG3KSDbb6leHyCteNZWJKU=;
        b=g4jlSYhLZu/Ea3vFto9i+2bHRzEN+zUtyU2O+VRBjH3jm3MwNxO76/7Q3AVU9tvhPw
         9S+8wB1pTfE3U7at1FFQig0j31HYehX/V/iMFwdhMLxWavXkSNPzvhp17GdzdHxrrmM/
         yqt/6F0Xw7bhjCZ7dqFwH1jpYe34jN67rdSrLkeyW2JBLp9JnpexrHqEE4j3Bym3us8G
         SxAaztBUM81/JIqiA/U+lPKqsN0tVZdbu9VjVyDelirttMI9gTL0HN3AzACjF2tJDfQi
         UQDYjzwI8QFpne5iSuOWqs7kWBV5IIpNaeMyuwoxfPejOC6NSnT53oEcsGNqL3otSRt9
         3LlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757011567; x=1757616367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMO3Rs3kVsbeR9kpL3G2iwG3KSDbb6leHyCteNZWJKU=;
        b=NNABK159PzamZawNBzpfQUEiTJ/7AMLafDLL7mPhN2mRXzWU3cMyq6JeqtAv3Di7Sq
         h4fEPdilKh9lh0qHD3Mj/cPaj3FXX2LSTZK3huD1MiEKiq5966U2IGL3C+m9KiVcqGOr
         Is21de6TLkhrsmznO+fFPOAPhREkxjVTIw2L1TNNuGnxS1d+rgW37uUdVDVvIPFkalRu
         cAutLy0MqgC2867pSk4vEJsxmHhR7Ty6J4pJZlzdr4+bRoHLLPmCYYAvD8aq4aTwB/XU
         fb8RsOrJE81d6moXJl+UDgWc3OXic24EWg9GUVaPXenPbLUIjDVvPT+304o547ALng35
         kpLg==
X-Forwarded-Encrypted: i=1; AJvYcCXykEhXNYnx1n0+i757eY4fVQ5NPQPj5uO2tIm7v4HDgcK1rQE5j3R6Zq+tCdaOZyR6hiXYkJ2+oFUDR0ebbRmh@lists.infradead.org
X-Gm-Message-State: AOJu0YzHdNIq++by0OjkHynzLCRlLJJsgxrdmKZQSxLfPjkyy6amGW8m
	/XtZYXGcj+SWklI0ktbKt7lba18Rg344PMFKchskE1ZRLzruvG2lPQ+v/sA5maPZVM7XAzhoB2l
	xef46fxet4iy6EgsBfKkvCIgB/1u+JdG2JebGsJsG
X-Gm-Gg: ASbGncumSXjVi1dz+qrFNGxaQ7qPNULjReeXmrylthF37I4Nz50iNrv4Crd1QxPN9Df
	uu0/V0iKJRCaYCj14ZDOmRHCBiLp7Wcca4syjy+mrdxHePNO/N0Pjw4tbV+ISbVi8pM8tGwUBhW
	cHqbFhitnFmXQSfSJJDtB+hsE0V5B6hCnsCyAxy8Vhe2ssi4qmoKIanNpOC553iV8mH47L7xej7
	RpJ4Cmf9TmX01jXmqhvLnuRPKQ/XyNCjVwXRoBqmdXr/7udbsGpfEI=
X-Google-Smtp-Source: AGHT+IGn9N+homcANGMwR4jfEFzD2NCD2KcIcBhFWplr8ibSUoc3dBeDSKfXSBSRcFnFSDBlKc1RK8qrGOI6Pnn1inw=
X-Received: by 2002:a05:690c:f86:b0:71c:40c9:b0d1 with SMTP id
 00721157ae682-72276134719mr229604487b3.0.1757011566319; Thu, 04 Sep 2025
 11:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com> <de7da4d8-0e9d-46f2-88ec-cfd5dc14421c@amazon.com>
In-Reply-To: <de7da4d8-0e9d-46f2-88ec-cfd5dc14421c@amazon.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 4 Sep 2025 11:45:30 -0700
X-Gm-Features: Ac12FXzXQ2J2IObwStpXP8KUnuPjviPOSORfujA1_ZEACSuvKQLNHacmBk1cLV0
Message-ID: <CADrL8HVxvwB4JrnUf6QtDCyzZojEvR4tr-ELEn+fL8=1cnbMQQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] KVM: Introduce KVM Userfault
To: kalyazin@amazon.com
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Yan Zhao <yan.y.zhao@intel.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_114608_813938_65DEE18E 
X-CRM114-Status: GOOD (  21.12  )
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

On Thu, Sep 4, 2025 at 9:43=E2=80=AFAM Nikita Kalyazin <kalyazin@amazon.com=
> wrote:
>
>
>
> On 18/06/2025 05:24, James Houghton wrote:
> > Hi Sean, Paolo, Oliver, + others,
> >
> > Here is a v3 of KVM Userfault. Thanks for all the feedback on the v2,
> > Sean. I realize it has been 6 months since the v2; I hope that isn't an
> > issue.
> >
> > I am working on the QEMU side of the changes as I get time. Let me know
> > if it's important for me to send those patches out for this series to b=
e
> > merged.
>
> Hi Sean and others,
>
> Are there any blockers for merging this series?  We would like to use
> the functionality in Firecracker for restoring guest_memfd-backed VMs
> from snapshots via UFFD [1].  [2] is a Firecracker feature branch that
> builds on top of KVM userfault, along with direct map removal [3], write
> syscall [4] and UFFD support [5] in guest_memfd (currently in discussion
> with MM at [6]) series.

Glad to hear that you need this series. :)

I am on the hook to get some QEMU patches to demonstrate that KVM
Userfault can work well with it. I'll try to get that done ASAP now
that you've expressed interest. The firecracker patches are a nice
demonstration that this could work too... (I wish the VMM I work on
was open-source).

I think the current "blocker" is the kvm_page_fault stuff[*]; KVM
Userfault will be the first user of this API. I'll review that series
in the next few days. I'm pretty sure Sean doesn't have any conceptual
issues with KVM Userfault as implemented in this series.

[*]: https://lore.kernel.org/linux-arm-kernel/20250821210042.3451147-1-sean=
jc@google.com/

>
> Thanks,
> Nikita
>
> [1]:
> https://github.com/firecracker-microvm/firecracker/blob/main/docs/snapsho=
tting/handling-page-faults-on-snapshot-resume.md
> [2]:
> https://github.com/firecracker-microvm/firecracker/tree/feature/secret-hi=
ding
> [3]: https://lore.kernel.org/kvm/20250828093902.2719-1-roypat@amazon.co.u=
k
> [4]: https://lore.kernel.org/kvm/20250902111951.58315-1-kalyazin@amazon.c=
om
> [5]: https://lore.kernel.org/kvm/20250404154352.23078-1-kalyazin@amazon.c=
om
> [6]:
> https://lore.kernel.org/linux-mm/20250627154655.2085903-1-peterx@redhat.c=
om

