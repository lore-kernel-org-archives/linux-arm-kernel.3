Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5A8C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWHwO8k89KMIOROmHdTn+tsJpwKFcpuMyDpGO9S6/Q0=; b=PxFyzRpmC3Lbydgi/dpMXtAi9k
	3PFZ5niWv+A1040BDJZcRWP9om/9w0VZD2VWrp9WREeIcJarXq218Q470hXf2OsSagwucEN2PH0ld
	4eGyfIiOHWpF6/szetUjqtf4/JwHYyBQroeqtgFTLv8553BifOkrvih4LqePiKwRR+fya3pq6AkYi
	LgOCbRxV1H7TKhFIgp2scT+T6FQvZFxEoGbjQrICEdOfhEhwPGcfADWgYMwxeeK9kGrIeiUu3/LOI
	NwJ3LQrx04Td7zTa65+senSYupvNt5UEGbTQpBnkHfmC1/e5XhZQAVi6eUL/1p9tlEOkTayF+uBqz
	4Bj0+iwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5ua-0000000DQ5r-3rVL;
	Fri, 25 Sep 2026 13:24:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5uY-0000000DQ4h-1nsz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:24:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4C6A41A1022;
	Fri, 25 Sep 2026 13:24:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 114D06073B;
	Fri, 25 Sep 2026 13:24:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7FB8103282D5;
	Fri, 25 Sep 2026 15:24:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790342656; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dWHwO8k89KMIOROmHdTn+tsJpwKFcpuMyDpGO9S6/Q0=;
	b=l9dlpdkDqiMckaNfwr7bun/p57zAVub7v1PghXsTuWnOsGqHAv7yuZLECjhqrrsOeJUlt8
	0yi7CHR2q3FKkEu2BWyKiTdGdFyriXxXWni+kPX//yN7vO8tYReF0gJRI4D6/VYNUXKadT
	P/NLpDmMJxWSM66/UTT8NCpc+1YWPVWxixpKyenM6bzKNGCL37wrmmjS5N884rAc0om23n
	FoLrsIGum1CEoiMAq5r1n1hPJ7y7vPZklmteNdn3HQb8/uEBaq9lATJSaE7nTOFVOESVEv
	0+UGOn3R4XdzuF3E1tQSRg6EQ2GujU5+bWm6Wn9LDddEUB91EaiETkax8M+e5Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Richard Cochran
 <richardcochran@gmail.com>,  Arnd Bergmann <arnd@arndb.de>,  Brian Masney
 <bmasney+clk@redhat.com>,  Jerome Brunet <jbrunet+clk@baylibre.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org,  Jacky Huang
 <ychuang570808@gmail.com>,  stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: nuvoton: ma35d1: Add missing WDT/WWDT
 parent clocks
In-Reply-To: <20260925-skinny-husky-of-cookies-4aaddb@quoll> (Krzysztof
	Kozlowski's message of "Fri, 25 Sep 2026 14:58:11 +0200")
References: <20260921-perso-ma35d1-upstream-clk-v2-0-209fd32a8b00@bootlin.com>
	<20260921-perso-ma35d1-upstream-clk-v2-1-209fd32a8b00@bootlin.com>
	<20260924-bald-awesome-griffin-7d1d5b@quoll>
	<87jyo9ljlo.fsf@bootlin.com>
	<20260925-skinny-husky-of-cookies-4aaddb@quoll>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 25 Sep 2026 15:24:08 +0200
Message-ID: <87a4p5jwg7.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_062422_607209_0D35C918 
X-CRM114-Status: GOOD (  13.96  )
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


>> Maybe one way to fix that mess is to:
>> 1- Add the 2 new values (238 and 239) + a new define:
>>    NUVOTON_MA35D1_MAX_IDX 240
>>    238 would then have two definitions for a short period of time.
>> 2- Replace CLK_MAX_IDX by NUVOTON_MA35D1_MAX_IDX in the driver
>> 3- Drop CLK_MAX_IDX in the bindings.
>
> Why we can't fix it like we did everywhere else?
> git lg -- include/dt-bindings/clock/
> and search for "number" which leads to recent commits like
> d10f26a7abbd3dd5d59bac1acdca117385b54ea9
> but there was same work for Samsung and many others (Renesas, maybe
> NXP?). You add define to the driver, then drop it from the
> binding. Can

Aaah, ok, got it. Now I get what you mean by "the max is not a
binding". While true, I find it much less obvious to have it somewhere
outside of the file defining the clocks. I would have "preferred" to
consider the name of the definition immutable, rather than its value,
but if that's the way, I'll comply :-)

> be a few commits like we did for many cases, but recent change from
> Linus I think went acked while combined binding and driver.

Thanks for the pointers, I'll "move" that number away from the bindings,
since the driver is the only consumer of that.

Thanks,
Miqu=C3=A8l

