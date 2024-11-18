Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16287D49237
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 15:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcdYT/Uh7UqX6AjtZ7UdHkcbTbowywlXffqSJQl8EKo=; b=r8mT/NLTJZ4991kwPgoPJfxNcA
	HQp4ZHn5Xp6CGoJtU9J37flgAbtAIX3adYaoZwJoJOWJ5lZkcbKJtTmEprLJ0L2Ur3d5UOTiEeinG
	EjoOtOSfdFTtBUMvr7kobYnl2b9FnXX6ulwNftmYz+YIeFHdXHxVbcZ5KJw3HV41ObBw8oh4yWM4i
	FTWYUtK8nazIkvHZf6lzQYYGaTIV9FLPDnBgECYlwrmpL5dlR0DmNX8Fiy6DkDeMyLkOZytNlKFuu
	gbW/XeJTa7szznTP8cTKgw26brjoyjh9mmoHMiSplZS/kfxlQf0lpdFt5X++9+gL71+4oKo9WG02z
	pkDRDF/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3qG-00000009x08-1rbO;
	Mon, 18 Nov 2024 15:39:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3o3-00000009wY8-32Na
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 15:36:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F31D25C5B1B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 15:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7BBC4CEE0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 15:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731944209;
	bh=Z1F/WWyh2Br9EzCFAJEMyj5kDOKy73YHKCPpES500bI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z5Z0fNkRnjTm0IZXW2zvx37V1hMc1SiJyYJMC00zEObYgv1mbaRxWImHuHcBnm8R6
	 JmUzT8F+nnCVD0SEOxnnY8LOsvQblPKgQZZI/hWgRc8KUX/z0L2WsNOJ7R0nikOnnW
	 8bRJh83qn5mrr0APrsALEgS9Daz7o4YyEeLZqWZk7Jsv4HClspSf4cJ4a+lH5MhH+1
	 qWbuIQ+RtMk305B8I9Oolu9+KS7r44GtXNSCOfIPaPD0KVoV7kr5jwvI1EcwV4RS5v
	 W9yODhpt/CWQhjFsh0frkI5fbJMO8gbRocCxprparKAk7CpGzjMqQ0dv0csIPrRqQX
	 f3iGOJuzDkVHA==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e38261653aaso1620911276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 07:36:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQ3KHAJqrd7jq3kHjlOspk36nH5p4ustxBMBlHiV4S5E7yLUlWk5zfj8KU97kqCw0EAOLjgfpUfrqyYY/GWX6r@lists.infradead.org
X-Gm-Message-State: AOJu0YwSCEEqs4Xjd6eYd2EkJZi7d+cqV4ndIEe2r18AWOGrz7fafzhd
	MBWtlFURGZiFa5b7J5liU6ttc6YLvE9gKoe4Na+fGWdnuoUgW1moxtZssEBfckn9c2bSUnCNTxU
	eTAHl0pH8pzysSxVW6bgJvTxZmQ==
X-Google-Smtp-Source: AGHT+IEEIGFak9qKklcZsvCILXL3wsmYpRQVXReSreMGbi2y4CLvncVZuNk4Ue6AECvkVYWTyDD0MnYKDyXhx+DEKJg=
X-Received: by 2002:a05:6902:1701:b0:e38:8579:7e44 with SMTP id
 3f1490d57ef6-e3885797fb6mr6028789276.50.1731944208623; Mon, 18 Nov 2024
 07:36:48 -0800 (PST)
MIME-Version: 1.0
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-13-masterr3c0rd@epochal.quest> <20241111041311.hleaz5fgipsyxigm@vireshk-i7>
 <CAGb2v646NHFAni=P+iC8OZsWMpg0PJc=kYbuWaY=C0-W-q6qAw@mail.gmail.com> <20241111055504.2f3szrd5ahudvtqm@vireshk-i7>
In-Reply-To: <20241111055504.2f3szrd5ahudvtqm@vireshk-i7>
From: Rob Herring <robh@kernel.org>
Date: Mon, 18 Nov 2024 09:36:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJJ5A+nYKg1aU5zqGZsmtNJxpS3Gw04pSH-3xOkQ9Vzew@mail.gmail.com>
Message-ID: <CAL_JsqJJ5A+nYKg1aU5zqGZsmtNJxpS3Gw04pSH-3xOkQ9Vzew@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] cpufreq: sun50i: add a100 cpufreq support
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Cody Eksal <masterr3c0rd@epochal.quest>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Parthiban <parthiban@linumiz.com>, Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_073651_844931_F496C8DC 
X-CRM114-Status: GOOD (  15.77  )
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

On Sun, Nov 10, 2024 at 11:55=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> On 11-11-24, 13:30, Chen-Yu Tsai wrote:
> > On Mon, Nov 11, 2024 at 12:13=E2=80=AFPM Viresh Kumar <viresh.kumar@lin=
aro.org> wrote:
> > >
> > > On 31-10-24, 04:02, Cody Eksal wrote:
> > > > From: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> > > >
> > > > Let's add cpufreq nvmem based for allwinner a100 soc. It's similar =
to h6,
> > > > let us use efuse_xlate to extract the differentiated part.
> > > >
> > > > Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> > > > [masterr3c0rd@epochal.quest: add A100 to opp_match_list]
> > > > Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> > > > ---
> > > > Changes in V2:
> > > >  - Add the A100 to the cpufreq-dt-platdev blacklist.
> > >
> > > Can this be applied to the cpufreq tree separately ?
> >
> > Yes.
> >
> > Acked-by: Chen-Yu Tsai <wens@csie.org>
>
> Applied. Thanks.

You missed the binding patch, so
"allwinner,sun50i-a100-operating-points" is undocumented. Can you pick
that up please.

Rob

