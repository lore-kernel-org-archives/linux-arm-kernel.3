Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58F8D2ED17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1zCNGgef8h4dx5wfQYzWOmcIl2PEe8tEJazBc1BpM8=; b=bBQq+Lkh9Shc6+CpI1Ls9d8EIU
	QW12Nge8xYNwlDAn3rkJdwRv8a5XWhCbyPZavQZAU8a00WQknzlDxdZ5J6ggST2aUW6bSoWDmOCZS
	TuKtjO9tcjJkNEU4aWr6kwUpEGr/e9h7K4vS4r0/I9ZwM4l/DiAUQZXMY/x81AQEA3hYphuXKdDYW
	QnxRxSvrnrQAE9WYxpA0QTi09G2jVqBopGgoCp7ZFPmZ9ednKhGhyOPPzFz5TiloMRWspGKt5TW+C
	cflHoV/oitmEYeMdTFmR9V/EGAp9CyFoPMLQwJSe4NZrs9gcD/Zuze9g5USmXk9/cSRgiz8Ef7UMI
	is9BEOEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDeU-0000000457U-2Jgs;
	Tue, 20 Jan 2026 15:28:18 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDeR-0000000456x-2DVG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:28:16 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b87003e998bso1109335066b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 07:28:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768922893; cv=none;
        d=google.com; s=arc-20240605;
        b=aydrUerOca+Oh495JxAcceZh5NitGZMKNscyHDNKLSpr98e8Dw4ykDekQRXxAqb2Qd
         6/FNFs7Vokjz9DHEhk/434oyQzKhk2gNT4icXmyT29jcrA9yHQYaGz/TbZOglJflrPar
         HdOaHMS+YEm2xU2JUx4A5YYSoS1F/Hcbh4DSN7Cfyq+2qrM2doyNpqnIboQeU7cnPGxS
         +8uMCycazTNNx7mPDAiwz0VKR9892PqF/p1ujv1/h6HfpVQoXd+v4KOPlEs7eEby70n+
         SqAFyNGFrR48Y8walRI86ASshF7AThugsmeawOClgkcEVGwaZR8iPDHz7wfAbtpBL8Gv
         OShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I1zCNGgef8h4dx5wfQYzWOmcIl2PEe8tEJazBc1BpM8=;
        fh=uSWA2RJDCjirhvBgfRS1X83QNYTazt4/MhCLA5zeo84=;
        b=j7JWYBrRpWWgYsaJG8eJgmIOIhE+IZi0VvOoEVLYGLimvtE9O36tcT4MpjpUKaxcA0
         cCOIDgIiE1PnWrMZJ1xoC7A3B0QddpaqSNO+UZLh9EJNP7WEZDwiqyn9HKRXG+RHbWKb
         NXZS6cMqGFqr50anFmCgvmI35wInQNNteUZ7QyZs+Ra2IpHUMrq6aQH3zXTraRaCZUFg
         sW8RWassXlxILDZDyZgzrVVHTaes+zIjQw2V9ix7zgzpN8jVxlDZR/1yEV5VGmMJfh0q
         Z1morHYWhBElyc7JFVxafEJedHSqHsGvr7eV8O+Gk0clWq4Yf8OpysVRw73y99uDSw0f
         hedA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768922893; x=1769527693; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1zCNGgef8h4dx5wfQYzWOmcIl2PEe8tEJazBc1BpM8=;
        b=Gpy0a+BwICjjJ6DQhBNZyzlVTYcmD3Gw6t1rvrDLqe3aCul/BCNXIHjHSmGQFJa0tE
         EpYmw5KwSZk7V2NDmekLD/tDiBg+jcJBly4qoisfb7lmHJAgEaNn1tZKG29VfofQ3vdc
         E4fMUbZ+fWt4D+m+F5v9cdxFHaLKAXChHF7teZcYVf1BLmWVk4BKE7lYXUEJGHIwuRKe
         SkglTkJ9AAbJBE+ruqy6uqUVksDGoLzli4sLMWpv2A3IqZWRL1DVxnlJhXBdyDcIm1/O
         3WiTBBPiVoL004JbU1Sa2/cZzx0M29iDaZ2rBi2Rl2ikTolF1iolk5zJej3OiNBGSiYX
         eXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768922893; x=1769527693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I1zCNGgef8h4dx5wfQYzWOmcIl2PEe8tEJazBc1BpM8=;
        b=fpA1xkTesAoGy4RcAzYN5LGBbi6pKWOdlKpX06Tmjkqwx02WHrPBG/L4MHpKBXh4gH
         wYF8djMWItU52dxlfikSw5JtZdYAyZejwVUr0acko1wZIS2UDYe3bZOSpBfKXqVv3l3D
         9Z7oxvUcM1fpZQEq5XuZR784hGbKIcLBwVg5TL2Nk6KpX6L9k+4+jkhLEcul3ZctFF1P
         jOQfbOb+J0GAASkgW+kGJYv5KsTgCy4b5BwlBr4tzj9QbhMMVgt6asak1hJqy7JQX5Eq
         qfCnBMi9jnRGqpOgw3eucVc4zzCMMAfQ666+ylywgpvUYrMtKsd8CyFYky745aaui1kv
         SwqA==
X-Forwarded-Encrypted: i=1; AJvYcCU3Qlgj2nHGScM/9XBRuDfyL4PTLWj2nOBl5ZwE9zxrnY7xBrYSPGW9RCDBrevRwtbc58u16OIfwJOTkX9NW3XE@lists.infradead.org
X-Gm-Message-State: AOJu0YyQriGpKowTmAfoo3pXMzrlPICLzfA35P3e3Iw2uVJmHFfOEuIr
	s6Pj2IvU12uYxMGj0/KtW+bZYi+mGiteWBxhpZnROrfQXKlDmV8poo3FYdZk8MDPEbRaeo7Jmq2
	LqdkoQ2x7DiYSULV+pFiEJ3ZgFekZn4lh+2EbZR51
X-Gm-Gg: AZuq6aI7WH9GtM2lpTXRIcLanQNNmdt3dc6JKg+jeMKKk/kI5ed9Ys4xVQYV2e9f695
	Fni2VUGlJjdJp7c3hjKSzliI3K1mqappXAw60TKWWwyzULCnJ+uc/BT3IZbuL3PBmUz3K+lAg9H
	ekANA8JRg1Lqflj97BgPfMVUj6K9GTY2bS8ohBRSwSBd16AeIBbSDhVuIAvUPtlveltWiIxOquj
	/DcZdOn7VGbEOn5PLA9VDBvWI2DLQ6MC4mi00ooSXAr9UEQvE4c7vXlvbi3HsAW+rhC8UOpaeWW
	TCdV0GxCAtDN2/O4Phk2F67M1j2ds+dgy6Vm
X-Received: by 2002:a17:907:948d:b0:b3a:8070:e269 with SMTP id
 a640c23a62f3a-b879389056fmr1590488066b.14.1768922892289; Tue, 20 Jan 2026
 07:28:12 -0800 (PST)
MIME-Version: 1.0
References: <20260112165914.4086692-1-ben.horgan@arm.com> <20260112165914.4086692-29-ben.horgan@arm.com>
 <e65d2b54-e14c-4b1d-a9ea-04b6e0eb051f@intel.com> <90561371-96f0-4bdb-8316-1b657f26da54@arm.com>
 <f2e9d7e2-1f99-45e4-9cf9-49e1ce2f08e9@intel.com> <0eb7fc76-179e-4e55-b13e-78cea775c2ba@arm.com>
In-Reply-To: <0eb7fc76-179e-4e55-b13e-78cea775c2ba@arm.com>
From: Peter Newman <peternewman@google.com>
Date: Tue, 20 Jan 2026 16:28:01 +0100
X-Gm-Features: AZwV_Qjn2fnxvYPOYMmk0_TL0MsbH8v-arEYq7xOCEX18DkcfIXaElQDJPpxd5Q
Message-ID: <CALPaoCjK=VoYriKCGUrtTs=xKxkU34nnwxHKjjy6QVbmD99yhw@mail.gmail.com>
Subject: Re: [PATCH v3 28/47] arm_mpam: resctrl: Add support for csu counters
To: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, amitsinght@marvell.com, 
	baisheng.gao@unisoc.com, baolin.wang@linux.alibaba.com, 
	carl@os.amperecomputing.com, dave.martin@arm.com, david@kernel.org, 
	dfustini@baylibre.com, fenghuay@nvidia.com, gshan@redhat.com, 
	james.morse@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com, 
	lcherian@marvell.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, punit.agrawal@oss.qualcomm.com, 
	quic_jiles@quicinc.com, rohit.mathew@arm.com, scott@os.amperecomputing.com, 
	sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, 
	catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net, maz@kernel.org, 
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_072815_606988_240ACEF3 
X-CRM114-Status: GOOD (  43.35  )
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

Hi Ben,

On Fri, Jan 16, 2026 at 11:29=E2=80=AFAM Ben Horgan <ben.horgan@arm.com> wr=
ote:
>
> Hi Reinette, Peter,
>
> On 1/15/26 18:54, Reinette Chatre wrote:
> > Hi Ben,
> >
> > On 1/15/26 7:43 AM, Ben Horgan wrote:
> >> On 1/13/26 23:14, Reinette Chatre wrote:
> >>> On 1/12/26 8:58 AM, Ben Horgan wrote:
> > ...
> >>>> +
> >>>> +          /*
> >>>> +           * Unfortunately, num_rmid doesn't mean anything for
> >>>> +           * mpam, and its exposed to user-space!
> >>>> +           *
> >>>
> >>> The idea of adding a per MON group "num_mon_groups" file has been flo=
ated a couple of
> >>> times now. I have not heard any objections against doing something li=
ke this.
> >>> https://lore.kernel.org/all/cbe665c2-fe83-e446-1696-7115c0f9fd76@arm.=
com/
> >>> https://lore.kernel.org/lkml/46767ca7-1f1b-48e8-8ce6-be4b00d129f9@int=
el.com/
> >>
> >> Hmm, I see now that 'num_rmid' is documented as an upper bound and so
> >> neither 1 or mpam_pmg_max + 1 agree with the documentation.
> >>
> >> "
> >> "num_rmids":
> >>              The number of RMIDs available. This is the
> >>              upper bound for how many "CTRL_MON" + "MON"
> >>              groups can be created.
> >> "
> >
> > Please note that this documentation has been refactored (without changi=
ng its
> > meaning). The above quoted text is specific to L3 monitoring and with t=
he
> > addition of telemetry monitoring the relevant text now reads:
> >       The upper bound for how many "CTRL_MON" + "MON" can be created
> >       is the smaller of the L3_MON and PERF_PKG_MON "num_rmids" values.
> >
> >>
> >> So, if I understand correctly you're proposing setting
> >> num_rmids =3D num_pmg * num_partids on arm platforms and that in the
> >> interim this can then be used to calculate the num_pmg by calculating
> >> num_closid/num_rmid but that a per CTRL_MON num_mon_groups should be
> >> added to make this consistent across architectures?
> >
> > Yes for num_rmids =3D num_pmg * num_partids.
>
> Ok, I don't really see another option.
>
> The motivation for this is that to me
> > this looks like the value that best matches the num_rmids documentation=
. I understand
> > the RMID vs PMG is difficult so my proposal is certainly not set in sto=
ne and I would like to
> > hear motivation for different interpretations. "calculating num_pmg" is=
 not obvious
> > though. I interpret "num_pmg" here as number of monitor groups per cont=
rol group and on
> > an Arm system this is indeed num_closid/num_rmids (if num_rmids =3D num=
_pmg * num_partids)
> > but on x86 it is just num_rmids. Having user space depend on such compu=
tation to determine how
> > many monitor groups per control group would thus require that user spac=
e knows whether the
> > underlying system is Arm or x86 and would go against goal of having res=
ctrl as a generic interface.
> >
> > The way forward may be to deprecate (somehow) num_rmids and transition =
to something
> > like "num_mon_groups" but it is currently vague how "num_mon_groups" ma=
y look like. That thread
> > (https://lore.kernel.org/lkml/46767ca7-1f1b-48e8-8ce6-be4b00d129f9@inte=
l.com/) fizzled
> > out after raising a few options how it may look.
> >
> > Another proposal was to add a "mon_id_includes_control_id" to use as an=
other "guide" to
> > determine how many monitoring groups can be created but at the time it =
seemed an intermediary
> > step for user to determine the number of monitor groups that resctrl ca=
n also provide.
> > https://lore.kernel.org/lkml/CALPaoChad6=3Dxqz+BQQd=3DdB915xhj1gusmcrS9=
ya+T2GyhTQc5Q@mail.gmail.com/
>
> Just thinking about it now but the "mon_id_includes_control_id" option
> seems the best to me as it is a single bit option that along with
> "num_rmids" let's you know which monitor groups you can create and if
> it's sensible to move monitor groups between CTRL MON groups.
>
> The "num_mon_groups" per CTRL MON group would also need to be
> interpreted together with "num_rmid" to know if it is a global or per
> CTRL MON upper bound. This option also uses multiple files to give the
> same bit of information.
>
> >
> > Making this consistent across architectures is the goal since resctrl a=
ims to be
> > a generic interface. Users should not need to do things like infer whic=
h system they
> > are running on by looking at output of resctrl files as mentioned.
> >
> > fwiw ...  there seems to be a usage by Google to compare num_rmids to n=
um_closids to determine
> > how to interact with resctrl:
> > https://lore.kernel.org/lkml/CALPaoCgSO7HzK9BjyM8yL50oPyq9kBj64Nkgyo1WE=
JrWy5uHUg@mail.gmail.com/
>
> Unfortunately, it looks like we're about to break this heuristic :( At
> least, until a way to get this information generically in resctrl is
> decided upon.

We actually ended up going with the "mon_id_includes_control_id" approach.

The property it represents is rather fundamental to what a monitoring
group actually is and is a low-level implementation detail that is
difficult to hide. Google generally needs support for as many
monitoring IDs as jobs it expects to be able to run on a machine, so
the number of monitoring groups will be routinely maxed out (and there
will be some jobs that are forever stuck in the default group because
no RMIDs were free at the time it started[1])

Thanks,
-Peter

[1] https://lore.kernel.org/lkml/CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUv=
e8ptsfFTw@mail.gmail.com/

