Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4298CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 07:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pmdbPSS1+PFGOQZXgEhCWxoqVsYqlqHhZMSV2rIROA=; b=lOG0gcpl74xMNFfRi5X2Fpk0Eo
	BBxlVrrKYJxBNpdJI94+32fTR2/dO5GR1ck8CgsGZe0BB1yPXLcXWFHhltRAdRdcESoh4EV660OjN
	Q3cotA+uClEb8haJ3L+HFt2KJf135VndNrbMlhmHMJpRazUW3ZMTlc5/tW3ANWvLog58T1alkQc1F
	EvstuEGYWYCAbDmkbtYCXZ49LJgoepSqHPUAZePVuW1b9jBDh81BL/h2MXhoX8v875qXRL9vWIkj6
	+VJQirl6Dz4W6OLGjEFdC/66VXfuZiwN2A5wkBe7mrNMTsPNLSgdbjqublPkHnxYZfdhMrMFC9xPF
	Z61JhZxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1glx-00000006sQW-1af3;
	Thu, 25 Sep 2025 07:52:13 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1glu-00000006sPm-1lM9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 07:52:12 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so663514e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 00:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758786728; x=1759391528; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pmdbPSS1+PFGOQZXgEhCWxoqVsYqlqHhZMSV2rIROA=;
        b=ugU6BIepYxuju/wisgMj536w0ag5lweJ7NLewyK3Lg4Z2bKhS+OLF3+/yoZnwmaw2t
         tvELut55mF4hbkqWhwI4Ts5uHWwPiZEiVhwYnzGpWUBDBsnjTOI1Zyluw2aqjkIF4kpT
         AgdXj2ktY/jVRmXPthVPv4RM2RjJ4q6zab8Ynu8bg/0BRbjLb9BtF7Q+3eoSBTpPAXad
         oCwf0rD7+oOpiNC2WE2Fk1BHei96Bdewt54ewdBdhg69dZHjH+ObDH9ZLjllupZ92stm
         DewhK/LuoQtb34GlJBV/zMe1/bLCBTkMbtadh2t8eoVkZr8IBEeuYRXTfxJt4Eou66is
         F6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786728; x=1759391528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pmdbPSS1+PFGOQZXgEhCWxoqVsYqlqHhZMSV2rIROA=;
        b=joHTg8tHDh6YK5MX9HF/9a5Xqe6ND/gfPP40KJU2kWlMac3c3iHd3hApCcnNqUpBCd
         HtKBNCqybWuxUTgN9Uz3PTgaLZXsBT1nDmRB71Ux4LwAmfE8suoPi+hK8Bvqs4zh7VJC
         LLqnM0SA28joYm5K6fGHuMLL5AVUnuOqY8iv+xtUKwYbv67jkywfc2gFNKNHbMObEYpq
         dkNsx26VWlgsKVjDQMhguDik82NKOi1G6v29rx7rAai0cgDe/96tuoH2xlRTTJeKst0A
         U6W7USux6Sa09k8iWWYmuX5tht10FugYPyZBNCkGTlYX96uQIbs/VZP+IzQkSRFpCCT1
         +0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUDr2r6+exTmXTaJIW1ao3GXh1ojCMn/BYiLhAMtV/w4ETnEVt/8q2C6FgQW2M3h4CWrOCNRCpHpA+j4E1Yivey@lists.infradead.org
X-Gm-Message-State: AOJu0YxlyeDRUMcUnCXglt/8pynwPd/9JwJ3Dqxezxasa2jEN9DK93IO
	PuwNle4b+mNInwDOIKXWPeY8VW4+5qgu7fPGfwnLQTtiTeMXLmINiCK0Yp8BDhV6LbeTUu5QQTH
	3M+i5vsoctos+YcTIRu/6bI69596s4wL/JjYCfaUMgw==
X-Gm-Gg: ASbGncuS42I679hCM38hOa6EqIPw0ekfidEiY7qqGK8rEH8SDxcDcL0j3rMGtjiWFVP
	WQrpXbJ/dR2ahNxxisH+Cnf4fb6zP1FwUFzuO77RuRy1lqIKCdnXjfx8wHNfpU79qV04PE6P7Ft
	0lBExQGPDkAY9c5t72DlIWJza0SSwiyXndPjSQ1+TivV4i8Ow6Cp0/5NHZ1dZ74u8TUWgF3YCs6
	IcLvDApl2qhibyu6Ph80B74wmCb/C3uoKQpUA==
X-Google-Smtp-Source: AGHT+IFjDFQMappKZZFROu+v6o3bME1MjtTxrIbJ3f6pWVz6MpCD55Lk6Fra5LzFmOtZoqCjtC5vbl0PRHtSU8AsH3Q=
X-Received: by 2002:a05:6512:3a8f:b0:57e:4245:114e with SMTP id
 2adb3069b0e04-582d14effcfmr700774e87.24.1758786728179; Thu, 25 Sep 2025
 00:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org> <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Sep 2025 09:51:56 +0200
X-Gm-Features: AS18NWCh67p36-1DiEra54BRYeOZGMgpqlB-NSoS3MdBtkk6GMB-z9-7UGdMnvw
Message-ID: <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_005210_709751_277192E6 
X-CRM114-Status: GOOD (  17.00  )
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

On Thu, Sep 25, 2025 at 9:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The (typeof(foo)) construct is unusual in the kernel, use a more typica=
l
> > syntax by explicitly spelling out the type.
>
> Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl:
> use more common syntax for compound literals") in pinctrl/for-next
>
> > Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1=
-13-9f723dc3524a@linaro.org/
>
> Looks like you (slightly) missed your target. The correct link is:
>
>     Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com
>
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Hi Geert,

This is a link to the discussion with Andy as per Linus Torvalds'
recent request to use the Link: tag to point to actually useful
information rather than just the patch's origin. Linus Walleij doesn't
use b4 so the origin link you'd normally expect to be added
automatically is not there at all. That's probably what caused the
confusion.

Bartosz

