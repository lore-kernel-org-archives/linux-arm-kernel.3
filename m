Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E89ECFC279
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 14:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLfWgTIgLw+OOzDabBSyPY8mnWR/+CxPxEgp2Z8aTaQ=; b=rGx80YBRNnwAKDnaUbEVihiWS8
	/C35+uq/PnHxuzadraIemWlo5SH/yLA4WUytNNUOBdKfQSJoMFGPwVfPb87IfKmu+60N4H2glV+6j
	89igiPYmxwhA5QPUrrbreoBvoccP0cS3FT5iS9qw9BKxSalJO441jApZdoFOuJ1wl/ebwYd54x7L2
	7h0MmlGheVX2Pgu1QXlDbmPHFK6tUXZmtX1LtPZcEHDgmWmKuXbBwGxJNdJFxnzUaHwPO3MJZjAFX
	x9E6ILwDOhMYCllf3ctHy1gZF1XUrLDIzb9p99OdWJLpHAePcCf4THZi0bJ4h4+4FljclpZa6VIgu
	HGymwjNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMS5O-00000008WIC-0iQM;
	Fri, 21 Nov 2025 14:26:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMS5M-00000008WI4-3Q3y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 14:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5DAF602DA;
	Fri, 21 Nov 2025 14:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36427C4CEF1;
	Fri, 21 Nov 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763735163;
	bh=EfNgh1eMYbot4wypvinALGz/1QAaFx7WiLHvTYXxY5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WkolxRgs9Gg80SOhs+pRUK7okzYko3cZv95bTb5hmHv3FMqcYsMk4ze9sbgm23oIR
	 aPa9MXgeCE/s5nl3ojy8PHVbfXa7Xt+lEZC1LmVOYmrDDVe/NuzLlyc8Elgo9V6vr/
	 CG/wOsiR3b3D+RwKFyqaU+dlXCCEtOfllM5fF/yo=
Date: Fri, 21 Nov 2025 15:18:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: stern@rowland.harvard.edu, vz@mleia.com, piotr.wojtaszczyk@timesys.com,
	arnd@arndb.de, stigge@antcom.de, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] USB: ohci-nxp: Fix error handling in ohci-hcd-nxp
 driver
Message-ID: <2025112116-shimmer-overtime-718f@gregkh>
References: <20251117013428.21840-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117013428.21840-1-make24@iscas.ac.cn>
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

On Mon, Nov 17, 2025 at 09:34:28AM +0800, Ma Ke wrote:
> When obtaining the ISP1301 I2C client through the device tree, the
> driver does not release the device reference in the probe failure path
> or in the remove function. This could cause a reference count leak,
> which may prevent the device from being properly unbound or freed,
> leading to resource leakage.
> 
> Fix this by storing whether the client was obtained via device tree
> and only releasing the reference in that case.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73108aa90cbf ("USB: ohci-nxp: Use isp1301 driver")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - only released the device reference when the ISP1301 client was obtained through device tree, not in the non-DT case where the global variable is used;
> - removed unnecessary NULL checks as suggested by reviewer.
> ---
>  drivers/usb/host/ohci-nxp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index 24d5a1dc5056..081b8c7f21a0 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -50,6 +50,7 @@ static const char hcd_name[] = "ohci-nxp";
>  static struct hc_driver __read_mostly ohci_nxp_hc_driver;
>  
>  static struct i2c_client *isp1301_i2c_client;
> +static bool isp1301_using_dt;

This will not work for multiple devices in the system :(

Please add this to the device-specific structure instead.

thanks,

greg k-h

