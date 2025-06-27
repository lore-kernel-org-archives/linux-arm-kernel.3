Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A295C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ir5i1Q9KyugghFm3rAKZGkZVcX4ql/Bgo7Ef1sec90=; b=iv8JqsO1thS3wxA2o3Uc+2O62C
	CMkrwJpW7AlRR5z5+ozZwyFiF9cVLPQZODBkebxuB/kRjh62P8rN+eOVJhiDcW1uPiIpK9rbsh31k
	dVNK4Kh57Q/p8irneFbbBYv8q7ikqgNzDLVqOO2UhD2fu9IWQH+VMHhKZ6aeM5eDSe2TL6cZn2hRp
	YDMe/3gOpdiiHu/XZllf4exRjhUGMkaqOMhJLHhC4GuLnYvl0UWgeVPVO5SzTk9SYyMf6DgEaWHZ+
	CGw2/zOrezfUdvmLujCBYlHPqy72gTcgntm/uGCqq+XNbTCBwXk2tmiLErGzAlI+tPyh2BQFl4HEL
	nK0dopAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9EJ-0000000EnHp-28TB;
	Fri, 27 Jun 2025 13:34:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8cQ-0000000EhfR-12aq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 003324343F;
	Fri, 27 Jun 2025 12:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0C0C4CEED;
	Fri, 27 Jun 2025 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751028949;
	bh=6TA737hZFuJlNzhhKE0Cq46SUWvV+VYmzq+aO5tyEv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=porQaOmnwR5TuC3LG3hKWfzV7oKCMKzcHnL8MoZHNVbVWu2fUkdSdgyxM2HjRDh24
	 k2U49xL61YlTUDRdibPSAckpdVgTe+7sR70/39YxaighdvzEH+CmUzY1CEhh0rAf2O
	 +I795pctolDcYsfGqp3woWLVg5LWHk2zAeyouLjOQuB+rPLzm40aN3Jo/ebIGQZQJA
	 if3HYpzMjoUCBEUaHh68ynX4drDcjaWb4VfieE8+3EN6etAc3AiFAa1LdbzV+TXfR7
	 EuK51yaJUnIjJfLd9ZWRSCm6kQEnpOfEKHYBuHH/JJoqEuHOITZiQnESj20jUrBi1Y
	 N1dw2HwgF3qFw==
Date: Fri, 27 Jun 2025 13:55:43 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com,
	linux-samsung-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for
 gpio-mmio
Message-ID: <20250627125543.GG10134@google.com>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
 <20250626132257.GE10134@google.com>
 <CAMRc=MdBipydUjEKXDufMAWNZjMA18RKj0XcNofrn1oR7bXTZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdBipydUjEKXDufMAWNZjMA18RKj0XcNofrn1oR7bXTZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_055550_305795_262150EC 
X-CRM114-Status: GOOD (  17.59  )
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

On Thu, 26 Jun 2025, Bartosz Golaszewski wrote:

> On Thu, Jun 26, 2025 at 3:23 PM Lee Jones <lee@kernel.org> wrote:
> >
> > On Tue, 24 Jun 2025, Bartosz Golaszewski wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Replace struct bgpio_pdata - that we plan to remove - with software
> > > nodes containing properties encoding the same values thatr can now be
> >
> > Spelling.
> >
> > > parsed by gpio-mmio.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  drivers/mfd/vexpress-sysreg.c | 46 ++++++++++++++++++++++++++-----------------
> > >  1 file changed, 28 insertions(+), 18 deletions(-)
> >
> > Can this go in on its own, or does it have depend{encies,ants}?
> 
> It will break the MFD GPIO sub-driver without patch 1/6 from this
> series. It would be best if you could Ack it and I can set up an
> immutable branch for v6.17 if you need it.

Yes please.

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

