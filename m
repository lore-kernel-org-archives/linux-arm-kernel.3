Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B25BD12D72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 05:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlYch/7P7MKfX51HOayXD115fD1eKIDV7PlOr922WnY=; b=y04BrL8IytA7fn
	I2aRPBRECyLfQvJce060ZKfisG9G1SdkgfqFmh6CM8S10VRp5kZbexUq3xtBOCodGrNq/61A4HypF
	73m6o/dJX6LBokj/39508l1gQS2H/2ItAakTTa+c/L0qtpMRuIzKM6xH6sbeUTcpbVpUYtn2no9qo
	K+Cfa8vfWZRHbkfCwqMr/7g+DLwCc0Vh4bw0q71xnH2qagFz06oCKkGkti1Bic1vs+CE9AfMntRbb
	ZNk3Blb6uqQwcI+F4RCL8C4N9j9YA1mCDhh17m+JPneI2V2NFElQ73ucyXbxXcPRleNmJpjTUnozw
	HHNE9S6FSbr6CrfaHv9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAN2y-0000000GOyw-2MDc;
	Mon, 11 Nov 2024 05:33:08 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAN1C-0000000GOq5-0s0Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 05:31:19 +0000
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f8490856so5006204e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 21:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731303073; x=1731907873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qlYch/7P7MKfX51HOayXD115fD1eKIDV7PlOr922WnY=;
        b=laVPFZ+rae62IQx9dDfK7kQJU+9oZfIQ18FJIvEWpG1+tH40PvNlm2NTKRsFKz/flg
         mdfN8j5lpHULVj6vWYcEHbSUYfsvtt3Y3AiuRWIDP06ri/s/hv+bdR5DfNG7fg4imT26
         MSMylwZW+6XzwnuRlD9h3lzVQLtvapLZ/f0TceRwkaQL+/rCTzDhjXdfqGXeMkZfcPiE
         AIJTfM+koGHiP0NyfxNpNxKeTXcS7QsOHq/OzQSjj/4QCofZ/zRUvse2tVqgmF9ghtIS
         dqvMCTjisxPDgNFsjiJg0lRdELe39+gz/3kmCXlYMLZ7TsvlKVPjtFa6NunLL49WQQqU
         Wjaw==
X-Forwarded-Encrypted: i=1; AJvYcCXiawyaDYn9wiwBqkSIR0qj3CCtPgaqpxZwpORcoDXfW0HCK6Vux+s/IB4RMeF+lqFpNiHJ1FX70Pnq+9R9Ji9f@lists.infradead.org
X-Gm-Message-State: AOJu0YwTVK42eEAd34DOV0/6GGKnCI6DJ3TfMfJtMZZpKH96bCfH/LpZ
	7q3/o5CP3iiA2Vd/l9dLJoP3t+AtJx1y3SQxj+FWjBMjQdYWHDAspXdkhGmK
X-Google-Smtp-Source: AGHT+IHhkOszyxREU1w2tl4H/IRFyNK6A9Cy8ZS7Vr/JIWh4UGqiZRjAHUmkIEEoyIbv6hoynUbR2A==
X-Received: by 2002:a05:6512:4024:b0:539:9f52:9e4 with SMTP id 2adb3069b0e04-53d862c6a2cmr4647929e87.48.1731303073284;
        Sun, 10 Nov 2024 21:31:13 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9d2bsm1411405e87.201.2024.11.10.21.31.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 21:31:11 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5111747cso33825781fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 21:31:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlUW8pj4/a0Fdo1Qm0W91PybrKQo98BEy7lzHSS2v4x8s67c36hVvyj/vGOMAjqk2xAibQFiXak7S2e3h+1cse@lists.infradead.org
X-Received: by 2002:a05:651c:544:b0:2fb:6027:7c0a with SMTP id
 38308e7fff4ca-2ff201e734amr40481541fa.8.1731303071547; Sun, 10 Nov 2024
 21:31:11 -0800 (PST)
MIME-Version: 1.0
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-13-masterr3c0rd@epochal.quest> <20241111041311.hleaz5fgipsyxigm@vireshk-i7>
In-Reply-To: <20241111041311.hleaz5fgipsyxigm@vireshk-i7>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 11 Nov 2024 13:30:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v646NHFAni=P+iC8OZsWMpg0PJc=kYbuWaY=C0-W-q6qAw@mail.gmail.com>
Message-ID: <CAGb2v646NHFAni=P+iC8OZsWMpg0PJc=kYbuWaY=C0-W-q6qAw@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] cpufreq: sun50i: add a100 cpufreq support
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Yangtao Li <tiny.windzz@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Parthiban <parthiban@linumiz.com>, Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_213118_267942_00A12FBA 
X-CRM114-Status: GOOD (  13.36  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Nov 11, 2024 at 12:13=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> On 31-10-24, 04:02, Cody Eksal wrote:
> > From: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> >
> > Let's add cpufreq nvmem based for allwinner a100 soc. It's similar to h=
6,
> > let us use efuse_xlate to extract the differentiated part.
> >
> > Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> > [masterr3c0rd@epochal.quest: add A100 to opp_match_list]
> > Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> > ---
> > Changes in V2:
> >  - Add the A100 to the cpufreq-dt-platdev blacklist.
>
> Can this be applied to the cpufreq tree separately ?

Yes.

Acked-by: Chen-Yu Tsai <wens@csie.org>

