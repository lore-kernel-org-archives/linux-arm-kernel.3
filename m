Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079ABC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5kYHzYmH2aRzXt6VPZN5ZJXDdGIJtTeIUx7G9Xqy9k=; b=k+FrMfUc6bJbzCk9SUQNFu3s21
	ywqDgosWqiX/1LQZlcg30Xs2jxR56lq0Bz4EwsJwaWysGsz0cZNORSXJ3PSray8XR2ydJRCaMwOAx
	nS5UrYT+FD0WBgESX+TMiCT1O7v0Z9h6W+hHDGRt96UDwwS4b9d5Onii56coRS5rwkXuMefvEMeRC
	v9KlhekbhRCSTlvl81GbXdH441fXrNm4HtTxf3PKIj/wwh9N6q83JWU0N2ZIm8s3ni49LDcg8fZBK
	uelGi4vu4WthrROl6WrspMjfs1PYwerzJsmxKk8bjsutIIQWataXyLSxfTUTuDwGFfSPADGvOcnKV
	UVpMYokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxro-00000008WrM-3054;
	Wed, 02 Jul 2025 13:51:16 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwsT-00000008MrO-2UGQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 12:47:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so4074927f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751460471; x=1752065271; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e5kYHzYmH2aRzXt6VPZN5ZJXDdGIJtTeIUx7G9Xqy9k=;
        b=hTOHah2pL3yDjCXQy20dYuhvw4y54CXS4tGjvLJM08pcu3sFUsjCA/lZD2I6R+b8hH
         Fxe1mE4t6vGMliPfSRrulgPGXQd0iY8Git/D8UWqppmGmnUGdnezT6RGjRc2IXKtJOH7
         J83N7fGiUhKQRlwmQelNfn+TI1T7OQPFtF1c0EpIf3w3To+RUZgmctt+YhgRntlqYUIM
         Z9G1WYVBYtbOQRB828Tq4vWnTNnDK7lTBlx3pP+lXVfZw+wTSx4GDZ3Lg8vWip6GnmLS
         GuAJdFnn52ovruJ0Ji9z0flqUZOlLjgzz8l+5mWFiUr4f1Z7Og5vlb22SEt/quy/XFNI
         AU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751460471; x=1752065271;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5kYHzYmH2aRzXt6VPZN5ZJXDdGIJtTeIUx7G9Xqy9k=;
        b=r61eUxzYKSY8pCqh+vvMb53oAb9iOITLLo2izGpRrnHhfkvGsDDXQsYHyHFpKjjXB3
         X2Y1JLWxgrWG2LiZ8DzHrfDPbvoH5tK/eQYHi0lz+yW2gC6LyU3rX31ost3Z2ROJaVv9
         btYM6S8bGuGJE17DIwQ+py5rdTW7oVLXQcjipKrsaH96I9LVHmihYZ8MUFv51jwRA+g/
         km9Gd8HJhi88tdbq9S3Qby/CWp26I603OIR42qWTnUj5DSQfP2fvwxKhH4IqA4ZF/6KP
         HHruvZsR/C6hFgqAhFXUpvAFP8kMBPz/24eFzoZzkgEYhhxvemK/F6rf2qH4u+S95yUi
         E2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV2Q0fzFsPOKege2/gIlpz0TEKEzelHDsZ5grdWOrLYqp855HHbUy4DepMBjvyKZW2XDhgPcjM4d3BJNEGcAla@lists.infradead.org
X-Gm-Message-State: AOJu0YyliRSakDEs3XZBAHTWxNfIHBwnpLwB35RMR9h22utkp6rMKW3i
	/J/Bq7hFNKSkO5Q9sB8HKYjJKbXlwLKh9VJR3A3rWBGvKVZWn+masxj6pU7bwmrM8WU=
X-Gm-Gg: ASbGncu6iqE/jYN+BouSSxpKSqDm8FMSnHiH5EtQmVx6m/ll1TWM3d6PhTm7NC61FlL
	hHz43yE/+eb2ym7OCYMOkQrz4Ft3rzaySdVAKis7nli+IVvfZHoylF0Oq0euQ9PFvjJBcYLskdF
	oRY4+IaloixhI+BWXRl7TA3gN+xs/1MkpJbFxifvrJezNSISJFRRPTfljKj3jnlBSkcIVwxuRUL
	OC+P3vYGZkiXB/xbQWoAAtr7Vc+Xdcumdz/jma5Bvrp7jCj3vcn5xgt72MGFB87Z0wq1IPANbeg
	7ecGSEs/a8atMuNsnXoB+6bky3MMrcGWv+7khF6LV6SgA7pmp1WvA0jnnL7S7B+ozw==
X-Google-Smtp-Source: AGHT+IGPeeUccLmCtgYtyYD+ZS1Aj6ZgB09U8/1PLF8w5rZHkBfzkakwgdj2Tll4vbsez2P7mMwNwA==
X-Received: by 2002:a05:6000:402a:b0:3a5:51a3:2ef5 with SMTP id ffacd0b85a97d-3b2015e22c7mr2056080f8f.58.1751460471460;
        Wed, 02 Jul 2025 05:47:51 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b913esm223450335e9.33.2025.07.02.05.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:47:51 -0700 (PDT)
Message-ID: <c601dad05c9b8da4779af9c3ec852767e87dc9bc.camel@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix gs101 irq chip
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 02 Jul 2025 13:47:50 +0100
In-Reply-To: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
References: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_054753_638913_B6D0A6BC 
X-CRM114-Status: UNSURE (   9.23  )
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

On Wed, 2025-07-02 at 13:15 +0100, Peter Griffin wrote:
> When adding the dedicated gs101_wkup_irq_chip struct to support the eint
> wakeup mask the .eint_con, eint_mask and .eint_pend fields were missed. T=
he
> result is that irqs on gs101 for the buttons etc are broken.
>=20
> Reported-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Fixes: 2642f55d44ce ("pinctrl: samsung: add support for gs101 wakeup mask=
 programming")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Note: no Closes tag as issue was reported on private chat. Permission has
> been obtained for using the Reported-by tag.

Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

