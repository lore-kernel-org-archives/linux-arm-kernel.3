Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BE7CCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ag4RpPho5sULiazlXNA0y7JZ5ZSjgCMfktnwGNRil1A=; b=XyMwsee1yrGf9fRobJwovpprzj
	ORcWr8FcziPhkB9XIgoyz7QxNoNbT1LDN2YoVR+fPEqmG1ZaS47WB0TZ2Q4E6XlFIxBHPppo2Ulch
	mGL6Cp///1napZShyzgxjIJaFz/SIBfO31U5us2xRxOFHWBb7wrhYB8tBqbkzWx5rTfNLD2ijfLEY
	DnTDWV9Yhg4l0KbXXx2FWhILk3YXtuM9yCp1sCzgaPaswAKU+eFDenCYMi/u/5K1rbcg3Zwuw5jRt
	u3oX2TK5r0qql1agzJY8mQEgxwQNg9aWxDGIzr7JHBYudJlKoaEofzsRIhPFrQbW4/DPiBorMOnh5
	IOGRTbNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgKa-0000000FfYv-2Zan;
	Tue, 28 Oct 2025 09:49:32 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgKX-0000000FfXw-3FFJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 09:49:30 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-3717780ea70so75005531fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761644966; x=1762249766; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ag4RpPho5sULiazlXNA0y7JZ5ZSjgCMfktnwGNRil1A=;
        b=Ws8+OYwlKrIl53hF4HUZIe3Q1l4pORhYHHFcAoeFh5bkgoANkZRm36uzBc6K/EBVaD
         t/fMvV3ByC9YtxSTHPcHB63kS7bMQ2iCRg5lg2o54M5pkKJZJ5YnlWxZpGVte02ViTQZ
         BQCt3dHc5PEqnIe0FQiEzo3rYGFtFQRH2KNI60OJBfqmZVTiUTxK4fNK53WzABKBoJZy
         BXzr51qF13CU3vxfCLpWoBFLYdZAvHndpcIrZisa+p12tY1r7Z3L5TBDI+OxmeOf55cA
         RNcpFPD48M5dar9GAracvIdRKXoVuC1aQqs9j86rE7AOOOOaFL/tU2ARv9CD+PPi356N
         d+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761644966; x=1762249766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ag4RpPho5sULiazlXNA0y7JZ5ZSjgCMfktnwGNRil1A=;
        b=mIsTXo17LcPYrap/7G7SAVIPTBQnaLrI/pQABA9Bi9TCvAXW7tL3KaWSUX6sYnGmzv
         Uykqab7kFutSuUHz8FiybmAvJfLp4afB7qw2Hpf3q/tqWPsDJppB8/Hl77PfwofEX3+R
         HEa6mSTv8NdiqaxfScpTV320rIvBPuXxAcKyGFGVB3IKxZdrSus8/+/CeYQzvApjDD0S
         oEaxMK0FmAqle8fX+QpE51EnkhoRpgn6sA4ZDbTzokIXpcNa5V1/Q4ZFuzHiXAPy96+i
         /RE9M3U6QrQJ5OIDPAe/tYINzO+n0V1dKH6sTbwi4irejfcBEeKQgXVuNPfXt4U+Wt3z
         0XNw==
X-Forwarded-Encrypted: i=1; AJvYcCUGZu3ya8h3CBZkN/Uwd8FwJ22B9eKbhWAX3dUpFjaqFDPThghTxn5CCiOaO6g1HdeziFBKafEt85Z/QMQtUONG@lists.infradead.org
X-Gm-Message-State: AOJu0YwBNNTP9S9kiuG0yqd6WgZCYWxHzOgZkRIZDdC5NigXyMksMumy
	UQAbqlFpGTySMGt/Pyc1XZOh1QU5E1CA7sDt6mQkh46WTTyjQp5hzPVb5FYC+iCaJPlxy9JAmSJ
	oHCCJQ6u3c10Asx4iYKSCjH0Fds4lzx7rcR/5dLmYeg==
X-Gm-Gg: ASbGncsjPTG0wxLFQk6ZCCE0Ibr8kCXBhg1SmnSu6+F3Ky3bf4pUeWhQgod2t72jjSE
	0BCoXdVDw5UNniJRRSjOMHj3Mzx1SHOaA8HY50lIbfJXhU92rUduMNa84Fh8ucM7DPjcYbbYqwN
	BvFcoj3aFQjP+2X0Et00ytpTMdsF9k5Vqo0ilhQwQaIL2QgH7zM6x8JEUFdgl6Z0xwFAIsQV6WT
	4Q1EAj4Wz9KiNC9Q9cvPQWDrwd1lPe48GTSOjRaBX/GjEit9+bPb4aBfBp0
X-Google-Smtp-Source: AGHT+IHLnbuiTb17yCojPLzTfDTPTsYUvPEhpjzcDmPys9LqE0Vi78zD5Ee5nCAV3CJXyUjTEm0Hy+cMggR26FQ+KH8=
X-Received: by 2002:a05:651c:254e:20b0:378:e8d1:117 with SMTP id
 38308e7fff4ca-379076aa8b7mr6977841fa.11.1761644966332; Tue, 28 Oct 2025
 02:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251028061345.3885632-1-gary.yang@cixtech.com>
In-Reply-To: <20251028061345.3885632-1-gary.yang@cixtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Oct 2025 10:49:15 +0100
X-Gm-Features: AWmQ_bmvf5Ur8d5O7ggkU8MMUQcJO6q9gUJ2SA5XsMYb2o4yAVo6574UPA09OxU
Message-ID: <CACRpkdYdQa4=4JvBWJcRv0X_A0PnkQpZQQ8NTPzF0ntdt9qX=A@mail.gmail.com>
Subject: Re: [PATCH] Pinctrl: core: export pinctrl_provide_dummies() to fix
 build error
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com, sfr@canb.auug.org.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_024929_823399_2A323F23 
X-CRM114-Status: GOOD (  17.49  )
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

On Tue, Oct 28, 2025 at 7:13=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> If a pinctrl driver uses pinctrl_provide_dummies() interface, and
>
> is built as a module, then an error occur as follow:
>
> ERROR: modpost: "pinctrl_provide_dummies" [drivers/pinctrl/cix/pinctrl-sk=
y1-base.ko] undefined!
> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[1]: *** [/home/gary/workspace/upstream/kernel_upstream/Makefile:1960=
: modpost] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

I just deleted the call to pinctrl_provide_dummies() from the SKY1
driver instead, because I didn't understand it.

But if you need it, put it in a series with this patch based on the latest
devel and an explanation why it is needed.

The only other driver that use it is the Renesas driver and it uses
it like this:

        /* Enable dummy states for those platforms without pinctrl support =
*/
        if (!of_have_populated_dt())
                pinctrl_provide_dummies();

I don't understand why you would need this? The SKY1 has pinctrl
support after this patch I think and since the arch code in arm64
requires DT, it seems fine. But maybe this is for ACPI boots or
something like that, so you would have this driver but there would
not be any device tree?

Just explain it in a patch and we can add it back.

Yours,
Linus Walleij

