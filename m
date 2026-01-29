Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63043D73E81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NH1Y7z4Xz/rnFfteVmXJ0FyGxvOgtpdFaiDdQOvHyM0=; b=oguaY5KbF8xQY1W15dW2FJt0fg
	AdsVbsqTCrKYRofrhvZiZdc6m1fGUKxmw99tgKBVjcmpcBReBu2Dl+gtdtwVBaA+mbHgTKtPkfnUh
	ZvoU1vSwitnrDVratDYLAQfhtAmeEPSx/K+n1HX0BdXswvwDqmfY99pVrCRLZfp4SpdkBDVZ1YFec
	c3Gwxvdp8tuJOKPfxM7qO+q/q6wDwOD6eMhvtSftiiFKJCISakraY2VBbZviC4vEk5vjlkaN8iNyG
	CUg4rNHCuoRNutKoJZLE26AESv28FrDs/J76XQ5VMQ9vX0iyrIK9nDxuM1lx+YWUsZviA75s4w6no
	T1+OWMRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVxp-00000000S3o-3Edz;
	Thu, 29 Jan 2026 17:37:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVxn-00000000S2S-07IQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NH1Y7z4Xz/rnFfteVmXJ0FyGxvOgtpdFaiDdQOvHyM0=; b=V50rUZsJPUp9HvoynitTnMEooH
	qhDqmrgqWquVZSOFNhD3p2/9nuUKExMH0zbx+/MkiiTYv8qNjea3Qyw/AN1nsxs6F0kqE0/re4ek5
	Vpt1GPMLwBwUy8eZlZ6KmpC9f6IlNMt5aGoF4EzGoRQJiIy1uK++m1Heqo2uX/dpXkZI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vlVxS-005OdE-D8; Thu, 29 Jan 2026 18:37:30 +0100
Date: Thu, 29 Jan 2026 18:37:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
Message-ID: <7c0d283c-f6d0-4ba6-9686-ae6dcfaa4389@lunn.ch>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-3-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129172315.3871602-3-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_093751_063594_FE4222A4 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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

> -	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
> -	if (ret < 0) {
> -		dev_err(dev, "cannot get supported channels\n");
> -		return ret;
> -	}

I don't know this device at all, so i might be asking dumb
questions....

It is possible that the device supports multiple channels, but the use
case is mono, and so xlnx,num-channels is 1 in DT? Would that break
given your change?

> -	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);

Could it be the device supports 24 bits, but the use case only wants
16, and so has this property set to 16?

    Andrew

