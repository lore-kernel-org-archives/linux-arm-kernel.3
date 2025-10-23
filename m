Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CB7CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FILWuJP7z4ne8yyln1112yG3l4Q4g1VKcs5bhTHsJnM=; b=orNWqKBCpedsvY2yE2esGPb66f
	YTOhHuKSp0GUdcYiA9wVbZ77ErTG9hmUX0Ry8FQaU2L9uKKJOC4gEjeVmFcXWyBOOXKZOc8GIc5QH
	4us4N8zKvgsUceUjVIaz7T1eHtaUvwCYDGFE6zkesFD+preDViYF7cTLiQxLk5Tal2SbFy9EkFJom
	iABSTSrs6CftUiHdJhFPWjEbg5L9Eh10DaaxvtiFJgFuB0F3azqB5XMA3epE5JTZ4a9fQHWZKc40a
	Q6MjvGpw9rZbTA30IN9jDM3N5X1gj7GrlwmKUzKgjVdD8gQ+asLvS1lfE9pNYZ//joo5N1nF6wr+6
	xc6OXvTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0I9-00000007GRK-3NO8;
	Thu, 23 Oct 2025 18:44:05 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0I7-00000007GQp-2eko
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 18:44:05 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-592f3d2d068so1091844e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 11:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761245041; x=1761849841; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FILWuJP7z4ne8yyln1112yG3l4Q4g1VKcs5bhTHsJnM=;
        b=rZzX485yFblIBl1XIztpbfl/bX16Ps6FC1/Ogx/VltfFPdU8k/khpJxBCS0hqFXgD1
         mUPHKJm+dXiIwPxLKIZ7Nqj2IQLDYXuvXaDHzo/Fb64UkycPmRRldTU3/Jk/dQSLJ7Yt
         BEUOxuIBTB4ZgHo4iu3dD5mMJBZSBNnqtIFVOEh1BLSjFQNpNzPnueqVo6Zz9SgSr+Q6
         J8E9TXLR67Z5y6LDCsfA9eEtGOxs8W46Ctj/QZrhqBwEPEwDAqo69Lg2fe3u6fr5gfnY
         AaFqm+MEVL4drVWEKPEKnKpokwCD7wUaYkwuZVLXqO54S0EVPqo/CvYrfbJvmsZIKvs5
         u/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761245041; x=1761849841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FILWuJP7z4ne8yyln1112yG3l4Q4g1VKcs5bhTHsJnM=;
        b=FXYhABYuxCcawsWDeXYCWzPQqdoKLIBI/gOSk1QZyHf8IUiB2FT4Dq5N3SJZ0Lr60j
         TZ9z7DHsEKbCdwt+6bk3toxyStXtc9bWe6juIpUuwemP/QIwQyVU538Ccs4nfO1t1mpT
         YO2nZS58r4mXiwfjE16L8S+7yV1fCfkEmG1j5Z0yrwJ68i9xHkFVrwAIdzJSCnJdUTOv
         4W+/n7h4BdQ2666+LHYqh0Fd2EtR/uWinzk4QMGN6ea0MNh2F1QDQ2W62ZKbyy8pQ7t1
         fTXHjBzrG9o0zPII6MmnQT+DBnHnodvgRwgIj/BNhrFejwO1Z/kCcJjR9oEm2zYx7gwh
         3Kuw==
X-Forwarded-Encrypted: i=1; AJvYcCWq0sUUO8YWSBbkO+RPwtgJ1D4H3TaiwKtV9/D7ue9K0Uu03xNiKGTt6U5uT5/KFvQDF/WRM+qMmR73hizfiiPT@lists.infradead.org
X-Gm-Message-State: AOJu0YwdeCFfw2zXuRN7onn0aFOE7EAoOANuVp56XbDWh/5awj5+wsWp
	UzJlKkdYISg7jCqxHmWba7TdcEC8zT+WYj9FgG1KMaa1UwfoLDm7HssGkD5Q9qLzVn+88HppbTm
	JcjqxPM6IT8EnhS1qVyymrXe8SKvGM1/2k3HatsKFqA==
X-Gm-Gg: ASbGncs/LLOG1ovcM88hbX+LBD5drLUUcIHOZT8My5ZuqVWeMZtotv9M4DmIB4S827F
	u1PsaQpTKam1nFzXJDxrEJLCbub65kHG4dNMuYm7uQV7QUVStXTUKEhvxnrRzL9Tkcn0zQWvh4n
	BMzm9cntXOiB5VSB/T0B35DCvpMn5rn75XolcZWTeawPZdmtPc2lZc6Vb58F/z7ZKGP8ncKKaeC
	UIxdqQEcUi4+YqTQ+4kG9ghS9lIig+r6S+buAbjRoEsD6S34KxkuNdWNlKap6a6djPpmRAo0IoR
	+nyzXbvaM5kuXNVuQpBR2BrOfw==
X-Google-Smtp-Source: AGHT+IHraJus61bT3Hr2N07s+Ur3YCVMAET0C9pakpGhymtxfywdhGOWwy5gv3wy+GpPvNZ0Z7OpA/pQbI51BbDb264=
X-Received: by 2002:a05:6512:3b1e:b0:58a:fc55:883a with SMTP id
 2adb3069b0e04-591d84eb531mr9214189e87.4.1761245040819; Thu, 23 Oct 2025
 11:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org> <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
 <CAMRc=MeSFKRo1rHq5ENzKqws+gOAX=-nCsGtw5MXvsOwJr=XpQ@mail.gmail.com> <aPkQi_Zn-17JKG0s@smile.fi.intel.com>
In-Reply-To: <aPkQi_Zn-17JKG0s@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 20:43:47 +0200
X-Gm-Features: AS18NWCf9BHk3M78U-yTtMgDQhhnI1g2CI7k-KfJvPnPOvApY9tkkzNXTL8vud4
Message-ID: <CAMRc=Mdah6ve68h=d93VHXGij7KAQiGWuOGtzX_7VSPsCi=bbQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] string: provide strends()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_114403_864944_314DE35C 
X-CRM114-Status: GOOD (  20.76  )
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

On Wed, Oct 22, 2025 at 7:12=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 05:36:33PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Oct 22, 2025 at 5:25=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Oct 22, 2025 at 03:10:40PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > > +static void string_test_strends(struct kunit *test)
> > > > +{
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
> > > > +     KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
> > > > +     KUNIT_EXPECT_FALSE(test, strends("", "foo"));
> > > > +     KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("", ""));
> > > > +}
> > >
> > > Have you checked the binary file? If you want this to be properly imp=
lemented,
> > > generate the suffix. (Actually making the function static inline make=
s my point
> > > really visible)
> >
> > Andy, this is bikeshedding. This is literally the least important
> > piece of this series. It doesn't matter for the big picture whether
> > this is inlined or not.
>
> It's definitely not a bikeshedding. I try to keep a bit consistency here =
and
> I don't see the point of bloating a kernel (binary as well) for the funct=
ion
> that just a couple of lines with simple basic calls.
>
> Also note that with inlined version strlen() for string literals will be
> calculated at _compile-time_! This is clear benefit.
>
> Really, library code is not as simple as dropping something to somewhere.=
..
>

Ok, whatever I'll make it static inline.

Bart

