Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754D1CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=; b=AMH9TGyg3jslDrc0zHKKDL3KGx
	vJS2jMlbxPhVYatRtSBnzsjcsEwyoNMg/9tUamV7IsUtVcCJqE0KowFX3Ca86iWU4/5ExdIqBOrWc
	5IfpLDj+GvJx8OQlN7WwReCmefTxSfXcV/37ghnNhxs3+W1H+kFkfzQaGmzWKnFwhmKdtKf/6MTzf
	P73GIsEDOnXc9V566cd8dgXySIkGTeJi7QPUk4hVAJ7fp0TiBNCcdoJzp8PzdL01r6E11nN3M0wP2
	n2lcar/82PeM5Rr+9iB6j6EANqsOZLH+doQQaQZXZOF8hLcFQIyK9RsQXO1cvb33BCl66LLYWi5X3
	IUMBP1Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw21J-00000008wat-3Bxc;
	Tue, 09 Sep 2025 17:20:41 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyyo-00000007cCP-3m4Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:05:56 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-567fb8be044so823648e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757426753; x=1758031553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
        b=fOrHRiSUspGy9QjTldyAq1tt7jzEeEjMcduRuS3czL3ujn0QL5UZdrCISBBdzGu5a3
         X2rNw7bTQJ6ri+ybopFOs7nayUC0srAT20Q8La7wKVfuFYRCuhgyL9zYjIKW/beo32xO
         lvTkOm/iaCyMBL2NiIu68+OQF2uSekVmJrL8iW2Hc2FBh9FhaZdM7D4B5FQvwdSPQGJ4
         JnZ7XPijkwft2Zj5Zl3ZccLHDRVttz62LcGI5ThhN65NrnuvDi5PQWTatqkBMSOjkxdj
         NsiERdZvKNS2FNxfxeWY6t9lpjXAhksLY+8qsFKbNgQbgPOk8YCc2q+yFgL5rZhizB7q
         FqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426753; x=1758031553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
        b=N+Gg4m6f8ZoJ8XYt2cNmqd3CaHGdZMslpM9XYxBd80Ww/5bcZYJd4itmUpgaV1KhFi
         hrpZCHgNc5HYNbQkyVxhQhnyL6JGs5ptL6cEzDkSfkASfxmI0JoeHcfEQWM72hLJcCl9
         /7T2vviTYI7CQjxG3Es8Y2tYemfSVdJxr26NBl23MC1gy+G+Lqvb6qRXjeXAaeJADlE7
         392sbJosinTHVez+aeVydBUUMTbrQPABL9n5ueDY0biQf2bTWDPUcf+LmCi1DxxfOtXa
         CZ4XbSXvjFENsF+DkKICAOEMe9yUq7BHLnwMb7WMX7dpT/Kn8bAV2vFH667Ww8NKQeHp
         qzwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs7+ZablQ1G8ZhE+KduojzWCjlQ+TZDHqmQyzfaQU/BXZHMhfua8ak+Br5rJdQTFLfcrKwSDhBH72/A1CRYaj/@lists.infradead.org
X-Gm-Message-State: AOJu0YxxK8YsH0Fh0pTlwatPGT+kiOnK7vcAZBpbCXLU78l0cazUBrls
	WCKzi2uALm//CKOKn9kBhPkSOXOsv0Ts5OmLns6gyECChyMXmFSN7VRecqdfH+/Yfjo2mGMP/fC
	3XB7rqwx8gYp9MDykO8rfDP7dERLMoAltiS4wnQk4GA==
X-Gm-Gg: ASbGncu0r3HIUGERWIQKfF4U4TMiwq6z7lD40mGYXZz9bMt31PeFnZb9hhN6asiyatw
	iqXHPcY/LOBiskCLXNjUewEIBoXPVWdXx6OjzTkN31w0ti9f8WqClMt2ywrLZCK4opQFfXLad4K
	RApB13otpHQ/d5ID+/pfrOe0WELqU7Qm4+HEiItzzUWckmsZugl1PRCkqCDFzZO9Y9HYL1OJw6p
	7c5TzzEcgomwO1xgZj2I9bWqkfW2tt22//c4bg=
X-Google-Smtp-Source: AGHT+IHxbtPyFzNpPyeaiiBaisDmRYDyXY5HX06QQvzN7rQqg4ycDBS5H9rZi94hP+dpGNYd7MLd29QcT4mULfuZ6+0=
X-Received: by 2002:a05:6512:108a:b0:55f:4db1:e450 with SMTP id
 2adb3069b0e04-56260e3b836mr3230997e87.22.1757426753065; Tue, 09 Sep 2025
 07:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com> <aMAzZAbNwrRTgFi-@smile.fi.intel.com>
In-Reply-To: <aMAzZAbNwrRTgFi-@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 16:05:41 +0200
X-Gm-Features: Ac12FXw1RLq4MdeG1hkRFaIkCvacYp3h7kbqz23NMJgO5kiwlT10dViDUNZvzbs
Message-ID: <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_070554_988006_A6957E88 
X-CRM114-Status: GOOD (  17.30  )
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

On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > >
> > > TBH, I think those 6 all made the same mistake, i.e. thinking of the =
compound
> > > literal as a cast. Which is not!
> >
> > What do you suggest?
>
> Write it in less odd way :-)
>
> foo =3D (struct bar) { ... };

I don't get your reasoning. typeof() itself is well established in the
kernel and doesn't

foo =3D (struct bar){ ... };

evaluate to the same thing as

foo =3D (typeof(foo)){ ... };

? Isn't it still the same compound literal?

Bartosz

>
> > And are we not allowed to use C99 features now anyway?
>
> It's fine, it's not about the C standard number.
>

