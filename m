Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D340FF54AAF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DlxdYudQZHzhSVGoJ5F2It4bIBVpOirU3SHbVtuL3k=; b=Rm2oTJ3HD8OYLPXVBnQwcfd9zr
	FAdZw1UWk4WNOiwJJW3TApBKpIPF7acdO3Md7aMDbfpNSVuDBuQc0lSLvaBd7Eo/9Oo/qbtP2qtRj
	rtasnJoJR1nemtk950kP2WHFEA/lBGKrdUZBB/Qe4i6aYQ58VXXqYS/IzF8AXED/WGSuQ0Vux+VpN
	IAPvsRfhad4EEoslO0d1yVNQZtZzvBVPd/cK36JHuxqz4CiopZ8AJWfXatypqwf7H4Ve+G46L6k+u
	oI9xw3IxCXZXF+JPkI84u+jMyGVozVrwY3wioqSts+OW60l3GY24QHJm75ZABGWBfVwPZK/8Z/bUE
	qh60+L8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51XF-00000001Urh-1eul;
	Tue, 24 Mar 2026 13:11:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51XB-00000001UqM-33Cg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:11:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9F57444A0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 13:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE10C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774357860;
	bh=ORbDg8+0Z2ANVi6DavoUZdnquVF34S4e8d2NiLiHAfI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dAJ1bwvE/ZSWO6JumYWCZ9c0P+EffpxSjDvLCbFIdN1ytGZfKPldgSmkDxowsZq0m
	 6izQMHzNmwTe/TOtE79Sx0Hfy3sRYTGwXV2X/wBikko1aM54bhuD2RTeyrxsgraWAE
	 z5pBVHqurNwb9PoZ0wjSNjN7qHVLuzEFJT4nV3J/0VpPlPf322klZLZwRJqCB5ij6+
	 5hJ4frZbwJOYYppJsam2O9lEIAYCwA5659Xkdvoi7sn4KNpEUoy3+hu3rB0bkszdVI
	 wnMAlzfIxcrZ5oenX7WyI0VFjzV6DZo/v5zxkxu3+1+6sbnADS1syY+htnkjaG56Mv
	 p3pOgbLCWcovQ==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64e8cdafeffso7662470d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:11:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfc6yhXf/BJL29BJ0NOmkYhuUg15hK1/yyqbL6HpDvg3JvJzmUQFYpzvSUBKj++gaDeHljYRp5wollAkHuA17k@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7JJthhtIR8vA9ISAI8/gGy+GjDoAh4nVBFrhsurXcsZ8ZwBOI
	7jj7Ohzzcex+XER5X/ZN8qKphVEe+BVLeu2T8lnGYnxj0qdVPzzjKc8TuoCIyy5D6Flz6eYklNy
	v+IOv6JrZeD+FWUB3FKKgOLMJK9Cno/s=
X-Received: by 2002:a05:690e:16e1:b0:64d:6cac:ecb3 with SMTP id
 956f58d0204a3-64ed798167fmr2191116d50.35.1774357859823; Tue, 24 Mar 2026
 06:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774283146.git.dan.carpenter@linaro.org>
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Mar 2026 14:10:48 +0100
X-Gmail-Original-Message-ID: <CAD++jL=mz5jOLkq6GA6ZWzfGfFnVOLTCoXKOd38YHj2UZaZ9ww@mail.gmail.com>
X-Gm-Features: AQROBzC_PVLEzvyq-VUAWwZR3Zdrlt3WKR3fyJ00TG0JrBVhIbhE3LyYep2gdCQ
Message-ID: <CAD++jL=mz5jOLkq6GA6ZWzfGfFnVOLTCoXKOd38YHj2UZaZ9ww@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] gpio: introduce a GPIO driver for SCMI
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <akashi.tkhro@gmail.com>, arm-scmi@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
	Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_061101_787476_0D4E120E 
X-CRM114-Status: GOOD (  11.61  )
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

On Mon, Mar 23, 2026 at 8:01=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> This basically abandons my earlier attempts and goes back to Takahiro
> Akashi's driver.  Here is the link to Takahiro's patchset:
>
> https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@linar=
o.org/
>
> v6: Fix a build error when CONFIG_PINCONF is disabled
>     Fix the dt-binding subject and my email address
>     Use pinconf_to_config_packed() instead of PIN_CONF_PACKED()

v6 applied to this immutable branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Dib-scmi-pinctrl-gpio

Then merged into my devel branch for next.

Bartosz, you might want to pull it in!

Dan: thanks for your efforts to fix up the remaining hurdles and
bringing this to completion! Sometimes the last few % of work are
the hardest.

Also thanks to Takahiro for this idea: it worked out just like you
imagined.

Yours,
Linus Walleij

