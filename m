Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2EBC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:Date:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xp53MoIMHo7AsEpO8Qe4lYIdt8fxx6H0xofmt5rFOgc=; b=NN1+SiD6IHpx0L6lwtL5C1wf2f
	tFD/3IDhWfyIEjKmQ1bYO/RfQfPCt0zkGwKz80phIHoyMeplHoN4ThSWPUVx3JKVu4uyjpKSn2gZH
	XwQ5xeY6ER236iHdSiHCioTNj43mmFntnUsuKjVfo2I4rKtP1qrdbjtxLmmHe5Z8zoVvYsuq1IZrM
	W/hSUk21mMu6YbkoBFdk8tiAP2yCLVs+6AWOmgOIbzKWvKd6tTL5FoPaCQoJwz3rBN3bQFdaN5rJG
	3DCKc6U+mcClwtaAddYT+UppX8xvFz8eoMQOcIOc3HQv4lx49Ifp8L9kpOy5CiC57zhXjmMh8Ph63
	KMsTvxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCg1H-0000000Fq3A-0VSl;
	Wed, 07 May 2025 14:45:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfVE-0000000FiPM-0K7o
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 May 2025 14:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:Date:From:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xp53MoIMHo7AsEpO8Qe4lYIdt8fxx6H0xofmt5rFOgc=; b=S4YneOtHWA9Q+waagpM+5ldId/
	XnBRBuhMNKCmUjUQpjQMK7c3/Az6sh/pDKSzvZjpa2DNBEM0wEOD/Z2DJH/it3TswFvT5yofRPSPP
	1ISKf+eJEl8XbzAWg2ugy5A4dc5A6UPsOxIxR+BTZVMBOqX+7zej7SGysYgq4b/7Ew2H3ASvTpNDp
	onXaMEoB8LEG6Pe1TfGnqnq8eJ+PtpDy7Fe8bF8m1K19+CBoGHxXJL76BVscyFqF6Fpm5DGFjWgIX
	VeMZ8BRMld6m9IgSzE/oFpYZtPPflfXt2SYYMk14RejHVZlYad7GiosGetO3k40lHz2D/fMjwn0cu
	Gjqtt3lg==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCfVA-0000000FrBx-0Zqz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:12:02 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5fbee929e56so1771746a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746627117; x=1747231917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp53MoIMHo7AsEpO8Qe4lYIdt8fxx6H0xofmt5rFOgc=;
        b=cVnWYWE/wuh6ttXvobSIKbmeYRErUhd8km1XUXz3V9UU/jTJjMC6+KWmYP+143nt7K
         tt6mUG4WqHz2itn14Jw8Jwidu4D2fSCA376LyC88aiR0+EzGSP5K1/5oNiUVh6z/5y++
         pi/amzVbskOwMGfrgZKFBnT+5I3+LjY/RMY2Fqhgq/UE2aOs2n4gfwO1zyg2MQafGF8b
         r31K10HKuzBdqZgvbFugXIilSPwkcJtX9Ln4Xtihi9e0JyNyyCiVB3AhF77gT1O2edEH
         FS6qViYTbzmTweDA5RSjRrVUhmD5OljgwhSe+pLI3JmP1wi9DL8j4cxOgJpVnAhgqSph
         OaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627117; x=1747231917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xp53MoIMHo7AsEpO8Qe4lYIdt8fxx6H0xofmt5rFOgc=;
        b=RFedIPITewuN5o06oukAdQgPTB2jVE2pFEmO/V2Uz41yNGcB/Cu1PaXPXqcfrgLaHZ
         olriGw9AH0yXHOEvbX/kwOw0wbluV3Z6v8IWqYusEyHh1E6ppkEt8/5N+by4sfPWw0/c
         OQkwFbDAyBxu90RDgQWzgbmo4RQIKFcaRCS+3ivu0M3/qFibfHqSFzxnoz0KwlLBQ+5W
         IGmw1k+2dq/NS4WEWLULEL0/xwB07llYMmA8dkmLdlxCK2D+AHZghJ2SwwDB397U3jRQ
         fIsHLGaDeY94CUfL07UJnGkWWWzgTACYhDj0m0JRAqP7fJ60fVhAEVOWJuO8FrRHyxd7
         uKqw==
X-Forwarded-Encrypted: i=1; AJvYcCXWNnXxlZk6wdt03mTe1EF9uzHvThgBX4I2Y/1t7OMeQ8L1eP//CRDWv0dQ5QONBBfw/SntDjU+q1tb2PTVR9Sz@lists.infradead.org
X-Gm-Message-State: AOJu0YwP5ThH6yEMeN4zP8xyAdo2ySJPwY3qrIDUGGAlOadr48AlkEiu
	h69NQQSzTJgJlPjt7ZTLUqBEHlwb2ka2gv0TgLYg79qUjzA/AwzKn2zbu7qMkKc=
X-Gm-Gg: ASbGncub+F4mK+rNj429fC0y2jbrwGY38Vd+qc+ABvpbwI4smimhDaNkRZmCCRTggpW
	JSpSsYVmoztDNqISiY42c0runeC+Dkqqgq1ye0yD9LOkFLbp5MWWeg/lbb5Equ6S4kpbWPjuIKe
	4fZLoLRwWpaYP/XzxesxM5Z26e+yEiURWBbkekdrEZlCzXaM0kaggva/U7Ug11yKJQBHZamyiCT
	oTf5+KeZBJrF4JJP7BIYH3xAFGMdDjMfevgm503f/oMu5J4ggGSPNDDKmjLId79sN65MPx/wsm3
	KMxOA+8ns21l3uAtmTNwb97aCx8owr0rOeBUJ8hKiu9Ww18CGXkpF6YrfCExsFKk9z3S1xj/iCM
	OGWS1+Q==
X-Google-Smtp-Source: AGHT+IEAIOFFJLOZCm96czkAy45BL7wcAh0Bc4vKalFIoRDdZw1taF3C6vTBolVNjObPDoUwRAM9aw==
X-Received: by 2002:a05:6402:5c9:b0:5e7:8501:8c86 with SMTP id 4fb4d7f45d1cf-5fbe9f46ef0mr2916040a12.22.1746627117121;
        Wed, 07 May 2025 07:11:57 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fbf761f95esm806596a12.63.2025.05.07.07.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:11:56 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 7 May 2025 16:13:24 +0200
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
Message-ID: <aBtqhCc-huQ8GzyK@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
 <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_151200_365352_1850F4C2 
X-CRM114-Status: GOOD (  24.41  )
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

Hi Florian

On 09:32 Wed 07 May     , Florian Fainelli wrote:
> 
> 
> On 5/6/2025 10:49 PM, Andrea della Porta wrote:
> > Hi Florian,
> > 
> > On 20:53 Tue 22 Apr     , Andrea della Porta wrote:
> > > The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
> > > Add clk_rp1_xosc node to provide that.
> > > 
> > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > 
> > A gentle reminder for patches 8 through 12 of this series, which I guess
> > would ideally be taken by you. Since the merge window is approaching, do
> > you think it's feasible to iterate a second pull request to Arnd with my
> > patches too?
> > 
> > With respect to your devicetree/next branch, my patches have the following
> > conflicts:
> > 
> > PATCH 9:
> > - arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts: &pcie1 and &pcie2
> >    reference at the end, my patch was rebased on linux-next which has them
> >    while your devicetree branch has not. This is trivial to fix too.
> > 
> > PATCH 9 and 10:
> > - arch/arm64/boot/dts/broadcom/Makefile on your branch has a line recently
> >    added by Stefan's latest patch for RPi2. The fix is trivial.
> > 
> > PATCH 11 and 12:
> > - arch/arm64/configs/defconfig: just a couple of fuzz lines.
> > 
> > Please let me know if I should resend those patches adjusted for your tree.
> 
> Yes please resend them today or tomorrow so I can send them the following
> day. Thanks

Sorry, what's the best wasy to provide the updated patch 8 to 12 to you? 

1) Resend the entire patchset (V10) with relevant patches updated
2) Send only updated patches 8 through 12 (maybe as an entirely new patchset with
   only those specific patches)
3) Asking you to pull teh relevant commit from my own git repo

Many thanks,
Andrea


> -- 
> Florian
> 

