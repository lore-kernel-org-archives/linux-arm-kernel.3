Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4633CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 10:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9f+++oJEJogx7iunr2Qwd9nxHYBvpJqjgZ7eo+XnEyw=; b=mwi9yNU980HlM7+JKjo5bsD5PV
	zsw7uyMuNLs0NQgILUjugEIyENiLSNV5v2WqPK/RgpJ//CatwZYwM/gmn6EQOt1a5JVQcQxymaK/0
	BrP70wgwghJOHEuGMvgSu0OHO/WELu+XO9nsWLrBARgh6/NLNYDUdlUFgKyTi28UGSspW8nzEwIt8
	yyk3k7JSkS5yBa0AIE/92aphqGvW8ZZxFRQzkoNVDBTTPK2ssk4GxfewQUFxiWlCedts2h0d9GI+U
	kjlYP4X6sISoHVMqs1AtHR4DXIIRowNxn0tEMyPLO8FAYM+Dk17Q3PUodPi6v0IR9f8qYtPvi3Ofs
	zKjkOI9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTMf-00000000wxy-1Khb;
	Fri, 05 Sep 2025 10:08:17 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRrD-00000000Nnz-1zxH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:31:44 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-336b908cbaaso16325371fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 01:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757061102; x=1757665902; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9f+++oJEJogx7iunr2Qwd9nxHYBvpJqjgZ7eo+XnEyw=;
        b=hKa/vFb+iyXMVGVBmoXxUZBIyvzG/38kQLHzm47oaIaKNbnBcIRDoBNn0kiQCzR2xZ
         t+trPkYTSfanQ+InFD/0Juzm5jYCHI1XoIf/7wRkQ9YIhmd5u7hQ4Z9RdLZikwH+wYHZ
         C4LrD6gUeWT5Mr/4T2lr2yhrhOSjKZJ5/Fyi7/UlsWqp/7z0JPU71VTAd6kP7yD5bNJQ
         HFvlf5kov6uvIcEgdGWN+Oxowu9WQvMfDpHEJg4iGxtecwqRhJIa+IlCwe/oLRXpR2C5
         Bb61x4e1n6X3u7nwCxDGvS8vhsf60ju5+NoTCfsbqrLgvvdZs+xx+BlKR1VlsT1ORkgs
         iCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757061102; x=1757665902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9f+++oJEJogx7iunr2Qwd9nxHYBvpJqjgZ7eo+XnEyw=;
        b=E32iKU7+6W/Tr+/sql9rFZW3+iZ7Jn1wQUaFYIlLNCsolV6tEgrUlyFn+CYow4xJY1
         PpVHE1WZhkm1KQ4YKpNLvEybRicAJ+TfpUygdap9NCU19dTX1EuPqW33mIqh5O6Pa89z
         21R8XsLrpAxbW73O8HMsUNFnQe+SdThlQRd4fpvp/Vh0KbymJBs0xha3H9SYvVBae0ch
         bu7yhQghf0NtT1EVv2aNnPmPlp4QDCI7Vjj0uGU6v/S0s0Cwxgi3QoX54xe7Q1enQxuj
         XYqH2ROTz+6UsTN+bYPSa8LggINiIr2Em+/4zKfnZCkZ99OvXZtbTL8Ra0X2SzrG4ivh
         o+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCW0NckmhyzarPnBIQWr4uvB67lSqzy03SZSA97rKl/mCGtkU6+L7pI4ayiUvl7ujUXvPo6Phx83Qw7YlNpIYTzY@lists.infradead.org
X-Gm-Message-State: AOJu0YwfyiWFQVdb3ObwRaYKyKKVXnGL97scOLYe12xPhR8PY5gLmBBd
	0mlZs9j19Tqvt54N5G7G9WSaxJQMZ7A5T9odXRTaW7YsNKIdEmJ7KCi3xMYjEIDmbD1k+j+UG/h
	RBBsxSxgOkT2gMmBzKHhQaUyugAdWPQj1IUSDgGdczw==
X-Gm-Gg: ASbGncvaCIVLZRsV665WdBZ+mvJWI7HipA66iSStSseGtclrzYfftlPv9cL1u2CbWJb
	sNf2N/EctoXD2izMAd3KbnHvkwmv9smC33eQnX54trf3rJEKf+drSC84k6iNYzyLviA5g1dyeS1
	kyJaoYxZ9NMgnZyo4LcGlZP7OF+pG455SKSnWtDRe60kd+vtqhLUhKE2ntDJqgnyMFQIXz0ugNA
	K9NSN+3iTfGh/OFlg==
X-Google-Smtp-Source: AGHT+IHp+LpzTnlm/ik4qcZ3pH7JoklV/VwhpQ2B9YB70/pzgPXeMXc+xQDV0rAGZGWmglV837F6DBjwLozLyJEQpSM=
X-Received: by 2002:a05:651c:503:b0:338:3d1:60a7 with SMTP id
 38308e7fff4ca-33803d165d1mr29380981fa.38.1757061101675; Fri, 05 Sep 2025
 01:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain> <CACRpkdZ9EHoHiKit+T-ur0xDKMEoN_=TydzTfoggNBQGdra2bQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ9EHoHiKit+T-ur0xDKMEoN_=TydzTfoggNBQGdra2bQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Sep 2025 10:31:30 +0200
X-Gm-Features: Ac12FXxg4bL_8E-D_W-eOel8gQZzsIXFhPs68sNRK9cduffuB3-nHYnzZaiCCko
Message-ID: <CACRpkdY3_ifPsQOTqa2e-kHR24Khy0axrZ=K+vO4OJB+FjdB2A@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, AKASHI Takahiro <takahiro.akashi@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_013143_516207_3B617B6B 
X-CRM114-Status: GOOD (  24.77  )
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

On Fri, Sep 5, 2025 at 10:27=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Sun, Jul 20, 2025 at 9:39=E2=80=AFPM Dan Carpenter <dan.carpenter@lina=
ro.org> wrote:
>
> > In SCMI the value of the pin is just another configuration option.  Add
> > this as an option in the pin_config_param enum and creating a mapping t=
o
> > SCMI_PIN_INPUT_VALUE in pinctrl_scmi_map_pinconf_type()
> >
> > Since this is an RFC patch, I'm going to comment that I think the SCMI
> > pinctrl driver misuses the PIN_CONFIG_OUTPUT enum.  It should be for
> > enabling and disabling output on pins which can serve as both input and
> > output.  Enabling it is supposed to write a 1 and disabling it is
> > supposed to write a 0 but we use that side effect to write 1s and 0s.  =
I
> > did't change this because it would break userspace but I'd like to add =
a
> > PIN_CONFIG_OUTPUT_VALUE enum as well and use that in the GPIO driver.
> > But in this patchset I just use PIN_CONFIG_OUTPUT.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> I tweaked this patch around a bit and applied: removed the second comment
> in the commit message and wrote the docs to be more generic since
> in the future other things than SCMI might want to use this
> config option.

Then I thought about it some more. ...

Isn't it more intuitive that we rewrite the curren PIN_CONFIG_OUTPUT_VALUE
to just PIN_CONFIG_VALUE that can be used for both reading and
writing binary low/high instead of having two different things like this?

I will look over current users and maybe propose a patch.

Yours,
Linus Walleij

