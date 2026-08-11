Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94509C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 17:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tz4iSbZQOmwhQi85QuHBOwwK5bkgkFtPz0AFXWjDfmY=; b=jJAt6rEBeoANZk2iOMYNi1Y+wY
	m2d2ZyUnjP5ZKiDAjJ35cNki5/o3l1tnsRFruaPCPfxeP+4cwMyW9V9Y59xEJfXylk2XdkdGky9FC
	XSVLBD8rDTz2DruWm1+D2pkz0ablkelwQkbX295TBek/UjYehMco6HzHY5rPeFCUocplZIWoCCJBA
	kuZat7IyrjdSgU0xX0YHrtClzDATEXYvitEW/x6YgDyWc3H0mGlv6/4PG8tvwH/DeAlOC/4iuKxcU
	SlbrVYb8hrMlSzr9DD+tIKhSwVtastkME4c6OX/TDJm1iJuQhQVCEM0bzIT+DzNFIsPp8iQ7B9c6i
	WBHGPw6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqHQ-0000000Een8-1gsS;
	Tue, 11 Aug 2026 17:28:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqHP-0000000Eemw-0u3Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 17:28:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B426600C8
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 17:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220001F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 17:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786469326;
	bh=tz4iSbZQOmwhQi85QuHBOwwK5bkgkFtPz0AFXWjDfmY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=l0OkDFQdpboXND6N6MA2YZRG7RfIROUSlsjT1xENiFyKAbZ8w/bv7zeZfO+AFidfl
	 sMQjor2WRO+RNqqlx2Eynzgq4YZ2EVb3hgoRcmmAKqyM/Sz3qj1WY7l9XCGgjuvDJw
	 K56peIq6/MTSgk1grN0Lw+B7yc3ASdvHCDdO+7uhRMPhd1ITWmfmAISyZw3fn+gVAI
	 wVy75Mo4a1Em5kGFjzM0270JjOneXoJKciYa/iD/1dO5e1084jb2GB5EDDoN0fi4zb
	 sgxGE+tjLbGYAoYIGdCIPSq5I9RkRfvXscKomeoZjBAp9w3b7SAlsGf5lG9I+txbES
	 psg0iRYMaQO0Q==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c197eaaab00so13213066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 10:28:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoVSpYCUd+dgPaKFUpIzrw0o7KsaIaijpnPg0uvjfLAJvAciJmfuzefiWtrghvzPDY9OK2ykqjpKNGTnN2P3pck@lists.infradead.org
X-Gm-Message-State: AOJu0YxVMBPv6hYqmVy/v64b1/H+fviZVlpwAramZKpOBJKJkXzl+0cI
	mpnXFbtzMtAVrXW8H+jsPBa/UQn9ROVRseFhFLphCz7Fn5PScGJ46HOqXJIBZ3kBQZpMvQCvT/y
	uJ+j5czJwQMnFy53hFJSUREwuG7jiiw==
X-Received: by 2002:a17:906:7951:b0:c1c:5ec9:1954 with SMTP id
 a640c23a62f3a-c20e6266914mr225672866b.32.1786469324696; Tue, 11 Aug 2026
 10:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <amYIuhYenP4-qHyV@willie-the-truck> <0b7c0272-5506-4aee-82b3-76a78f2b39dc@arm.com>
 <CADrjBPqZFDvyLFpDy1YP9qrMNUCtZYtJhiaDd0iTnmB4ZYO8GQ@mail.gmail.com>
 <20260807224745.GA2180415-robh@kernel.org> <530dbb40-e7e2-4121-a5eb-5f16152fd11b@arm.com>
In-Reply-To: <530dbb40-e7e2-4121-a5eb-5f16152fd11b@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 Aug 2026 12:28:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLXS=33sDo8iDp-FkxVedqVaOUEemFjK8XuBNTu9KxyxQ@mail.gmail.com>
X-Gm-Features: AUfX_myXX1L5EgRLy36vB46Oy8CB1eR9qmcP-4ps2dCdsR0e5dEIjJ3SLJpQsnw
Message-ID: <CAL_JsqLXS=33sDo8iDp-FkxVedqVaOUEemFjK8XuBNTu9KxyxQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add arm-smmu-v3 support for instcfg data override feature
To: Robin Murphy <robin.murphy@arm.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will Deacon <will@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Mostafa Saleh <smostafa@google.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	jyescas@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Aug 10, 2026 at 1:03=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 07/08/2026 11:47 pm, Rob Herring wrote:
> > On Fri, Aug 07, 2026 at 04:25:11PM +0100, Peter Griffin wrote:
> >> Hi Will & Robin,
> >>
> >> Thank you both for your review feedback.
> >>
> >> On Mon, 27 Jul 2026 at 11:53, Robin Murphy <robin.murphy@arm.com> wrot=
e:
> >>>
> >>> On 26/07/2026 2:16 pm, Will Deacon wrote:
> >>>> On Fri, Jul 24, 2026 at 01:39:41PM +0100, Peter Griffin wrote:
> >>>>> These two patches add support for a new "arm,instdata-override" DT =
property
> >>>>> that enables the override of the instruction/data attribute of inco=
ming
> >>>>> traffic to Data by setting the INSTCFG override bits.
> >>>>>
> >>>>> It is intended to be specified when the smmu can't guarantee that t=
hese
> >>>>> attributes are provided correctly from the client device.
> >>>>
> >>>> This is going to need an in-tree user and a much more detailed
> >>>> description of what is being worked around before we consider this f=
or
> >>>> inclusion.
> >>
> >> Regarding an in-tree user, I haven't sent the Device Tree (DT) patch
> >> yet for Laguna SoC which adds the smmu nodes and this property because
> >> 1) I want to land the initial SoC/board DT first
> >> 2) I want agreement on the DT property name. Currently I used
> >> "arm,instdata-override" which is what downstream used. However, since
> >> this is intended to work around silicon errata something like
> >> "google,lga-instcfg-data-override" might be more appropriate?
> >
> > Shrug.
> >
> > Really, this is why we want SoC specific compatibles so work-arounds ca=
n
> > be added without DT updates. But we've generally avoided doing that for
> > SMMU for whatever reasons. Just make the property clearly sound like a
> > mistake, not a feature you might want to use. I'd keep the arm prefix
> > just so the next vendor thinks they can't use 'google' and creates the
> > same property with their vendor prefix.
>
> I dunno, I'd be inclined to keep it more vendor/SoC-specific and tied to
> the problem more than one (of potentially several) specific workaround -
> if we did ever want to support using the INSTCFG/PRIVCFG/MEMCFG
> overrides per their full architectural intent, they are per-StreamID
> controls so as such would really want to be encoded in an additional
> #iommu-cell (or at worst maybe a property on the client device node).
>
> Frankly for a workaround condition to just blanket-apply to every SMMU
> instance in a particular SoC, I'm honestly thinking that just whacking
> an of_machine_is_compatible() in the driver isn't necessarily the worst
> idea either - after all we do already have the ACPI equivalent of that
> for some of the HiSilicon stuff, it's just hidden in the IORT code (and
> OK it's used for the SMMU PMUs rather than the actual SMMU devices
> themselves, but still...)

Unless we need to avoid a DT update, I'd prefer adding an SoC specific
SMMU compatible which can use match data and avoid DT updates on
future quirks rather than using of_machine_is_compatible(). I view a
driver using of_machine_is_compatible() as a last resort.

Rob

