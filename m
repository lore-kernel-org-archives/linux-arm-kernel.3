Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4436CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrZXZ5vj6rpI76QBE1riAOOnnjT8+4As+YM8KSkqa9Y=; b=4vqUNMUONXDgVgzBwzPiV6IJV9
	LTR2aAKioj6Q/Zmq1YKbyjHcrmOHM9HvxlI9vs+VdF5Mx8mLhmXTr2Q08Hh1QrgQJkjH9T30IrXQi
	84q0bWUowdpjjWdqvuSaCNbJDhqE6a/y4IIpMiaKrSu9aKTrur1bc6vjBAq+kJMZNRtX1Y1hFqn1j
	eSFhSYgNzfsaLcvhIertia0HHZ7JC5cUHY98ICgL6QyhqcZtiJ/kuv2H71tH4hYrbnS4SWgRXN+/T
	2xyuE+5DvZ9PjPVxy/DPQ8e5d9wZGfWlb7ElG1fH+5gtMg24+R5xKsmarx+KccuDTjQj/MTvefPHB
	/MAOyjGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFzQ-0000000E1AX-2aEN;
	Thu, 04 Sep 2025 19:51:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAuy-0000000CClf-0ssC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:26:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2AA760286
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 14:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5354FC4CEF8
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 14:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756995987;
	bh=MZTNLy8WumQBrAUxZruJ7A1RSPvhV1IcSRMMDbYEd5Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R00ZNFjzGvMIV1z1JYLS3srxQQe2x1VuVBDB1GG9YR4OKz57tshnqOOqZbLxmuw7L
	 xCLf65RuifIExOjc5NRKkx7vyOAC82sUKsXlUMqQ1+Pw380aoUXWHh0Md1bMsrnmyZ
	 OtOc5At3+5t/P4f+yDft7PUret0sxRxvwWfSDavwSIecBLdmwg3quI5ZkR3nfKlcKJ
	 ppjG234+0H4XtAWuwsZ8HUj5VaqZTNcLcAWqz5AFdW8D9JuiU2n0B5jbxvtzds1s6D
	 FDaRoI+5BBmqdJ3QNF+/AVMi5Cvld1RLZMJbu5vsgORimigAPacWt4u6Gm216QFA4m
	 0YuH7TxGBx3Pg==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b04679375f6so176477666b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 07:26:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrSnCN+V1jfOlPxc1CoRRejhkrHrpg/5nQ9pHOegsNYN0Z8PDHd5ptZIlxQjBypc2Ntcy1UZrXMqeDZfW79r/V@lists.infradead.org
X-Gm-Message-State: AOJu0YzDcEgroEOAuAAvgJqPkU+qFrpqUEVRDtt+yIFYnuUAoVhBdjfT
	B+sqO4IrzDORAylc+TMjMW8nY7BfgTHEcbxpptgHXVMFmk7dFCBVHP+hJkarqwndUkxwwmUL+m+
	CzfS6LIzEelyypkd+u1ab9DZaEnRU6A==
X-Google-Smtp-Source: AGHT+IGC6do4FFjOEe96iRxCl7OvO0Z8eMjKL8C03py3+afXpF8z+wNZNrq9fN5BUDwZ+RhTw6v/xHjprm+YASxMvpE=
X-Received: by 2002:a17:907:97d6:b0:b04:6858:13ce with SMTP id
 a640c23a62f3a-b0468583507mr693956966b.38.1756995985863; Thu, 04 Sep 2025
 07:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com> <20250904103401.88287-5-billy_tsai@aspeedtech.com>
In-Reply-To: <20250904103401.88287-5-billy_tsai@aspeedtech.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Sep 2025 09:26:13 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+XbTt-FbUOnmnSCwB7yYvWDVLy5kaYARhBwe=0QzGE4w@mail.gmail.com>
X-Gm-Features: Ac12FXxgofUZYm-8aN3VW1dq-DHJjDy12C9x9yYGuLCJNCxaxLowzVV8WhBnhEg
Message-ID: <CAL_Jsq+XbTt-FbUOnmnSCwB7yYvWDVLy5kaYARhBwe=0QzGE4w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: add AST27xx pinctrl configuration nodes
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, linus.walleij@linaro.org, brgl@bgdev.pl, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com
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

On Thu, Sep 4, 2025 at 5:34=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:
>
> Add pinctrl0 and pinctrl1 nodes for AST27xx SoC0 and SoC1 to configure
> the pinmux settings for each ball.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../boot/dts/aspeed/aspeed-g7-pinctrl.dtsi    | 1359 +++++++++++++++++
>  1 file changed, 1359 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-pinctrl.dtsi

This file isn't used anywhere and is therefore untestable. If there is
a dependency to apply, then please specify that using b4. But then
this would also need to be included somewhere.

Rob

