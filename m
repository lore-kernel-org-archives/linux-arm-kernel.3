Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853C0CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 14:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=; b=BKeYMxJCCpz+NGpEcnVMfjy9A6
	okLR3tif9cax9Xka8Zb3z8ZrTUOWlyTdwwAXRdcqbqYiGBWzAYWjAwUqvygJ2Dusm9yuzqnPA3cyC
	vWVNhr6AQ3tKzJ4gzp0VlzKmwraI/zB3dVWk6+p0Zjv7UiUt3oWSOMYH8ze2cpqXGDuvWudoTJaGh
	dwCaTsGPzuzNSIClOAtq2Tjh9ULDqkWntacWM9b2cwqxfftZHGTbHs0+E0CH+pd1FcO+Js/RYcgrh
	WpYQ5OpfMylSX3XSKN7M+NGBzzSWwjLfk06FlyhKtH4hm59oZPBpd93rewimWUvBbj0XZUTnwcWiR
	HGYdGyuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wawjf-00000003PYA-0VQC;
	Sat, 20 Jun 2026 14:31:51 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wawjc-00000003PXM-0ybV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 14:31:50 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36baeec21dcso1570242a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Jun 2026 07:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781965907; cv=none;
        d=google.com; s=arc-20240605;
        b=Tikjl7/LMyQoy1VFv7tb+zAz4V4xiaTsBL/QQs/KxlsQtiQT3xAwxd8Ud9L0CGgfrL
         w8+/UYiIzjLQmzRhMYo2yYPpSbZj4mEtpj8z5FyOBvutfdhEol1CRVXorLTIiw5lwqi/
         5NzuT27kolgtenG0C2d3EhmsvkZBAn8uDjWUq41pxZCQhYM38xMpbbDIVnsMhIYEpNxz
         ++bfYtVQ2JLMyz+RIP7cu0jtp1baIfuDBRRTiIXa/V4HlMQVb88ni7zQWl9bCQvzxbXx
         WNGr8jE4EZQTF1bEU1iz9SmJG7LKTTvW98Pnjx9yVWLgfB7ete6wTA4rZJVq2H9hczxY
         HYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        fh=0m6GqiPhu8OgB+hKVHwASYK5CE0agMYYIO485AifdV4=;
        b=Nv77oyLkYaC1511Wa5HInXWQ8W6Q6C4QUHFb5Foz/gJymSrB9gFwzxc3fu/JgDEJAN
         cCg9ntKkkB87iVDXWS3tSzCCQk6IMsYhbpPyKEbEy8fj0CcT/fbTukkTlH21i9jup+zn
         5sblV0qPf1aDIr92yBmzCA/8wTuzo/Cz53CY/S70s2KRSS17i5ZN7b5x5uBDuhjBT+D5
         amLR/I5HAjYWVqJhjGkxI1uGvbvdbQaOvgXC7IRmgo19n35I2CNIouJHsx5TVu9qJabh
         pO5l2uLLADg6zCeeAnZ2Bd71k6PB+ReeMM8Sh6UsLrvR+sNLOyNZJS1l1Lju+PvuesPE
         /2RA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781965907; x=1782570707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        b=Yg3/AkYUOM4lUZTqTkoWc6P749C+3aaOvWJkgyy5i50NlD3xKtIEHFAmBcPepJU7/4
         GCvSbReRH/AIoWK/H6S37hinzgV4utHsZhtAXBiK4FVBGLO/eXmynuQY5xh44vOsiONH
         3oOO6BrAS05Jjqr1x6iMVs6nO1R6QSHtLCcUc6jhghdG1176rSLxvheFjOSgP9s2eXAu
         MWWkpgqel8MVmXqJq1FtCUV2CBYuqJokk5SD7kQOp38lkd3BF+b9VT6Eg0D/FDMK6pBb
         0IL5DPswQ5jXIItKoYc6ZJeU1iRqyCN5a3/uHNQgJhBRCqZ41Pa30pXqqb+RwGvofGpJ
         ijKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781965907; x=1782570707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        b=I8RZvtkdbxxSc8loW2rs1SOLOu9FnxuaXyUSzKn8+DxnC7mY8wQEWgLz8ZIkWe5cQb
         zcUgvvCwMRz13PH5g3JDUlpXhygsdg0HSq7GYYjsBXTXYAsuhezT69BZ0yICU1vA4cz7
         jjqctWAjSRHAt9HKcixE05zhvFCfYkUQuMTG/fisD9CcBOKbiBYlqP3EQc06h3XioJvn
         g+C+AROLWGwL1kel6JNzn1QxssznayvLClPYD53jRxu2WmA8Iee3lMaRHeyCoG37Bs/h
         Pfy87nmg5mTofjPsk363XmYdFXTEuZq8Jv5MYZIDaJJVKuukxSd3+MfFoNDP/O/yyenj
         gXBw==
X-Forwarded-Encrypted: i=1; AFNElJ+6CA8EbUAnXrtHpll7SaBC4ivGVQKyGyBm8oHlF3JR07QY61F189+HixbRkNBj1GnTpUGQewQ8NYG3XfT3UjaV@lists.infradead.org
X-Gm-Message-State: AOJu0YyHYKoywIDwkfU9kshI9wQNkEiN75TZxJStSXRTHCMmxqs73D1X
	iS7ojeetANM8DzoxvhT2sftJjtGLpE+GTDtZ0Ul1kOmgoX72p10tfAM5piI+Uy/mgtD7PcVuiSG
	imwxJGvqqreydIEp8gKPPWoOTK6oMvac=
X-Gm-Gg: AfdE7cla6lcFuSEK1OhUKCIm9T6Ku10de9B9F0zTT4QjHd1EvX0EXyjN6rODg+tOhH1
	4njcasjCwwRPzKzh4fa/0zRVgpXWhJYCFqTP7BuAazrYVgqL4eCecHH4jVYBF80fZONix0REU6K
	vNYynB1pwwcAQjQR5X+aXfQldko7s68v+Yz8h1yzKXHLK5JP0VsUC4uE+r/+RufjdRaCT25a2Qq
	/o1Oe0/eCEk602YapN3cpY0ZzlnlPI92v7+3OdbxZSAb8WR54Qe0YOQ8+ZvdG8uzEPVMMtWY7GY
	jJcdBXfP10JanQb+BXiRanUokxQF7FszXaIhHatc9NclJ7fHk7iKMNLf6Plw1g==
X-Received: by 2002:a17:902:c40f:b0:2b2:4d36:7ba with SMTP id
 d9443c01a7336-2c7252a8057mr74037005ad.0.1781965906891; Sat, 20 Jun 2026
 07:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com> <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin> <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
 <20260619101346.2ec49087@pumpkin> <ajUcTfG3vSGz3n3d@opensource.cirrus.com>
 <CAABR9nGRCZ1zv0cyBGc3yuM8MeFNqBB1MkGUL7bTbtC_LcKKzA@mail.gmail.com> <871pe2kcif.wl-tiwai@suse.de>
In-Reply-To: <871pe2kcif.wl-tiwai@suse.de>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 20 Jun 2026 21:31:34 +0700
X-Gm-Features: AVVi8CdmzIZOlmsJ02kZGuh_kzjdhPUos4g5dG2tFnwGhCYx2Sp6G_przK0DiY8
Message-ID: <CAABR9nEdHwXpg8+6J5L9Af1PvybGt3KSfRy=LnMHXSQSHnd25w@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: Takashi Iwai <tiwai@suse.de>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	David Laight <david.laight.linux@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>, 
	Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_073148_283496_18D70C51 
X-CRM114-Status: GOOD (  42.89  )
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

On Fri, Jun 19, 2026 at 6:14=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 19 Jun 2026 12:57:57 +0200,
> Bui Duc Phuc wrote:
> >
> > Hi Charles, David,
> >
> >
> >
> > > > > > > I believe you have to use scoped_guard here, as there is a re=
turn
> > > > > > > from the function above, if memory serves it attempts to rele=
ase
> > > > > > > the mutex on that path despite it being above the guard.
> > > > > >
> > > > > > Indeed.
> > > > > > I believe clang will complain.
> > > > > > That makes these mechanical conversions of existing code danger=
ous churn.
> > > > > >
> > > > > > While using guard() (etc) can make it easier to ensure the lock=
 is released
> > > > > > when functions have multiple error exits, I'm not convinced it =
makes the
> > > > > > code any easier to read (other people may disagree).
> > > > >
> > > > > I built the code with both GCC and Clang and didn't see any warni=
ngs.
> > > > >
> > > > > My understanding was that the early return exits the function bef=
ore
> > > > > the guard is instantiated, so it should not affect the guard's cl=
eanup
> > > > > handling.
> > > >
> > > > When a variable is defined (and initialised) part way down a block =
the
> > > > compiler moves the definition to the top of the block but doesn't i=
nitialise
> > > > it at all, the first assignment happens where the code contains the
> > > > definition.
> > > >
> > > > However the destructor is always called at the end of the block.
> > > > So if you return from a function before the definition the destruct=
or
> > > > is called with an uninitialised argument.
> > >
> > > My understanding was exactly as your David, but it seems that isn't
> > > the whole story and indeed I had to fix a bug in our SDCA code
> > > that hit this.  However testing this out, results in some things I
> > > find very hard to explain.
> > >
> > > It seems as far as I have managed to test, the code below works
> > > fine as Phuc suggests. It does not appear to run the mutex_unlock
> > > on the error path.
> > >
> > > int function()
> > > {
> > >         if (error)
> > >                 return;
> > >
> > >         guard(mutex)(&mutex);
> > >
> > >         stuff();
> > >
> > >         return;
> > > }
> > >
> >
> > Thanks both for the clarification.
> >
> > > The situation I hit this in before that doesn't work was actually
> > > this:
> > >
> > > int function()
> > > {
> > >         if (error)
> > >                 goto error_label;
> > >
> > >         guard(mutex)(&mutex);
> > >
> > >         stuff();
> > >
> > > error_label;
> > >         return;
> > > }
> > >
> > > Which in this case it does run the mutex_unlock and NULL pointer.
> > > Will try to find sometime to look at the generated assembly, but
> > > this basically totally blows my mind. Very unclear as to if this
> > > is supposed to work this way or just does by pure luck.
> > >
> >
> > As stated in cleanup.h, mixing goto-based cleanup and scope-based
> > cleanup helpers in the same function is not expected, so I think
> > we should keep a consistent approach here.
>
> Right, and IIRC, clang would complain the mixed goto case at least
> with W=3D1.
>
>
> Takashi

Thank you all.

In fact, I have only been using GCC for building and testing. It was
only after David mentioned Clang that I decided to give it a try, and
this is actually the first time I have used it.

Also, thanks to Takashi-san for adding the W=3D1 build option. It helped
me catch and address warnings more easily.

I will send a v2 to address a few remaining goto cases that slipped through=
.
In addition, I will switch to using guards for PM runtime to reduce
indentation and improve code readability.

Best regards,
Phuc

