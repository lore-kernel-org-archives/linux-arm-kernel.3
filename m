Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA3AC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 18:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4dtfQq0LoWw/3ydG1RDjF69SLaKZZaFrrKNUkkKRCQ=; b=zSJN8V/xAWCNkZeanAtMJ0pUX9
	VTcsVDAsZlDSBDQFI6ewIb6FgoCbmC40A7xViFFHEa34bdX8kBMoI+cvAfaxTeiWVrx5875XE1Giv
	M3dsxnmtf0jjJdcl2LY1jwO08JIQGDYmk7/yzeAoUlnr5hPgRDsaW6oo22Ep/Dpl8+SOI+LjTUz79
	oHtSZLe7n9aAuwvkR8LiS+FxuSxTtIPj7sRLpdIUlQfcRSKbTJiLuiNgTHWaQ37bDNailcvfW96Rk
	yfoA0QTr1Gt2sTCOoFIgEOFcXm4hev8fOksuhCWiLe3gj8iQbokGgAfa9gi5IvzopnxQQwPgN9diS
	dqYgnFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x412i-0000000A19j-0rTc;
	Tue, 08 Sep 2026 18:59:40 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x412g-0000000A19E-05Q3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 18:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788893978; x=1820429978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fWURKfC0YnKtnpIW+sCXZWGoSCh2jCIDL2blX3O/UH0=;
  b=hpvlEDoEVYJJFE5KPZ1SEHluwSwPltL9m+i6562+kiBlrV2md/+Zhh1e
   RyPPYtSWs1GDPXdJEV/sxPlCZi3B7VjVyS0wkg3v6ybdGbV/NN+kcB04D
   QWQV0g7agiPxH2mAdrrBATfqCxxs4VONwWdeOsdRBiTVJ+szptNRbNPK3
   QJFUlQc/PXUUFevuHSk6N5IIE4uR8kdeTFVKtqUZLCz+iL+pDP/bTi6MO
   g4I8O/VqNRGgfkQDq0GxeXOV4ws6BH/lR5VOPKKQ/bQdovZfusr+8wWdU
   OvzYWDGymduvVP31Z6fXPs0Wd1pHpgpHZOHtSaZsMxevMPpdG+5iNxhy3
   A==;
X-CSE-ConnectionGUID: bMOD4dFxT6+umQUhOLTAiA==
X-CSE-MsgGUID: 6EyXbcvwS6ONCywkWs/kng==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100828043"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="100828043"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 11:59:36 -0700
X-CSE-ConnectionGUID: SAxxF9giQsaP/2WeIAZ85A==
X-CSE-MsgGUID: cktt8h4WT8SZl+P+UCCZbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="266773711"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2026 11:59:33 -0700
Date: Wed, 9 Sep 2026 02:59:32 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Heiko Schocher <hs@nabladev.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4] driver: fpga: xilinx-selectmap: add csi and rdwr
 support
Message-ID: <aqBbFGExUpS0k0yE@yilunxu-OptiPlex-7050>
References: <20260810062105.299808-1-hs@nabladev.com>
 <ap2Yx8oACWfBKOep@yilunxu-OptiPlex-7050>
 <6a489d2b-b5d1-0455-793f-f4100fd3b3d1@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a489d2b-b5d1-0455-793f-f4100fd3b3d1@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_115938_128058_2FC48149 
X-CRM114-Status: GOOD (  21.62  )
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

> I would change v5 commit message to:
> """
>     The driver requests the optional CSI_B and RDWR_B GPIOs with
>     GPIOD_OUT_HIGH and never touches them again. That flag carries a
>     logical value, so both signals end up asserted on every board,
>     whatever polarity the device tree states.

Yeah, that's clear now.

> 
>     Keeping them asserted works as long as a single FPGA owns the
>     SelectMAP port. That FPGA is the only device on the bus, so it may
>     stay selected, and the driver never reads from it, so the port may
>     stay in write mode.

I think keeping them asserted is a bad idea even for single FPGA, isn't
it?

> 
>     It stops working as soon as two FPGAs share one SelectMAP data bus,
>     which is the case CSI_B exists for. Both devices are selected all
>     the time, so every byte written for one of them is clocked into the
>     other as well, and neither can be configured on its own.
> 
>     CSI_B (Chip Select) selects the target FPGA. Assert it before the
>     configuration data is transferred and deassert it afterwards, so that
>     only the intended device sees the bus cycles.

What if we re-program the 2 FPGAs at the same time? Is there still
chance the 2 CS lines are all asserted? Can they be correctly
re-programmed in this case?

I mean I think this patch does fix the problem of "always assertion",
which is good to me. But the changelog seems stop me, it talks all about
2 FPGAs sharing the same bus, which seems more complex than just
manipulating the CS.

Thanks,
Yilun

> 
>     RDWR_B (Read/Write) selects the transfer direction on the SelectMAP
>     interface. Assert it for the write cycles that carry the bitstream and
>     deassert it afterwards. UG570 wants RDWR_B settled before CSI_B is
>     asserted, a change while the device is selected aborts the
>     configuration on the next CCLK.
> 
>     Both are requested with GPIOD_OUT_LOW now, the logical 0 that leaves
>     them deasserted, and their descriptors are kept in the driver private
>     data.
> 
>     A board with one FPGA keeps working. SelectMAP allows the bitstream to
>     be loaded non-continuously, with CSI_B deasserted between the data
>     transfers, and a deselected device ignores the bus.
> """

