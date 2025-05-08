Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00E3C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 21:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wt3w+Gn0EgqSBVHw6lctS6c+Nq+52QzX7+ZirB7/L34=; b=DZzwzGwgSNYHaRKHOzgRh5b8YJ
	F0j+PjI0bNQ1q2RU/8eY9mzpJ9PQIPQQ4YApXcb6eDBbWkn8R/oh+WmW09hFO0jktKrAFdiKQWwr0
	Lhf8pSN5cPznRYSImcAwE4ytvSK8ES7q2e9zKuOiJ6VZ6oGhuFlOEOpM9DRlcgsR67+ft3pEtGvCm
	Ok1OJW13KX7Pyq0zkQszykQi5qZgLePWXr3wdHMVyhob6yiR8+4Wq1ukJUgUE+0VVg4PkTrr9C0Qd
	WKLD224uOJ2Qbzgq2wDvhlkjAiiR+IyUwaE2X3zbEMm20bGmOg/yyu1EWW3d/D/ojakrHWgkbbdbn
	9eJ+TL/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD8X4-00000001owb-2aa7;
	Thu, 08 May 2025 21:11:54 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD8V4-00000001olx-0kSH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 21:09:53 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-acb615228a4so489200666b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 14:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746738587; x=1747343387; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wt3w+Gn0EgqSBVHw6lctS6c+Nq+52QzX7+ZirB7/L34=;
        b=S1oL4zNzEXAVg78YHR+AUiSvA2qLWPRj1KuWCE+uzG9zn/xh5QqKzSTy7xiVGzhn8h
         MBd5qxHMwcvqGzeZ1De2HwVnegC6rWS5UORbse2Hm3hvaRq+bmmKz+SYp7iPMMT1+Q9o
         fLQywx2I6AGP23oIa3hx4JISxF7FUsq9JYv8/h3dcLq/vlVDsQ5zDXmXpKE29WyvglgS
         FASauOQgl4yZn3xGOc5Y5lW8zCnkzsFKLkhCOjlEucin3E2fa2BmssMrOBN3foBOtQ8M
         1sRs4EqAeoLNK/mi5pmOgM99DiJuuhrX2zkHfn173r7x+aTZiHN4EN5YNNypSY/8VGrQ
         0TNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746738587; x=1747343387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wt3w+Gn0EgqSBVHw6lctS6c+Nq+52QzX7+ZirB7/L34=;
        b=Umn11syRGHHc3v5LSDylvMEi9QEanYv89QJCUS7KeTuAaU80SSg4IsQWpux739+Cwt
         rj/UcXFKWeoV3qgCQ/YxBp4K+boodHK9S/8gTSak6JmVzGU0tUsW4yILFbsOEfLfA93T
         O0IvUveOcm/092J+3RGU3LcvdXWYP3h73D/XHn/YnIY9Zzl/4pzsMA4iyDorqb9rXUh4
         40T11TRZTzp1y5JVmhPYZh7PvOFg1RBeHGlfSbNskJgULt22Rf535SZ6uxU4UBsPY1bJ
         wMmSTra97PUQENXM7zuxSxHOkJftaYuxAuCukr3gKckYpG294E3CID78hNMqwoNX5zDu
         2XbA==
X-Forwarded-Encrypted: i=1; AJvYcCV1SvRR/ifmQr6nTnxEvg8k1B7YOP/Uhyr6xLDrY9uwTgqSGN9eVVovVXaQTl4xfwD9sTDtN5b8dtyi/9dQDWag@lists.infradead.org
X-Gm-Message-State: AOJu0YyzYn0XVb+BfJFsqn58ioCjg3h8BDg6D0UcNJ/+sllzrOm+TlF0
	jBld9gn5CZpJBHUIWi4x4cbdDRznUPDr3h0Skc69BtngXK4NnDUiXDoWdQmAGf8=
X-Gm-Gg: ASbGncuiXZdGbrqXK7LcYVZXVucyJbr3qSP/ZEGs56gEwbPmO2H04eG1iEQrPISSu63
	sZdjCu6x8h4LDb9q7QChlWmXwzpC710a8BlOA+Kig+Oi3aGi9QyysOaZQ3QA9SrUKFuZTw5Hu6U
	0tOfwMZv64igel1CQwojMfxWCOV43Fat+tKR27tbyHW9+kx0pZYSr03NP2RhEWOEKEf6sfLm8Co
	REZZal9oh90oE4dWH+mXp6xr2ejSEfMxPAZ3PlepNin8r9GiyOAuQCVrvlHg7rinYhe+cBZoDt9
	GBLBryxVoPFaUOmOEwNP/s85zdDkM0xgNPzNoSzCq8MXJy7JyVw0l0lDw6kUS/hvzec5eCJXouk
	ggEaGNA==
X-Google-Smtp-Source: AGHT+IGtTDHi/AvD/8xVF94y9tqkLvaBF9rJtu3zqfIKtlmqKgx0l8+YKQe7od5kLKnDVvo8pbUjMQ==
X-Received: by 2002:a17:907:7f87:b0:ac7:b1eb:8283 with SMTP id a640c23a62f3a-ad1fcbdb0afmr453119666b.17.1746738586640;
        Thu, 08 May 2025 14:09:46 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cbe4c83sm405206a12.8.2025.05.08.14.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:09:46 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 8 May 2025 23:11:14 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
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
Message-ID: <aB0d8kNVtAEoW8Ts@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
 <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
 <aBtqhCc-huQ8GzyK@apocalypse>
 <779ae10a-3174-4dbb-9130-008393b59745@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <779ae10a-3174-4dbb-9130-008393b59745@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_140950_218823_2068C40F 
X-CRM114-Status: GOOD (  30.60  )
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

Hi Florian,

On 19:10 Wed 07 May     , Florian Fainelli wrote:
> 
> 
> On 5/7/2025 4:13 PM, 'Andrea della Porta' via BCM-KERNEL-FEEDBACK-LIST,PDL
> wrote:
> > Hi Florian
> > 
> > On 09:32 Wed 07 May     , Florian Fainelli wrote:
> > > 
> > > 
> > > On 5/6/2025 10:49 PM, Andrea della Porta wrote:
> > > > Hi Florian,
> > > > 
> > > > On 20:53 Tue 22 Apr     , Andrea della Porta wrote:
> > > > > The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
> > > > > Add clk_rp1_xosc node to provide that.
> > > > > 
> > > > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > > > Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > > > 
> > > > A gentle reminder for patches 8 through 12 of this series, which I guess
> > > > would ideally be taken by you. Since the merge window is approaching, do
> > > > you think it's feasible to iterate a second pull request to Arnd with my
> > > > patches too?
> > > > 
> > > > With respect to your devicetree/next branch, my patches have the following
> > > > conflicts:
> > > > 
> > > > PATCH 9:
> > > > - arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts: &pcie1 and &pcie2
> > > >     reference at the end, my patch was rebased on linux-next which has them
> > > >     while your devicetree branch has not. This is trivial to fix too.
> > > > 
> > > > PATCH 9 and 10:
> > > > - arch/arm64/boot/dts/broadcom/Makefile on your branch has a line recently
> > > >     added by Stefan's latest patch for RPi2. The fix is trivial.
> > > > 
> > > > PATCH 11 and 12:
> > > > - arch/arm64/configs/defconfig: just a couple of fuzz lines.
> > > > 
> > > > Please let me know if I should resend those patches adjusted for your tree.
> > > 
> > > Yes please resend them today or tomorrow so I can send them the following
> > > day. Thanks
> > 
> > Sorry, what's the best wasy to provide the updated patch 8 to 12 to you?
> > 
> > 1) Resend the entire patchset (V10) with relevant patches updated
> > 2) Send only updated patches 8 through 12 (maybe as an entirely new patchset with
> >     only those specific patches)
> 
> Either of those two options would work. Maybe let's do option 2) in the
> interest of keeping the traffic low for people.

Could you please take a look at this:

https://lore.kernel.org/all/aBxtyvI3LUaM3P00@apocalypse/#t

besides patches 8 through 12, would you like to take also binding patches + clock
driver (patches 1 to 4, if Linux Walleij is not willing to take patch 2 himself),
and maybe also misc driver and its dts (patches 6 and 7 unless Greg has different
ideas)? I know this is almost the entire patchset, but it's getting hard to escape
the dependency maze.
I'm open to any alternative solutions, more details in the link above.

Many thanks,
Andrea

> -- 
> Florian
> 

