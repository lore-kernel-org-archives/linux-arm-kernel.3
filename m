Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB67FCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzlovJlGJX04+5z99oBQpaTuexgmdv5pr10RaNussdc=; b=JUe3riNRA7TnuUknGyPlv12lv9
	u6zgeBonqRNnQM4t/bdyBkEOSahH5XkzY7EMa/YB9eUxxW3KUpXOxAP5Iq1tk3l98zSDIfPQ6HqKc
	EsZzQolzr8dDV1ryepDF8MSvDsueX8LcvZctNwNNYEAKJ9BZU0XD++tiRYS1CyjEcsTqMRzo0KykD
	UzeDI/RvFgXOLr3YlDrbV/Kpw2/YtTMg62f2El/lWnRK5QBTtCxp4H6aQLD7kNq1RmwdLd7vTcND7
	Lr2vIkB+OoMVQ6htwtH27sSTR6TQxK0ewQU59c39KAF6NkMMDj0p1xuLmHLwLhywRvR0+iefzj/EP
	IWcWIwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbeMb-00000004zob-1hXb;
	Mon, 22 Jun 2026 13:06:57 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbeMW-00000004znH-3j7Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 13:06:54 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-137eb0d76beso3730194c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782133612; x=1782738412; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JzlovJlGJX04+5z99oBQpaTuexgmdv5pr10RaNussdc=;
        b=RNc3iHBgvd5TCY7ICxb9OaXt9F77oV+/V0J26OtoEHHHcRiVBRorb7VaJhuzKV9Lbz
         eMpdOPV3cZFeABTqHf1Sq0D8Jtx6YgbrN/HwCsckv1h57Y59swNJnVuQRdrFFBjrPKQY
         +TqEJFyH5nXwgUH2JORIiBt60xuTT+JvrvRlP7XErcPykCTqhTufy1Eo2hnvHpLMf3RJ
         ywcaZSm/RNKxR3uPLEqbPZl4RQn+YlIuEz0eb5QzY1CxxunxmKWTO3oMTVXDt5GH7Cs7
         Qg3P1BTcdRKJ4Z/L8jB+oOXYq8XnA3eqLHqPQoi80v8GhDQdEvTXho8xEptZBtbdh9D8
         3E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133612; x=1782738412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzlovJlGJX04+5z99oBQpaTuexgmdv5pr10RaNussdc=;
        b=bILJZ5gR69JiT5d2rwj46HNlw+2e7g7ajaMCUM6M6CUs6Qxmc8cy+LPZmsHOltl5PE
         QquiSR6RtYviwwIbIeJPRSys/saFaBDUtyyjEKFti+/l5Q/zRY7g5JVhTYhP2mDSi48D
         JlbvWprSpYiuqpuXm0fMahwf13FbfC11UgOhhLzMFLu837q7u2/HYgMWivpBFOMkX6Py
         tOWcb8B0ZgOJxzLsyU2InuKy1KNgQJiTzWqcJcW5ZvmaLjqDCYALj1w/z4IMFA39y7N3
         OnKGmcULhx29MKejm+1OgehjR7aSU574M16EfCn89IvMs/3ZHilCsqglLpXzy7vjy863
         rbyw==
X-Gm-Message-State: AOJu0YzZXQ4hQ5FgWBTTQs2gj0LUZnhz5JjVlVxf4eRBY7R+BEVg2+Ol
	cYK5X3pp+cCGZfooLMwTAKTV1sslCY+N0Ib5WN2DFTriRAZAebmTC7KI
X-Gm-Gg: AfdE7cnwnDZa7bju4d0nRWJu2DxZYLJWsWZnJ7yLnfF2ljvq/4anH8zrAwZQCKIeQZb
	w4W/m3NCkRUtzLnG7FVDydYdUYOr978IIxjinwjjOyNYFGP71ukFSSIO5M4jlN9ivB1W5B4s5uS
	VLcwraoMoyQgQdQRPcF6tSbuxuxO30tC9dw6CaJfQNdY9ZzOwg3Dn7gV5wG1QMHEGhPP/iT/TlP
	nQj6ibh7VO1rzD1jOvEcehyOgdlqbMlh451R4av5OmKezX6VOliutIk50dBLT8F5fHlTCFyrkcu
	Z6q32AbX9/afhXiS5mHZQkT4Rh9Z0wwGN4WeevUtoEDr3pi4AgW1g3qC1oko/DjI9gITk5cKQWp
	KiNdgO6h0Ntbj3mmX6mgCV92rxxGLhyBtcLALyGdF6BxpyZ0kZbJfqr65XGRU6HJL/9cqeHPG/z
	8FYysPkzi58ZgNQAyFM2WuA4FBjjj3kdJMITrJTPsOm56CCRJ51YSc8JuKoU456w==
X-Received: by 2002:a05:7022:e998:b0:136:bb14:b0f8 with SMTP id a92af1059eb24-139a3051a57mr7768480c88.5.1782133611333;
        Mon, 22 Jun 2026 06:06:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adccb622sm8183703c88.7.2026.06.22.06.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:06:50 -0700 (PDT)
Message-ID: <ec74f1b8-cf7f-4b33-9157-1fd0bb7da7ba@roeck-us.net>
Date: Mon, 22 Jun 2026 06:06:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: db8500-prcmu: Fold dbx500 header into db8500
To: Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Ulf Hansson <ulfh@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-sound@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260619-mfd-prcmu-merge-headers-v1-1-8ea0ee23b4d6@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260619-mfd-prcmu-merge-headers-v1-1-8ea0ee23b4d6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_060652_945420_3E7D33C0 
X-CRM114-Status: GOOD (  15.21  )
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

On 6/19/26 13:27, Linus Walleij wrote:
> Move the DBx500 PRCMU definitions into the DB8500 PRCMU
> header and delete the wrapper header.
> 
> Convert users of simple PRCMU wrappers to call the DB8500 helpers
> directly.
> 
> The dbx500-prcmu.h header was the result of an earlier attempt to
> abstract several DBx5x SoC PRCMU units to use the same abstract
> header. They are deleted from the kernel and this is not just
> causing maintenance burden and build errors.
> 
> The stub code is using -ENOSYS in a way checkpatch complains about
> so replace these with -EINVAL while we're at it.
> 
> Assisted-by: Codex:gpt-5-5
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606180825.vUSQntkJ-lkp@intel.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>   arch/arm/mach-ux500/cpu-db8500.c |   6 +-
>   drivers/clk/ux500/clk-prcmu.c    |  20 +-
>   drivers/clk/ux500/u8500_of_clk.c |   2 +-
>   drivers/cpuidle/cpuidle-ux500.c  |   6 +-
>   drivers/mfd/ab8500-core.c        |   2 +-
>   drivers/mfd/db8500-prcmu.c       |   6 +-
>   drivers/regulator/db8500-prcmu.c |  12 +-
>   drivers/thermal/db8500_thermal.c |  10 +-
>   drivers/watchdog/db8500_wdt.c    |  22 +-

For watchdog:

Acked-by: Guenter Roeck <linux@roeck-us.net>


