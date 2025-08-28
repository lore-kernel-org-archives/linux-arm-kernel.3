Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9425C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+knyS2+c+jGuo6fC46mPYtwsTJxg5ztsNayK7xPVlA=; b=u3hjl9qMkvFKUsUw9mXXtv/5Ul
	87Kyw4yYBq/C9t8tqzBBkwUV6v+56WNrG4PBcRcAgb6FTBYCLWiiznDGQr06lfIxUa6Z5P9zEB0z4
	ubqqpIbaZiLzF0ldEAvnDfojzf1lnz4G2bfxmVBbPYdZxrpfvCh/77gogjUP/D3KM04hKqjyLopZD
	2+5mg9aL69Co2EdB/oLz4CA10VdUDYQHRgCZPwbZoq7uMtef9KXigZujfNYkJug+OiS13YLWQYFVk
	WgvLD+I9emyyLNWesAFH/8jF0n/cWP3BgOOOzLzIGr/c3FgJEHcbYD6ru5PCn7vTg3jJKKY6PYKIk
	+nCJPq8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhF8-00000002krY-48sD;
	Thu, 28 Aug 2025 18:21:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ureuj-000000029R3-0UKx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 15:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756396306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S+knyS2+c+jGuo6fC46mPYtwsTJxg5ztsNayK7xPVlA=;
	b=WPvfkh/ZMlk1YFDik4FVBRXAcjd2omz3iawr1sZekgqKQKgfXEXpiZ2Y9y3ZVYzMJFoMo0
	/Wz4CXj969ivxbuymnQvzrT4k91cLlr1adJgzm/FXXzlyu4IRZ2St/YE8kL4Jjx4+5dIbv
	yOtUM86JG74PAC+ZkLAVkXxpn/CByhI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-pNu4oUgQMCyfJ5ukLw-K4A-1; Thu, 28 Aug 2025 11:51:41 -0400
X-MC-Unique: pNu4oUgQMCyfJ5ukLw-K4A-1
X-Mimecast-MFC-AGG-ID: pNu4oUgQMCyfJ5ukLw-K4A_1756396301
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7f88956825aso260580485a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 08:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396301; x=1757001101;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+knyS2+c+jGuo6fC46mPYtwsTJxg5ztsNayK7xPVlA=;
        b=htZNBED6JomeufR2srPVwlfJI9x7vrkSzoo7Adcitm2Bmij2xrvOO0qjj1m1s44Plm
         t7Ldh/UmC6VA1xhUG+NCc3XX3900q/p7SoCkEjumeL4GW253sDpc6f9ULakZENqTjSmI
         yqgLcVT1KJe06mph3OUfF5kITYKjrgBTcvXecAJg/0ioPuUWAraFTRI64VB54rDARqRu
         G6w7uoXUTQXpd4hrRViRdrnXGTAxDlOPwRWOcJimzCdvAN+RtuykBDFWXBMyOzUqs8Ne
         9Vx6/pWsZ074HUFMgVi/M9bOSO7PrEVLrDa/+HTTPqBDCHNmF9rQ49je3hgL+eatY3I+
         yiFw==
X-Forwarded-Encrypted: i=1; AJvYcCVZu3qlBn1vUM4lEJTm5d87AfpE3UGxh5EUaTJegdilQInu2HCZjZEr/4shwz3DQyE18kt3lDBmxmR+HzSxt9F2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc33SosTred1fTLjCRDErsky9a6kdcsNQGbDtrlgOtqtQWm2bM
	fk1tWUfNO7Y1LjmeRZBX/+yzrCbr6nSbVl8wlFsDgqHxkwpmtv5oI/u1zdgt9bPArxZZQaAIjKj
	246b9KV1oMwgczriRxDQSaNUILvGOt7Yl2YE/CKkj/sTMrDUkrANjxxhS3DK9Y/fRA4vL7oZy8t
	7z
X-Gm-Gg: ASbGncuu9+MVFVb7IpDU0jk+VWrA3WlhnicHvf5mS7c9FDFfdNlY/ZiOODoQwSEN96B
	EgmVrFwreie7/9uO8mmdze2I49Czs7F9qMXNJA/LlLNfqaJMVH/fgieArsI7twU8l4tB/q1/Gy8
	CmNEiAaTAFAvMs1/bXqvMR6uw19u/IvLPFOMKWtMdGcBail+shqFF7LPOLCnqyJJNqkvsFjDwny
	2aE88OmcLBrQtVIFMTMp4wXCaeTPbkn4x4gecp9K/tH0u3mF/7npbRtAi3CxayY0+6FLPx048nE
	XTEICrOwDReix0s1uQdEA4tgJqJw/uIpTaXi6itekJ4/S3COLihcbfUVFbU1aVvYKp5hVhbEyP3
	RUDCj9lLv2hj4BzyUxAQ=
X-Received: by 2002:a05:620a:372b:b0:7ee:84f4:8134 with SMTP id af79cd13be357-7ee84f49bfbmr2632532585a.73.1756396301040;
        Thu, 28 Aug 2025 08:51:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJeyZ8hC7qSu0hkLbJpyPcPTqfRgt1CgSMTN9TL/BiqkQO+pTUormRnaRlWD6V++9KCREhlQ==
X-Received: by 2002:a05:620a:372b:b0:7ee:84f4:8134 with SMTP id af79cd13be357-7ee84f49bfbmr2632527385a.73.1756396300477;
        Thu, 28 Aug 2025 08:51:40 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc14478510sm2413085a.35.2025.08.28.08.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 08:51:39 -0700 (PDT)
Date: Thu, 28 Aug 2025 11:51:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ryan.Wanner@microchip.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 00/32] clk: at91: add support for parent_data and
Message-ID: <aLB7CJY9nMLoS1or@x1>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K-bEISuLK8T11s3LI1IC_GUD_sgIUgMc60FTlp9WAbQ_1756396301
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_085149_221402_7290A081 
X-CRM114-Status: GOOD (  22.01  )
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

Hi Ryan and Claudiu,

On Thu, Jul 10, 2025 at 01:06:53PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This series adds support for parent data and parent _hw on the at91
> clock drivers. This also updates all the SoC specific clock drivers to
> use this format as well.
> 
> This is a continuation of the V1 of this series here [1].
> 
> This has been tested on the SAMA5* SoCs, the sam9x* SoCs, and the SAMA7*
> SoCs.
> 
> Changes v1 -> V2:
> - Remove all the small sama7g54 SoC driver changes and put them in their
>   own patch.
> - Add the SAMA7D65 and the SAM9X75 to this update.
> - Add a patch to move all common used macros into the pmc.h file.
> - Update changes from v6.6 to v6.16.
> - Remove patches that where style fixes and include those in the update.
> 
> Changes v2 -> v3:
> - Adjust each patch so they are fully atomic.
> - Add a patch to have the SAMA7D65 systemclocks use parent_data and
>   parent_hw.
> - Add a formatting cleanup patch for the SAM9X75.
> - Adjust commit messages that no longer show invalid information.
> 
> 
> 1) https://lore.kernel.org/all/20230727053156.13587-1-claudiu.beznea@tuxon.dev/
> 
> 
> Claudiu Beznea (28):
>   clk: at91: pmc: add macros for clk_parent_data
>   clk: at91: clk-sam9x60-pll: use clk_parent_data
>   clk: at91: clk-peripheral: switch to clk_parent_data
>   clk: at91: clk-main: switch to clk parent data
>   clk: at91: clk-utmi: use clk_parent_data
>   clk: at91: clk-master: use clk_parent_data
>   clk: at91: clk-programmable: use clk_parent_data
>   clk: at91: clk-generated: use clk_parent_data
>   clk: at91: clk-usb: add support for clk_parent_data
>   clk: at91: clk-system: use clk_parent_data
>   clk: at91: clk-pll: add support for parent_hw
>   clk: at91: clk-audio-pll: add support for parent_hw
>   clk: at91: clk-plldiv: add support for parent_hw
>   clk: at91: clk-h32mx: add support for parent_hw
>   clk: at91: clk-i2s-mux: add support for parent_hw
>   clk: at91: clk-smd: add support for clk_parent_data
>   clk: at91: clk-slow: add support for parent_hw
>   clk: at91: dt-compat: switch to parent_hw and parent_data
>   clk: at91: sam9x60: switch to parent_hw and parent_data
>   clk: at91: sama5d2: switch to parent_hw and parent_data
>   clk: at91: sama5d3: switch to parent_hw and parent_data
>   clk: at91: sama5d4: switch to parent_hw and parent_data
>   clk: at91: at91sam9x5: switch to parent_hw and parent_data
>   clk: at91: at91rm9200: switch to parent_hw and parent_data
>   clk: at91: at91sam9260: switch to parent_hw and parent_data
>   clk: at91: at91sam9g45: switch to parent_hw and parent_data
>   clk: at91: at91sam9n12: switch to parent_hw and parent_data
>   clk: at91: at91sam9rl: switch to clk_parent_data
> 
> Ryan Wanner (4):
>   clk: at91: pmc: Move macro to header file
>   clk: at91: sam9x75: switch to parent_hw and parent_data
>   clk: at91: sama7d65: switch to parent_hw and parent_data
>   clk: at91: sam9x7: Clean up formatting

What tree did you develop this against? When I try to apply this series
to Linus's tree (6.17-rc3) and linux-next, only 12 of these patches
actually apply with 'git am'.

Brian


