Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8618BCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 08:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzIdYM+jt7Tm5Uc0vWk+e7hcdztHdOIk7pXCG5DPn00=; b=llv9LfpW9Z/NrRNmeEjQZw85Vz
	zBG11d81ufytIT5IQNDZ+q47gGsnQX2gKb4hwxutX2C08EE7FNmJcc5k0ol7AfxDWMTcSOjahbZdV
	N8L5mVShca+3wIRQ59lwazFAmCu0Kb1l8WjjROjGS/Uw1n7+4YdQVtaHzFVKysIEIR6clVhcgc3Vs
	nRdmTBvnzPdVb7ilYXP0BjNR53QG1Kimo3qjiddHRsceb+T/iMTFaeiCjlSz9QcsXZ+xfwjoRLUQO
	Ij8/EXQEvzszdoeH6t51jcsFEw5Z7IMSgNI4g5Xj/I9w2Ga/Q7FMfE8BPsFfYSKg+0xYnYUvmsKXm
	uQvTid1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sKY-000000072kU-12U4;
	Wed, 01 Oct 2025 08:36:58 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sKU-000000072jX-3d6q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 08:36:57 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-373ac916b35so3442071fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 01:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759307813; x=1759912613; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzIdYM+jt7Tm5Uc0vWk+e7hcdztHdOIk7pXCG5DPn00=;
        b=IYHJA+DyQxj1zZ4ijAYX6w4Eq5OOLxSQnAgu2O0jW1peQerVb2hNPP6Elh0SCKtmtf
         7UsShzJ/RcBpB1gbxthChuPiYj82MIwOIPtiPAe2PCVfgm2ttZnQLe3ZzXFy+M4/GuOO
         UtRhWKv4z3kPQrQRAlx6ns/zgohErjRyyO7IyZjS341lXc8Ja6PSkG2FyVtscwQrifb9
         SC1ZGzvKMOZpc68tXEgE9PiZnv3S06WN+RcVweEPjiN9AX6HKgRlDmduvHrQ01tF7pLm
         pnum0d2lVdUhbbRwlu8U13Lgzh6H4Re0woRd3H8CUqilXrDQrC0yM3u4ru8DnC9IW/Ds
         IMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307813; x=1759912613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzIdYM+jt7Tm5Uc0vWk+e7hcdztHdOIk7pXCG5DPn00=;
        b=l1rIbLceh4YxKbF4B0lMxZLE0YfpWmoV5loUqsKhTvFrP+b3DsFwg9mlfKQkdN6KH4
         IRlegxpBEDhVDA+8ZKpWchtXToT/H3sQYUMJ/d3ZlgigI4VL/xymmNY5jR+M+wbBCdZI
         1xkaKyLWrlwTrWepHbBEBaFXUauh3iB6XdpYqoX7KTg7Vga5z0owwUCVcejWDE9tdaIA
         92O9VnIBl84tJmwiG0leLmwXnrQeph00kFyqOzYXr4ez1yLyYqe4q7XguNWJyqb08S32
         r2IiBk4FFO+pewzJ6Jk1UCbQUdV85LYeenDgBwnZyhN+FjUuiFre0Xojq0K29+Z1vVxC
         Lgxw==
X-Forwarded-Encrypted: i=1; AJvYcCV4NI59nWgppD1ItzFM7JQQfxGFbwAi/922Dwt2wDCG9ZY10PkrBbQmBqx2Syf2LLIT4h30hHSMY85pEcUyjPzT@lists.infradead.org
X-Gm-Message-State: AOJu0YyGtopUGgKIuK7jLt0j6TLvyeWjw1WV3FuLAsf6omWPkyYrR5DD
	lcboIhtylFkwT5krvzul0xuPnGahjMGAK31YdBQ7dNhTH+sK8gy2o3iDFdZZITu6UH31tjnGNW1
	G0jGG3nBoW4vbBIXKPo8EBqAuHPqc2q3Pw1oEPsNlng==
X-Gm-Gg: ASbGnct4XTOqcrcmDaTY6SLwYY502CtbsJaTfTYmnbTy2q/ixlRWumJUHNPyHNdeHdA
	Bzs6JbMHbry7+4NDsQ2TcTg6ju/cIG+Kqr7bJRrnXBce+9AkSOUuc4UDSYAF7IO3EYvuC9bD8n3
	2wqtgNwSGXNHjC0xa2qL32nJJA1qPACOa2SBl4hBIfi2X3eu9zz4tfe6pHfHLbT9daF0kFaR8KH
	mV8dDtDrOVxiAUAe7lCKnDRzj7V+r+5yIE49UznUQ==
X-Google-Smtp-Source: AGHT+IGR364l0fZkqCbX1kIjKIvYDxXIcwBHw+lqJUfFGXSzirJ8uNvUMS79/HggJOLuN/qEVcxWH5dtrV9+RyqdghU=
X-Received: by 2002:a05:651c:210c:b0:357:ccfc:64ac with SMTP id
 38308e7fff4ca-372fa205204mr25896051fa.4.1759307812626; Wed, 01 Oct 2025
 01:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com> <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
In-Reply-To: <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 10:36:40 +0200
X-Gm-Features: AS18NWDoMdvnOzF6_wDEnr52XVC2ihE3QCB2mnLOoQUz_n36xv-rRAEh7yvMfRw
Message-ID: <CACRpkdbo88o1g_VCp0+C9hfi1VQkP99x2Mnkw_DTctBEtVAa_g@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
X-CRM114-CacheID: sfid-20251001_013654_928289_9BF32D26 
X-CRM114-Status: GOOD (  13.88  )
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

On Thu, Sep 25, 2025 at 9:52=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> This is a link to the discussion with Andy as per Linus Torvalds'
> recent request to use the Link: tag to point to actually useful
> information rather than just the patch's origin. Linus Walleij doesn't
> use b4 so the origin link you'd normally expect to be added
> automatically is not there at all. That's probably what caused the
> confusion.

What? I use b4 for everything, I don't know what gave you
that impression....

I have however removed the automated Link: tags generated from magic
gitconfig hooks as requested by Torvalds in v6.17-rc5:
https://lwn.net/Articles/1037069/

This is also mentioned in my pin control pull request from yesterday.

Yours,
Linus Walleij

