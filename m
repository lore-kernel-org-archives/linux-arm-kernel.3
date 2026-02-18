Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769A6E9A049
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 21:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRlThRjj5FGBFKrZjR9u+oYoIGMr3781os1xSOsBbRo=; b=kS3ZQtNk5/CxCnmJb6+ciMf/8K
	TVLpmitESELW4lHjBz7T8fAXQ0lJFyfEK0I/Ip+0z027CfJgqeBPrvygaolVyQxWILpW1QhEN38kv
	fVV8xq7/tDLhIokgNUsVrW7uyS4RGroJy40qfbJn4e8z3lFzK10JkCE7uXagcPgClURfBR/EIeN66
	OUgUsWm3KjJxUEnFWpHeMHYA6hk/Ar0V/fpI+bhvN2pqgIbiwGlal5CpRogu8TQQecgsgHyV7gTeu
	W/R+gmC3lkKb9narODycmi+1n7zJUuQvbgBPzXlbEt0FWGC5w7QtoFloObzBe9cSMd1mMEXzxfnMm
	tCAJc2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsowA-0000000AR76-1EcN;
	Wed, 18 Feb 2026 21:18:22 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsow7-0000000AR5H-31jB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 21:18:21 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-94b07fddecbso195097241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 13:18:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771449498; cv=none;
        d=google.com; s=arc-20240605;
        b=kKAvY56Us3bhWINkeAJF7JDJ895s2XDxdFByfAveg58U/PxxODYv7PXTknvCh1rQ+Y
         TcLxP8ZlSflvyyXc+2tYu413/Gf7i8V/OEuTP13mqqiBwuynDy6+cQmAxf9eSYedIsE0
         tbTeBY16aXQ9oTMnOvmgK7yC28tVpRljQ4B2Ajlqdwo91ASfsOZrnCuusy4ujqlRk7Ib
         NoG/aMkpN/rAfuDVaVckp5SdD39vNjEx7hJdxrgnn/8V8rXwYSH0j/wyWZ86BBeZSqgI
         14FUoj9Gpp3QcLl7s7cmx+CNTbHPvfyNN++G+7cllquTSQxsvn+xjL+BV8apKctuEaHq
         02iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bRlThRjj5FGBFKrZjR9u+oYoIGMr3781os1xSOsBbRo=;
        fh=gSUYzY2zCOPdkjan/2nvk5SN78Vuwd5tbZT7Bzvkagg=;
        b=R0j9CFCKufr1b61pN8J5nIgFA/q1aX0Tr9vmsQoF6EH3DvZScwJ2ciuS//YlvJzm4I
         YxeSOP/gSo7bHZgH+WNs6pGybsUMvt9kRBo+fppsbq33JYpomfe1FCOz19jK45+YEbrx
         IjmUBWoT6oSR8w8C61JlvisCFOCCMyh8LmUz50pNAGRcg4Y/4+06+M+U3uyUoBnXg5KC
         CRne8NotUFPw4yIILJgcXfiL65f246CFgmeLNglDqQx27nBF8k8PJhZahsrWszjMnFpc
         CUhSPifEec4r2PG5OEJEW6WcRRgEFx5fERTj8DbONow43A5LN4xDsQxs3WRyGnbVrA2h
         fauA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771449498; x=1772054298; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRlThRjj5FGBFKrZjR9u+oYoIGMr3781os1xSOsBbRo=;
        b=WERPIGLQdtPso091LX8r2Vuc0JBV7ZQo2cl2lvFOyKUZJQ2yl4XkWFe1FPMadG5pL0
         hDuAD2yurPsY00N+urI6smL4ft83n883m76gAybj6NtiJZ4eeCd8rp9RotWjDIaAL5bo
         uyrzogAe1VF2kSEArO0qGsa7M5b5SZWQf3tmfNWhtDhj5Z/0EXGV3LTdFcGszof6+hS/
         KR5Unj42X8cb7wMeyxjbvHcdRHfzfzWIEzhilNO6Kpx5LiaPiRMZkzgCVheZPRfDdtFl
         MidoQZ+w/PteaU205xYOKX6ep02tLjCRIWAzaIRQ2ETehqLSXPCdgi71vk1/Vo3ohPRJ
         S/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771449498; x=1772054298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bRlThRjj5FGBFKrZjR9u+oYoIGMr3781os1xSOsBbRo=;
        b=WGvJauRVxNJ8MdwTIvJWQmcr8NpiDJjAl66oeOvlnpS9Td8qbhmbl+0RMS3jTdkYBK
         ZthR4Kvogn6bREtbSVqZ8G96DF6MsXYcxcAxTuHA+Brs58A4SnnU3y1zABA0H36ew8o+
         Gmeif1tSTjhznYvU5r/HGCaVADjxDkZDdmNZOT+8p8MSfHHY5cPmxPflK7ET0OVsCLyQ
         JwZOF2Ig6EGsYnPMxKB/VIcyvLrzwxjiQhuBHejEw4yznzQn32xk3FcY0knEobjVenyK
         c54ydsJpB0YNvIk2hdvgGqTTgI6F99yiEl10cXiBhcTPC4gEyagsBkUE3wCs5HBKE2sX
         GfjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDSWxD88aKSz4EEluHLrJ8GHNr1nhEOzbynTRBz3vngfgpMTXYZ8qECoYhtWt4ZIzUaNE5nX+v1HZ40j4SdkwE@lists.infradead.org
X-Gm-Message-State: AOJu0YwU5erfW4MV05x0kX0K12ecl5OnY3shMsELH9oRtT10jwhuAUeK
	y9ET1gEDoaJvktQp83gTub7nybluT/7rogv/PIQhNr3jbcSOfYv/q9A0sY3sgyZKSf+SbUzVnlS
	eRBWMc/Uiw2pNRO+aSINUbvKkorDZj607J4dt9GMc
X-Gm-Gg: AZuq6aK+v+Fiz+XX3IhRtJBfCee/RFswBDNqIu1KWvMkDgibnWOBcqjtHFlV2Ci3N59
	awnQLKSizFm2hcbeY9tnCdZc9PZI1rjsYZqOY2AX9lCUeGsMTDGarNq2up6yKZBgZjomulUJB7t
	fx0unsY3Hbj9Bbqt2cHh22id8GM/w9XZvOTJdAYTai0Y0nDUOvS9lZoWugPUBAN/HSiqc1Ebm8h
	P6j71figsD700JnI3WsHL6aZmyvN8hjlaoaXffv9bXhpH/3Z/Z4srJ3r4dw5S9siM2T/uQVAJPl
	VHpWtA0=
X-Received: by 2002:a05:6102:32cd:b0:5db:efcb:72 with SMTP id
 ada2fe7eead31-5fe2ad39b83mr6208741137.6.1771449497123; Wed, 18 Feb 2026
 13:18:17 -0800 (PST)
MIME-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com> <aBPhs39MJz-rt_Ob@google.com>
 <CALzav=eqv0Fh9pzaBgjZ-fehwFbD4YscoLQz0=o0TKQT_zLTwQ@mail.gmail.com>
 <aRZ9SQ_G2lsmXtur@google.com> <CALzav=fN4FpZsfzwbdLeNSj4nx4OpRkwHvKiZNVgP8S-zsUvJA@mail.gmail.com>
 <aZYpv6O15YMlGkzT@google.com>
In-Reply-To: <aZYpv6O15YMlGkzT@google.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 18 Feb 2026 13:17:48 -0800
X-Gm-Features: AaiRm50oQAsne8PMukHk2_Ehws0mlHrvXf3-klwm2DNfi8keZfRuu7miCV2uiLE
Message-ID: <CALzav=cc9y2sp66QRwv=DCpb1j8fNjLWbsiqDVK9UE4e2kthzQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Eric Auger <eric.auger@redhat.com>, 
	James Houghton <jthoughton@google.com>, Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_131819_776499_21BD7CB0 
X-CRM114-Status: GOOD (  22.20  )
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

On Wed, Feb 18, 2026 at 1:06=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Dec 03, 2025, David Matlack wrote:
> > On Thu, Nov 13, 2025 at 4:52=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > > My slowness is largely because I'm not sure how to land/approach this=
.  I'm 100%
> > > in favor of the renames, it's the timing and coordination I'm unsure =
of.
> > >
> > > In hindsight, it probably would have best to squeeze it into 6.18, so=
 at least
> > > the most recent LTS wouldn't generate conflicts all over the place.  =
The next
> > > best option would probably be to spin a new version, bribe Paolo to a=
pply it at
> > > the end of the next merge window, and tag the whole thing for stable@=
 (maybe
> > > limited to 6.18+?) to minimize downstream pain.
> >
> > With LPC coming up I won't have cycles to post a new version before
> > the 6.19 merge window closes.
> >
> > I'm tempted to say let's just wait for the next LTS release and merge
> > it in then. This is low priorit, so I'm fine with waiting.
>
> I ran this by Paolo in last week's PUCK, and he's in favor of the renames=
 (or at
> least, is a-ok with us doing it).  If you can prep a new version in the n=
ext week
> or so, we can get it applied for 7.1 shortly after the merge window close=
s.

Will do. I'll try to have it out by next week. Thanks!

