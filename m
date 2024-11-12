Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7BBD42B97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 15:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/ZZ+GzA9JnknmCSiZ4KAoFAxIWZALm0qPy9dvBIJSk=; b=4LluOiOtsvuNC3eMGdMNVQTRVi
	eS2K9aYL062yvSNQNoa2pV84TlBfBHGx8dlKmvXLYZPRmuFLaynDXyRXhLw1yBs6TWORhVzqmOb6f
	Pn5IHZFeHWqFkfnnvAXw3EOfl5VbvPo+3HBi9njQ59bofMHteWmbcsaJrtioxtPXpcCjt4/fJ6Cyw
	+9Bm+W8yyzTr0yGJls8pGKT1ihMom1ukwFAzq+DkCHxClvSgbHDMzzJKhmczjQRkaM9ygNLDODu3f
	wKIcMA5aKzhgGsoFoqfYeImVwrOZ60aSNdNyz4XwTupWjRVP6aL6d9EquwF9yHn4yRsYiFevyRZ16
	qiuVUulQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAscf-00000003v9S-09cm;
	Tue, 12 Nov 2024 15:16:05 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsZ6-00000003uEJ-28rH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 15:12:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AAF7240006;
	Tue, 12 Nov 2024 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731424339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7/ZZ+GzA9JnknmCSiZ4KAoFAxIWZALm0qPy9dvBIJSk=;
	b=gN8R0y5rBADWu+wo+lGHeMRwjS1282FydlI9vD3kgvpHQWTYsItwv0ODr3pyxeUUL9/IZL
	szxsyvU9qROe3EZH29OPtqpzNY1CGgw47LbshgwpkgUVX6VO2bWsajgC4TmMcGHH7r9LlY
	G33EvbRmjGx8br4vfR0EeyZkdPYjWhhRewSY/WUDxk+ZEvI08pmAojF8qfmADEABnJxIG+
	qoyc+4hqVEjd2XnEyLTv/JnKdPv8cfU++ryF0rzS0cTh8FTuDEnlZfczRSAd+U2jb3EZf+
	mfFl/EYf15RQtHk91p5j5TX+qAfHgPZIWoTiawRO5TblLOHnhgPxrTSLqjvRdg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: cathycai0714@gmail.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Avi Fishman <avifishman70@gmail.com>
Cc: cathy.cai@unisoc.com, cixi.geng1@unisoc.com,
 David Miller <davem@davemloft.net>, edumazet@google.com, kuba@kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 Network Development <netdev@vger.kernel.org>, pabeni@redhat.com,
 wade.shu@unisoc.com, xuewen.yan94@gmail.com, zhiguo.niu@unisoc.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Murali <murali.somarouthu@dell.com>, Tomer Maimon <tmaimon77@gmail.com>,
 "Silva, L Antonio" <Luis.A.Silva@dell.com>,
 Arias Pablo <Pablo_Arias@dell.com>,
 Somarouthu Murali <Murali_Somarouthu@dell.com>, uri.trichter@nuvoton.com
Subject: Re: [RFC PATCH] net: stmmac: Fix the problem about interrupt storm
Date: Tue, 12 Nov 2024 16:12:17 +0100
Message-ID: <7732873.EvYhyI6sBW@fw-rgant>
In-Reply-To: <CAKKbWA6zRee9Rzee-ebLnEAvwLqnmsPswGaUo_ineyzw-b=EgQ@mail.gmail.com>
References: <CAKKbWA7e0TmU4z4O8tHfwE=dvqPFaZbSPjxR-==fQSsNq6ELCQ@mail.gmail.com>
 <CAKKbWA6zRee9Rzee-ebLnEAvwLqnmsPswGaUo_ineyzw-b=EgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-GND-Sasl: romain.gantois@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_071224_846629_E424BB81 
X-CRM114-Status: GOOD (  20.39  )
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

Hello,

On dimanche 3 novembre 2024 20:00:54 heure normale d=E2=80=99Europe central=
e Avi=20
=46ishman wrote:
> Hi all,
>=20
=2E..
> >  Yes. It could also happen between the dev_open() and
> >=20
> > clear_bit(STMMAC_DOWN) calls.
> > Although we did not reproduce this scenario, it should have happened
> > if we had increased
> > the number of test samples. In addition, I found that other people had
> > similar problems before.
> > The link is:
> > https://lore.kernel.org/all/20210208140820.10410-11-Sergey.Semin@baikal=
ele
> > ctronics.ru/>=20
> > > Moreover, it seems strange to me that stmmac_interrupt()
> > > unconditionnally
> > > ignores interrupts when the driver is in STMMAC_DOWN state. This seems
> > > like
> > > dangerous behaviour, since it could cause IRQ storm issues whenever
> > > something in the driver sets this state. I'm not too familiar with the
> > > interrupt handling in this driver, but maybe stmmac_interrupt() could
> > > clear interrupts unconditionnally in the STMMAC_DOWN state?
> >=20
> > Clear interrupts unconditionally in the STMMAC_DOWN state directly
> > certainly won't cause this problem.
> > This may be too rough, maybe this design has other considerations.
>=20
> But then after the dev_open() you might miss interrupt, no?

Indeed, but in any case, unconditionally returning from an IRQ handler with=
out=20
clearing any interrupt flags seems like very strange behavior to me.

Disabling and reenabling interrupts as you suggested does seem like a
good solution for this particular scenario, but it doesn't solve the more
general issue of the dangerous way stmmac_interrupt handles this.

Maybe the setting and clearing of this STMMAC_DOWN bit should
be wrapped in some kind of handler which also disables all interrupts?

Best Regards

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



