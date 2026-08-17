Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5D3C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 12:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqDyjDYalqm5cWQyIOyyfajB2bGZoHO7irbOfhFRwq8=; b=lHJ7E+kuVKwCc3vuozaH5lPabp
	QdE4d9qYM/2bP8K05L9XLsOgOXwfziXLndvMY+69lBhZ9Wl/ENcZxl5Bbnlnl8uZZ5AnehFfKTgBT
	NeXo/3PMRNN7vgTUsgdasmSVBKHf1YcDYelYzA1fZq1XYvw9Oow2eTq6j+ZnSlq89ji+75ZmN5qhQ
	DEAkDsRRuf5DZ9puEzxIWmkstRoXm4qFoTWPr5PoJsbo+VBYcIQrV8t2SBPT6rGrxO7O/KS1nHC0Y
	/NL9BTSlHo5YcTjx6sivr7xQaXThu9IHoGDYYJ9+IDWmDNa5UXcthTf2yUxYidmRXZ5wN+GSYrFPn
	IC0Bfi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwoH-000000069fQ-3wqr;
	Mon, 17 Aug 2026 12:51:25 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwoF-000000069e9-3AXu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 12:51:25 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-51c01c79467so753221cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 05:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786971082; cv=none;
        d=google.com; s=arc-20260327;
        b=BElMatusWgU8v75BORGRJJrsA09DCIqTlqeF073HD6CCTSMJ35u9j4urh5XN4oAPbD
         gm6CxGM5TwhhDkEM9fsY1jhBVo4kep3CHnkfHCYVNfO9zuHWMa3nE7DwXJvekt/cZFHu
         z/KKWu7WBsjDF5cC3K4d/VicpU/jsMMW+zAunt4t/VlaNMx50k1VttU02kfZLaRpW6Bh
         rJvGPPDkNyUc+vyRDa4IqG2XEkR1E+/K1LEWzReQiBUI+gE30oFgCYuNSw0dvrONj73b
         bd0mvvo8Igo4e5nW1oeUK6MRInrShyX2gJ8qx9RKuk7RIl6+CE10G0VqRlYCGfEuHKVj
         33iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KqDyjDYalqm5cWQyIOyyfajB2bGZoHO7irbOfhFRwq8=;
        fh=GCI3ZOyq6BSboHHwY0Om/5HaNuDsAsgv1sOor+tplr8=;
        b=JPm/or9vslz2GhpBulex8nIjgnfvh/qgFnyen4HH29rvWU/cjE+wDP132THnTJsDdX
         ql8rB76AlNnbPb8K13EcbLOPwZ0KVBqJKrREDe5aESoy0vcg8DxiHf8jlqCJkYoHQqid
         It7I+Ovu8Nb7edCAha8VlvBAk58VrDpDIIHgiApdwlMf5+SgEQRVAhv1lvKpNBxnlMwu
         Cc1MtC1vmAdJ4IT3414fC4a9JhVXmgGNSRs8hLFx7F0XYoDRXg1V0cDWHMuHi3Myl2bz
         gqtUP1rLmsD0nQjB7KVO81Xc1KyWKLkcx66j70lmlqA3WUglzlEvkj57C3F+oZvfWGSi
         XiBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786971082; x=1787575882; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KqDyjDYalqm5cWQyIOyyfajB2bGZoHO7irbOfhFRwq8=;
        b=d57xrktUnwkMS4dBAwrTv/wy9U0i1aphYdKFBGpCC6c5DiSyeFn+r7/60PUSQapPzA
         c79RKSM9N3PBZ4AFavY+dqEAa1KZQ5g2daSO97QDZbKzkZMB7cKn69RHg20hBJPMIFOz
         E0k+NzOS8tOcnr3k5yX667Ga3o9FJbHm7UsyajoYHAvZRV7eNmMxRPVNzuvXEjWs2Pob
         sOnC/RK1w90GktWw3aQD6E1XulFodjrvXfMEVfmAbBIQp71AUS3yfwF7p5PEezZq1ueY
         aK8+cKsadFEghLvahhgrL5IqXGKU/Orc8x3Qr2BOVOI27Xe8pebnrIJuYWFDEooCmq82
         Qntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786971082; x=1787575882;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KqDyjDYalqm5cWQyIOyyfajB2bGZoHO7irbOfhFRwq8=;
        b=Td4vui9PusxvGpQR4jxHbdVNRBeaFzqpVT9/SGE3TgbyRJ9WXSQFptfVCZVURVeJ+m
         JK6YARw0cno6s9xk+ZvOIA4kviqFhWne3O26Jge176ZtxO7JOB0w85ObAR7AdlsKOfe2
         +f3Kd32ompGGhSUda8pmij27/tfDUkDVLCahezvfIARi98ymW61yUziB0Q5ihBdckpWV
         vJVei8+xSSY1Og1NIpd7AV+4Yoo3rKGYfUVEu4dfKdtSghAeitfNBgQWd3mOfHcJgDQ4
         c6cHa71DdGtwOo+qGuDa734LNIR3SU7mNsYmalXxOLpC+HBnPP5ZhPPXCfJsK6DE4crg
         jYzw==
X-Forwarded-Encrypted: i=1; AHgh+Rrc8cNaGrX02/Z5cfbzBZ/gUFEtIY90nL8mS9x5Gq/kQAlHLmXunjJ22QkBejkC7ulbNU+3DCyjYzIm9XH5YhD4@lists.infradead.org
X-Gm-Message-State: AOJu0YygSRtjGY65QspO1RQPlQZZXKACmP999ot6oHzFqQTILeEp9nBv
	pLCxtDPGCrod77bvvOpgeLrMyLk4aFTRwEJDoAk2hBk5CfxWg8wPgE2Q/ZQE+o/+iDI4z2IReF5
	xM4kTHn1StNsskmG9bJ6TRTMlsJsyHa6lUftubYHvnY3GX49ldxi2JdSTaRY=
X-Gm-Gg: AR+sD13fd7Rc1rhEq93TwOzAfRi77XcQfWbsMuFrATq0yImhOWJnmn1qumWLOzZL6yG
	vOu2FpY58Pcs7k5RBBny4i7RwCQokkAWtSKNnzSoluqESP+fR2Xga/QOqmvkYBzXju8ptshfYvy
	Jt26vYmcg6GofNUFTfDpTKoIbJ8x1H0n8ZSNdPS7TWLJ5hKxT4ZH+d7EbZKWFJoZQNmBjYuxqwC
	AEtexcT8KfkRgqmPu8d4AHGdfotnLkW6lcVrqLIKG5aI7v4twhoMUpHj07c9/lc0T0LpIyUzYUs
	K+MP24xs+VcLY5/Lg+Jj751S95dNko1s6Sfc++LTydzQQ+D0sSQJ+kjU
X-Received: by 2002:a05:622a:4d09:b0:51c:ad5:93be with SMTP id
 d75a77b69052e-52db08e1769mr14092161cf.8.1786971081628; Mon, 17 Aug 2026
 05:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260815082048.4043217-1-irogers@google.com> <20260815172712.50119-1-irogers@google.com>
 <4998d0ca-eeb0-4b04-b3ac-a1f97c1829f2@kernel.org> <CAP-5=fVffrRgO4OM6u=JTEUwBY0np+fUExqOpbiYU1JgyMr7Rw@mail.gmail.com>
 <7cc71fbf-425e-4047-94c5-3f06d3ed8905@kernel.org> <CAP-5=fW7yQmH+4+x5QCqr2vO_MNSYuPW4T8X8qTns=GitOUN8w@mail.gmail.com>
 <caa08751-a578-45d2-bb2e-349ae201d4e2@kernel.org>
In-Reply-To: <caa08751-a578-45d2-bb2e-349ae201d4e2@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 17 Aug 2026 05:51:10 -0700
X-Gm-Features: AcwNN1Vb7EJe5R2kD5uuB4FYZwV9wD0fQxaTG7o-LUTRhBuld8FH1qKVVX_wPuQ
Message-ID: <CAP-5=fUfQJdQ-GeEB3m6XnTy=LadzG3dh9KU=dQy4Krgw1ckSg@mail.gmail.com>
Subject: Re: [PATCH v13 0/3] perf: Add Raspberry Pi AXI PMU driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: florian.fainelli@broadcom.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, pbrobinson@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_055123_868140_7BB431C0 
X-CRM114-Status: GOOD (  29.54  )
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

On Mon, Aug 17, 2026 at 12:54=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 17/08/2026 09:46, Ian Rogers wrote:
> > On Mon, Aug 17, 2026 at 12:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On 17/08/2026 08:57, Ian Rogers wrote:
> >>> On Sun, Aug 16, 2026 at 11:20=E2=80=AFPM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> >>>>
> >>>> On 15/08/2026 19:27, Ian Rogers wrote:
> >>>>> Motivation & Background
> >>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>> Currently, Linux lacks a standard perf-API compatible driver for th=
e
> >>>>> Broadcom AXI performance counter blocks on Raspberry Pi platforms. =
Prior
> >>>>> out-of-tree vendor solutions relied on custom debugfs nodes and ad-=
hoc
> >>>>> kthreads, preventing integration with standard Linux perf tooling (=
`perf stat`,
> >>>>> `perf list`, etc.).
> >>>>>
> >>>>
> >>>> Slow down!
> >>>>
> >>>> One version per 24h in normal cycle, not 13 patchsets in two days! (=
and
> >>>> even rarer during the merge window)
> >>>
> >>> I'm familiar with perf-tools which was set up to follow BPF's example=
,
> >>> both have -next repos. The -next repos merge into linux-next for
> >>> testing. I agree that cherry-picking shouldn't be done straight into =
a
> >>> pull request to Linus. Is there a principle against using -next and
> >>> linux-next?
> >>
> >> How is this relevant? I don't think you read my comment.
> >
> > I think I addressed all the points in your email. The -next
> > development is relevant because it directly addresses your point about
> > not sending emails during a merge window. Except when the -next branch
> > is becoming the main branch, merging patches at will is acceptable and
> > you also benefit from the linux-next testing. Not sending patches 5
> > times a year during the two-week merge window, it is nice to think
> > that this timetable fits everybody.
>
> No, next is not relevant, because I am not even speaking about applying
> patches. I explained you the rule of one posting per 24h. Not 5!

So, when a patch series receives feedback from Sashiko indicating
issues, it's natural for the author to address those issues and assume
a human won't review further given the existing problems with the
series. For example, this series with 9 versions posted in 2 day:
https://lore.kernel.org/linux-perf-users/?q=3D%22perf+build%3A+Add+target+t=
o+install+devel+packages+needed+to+build+perf%22
The author then requested human review once Sashiko was happy:
https://lore.kernel.org/linux-perf-users/anyrSMrYWJz-TpBE@x1/
Sashiko has an option to embargo/delay its review for a specified
number of hours and you can see the small number of mailing lists
using it:
https://github.com/sashiko-dev/sashiko/blob/main/sashiko.dev/email_policy.t=
oml#L79
I sent the versions to the mailing lists suggested by
get-maintainers.pl plus RPi, the Sashiko reviews were only coming from
linux-perf-users as the others haven't set Sashiko up (their choice
but seems not desirable imo). As already shown, it is normal on
linux-perf-users to send >1 version per day, and I think this is
preferable than having mailing list people waiting for the next patch
version that fixes the already spotted issues. Waiting >24h per
version wasn't something I could do with this series, I didn't have 2
weeks to spread the emails over, so appologies for the inconvenience
receiving an email has caused you.

If you have constructive comments, particularly on the device tree,
I'm keen to incorporate them. At the moment I don't see anything
actionable and the feedback has been similar in quality to feedback
I've already chosen to stop paying attention to.

Thanks,
Ian

> Best regards,
> Krzysztof

