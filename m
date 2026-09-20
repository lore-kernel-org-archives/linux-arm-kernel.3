Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1614CC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 13:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iTC9JPtz2vdRM9WQWi2dUzaX2OPQZPuYHgOoaoxIyw=; b=aEJHNaBK/63ycaWppo951HjtWU
	b6zVoVyxcNaTAaDq95JnadA2wSqfxEAyq6F2pnEPjxSSFAwEJym54xbqhPu7IqDLlLLgrYT8WQ7ap
	jFqrTUhZF62tyhQHdEeYCVn4JnFycPXQqukKKvRikjDp6hrKOC8vo4vzSlhJ3xf9NXta9FGNpeyKH
	Okmv7a/q2ld/bqylasMZlF2Fk8a5ERzqhT5IR8qScBxpLtlBAvh+UWRM+WHm2jEwCeoYwGp2+PdJx
	zZC1qn61nNyJiy1U7tlG3e5WZkYv941e0Rp6ui86bKJ7WeQCkgmK6NNHB8k7+X0Z/8XKrvLJZbN5s
	NwR0fltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Huo-0000000HWiv-2WES;
	Sun, 20 Sep 2026 13:49:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Hul-0000000HWic-3iXa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 13:49:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A30ACC51468;
	Sun, 20 Sep 2026 13:49:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D7A426033F;
	Sun, 20 Sep 2026 13:49:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2997C103286A4;
	Sun, 20 Sep 2026 15:48:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912143; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8iTC9JPtz2vdRM9WQWi2dUzaX2OPQZPuYHgOoaoxIyw=;
	b=UTB/X/fSimERrtJA+QubT29YWdvXZmjGdyjvuyFxudaWyR5aywLobj0LsBENQhH2qoPyYl
	J0o/ME8vsZ+/+EUEtH/IHtrR+WuS8ixESIB8gi4obLpH2irQ6HGGbTdJn7u6dH+phJxrAa
	lK5SVNuOPSsR7oyjeNhD70+3uZg8KVTHNAsmbeRmbDm2BDajhXNI4/zg+tppPdKFWBE18R
	LDwKYxM//w73mzK5g/sMo3XynVS7k7sjZfzOXbq5VEUwN1nRVsqt5/QHt7FyRg6m8/xTI+
	fDveY6ZfeF/L+F4kWKg2i3PxOzpj2IkLNPINDPLkEyT74atD8nzEal4HI+J6Wg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jacky Huang <ychuang570808@gmail.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Brian Masney <bmasney@redhat.com>,
  Richard Cochran <richardcochran@gmail.com>,  Arnd Bergmann
 <arnd@arndb.de>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam
 Lin <STLin2@winbond.com>,  linux-arm-kernel@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  netdev@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH] clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
In-Reply-To: <b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com> (Jacky Huang's
	message of "Tue, 15 Sep 2026 13:26:39 +0800")
References: <20260813-perso-ma35d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com>
	<87o6e0nfe4.fsf@bootlin.com>
	<b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 20 Sep 2026 15:48:55 +0200
Message-ID: <87o6ds8248.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_064908_091105_83E769FB 
X-CRM114-Status: UNSURE (   8.68  )
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

Hi Jacky,

> For example:
>
> =C2=A0 =C2=A0 static const struct clk_parent_data wdt1_sel_clks[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { .index =3D -1, },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { .fw_name =3D "lxt", },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { .fw_name =3D "pclk3_div4096",=
 },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { .fw_name =3D "lirc", },
> =C2=A0 =C2=A0 };
>
> The TRM lists PCLK3/4096 and PCLK4/4096 as valid selectable parent
> clocks for the WDT/WWDT blocks.
>
> However, the new conversion changes these entries to -1:
>
> =C2=A0 =C2=A0 static const int wdt1_parent_idx[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -1, LXT, -1, LIRC
> =C2=A0 =C2=A0 };

That's indeed correct. Thanks for the proposal below, I will include it
in the next iteration.

[...]

> I have also tested this version on an MA35D1 board, and the clock
> parent conversion appears to work correctly for the peripherals I
> tested.

Nice! If you're happy with v2, don't hesitate to send a formal
Tested-by!

Thanks,
Miqu=C3=A8l

