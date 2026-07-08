Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA00C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93EN29IqJ6bd5F8a4d6goWGreJMuVVomREVtrVg8Odk=; b=pXRG0ZdqIbUNgTXLk3RJYZjA2U
	wfGdlUZp71DCFvQzYs9gCpb6fPiq4AT+TWYGAavvCL1WklvMrAbA3nDVyYrkpufN13DpF1f9MhAsT
	ZUT9yw+k9uTmnf6VEPp5VogO2+Fu08CLBpHf57VPKR8MDNGkGS0Z09cm+BPzOcXw0Vf7hWtwB9fMT
	7tJqFpao6EopLwqDoSZwTYyy9BlGhttZbp1+lAPGATmUuPzhnGPedCdc0m+HFaPj+qLOXhQChwaV3
	OtJob/KCbVW8BOVp6+RLZeFTcHOHSTKDQByNl9pwV1Z1IXa4AdJvh4KF8n8jxenrgRdav/WLCBqOz
	O18dq6xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPPS-0000000GsZQ-42zA;
	Wed, 08 Jul 2026 10:21:42 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPPP-0000000GsXv-13K2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:21:41 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-382ef647e20so569751a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 03:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506097; x=1784110897; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=93EN29IqJ6bd5F8a4d6goWGreJMuVVomREVtrVg8Odk=;
        b=pr2m2y1ErplqchrPSxhW7DiJFHNJcodEc1O+qY7hXmzuKKhbq2QX4dDz9X2QzQAQIL
         hXb6SiChTA9BzPO2sEnxN4zBpeQVnf8RWKibVydntfi4/ePQCHq9743pZLfqjN06pmqa
         0t+KC/XQ24uEMPMls7FvwEHQKsu/vzkWz9PsCNkX75kjPZL7Yfp2+qDi0TSpc/HvxpvC
         IqYu2Z0Z4UD27cXUcZ6UhBWSsMVl+sEWH4dpYpi4H87/5K1KKMacviedVfnLL495rEvE
         iKnOqR7+sxoQJdYYsQFEEkWfQmw4J0f9q4PFBqqlyAZ7sk8j0rn5Fe7PABytiXkxX/Al
         Fpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506097; x=1784110897;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=93EN29IqJ6bd5F8a4d6goWGreJMuVVomREVtrVg8Odk=;
        b=aFOTRu9EL3VKMCq2WobHpQ2LlVGU8uOY0MIPT8tW92eamalfONrIN9N6nnLaaSjq2N
         OBnurdLoLbNJ2jpheOAcIEuCsc9WDIM5lnflAh7gjJeDz0D7A08BnKg869KCjj/Cwt63
         qjaQ/EoSyGx8X5933U5c6cRA1ywviFgf+CkAjAjqmGlO1Q+jOT28m/YmQKhqShcOVwx0
         4NaWYfI5kGBTr1o64gXH7m+YWwI03Jsmv8Nz9kr2vrjARYiJQjI7O867Nni/ynHUgrhe
         xWWqUyGYWpbUVGG34YX+lXcUtFAXto72Ispt615lzzKuNBchYNAPQuom3g/TuMoPUDhD
         /oEA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4dPvNFA11/CHV+KbIZAGeuuu9YtzkQBHeQusX6ufWXqKRQ371Xox472gpKvZ1UAeG3GmGiFLob5JmFbtC8tE7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1DpmzsvZ61ZzOfDwoZm5KIpHVIc7KIzAO2mckjjQ0o6NK1dRQ
	0cP4L/+0tTLfu2UC/R6V+iBXfw33jXv8iT9AVYY+i1x9vHiwXgJIQTll
X-Gm-Gg: AfdE7cmue08mZP2vuZ3OQw0vbmiN4cjkkjkThSmNju+p8bWtuGdGXXVfumq+VaSTeyu
	q6M/5GQVoQJxaNYav5D9ZmKCZohbd5J0RI/tLe6iUTpe/HIAEWG8eLjmt4euS5UAKxSaXEOWAtY
	P8itCwZmK7F+GLbfW2oJgAWpBVefyS6nBuhSOLvOMRhFGTGQltvbervIueARlsIKkHrpaRDg4RR
	Y5o0SVCL2EphG9mVVymk/BP6ZL07zfDvbE7jXRB6vbiVgLXsXZR8Pt85/MyXmrsrGDgKfj8mkqa
	Hx4/k0bz18LBAM3FTI4PKru3QS0KgQ7PpLa/pWHS/Fyiv88co+b9EiXJ6uUrNQP/XoS+9VgYNGX
	ehiPkSQHWQ4cFbswPyl1qlObt+ywau969kSjcf+1mBjVbTqm/Ml9pshHi1CDnLMmPmNrcP5LIYZ
	3CNm+SUL9FfaA1GD7+GFPjcex7SQT1Yw==
X-Received: by 2002:a17:90b:3b43:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-38941102113mr1927534a91.1.1783506097233;
        Wed, 08 Jul 2026 03:21:37 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d3a65609sm2512387a91.14.2026.07.08.03.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:21:36 -0700 (PDT)
Date: Wed, 8 Jul 2026 15:51:30 +0530
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] arm64: dts: rockchip: add Vicharak Axon board
 support
Message-ID: <kzl6ykopmcj7nl6jnf4uav75cdn2znd3jb4vjlrde364homti6@2y2zfyvwni4x>
References: <20260608060940.52549-1-hrushirajg23@gmail.com>
 <178301901903.3838694.3276523670393868229.b4-ty@sntech.de>
 <20260707160354.GB3176120-robh@kernel.org>
 <14045151.uLZWGnKmhe@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14045151.uLZWGnKmhe@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_032139_691704_821F835C 
X-CRM114-Status: GOOD (  22.43  )
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

On Tue, Jul 07, 2026 at 08:23:47PM +0200, Heiko Stuebner wrote:
> Am Dienstag, 7. Juli 2026, 18:03:54 Mitteleuropäische Sommerzeit schrieb Rob Herring:
> > On Thu, Jul 02, 2026 at 09:04:55PM +0200, Heiko Stuebner wrote:
> > > 
> > > On Mon, 08 Jun 2026 11:39:38 +0530, Hrushiraj Gandhi wrote:
> > > > This series adds initial device tree support for the Vicharak Axon
> > > > single-board computer, which is based on the Rockchip RK3588 SoC.
> > > > 
> > > > The Vicharak Axon is a feature-rich SBC targeting developer and embedded
> > > > use cases. It ships with:
> > > > 
> > > >   - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
> > > >   - RK806 PMIC providing all SoC power domains
> > > >   - eMMC 5.1 (on-board) and microSD slot
> > > >   - Gigabit Ethernet via RGMII (RTL8211F)
> > > >   - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
> > > >   - PCIe 3.0 x4 and two PCIe 2.0 slots
> > > >   - SATA 3.0
> > > >   - USB 2.0 host ports (EHCI/OHCI)
> > > >   - NXP PCA9554 I/O expander for status LEDs
> > > >   - Haoyu HYM8563 RTC
> > > > 
> > > > [...]
> > > 
> > > Applied, thanks!
> > > 
> > > [1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
> > >       commit: e0008b108aaf8c5aa22930b2ceadf8f894562acb
> > > [2/2] arm64: dts: rockchip: add Vicharak Axon board
> > >       commit: e08c3389c78dbefd31a57df8807cf57ef6f3c9b1
> > 
> > Both have issues and should be dropped.
> 
> I've dropped both the Axon as well as the Vaaman2 board from the
> same vendor now.
> 
> The whole thing is confusing.
> 
> I should've caught the pinctrl issue, and do remember running a dtbscheck
> on at least one Vcharak board - but that must have been the Vaaman2 board
> because there the pmic fullfills the binding (and general setup of other
> rk3588 boards).
> 
> The vendor-prefix is missing indeed. I found earlier versions of the
> version-avalanche had it, up until v6 [0] . Though I haven't figured out
> yet why it was lost.

Regarding the missing vendor prefix 'vicharak' that was noted: the prefix 
was already submitted separately upstream by my team in a different patch [1]. 
Because it was already submitted, Krzysztof asked us to drop it from our 
own series to avoid duplicates [2]. 

[1] https://lkml.org/lkml/2026/6/24/929
[2] https://lore.kernel.org/linux-rockchip/96c9b1eb-9f8e-430d-9c38-eb4d489d7d24@kernel.org/

> 
> Hence I dropped both boards.
> 
> 
> Hrushiraj: please start anew with both boards.
> 
> But include all the tags you received in previous versions.
> 
> 
> Heiko
> 
> 
> [0] https://lore.kernel.org/linux-rockchip/20260601162143.170030-2-hrushirajg23@gmail.com/
> 
> 

Hrushiraj 

