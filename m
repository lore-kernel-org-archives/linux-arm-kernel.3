Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8750E9D3F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 04:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UiBtM/WvH4oBPsrvm/bvVOxpMP5sinc2Xq+FeQqQ04=; b=J5yrfJ2LD0mF6FGd+QPvR9wtvr
	s1XR9Sq6MnqaitzPX52X4uiMsNtiCwmjz5n2SyTvc8CCmc6vfeeuVleUkZx1+mGom/PND5n6XkSmT
	f7SXM+jOtZouwWoUYM9DWZf/KcwhBS5q7FaTaLQX0HI0FZ3QLtinN8F+Y4bY1m/SBzToxE3mD9X7o
	REiMmwD3CvPdJB3mD0K7MNUYfe0Cq5Jd32m3eKLptpkUkteJ8vsWpeloIznktTJeg1TOqD5hiAgiN
	j0up9SWJiyx8vFkYmCIcsngEq5/84SQ/bK84fzIGWGHUi59Muqx2bmGxMzXJGoN2iIV/OMj+h5I6Y
	8eYUjL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voDMh-0000000AqWv-2NwP;
	Fri, 06 Feb 2026 04:22:43 +0000
Received: from mail5.25mail.st ([74.50.62.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voDMe-0000000AqWR-1UVz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 04:22:42 +0000
Received: from localhost (84-231-56-127.elisa-mobile.fi [84.231.56.127])
	by mail5.25mail.st (Postfix) with ESMTPSA id 0413560881;
	Fri,  6 Feb 2026 04:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1770351756;
	bh=jFmNoqj9HqTRVjU1BU0gq4JHfzGq48IU+b3F6hx3rRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwk9mzoEYPjeH03drx7Kb0lX0rtI+T1BvvcO6H06NGgGIVzFuI43AEAtLVMz2TezM
	 8PZx7TacSCpTTV4kyHsxa9WqGrwsbi+i+RnaUzGSXhfQn4AFF7RX4LJAmcaMgO8mxC
	 G85zXj6HlGNRHo57jEclqXpY5b+DXGv2B7fb9Zg0o99q/cgjQJdfOwaWevUF/z3fRc
	 ToOnrimzNNDMg8l2KzOdOjMkYXyVkuqiis0jQMBLlKvb0S1UHKB7rUatiKtP8m+ba2
	 SNahWGkmUPoo6ZP7HHGiodmL5iVg26AR8hz4a9PD8Qo0obslsz1MLaZqRY/vy6JO2M
	 JN35yfo+cE4eA==
Date: Fri, 6 Feb 2026 06:22:15 +0200
From: Tony Lindgren <tony@atomide.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility,
 probe robustness, and consistent pinconf offsets
Message-ID: <20260206042215.GA5376@atomide.com>
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
 <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_202240_883202_223F0718 
X-CRM114-Status: GOOD (  15.25  )
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

Hi,

* Billy Tsai <billy_tsai@aspeedtech.com> [260204 06:54]:
> Hi Tony,
> 
> This series proposes a set of changes to pinctrl-single motivated by
> bit-per-mux SoC designs such as ASPEED AST2700 (per-pin DT encoding,
> aligned pinconf offsets, and allowing probe to continue when the MMIO
> region is already reserved).
> 
> Linus reviewed the series and noted that he would prefer a custom
> pinctrl driver using existing helpers and the pinmux = <...> DT
> property, rather than extending pinctrl-single, and suggested that the
> pinctrl-single maintainers review the approach before any merge
> decision.
> 
> I would appreciate your guidance on whether extending
> pinctrl-single in this direction is acceptable, or if the preference is
> to pursue a dedicated driver instead.

I agree with what Linus that separate more targeted drivers are better
to avoid the drivers getting complex. With the GENERIC_PIN* helpers doing
targeted drivers should be trivial.

My preference would be to move the bit-per-mux handling out of the
pinctrl-single driver into a separate pinctrl-single-bit type driver.
Seems that can still handle the cases where no hardware specific driver
is needed.

This would simplify pinctrl-single driver quite a bit, and would make
the new driver quite simple too AFAIK.

Regards,

Tony

