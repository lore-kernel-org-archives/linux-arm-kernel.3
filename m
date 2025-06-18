Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4F5C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=; b=ILfzUbgtOPUNzENGT6/PZlea31
	ztnnK5Svvk1NCpLQqsbrpXdyAPW5WYg2qVyTz1Y56WKiLjQYwNUjzlr+XWooSG9mI4Gd38cTEcZH/
	NbtYHjxGHiHE+U9Sg8bPv+mBxD+MPZU7TDKpY001mJnWyGXLWrdGwud4JIYMTJK5/eve2hFIJjKzi
	IZGglnx/7J5ScWDl3WlJzOuqvjvAU03MZV3apH8sIzsgjziTczT8R+UZBCXelZ5yLmxXvGxwbhjgL
	lWICV3Cw3tZzl59/kjG2H2jpaUZVTXtCfdQ5NtamjqYltrI4yZDt0P1HtEJW42r0ucD+WyzvTCWoO
	mCtHuaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvw3-0000000AlCb-2KiO;
	Wed, 18 Jun 2025 16:46:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtm-0000000A7oo-2lry
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 12:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=; b=CVsY7H1bxqJIJ+J+MTt351ggoE
	nUoH4fKjHz8l4uiBd/p57NLx1uJkXKclldA7czQQx1Kkt2WKSe6fQUOlpXMdaz0uLjqOsIaEvclYc
	EfDruDhlG0yyUQnAzVZxsNd9BjzU5GeC4s9wVx7ogTxNUkIsefVvsyt7i6319KU3eFi2beVqYkS3S
	ZHmTO+buqogrgCA00rZAAy3uHwxyUe8RnpjHI8IQ+XwZkMkjRrqzjxvTsHqm33IPEq/hlU6BfyzCa
	vMyaZm3gknTxjQnDMDpmjTY6sT5zrJvata+Jy75iK4JS40GaudX8uaSBlmAh8Rw2JU/RYsVj0O8kN
	LYEX/rFg==;
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrti-00000004233-1FV0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:28:14 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-553b51f5218so5203376e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 05:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249687; x=1750854487; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
        b=dtH+/A+5ZoSSG6X0rUm/HkaiD2WkcpjodgbJkAKU99fl7a+ot5fUqo8RyGRDmkqqEs
         Aft6edrWay1tIXReMPi9lL5XCebS2NCmj+4+fJpV1Q8Rlzjv6q+hYExVHqkZADavlPsG
         iS74pRvj7keOxBjvp2KFyWdoPEJnu9DS+2Js/u07G6IQx9R4yd+otyVM+GWhpB8RMF29
         +VLtuuVODxq+X05DkfbXHJ1GtyuVLA3j1mz/8Ui2ZDGA4j4mTgMQCeBDJmV10pqX+63X
         MQgsAIy7xIb/yDhdDtTDFT5AIq2WS6WmjC13SKa54YNXPIo0QUHdsd+HQ3YDCu2EoaQK
         x3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249687; x=1750854487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
        b=duNEsFF7tSAyRVxNXf2pJJre8mfOuAr+SfRubpsDInkpt8YExotj0JemTP1mJl1OPL
         ZBf7gl5I39yJSepO65uBqN5E/M567okSCmosy/eRKOdpMfQabKyxoeiWCF5/RxuvDUSC
         8a3SdrPdqPjT4UsTB4tTCiYjuNx0i2UxTmP5wfufUGSCD6Fu0Jb4KJtm62jiqm4HHVkf
         9lB00L6mhsQ02RSdcL8dSTT5FubVueBPuPYVsu/H3ur14OaW7ZQNxHBMaQ2SijsE1hRI
         DlFCI3Xc9w/vtVdFdOM0f6LGNPzoYJu8sAqFAyd6rlOV5Um0UEFsKkRS152fJ5S58hVj
         BEFA==
X-Forwarded-Encrypted: i=1; AJvYcCUzsE8DkwUiJZf1I/Mv4rzelsGBkdU5ONkmtxWe3yPY1fi9gggA7yL1i+XmPFo7Q8PnwRSsLSvzKHSw1c2zLCnm@lists.infradead.org
X-Gm-Message-State: AOJu0YxETcpB6bBjzfjHns/S3FJcj3FN76rAZfr4yBox0giMvBMJb9I6
	5ydscuQS/ds4RJ3m4Zs0meVq46ZPDHr+R0Loq+9r076cDiXUNhgkgOcoCNAyFuMuqr+SWvRdTIo
	IGA3l27EJow7ypotuJwjsVTkEfmTZ9nAzdWiwpc/c3w==
X-Gm-Gg: ASbGncsC74MjpV7+nDXloHos8lTzBfzEclUzvw6m1ij4e8Yk05DxKIgN9Br2k0zT5Gw
	NguNfMhkjeJCyBju0/yLURQpMshAvASdrekaFtsTEEUpV2B8F8trZ7Erk+aWEHhx7Rx8iqNqNfU
	jfY55R5JpmjS1YYWqyMyr9hpb1RrXuzeBZgIj0Hu7SnUE=
X-Google-Smtp-Source: AGHT+IEqcYdJwMh4FSJGyni6X0wxHGpPoUz/ob8ESveA1VpUKphDYobFyqmST5aw3MNHLgS47EAGeONWHSlMXxk934Q=
X-Received: by 2002:a05:6512:2315:b0:553:adf2:38bb with SMTP id
 2adb3069b0e04-553b6f42459mr4514077e87.46.1750249687261; Wed, 18 Jun 2025
 05:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org> <20250616-gpiochip-set-rv-net-v2-2-cae0b182a552@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-2-cae0b182a552@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:27:53 +0200
X-Gm-Features: AX0GCFtOmBUtsD4jP5iXZmqQJNmNp3Xkluag7JKU4cjSCOXhD78FpOnWyAbPHYM
Message-ID: <CACRpkdYi0oVa3uek7zcb2Jy_YPded6jfEKoXUp=BL01V5XX1MQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] net: dsa: mt7530: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-can@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_132810_376736_444C55B3 
X-CRM114-Status: GOOD (  10.77  )
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

On Mon, Jun 16, 2025 at 9:24=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

