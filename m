Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEB5CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 07:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cb1yUNLCTgn66O03RLwbPulTwZS1mMXYrlXUWjjfA8I=; b=QEK9k3vT0ExMCIYjHdwnsk89ze
	4jjrn7r1N5L4V5UXmuu90r35r11QKKylJwaRh/o3YBHXf+MyGsAN4srTNeNXbfkwjDWLqtzUhR/OB
	y+gHKJhbGL+Oh9Ms53/MdJTrqoVyjwOU67fUGkBMZ047ntTM+nM4A+BKh/DMB1PCQhzmEX4YCobqQ
	arLqlcqACVKLZk9bIGWyBDvCc1a6e6sQJy2lItxJJqwTESLqAMDXT1Xs7iK41xfTUjslWJdYfcsR2
	nc2kGBOH91EVuFnYHLkMS+392DJzJvh1Cgvxu73xJHjJEBHDIV8w/eoybE7GdUo6lH7ScgBlqwPyC
	I2EF6nVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQHs-00000004o8t-23LK;
	Thu, 14 May 2026 07:15:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQHo-00000004o8J-3aEr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 07:15:14 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43d73422431so5652751f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 00:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778742911; x=1779347711; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cb1yUNLCTgn66O03RLwbPulTwZS1mMXYrlXUWjjfA8I=;
        b=MxrbngiJ0ES8m6MQoPQ5oAb8qlHaTlD4WU0/CBh2nu2cO9O22hvFxweUTxCcRzqX/H
         7iGGx2Vmf5jsOFQyDfF5Uc+u/RIKHb8MgTBn5v0TFJDwnMJb2q41UabpRhY18zw+VIiJ
         QDE3lwHFceXK0Tc9M7SBji3SdR8nxa8dzKKkRiSK+zq02fhk8uFXcvnS5lPc0c+SDnPk
         mDR4QKfTcRTlljb3xPdph3W1xSCixDh4RfE/4Kb3/RufnmgZ/0UtdT33fHWl/abxZbqr
         cAswZwuwvqteLx9Vh262sr+PHv1MKLs2aYRIHQSLEY6KCMLEmDNHIG3utJHEIioeIn3f
         OX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778742911; x=1779347711;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cb1yUNLCTgn66O03RLwbPulTwZS1mMXYrlXUWjjfA8I=;
        b=JSAxSkO2gDlm3n+P/cECmX9/p1zik4Qc5ohc99ndlGrNJF789lJES2pRAslOvYYuDI
         PHd/Miz4EdnbkDT8UclappvOcPFpnaFEifxqi9ckmSYz+2LZzIHmE7BvFm+v0gDPR4Y+
         Zm1hwvrsVhl1G3xNvigZOxccitsFcVUIcPb3sN1bIXn1FILGwnxPz1XJDJMV6hCNV6Et
         NFEbeig6ehiA5rqlCBYHaQFZpoBXUtZcqfwX/2Jdeb8Vlk5RnmgawJX/l/GzwOAYdqmF
         SOVUMc6olXBVSPZQNPpyHUeMGy+y5mLy3pPJVpCDLv8lV1CdjsqyqQrUpn94WuDWvE3u
         VA6w==
X-Forwarded-Encrypted: i=1; AFNElJ99PXA+TZi13n9GNVhsxzhzQ+4ChR5KVjW/9gyTqLile1kNk0EsJgi2AT5kzJw/WSFpDS1OmH+XKk52pIjBcPKy@lists.infradead.org
X-Gm-Message-State: AOJu0YxIQGuuKY/mmqW2mYWMjIyN2SzVnkBvB9yON1FWva3VSy10NI9+
	/IPM7V0H71v5CesFc6BaUS3AVk+h+mVt+mY2HCDubmTavXhECtX65u/Kixfqn9SMAXE=
X-Gm-Gg: Acq92OEa4+1Nhtdz/jkQD4fC6147t7GnpCcTQHKGqOgqOSgyqzhritGQaPWqrU4eWxN
	26D73G5sMEfplLFSFB1l0rxfS/7gIACPuQJX+RxP3/xokfaEosk5XCd3L9A5uJ7vmtdCJs+9vcP
	sewPhtJJc7+kjfmBiVbMBMb094XJL3H1RQiDfz4aypynNJ8vhmajmnNCxwUY4vb9qKhhDQD4nl7
	c/yrgzsSH2757l5TaQdVLwwtom9qmkPiHi0loWLmGkDVZAebYpaaq6TwWruNP9ewii6YRjh4bza
	OLi/3q9+VMynNHylhdjGftjqgtuBy4KmhOeLJhWQLIWG7vRKRb0mRJ7lKOObzU5AZO6ls+plWIQ
	EBTWe7EeAVF/Abx8UAXPuXST/0adaUUUHfImqbCmJNDzDlIsMJpuI1Vutnly/ieNM0kNbxglVwp
	O7RnB7sGjoBHsgF63VB9NCpKsrcg==
X-Received: by 2002:a5d:588f:0:b0:44a:9b52:8891 with SMTP id ffacd0b85a97d-45c7814a552mr9697538f8f.11.1778742910811;
        Thu, 14 May 2026 00:15:10 -0700 (PDT)
Received: from archlinux ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm4327136f8f.36.2026.05.14.00.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 00:15:10 -0700 (PDT)
Date: Thu, 14 May 2026 09:15:09 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 08/11] m68k: stmark2: add mcf5441x DAC platform devices
Message-ID: <y4zg2d5zghoz3miqevutiin5swfnx5y2zew2zlv4jklxsyly5g@sxeyvth2tkrk>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-8-fcdae50cf51a@baylibre.com>
 <agTcEECgJvBydhe2@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agTcEECgJvBydhe2@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_001512_911285_1711AAB8 
X-CRM114-Status: GOOD (  18.91  )
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

Hi Andy,

On 13.05.2026 23:16, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 11:14:32AM +0200, Angelo Dureghello wrote:
> 
> > Add mcf5441x DAC platform devices.
> 
> ...
> 
> > +static struct resource dac0_resource[] = {
> > +	DEFINE_RES_MEM(MCFDAC_BASE0, 0x100),
> > +};
> > +
> > +static struct platform_device dac0_device = {
> > +	.name = "mcf54415_dac",
> > +	.id = 0,
> > +	.num_resources = ARRAY_SIZE(dac0_resource),
> > +	.resource = dac0_resource,
> > +};
> 
> It can be
> 
> static struct resource dac0_resource = DEFINE_RES_MEM(MCFDAC_BASE0, 0x100);
> 
> static struct platform_device dac0_device = {
> 	.name = "mcf54415_dac",
> 	.id = 0,
> 	.num_resources = 1,
> 	.resource = &dac0_resource,
> };
> 
> ...
> 
> Same for the rest. But I haven't seen the followups and don't know if those
> structures are going to be expanded. The commit message doesn't say anything
> about that. So I assume my suggestion valid.
> 

no. They are not going to be expanded, anyway, is there a real gain
using an hardcoded 1 there ?

Would not reissue a v3 for this honestly.

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Regards,
angelo

