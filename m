Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1885FCD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 10:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=; b=zIaWYdGRSxulT87Kim4q8hT7eI
	i+a+WtLzme6iXSw3Sqzer6T6NT19iRnzCurguV98K4qp/J9L+y6lKzs1kiL6DxfzWMmWiTVEaCUf8
	6WFg96qoVE01zBYLRX1l0X+IL4/WWWh9nO5vIzngoP+K6sU1cAKr49whBurVtuIUJnj3ecmnUIIFL
	BXVlpI1S12NGnWDpnCfaV6wG+Vhr3kGlrKEkHI9FBaFyaIo9uL13xpxObEyDddxK2BlbXN8DXjlnn
	VaQaAW0TcfeTIuTrV4rj0yie0Iv+tGmMtIcDP3DIznPnYFXK2uNX1SuUnMxJ78WeqnvNuWXjGE2Yf
	0ZcWWRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWvL-00000002JkF-1obh;
	Fri, 19 Jun 2026 10:58:11 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWvJ-00000002JjP-0TtU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 10:58:10 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-37cbcf49deaso1071797a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 03:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781866688; cv=none;
        d=google.com; s=arc-20240605;
        b=SeXlAlzkzNcKvQGeFXIRWLJo4bNpNbtQJRnQIQErXXUbZ+lkCDj5mMiZd+8XtmoGTT
         KH3+0zvVUneBwyvLeCicdUZM83pmigUphcIcJT+sOIBwbRngi7Z7n3SY7v1E8gGq3G2u
         CgoHxlmVl0Ia4NXZ4pKQEcpC4+T1ipVZtQHDCq5jwgZYmEn4CTup5zG6wdHoogRaS9Is
         myrb8E/tBLDIsqKCV+YSoN+kbNU1OD9W6/nwZiACTIXsZNy08+Ya/XzaDVZz81GzSCYf
         yqvJ7TZlW8hKYWvd67AjOVNh1Jl28ikBJn10B7LgailMLKqddH+6PeGPifLbVVLSz5Mp
         pPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        fh=4r74mE+GXeVVTE8IC0dSVnqsfA3L93JhDfHZqukB3nI=;
        b=h/+5Hlg3mBTbd6JF7GED2HUf8Vs8x54l2182GFyDpKRwV/ocFCevBGdmtsVXNGFJe1
         kNDjhqAQZ1XdyNlvvROLjWuaZyNqfDAtah9Hf5osdyL2imYdzyC26V8dEJg83ivTZUxF
         LTEm/bwiulnYtTkn92YFyotXYgcGMLykui3IeItucOQwCbGoFOJbjYhR8xbzmyQN5pZE
         gOqrt8Gd13am+1WcZm4icayyYughokcL5315T8IMTmIV1RIuq54WEYsH5jYmmHkaa3/u
         SKewRTchhU3UqIcpc6lzzep7GCaEmx2LjcREAlUmah4EWn3CiKS6uhewg1MXVe/1VOwL
         neYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781866688; x=1782471488; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        b=T8dMj19W8XswmIpSCao1uuwArP4k9OTSnBfAUVsypivw34fUq06IbdmiUxjLfpz+yV
         cLiEDsI8dZRgQOq+SuIF5wbYw1MnliVYx9PALB0YVJM6YNk7MLy367c2kRjIlYWVdLI/
         cEvTrjcj3Ixh/TQi5EgipdEHfhaXDSU2t93y1To3OzGPEpJlKEOc7Si3BW/wAeoyxoRA
         UiU/n+crTeZba3XJvTfhbVnzwrc5AaMWhzJaRJSO39iTU3IJkCqAziphwUWqymFLsMyU
         cBRFhuU6NFy0x8wv9wAo1iazKGWwq07QztIm4mzkucoLizYxg/Coi0lDbnEzGr4hK2yz
         iFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866688; x=1782471488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        b=Lk6wOCCT3x3AOfozkNF0xd9AjbnME4C30MI/CouCLmZkX2Ni2g4/NOxOVehIlGp6HA
         Gxr55Zsc/fYASIZs74+3yVfbrj0XsAhEulgg7+3qStUKDspPoDHM13BnX4QRKm3NzCQe
         BKB6PgJD3Hvv19TQ9ouNml2bnp6MCeqDeWHjpKfwMYnyG5oRtjotdgK9PFEU3177/M6s
         qEVGz0TpylDx2y+iG6XMObeUhHqoffW/bUjnxo1Nyeqe4AmJjmu5Wl/XZJBZsyqJUGEe
         IA0BF389WsD/VMLqj1ttJKEKb6R8FZ8yhS5/yzgxV2qdpFBhwDgIluTAB7AbM73929qz
         nHtw==
X-Forwarded-Encrypted: i=1; AFNElJ9t3v9MBQ0u+93JJGj8TP8mL7UG6AG5gR9XnuSub7TUoZB4McS0VJBlzHPP+P+VutS78kmjvE3lAYt6sTmx/yQp@lists.infradead.org
X-Gm-Message-State: AOJu0YxT/uabM8cC5sMpIi/nWT59VXLUqWBcgAXZTw4IZqpgCD4LjVzG
	gy2854TmoQLuJWZl9k2M6bJaxEthPQ1C8+3UcO0KBAnrFL9j8/vg6fbcNVPJwiFVYqfprScci3k
	mt44mUxUMUujkRLidlDJczr/LqoRui0A=
X-Gm-Gg: AfdE7cn3DQ9xiIFJbTD3uvK7WlyMj357Oxu5BA4FOmIu9FpSK6Rwt/f660tfiQV90Fi
	zM5/OiBd0IGjQ8dJXsvqO6A+xgG7zrID0TB0GqsswmHPJ5ugGkd6n9M1msQc636aHJp4OjiWLR3
	UKt3raOByjAKvTu3/fo2QuB49/4gGfCmbZMFPmYkUxKzyIlZH1E++Js7qLqNExMhENtS8h5nuDu
	p2UlCG+hyscHQxVvmtaVMF16HkIHfVBSUd5MJtmg8j1glJtrDA89/n0jt87xlZCuOJD8gGUjCS0
	LdH/1Ys5W/SqwiFtEY1j9xFHs98=
X-Received: by 2002:a17:90b:3847:b0:37c:7090:821b with SMTP id
 98e67ed59e1d1-37d15cb4614mr3550684a91.10.1781866688090; Fri, 19 Jun 2026
 03:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com> <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin> <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
 <20260619101346.2ec49087@pumpkin> <ajUcTfG3vSGz3n3d@opensource.cirrus.com>
In-Reply-To: <ajUcTfG3vSGz3n3d@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 17:57:57 +0700
X-Gm-Features: AVVi8Cd_NlwUbIL4avZasgAe7DuOI7f8OOig9UU05BKU2wbfQ972D9fz9PREhwc
Message-ID: <CAABR9nGRCZ1zv0cyBGc3yuM8MeFNqBB1MkGUL7bTbtC_LcKKzA@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: David Laight <david.laight.linux@gmail.com>, Mark Brown <broonie@kernel.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_035809_154883_2D25CF52 
X-CRM114-Status: GOOD (  34.47  )
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

Hi Charles, David,



> > > > > I believe you have to use scoped_guard here, as there is a return
> > > > > from the function above, if memory serves it attempts to release
> > > > > the mutex on that path despite it being above the guard.
> > > >
> > > > Indeed.
> > > > I believe clang will complain.
> > > > That makes these mechanical conversions of existing code dangerous churn.
> > > >
> > > > While using guard() (etc) can make it easier to ensure the lock is released
> > > > when functions have multiple error exits, I'm not convinced it makes the
> > > > code any easier to read (other people may disagree).
> > >
> > > I built the code with both GCC and Clang and didn't see any warnings.
> > >
> > > My understanding was that the early return exits the function before
> > > the guard is instantiated, so it should not affect the guard's cleanup
> > > handling.
> >
> > When a variable is defined (and initialised) part way down a block the
> > compiler moves the definition to the top of the block but doesn't initialise
> > it at all, the first assignment happens where the code contains the
> > definition.
> >
> > However the destructor is always called at the end of the block.
> > So if you return from a function before the definition the destructor
> > is called with an uninitialised argument.
>
> My understanding was exactly as your David, but it seems that isn't
> the whole story and indeed I had to fix a bug in our SDCA code
> that hit this.  However testing this out, results in some things I
> find very hard to explain.
>
> It seems as far as I have managed to test, the code below works
> fine as Phuc suggests. It does not appear to run the mutex_unlock
> on the error path.
>
> int function()
> {
>         if (error)
>                 return;
>
>         guard(mutex)(&mutex);
>
>         stuff();
>
>         return;
> }
>

Thanks both for the clarification.

> The situation I hit this in before that doesn't work was actually
> this:
>
> int function()
> {
>         if (error)
>                 goto error_label;
>
>         guard(mutex)(&mutex);
>
>         stuff();
>
> error_label;
>         return;
> }
>
> Which in this case it does run the mutex_unlock and NULL pointer.
> Will try to find sometime to look at the generated assembly, but
> this basically totally blows my mind. Very unclear as to if this
> is supposed to work this way or just does by pure luck.
>

As stated in cleanup.h, mixing goto-based cleanup and scope-based
cleanup helpers in the same function is not expected, so I think
we should keep a consistent approach here.

Best regards,
Phuc

