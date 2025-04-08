Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63F4C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+jjPBdVXPK7qpzd9qCSG+7czxPL8ohrXnLYNLrJ3o0=; b=wsGBuC4LEkyRNMqxcETyy0kYfc
	cB7nHY3eYnBc6Z6ZxE0OGmMnjfwlM7VOHOUjxPdeEZIvpgVl4vQiMza/N+RprknQ4LTKFEA6JK0R4
	VJR3B7oWSxl4ATlijAKLVqyY4IyCd1g52aX8zUApJ3jz5A7kU2oubbPCt6LRqgk3jpBu64/0xSaNv
	dHlg8hKPWKJIjtW4c2ujeU4U9RIMDSnbFm9dooJ/9VTlIJO0tEXOvrnv6A47QSj3nGuSw8nSNRFMt
	7EvFfm9lKN9zuLn3E66bfEGPodUwJrBB5r/A21epAdFrwUYd+Khc83aIl7oqa86UvVkw2qb4/20QA
	5dcrHE/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27aM-00000003uqZ-0Vcu;
	Tue, 08 Apr 2025 11:57:46 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u255r-00000003Pdv-13pV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 09:18:13 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso7660315a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744103885; x=1744708685; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+jjPBdVXPK7qpzd9qCSG+7czxPL8ohrXnLYNLrJ3o0=;
        b=UqF394H6tNnVntiSylaUv8/TpakjvilYT+5e8uq4OvJG2HTMd6I2riWuRcCB4fsqC7
         RQzY4692Fsl1uiM+4YPiYxXBT9/c6PdNkLogpILOSkClSCAbEK8lO22Gt5S+uvSG1WWo
         4RN2oF+CEpi1bhzRk1XOJNQ7dUEj6a2vQ+jWw0ZUso/JbcdVib+okRRDNBxOTlVcPRlG
         CFbixjx6u188igHuNwyueG6HfkWPqSReuFM9S/fHx+ER65Lerte1cBU1XEXyE7YCdiP6
         xWizqUVc7jcpCwTXi1AvECGC15Jdni/P5ZJmIXpBhkaUFeCDnyu+hpVrUHK7d1m3kcYl
         yScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103885; x=1744708685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+jjPBdVXPK7qpzd9qCSG+7czxPL8ohrXnLYNLrJ3o0=;
        b=mtqx2BNltD7/zIGMclAFh7JW/LzS0/V7wdvxoijnPFXmz+kmMyS57fM7IDMX3tVPWE
         aVzog/W2Gbhd+1sCXO9THX89zsDyh7OuwQNgn/Cx9eR5tS/5Ft6PiFlKVjKsDbauAW8r
         Vvw1VDnu99En9dfAPMS39z/sFj0C75RV11+fsW9sUyATUwaIAzlsQvElHtAPXqiZhdDV
         57oCSDGSs8FWET/PBJRSpOfqSXJ4pM3bFxlRpX9R7XtcEZk4S34bBIZpEs4ile5c+E6t
         ylb1dvZrfsx5yxKPJfINCB4K7uljMGwQ2meTiYPkXAMlQqfNyo9KZttNQY53pEflBg5T
         ReKA==
X-Forwarded-Encrypted: i=1; AJvYcCVD6fCB9d//KjZtd19R98YGxa3rCpZX9sibKjpqQB6alMWK+s6y5LE53nq29wGJRuoYpj8+FsB11ZV28z2fY6Oa@lists.infradead.org
X-Gm-Message-State: AOJu0YxVR7abkq26s8eEt5SX6jJkwijhUSs6RPxpGpC444IBtIj6YEaG
	9cavdEiXbyh+2QAFUZJ//2cEQgk9rGznynpqDGXG9WSVOGpsIRHG3C4BfrzqatsLK8+MBS09E/8
	kIwbSU9e59dLYYf0FSn1lUUY4bvg=
X-Gm-Gg: ASbGncvCvdeS44YLCW70gEk+Q7OXyVywMY7ObpiTtJvu68MBNdOYgCslTHdohGldtqQ
	4xxQaH+O/ZP4dV+5Zt+I0UH9H9QtniBdUDemnBQyL5FFtMUFqkjLGyaEMdnTK8F7BdC+HF5junO
	tTenLr2wweHySQRmNf4aYtN8ulCQ==
X-Google-Smtp-Source: AGHT+IGrlLWV41GaegSAaM8iXEmdd5mkWasA+28fz3ufZ5Wi9wLfXdTkvWBnY64Gcct6jx2leLCkzFVsACi79f1rHeI=
X-Received: by 2002:a05:6402:26d4:b0:5f0:7290:394b with SMTP id
 4fb4d7f45d1cf-5f0db889fb1mr11656706a12.27.1744103885242; Tue, 08 Apr 2025
 02:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250407092243.2207837-1-xavier_qy@163.com> <20250407112922.17766-1-ioworker0@gmail.com>
 <5e3f976f.bca1.19610528896.Coremail.xavier_qy@163.com> <CAK1f24=hwXCg6K8a=qoWi2DGEWFGBcenSGRoKXtJEo=iR4DtDw@mail.gmail.com>
 <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
In-Reply-To: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Tue, 8 Apr 2025 17:17:27 +0800
X-Gm-Features: ATxdqUG7uvOu-cRYXmAw458BlDMbN0mphcEb4IU_35tVjzzvBU2iT353Pl_0Awo
Message-ID: <CAK1f24nR9kYE7OA3onPYi0_jYeAPeX-yqLCFh8GJOkUuZOt45g@mail.gmail.com>
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant operations
To: Dev Jain <dev.jain@arm.com>
Cc: Xavier <xavier_qy@163.com>, akpm@linux-foundation.org, baohua@kernel.org, 
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ryan.roberts@arm.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_021807_293377_D889575B 
X-CRM114-Status: GOOD (  26.73  )
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

On Tue, Apr 8, 2025 at 12:19=E2=80=AFAM Dev Jain <dev.jain@arm.com> wrote:
>
>
> Hi Xavier,
>
> On 07/04/25 7:01 pm, Lance Yang wrote:
> > On Mon, Apr 7, 2025 at 8:56=E2=80=AFPM Xavier <xavier_qy@163.com> wrote=
:
> >>
> >>
> >>
> >> Hi Lance,
> >>
> >> Thanks for your feedback, my response is as follows.
> >>
> >> --
> >> Thanks,
> >> Xavier
> >>
> >>
> >>
> >>
> >>
> >> At 2025-04-07 19:29:22, "Lance Yang" <ioworker0@gmail.com> wrote:
> >>> Thanks for the patch. Would the following change be better?
> >>>
> >>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> >>> index 55107d27d3f8..64eb3b2fbf06 100644
> >>> --- a/arch/arm64/mm/contpte.c
> >>> +++ b/arch/arm64/mm/contpte.c
> >>> @@ -174,6 +174,9 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pt=
e)
> >>>
> >>>                if (pte_young(pte))
> >>>                        orig_pte =3D pte_mkyoung(orig_pte);
> >>> +
> >>> +              if (pte_young(orig_pte) && pte_dirty(orig_pte))
> >>> +                      break;
> >>>        }
>
> Quite the coincidence, I was thinking of doing exactly this some days
> back and testing it out : ) Can you do a microanalysis whether this gets
> us a benefit or not? This looks like an optimization on paper but may
> not be one after all because CONT_PTES is only 16 and a simple loop
> without extra if-conditions may just be faster.

Yeah, I was thinking the same ;)

This change seems reasonable in theory. But with CONT_PTES=3D16, keeping
it simple might actually be faster, IMO.

Thanks,
Lance

>
> >>>
> >>>        return orig_pte;
> >>> --
> >>>
> >>> We can check the orig_pte flags directly instead of using extra boole=
an
> >>> variables, which gives us an early-exit when both dirty and young fla=
gs
> >>> are set.
> >> Your way of writing the code is indeed more concise. However, I think
> >>   using boolean variables might be more efficient. Although it introdu=
ces
> >>   additional variables, comparing boolean values is likely to be more
> >>   efficient than checking bit settings.
> >>
> >>>
> >>> Also, is this optimization really needed for the common case?
> >> This function is on a high-frequency execution path. During debugging,
> >>   I found that in most cases, the first few pages are already marked a=
s
> >>   both dirty and young. But currently, the program still has to comple=
te
> >>   the entire loop of 16 ptep iterations, which seriously reduces the e=
fficiency.
> >
> > Hmm... agreed that this patch helps when early PTEs are dirty/young, bu=
t
> > for late-ones-only cases, it only introduces overhead with no benefit, =
IIUC.
> >
> > So, let's wait for folks to take a look ;)
> >
> > Thanks,
> > Lance
> >
> >>>
> >>> Thanks,
> >>> Lance
> >
>

