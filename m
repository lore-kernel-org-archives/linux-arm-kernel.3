Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D363CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trNQO0U9XQLBOWcQGLIc+ci4GywnkatJEUe8E9u6r4I=; b=Kqx95rgqIvdfECTXOiPoiF4OV6
	aQdKqa0GodmJa0LjUmcpF/oJSVex+If0OmGVmqRUUnAR6BmHep4cXT5ODW3MhXrg0afg+4YwLplG/
	hVfHK9EhYljZuBMxWhs1Q1YBDIBdjqePH/4F/I59OnxGniSAOoYrHArQgfyCsE1Ce+ndmKurvDojR
	t9qyF7IjUPP27znU3peCoA22iP8/rPuh0bXVxj7tKfaMyY5OloYF7FIJscy4y8mKk7bvcW8sf6B/X
	zWJy508HZzAnlPvRMYYTXpL3I9qI7vbO8UBCdTCJqqx7bkF+hLk795586SulLe6+ic0rTRRkGUlKi
	i2Rmk5vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiUr-00000006qZN-1xh3;
	Mon, 19 Oct 2026 08:13:29 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiUo-00000006qY8-14oH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:13:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E572C5CD45;
	Mon, 19 Oct 2026 08:14:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9304F60582;
	Mon, 19 Oct 2026 08:13:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C06F010328429;
	Mon, 19 Oct 2026 10:13:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792397601; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=trNQO0U9XQLBOWcQGLIc+ci4GywnkatJEUe8E9u6r4I=;
	b=FvItgfkBI0uIwemxLOQyXNqDxWTC/p0cGmtkocphPeGleMMne9ZPgFH0wpCiMNJtFVpPKV
	+g1u7KYl2AJaktUp0fVPQLS+bEuvTbJB9e7RfonI4dpFbM29cq7QBf6xt9KPPehchHuHXd
	yL9QIyg4JYh8gCnBNPJ6z9OjGOcL6rHMvJ4pldB6QC7y0LtoBGTPEfyj1ez4iVYMO+ng/q
	JMi6xmyW+h7DjjhbvAai1Swrfgsi80X7i9etz4cbWXjgsNa1VDPhuykMnp5o6ABI+955Z9
	ZvqH8FrEy2lodwuX4g7n4uCq6sSiR9PjTSTaoKfSY+jmZdAOcgF6y18MWSRAig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Richard Cochran
 <richardcochran@gmail.com>,  Arnd Bergmann <arnd@arndb.de>,  Brian Masney
 <bmasney+clk@redhat.com>,  Jerome Brunet <jbrunet+clk@baylibre.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Avi Fishman <avifishman70@gmail.com>,
  Tomer Maimon <tmaimon77@gmail.com>,  Tali Perry <tali.perry1@gmail.com>,
  Patrick Venture <venture@google.com>,  Nancy Yuen <yuenn@google.com>,
  Benjamin Fair <benjaminfair@google.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Krzysztof Kozlowski <krzk@kernel.org>,
  devicetree@vger.kernel.org,  openbmc@lists.ozlabs.org,
  stable@vger.kernel.org
Subject: Re: [PATCH v10 03/10] clk: nuvoton: ma35d1: Retrieve HXT/LXT from
 DT when possible
In-Reply-To: <179224882241.859276.15035084302735586039.b4-review@b4> (Jerome
	Brunet's message of "Sat, 17 Oct 2026 16:53:42 +0200")
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
	<20261015-perso-ma35d1-upstream-clk-v10-3-47c97b54a809@bootlin.com>
	<179224882241.859276.15035084302735586039.b4-review@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 19 Oct 2026 10:13:08 +0200
Message-ID: <87zewayup7.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_011326_465162_F799CD06 
X-CRM114-Status: UNSURE (   9.76  )
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


>> +	/*
>> +	 * Old DTs do not describe the low-speed crystal. They may also expect
>> +	 * an HXT output from this driver. In practice, nobody should use these
>> +	 * clocks directly, but they must be kept for backward compatility
>> +	 * purposes.
>> +	 */
>> +	if (num_clks =3D=3D 1) {
>> +		hws[HXT] =3D ma35d1_clk_fixed("hxt", 24000000);
>> +		hws[LXT] =3D ma35d1_clk_fixed("lxt", 32768);
>> +	}
>
> The above is fine but the problem is those IDs still exist and something =
like
> <&clk HXT> is still valid in DT but now does not provide a clock
> anymore.

Yeah, it's hard to prevent, but people would immediately face errors
when developing anyway.

> This is why I asked if you about removing the ID. At the very least a com=
ment is
> needed next to the IDs saying those are obsolete and should not be used.

Ok, 'next to the IDs' may be relevant indeed, I'll add that.

Thanks,
Miqu=C3=A8l

