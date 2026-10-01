Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FC5CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q29obV8omClDmxn+f8l/iIlcowgBclhhgHspfu6yWmw=; b=R7m7NQ5s99SfkfOmrjJcfqNZeA
	3D9Q2q21m85sBLnS24WtEPVB2kA1QzVnr2LcuGfzVAhs/LWlZn9NCawEo32k77kQ7Yrb+sboKOp0p
	PAl9ekEmw3AIvh+i7u8fO+75r1VPTXQ3teM0B+V93WLhKiAN0bfc9dpBfFLwm5gZ3WN2iuJmsx5sg
	YipP6ovaLxfBXYCgreiI82z/FyXD9RgMdBZI7D/ahG81CdYf7rGoMugTra0s9pvt5hWj8ucJfRkRy
	0gJXCnBFe3VJwUf3WRfNfTwck+BmASscO3TEM5eHupDhjP7hFkJ5+n5Y1t6QSxU0NWTuDZBnQmENP
	nf5zIjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCE1m-00000008VZ7-1j9c;
	Thu, 01 Oct 2026 10:28:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCE1j-00000008VYY-2uiH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 10:28:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B46214E410EB;
	Thu,  1 Oct 2026 10:28:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7FA6960341;
	Thu,  1 Oct 2026 10:28:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6B16103297EB;
	Thu,  1 Oct 2026 12:28:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790850506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q29obV8omClDmxn+f8l/iIlcowgBclhhgHspfu6yWmw=;
	b=TM2zAZZ2CoKjlETXMGPxKLKo84nTN3todnDzcsvS1T4ywQ8Ex2wodInRWk2Ao9QxKtlsLD
	qySzhx293w081fVQPxJaYhJKF5/4gL5DGP7RxzXU1ePu5NByvvADVgT2CXR8FCuwPAeb1X
	ex67AocTshgW18Nq/chZ1H5D9ggahR5OrK3zOFYT8olyP9d2PjLAoYl6n5gnZQoOqCeXRu
	g6MNV/KGS7wEG/mnHybljnWAxyKcDoHYMfOAN+HjI6LBBr6++3OZP/M1+ma9jK3YNmxz/s
	3y3FOnih/6MDNxWywF7dea3icq5uoBpMEL6ChdD8tiWAYlEVu23oM+mlxAEn/Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Richard Cochran
 <richardcochran@gmail.com>,  Arnd Bergmann <arnd@arndb.de>,  Brian Masney
 <bmasney+clk@redhat.com>,  Jerome Brunet <jbrunet+clk@baylibre.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Krzysztof Kozlowski <krzk@kernel.org>,
  devicetree@vger.kernel.org,  Jacky Huang <ychuang570808@gmail.com>,
  stable@vger.kernel.org
Subject: Re: [PATCH v6 05/12] clk: nuvoton: ma35d1: Add missing WDT/WWDT
 parent clocks
In-Reply-To: <1j4if53gcf.fsf@starbuckisacylon.baylibre.com> (Jerome Brunet's
	message of "Thu, 01 Oct 2026 11:44:32 +0200")
References: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
	<20260930-perso-ma35d1-upstream-clk-v6-5-48937ee6c9bb@bootlin.com>
	<1j4if53gcf.fsf@starbuckisacylon.baylibre.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 01 Oct 2026 12:28:18 +0200
Message-ID: <87bj9dogu5.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_032835_877530_B9F7853A 
X-CRM114-Status: UNSURE (   8.28  )
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

Hi Jerome,

>> Reported-by: Jacky Huang <ychuang570808@gmail.com>
>> Closes: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc=
48795a@gmail.com/
>> Suggested-by: Jacky Huang <ychuang570808@gmail.com>
>> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock co=
ntroller")
>> Cc: stable@vger.kernel.org
>> Link: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc48=
795a@gmail.com/
>
> Is this is a mistake ? We usually add this when applying

Yeah, I made a mistake and then b4-shaza'ed the patch to get it back. I
didn't notice the Link trailer but it probably got added there.

Thanks for taking the first half! I will try to fix the following
patches as you suggested.

Cheers,
Miqu=C3=A8l

