Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43868D3B98F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tN0r84mltrzWKXImKJPU4zA3MIm8jfWmB/JmJnj+81A=; b=Nn7s74ln9mv1qZqW3MqUptfNEv
	F3rHWDlSfH51MFk3KyzJ1qTazzcKRiOxalkiXB1I3CnrBzjcRf5vviJQBtuIcvoplV3t87Q95n574
	osRkhyy+GdaWiVyTTI0DCjkWEqZn6qrmtC70nj5Efhuu87Cgcxsgd98Drr18A4pN8W+aDSHYwZmq/
	3pz1qxLboFEt65F2iueih/WJOOoUHm/CCD4woC0KXGKg9/NZRx6IQQthRgA1KY6nuh6OBtugE5/dh
	fTYEWBhMbDlrdVQvUVEmQEjNGyDnqUgPmCnJyoCOSZyro6ZlOK1Mj9WtEYgravZgAsfbORPSeVnB/
	zT0HQVmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvoC-0000000AlHx-2Fdd;
	Tue, 26 Nov 2024 13:40:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvnD-0000000Al6I-2dyo;
	Tue, 26 Nov 2024 13:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tN0r84mltrzWKXImKJPU4zA3MIm8jfWmB/JmJnj+81A=; b=cGTHpe+PbK5cetpMFRQwt0vOma
	IKOaMrbpCHEttoujvWhb+esxr/IJylAxWpnIf6oPVztXWgiIozWpdwCcf5nlzE+qPrPWhc2VhAZEJ
	9lMJA34Trj5JhmDmUP8Kjgrua3Ij5DkAvWZnZJfr2pA8XO0cCIp4Ip3e64gcjWnzrTZcwJXIPKkku
	0ehWv/PL65V1Tqft1Arq2nPDfKaWG+a/8EcBFJRI6vlcEpojC8hjuayzHEWJC2ckVroBpSWKBYbsF
	fEiNoXJMQXoQXWkUO7WmkS4XTFm15tcnvC+A5qasNX5771F3SNdgtXBC2+igR8zN20Zb/jSMKGS/N
	S3umjoAw==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tFvmZ-0008Sx-N7; Tue, 26 Nov 2024 14:39:11 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 3/3] drm/rockchip: Add MIPI DSI2 glue driver for RK3588
Date: Tue, 26 Nov 2024 14:39:10 +0100
Message-ID: <9368781.CDJkKcVGEf@diego>
In-Reply-To: <D5F4UD59MUJG.2HFCTRSPELO98@cknow.org>
References: <20241106123304.422854-1-heiko@sntech.de>
 <20241106123304.422854-4-heiko@sntech.de>
 <D5F4UD59MUJG.2HFCTRSPELO98@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_053951_672486_C6CFF019 
X-CRM114-Status: GOOD (  13.95  )
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

Hi,

Am Mittwoch, 6. November 2024, 14:33:25 CET schrieb Diederik de Haas:
> > +#define IPI_DEPTH_5_6_5_BITS		0x02
> > +#define IPI_DEPTH_6_BITS		0x03
> > +#define IPI_DEPTH_8_BITS		0x05
> > +#define IPI_DEPTH_10_BITS		0x06
> 
> Possibly dumb remark (sorry):
> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c also defines these
> values, so wouldn't it be better if they're defined in 1 place?

they are quite device-specific, so for me it doesn't really make sense
to try to centralize them. I.e. these are the values that need to go into
the GRF register to select a specific depth and are more or less the
same by chance.

I still remember quite well the answer to why Rockchip hardware engineers
sometimes shuffle around similar grf entries between socs "because they
want to" ;-)

At least for the rk3576, they seem to stay the same for now, though part
of me just expects the values to change in the future.

So personally I'd like to keep them where they are :-)

Heiko



