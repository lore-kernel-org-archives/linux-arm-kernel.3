Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3093C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhojDdHC94+BdjAE5gd50YRzJP7qSAXpLrLf8nMSLLo=; b=y1uxWsX0jNxhDq1qlNLlyocYTp
	c/jAVXo0D5cRt6NhmzYiryGY46s2MGloZbb7qN5kbBYRbQAvWC2HlFrJVLbmlXuam9XFuym70kWFa
	aMOAe8GlwCSLRJsdl0Bc/07fXhaI9OBR2pGgD2ycoT8UmfIUvQS/haGrZ8oWTixZh3A6L1IZ+lRPz
	/eGavGCoe/V1iP/GiGk0SfuPe8DTbdVl/2RuYZW3hjWK7DBp1bHifTvaGDhId88O/5fdc/Lpu/Vwc
	Fsd9n5PKjOZThFk/eBAGsIs+V59Pvyx+UyKL7WBquuZCCOhHs8k+eebiQW0JDtsOOn6dFSwYeh7ZU
	D29IHIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwqU-0000000ElZe-0H5Z;
	Thu, 23 Jul 2026 17:04:30 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwqQ-0000000ElYi-45iP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:04:28 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so830453f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784826265; x=1785431065; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jhojDdHC94+BdjAE5gd50YRzJP7qSAXpLrLf8nMSLLo=;
        b=HjGQQ7YCZY3NW9pJcNY6cKLsLBe8scZt50mkwns5uLuXkoQNXkSun+vpj9rLF5Hx0j
         AzEmFqJo9AhvnTQ0Bz00Ue6dk9lYHx6AQvB3bei6fhnpqeiDG5pvufDtNrQt/25DzH/J
         PBe8fSXwVdC/OKgh/FwlHIkfJuhDMh3dY5VqEemmyOjgdUqb8PKqzk0GUoql9RbKQXcG
         dZJ67y4/MQ0AXo+qTQ3scOkkoJaTsYY8GpGH3FoumQkwgxxG2E/UrCI5jQ0lAmSBRhN/
         wVi/p2FRhJnJhcFEvqpWGd/SXUOTAsQw/hVT21k0JqlXb2cmFgIf04j55GLRHoX2tXef
         cgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826265; x=1785431065;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jhojDdHC94+BdjAE5gd50YRzJP7qSAXpLrLf8nMSLLo=;
        b=Bk3yXCCbgj0SKVATFI7ZN7dvK2e6BKH2KbgAXkyb73mLuCUXGYVUYEL6GBBaDV/EAW
         /zvqqzYl+EtQVGLKcyMy4a1xyI7CNfIMQKv40iScv9QL8fOnCsWPxyLqoKqbtOvQLS80
         5VaGYqVm4K/qlJvujj3Xs28MyHbuWcfHJR8h/yIohnlVXePRT5t2TO/TFWI2e5L9UbQq
         l42SoB/Eorhz1MnHhZL5Vb9V2DN5WuFjvdQINDhDlr3FtRxDn6c7SfiAOfslIRNBmjeP
         mLpASgALvsLw+Jgdx0zTNksrJweS1EG9lC20LLWyYuotNoauLIyXzT5HgytfMm3hpfxM
         erhg==
X-Forwarded-Encrypted: i=1; AHgh+Rqfm2rADAq5N7t4OIOeO5BgLT/YWXGZGcygAv2QAaf3wT6CbNthS6WCIXdRSBX+y8PXCzk1OW9jr306ly1NE0rQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwEYU+BQG0Z+ftGlxeD/FlU44SdvdX7K5LoHvgjD6p3+h9Z/8FS
	hFlyNfXtpQy8xS5log0vznXt+dOTbHYi+AABGaM/Q3lFveU7WkpDUnq5RU7qZtuBTHM=
X-Gm-Gg: AR+sD12cBFx1bJZH+yvw3GUR5wvzlPqQBWW5ZdCDet1sk64qObQjbMAkeLUSa74wnYP
	4zlySMQqOxah/SlJ22a7Q1eSPfGWHoMGMV5fOh+Ifz49QZWvjktoGL7eQvmVxG3Qf6cp5TWGtrO
	i4YHBevwu7J0Z8/d0kIHPRJSD/J1fDDK0CFvZZ8MPj2I0/7qBjQoXTdxvrUsW84g+8U+hPd3tbI
	TgALxU8DMqT9qWKCgh83dpPRWMKcF04z6yqFBFRg7C9B1LJ/zy6MRq56BS5k09voQn1mToCdkVU
	27gCgv6CwPe6zLUFJrpkalGPB9TmQ29/SzjnoWhAsp3DwfER9KNJZZAmtJsBieGZvs7C1HDq4a5
	gikys6JlRRkwia2AWdnJezRo9I4MACsduIOLRH1MuL+FxZ8vqTjoTliSqqiUMzJkkjpWu5HUkUy
	Nh
X-Received: by 2002:a05:6000:230a:b0:47f:8aba:8a9a with SMTP id ffacd0b85a97d-47f8d71c7eamr5497660f8f.18.1784826265170;
        Thu, 23 Jul 2026 10:04:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5f98:8c28:3e2c:1c72])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c67339sm17937986f8f.31.2026.07.23.10.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:04:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Bjorn
 Andersson <andersson@kernel.org>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Heiko Stuebner <heiko@sntech.de>,  Prashant
 Gaikwad <pgaikwad@nvidia.com>,  Thierry Reding
 <thierry.reding@kernel.org>,  Jonathan Hunter <jonathanh@nvidia.com>,
  Tero Kristo <kristo@kernel.org>,  linux-arm-kernel@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-msm@vger.kernel.org,  linux-renesas-soc@vger.kernel.org,
  linux-rockchip@lists.infradead.org,  linux-tegra@vger.kernel.org,
  linux-omap@vger.kernel.org
Subject: Re: [PATCH] clk: clean-up simple provider misuse of the consumer API
In-Reply-To: <amImP6sFlv-sNhMh@redhat.com> (Brian Masney's message of "Thu, 23
	Jul 2026 10:33:35 -0400")
References: <20260723-clk-provider-simple-clean-v1-1-0c9668240467@baylibre.com>
	<amImP6sFlv-sNhMh@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 23 Jul 2026 19:04:08 +0200
Message-ID: <1j5x25d4dz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_100427_050142_397079CE 
X-CRM114-Status: GOOD (  14.25  )
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

On jeu. 23 juil. 2026 at 10:33, Brian Masney <bmasney@redhat.com> wrote:

> On Thu, Jul 23, 2026 at 03:20:59PM +0200, Jerome Brunet wrote:
>> Clock provider should not be using the consumer interface.
>> In other words, a provider should not be dealing with struct clk.
>> 
>> This change targets occurrences for which the provider uses the
>> consumer interface and corresponding clk_hw interface exist:
>> * __clk_get_name() -> clk_hw_get_name()
>> * __clk_is_enabled() -> clk_hw_is_enabled()
>> * clk_get_rate() -> clk_hw_get_rate()
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>> The change being very simple, I did not think it was necessary
>> to split it into multiple changes. If you prefer it to be split,
>> just let me know how.
>> ---
>>  drivers/clk/mvebu/clk-cpu.c            |  2 +-
>>  drivers/clk/qcom/clk-hfpll.c           |  4 ++--
>>  drivers/clk/qcom/clk-krait.c           |  2 +-
>>  drivers/clk/qcom/clk-rcg.c             |  4 ++--
>>  drivers/clk/qcom/clk-rcg2.c            |  2 +-
>>  drivers/clk/renesas/r9a06g032-clocks.c |  2 +-
>>  drivers/clk/rockchip/clk-pll.c         | 24 ++++++++++++------------
>>  drivers/clk/st/clkgen-pll.c            | 20 ++++++++++----------
>>  drivers/clk/tegra/clk-tegra210.c       |  2 +-
>>  drivers/clk/ti/clockdomain.c           |  2 +-
>>  10 files changed, 32 insertions(+), 32 deletions(-)
>
> This looks good to me however can you split this up by clk subsystem at
> the very least so that the various submaintainers can pick up these up?

Will do

>
> With that:
>
> Reviewed-by: Brian Masney <bmasney@redhat.com>

-- 
Jerome

