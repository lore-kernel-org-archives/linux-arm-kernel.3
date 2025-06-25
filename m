Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1AFC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWjW7m85KpRw2Oy8otfnRGkk/I1NizB1a5/qcSwGI2c=; b=q82CbdkSEZDdLEueGCRVpdDcMd
	xuXGmtB9u15Uv+g0iSrC37nmc9fZn4GOS2Yxa5HxsGpFRA1lq+4Syw0dmQUrFKb6yRbCNPFIpIJqH
	vnTACFimsxHWu7Nr3wzgx0Fv0r3bKyPhlfYenxRsCodTYywa5pUo2EEiTBatS6KkwYSPsf3f/XuIZ
	cOKaJFs8dKGYmGJfGNB+FnnqepQkaF9gDj/qJoCy6CSBYokbX5SNAB6VUaqNA22XuFNFx8MPGd+5s
	n10N4JswUPSzdkMK8oCRH7qx7H1/GjqER0uw9fiy2bD2zqKOmvASUe2o0G7cmyvSkl1nRCdU1piHC
	iK+LZMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYma-0000000A5ae-1Tj4;
	Wed, 25 Jun 2025 22:39:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWy5-00000009uFl-3qdR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 20:43:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F333049BAD;
	Wed, 25 Jun 2025 20:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42AB8C4CEEA;
	Wed, 25 Jun 2025 20:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750884220;
	bh=Rmz67o9XCjNjggKR0sYTYAf42AfBsHBAtQO+D5/ooAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKNaIsye7g8Rg3qVVbuy2Lk5kWIddPlp9RSWtHLoIoZM0aT0NMFPWTb9E4jueZxMr
	 T2Dpq++mzgkhWNxKX7VS5VzdMTaN/FKR7CgYHHbpCQgJ8v/sVQ4a3XKzrUWjfExafm
	 PCMsJ70wD/o+qHdYujGiK5WB7MvT/EJdRsSME4dgxldcmuGoPf7Kv3HpE8jMT7GQRW
	 hxvG8PJh7avy0zPYxweVD9qL/KK/keR7GuXoSosvye75e6Cbm92HVSEXBf3l8dhxyu
	 b+Qxroxc6Mc3vpWcT19fEy9ntSvzPJamySh874XFmCStND03I2dqNIV972IZRZbfzt
	 7I2P4Ppfq5cAQ==
Date: Wed, 25 Jun 2025 22:43:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	stefan.eichenberger@toradex.com, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "open list:FREESCALE IMX I2C DRIVER" <linux-i2c@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	bsp-development.geo@leica-geosystems.com, customers.leicageo@pengutronix.de
Subject: Re: [PATCH] i2c: imx: fix emulated smbus block read
Message-ID: <mp3b6yjebdqgkatx5wnezmhmdbmhhkdyddy3yr24ryla36ozmr@4wyb2y3zura5>
References: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_134341_976311_7B076A1F 
X-CRM114-Status: GOOD (  13.71  )
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

Hi Lukasz,

On Tue, May 20, 2025 at 02:22:52PM +0200, Lukasz Kucharczyk wrote:
> Acknowledge the byte count submitted by the target.
> When I2C_SMBUS_BLOCK_DATA read operation is executed by
> i2c_smbus_xfer_emulated(), the length of the second (read) message is set
> to 1. Length of the block is supposed to be obtained from the target by the
> underlying bus driver.
> The i2c_imx_isr_read() function should emit the acknowledge on i2c bus
> after reading the first byte (i.e., byte count) while processing such
> message (as defined in Section 6.5.7 of System Management Bus
> Specification [1]). Without this acknowledge, the target does not submit
> subsequent bytes and the controller only reads 0xff's.
> 
> In addition, store the length of block data obtained from the target in
> the buffer provided by i2c_smbus_xfer_emulated() - otherwise the first
> byte of actual data is erroneously interpreted as length of the data
> block.
> 
> [1] https://smbus.org/specs/SMBus_3_3_20240512.pdf
> 
> Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> Signed-off-by: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

