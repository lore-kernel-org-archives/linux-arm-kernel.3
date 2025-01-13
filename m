Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F12AC02184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wK2BGx//zUz/XNuJSSzKnvYT5PA/aXDXBm8lXWbTas=; b=QNmjNrSOPvfmBm4vE6Q/g+Ek1L
	9KDLn8xN0LVkS9EMXa3vHMRVM8LVGw4CeSN/24yi06gdvjgnKSwI2o+yA+eaVcy/VoW0+KH0xD92e
	fp1SJhTUvCpZvsC8y39VYA6B6Pu/+qw0yDR20qa5UlwCGbzNYOy4zWiwIyMNOx44E4GBl1ntqQvgG
	j616lZ+QMdqtUPZIXhlDbt0OYkeN/gUwsdLTiZ8iIHRLcF4cyZJ9g3BDqSH0OFXYQqBPfhD7yvZN/
	ID19GJ1NgIhzWDGLrlEZqPEbaXRaJGDDGgwYvUSCfJPjIlQL9mGD+fQhacvobpiFpRNg/y1bycCrX
	O3ZxiIyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMkG-00000005jMQ-1Z5H;
	Mon, 13 Jan 2025 15:52:52 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXM2g-00000005YS4-2jZg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:07:55 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-540254357c8so4009732e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 07:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736780869; x=1737385669; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wK2BGx//zUz/XNuJSSzKnvYT5PA/aXDXBm8lXWbTas=;
        b=C6pOHdBhnwhqktvYph45ACSRi25ZTT3a5XHo1NWK6zLD0oBVJEKuMa5v6lRYsYQu3q
         xPafga6O3HbTtY22S4MA/RSj5+wAvHV1f/HVHlIY4rCxe7iDSrLlLpOVGz4c4wuAvffS
         drhc/S1VRhYsIX5ABu1Juef6/d2uUhQ4KS8g6yfoXfZx2hXyEuJk78Z1sw98I5WQ9iTI
         wME6b/JnE3kTAtz2F1UBAi2XOJ0L7tDRHe6rCRW6BRplAzwkmvqym70JqV30H5h01QLm
         aRXAT8Yyr+q5Wg9iSaFH0OJLbvJrHoN5V2ghwgyVPW3lCTa+zq6y6h76z5cMigIUwk+/
         OSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780869; x=1737385669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wK2BGx//zUz/XNuJSSzKnvYT5PA/aXDXBm8lXWbTas=;
        b=GsllA03D0eOasev2jfi3r7GwyZm9Szr+Gpuv2Vr9mk9TPmOJ2MU7YOzFfx7y+6ad8j
         16dBr6XxvpycqYnl/LYI9QkSsm7X6XDwHKwEHaa+T0CToKBUCpMbOQ+P1vi+LDit6X2p
         wjZiTiQg0e83VPstMNV2xQ8CRE3arUEfvBVCq0SLb15BVE9wZOMRTcK0ZdG0OGYfHUYM
         bhoPJUkOmlP5K8r45AbO+R8dGaJ7p1tHjjJZyEO4QBJ3kYh7z/NYDk8I+FeaPJrcRJzT
         KEqS6nNfhQpXxgzzOPbioQGPDXbQ5YbD97L/tKcdz+rCbLbzjV7wU+WE2AxuYN4AZS2b
         zMMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsHGemGmFKf8ApJpZQ+kAKu+MsRhXPkMtFXQBQhbLWzmqJ+5XfBJS2G/aL8y26DGKWNfUuRxGLVnqomN+TrzZF@lists.infradead.org
X-Gm-Message-State: AOJu0YxS1isOzuku9E4BUT92PqJCqlQa/xv/ESNowi3/SNuiYmUePCll
	MmaZx6zTFqbZymR//C2YWyenXhVv09OOhy1Umm8+QixjaTB5HhiQy30H3olgD+Jy6tCjGWesr2m
	ct83FxnQBs5zQ0SSdB51KWveSECnnWSGPwDdMKA==
X-Gm-Gg: ASbGncsaybKjl5LRwK9r8Wv5u1BE0e/ItDIjcXseAauGUWYB+YOM2nAW32BaHk0HOIs
	TFZLcVcHlmkhh0+pahyEYC/X4/6nWFqNEfHJz
X-Google-Smtp-Source: AGHT+IES3tZBy6Xs2c9tlrWY162TnjF3uWtTrphszdVGsSsqqCXRWdJUrRBTJwefuNL0CvDs1zX4DNXrPFBHB8nhuyM=
X-Received: by 2002:a05:6512:a96:b0:540:1f7d:8bce with SMTP id
 2adb3069b0e04-542845b9744mr5354221e87.38.1736780868642; Mon, 13 Jan 2025
 07:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
 <CACRpkdbfckBBW5W5sEvz1LwzdOvTKi_fi7tDu+9nPeKumYkPeA@mail.gmail.com>
 <lkxm6m2u25o4qfvpja7qsldqm7zjxejkn6d5qihyxbg2zvntwh@icvun74e6rll> <y74nrynys7srlwmtfzpjwklfkw33vijrnefjm3iyngn2y35mlz@joqsk74rwl2l>
In-Reply-To: <y74nrynys7srlwmtfzpjwklfkw33vijrnefjm3iyngn2y35mlz@joqsk74rwl2l>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Jan 2025 16:07:36 +0100
X-Gm-Features: AbW1kvYQ4bwujBVNetakHufjq4DsT8RTYbJHLkl_N2maIXPBhXD2T0GN-Pxhbsg
Message-ID: <CACRpkdZ1Joi+UW6EQuatx3Z0P0o+HULjwXB9vaAWOJxdBsNO8Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_070751_496723_1543DDA1 
X-CRM114-Status: GOOD (  24.97  )
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

On Fri, Jan 3, 2025 at 6:55=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Thu, Nov 07, 2024 at 04:34:36PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Nov 07, 2024 at 02:55:55PM +0100, Linus Walleij wrote:
> > > Hi Dmitry,
> > >
> > > On Mon, Oct 14, 2024 at 3:55=E2=80=AFPM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > > Follow the ARM64 platform and implement simple cache information dr=
iver.
> > > > As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it=
 is
> > > > limited to the ARMv7 / ARMv7M, providing simple fallback or just
> > > > returning -EOPNOTSUPP in case of older platforms.
> > > >
> > > > In theory we should be able to skip CLIDR reading and assume that D=
cache
> > > > and Icache (or unified L1 cache) always exist if CTR is supported a=
nd
> > > > returns sensible value. However I think this better be handled by t=
he
> > > > maintainers of corresponding platforms.
> > > >
> > > > Other than just providing information to the userspace, this patchs=
et is
> > > > required in order to implement L2 cache driver (and in the end CPU
> > > > frequency scaling) on ARMv7-based Qualcomm devices.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > I added my review tags to the v2 patches, can you put them
> > > into Russell's patch tracker?
> >
> > Done, 9432/1 and 9433/1, thank you!
>
> These patches are still in the patch tracker in the "Incoming" state.
>
> Russell, Linus (and Sudeep, Ard, Arnd), is there anything blocking them
> from being accepted?

I added my Reviewed-by, perhaps rebase them on v6.13-rc1 so
Russell knows it applies cleanly? (It's pretty straight-forward to
supercede a patch in the tracker.)

Yours,
Linus Walleij

