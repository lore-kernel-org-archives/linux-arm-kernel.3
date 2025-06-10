Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1D6C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=; b=bPN//C8YyPEl6WpdzVab8NQ8lN
	lt/qtDY/jm1P3ML7NzEs/piL1SPVoinDpj8jAg9xW5PIeSxvI44GtOnzRtMXqYoCjrXD1tceGB9ml
	ZBs1tKJ19IPWQPyE5LDX+3jq3ZkKQIn1OnBy8DuLI3OBpUu9jKZp6BShtaoGFYL53qftS/G2W9BTR
	6PnI5DkIEC83s7FDLjariZkBxD9tXhC6SFipt1IFQAk7VeUgEBZthsWdzckxKxMYAvBZdVhZHnQqr
	qU2c+IAz5WlbKg4OL02RESgs8XWMSKEdvempJ5JYC/bwvSFRaAFdcVoP6hml/gbc8g1513M4kXuhL
	u9cls2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyo1-00000006v3B-2bEh;
	Tue, 10 Jun 2025 13:14:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxuc-00000006kKT-2vZJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=; b=qltkA1o+9iwGG4letM0giHRmnc
	rq9aLcA9R0IUG4/KH7mKj5YEraa4f/2TDCx0UHQd2KODZEtOMeX8DaFHUI8LNr+RNFUJO+MWXx9ga
	/azp8bSlrrXzIrWpZeLaysYxtWZJVQHU7yALnGTcKkC8cCjbVUJ/D6W2giawKibkBirP7OT6uY80E
	xLnKqUxVsIMUKKEW370aGgW2FxUEaROy6c0LfXzO+RAtg8NQFl2ao/hLXeN/C+e77GCmoepJVdLCj
	hiE1NE/j9ZZk7NJp2oQjPc0YMW2qdA/rRoSPRSdf+scPb+d3ZpiTr0iCHPjlXDHSPtDHnqNDdMYSb
	bSBAlEgw==;
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxua-00000001nqO-2pHU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:17:06 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54e98f73850so5750250e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557821; x=1750162621; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
        b=GYQW6IpewUXtN1tx1n8cCgxD2Qpj9wdsvpx4HO6yAZZIX3H25+rpBEM7pMNO+6rmFw
         bum/KaE1dpvpyajmh/85dN7Fq+kDbMw9g8SmrHnY9CA8tMVSTks7natnKoxznnPThBy1
         XNJiH+TWOCSfvSpPWtPvfl3KN/9M9XkPzRpo8sMKSA1tOkt03BldOufRp9/tyLZt6dkP
         cc3QzVOF9xzYMaLpyh/412bqEx9U8wtAivhSFzFe+ztAuaEl1YVSEiyXaxtlvQMZgPSY
         j0ERoQ1bmCihlnhSSueyBnFCnN2YKrkUVx2RLktYWI+xlsebsczZo1A1qV8a1l3xmCyr
         yCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557821; x=1750162621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
        b=BvHE8EuzycFOpW8BZ+S3KGXWWxPYTTw2yGXzK15qkN2ZHWYrE4k8PLUgPa1oZBIFRU
         5f4xgDsnLzEQ/s78xLhIt3FMzk9pus3Q/2x7SK+eH6QBnKQwGtIOjkQDliK8r3Nluy3w
         ou1FBTwrn8Q4RYhHHKNiOlXLfznwqoBqn0cFZn/3d9JEe+TbPvd6UIXd1t3b5o75H/y7
         gRKwrV48MMvUweVd7Fk2mGsP7/I4L8FXI6LXJoEQz9bIU6VPOy4GkcEGnrqmf8JsKOF3
         79J5nHQuiIRHizuZGuDS499L/y2Q9EVByPQOGxXuB06zmR55Gdd5OoldbEVXVYFkowu0
         pbhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlQmOhQaEkonjUGs1bD6sf1/L/AIJ8lOF+2zZmFzttgIWmObTe8U8tYJPgWN789XvTpbwuyjvwr+oAJR91mWSx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi+FRrOU8axWP+iEvUiFaYxYIp6/FkhpdfmAyP5nsXhobxiZrt
	Czq8USW7HXAEbpsZb8OHBrny6BSuATrvpn9BPVwUiV1EnAYd3Mauq0ykxWJe6y+Of9cxNy+urRe
	3/3CPAICvilsY436HsnRCD5shk2sCgfDZ9KNv0CH3Fw==
X-Gm-Gg: ASbGncvBANUeXmLvyh5EeFUx1j3SfjIzuHFNRXQseBx0Jrt+E/FjtxnLcuIi8X/GbPD
	eEcv1YpT7BClWFE/C7sk0kSEa2PS8vlWp3SK3UAD1DJ4MYQ2QyUt8OGjzPPLCRdAshqopjcoERS
	x7btrVdG+72A7Yszgl1lOKE8j1E6X6rQAFvt+/OZeYnbDNSzHrN8MTfQ==
X-Google-Smtp-Source: AGHT+IFQxMti2+Q8Uenwhc0/S6UdaliHxGCkJGgDod8emAA4asQK/90KUnu0JtAhA4sI4nKXBC2mhVRJZkpkWFN1Jcw=
X-Received: by 2002:a05:651c:2211:b0:32a:8591:66a9 with SMTP id
 38308e7fff4ca-32adfbb0c50mr43449421fa.6.1749557820819; Tue, 10 Jun 2025
 05:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:16:49 +0200
X-Gm-Features: AX0GCFuA2Dfvx1J77MshD7Tzhu9rwDlijvkgXfC-wltdCoDdq-4uVh1ABAKFvmw
Message-ID: <CACRpkdaQLq3YGfOg81gt5=1Wh2ZkoKHeK6H=NWaeW9aLbX4VCA@mail.gmail.com>
Subject: Re: [PATCH 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and more
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_131704_843229_1BC71984 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

Hi Krzysztof,

On Wed, May 28, 2025 at 12:41=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> In several drivers pointers to 'struct pinctrl_desc' is not modified, so
> since core does not modify it, it can be made as const.

will you rebase this series on v6.16-rc1, fix the snags and send a new vers=
ion?
It's all nice cleanups so it'd be great to just merge this.

Yours,
Linus Walleij

