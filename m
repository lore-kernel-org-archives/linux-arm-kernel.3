Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F331D6AB1F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 00:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJ+8mEhNn9wUSa9R8VvhGJpfu23Mm7qVZmFxt2lVutQ=; b=uncUeMufV4xSX7ZMdEEYaQUiFw
	aewkBGaYi8i4Y3RlzeEnMg4WfqoFHmRujhACP5n8ovYNmQkSDBEZRy8fP7/7N+iz6zeoF7N3XBVp1
	LgCfKPbhK7MET7vcC8GRr1Ui4X60hAL5VGQfUr4QYRBILu4dH0vWEbX5U5o0ywfevh/YIN9BuQi+2
	e4Uv4eYjypSyJIYGXCHO0f6hbiSQYswv+S7pzeDtPfqftXbyOTdrg8K1eqFHgYZpB1+NKgVFduiCx
	rmLBBQoIuYOxf2fPuiGhKsg2WszthhtayeN2T2KxvRB1W/7yvvvs/gZoLX8A9qvObNGtlSG3xtsTg
	AGceusqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Sak-00000000z0u-1VWW;
	Fri, 03 Apr 2026 00:40:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Sai-00000000z0n-0rRI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 00:40:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C47460008;
	Fri,  3 Apr 2026 00:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F130C116C6;
	Fri,  3 Apr 2026 00:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775176851;
	bh=NJ+8mEhNn9wUSa9R8VvhGJpfu23Mm7qVZmFxt2lVutQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bNJsrNHfYcRJm007j4S0gUwfNrjeWvZdoHliWvtkVxFWWc3/1jlesn+xPpAqsNfry
	 HhSfY4bIiG6NLXrsbLCFeWKAJ6+3sJEDrdS8gHJ1u9OBgNqTkxXL7Y4Y3XuLfTkwbT
	 gh3zzJA7WItfiCMP76cE/w0dGh4w88Q7/aeFZOpCpGt1s9fSkApVEdjpalyO83PeXY
	 AEsd+6qBgB/SsrF3y4d8FXKBR+CCRachkUBXC0xV/V8w7UlVaYG9iD2h2Ry0bqJYP+
	 9GBOnmYjagrPaC5X4llk/14Li576IXy7ywUsYIQbvNA0KxyjFvi+cYMfyynW6KI4lz
	 UiTTZ3PrZQRrA==
Date: Thu, 2 Apr 2026 17:40:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Ovidiu Panait
 <ovidiu.panait.rb@renesas.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Baruch Siach <baruch@tkos.co.il>, Serge Semin <fancer.lancer@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 0/2] stmmac crash/stall fixes when under memory
 pressure
Message-ID: <20260402174049.0ac088cc@kernel.org>
In-Reply-To: <CAH5Ym4j5peYXc5c9ycJzimy26Tv+4x18hyy+j-H4v7PyWuWhtA@mail.gmail.com>
References: <20260401041929.12392-1-CFSworks@gmail.com>
	<20260402080542.293e8729@kernel.org>
	<CAH5Ym4j5peYXc5c9ycJzimy26Tv+4x18hyy+j-H4v7PyWuWhtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Thu, 2 Apr 2026 09:53:43 -0700 Sam Edwards wrote:
> On Thu, Apr 2, 2026 at 8:05=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
> > I meant we need both a threshold, and a delay :( =20
>=20
> Hi Jakub - got it: when the critical threshold is reached, allow the
> NAPI instance to sleep and start a timer instead.
>=20
> 1) We'd either have to leave interrupts masked or let them race
> against the timer. Either one is manageable, but I feel like those
> interactions carry *just* enough regression risk to bump that patch to
> -next.
>=20
> 2) Could you point out which NAPI driver best handles this situation?
> I'd like to replicate its approach.

Not sure, the last few NICs I worked on had the ability for SW=20
to trigger IRQs exactly because of the Rx buffer depletion issue.
fbnic_napi_depletion_check() for example.

But let's not overthink it.. say we arm a timer and let the IRQ=20
be unmasked. The timer just runs napi_schedule(). napi_schedule()=20
is thread-safe, if IRQ fires with the timer armed - no problem.


