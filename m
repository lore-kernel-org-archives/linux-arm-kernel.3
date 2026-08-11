Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EB0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5aYQFH5/TsJrfgH3Hmm3Z5/dP+xYZg4aYmTqt5N98Q=; b=c/jtzb+8Uy33HluEh71yK63h0I
	JHCWVeiDccjgY5nZdizzo381tg+/bSTFwrMzyFPN2OkedjmEU2hhg5yDyAvrgX7gXbl4BJorUSXI7
	wTP605DE7H8aiYFQoP9zyKCBhJWP63S4cnpiU0uRu/mV0iMiGwqF420ArDAwqWMdMLrx37gt6WGRQ
	BG6DNym5GFiZ/pBmpse9/3qXf71ldlPv8r+SzHrkS3w861BGi1nTjpGt9jJIsKaTye1TH0j+rs80Z
	LJbYx2auKIbfSOD3O1VBwtQBPx41G1a9sgLoPtqnCO7dDEdk23OP1LpELaAQgXFy+sDi+NliE9xLY
	lyJTCZCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtp4B-0000000ERni-0Lpo;
	Tue, 11 Aug 2026 16:11:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtp49-0000000ERnV-3cP3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:11:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 87AAB43E81
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 16:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703201F01558
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786464661;
	bh=s5aYQFH5/TsJrfgH3Hmm3Z5/dP+xYZg4aYmTqt5N98Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OTxVVdhZRmaj9tkDRGlrzrtpdSexA49s47RLI8Twy4X2WCBf/g6bn8k/1d9JPgFpL
	 y2GfduWi+ZR2W8AtNJ9UUWy0Jzlt8uVWTADljZX6LKKQGowZ1O0DA1++7yUSUqYfDz
	 xnWwwtP0KKRTajZsIx3bFfJDthsQ422gzilaNI+jKfGTXv9zd8+5AgQY0/dKRdhXYS
	 QwboSbp6U+VhfW9Nbv3/bE8sNBu3eyksQBNDp2KxA2kffHOk6uRtwaHx0uhnzVPfAW
	 8PqlY/j+Yxvhi2iP6MxW+SkT2z0UT56qMQcg+PDuGgNUoQpsPbwr0W8foY1KZST59P
	 GMhX9Wv+0tTEA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c16794450aeso136181366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 09:11:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoIQHbB2qBxIcVmz9Jzuo8igMBcxbWznqHXE4x+5gMd3MD97VAsiHY2E4af+6dLcn3GeJ82cFKW4NCr17n1Lvao@lists.infradead.org
X-Gm-Message-State: AOJu0YzndPXBVvSxokWdXFVuPGrydtAzaLZv3EOG6to8euBu0aLHTEa3
	hq2S7tP6zCmlrpfMbSefnuy0VGMcW/S24BkYJPl/fn+9mMgSNI1rWIaPpSM0Kq/3HINhwhrd0JI
	t2NgekQ1QPiHvu4NztJr8RdgYewcSGg==
X-Received: by 2002:a17:907:9344:b0:c19:49ee:19b9 with SMTP id
 a640c23a62f3a-c20ecb40d59mr83318066b.15.1786464659836; Tue, 11 Aug 2026
 09:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-7-6b09707c5fe9@ambarella.com>
 <CAD++jLk0LoOJk=TXin42AL3_z_7eVVkvMnYr1S8090C6A_B+dQ@mail.gmail.com>
 <DS0PR19MB7925690FD29D578D8AC5D10EDADE2@DS0PR19MB7925.namprd19.prod.outlook.com>
 <CAD++jLkUPU0eujvWc5Hn1tEu4n451LvkuGGT=j6OfirJENpRgg@mail.gmail.com>
In-Reply-To: <CAD++jLkUPU0eujvWc5Hn1tEu4n451LvkuGGT=j6OfirJENpRgg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 Aug 2026 11:10:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJprX0oC3Gdj=RNNYtPiQ-0NkEPvn-MyQ9ZtFakKcj1ew@mail.gmail.com>
X-Gm-Features: AUfX_mzXtvkrshAlkiMteNJj8gvRU9rIYBk-lG0usv9XUDyxXzzHJorja6k1J7w
Message-ID: <CAL_JsqJprX0oC3Gdj=RNNYtPiQ-0NkEPvn-MyQ9ZtFakKcj1ew@mail.gmail.com>
Subject: Re: Re: [PATCH v2 07/10] pinctrl: ambarella: add Ambarella pin controller
To: Linus Walleij <linusw@kernel.org>
Cc: Long Zhao <longzhao@ambarella.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
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

On Mon, Aug 10, 2026 at 2:42=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Mon, Aug 10, 2026 at 6:02=E2=80=AFAM Long Zhao <longzhao@ambarella.com=
> wrote:
>
> > Thanks for the review. I will rework this to reuse the PL061 driver wit=
h
> > per-variant register offsets, and evaluate modeling each GPIO bank as a
> > separate DT entity. The duplicated GPIO implementation will be removed.
>
> Thanks Long, I think it will be easier if you break out the pin control
> bindings and driver from the patch series and work on it separately,
> the same with the serial driver at least.
>
> I understand this can be hard to test on the hardware, I usually
> put a few patches "underneath" the b4 cover letter, and then the
> b4 send-email will only send the cover letter and the patches
> on top.

The problem with that advice is then 'base-commit' is useless.

Maybe b4 could learn an 'ignore the top N commits" or "only track the
first N commits".

Rob

