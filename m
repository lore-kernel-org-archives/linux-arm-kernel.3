Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887E7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 04:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFuNRut7vlpifKdq/gCKY+rZGjMz9I4gBz4L78ICh/E=; b=B7MIJGQ3D+7d8uczMansg2L1Wk
	sNNz8uCPuB4OhpP1WHf5hohA9RhqpMxkhSKoRSeB0qArkhhtXaJ/X4tCauVtPN9J07Bs8BEXMFpeK
	k71FmU0lGZwRqsLurjtlt60/Ud1LweOPW9cyQm6i8MUmkfnv90UgxMS2u63uVISuIiGe0GodJabtE
	pJo5/P4+m6RU3sD6Oh+M2qkVlzRVo0O5LHGJHpPOEDhHsWu2EHvkIRFe/dKDQiFWJm+wb9VEEbTGY
	mSfKkT2ma4iBWgUyZX49RDjtULyvFFoTe7sR3m8pqlWEVFt4zk+L38uhMk2kzNnDNS41Ye3orpqTt
	xAxlzUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8lh-000000087t5-3ofF;
	Mon, 13 Jul 2026 04:59:49 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8lf-000000087sj-2dHH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 04:59:48 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c15cd3fd760so314715466b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 21:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783918786; cv=none;
        d=google.com; s=arc-20260327;
        b=kN1EpyH4aPV1wBRd5Z+9S6wR/zIh4QPnPWuEk92Ba3zEQT0W+qocAQ6jCF9Tsy77w2
         2qGRpeyBLiu1VX07aOK2EsuRz5p4BoeZywZB20SRD1CiZccLwNqym4dprimlCraqyV6D
         NMXyZT8roxiwrAYIcKT4r/OdVDH8GYmkUXK58VVju2t52fa5PotarFMni50povYnbggB
         APV00YoquS5FjUhqu5nsjSOtcOKdCiqN1/cGelLIdOwCYnB8aSiwf1TWf//C72KOpQHE
         BWnv8QR0v1SrDiNTM+U6bzpY2uA1B1/s+D3sy9HSn3/ocLqTn9ssmH5Yg6CmvAzSD+VO
         waew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XFuNRut7vlpifKdq/gCKY+rZGjMz9I4gBz4L78ICh/E=;
        fh=kmkSQwNKm8FtCnJWWIEA8ZDRV3NqqMsVdP8ixqVz7u4=;
        b=eu3AV7y28vWHUUfRX0nqQM4cV23fMZj2SpKJUsS23yZ6U3JAEikngGCgMYCXpfmO9v
         OhDfNzW2nRL1OydAawr5h3LyiQjU8AEMosDQSktHAiLPmGqGMHM9Hi2F1QuBlYhG5cbd
         udR5uD/Vn6idULQqTYrWiLClFQb2zcteIV3AUrrJRUXq41EeD6ldqA5B7wlQ1kSp32R9
         mnxIFMFKUMs3PhB9fEnCnuhqTRYrPJvpQEuv3pI79bCzQNdc+VcIlLPw0VBJUwA1j9Qg
         2VVN1+tAa6SuLm4RmHxpyPMWAFqshmGazye9WjTtE21/ZhzHuM6IEUoQd/LOd4Qw3wJk
         FUKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783918786; x=1784523586; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XFuNRut7vlpifKdq/gCKY+rZGjMz9I4gBz4L78ICh/E=;
        b=Re70OENYstxX+oBX7sYKoGNfhwhTaC7fNi+OMYp1eskdffn0XTb7VU2zNR6XmcNAWC
         eO+OtttWj+GLh8d5jVIEeSePybJjnqk1Si8fRAVoxqXio4woa6tfibmLtDXgQ5gQmguH
         6RWydl37oQMVVDpnyIRe1ery1uDkffV6GTBR94DiXu+Y3nPfb4wDFh1dDCptCqG/kjk5
         5fnaAqZAGIZ/CIzWPBJqi8aWDQE4ArHm39n8W61MfVa1SK/HnEoZM3C5tFPA6esjwua4
         GrhGWGRa104cSLxDgjolhCKKPInuSTMlPZWfansF8M1g9x3nxv4+xy/szWT5IyNoxA3l
         Gu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783918786; x=1784523586;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFuNRut7vlpifKdq/gCKY+rZGjMz9I4gBz4L78ICh/E=;
        b=roCmM9DWDj6AzNWTJivHV8a4YaCq//NAvnCvsxveLteCTIl3bRNGCoMbpa+vQYGHTe
         FC+hTQFHgi5hdvBVRfu7F4LMZQPSPV1PjzHCb2sQoHZXaISEE6XzYCqS5bvf9F8siY3i
         gT9z3g8wn9bOvCm0c8HsbwmGKMI1UOK+MPXNAl6GrWpMENQBPmaxN8rWJKivq65BSaFp
         0FEs11y33kIf93ggWTuthibFPkUohulM8G7UyFQS2qnWg7zqqohwoumMRp29BgS6HlCc
         7kC5hTEDizx792KtJz1YwcpWQ3M2r9AqPkAOJnKOWzStk0ekOdTDHvEghwTt7s91ps10
         8AhA==
X-Forwarded-Encrypted: i=1; AHgh+RrnF9NeVkdpfMrglOjdS9GU9XDQ7ZTNRgyeOE5MQiJd4dUukWJA8wRGmjtYitaNb0LUjcQdTiqVHbyOoMuEGGU2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp0eZ/vusswKv/cWcM7KxFgRwOyncNm0uttpiRAQV/a5k6bdTg
	/WXgq2U+macfHrjLsEjz/S1BTJHtsAmvc3JLEGUOPuBfvhthe8OohLcK+8FiHctVP0FAXL0RV80
	tu8h91nVmJ1lCw1GLE20Rrc4z9urF4CLrUINxVDJx
X-Gm-Gg: AfdE7cmEOJVxHarbz8fLsuWljzv6h2EbDfo+8WgVzB1ILXrMhIE6f4jcMjAQgAQUPTH
	/BUifhL31Obgkad1ju5StOTG3kPtPpwzBNNfhcBXqvL+7bOZrB+eLXND4WZP7DY95BoN8cdyNSI
	a5ucLAnO/RdeAXf7w5ObrNLI9wKm+i4FZccE4uzVEeWLQuhSrFzMr99BKHRutxZvo1PhMjShPoc
	ufrfEjQstTNy1ZF/dKZvyrJgjcImbZp6QPVFbS41St+07/kYa9j8KjEvtgKRSvWfXK/2pYntOOC
	dce6sXC8Z5wCzZ0RIhzcpjMlB7cejfHhZ9/8Dg==
X-Received: by 2002:a17:907:7212:b0:c12:6c2e:ad2 with SMTP id
 a640c23a62f3a-c161f58f14bmr326089266b.57.1783918785309; Sun, 12 Jul 2026
 21:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com> <3B2B37B5-16DE-4DB0-8A78-4CB8636C1A86@linux.dev>
In-Reply-To: <3B2B37B5-16DE-4DB0-8A78-4CB8636C1A86@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Sun, 12 Jul 2026 21:59:07 -0700
X-Gm-Features: AVVi8CcLGq0YSly3OF5m8P18-3XA_YkiDDB6TSCPkAkKN6byJ-cGb8WLxIValzM
Message-ID: <CADrL8HXNoRA_cnR7KVPwN6zA32E744OKOfTmDMReoykzR39H8Q@mail.gmail.com>
Subject: Re: [PATCH 00/18] Another attempt at HVO support on arm64
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_215947_714144_B7CF59E1 
X-CRM114-Status: GOOD (  30.33  )
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

On Thu, Jul 9, 2026 at 9:59=E2=80=AFPM Muchun Song <muchun.song@linux.dev> =
wrote:
> > On Jul 8, 2026, at 11:11, James Houghton <jthoughton@google.com> wrote:
> >
> > Hi everyone,
> >
> > This patch series uses a trick with the Access Flag on CPUs that suppor=
t
> > hardware update of the AF to update vmemmap page table entries without
> > introducing a time window where CPUs accessing the vmemmap might fault.
>
> Hi James,
>
> I was just looking into the Arm ARM specification regarding the TLB cachi=
ng
> behavior to better understand the "AF trick" used here, and came across a=
 few
> sections that got me a bit confused.
>
> Specifically, Section D8.5.1 [1] states Rule RDWZCQ:
>
>         "Descriptors with AF set to zero can never be cached in a TLB. Fo=
r more
>          information about when translation table entries are permitted t=
o be
>          cached in a TLB, see Translation Lookaside Buffers."
>
> This indeed seems to support the core assumption of the AF trick. However=
, when
> following the reference to Section D8.16 "Translation Lookaside Buffers" =
[2], it
> defines the following rule for permitted caching (RSQBCS):
>
>         "When address translation is enabled, a translation table entry f=
or an
>          in-context translation regime that does not cause a Translation =
fault,
>          an Address size fault, or an Access flag fault is permitted to b=
e cached
>          in a TLB or intermediate TLB caching structure as the result of =
an
>          explicit or speculative access."
>
> This is exactly where my confusion lies, as these two descriptions in the=
 spec
> feel directly contradictory when FEAT_HAF(hardware management of the Acce=
ss flag)
> is enabled.

I don't think it intends to say that "translation table entries with
AF=3D0 may be cached" just because they don't cause Access flag faults.

It is likely that this clause was written before FEAT_HAFDBS/FEAT_HAF
existed. Re-reading it with that in mind makes the meaning clearer:
PTEs with AF=3D1 may be cached if the architecture otherwise allows it.

There is another clause, in D8.5 "Hardware updates of the translation
tables", I_RGQLZ: "If hardware does not update the AF from 0 to 1,
then the descriptor is not permitted to be cached in a TLB." I think
this supports my interpretation.

I am convinced that it is impossible for an implementation not to
conform to Rule R_DWZCQ (PTEs with AF=3D0 cannot be cached) while
supporting HW AF correctly. Let me try to explain why.

For HW AF to function correctly:
 1. Setting AF=3D1 must be done atomically, otherwise hardware could set
a bit in an invalid PTE. (This would break Linux swp_entrys.)
 2. The AF=3D0 translation cannot be used, otherwise we could
potentially drop AF updates.

If an implementation used the translation before coherently setting
AF=3D1 to perform an architectural memory access, then it must choose
either to set AF=3D1 on a PTE that may have since changed (perhaps to an
invalid PTE) or drop the AF update entirely. Either way HW AF is
broken.

Please also see I_GXGPN: "When the translation of an architecturally
executed memory access occurs, the architecture requires that AF is
set to 1."

> On one hand, Section D8.5.1 [1] explicitly uses the word "never" for AF=
=3D0
> descriptors. On the other hand, under FEAT_HAF, an entry with AF=3D0 does=
 not cause
> an Access flag fault anymore, because the hardware is capable of updating=
 the AF
> automatically. This technically makes it eligible for speculative caching=
 under
> Rule RSQBCS in Section D8.16 [2].
>
> My question is: which part of the spec reflects the actual architectural =
intent
> when FEAT_HAF is enabled? Is an entry with AF=3D0 permitted to be specula=
tively
> cached in the TLB by the hardware under FEAT_HAF, or does the "never" in =
RDWZCQ
> still hold absolute priority?
>
> Please let me know if I have misread the specification or missed some ove=
rriding
> constraints here.

Thanks for making me look a little harder into this; it's a good
question. I hope my reply above makes you more comfortable with the AF
trick. I also hope to hear more from the Arm folks as well.

Thanks Muchun!

