Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADBAD41C36
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIJgw/8vF2HaiakXVV/uyJUOCxs1zd6fI8bBZPHAmGM=; b=vXsAroEuJIRtIruefjSsjowV6O
	zlGjMVzH04uMCPxK8eo6ba/r6b34Gku2Kd6Jnm/0/UWvBbu+nTlwkG2Bh+WJEVSBsvoRad7LRsiMQ
	3RqH+ym+wJq0qUt4aXMjBn/kmlBFI3X9Uyv/EOBm2Pw03HMNg684jsWchYqlRAjUzGKhlKznvDbqG
	rlfDuXqn8EIIk4Hs28xs5bFS0mmEB1OGEr6W++dQxOglQNFI4N+0uj0a1F/6RW7lTVnk6duyyTnKM
	cmdj1MqGMSfx61h81v2QVSOxpjLec1iqa54q65AiurJno3LVNkFyVfdfHQc/N+Xa8uppyA56rMVeN
	tZG0pHqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgjp-0000000GdlQ-2Qc9;
	Thu, 11 Dec 2025 13:29:45 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgjn-0000000Gdl0-2AlP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:29:44 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so17967366b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 05:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765459781; x=1766064581; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIJgw/8vF2HaiakXVV/uyJUOCxs1zd6fI8bBZPHAmGM=;
        b=JLffjKoLwDMVzE0PpYJkkLysh7gH2PD7RfsFe3ZnRZfeNHpX35XQM4nn8HK5ATNVyl
         jzsfd9GBbXIZ1kRK14gukP4UJ3dU2Dmb7Yl+7xCwNBA+rhuIbMmOze64S/vg0llngxN7
         quOXVBQUQVOnKHqwnuN+mQox5IVT/wXEhbxlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459781; x=1766064581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gIJgw/8vF2HaiakXVV/uyJUOCxs1zd6fI8bBZPHAmGM=;
        b=CjX3kY+yy3AE5Wik/nChra7lWgwJ18F/BzjMk8rSp6yBLWO8V/to/XGij1HPwA0GGT
         ADTxnbhZQHXPsikS8ZhLVBuP8SjF2E4/32p66YNMQF4gPikyN86qiP63BuZKMARD2SBN
         heBp9WnJBwAhWOmsmD6qmD6ORqaBS1OBh+oizdnCqhfFgk8g8vIRf5aQq7yobz+TdB+e
         nHunl1Ot3ue84oGDTYt1ECFoj+7j/sbSegcZiP4mV4NZhDqyw7sLzPY8aN3EWVel6lzj
         XrtRuxdSFSXPMdeOFMIbfFg29EYtG4l8kC/jZZRrv5X22tD67nwGpXj0afIcGBAyKUM0
         gpjA==
X-Gm-Message-State: AOJu0YzNFcB8FhwOlsuMNd0dtC/UGKzRYE8DbQ/BkEUZ9m8RDy65NCRR
	dGHbLLHanHpozlu4gTRsYFOHXSv0motQCR1OaxYu2DlnYna/QgYN+IIIsv6cB/Y0uiO3ZGqoOpS
	v52NeJIiEpXB44PpFaZ6PUiyo0sETlzrO8cP9UmEA
X-Gm-Gg: AY/fxX5awVjYQN6Oz+SADOSYd/YpFFtMrzZSPLLFKUogCIVxSjWuWz23FM95BTbMOFn
	osnb2+4/DaTbekXns/zsrMZBl8LmCIJKJz+X2R6dGiXn05l9WOLPqQbxdCkcbtMtAMjMcWc6lqP
	c29dm/h6haBjLGiDVJmTBAJ24/q6sqHSEjeF9FuTIK9I10WvpEQzo+0GPlPOB+9F0pdECFQK7/D
	TDgyqMZ0JSItJbFjYmqbt5eJSa0MRafBPaODiUPOITT9JWzOntnK2mTYSh3qBgs8kFo8Q==
X-Google-Smtp-Source: AGHT+IEYcw6OiATv5FbWQJs4K6iBeG999HnzFpyvR0QZQcvBt2OWiiXGTspPRf55g1j+eSSYJczHOrxF1ALqr8s1iCM=
X-Received: by 2002:a17:907:7f29:b0:b73:8639:cd8e with SMTP id
 a640c23a62f3a-b7ce8232014mr630110266b.4.1765459781462; Thu, 11 Dec 2025
 05:29:41 -0800 (PST)
MIME-Version: 1.0
References: <20251119181333.991099-1-sjg@chromium.org> <20251119181333.991099-8-sjg@chromium.org>
 <CAGXv+5HiV7EE9CNPRT5EbL8AM8n68Ac1r-=esQL5dgaPDKPTWQ@mail.gmail.com>
In-Reply-To: <CAGXv+5HiV7EE9CNPRT5EbL8AM8n68Ac1r-=esQL5dgaPDKPTWQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 11 Dec 2025 06:29:28 -0700
X-Gm-Features: AQt7F2pJsKr81oAthJu4CoZYzFwwTEy6KYID3K-eoU88WFHYqfH0S3tC0a2u9Tw
Message-ID: <CAFLszThEu4j+Fcxm4VYYVTtqf-9Yp_OnEKes0sD+TACkoHuhbQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] scripts/make_fit: Support a few more parallel compressors
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, David Sterba <dsterba@suse.com>, Nick Terrell <terrelln@fb.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_052943_599791_03D06AFA 
X-CRM114-Status: GOOD (  21.85  )
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

Hi Chen-Yu,

On Tue, 2 Dec 2025 at 03:18, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Thu, Nov 20, 2025 at 2:14=E2=80=AFAM Simon Glass <sjg@chromium.org> wr=
ote:
> >
> > Add support for pbzip2 and plzip which can compress in parallel. This
> > speeds up the ramdisk compression.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  scripts/make_fit.py | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> > index 9dfef11fc4b3..64038f17a51e 100755
> > --- a/scripts/make_fit.py
> > +++ b/scripts/make_fit.py
> > @@ -57,10 +57,10 @@ import libfdt
> >  CompTool =3D collections.namedtuple('CompTool', 'ext,tools')
> >
> >  COMP_TOOLS =3D {
> > -    'bzip2': CompTool('.bz2', 'bzip2'),
> > +    'bzip2': CompTool('.bz2', 'pbzip2,bzip2'),
> >      'gzip': CompTool('.gz', 'pigz,gzip'),
> >      'lz4': CompTool('.lz4', 'lz4'),
> > -    'lzma': CompTool('.lzma', 'lzma'),
> > +    'lzma': CompTool('.lzma', 'plzip,lzma'),
> >      'lzo': CompTool('.lzo', 'lzop'),
> >      'zstd': CompTool('.zstd', 'zstd'),
> >  }
> > @@ -220,7 +220,12 @@ def compress_data(inf, compress):
> >              done =3D False
> >              for tool in comp.tools.split(','):
> >                  try:
> > -                    subprocess.call([tool, '-c'], stdin=3Dinf, stdout=
=3Doutf)
> > +                    # Add parallel flags for tools that support them
> > +                    cmd =3D [tool]
> > +                    if tool in ('zstd', 'xz'):
>
> There's no 'xz' tool in the list though.
>
> And this hunk isn't mentioned or explained in the commit message.

OK I will update it.

>
> > +                        cmd.extend(['-T0'])  # Use all available cores
>
> Zero is already the default for 'xz' in 5.8.1.

My system is fairly up-to-date (Noble) and I have:

xz -V
xz (XZ Utils) 5.4.5
liblzma 5.4.5

Does the new version reject -T0 ? If not, then I think it is best to
provide it in this script.

>
>
> ChenYu
>
> > +                    cmd.append('-c')
> > +                    subprocess.call(cmd, stdin=3Dinf, stdout=3Doutf)
> >                      done =3D True
> >                      break
> >                  except FileNotFoundError:
> > --
> > 2.43.0
> >

Regards,
Simon

