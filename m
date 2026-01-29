Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7E6D73E84
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 19:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wv5p+mk4vZCwPzTsh9qJ/haqXEBS9smtKaIFtiDaogs=; b=NjdFpE34bD11Ca/be6ABLmcn9p
	6Y1yUNd3+Uqrr6fUrKCh0PFCi/vZ8Ppb/KCUpHdMepJzsvvexW84c721mbkDuSoTHPDUAhvsmNlu3
	uwDPBujfOYDrDc8qC+iAQJ8az0FOoay/clSUOqpypitK47UO5AbXJNI6PlzwIj3JMAmQc5NMOKaZx
	PReDK2Pj0/lGUVPaoIWyt3bZ7rhogdadQX0HnnHEWAlLTVYqvscqFpQ67hgu8fALo9mPE8L1q5D4u
	NNj25yLWXlAGKeJpXj8nFqrDraQE9sLTcm6XZThTvIkan+8mtu0aTMJUDlQ/diUSP7i7VfPaZ63qP
	1Hy3jYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlY9z-00000000aBb-0ND0;
	Thu, 29 Jan 2026 19:58:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlY9w-00000000aAo-2Q4x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 19:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wv5p+mk4vZCwPzTsh9qJ/haqXEBS9smtKaIFtiDaogs=; b=5zz21bqChfMMI1tY8Qiif8q3qI
	Rs/YG8Ftj41dUwOoRS8ZzhkT/4AUCgGtdzcLxG7fMtQy10sTUnkXUktK3U1acbZRtTT2KmA/tEv8l
	KHPnKevnVRZ1kIm7XaYtBTt3GF6o8B5V7Kh6r0slmeBaAJiJsTHPvfMYfOyLWL2VF0vw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vlY9j-005PH6-WB; Thu, 29 Jan 2026 20:58:20 +0100
Date: Thu, 29 Jan 2026 20:58:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Mark Brown <broonie@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
Message-ID: <866360d1-19d1-4a72-91a6-b2e716195820@lunn.ch>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-3-sean.anderson@linux.dev>
 <700e4e67-a2ed-4b37-a00b-303bbc5ee6cd@sirena.org.uk>
 <a95d7feb-4d94-4b25-be96-c7c367342c19@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a95d7feb-4d94-4b25-be96-c7c367342c19@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_115832_617964_F23EC871 
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

On Thu, Jan 29, 2026 at 12:46:27PM -0500, Sean Anderson wrote:
> On 1/29/26 12:27, Mark Brown wrote:
> > On Thu, Jan 29, 2026 at 12:23:15PM -0500, Sean Anderson wrote:
> > 
> >> -	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
> > 
> >> -	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
> > 
> > Given that the properties already exist it seems wise to continue to
> > parse them if available and prefer them over what we read from the
> > hardware, it would not shock me to discover that hardware exists where
> > the registers are inaccurate or need overriding due to bugs.
> 
> I would be surprised if such hardware exists. These properties are
> automatically generated by Xilinx's tools based on the HDL core's
> properties. This has a few consequences:
> 
> - They always exactly match the hardware unless someone has gone in and
>   modified them. I think this is unlikely in this case because they
>   directly reflect parameters that should not need to be adjusted.
> - Driver authors tend to use them even when there are hardware registers
>   available with the same information, as Xilinx has not always been
>   consistent in adding such registers.
> 
> I am not aware of any errata regarding incorrect generation of
> properties for this device or cases where the number of channels or bit
> depth was incorrect.

Does version 0.0 of this IP core have this register? Its not a new
addition?

Is there a synthesis option to disable this register?

   Andrew

