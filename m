Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143F7E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 22:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/3DzJDs7HADsnw44UWmHJpcF3Zj9RPRSkT8525o70w=; b=hh4hRfA0XdzMjw2472Ypx3DeDR
	x+cqAtMP+27naNFgKYI1inSWK46PkN76Wd5yEG+9l5ykibyupHz3m+Y178vl/H+QuMffmvKAMO76/
	4XxjwP/JLrH0RZ/k+ansWRq/w/BpfQSrg567pgq6l9DLPQc6FY/+4WACWUN0mtzZewTtZZtMUrEWf
	hYfnB2/zOPex85EiYNn8T23j7juZG1FDF3czjtCx+k9k8m1eiioMYrc+wmEXM9Acz53xluNo+U6jM
	FjzFKjKpm6DVxciMRVyerPISLIffKDJ5bs4HqwxqOxdskNHFOk25P0bSlQ5RFIGKVvoGIMCYoJHyZ
	3+ELXjXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1Q6-0000000DV1J-0Tah;
	Thu, 09 Jan 2025 22:54:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1Ot-0000000DUqa-0vLr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 22:53:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C77BDA41DAC;
	Thu,  9 Jan 2025 22:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C15C4CED2;
	Thu,  9 Jan 2025 22:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736463194;
	bh=ygPBiRPZBdHE0lhMQk0UMilxxye1rAgfC0lt552dW+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CsYDOCEru3+AEdwiKyVkWO1mOJHA55tzrKUnUNyTndawph6pOFrhOW2l5pojnvJNg
	 XORMOFZhafzHRheJC4Iv5aiLfQ1VqP7MH4Pqu9XdMOpqsE4WY98zwSIMgV4mneTs4v
	 MSH1YspqDd9RCndarix0IjsiR7dityj4eKCyBBD+T6WcvBFrqeyyEK21WNNwg+2OY3
	 /uZxAB7095zODtu0FbcRODsUwetcSBxBU5PkfCNtgydf+hjYcotb4iZsTCuTmqvl91
	 mF8CF65TskxLdd9bruSw13e/03ANgi57eGbjP06pOzhD91/3VFwUjLrJXUYA5XPxxE
	 GHhEzoYh6bnYQ==
Date: Thu, 9 Jan 2025 16:53:12 -0600
From: Rob Herring <robh@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Cody Eksal <masterr3c0rd@epochal.quest>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 12/13] cpufreq: sun50i: add a100 cpufreq support
Message-ID: <20250109225312.GA434678-robh@kernel.org>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-13-masterr3c0rd@epochal.quest>
 <20241111041311.hleaz5fgipsyxigm@vireshk-i7>
 <CAGb2v646NHFAni=P+iC8OZsWMpg0PJc=kYbuWaY=C0-W-q6qAw@mail.gmail.com>
 <20241111055504.2f3szrd5ahudvtqm@vireshk-i7>
 <CAL_JsqJJ5A+nYKg1aU5zqGZsmtNJxpS3Gw04pSH-3xOkQ9Vzew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJJ5A+nYKg1aU5zqGZsmtNJxpS3Gw04pSH-3xOkQ9Vzew@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_145315_321327_74F4BC49 
X-CRM114-Status: GOOD (  15.83  )
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

On Mon, Nov 18, 2024 at 09:36:37AM -0600, Rob Herring wrote:
> On Sun, Nov 10, 2024 at 11:55 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 11-11-24, 13:30, Chen-Yu Tsai wrote:
> > > On Mon, Nov 11, 2024 at 12:13 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > >
> > > > On 31-10-24, 04:02, Cody Eksal wrote:
> > > > > From: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> > > > >
> > > > > Let's add cpufreq nvmem based for allwinner a100 soc. It's similar to h6,
> > > > > let us use efuse_xlate to extract the differentiated part.
> > > > >
> > > > > Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> > > > > [masterr3c0rd@epochal.quest: add A100 to opp_match_list]
> > > > > Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> > > > > ---
> > > > > Changes in V2:
> > > > >  - Add the A100 to the cpufreq-dt-platdev blacklist.
> > > >
> > > > Can this be applied to the cpufreq tree separately ?
> > >
> > > Yes.
> > >
> > > Acked-by: Chen-Yu Tsai <wens@csie.org>
> >
> > Applied. Thanks.
> 
> You missed the binding patch, so
> "allwinner,sun50i-a100-operating-points" is undocumented. Can you pick
> that up please.

Still not applied, so I applied it.

Rob

