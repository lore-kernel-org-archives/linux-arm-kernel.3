Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB698C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mApBpQp0os5vr24PicEoNzJZQZry7H/S7laJ5tY3XaU=; b=Askz08Ss61xNRp+3Hg+Ay0Rg+h
	+kj8Cwd3F6JT220fQMMK/+0FyD/lt2GpGIOxZm1ZhurbQWrNxl0usFiz2X414KGU2s6WASM7BL+JF
	5yWFAA0piRL3XQ1hMlFqwLpJbuhB/xMB/zwvLpOkKPjzFa+AXK8wmRpc2MQTUIK+quj7nMbil3hnH
	X4m9kYP98LvfL9sF3oJsYrTKf5+/gqJuZ537zdhUro6rVh0CO0UpA77MfidN3rjFkWjcdKep632U5
	O5hLIwh5+PZrqNi5R6yG2qZuTXSSzZZ2WtLSsmszIjARqlWT3W+dddp4z3e+oa17Nud7GGlA8qQ05
	EXNAXC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA317-0000000D5l8-3rgG;
	Fri, 25 Sep 2026 10:18:57 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA314-0000000D5jv-2nJH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 10:18:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 71AB14E4106E;
	Fri, 25 Sep 2026 10:18:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C7F26073B;
	Fri, 25 Sep 2026 10:18:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 312DC1032950D;
	Fri, 25 Sep 2026 12:18:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790331530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mApBpQp0os5vr24PicEoNzJZQZry7H/S7laJ5tY3XaU=;
	b=KGze+7yTzC2ZY6N6yVIJmusuIUu9hSelV4KsMoKlaBqEOlEOreXhY2p7qEN1BkL8VHpo5L
	o1HLNKcMUT+4pHbbpdDlUsZpLZp91+Xxdb77RZHBwwoLmL1OA7Oyw+ATkmPVBBsuRfwXWa
	/0eMo98+rjfyTMsCRZT+JbeuDwvAbqgOzECFNND5GEt5dwNOUDi+i1TUKgnknt02vuXVh+
	fFnwhZn7cOOuFHy7c0tKcoSVyuRrEoR7YJlEWHgm30n1YB8wlCUdmBSCtCGtdGAJ/uPFex
	MFCav7TCGV/ullelpzYMZMn9939pRMMtKSV/eIBs3g6oAd6X62UO5mF90xzNgw==
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
In-Reply-To: <20260924-bald-awesome-griffin-7d1d5b@quoll> (Krzysztof
	Kozlowski's message of "Thu, 24 Sep 2026 15:25:16 +0200")
References: <20260921-perso-ma35d1-upstream-clk-v2-0-209fd32a8b00@bootlin.com>
	<20260921-perso-ma35d1-upstream-clk-v2-1-209fd32a8b00@bootlin.com>
	<20260924-bald-awesome-griffin-7d1d5b@quoll>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 25 Sep 2026 12:18:43 +0200
Message-ID: <87jyo9ljlo.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_031854_847950_0DFA902D 
X-CRM114-Status: GOOD (  18.58  )
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

Hello Krzysztof,

>> Reported-by: Jacky Huang <ychuang570808@gmail.com>
>> Closes: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc=
48795a@gmail.com/
>> Suggested-by: Jacky Huang <ychuang570808@gmail.com>
>> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock co=
ntroller")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>  drivers/clk/nuvoton/clk-ma35d1.c               | 2 ++
>>  include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 4 +++-
>
> Please do not combine patches.

I thought splitting these changes would not make sense in this (=3D a fix)
case, but fine.

[...]

>> @@ -248,6 +248,8 @@
>>  #define ADC_GATE	233
>>  #define EADC_DIV	234
>>  #define EADC_GATE	235
>> -#define	CLK_MAX_IDX	236
>> +#define PCLK3_DIV4096	236
>> +#define PCLK4_DIV4096	237
>> +#define	CLK_MAX_IDX	238
>
> This cannot be updated. If it has to, then not a binding and should be
> first dropped from the bindings like we did for most of the platforms
> having similar issue.

When you say "This cannot be updated", do we agree that you mean
"CLK_MAX_IDX cannot be updated"?

I'm not sure I fully understand the reasoning behind, because the whole
point of defining this CLK_MAX_IDX value is to let drivers know the
number of clocks, so it must obviously follow the updates in this
file. I cannot just drop it, the driver does not work without it. If we
enlarge that number, what is the problem as long as we keep the other
numbers identical?

Maybe one way to fix that mess is to:
1- Add the 2 new values (238 and 239) + a new define:
   NUVOTON_MA35D1_MAX_IDX 240
   238 would then have two definitions for a short period of time.
2- Replace CLK_MAX_IDX by NUVOTON_MA35D1_MAX_IDX in the driver
3- Drop CLK_MAX_IDX in the bindings.
or
3bis- Keep CLK_MAX_IDX in the bindings, but add a comment stating that
      it is a stale definition in step 2. This solution looks horrible
      :-)

Let me know what is the best way forward here, the goal being to merge
the big fix that I do care about (currently PATCH 2/3). Fixing the
missing watchdog clock definition has been asked by Jacky in v1, but I
will drop this part and keep v1 if it turns out to be too much churn.

Thanks,
Miqu=C3=A8l

