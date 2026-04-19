Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29409EA71A1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 21:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fer9Pv32OZGpIYjchRVw08oeQUhbW57yCvmM2VuqU5U=; b=ZsDBvz+fYi8umfbl0RmwhdLoN0
	HNArgmYzjHZiPkTKhhjqmNG5bFZ2WAQDhWPeBK5uHbtHNDS5+JJ6dXq5aO8oF/TmeZeNHXNAgJUbs
	xRe+V78BLticIDXzgVoHUD5sVsmGX/3vF8egGkAVMW/Kmf1ndUu69oCMS50h9ixjzQIPa6kAjwKW7
	73wWpTb/ZP+crYfGjGicrnuk06Ud0tcf9ky9RsWDbY/AWF/ZW3XZj4SsZzGUuS9VxxGYwY8x24soU
	tz/fwInVbToo+U/h1VtRyxs9/GuNnfqKSDq4MpZSYKL0wFMXcn7XXKSrGH5Zf3MTQk/DuOFWyq2c2
	eI1a8r2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEZYd-000000065pF-0kP5;
	Sun, 19 Apr 2026 21:19:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEZYZ-000000065oS-3Etj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 21:19:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C962F43ACA
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 21:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9B7C2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 21:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776633593;
	bh=z9YbvWBNcBN/kiRFkQ6KPbSsQhW/tBBXUVGnpF4Bmp8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EBLgetj9NxEaAOYhlFeKYGK4lGLnbVmRASOWvmVhBRsyIPQhrMOwZ5KWaLROJdv5k
	 MA8IG8AJWcIYLALvFc1iS6yV97tskuiGJD0BHr5wfBXSziCGItvYeGoMsFJ2WNm+nm
	 moZklfet4zaMrHYF4XNT5uAQ6NKOfB/Va66TkwYqHAg8ExLX8sKH3Iz3RNAoNLrVFq
	 lmfAsD4BLMVHgBnx49J5/Q3pP6N2z1j+f1Oy9sW4hQHtv/c9mJManCMx2URT7Gudo9
	 YTdM3+LSbdnp2+xEpZJU9eJ3qQL23cOoPulh2d5cxsWThnqO/EF39rnL47ZaZ9J5bp
	 afbCo17nvO0Zw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so3438929e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 14:19:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8zB0gQ3JKItD9yeKb02Bwrzrh/i29VtrYmKTuGLgPKEW7Lgfn/eOkRYlwd7rX5o70NzaQFygvjnsmmPQ5DC/T6@lists.infradead.org
X-Gm-Message-State: AOJu0YzjN7I+3kBPgNwhT8RDXhWPMfVSb06X1Op+CPhBHhOAffNUQtcm
	Hx5OrpNU9gq2VObeQJ3/me/Ljx3jCrZiuYFFDUtTJUNukwI9xV0/hZZKiCofbIOudrkUzjLTpV5
	iBAzu/dMxr6M13iPgsC1k9C0JZXDAVMI=
X-Received: by 2002:a05:6512:ad1:b0:5a3:ff5a:d6c with SMTP id
 2adb3069b0e04-5a4172c756amr3690813e87.14.1776633592265; Sun, 19 Apr 2026
 14:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-4-eleanor.lin@realtek.com> <CAMRc=MfUh_OuxS4SC6QzSOg_PMNc9i9crGYgBASrbVUgHDHSCw@mail.gmail.com>
 <52bf9ce2b7754af8af69b0afee0d07b2@realtek.com>
In-Reply-To: <52bf9ce2b7754af8af69b0afee0d07b2@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 23:19:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLkpS-T9yK=ctSwpLvXkj7s7ivmwu1KKwzy4KS40LVYeyA@mail.gmail.com>
X-Gm-Features: AQROBzAE2Y02h6LgmsVRXzFjBD7tYm8hngF_phTFw6dYL2PfXyxOmjtiC-kfPNE
Message-ID: <CAD++jLkpS-T9yK=ctSwpLvXkj7s7ivmwu1KKwzy4KS40LVYeyA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>, 
	Michael Walle <mwalle@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	=?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>, 
	=?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_141955_891766_89DCD246 
X-CRM114-Status: GOOD (  16.76  )
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

Hi Yu-Chun,

On Fri, Apr 10, 2026 at 11:39=E2=80=AFAM Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=
=90=9B]
<eleanor.lin@realtek.com> wrote:

> We did look into gpio-mmio and gpio-regmap, but they are not quite suitab=
le for
> our platform due to the specific hardware design:
>
> 1. Per-GPIO Dedicated Registers: Unlike typical GPIO controllers that pac=
k 32 pins
> into a single 32-bit register (1 bit per pin), our hardware uses a dedica=
ted 32-bit
> register for each individual GPIO. This single register controls the
> input/output state, direction, and interrupt trigger type for that specif=
ic pin.

Isn't that attainable by:

- setting .ngpio_per_reg to 1 in struct gpio_regmap_config

- extend .reg_mask_xlate callback with an enum for each operation
  (need to change all users of the .reg_mask_xlate callback but
  who cares, they are not many):

e.g.

enum gpio_regmap_operation {
    GPIO_REGMAP_GET_OP,
    GPIO_REGMAP_SET_OP,
    GPIO_REGMAP_SET_WITH_CLEAR_OP,
    GPIO_REGMAP_GET_DIR_OP,
    GPIO_REGMAP_SET_DIR_OP,
};

 int (*reg_mask_xlate)(struct gpio_regmap *gpio,
                              enum_gpio_regmap_operation op,
                              unsigned int base,
                              unsigned int offset, unsigned int *reg,
                              unsigned int *mask);

This way .reg_mask_xlate() can hit different bits in the returned
*mask depending on operation and it will be find to pack all of
the bits into one 32bit register.

Added Michael Walle to the the thread, he will know if this is a
good idea.

> 2. Write-Enable (WREN) Mask Mechanism: Our hardware requires a specific W=
rite-Enable
> mask to be written simultaneously when updating the register values.

Which is to just set bit 31.

With the above scheme your .reg_mask_xlate callback can just set bit 31
no matter what operating you're doing. Piece of cake.

> 3. Hardware Debounce: We also need to support hardware debounce settings =
per pin,
> which requires custom configuration via set_config mapped to these specif=
ic per-pin
> registers.

Just add a version of an optional .set_config() call to gpio-regmap.c
to handle this using .reg_mask_xlate() per above and add a new
GPIO_REGMAP_CONFIG_OP to the above enum, problem solved.

If it seems too hard I can write patch 1 & 2 adding this infrastructure
but I bet you can easily see what can be done with gpio-regmap.c
here provided Michael W approves the idea.

Yours,
Linus Walleij

