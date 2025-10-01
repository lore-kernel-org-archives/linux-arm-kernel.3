Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC04BCCA474
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8D0lPsjedL+kyXW7Dr+b8bXHNiYNOO4VOFO0oJ6yKL8=; b=1Mpu/sc0DanpsRPIKZUYlqt0QC
	KsA8QTf+EZlMxTCl4/VnGWz1mk0n6/9UsgiP8kWCvIYHockukOyZnf/E03IeRiWOvCASnOUoDeqkB
	jFsDGmUpf2ZpByKtbqMlv+p19RaWvfbYmZVr6apyxDIdj6xQLVbMkcjHPswOGfyyxYKl/XCYrIOqk
	p51u+xMItKNCJ/U8Qef5bMW3s4ERPpY3qAkuqGx8BvMST6nX17alo4XF/GMAVSxPvYVI9DEH48sDE
	Pejf2Irh+eUue+Yf8bOM5EkGryGcc5cGXbOSljNUUJzxwl6nInOZ2KVhhw4xS6Ox1YvbMTiPJFWI3
	nKCsQEYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sTy-0000000744W-0oXT;
	Wed, 01 Oct 2025 08:46:42 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sTu-00000007430-1Rct
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 08:46:40 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-586883eb9fbso4565999e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759308396; x=1759913196; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8D0lPsjedL+kyXW7Dr+b8bXHNiYNOO4VOFO0oJ6yKL8=;
        b=cmZBCLmCEnm035Q8M1schV2ZDMKm75Cx5kwxbXT98bnpIcslX/odYvkTiuDKevtCvR
         K4gB6XE/dpqX8FWHu9Ff82utE4buzrEQSA/HXBM3mq64gZRK4DWwbeTOVive2TkQcfY8
         9wSKVSrzfMUdqEZNU/qLSwZVcFv62p5XoM6qW3BX7dK2waxZDPjSMkieAHVKbLC0lzpV
         RKBbrFjyBQF9EyV/F/ItU/itlPmPX4CC5/bYyyMrYF0CkqAwILC6lVtCa4Pb8MADeVsI
         Uma72RRxc86ox5JdPb/wr5umIKuz0LMX6m55RMtD4V9tPU9lHrw66PJXQaxmpPhVH+uJ
         kkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308396; x=1759913196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8D0lPsjedL+kyXW7Dr+b8bXHNiYNOO4VOFO0oJ6yKL8=;
        b=DdqyH222Rl1lmIVP6Lv4N2giKQRXhCnE2yUwOOIfQl8rviF3MH8/MBVdw6pSS6bTjM
         IBxIyXsiTL+wmYdhZQqKTZRLShT6v/8NZuHbvYwqHs6L+GRvusDlWp95gWN+n8tu9vrh
         wLR7swi4LILbfAZhxXbdQ9QyHTPNLyAqv8Y2jae3RHOLw4dBbBUUyhdRbJbBJrzIc8wN
         FJV28JuDmpIGdEaXdWBsGdFkZ7GITm9GOMaMESSlHqCAXKuByjU72J2zlcwCxbolARob
         LdujzVGpztxqXNDrW8b8kFBIBkDHlRS+kMm9Q44JyulHhzcIb4fhvKZAXFH0cqCVrPDX
         g+sw==
X-Forwarded-Encrypted: i=1; AJvYcCXX4PNRmluPZKXAZBXTOF2TWoHW3+AxtfUzuTz7lPIKAUKa2RrSyR1h6FGeQDDRJKsYTqiTQS5Notp9ledxa0wA@lists.infradead.org
X-Gm-Message-State: AOJu0YygB5bIRVLoSZaD779SIWrRjCYssRZotc3lxxC+CO9ubXrx1zmE
	c3fHtp8eyMCagidYR8LSAzmtWDZk2d07p9STkqnZOgWGyaonpY855kUv8rncF2Aq16NHUsQxZsS
	uMSbtN8dFlGM6aOs+Ih2jMG7HBEnXW97GYP6CuhGWOQ==
X-Gm-Gg: ASbGncviRv2qsSE+K0KCeanyzRvw35/v+O+7x3/vK0ehwge91HMjPpynqJh35puAlzu
	VpfwncLzX5Rno/JrmYlIjXFIZRlaQuqesUTymawE7QQH6KY5+Dj8a1Sg4j9LQzlTiDqdB6uKQjT
	iBAlzDIsyMdfmqK9ptJw3YppSAtXxYDQA+8YlML1+UauBz3nCupGDv4D2DBF5fKfd13R1pQY4YK
	CQ/Uk+v5iDCeOXyz4uMuXhjoszjWnM6Kb3IN8ruQmBZMvDFyJiRKwHopMdNN6o=
X-Google-Smtp-Source: AGHT+IFOdBqQ3obnIdTm7ru0JPzklPYFIUGqCI693FKE/9RlmuM5kKhUigWL4UNHwLKwqtrOVDs8F+QH4ORLFYFhoak=
X-Received: by 2002:a05:6512:ea7:b0:57a:6d7d:dd7b with SMTP id
 2adb3069b0e04-58af9eadd86mr760851e87.8.1759308395621; Wed, 01 Oct 2025
 01:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
 <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com> <CACRpkdbo88o1g_VCp0+C9hfi1VQkP99x2Mnkw_DTctBEtVAa_g@mail.gmail.com>
In-Reply-To: <CACRpkdbo88o1g_VCp0+C9hfi1VQkP99x2Mnkw_DTctBEtVAa_g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 1 Oct 2025 10:46:22 +0200
X-Gm-Features: AS18NWC0XlksXBppS2yCvWpBaDAShYUzQK0jJOB31RgrqudBkZ0MvZktkc5Xz8w
Message-ID: <CAMRc=Mf4kv03+cfB7up==PUJyxHH6U3hHF3q6iKYZWVOZamSTg@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Lee Jones <lee@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
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
X-CRM114-CacheID: sfid-20251001_014638_509471_81D4BE51 
X-CRM114-Status: GOOD (  20.27  )
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

On Wed, Oct 1, 2025 at 10:36=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Sep 25, 2025 at 9:52=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > This is a link to the discussion with Andy as per Linus Torvalds'
> > recent request to use the Link: tag to point to actually useful
> > information rather than just the patch's origin. Linus Walleij doesn't
> > use b4 so the origin link you'd normally expect to be added
> > automatically is not there at all. That's probably what caused the
> > confusion.
>
> What? I use b4 for everything, I don't know what gave you
> that impression....
>

Ah, sorry for this. I assumed the lack of Link is due to no b4. Should
have looked at git log first.

> I have however removed the automated Link: tags generated from magic
> gitconfig hooks as requested by Torvalds in v6.17-rc5:
> https://lwn.net/Articles/1037069/
>
> This is also mentioned in my pin control pull request from yesterday.
>

So it is a policy after all and not a "please"? Let me remove the hooks the=
n...

Bart

