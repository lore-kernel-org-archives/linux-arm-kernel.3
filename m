Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED201C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3PTCA5tweY5gERODPselAAddDTSw2gWVcoLEANdv3w=; b=UJbHGu/M5MmtgL3H6nfPmaRaCd
	aiUQ3S9k+UJ0ZrU7CrCMzkySkHBGLKl/p9kHd9AAWONsrgBOGfq0eB5R6wdc/xl10f3m9HmrhSFAN
	yVqze1tHfkhyXFKIX0ZPLnf62P90Fcs6Xm8T/TU9+1dEQbMHHMxYd21MINMNvK8HPhTMB2yYkS47B
	dnp8ttBdBG4WLFfwPEF5hzmAHHLw5BT6LfhHlE55V51QciJcNwvOXlowqgHwqH4vqBYIpUZTpdNDg
	O9Q5yatvIH1bsSyN8vrLBH7UQG+75CeaxNhAI//+ptilcQBI8LYLc5r/wCJ8YvoEEuvn1pkkhkHmB
	BmeVjlGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnBP-00000002lW2-1f3c;
	Mon, 07 Jul 2025 14:51:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYn4I-00000002kRz-2Fq3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 14:43:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E545345600
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 14:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4231C4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 14:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751899421;
	bh=pygmB6Y0A8GnIvfkKxpvuMj1/8T5+x16Brq+Mu3flTM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hW7AEn/kJoZ8G/Ci6vwPyUhco7+VT+w71XTx1ckOOlEvFJ/XKwDhl5sE5b9n0vETn
	 EoBQn8bKGxm2xp53PmFWiarQqh3pag3ilMqvwhTHb3byIy+pYBNJSt52ADXNa/MOFS
	 +St49nQkrtc6KQHchPzRFYKXHZIdwRyz1ELm99WFwf2g00rsR9i0S6bgj0rpxYxHuL
	 5PigZFIt0Es2ZgJV0o8sqXtLuX+r7gcko2jCPn8vGe4Lng1QsjwOuSMZLDyMrFf0Wc
	 IFOnWDqHkuLn04u1NoOC2CQOYtSHxEo9oBSMWBRjdi6oZ3bQwILTM5qDqUhwWEOJ8M
	 QHRiEECr41zTQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-adfb562266cso506178866b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 07:43:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWaFfmXZI0IPg/VPUSWKxiU1yjL23MAAmgkSfP+0vKUK89nhJfY/5cSenlorrA47ZRw/PkWM2I710cyfCBfSyHt@lists.infradead.org
X-Gm-Message-State: AOJu0YyzUGdXm8jLov4/zGX3A9mVIlNU25j4IVFNMnalDl463T70WaKA
	DjgetLQLbNmVxp+a/OjSks/PINrqQkmNAI1oEjHm/BpaTNi2Ts5TOiHs5Ogr0uSFlLaY4p0SPPQ
	g8fawJPLsK0pA2+QFfSaPGvqvBQwOyQ==
X-Google-Smtp-Source: AGHT+IH+f8zvdudHp1LuRKAAn7cL9u6+1JqOnozuxrIIQH8whQPjPMtiGupPBrID+yAocJ3AfWvuowkyHK1U/F/njY4=
X-Received: by 2002:a17:907:96ac:b0:ae6:abe9:8cbc with SMTP id
 a640c23a62f3a-ae6abe98e66mr63239166b.12.1751899420274; Mon, 07 Jul 2025
 07:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250703183537.2075746-1-robh@kernel.org> <1e33e6b6-845a-44bf-a398-4a9fb895a125@sirena.org.uk>
In-Reply-To: <1e33e6b6-845a-44bf-a398-4a9fb895a125@sirena.org.uk>
From: Rob Herring <robh@kernel.org>
Date: Mon, 7 Jul 2025 09:43:27 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+8ObyEM-f88QSq1QfptVPrk5s5mVM-irq4ZTGNW9NKTw@mail.gmail.com>
X-Gm-Features: Ac12FXwY1NqOYzEWnEAy2ESIy7UgECjX4aJqnXTz286AyGb5Rk-mUEzeguxMrTU
Message-ID: <CAL_Jsq+8ObyEM-f88QSq1QfptVPrk5s5mVM-irq4ZTGNW9NKTw@mail.gmail.com>
Subject: Re: [PATCH] spi: stm32-ospi: Use of_reserved_mem_region_to_resource()
 for "memory-region"
To: Mark Brown <broonie@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_074342_597070_119C9B32 
X-CRM114-Status: UNSURE (   9.98  )
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

On Fri, Jul 4, 2025 at 8:50=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Jul 03, 2025 at 01:35:37PM -0500, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() function to
> > handle "memory-region" properties.
>
> This breaks an allmodconfig build:
>
> /build/stage/linux/drivers/spi/spi-stm32-ospi.c:775:23: error: unused var=
iable 'rmem' [-Werror,-Wunused-variable]
>   775 |         struct reserved_mem *rmem =3D NULL;
>       |                              ^~~~
> /build/stage/linux/drivers/spi/spi-stm32-ospi.c:776:22: error: unused var=
iable 'node' [-Werror,-Wunused-variable]
>   776 |         struct device_node *node;
>       |                             ^~~~

Sigh. I swear I had fixed that...


Rob

