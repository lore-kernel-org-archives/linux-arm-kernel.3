Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC943CF2561
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 23:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpyxSY5WvJi0HmvpcS1llhG6ee+xNYXsAMhYQ5ST4Es=; b=PHUEhtf1ZiZ0KyWOsmthB5fV0o
	O+yZ9ZsTNM7ZI9V/zOnCvOQM0JtRUaGukS4cyZWm/OuEUVNSL3IoQg1X9TDRxSUWhE8rFKCv858j+
	4tv/rVYZUFCmyxawJ/3IXA4u0Sxux0TA1ulRi/JjoKv3frzMqRtbrvvYkbGaL1YtBOLykDjJq0oKC
	tWPvLG52u7AVP6Bum1GFmvYAk1EUst4uPuiUbrw6b8GRjKWqLL4wlozofBVEiPi+16lx70vxIAJl9
	QXIHxPf9KlEvFK1abT6N0BW1JcBC14AmvDhd9VniG0lvIlrcD0ZFIsTklnJSwj4gsfkrOh8ZPlFM9
	s7QTQsew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUkD-00000001DIS-2XlJ;
	Tue, 18 Nov 2025 23:04:17 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUkB-00000001DH7-07bQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 23:04:16 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-640d790d444so5466228d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 15:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763507054; x=1764111854; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpyxSY5WvJi0HmvpcS1llhG6ee+xNYXsAMhYQ5ST4Es=;
        b=HtEPdHQHQLgopvvbsytwou8Lfwvm2aEin+jN578QE6hQetJHFmBBFqniRTPw11TBOH
         fR3rxEVtWFWSmhZz4CMOXTXOETmMbilGGb5KBCC4/d525U8T0caAcY9vOL/xLi+aHDcQ
         Z3AflI+W4+vyXYILqydJiaw/lGrAneJEAKSK5q98BmzZqH19WYAcOxvMcfNnXapTtIf3
         AOzWK1CLp1FfwfAn/RqmNq8LbNQFTlCcAdbMIBZMi3qxk2gIjl/eE0p0Ww14EjARweOi
         oVcUOtNHnsAOm/e5lLQikHMM+xTEYg9Pjal0jwzrxk/UDDdG5944yh6yKF/pkMuvayPt
         cqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763507054; x=1764111854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DpyxSY5WvJi0HmvpcS1llhG6ee+xNYXsAMhYQ5ST4Es=;
        b=WdPIFaUwlH5XAclc5PwMOrsTGuz8EfWW3SeV/662CYVHNfgD5uQjpp3AYz0EoD93Nl
         5HZekmiRtT6qFFf03I6R7mdI/rIfa03hLpTyuvtVzc4OpmahTNhvudkN+PMuEWwo/YEP
         UG9VfI6T3pERe2jTPFFbUJV7peUROYhH+JsJp9Z6btE6l+ZLkMRKCdfjqacOw+qbxRTH
         vKLTCn1m5vwmXXt2lPy6hagBZx/naFG6q8MH5bjesfbRW7h5rc2T6dhOr+/9ayCX7/NB
         HZRYD3BBElI8hIlS0F0dhQY/Vh08n8uSURGJ5v5WaBqtvnA7lygta5Vk8uwrBHDDjQo1
         BYzg==
X-Forwarded-Encrypted: i=1; AJvYcCWEjtSZ81tjczyKTIZjOk+kqGU8goEQht+F/pCvYx2qk+23SDTz1TDCki/rTIj54Rbzt9KmBut58enNPSWicuaL@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq7KOXVwp4Le+UfuGV2sd9sR85n79LD8P36HUqTkl9vrgP/w+s
	EVVqOTJ8j3HnsOPTpclCusu5y0q1BrD/CycH9Ga+8d+qFjYg4OGngFqbXxXMRq8wlxfKWjl4nOa
	F2YxCxNSDuEgQ+nkIfX8p4fUU32UR3Doo1HalZDSdpw==
X-Gm-Gg: ASbGncsBwu+vQhqPsaqkr852W7wf09pMPUfRxhxhdZRLbFvGllxy13chWxYk/f5M1My
	ydvbbeRdXH+qsRXAAKhtoiIe5zD8U1u7rJOP8xbiQ8ytFEJOAte2OP1/VLRZnkh4oY6YY6KbvSf
	ZkC3T/itmxbPdbKv3NG/PNH+SnfjRvAWdRcFnPMUFmxFKWnhl/DAG/w8PqhshXjKNjaC5TTh8Lm
	EyLt5Afq4k+Za8ZSyTy/dY68B7dmUXMYm0/RJ//PEVdc2tWXdE218ABYDItVn5eyM6REz/1dt/Q
	QCtbnw==
X-Google-Smtp-Source: AGHT+IELB+09mf9khX/1UFEnPeAm1lrX0fgELMFuofsGX4R6IFFA6KPF6dwvDM7AxfFurD19MW+eZHnF90lveBd3oI4=
X-Received: by 2002:a05:690e:155c:20b0:641:f5bc:6984 with SMTP id
 956f58d0204a3-641f5bc71d8mr9451804d50.80.1763507053863; Tue, 18 Nov 2025
 15:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org>
In-Reply-To: <20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:03:58 +0100
X-Gm-Features: AWmQ_bmTrpDRkDleDNb2XMlOjcgLl6u_OW5kVkCUfJvH2chNj2IWVVvyVcdyP9M
Message-ID: <CACRpkdaFq9PBxvxG2t6xDTN9M-7psvo=VDTCpu_qhvk30zFrMA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: Fix AIROHA_PINCTRL_CONFS_DRIVE_E2 in an7583_pinctrl_match_data
To: Nathan Chancellor <nathan@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_150415_082264_E1630C49 
X-CRM114-Status: GOOD (  12.25  )
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

On Wed, Nov 12, 2025 at 7:44=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:

> Clang warns (or errors with CONFIG_WERROR=3Dy / W=3De):
>
>   pinctrl/mediatek/pinctrl-airoha.c:2064:41: error: variable 'an7583_pinc=
trl_drive_e2_conf' is not needed and will not be emitted [-Werror,-Wunneede=
d-internal-declaration]
>    2064 | static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2=
_conf[] =3D {
>         |                                         ^~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>
> Due to a typo, an7583_pinctrl_drive_e2_conf is only used within
> ARRAY_SIZE() (hence no instance of -Wunused-variable), which is
> evaluated at compile time, so it will not be needed in the final object
> file.
>
> Fix the .confs assignment for AIROHA_PINCTRL_CONFS_DRIVE_E2 in
> an7583_pinctrl_match_data to clear up the warning.
>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2142
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs=
")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Patch applied!

Yours,
Linus Walleij

