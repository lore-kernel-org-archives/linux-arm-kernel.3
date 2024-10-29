Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3956AD3A66C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FlNVllC/D5JV5n+6Shvus7HZtUjXDU01fqL2ePQhSc=; b=UquArycKirhoYUVi8/wCwlHwG3
	mXoRpSaXMj6qfgNzNUf5gfIjbk7Hp1jZRUkmlQQCq054+2YLhbbL5z6S/tKbJhHB8NIFXh1X0nJpM
	FrakgVQ39opgCiqLJPKYLk9QJSoOr96/S6wDqgfKpNSHlxgYNBtOi3QyDh8TWD1ujGFzeJ+qy5e+5
	deszL0szOsxxGxQ+0DtZOxwO85JABXSpNK28+Uh4SORYD/mx19wSPLWoOlnyMKmzpGWAy6KnmaGSx
	bL+IphnM8+A+k/cXk1SGpQ1+w5O24KVDG6gT2ke1cCcSMpcTI7kR93LlIx2mmfvHWCLyy7aAiQuh/
	934nLzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nnH-0000000Eol0-32ct;
	Tue, 29 Oct 2024 15:06:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nXF-0000000EmDM-2aal
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 14:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+FlNVllC/D5JV5n+6Shvus7HZtUjXDU01fqL2ePQhSc=; b=RacmTBTyPrVT/eG2c6YY5F3x1p
	h3hGxtVnI87ZBB1gsSryK6xR8jUUuz1pe/Jw1tDPbhIuuVe/R6IxUBKJ3cPjtIQZwR/pdMhn4k9gj
	+F2jTFw4ASKHhKfLz/wdZ4iKeUMueV9JKePz2PRqQT4nca5mVsnYLPcW/IfyDQJaZWDhyz7jCbhWv
	uSH810H3Qm5a9Ut1oNwfQaoPBQcwmjV08hg0T+z0pQSoURjltsGS0fQ8d1MwnpOy3EausVlBdT3xh
	/Ulda9eRP5D0fhAiM+G/nCR91usRo99h5YwOuPAjEaLQXX6kBN8ANdVNsjHaZKBiq5FI5Nx3elGzz
	4GHMUW0Q==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nXB-00000009uzg-3qEk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 14:49:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8653460007;
	Tue, 29 Oct 2024 14:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730213359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FlNVllC/D5JV5n+6Shvus7HZtUjXDU01fqL2ePQhSc=;
	b=dICxjCjwm+um0i4q+atY1uQqjl32KNZ8qxO8kWbplQejYNtXxu2Wud+VHsz7+grDnoXcCJ
	7jxD5wu28OEX6xHBVr+1da9zPR31VEYekHdCecOEpTbIROIeIv1aIjRg37KQ1KoOgYql5X
	lAN0DUVLyiEO419475dlwSIsco1mpDnYWwgGMQ1ipBJq9Ov+TUD1i7u7OhOfCdGk9sU4sb
	HoHlxgjZjsMKBjMvTTGJFeyaxogSzQyp4kcU75nCU3IQY3C0oKPOle0lGghCZYUVZeRpA1
	fLSxDmPUhtlJ8Selj9r9QVHwoS8//S2pV+1tUEwtVpIdvyljnvDYwJGFs19m9w==
Date: Tue, 29 Oct 2024 15:49:16 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/7] Support external snapshots on dwmac1000
Message-ID: <20241029154916.50b5f188@fedora.home>
In-Reply-To: <a905c45d-344b-49e9-a0c9-fb7b6445edad@bootlin.com>
References: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
	<a905c45d-344b-49e9-a0c9-fb7b6445edad@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_144926_557675_6AABE6D1 
X-CRM114-Status: GOOD (  16.36  )
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

Hi Alexis,

On Tue, 29 Oct 2024 15:45:07 +0100
Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com> wrote:

> Hello Maxime,
>=20
> On 10/29/24 12:54, Maxime Chevallier wrote:
> > Hi,
> >=20
> > This series is another take on the pervious work [1] done by
> > Alexis Lothor=C3=A9, that fixes the support for external snapshots
> > timestamping in GMAC3-based devices.
> >  =20
>=20
> [...]
>=20
> > [1]: https://lore.kernel.org/netdev/20230616100409.164583-1-alexis.loth=
ore@bootlin.com/
> >=20
> > Thanks Alexis for laying the groundwork for this,
> >=20
> > Best regards,
> >=20
> > Maxime =20
>=20
> Thanks for making this topic move forward. I suspect the series to be mis=
sing
> some bits: in the initial series you mention in [1], I also reworked
> stmmac_hwtstamp_set in stmmac_main.c, which is also currently assuming a =
GMAC4
> layout ([2]). I suspect that in your series current state, any new call to
> stmmac_hwtstamp_set will overwrite any previously configured hardware tim=
estamping.

You are correct indeed, I missed this bit in the series. I'll update
that for v2.=20

Thanks,

Maxime

