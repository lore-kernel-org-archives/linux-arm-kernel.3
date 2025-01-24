Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D23C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 23:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7/eMVpXx+68IbocBkX45wzxl6Oa4llA1O2i3334KXs=; b=OhRtFuoLnWAL/bcnOLG2M0qvic
	M4KYbCGatWKWEDvdVBMp51jbnZMwAy2EuzjUDNC8IqdDcG/Vb8khSy0nihhTs3DoUNGdwK36ePQX5
	jM819QCDR9+2TGrUy/iqv4seVhZIEcUIz4DXnuYGcNufGyicRpPi3pNyzFa1+8eLrz97NMnG3Tr4m
	TZ5xdgTxCvGHfJdkn/54NIw5K/Ix6CJddYtYW+dPNFp8UtWGnfA54JrFo9OJklxjefhyY95K68Xlf
	mJo8htBKyiQWTYyQW5fdqE62kSU1Eh8axbXh77ocKxr8+E33Xvg4oeFWuuqMRuOPd8hP2+J39WE8g
	cxn31cJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbT0I-0000000FhQv-0adU;
	Fri, 24 Jan 2025 23:22:22 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSyz-0000000FhKd-28b9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 23:21:03 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-844bff5ba1dso206738139f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 15:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1737760860; x=1738365660; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7/eMVpXx+68IbocBkX45wzxl6Oa4llA1O2i3334KXs=;
        b=H4gKQ0P5wGV620wdg4D8Ji3jGkrHWq/Tf+wO0s86YfRkePPV8q3Wa1j26tHNB3yMIB
         K3yjBce5sk3rMoGUQi+G8H6QPFxSfBgncgSbSThEVkm1WX7UX5Lf6d5UgyuI9eP7uK/r
         BULwH8HW1KdGJQGCYv0NUkGkNNi5KpL3wZjVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737760860; x=1738365660;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7/eMVpXx+68IbocBkX45wzxl6Oa4llA1O2i3334KXs=;
        b=vzQ0DdJy1GBrLFRiI0mYejaJqJ+64bcHNaj9TqAzwli4DlD/ixpfxN7+HxxC7PVOIO
         lKfudlbUitr2AuLtwV5iZqUxw84NwiMD/1koAzXWhJV7Ndp/PtWsG4XrbJoa1LYsZr7r
         jOP/n/AuZhg2HmDayzBgW2ziVYT1EtmFBV0v2whV+QeB/QRCTq8clgcqCO0gSAg0KbLg
         n9UB8PjkH8naHk8JAY8WEWGjxS9SlZ/6nhpRUZeKiZ5wkamSsZKKoZ7Z1HAHfqozMlJZ
         XKq3NwpR4M0PwadvOIEaWEeYbBqcyETlqfFteVf6gKe2Q5M/LR750ij1uP6ei+Imlu1P
         vmXA==
X-Forwarded-Encrypted: i=1; AJvYcCWHBhYT07D8nVi1DKgFg66cVIefHWMHtSY+wSrJTC81NHlazEFM3plXxf25RreRyQ98AS0+6tcLIBxD7MYgXk3k@lists.infradead.org
X-Gm-Message-State: AOJu0YwLwJ5MVwHqYTy6RKiNvgEhLUrSkXAaihwKdlc76nrezW6ZZJc8
	K9QlH6p1lDavlFDh1GIESDktjIYo8mRvdX8fCOSdz/3ZSuq7AUtus/Jw2S6IOjw=
X-Gm-Gg: ASbGnct8NATphtoEfkbpp91YVy0YuRUF9cFR0ewUnfCJ0xXa9qLB+x2dHgIirC4ZHFr
	g0bLy+xrtR6xUqm9qBVm8vH1jakl41ESQWI3w+JCww17rGLX+XJyBefGOp9Xpq38Z8q6/I2R4k8
	DGamlvwN8QOcmW3eYCeEkxAbus+LpcHwuhTfvl0k29/hOtdEBStWYt/1Wi+E5fVAiMDwXLCocSB
	8JeU9YxMq/zUizqTSFwxeK4BKg55gRI9yEGWHn+58n9OCg=
X-Google-Smtp-Source: AGHT+IECMWc7yThU7l9WdvRzNr4eg6ummfBBXVEJMmSq56k2ixzMFXtpxeH39Pu9mIfQVrYnbtfDtg==
X-Received: by 2002:a05:6602:6d13:b0:83a:9488:154c with SMTP id ca18e2360f4ac-851b619f80dmr3126811239f.3.1737760860423;
        Fri, 24 Jan 2025 15:21:00 -0800 (PST)
Received: from LQ3V64L9R2 ([75.104.111.203])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8521e01abb7sm97948739f.36.2025.01.24.15.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 15:20:59 -0800 (PST)
Date: Fri, 24 Jan 2025 15:20:22 -0800
From: Joe Damato <jdamato@fastly.com>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC v2 PATCH 04/10] net: ti: prueth: Adds link detection, RX
 and TX support.
Message-ID: <Z5QgNu9AOzRre91J@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Basharath Hussain Khaja <basharath@couthit.com>, danishanwar@ti.com,
	rogerq@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	ssantosh@kernel.org, tony@atomide.com, richardcochran@gmail.com,
	parvathi@couthit.com, schnelle@linux.ibm.com, rdunlap@infradead.org,
	diogo.ivo@siemens.com, m-karicheri2@ti.com, horms@kernel.org,
	jacob.e.keller@intel.com, m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124134056.1459060-5-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124134056.1459060-5-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_152101_547064_6C0360A8 
X-CRM114-Status: GOOD (  14.45  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, parvathi@couthit.com, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jan 24, 2025 at 07:10:50PM +0530, Basharath Hussain Khaja wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Changes corresponding to link configuration such as speed and duplexity.
> IRQ and handler initializations are performed for packet reception.Firmware
> receives the packet from the wire and stores it into OCMC queue. Next, it
> notifies the CPU via interrupt. Upon receiving the interrupt CPU will
> service the IRQ and packet will be processed by pushing the newly allocated
> SKB to upper layers.
> 
> When the user application want to transmit a packet, it will invoke
> sys_send() which will inturn invoke the PRUETH driver, then it will write
> the packet into OCMC queues. PRU firmware will pick up the packet and
> transmit it on to the wire.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> ---
>  drivers/net/ethernet/ti/icssm/icssm_prueth.c | 599 ++++++++++++++++++-
>  drivers/net/ethernet/ti/icssm/icssm_prueth.h |  46 ++
>  2 files changed, 640 insertions(+), 5 deletions(-)

Looks like this patch was duplicated and posted twice ?

