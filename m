Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F63C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c09duG40XUDjljTKKEnm8AMSUZjhNe4OtYQ1ssenbDY=; b=1eokET+29wZOSRmtsL+ly1Bi5R
	zMyB0ATqPUBR0fjsqPC+/xJQeZWonft7MnrlxZ3GOSDPLZEZEulZV4gY4r9eqHYcAFNSaAhv8zP7m
	GQgHVhaMSAnnmi4VOSW4TwUzzZt3bb1z+/H+Y0Lbgsfpu9dRkAEPLVYklW9aRIjGiHP8mAjK+9ds4
	bvddzWOMIgN7umVIhTvyG/5jUl0KRzUwimrUqkAKoYQ/+U7KjCpJ91LGU4cpDBLMWVsKFWkH8EWHw
	UcurfnfpjsZ4iFbyGR/pBRI5aoGqg5mrGwMhtzV+w8RlSDECB/Lw/dlpUIZDFW7vrVJA2q5MtRzjU
	adJn/zOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vvw-000000099tW-3KBB;
	Tue, 08 Sep 2026 13:32:20 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vvn-000000099pe-3HTo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:32:19 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c25085f2422so50204566b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788874329; x=1789479129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c09duG40XUDjljTKKEnm8AMSUZjhNe4OtYQ1ssenbDY=;
        b=sCLh6dbyJ6gFWlVJA3+RSlw3EGSJtsCr1dkokaYWFZJOR5xbPS2g1/Vft/1MgrcAL5
         7hNk0U9Q6kHGR4a2xqf1zMyy2Pii41mE8DCqANtIUG+aG7A3xDomd7YQL+3nulKCCqp2
         4uSVGDpK4cBSOdkX8ZOAzzUQv4Si2TRhEquydT7N7pzL74gD8iyObzuwi9782MYOzFHW
         elfQKLBFcPkCmxA34uMWsUcOoZOF5D6lgqeN6dqN6LtO7pufjDEhSvG2l2GsQSfeRdpz
         FSrq8S6h5YTVzYpMB3/iQPG84MF/ylANmTGNHkkS1QWrF1iUSv/mRGOKskhtHVY+NAW3
         sDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874329; x=1789479129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c09duG40XUDjljTKKEnm8AMSUZjhNe4OtYQ1ssenbDY=;
        b=CDypi5G+RTnGcgSwgzO2ice8Gyz79MRYUa+Hq7SlroQcn6tTF1bOpcxxeG59u/paFY
         z+b660j0zyiltj2ugZvsh1UlCilWKWOfd6ZH1py+TDn2ajMqgcTrdK1a2pj4pHBRwRIM
         PHsthoC13RgPSXYMWPqMk5NaAbyAeKjNzD9QLuat3TjPRHvSHnew+KNfdbWXCks0Rip3
         9jxJLWUwA6xycZKqlEuRmohRWRleOHLlRZ1mVjosQNtB5zFjW817HTpIGE+yovUwCFm+
         UehcTjYliz3QwvAbmks4pHOlyoRxbHUS+y1YTVDDqzBuBofLjuaniy9dngY20YhCW9Xh
         ywPw==
X-Forwarded-Encrypted: i=1; AKwUvByJ2sZmnuW/GNkHN8kc+wq53KOUHodJQ1pEivaCKup4OT6Xr+ArHdZ036iMNTMKUxywS+v2m98um7BjMBirh/17@lists.infradead.org
X-Gm-Message-State: AFuF++lIEpIXYq0mEI3B7ikRRPte17c4WSLkhiBShgMObzo6cxMs3wMm
	mFhgcBYBR3hsLxLfcWRUm+tFOrSAVJ6kTVuXBipUTdew5TuTkFBhnmCa
X-Gm-Gg: AYBFou1G5lzlHfqphJ1cLpdvZjhcw7XyufvcqqC9qMRbDaM9TqtJ0ryNxtgVdmD3Gkt
	F/oKSZu3izL6queIts/FGnHkDLQL7S82XD8CgB0RXuGY+KoCfHRp6zSB03kGbEuzmjuXIVNwEwW
	PDIBGC7jv09JgTkhGhwElxp5UPwaIcIesu1tsfDXMl6RBg7W8Pox1VrJZFBt47cBTsf95U+bkbF
	QSut7+hrsS745WWvH2xWhcxV/9xwfnyXJxJCI3uFdEtQWTnm0Bfbsk9SgEzYPj11ZIcCNVPRbmA
	opyoC4C5rAYV/MhX2Bje7bGpbxDESFwJO9JizWaaIz2x40upQbrGib7KmAwNd+o5vkggnrlRRe6
	ptZUt37HitWWzjmcwM3iQq1ga804GX0AbIOqr+X9wQVNvl+y0bCgI4kTWo81padtSh/4vlSOxbp
	0XiJD8T6V/XQqvTBpmkE6HIDD3ndzwHB67EfUVwq5AwOo1Nelc0j8YyTXHqbnoqTLPMmHzs1KCM
	4NAnggYPmNcuaYA5kfSHFcGugM/yfY7TDajqIl8h/WSR9a+FZThGlzZfriMAVLhwr0H5JmZIhpa
	cRGI
X-Received: by 2002:a17:907:3f8d:b0:c25:ca8a:8e25 with SMTP id a640c23a62f3a-c2624eef698mr794013366b.1.1788874329043;
        Tue, 08 Sep 2026 06:32:09 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B825D0079B84A36A788F67A.dsl.pool.telekom.hu. [2001:4c4e:1b82:5d00:79b8:4a36:a788:f67a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm36163217f8f.1.2026.09.08.06.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:32:08 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: s2idle resume hangs in ohci/ehci on RK3588: HC registers touched before the USB2 PHY is powered back on
Date: Tue,  8 Sep 2026 15:31:46 +0200
Message-ID: <20260908133147.8291-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ap__5zeUakMSLWOQ@venus>
References: <20260907190000.s2idle-usb2-resume-royalnet026@gmail.com> <ap__5zeUakMSLWOQ@venus>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_063211_830526_201C8D5C 
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

Hello Sebastian,

Thank you, that is a much better place to fix it than either of the two
options I asked about, and it matches what the board shows: the OHCI
that hung was the one whose 480 MHz clock had it as the only user, so
the clock was gated on suspend and the PHY was left in suspend when the
controller came back and touched its registers.

I read 53014abc in the rockchip-devel branch. One data point in case it
is useful for the version you send: on RK3588 the early return does not
get in the way.

    /* Limit to single port; it's unclear how multi-port should be handled */
    if (rphy->phy_cfg->num_ports > 1)
            return 0;

All four entries in rk3588_phy_cfgs[] have num_ports = 1 (0x0000 and
0x4000 as OTG, 0x8000 and 0xc000 as HOST), so the new code does run on
RK3588, including u2phy2 at 0x8000, which is the port whose controller
(fc840000, host0) hung for me. The num_ports = 2 configs are the older
SoCs, so as far as RK3588 is concerned that guard costs nothing.

I will build the patch for my test kernel and report back. My setup
should be a reasonable test case for it: with all four USB 2.0 hosts
bound, s2idle resume hung every time and needed a cold reset, and with
the four hosts unbound the same cycle completed 4 out of 4, so there is
a clear before/after to measure rather than an intermittent one. The
driver is a module in my configs, so this is a single module rebuild.
If it holds up I will send a Tested-by.

One observation on your second point. On this board s2idle is entered:
the machine goes down, the hym8563 RTC alarm wakes it ("PM: Triggering
wakeup from IRQ 52"), and only then does the resume stall in the USB2
hosts. So PCIe did not block suspend here, even though the board has
NVMe, two r8169 NICs and an rtw89 card on PCIe. I do not know why my
case differs from yours; if that is interesting for your PCIe suspend
series I can dump whatever state you want from before the suspend.

The RTC pin fix I mentioned is now v2 on the list [1], with megi's
Reviewed-by. Without it there is no wake source on this board at all,
so it is a prerequisite for anyone else trying to reproduce this.

If you would rather I wait for the version you post this week instead of
testing the branch commit, just say so and I will wait.

[1] https://lore.kernel.org/all/20260908111908.19371-1-royalnet026@gmail.com/

Igor

