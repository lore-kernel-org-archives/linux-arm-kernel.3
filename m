Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E37C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 21:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqgpeVGn0RSIV25AilpufRbxuFATmlWL+zdwTTPB/B0=; b=j2fL7Zqj0jJqOlx0J4hYJvBnlA
	ETLD/qwSJfbA0UgMlC9QHaMGbgi7uQLOhqXiLxRI73DXhQCVOJDeUgHwAZ9TyvuoN6DkjZQj8aH+F
	r2kcfPVsQh410n4KnI/VmKJsk3ISJcKXxydVAY6XbBnlNC4r/RHkSgBrR/1rsue+jnAFQha7/i+kg
	Biw0BEjxq5tfQfx2Kq+hcqvTjhglhuo2dAiZrmaaFvNCpdGjfqHh/wVrmujthClaL3TI1auWU5QKS
	A7gV0Bmf1ZEmOt7nO1ONkJUtDwk7qNoVN+gXh6UsHG9NfszngxNykyYyAIYHw60Jb8PW66BYK7cxk
	wy/QAWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnir-0000000AYQO-2Pa6;
	Wed, 19 Aug 2026 21:21:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnip-0000000AYPh-0A35
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 21:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CqgpeVGn0RSIV25AilpufRbxuFATmlWL+zdwTTPB/B0=;
	b=gNDEQ7Yj7uPQ54t5/YSnKU7vgJwKAHpBXumRH1iQZseluqtnzlzCLtu64c6Gi3enIHvEV1
	ymfY+tGbZzsyTrv0CbiJKGboMlUxQUaZbTEsyq3u7M6gcbbT/j4awdTZC5UBoninSuImsy
	Va4d+9j0CYSrGldwqsjkI0+2ULIKTAM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-y3Cn1xZROR66rvsy1ABP8Q-1; Wed, 19 Aug 2026 17:21:14 -0400
X-MC-Unique: y3Cn1xZROR66rvsy1ABP8Q-1
X-Mimecast-MFC-AGG-ID: y3Cn1xZROR66rvsy1ABP8Q_1787174474
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936d067836eso190501085a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 14:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174474; x=1787779274;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqgpeVGn0RSIV25AilpufRbxuFATmlWL+zdwTTPB/B0=;
        b=d+46yLEgXN0+uuE6QvPyJemlWP9fN6j10ZI0Ma4hxqlYz6UYgbkM2IqiWcOSTuuZLv
         /cwqwSMfknZuDqubd6MhCBf2ciNX7VmZPbvuR0evScfB2nRYOmDsGluOaJgJ5oQILPV3
         6MKTj7WzFYd8Saob8TxNQ3QJXcP7cO2djCfahQ/e/yJyZ9rXPG2swv6eighum44Hx/7p
         Sbcf4OccQKiSE6O/96lqRNF61v7DQo47yrySSpmetf+LivpISZx7opjU/41fnqd80ROe
         D9XYk3r1ogbQi3/BmdwF7qOJdT97OeSoHgoJxE2rOk1n8x4FtBe6aO6pcpJ8spvtGMTo
         M0jQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRsg7lZdh4otifD39N3Ki4U41XwPGN1zZ3ksNVZWvcfCcCWYKRX7nmrfdLSVcYsDY/WIg8Rpvojhdem3tFyILB@lists.infradead.org
X-Gm-Message-State: AOJu0YxvN/zw4hUT3JEzW6wB6FY4YJY4hPrs36h73kGOW3lLfBjLvc5b
	/pejGWdHTj39PwJI8xeOyr8lOL+kwKIIwy3PEFdkoBdANPa/GEQe71Q6NlAcVjMLrY0QUuac0AX
	t2f7vdk54BoyttlyrGC23GTI77IdA+6FCqQv93xVjYwMJOAU8zzyKQCjR0Z+15Wn/3K6YRD8+Nq
	E4
X-Gm-Gg: AR+sD13Lsi0qjx/uUnvVNWIja5s+n+JF3gWSbLjdX3fGaPxSMo1SBJp2Ch3y8IK7z5z
	BjdXUDg4EHGJnoOKvrXBg+cznqVB746/ZUn2z8syInd8ZrFLFwB5OZitrYBwUwvhf6Ih4Qif+0s
	nE06wBy3NtNm7AxVBAve88/LAKeWS4HcvieEd6DlazdW1aX5T9KJB+esQxUDYKm/MyX6QmLNqR/
	VHnu8F3kPR9eZTNirRf7tkHVxpKm1aH8UOqnaDgKxeFpXJYlR4HMEMO+Tam5otjdNio2jQlb5he
	ruf+62koEfSdjET6LpngRmHFTP6KMIZp1IuLvRJXqkcmsJSvYE/sPbHGMgTCnYk7My4GUVTEfcY
	tRHw0y5mDAb9FYx63EHL10heq5ixgvnob4PU=
X-Received: by 2002:a05:620a:6010:b0:937:139d:592c with SMTP id af79cd13be357-9371e67ddfemr822211185a.38.1787174473971;
        Wed, 19 Aug 2026 14:21:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6010:b0:937:139d:592c with SMTP id af79cd13be357-9371e67ddfemr822206085a.38.1787174473413;
        Wed, 19 Aug 2026 14:21:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720582980sm222991885a.33.2026.08.19.14.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:21:12 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:21:10 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux@analog.com,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 1/5] clk: ti: Make sure clk_init_data is fully
 initialized
Message-ID: <aoYeRqwY3SSZ2xDX@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eDsfO6tzyE0BFrq5V0cQTsDb8OhsjM5_PUg_0c3P2tY_1787174474
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_142119_147843_16EA6CF3 
X-CRM114-Status: GOOD (  15.57  )
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

On Wed, Aug 19, 2026 at 09:05:15PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> _register_mux() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: 667f420c09f1417c ("clk: ti: mux: resolve parent clocks by DT index, not by name")
> Closes: https://lore.kernel.org/CAMuHMdU3yVqoyHC4eNF2NuYo8wy+6ODLoYat4R71X99Mxc_=kw@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


