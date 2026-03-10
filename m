Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C59EB1052
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 11:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNYfW2PmdXWP40ndx3jBB9FDPr1eZeihvEAEqFyjWdk=; b=t248n3kRrK5XT/mc9eCDRzyggN
	oOCE/owuzM/F1XFNAKISWyZSdO+RGQZTlMO1dAt3ejqgtRClg/m4sMpWWjVU7KHEPh5c8uXD1bUcK
	Sq4XSju7vA54Ooto3LlrX6jTXaOk+8yJh/LDoXscGM3Z4ZpblO0eswuKUEGuCqEeTvm+lHiyrgJN5
	t2uKQmseCm5MdKhwL7otaRGLuoMwHhyDVf2ZLEnO0puSQ1pX1BCwcTqluybz24qtJd2rvidQIGgtl
	8iEufyDkDucqYTW3bNLc5UxzVascOrtMNKJuRAk1xKUKhIIKnF1ZbXIXidaqiOvkMEtzLkKuTeNE1
	v5JevsTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvY2-00000009IuQ-0TdS;
	Tue, 10 Mar 2026 11:46:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvY0-00000009IuK-2MxO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 11:46:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94ED1600B0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449D5C19423
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773143207;
	bh=hNYfW2PmdXWP40ndx3jBB9FDPr1eZeihvEAEqFyjWdk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Le/WcXeIEJ5/I5c5MTCxMQCRiHxZB5GNrnMcout58eVVdk18EdUYjzwPWJnVuXBki
	 SagzozLxO+wcE192t1+AktymvzDcdUoDHooOp4B9FImKmAhrwgcU/olf3kIV5e7MkC
	 Sbx+lsh95q7wmjhWNNmgmRSUFKTfFl3pxxKglpfkSosvPP+15QLmEBYPEQODi1FD5D
	 S616RpE9b4efrcpVUHRg2IJUZ+A98WZye5sBwPInCATJCFCj4NqPZjHW6m47ow0hzW
	 u0ScO3rxonqrCSFoEGGnCRPog9N0b9I9S4eerye/NQhRv6Ley8P9jQuW4QdcnR7J+Y
	 SHjVrpzuxQ7wQ==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79868cde1eeso138938127b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 04:46:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEn5ltYPlh2CKdxiFNMlE3Rlp9GCbSdsvZYly+TlJ1VGChyDtj1cFL487TSCMzlIF89gx1Jm/llnnDLV1SLvCo@lists.infradead.org
X-Gm-Message-State: AOJu0YyaxgxFIMyvnWArUKsOQfMXeeF52Ot/QghLE/WE48uFxqkytNi8
	3nYTRkOuzP8Jp0fVD3YNvnRLScx+4ethoYz8kSMXOW55w0ESVhiaqV7hgO6oh/XkbLzQf9ajm74
	5OmNItylan4f5iggDQtTsiv83L1QRyOc=
X-Received: by 2002:a05:690c:62ca:b0:798:5951:f42b with SMTP id
 00721157ae682-798dd74191bmr132448727b3.42.1773143206603; Tue, 10 Mar 2026
 04:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260224092419.1275016-1-wens@kernel.org> <CAD++jLnKxDi1GCp94zAUKhwBvQwVAdT8bgNyw5XM2+PTOhxq1Q@mail.gmail.com>
 <3x55nsighrqdo7al2n5imlov5yoti6z7jxrj7yieeghyqkllvb@akbuob4n37pq>
In-Reply-To: <3x55nsighrqdo7al2n5imlov5yoti6z7jxrj7yieeghyqkllvb@akbuob4n37pq>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 12:46:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkEKprZ_qraCSMq2Zcz7ueiJaOEX6iQnMk9=Su-LbO6xA@mail.gmail.com>
X-Gm-Features: AaiRm51B2JF0wnKHHzU4Y05R5Ms0mzx95C_lYOY2b_o2pvVtQFzJDnrhtWE5e6E
Message-ID: <CAD++jLkEKprZ_qraCSMq2Zcz7ueiJaOEX6iQnMk9=Su-LbO6xA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Mar 8, 2026 at 10:34=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
> On Tue, Feb 24, 2026 at 10:52:23AM +0100, Linus Walleij wrote:
> > On Tue, Feb 24, 2026 at 10:24=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org>=
 wrote:
> >
> > > After commit 471e998c0e31 ("gpiolib: remove redundant callback check"=
),
> > > a warning will be printed if the gpio driver does not implement this
> > > callback. The warning was added in commit e623c4303ed1 ("gpiolib:
> > > sanitize the return value of gpio_chip::get_direction()"), but was
> > > masked by the "redundant" check.
> > >
> > > The warning can be triggered by any action that calls the callback,
> > > such as dumping the GPIO state from /sys/kernel/debug/gpio.
> > >
> > > Implement it for the sunxi driver. This is simply a matter of reading
> > > out the mux value from the registers, then checking if it is one of
> > > the GPIO functions and which direction it is.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> >
> > Pulled out v1 of my tree and put in this one instead!
> >
>
> Please do not merge the correction yet. As I was pointed out by Jernej
> Skrabec the solution is faulty and just cover the issue. I will provide
> proper solution as soon as I find it.

Too late, this is already upstream and I think that is how it was detected.
Shall I queue a revert?

Yours,
Linus Walleij

