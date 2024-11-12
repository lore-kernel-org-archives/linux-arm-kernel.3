Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1398D32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QX8VQevkwijnt5AdrotptL17b7KyPVmceIz0nqzmyMs=; b=aN9/LVr7pdLo13KaJ9lViX0555
	wVocD5k4A+j7lJw6K7eJZB1jfZ7ZFPa1MFggiX+AeTb1KnupAmcLvyOvIheVhV2xYJ5tcwXt1zIJF
	Qj0c3HyoZkimUVI29czTxSt3iFmcQ/mkLyPtkAM2lygCIwGjkSH1o7EiXJ5VWtWifxtKJKkrnZaTe
	d9ca3jShiUcfw8JO2KiacUcDXQR7qjAow1XlhDtc4wHSv4YDKDvfAO7K/MJxnx4loIUMMVI1ueAmz
	0x4/www5HanTsXdSuqOyXerNyECs8epbHpEXqAkj66ayQUm2gdYReiLer4Audj2dQ9ZadjbjneyZA
	Y3206KfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAppd-00000003MsK-0po7;
	Tue, 12 Nov 2024 12:17:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tApFB-00000003Fxz-02Ld;
	Tue, 12 Nov 2024 11:39:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 163C9A4196D;
	Tue, 12 Nov 2024 11:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6627CC4CECD;
	Tue, 12 Nov 2024 11:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731411575;
	bh=LG7RZyrQQCMMftiyBGThQS+gGDQCRxNRxi5jzF0rtMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vknOjlpo6yb1Vp6IvyGWB9fU+5x7MozaZPEx5An53FahQpTAnNO5K4ounXAy8oTiB
	 TMyhmIa3vhWYr8Y70CpG7AqAsJ6Muua1r2mtSVbGPeuPR0Yb5JXd60v2VL3pSHRStQ
	 uWb9VIFmeHvu95V7xCVSAH9p70B6Adjzvh7A37xU=
Date: Tue, 12 Nov 2024 12:39:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gabriel Somlo <somlo@cmu.edu>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	Ronak Jain <ronak.jain@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org, qemu-devel@nongnu.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: Switch back to struct platform_driver::remove()
Message-ID: <2024111223-gizzard-scabby-eb98@gregkh>
References: <36974feb6035201d53384557259ec72fe311053b.1731397962.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36974feb6035201d53384557259ec72fe311053b.1731397962.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_033937_131959_9B19FA81 
X-CRM114-Status: GOOD (  15.92  )
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

On Tue, Nov 12, 2024 at 09:35:20AM +0100, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/firmware to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> I did a single patch for all of drivers/firmware. While I usually prefer
> to do one logical change per patch, this seems to be overengineering
> here as the individual changes are really trivial and shouldn't be much
> in the way for stable backports.
> 
> There is no dedicated maintainer for drivers/firmware, maybe Sudeep as
> biggest committer there can take it? Or would it be sensible to split
> this patch?

I'll just take it now, thanks!

greg k-h

