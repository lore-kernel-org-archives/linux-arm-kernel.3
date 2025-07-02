Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D19DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 19:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sp2wGk7AcfJdecT1zeamoRJnTE+dVmX1VuXkZHQB7WU=; b=aoRhwArzDmpj1UNKzIseOjSFCb
	ep9O8+rwdSToOqAB6gXHydBM7XQQQbZkzGFUx1QHg2vxRu29zHYYX2GGu972WSWOJItGjAP+8OL5I
	jPJJbdfwjmmRK4UuYhl7hYKhDP8laDvrg3hdpdIWRrxexJU1oR6ncF0cbUCBb6L2TcnWH00M+DU8H
	7a7Nvn/Y0PbkL21ErrFx60JW9vB/x5xFrTJ2kj4YT/eoXR67lX8tNhXq4F7P6DLAweKTvSVz4W2c2
	6QVGE3VVvHIuBtKgIeQj4D9mNvMW3k5VFhVO3qPzo87u9uuNFK7JY8ST5UqHkDRekiGcX7Ky9fVD0
	AG3Qo3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX38V-00000009Oz0-3Pe2;
	Wed, 02 Jul 2025 19:28:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX36A-00000009OhT-0tgz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 19:26:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B02B65C6EF1;
	Wed,  2 Jul 2025 19:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4298EC4CEE7;
	Wed,  2 Jul 2025 19:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751484385;
	bh=GpPi9wOBi7C3jjvU4V8pYmSE5merOth92NItvmAnnJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9VqZc2uScNupz5RiyJKrkeyc/RhXPj7B8PqYC0NSU7jgadvkuC5KRG9GQsExvrH4
	 1JD14vqYuic+VfdWdHa1DD2tg67s8eD7SKPRtnqCTuWBMsUtoaP9Z2pNnv+CZLvN6j
	 sL67Ka5P1gaP5I+LRFKE9U8YV6iLHlwYewPM27PN9oOJ2oLGb5i+PG+QeFGN4CaX6e
	 DnhW+tqAh3AkCeAaW3FOMLBUx31l4gRP7a0YOs7VmNnjxSmC8a7yshNwjk2P01wKfE
	 HTmCXGoTXHQrcb4KyBxQeJ47YX4CCRI3ExB+HY/F3z5I9B4ZtVF6rNLvfmfYRyBK/d
	 I5OUyVFXbobBQ==
Date: Wed, 2 Jul 2025 21:26:18 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 17/24] driver core: Export get_dev_from_fwnode()
Message-ID: <aGWH2mH6iZJ3s3lL@pollux>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <20250701114733.636510-18-ulf.hansson@linaro.org>
 <2025070205-ignore-passive-17b4@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025070205-ignore-passive-17b4@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_122626_294628_42DA0E4D 
X-CRM114-Status: GOOD (  19.35  )
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

On Wed, Jul 02, 2025 at 09:34:12AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jul 01, 2025 at 01:47:19PM +0200, Ulf Hansson wrote:
> > It has turned out get_dev_from_fwnode() is useful at a few other places
> > outside of the driver core, as in gpiolib.c for example. Therefore let's
> > make it available as a common helper function.
> > 
> > Suggested-by: Saravana Kannan <saravanak@google.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> > Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/base/core.c    | 8 ++++++--
> >  include/linux/device.h | 1 +
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> > 
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I'm a bit concerned about exporting get_dev_from_fwnode() -- at least without a
clear note on that this helper should be used with caution.

AFAIK, a struct fwnode_handle instance does not have a reference count for its
struct device pointer.

Hence, calling get_dev_from_fwnode() with a valid fwnode handle is not enough.
The caller also needs to ensure that the device the fwnode has a pointer to has
not been released yet.

If this really needs to be exported, can we please add documentation covering
this properly?

- Danilo

