Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAA8CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 23:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7uiIeEfgdlPYTD6UL4WzVPf/Tll8ADDPeUkNnf2rCA=; b=LQEDoS3hQSGkHN2aJIhyp0ulmi
	/YKs8fjcPNtLUOVX2+vUqEfIQkJ+EDkwiA86Dn4UxpUbY1lUy0hVOr00B3JOfTaqSSKUmJ26Py8OW
	HpPapITsr/ZGsYM2tlHWHTtT3MuvBzPhi8pEMk7UFQfTizvZ3cX8jEyILtL80HUkRdUinie6SchfN
	ZPXo5oZZ+JmUQMMEwPziJ+Wzs2lKAsbO1X6SIqtkj7Pygg/3mdoJzz9QnmtzBB7uCJdMVmSNSYzac
	SkJW+3b+rm1eX5R9WxnTk9i/2wH1XppfFzq4tUNtcvjr8LsrRP3Cq5NrGiJ0Erm8hbJLTifjdMFK5
	5xWp40TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyIYh-00000005slJ-3cfU;
	Mon, 15 Sep 2025 23:24:31 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyIYf-00000005skO-1pJ8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 23:24:30 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-32e0ef1ba46so1663528a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 16:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757978668; x=1758583468; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J7uiIeEfgdlPYTD6UL4WzVPf/Tll8ADDPeUkNnf2rCA=;
        b=Fi6SO/bTPpWCx+AlCgFwtqBFVyUogPv28OikXGksw7IVuWszzZR0zgUffx0+L7o8he
         HkCPeuuQ+kBM/T3LgbNR8fkpNOsaNu0zl7xl+dFyPOe14p0W4yuTeKtuVv0rvznmEx8p
         Yg/5s92nU8UcOvDsiL+6jTxp0WozJpvZnS9TPAWH9V399GR2CwH/oHjzC5OCpgIsVC6P
         hMuYPIexzNWhlOmCXkc0PO/6+mkTshF4K2FjH2BXfvDGPBnuUHyGb6XUiKnP6z81ZQu7
         IhFlhTt8MNcWFCZxiq15ajE8bwdhBSFT8AZj7jyZBr5ua31H5kf5QPMYDgMhocuQcM++
         P3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757978668; x=1758583468;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7uiIeEfgdlPYTD6UL4WzVPf/Tll8ADDPeUkNnf2rCA=;
        b=Vv7wv83l/77bvLtuGgGBjhBIDnbz5W0RcmOwLUmeQh/vlNtP2Vhlu+W13rmPaJj9IP
         Yva1RDbArvANyG8cL/U5BjRUs7ZSx4MyPvV3/GgB7Ta683Jmu5oXZi2ek5v3kEaEivCZ
         VhMZSFHnlvkxK5RGlrnatRdDY27VD4ojEFJhk8Kx6xcbHRDegAr03/Sd6otPfw/NnAkb
         0hzkJiMamEyWUHO3rNaYFRHd/K6a2DWLBBU0x+o4nth5Bbfn5xCH9G8Et3jlTd5iS5T+
         d1WOhOIMwUI3La4Sh/BpqLvLGbr4kcfSFbvDfol9kosclovkIw8110McjSo5EhVUFX17
         Dz5w==
X-Forwarded-Encrypted: i=1; AJvYcCVzB1WX9lqwGac37qEKwTPI+v2e6WK6LTOnrILu1gVLKXORttXvYnx7c49THJoCCsYq9d6I9ZO2Y0SBsVTyuOgj@lists.infradead.org
X-Gm-Message-State: AOJu0YzD36gmGPZYsMN0IGaC9fokcurgKViTdC1fQe/xbAYIk7C775kM
	YgKPQ4Q1C88HlUV6R6VtUejT57PcWOpfIx2K5i+gZKRkmDrzTxNiVbuHQUvWu6iD7pw=
X-Gm-Gg: ASbGncvmwqDIsaSUdjp5JpltB9x4741PMThZ7oSPwM+V0LH3/LIEMuGUx7aPYWQsb2x
	rDg+LBrig+syw5CUnnZPjnv5+3oOLHcFq3q1LwlwahpYTHuXrXuVll/08ZHGUUCRT5x0xijcoWp
	GAssdoWXn41Zzz5ApBS3XBXmxZNr1N9YLGunwxam8HMmoMebfs9AyQ1WiRu5QnQutQeeommFU+c
	Y6NKC3GTUUByWv8QEF/Q2GVYGlIYuFaASxzwnc8LOP0JUQoeeVBIne4sb+5qiT0hohUGiG3QHDb
	/N6YHiaZxjEOFRCKEoRBCYvy1/k5VJGkp/8xsVIzrSzQ+7yTFY3elPKp/2Hb7gYRnF8D9nyr3+R
	wk8ph4Y6IZ61JfRrZ6A8k8AS5OIClZb8=
X-Google-Smtp-Source: AGHT+IHW+Ei25gxkyciUKrKbP1B/EsmDVjk/MF+hGzmjRjAtg2y1sc/2CYFiYtv3fYigvlxtLkhu6A==
X-Received: by 2002:a17:90b:49:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-32e528c62abmr7999389a91.24.1757978668587;
        Mon, 15 Sep 2025 16:24:28 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32df315f9dfsm11154777a91.21.2025.09.15.16.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 16:24:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Andreas Kemnade
 <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep
 Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] ARM: convert from clk round_rate() to
 determine_rate()
In-Reply-To: <175797847576.2104956.7606973558357095186.b4-ty@baylibre.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
 <175797847576.2104956.7606973558357095186.b4-ty@baylibre.com>
Date: Mon, 15 Sep 2025 16:24:27 -0700
Message-ID: <7hfrcn8fkk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_162429_477059_D9632C18 
X-CRM114-Status: GOOD (  12.91  )
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

Kevin Hilman <khilman@baylibre.com> writes:

> On Thu, 10 Jul 2025 19:42:15 -0400, Brian Masney wrote:
>> The round_rate() clk ops is deprecated in the clk framework in favor
>> of the determine_rate() clk ops, so let's go ahead and convert the
>> drivers in the arm32 subsystem using the Coccinelle semantic patch
>> posted below. I did a few minor cosmetic cleanups of the code in a
>> few cases.
>> 
>> Coccinelle semantic patch:
>> 
>> [...]
>
> Applied, thanks!
>
> [1/3] ARM: OMAP1: clock: convert from round_rate() to determine_rate()
>       commit: e2c0510935c5485a2dacfd13af3958536b9d138b
> [2/3] ARM: OMAP2+: clock: convert from round_rate() to determine_rate()
>       commit: bb676996ed583464504123721195e98a708fbba9

I only toook the OMAP patches, Linus W. should take the mach-versatile
one as he's the maintainer for that platform.

Kevin

