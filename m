Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7828BC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 23:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5KkfoazfSd7LbFAmZXs7FVBEh30eBrbBqu13ZxDK8Q=; b=kYLy+vE3duhS93efG8L5VS+T4R
	Lcp9WbWu26q6JTlayKhSyazq0E8L7AGPrjSoDEkntMsfqB3xY3cVfC4TB5uqoIqxWI9iGKiG72YoA
	mhS9d/WMo7LF04Z9xfwbEt8Qa5E/r8MKHrk11CTETyYmfaNJKEJhxDiIjRu3hsWn3Bd6mbX9WpT5b
	ff68dyulOTTbWbQpPYAlYa/i/kxAvY9M08szCi99fTIkFmpV2SFoJRnjgCJLU5RXr1oe1PIqTQjRd
	VwneyQBF0v7SI3XwC/uYmMnmspnvjmOD5i8J3d5yrIxVDC6uQys69PQ9r5qhSjEih2IiSD5weJdgG
	OcXIgwQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkjv-00000004dUS-3ib0;
	Wed, 05 Aug 2026 23:09:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkjs-00000004dTZ-17m6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 23:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785971369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P5KkfoazfSd7LbFAmZXs7FVBEh30eBrbBqu13ZxDK8Q=;
	b=QKszLQKHTkqU8jIZFdAWkoirZQ7m0eacUrrlGq74E2I+MMeHzDgP6V5/jMfJYg4G1n7Lhq
	tQP8hHwn31Ri5umuGO2V3jXDC+Zf9j09nEqUh/OouZ9EDgjUTuM9Xq0TVgc+FNgJ5IGJMI
	bitEZL4vTdXArxvssBNBUkSS7cxEok4=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-LeWQiChDPWWDWrGzGsT39A-1; Wed, 05 Aug 2026 19:09:27 -0400
X-MC-Unique: LeWQiChDPWWDWrGzGsT39A-1
X-Mimecast-MFC-AGG-ID: LeWQiChDPWWDWrGzGsT39A_1785971367
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-664c8e55e71so2532648d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 16:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785971367; x=1786576167;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P5KkfoazfSd7LbFAmZXs7FVBEh30eBrbBqu13ZxDK8Q=;
        b=GZ3D0dyh1Cviqj3PSiyrGf/Y4GzPgObd+Lab+xr72+gZ1i7Kg5BiFt30np9fbhGV+a
         H+PZ2BvEQlSXzjsD8uqDACKQ0Rr45NRVUdAD6XCwWhUrtz/WOL0M1i7LgcctptW7kVoK
         yM9RJSZgZDjzbaVBIOJ4cNSLZfRz4U7zWt3rfJ2It2+DXyoZ76OfftBBaPEr+NQvsguv
         WnIlFlAlqFKQtCKhPABBjwLBFvEMoizRsqZuIN/FGOAERbzh6OF0EL/q7YD674LsaCkv
         foRBx3Eq7tNk2xuLr1dKeK9iFJY8F+N7VBTuHonej8tkQ4DZBAASQD/7oyQRdIYCTqsO
         cn0A==
X-Forwarded-Encrypted: i=1; AHgh+Rqse7g3hysCWEFgLWFdmAbPm5w89C/qvMjpIGKpOpHnLrVkqP1wuhwgcslFlnZwktYtLfBKrLUYh6rxhH6WTnIW@lists.infradead.org
X-Gm-Message-State: AOJu0YwSyvSbXr4sFepUAefGA+DB8zMgUPp6MvyvRJNwx6lNxor0X7bF
	eXeYQVXAp5qzImDAkbR0deP2Hmf4jsQoDE6pqAvQ6k3vgDiq2iiPOVWlLzTtfQvPfwGLGSgkfYD
	g8eyjEdUxQRZ1I+xmiFXtlcOAVD6rp/OuF4hMAE18E5ffeUdnR8GYpyBv8jKHkDxDNqJP44KcwK
	nR
X-Gm-Gg: AR+sD13Nh6B8R5XkHTKdfHYT9mS5gG7KVkUxX9Et8Fbpebk6cSDkRYAI1wiGbwwd1WS
	WICcEVS1L8Hd3NMM8irErD+xhG9q0as8l5tOrnK6v0Yf8SRxwKXeY/DKk11/cIx7JfZvWn7TJ2d
	sB4Tkc8d4bdMXOxq7A+hj+GdrMOijioJf0XLm+NacNHPcrqgrLnfxZLih/VLWsR8LewwVSES8+o
	lgh+Mn0G3vw7N0HSeojAXWcvi61y5qHQSfaXVXHMWNYFUPWmmyDCIhrGgfRambgs0RZLWg7o4Ii
	xOnDN2GvQrwn4k999Ltkw2PDVpHV0bjrN8fl0ENHO0/ymuFBLxV0DKQnpgrJKfPQlsrrUmjMrUa
	mhO7rz+fWC1WXuaLpHr99iO5/lsOaChVHp44=
X-Received: by 2002:a05:690e:250b:10b0:667:a95b:59f0 with SMTP id 956f58d0204a3-6699abcfe28mr5022131d50.34.1785971366754;
        Wed, 05 Aug 2026 16:09:26 -0700 (PDT)
X-Received: by 2002:a05:690e:250b:10b0:667:a95b:59f0 with SMTP id 956f58d0204a3-6699abcfe28mr5022102d50.34.1785971366332;
        Wed, 05 Aug 2026 16:09:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-669913b9903sm3924589d50.7.2026.08.05.16.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 16:09:25 -0700 (PDT)
Date: Wed, 5 Aug 2026 19:09:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniele Briguglio <hello@superkali.me>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK
 output gates
Message-ID: <anPCo9nkOjpBUOlq@redhat.com>
References: <20260624123914.1767374-1-hello@superkali.me>
 <178267399833.3089434.5140309637329023610.b4-ty@sntech.de>
 <CAGb2v64kcadr1nAisu_3kyE-=-4oypDXTvAy--jQHa0VhmYoXg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v64kcadr1nAisu_3kyE-=-4oypDXTvAy--jQHa0VhmYoXg@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: adqhqPZn10p8Hhl6Lk6qZ03fIbUs5QAn0A1cSvMHOWI_1785971367
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_160932_371929_A9FD015D 
X-CRM114-Status: GOOD (  22.78  )
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

Hi Chen-Yu,

On Thu, Aug 06, 2026 at 01:00:02AM +0800, Chen-Yu Tsai wrote:
> On Mon, Jun 29, 2026 at 3:13 AM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> >
> > On Wed, 24 Jun 2026 14:39:14 +0200, Daniele Briguglio wrote:
> > > No in-tree board references these gates yet. Boards drive the codec
> > > MCLK through the parent I2S*_8CH_MCLKOUT, and now that the gates are
> > > managed clocks, clk_disable_unused() turns them off at boot. On a board
> > > that relied on firmware leaving the output enabled, that cuts the MCLK
> > > and analog audio stops working.
> > >
> > > Mark the four gates CLK_IGNORE_UNUSED so an unreferenced gate keeps the
> > > state firmware left. A board that wants the kernel to own the gate can
> > > reference I2S*_8CH_MCLKOUT_TO_IO from DT instead.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] clk: rockchip: rk3588: don't disable unused I2S MCLK output gates
> >       commit: 946352b2f88fd2378f0341312e47dff1e8dc2fac
> 
> In hindsight maybe it would have been a better idea to map the existing
> clock ID I2S*_8CH_MCLKOUT to the new gates, and add (or not add) new
> clocks for the internal MCLK gates.
> 
> Then you wouldn't need to update the DTs, wouldn't need this workaround,
> and wouldn't depend on the bootloader to set the registers correctly when
> booting an old DT.

Help me understand for the future: If the approach you describe would
have been used, then the clocks in the kernel would have been mislabeled
in the kernel driver compared to what's actually on the SoC, correct?
That would have been more desirable in order to keep compatibility with
the older DTs?

But the older DTs can still reference the mux, correct? From the
kernel's perspective in this scenario, the important thing is for the
mux to select the appropriate parent. The end gate will always be left
on. From a power management perspective, the power will be cut further
up the clock tree as needed.

Brian


