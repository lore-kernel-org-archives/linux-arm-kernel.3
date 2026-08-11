Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31441C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBLr/zr3YozGXbYbeO35tZJWvBmZWp1KaYLtzkvre+A=; b=PfaXGycNyt2DbOycgiJkbrWBBB
	d2o6VkuMI2Xu3jzk4yMnFhPnwHdsvIv6ErNz75ZCEiM3/OKQpWeSVO2CIZzqQJtSNbCsSFNrVcvEb
	US7uWjkbdCLUAHPpB5TqdP1e7tzfTuUIN+7yOAF9L9QYmZ7ICHl/t3XSdzzryhEHXkkufwrUFOzBo
	4NLcZG/oNjZcxBhvyuBcw5z2hWXb8MFJSNZyoFrsydS8p8Lj9nHwoggNavkCJYmu8/uECL011jUh0
	yrIXmUVaxZpXBUoD0jKjfkiAAVYpMVYBGjfr4fRmliHUYt8GcqScROP2j3W2MbImy0Atjj4Z0MSun
	YZx7W2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtg7I-0000000DR2H-2CIy;
	Tue, 11 Aug 2026 06:37:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtg7G-0000000DR2B-3GrO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:37:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 03C22600AE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 06:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F8E1F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 06:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786430257;
	bh=tBLr/zr3YozGXbYbeO35tZJWvBmZWp1KaYLtzkvre+A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NL+O7hJO9q1BQS+zRadlFZYTgD+/P5LwFY7olRcT46/Q+sTlX67mt/71xscXAmoaV
	 /cBkAi+l/obapKC+C2W4uSb0XBlaDEiF5g099OQ+mFmLp61Aklr34v5sW0LFCJ859M
	 /ahRNt1cUgborCSwT9rGFZBGjZXLB2czg1Y8jooeckj29UnK5qFFS3lo2Ly30SJhx4
	 0nZoaz89PX2YgXmba7xfSVhahSMKoCCWGGLexA9qCfSSjV5MkrOaefJ47JS6FVHwNH
	 vZ9lJ7Nd2t44QVv0DW5xNX89QNmp6RN63M2A89f8GjhbCdJYQMsgzsqjFWGqS20/MP
	 w8d1veoUR2Qpg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b2aab18795so2707907e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 23:37:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp81CMxEyqoIna6tP+XeO6whky5qtHWM8hebf/Iwz3emT1Cu/TqKf/6WqXiWvrFAolU9GGQhZ6KNZVXEOHiDS+C@lists.infradead.org
X-Gm-Message-State: AOJu0YwEVFLEobraHATbSFiCq5MPRMO7CDgKiIXAhp+FIaLpSlky9gKg
	ZnnE/PcFt/CArAP5eBUksL1TKN0KzSL9YwMYDZuSX2Z2vepqQjC7ikly2Smh9Z9EFnRiT9rtfgs
	o9z3Vz8CI5Aa/H97JKVSouZPEjBEH+So=
X-Received: by 2002:a05:6512:2208:b0:5b3:e52:9ff7 with SMTP id
 2adb3069b0e04-5b44866558emr181770e87.51.1786430256514; Mon, 10 Aug 2026
 23:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260810131032.455435-1-christophe.roullier@foss.st.com>
In-Reply-To: <20260810131032.455435-1-christophe.roullier@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 11 Aug 2026 08:37:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLn9z8oLGZ9UX=KhS3-OWou2pq0+dLVytWNf3AogDPgH=A@mail.gmail.com>
X-Gm-Features: AUfX_mxIsECvNT5meQ9IAG2w79JxujnWbutJsYXdfanjQzB3zUMk7zQ6F8rMX8A
Message-ID: <CAD++jLn9z8oLGZ9UX=KhS3-OWou2pq0+dLVytWNf3AogDPgH=A@mail.gmail.com>
Subject: Re: [PATCH 0/3] Some improve for STM32MP2X
To: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, antonio.borneo@foss.st.com, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, Aug 10, 2026 at 3:10=E2=80=AFPM Christophe Roullier
<christophe.roullier@foss.st.com> wrote:

> Add PHY Regu for MP23/MP25-DK
> Increase deassert value for PHY Reset for MP25-EV1
> Remove commit "net: stmmac: manage error case during stmmac_dvr_probe"
> from my series to push in net-next networking tree

These look good to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

