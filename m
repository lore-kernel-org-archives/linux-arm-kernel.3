Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83600C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neK2JaH11CvGMxWIp1XEqkxU0+X+dCwL3hHK/4h4EX4=; b=0guLRZKAVs1R59bI9DlsUr4ynu
	w033AiC8PH2BAixfF8Vb8yDjmflS4nKa59p4ffTmOGgtfPy1aBWGlrF0PSpeFY8VVwQ2f5Duy6DLs
	bqd/PbyfaUvfVE4E3FEV2c7CJJt1i+N6TcVjBLsJgcM4QEp0cApfpTdmmXDAt2XMOdE2paJgLTIi4
	7PLpAbrn8tywPjnYCmMQdSG6kVuTVHOM3p+MwfBqqrROFOnhqhRiTYolMC8+CkIw5Dk8L6uvpMq4n
	6tvOjz3cak5wyYQGOJIVro0h21FS2Clc+FJxnyQ439lkZKvzgcNPpPld4pxz6g2X2cEh3ppoACCMA
	DM8hIPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLC7-00000008Clf-1Byu;
	Tue, 18 Aug 2026 14:53:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLC6-00000008ClT-02WY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:53:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F5BF600AD;
	Tue, 18 Aug 2026 14:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8612B1F000E9;
	Tue, 18 Aug 2026 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787064816;
	bh=neK2JaH11CvGMxWIp1XEqkxU0+X+dCwL3hHK/4h4EX4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GM6OC7ryr4qSDg6PuZ+CZYelvm0V99JVbkDZEjHp640t/vN2e60J7/B5nOyffBCWo
	 ZdZWCqtnISKA+TfmxspOgNC+vq56kt0tAqbY4wQKdAHEMzD0MpS3bXb48gL7yEqnfW
	 JL2CAHqJXTCiceK/Dze8H42gquBt7WcU1xhJUnsapa1i/19W/1BzH03GMHDX1TIWjg
	 J9EE/jSrgZqMJjqMot+TPqeWW13wIGwdXlVJWu61ikb2MgDNqpgPbjkIJBnkHXbjb1
	 K/o0WjLbbVidxa5Eqz1XLx8suOKb49kdIOdkkoyE5BBmjUzowwUG5FU+c4EeImzQ1H
	 kOQOhqwQnTWCg==
Date: Tue, 18 Aug 2026 07:53:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: stm32: Set TSO/TBS Tx queues
 default settings
Message-ID: <20260818075335.48936b08@kernel.org>
In-Reply-To: <87mrujzzjv.fsf@jax.kurt.home>
References: <20260812-stm32mp2_txtime-v1-1-f9e2462cc85d@linutronix.de>
	<20260817103337.74c30adc@kernel.org>
	<87mrujzzjv.fsf@jax.kurt.home>
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

On Tue, 18 Aug 2026 08:57:08 +0200 Kurt Kanzenbach wrote:
> On Mon Aug 17 2026, Jakub Kicinski wrote:
> > On Wed, 12 Aug 2026 08:28:57 +0200 Kurt Kanzenbach wrote: =20
> >> TSO and TBS cannot coexist. Use the first queue with TSO and the rest =
for
> >> TBS. Tx queues with TBS can support etf qdisc hw offload. This is done
> >> similar to dwmac-imx and dwmac-intel. =20
> >
> > Can you explain your use case? =20
>=20
> I want to use ETF Qdisc with hardware offload, which is currently not
> possible on the stm32mp2.

Do you need multiple queues for ETF/normal traffic?
Or one ETF and one "normal"?

How do you sort the traffic between the queues?

> > And how many queues the device has in total? =20
>=20
> The stm32mp2 has four Tx and two Rx queues.
>=20
> > You say "TSO and TBS cannot coexist" but can any queue on your
> > platform be configured to support either feature? =20
>=20
> I think so. The data sheet says: "Do not enable time-based scheduling for
> channels on which the TSO feature is enabled.". But, I didn't find any
> limitations on what queue/channel can enable TBS.

=F0=9F=91=8D=EF=B8=8F

> > If yes why are we configuring this statically instead of making
> > appropriate configuration based on qdisc or some other uAPI knob? =20
>=20
> It seems like a static configuration in the driver today. I basically
> followed the same convention as dwmac-imx, dwmac-intel, dwmac-mediatek
> and dwmac-qcom-ethqos. Only dwmac-socfpga does it differently.
>=20
> Tx Launch Time requires a different DMA descriptor layout. Currently
> tc_setup_etf() just returns -EINVAL if the DMA configuration is not
> setup appropriately. I guess a dynamic configuration requires to change
> the DMA config and perform a full release/open cycle.

release/open is not ideal but still better than hardcoding?

