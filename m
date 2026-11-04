Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3869606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MZkiIAVH;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TVzyqcSu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3vEf+vYwX1hHqFnM7XUYCb2YLUrJ0anEL19nMME3t6o=; b=MZkiIAVHR5OH/C2S6Z1MHbkEy7
	8JciKUBFCt+oUMYoJpEja3GMbqldSNFwOHx7IZK84MJMLBMlO4/TDvFbrP1cpYJuYZxUH42RTwmFg
	Cwkh5FrvozKgGEnNyPO3PTmVkhLAHhETQH+aC1nhJQfsPP+guvODJ/yxI9kpSXOyX8lG0xqxotW/i
	nu0mFxTpdx9705x7COLVizLXljsuPH+qrEFcYX68gVbF+aNtSyoJl7PJHJXTedBla4WrQtfVWNOAE
	KM6SzGgTkWvo6t0xFfR5+eN3pXjMrkrLUZ1unwJ8RrD7AugaSGTfls82+wphFaMQYA66pbl2MGqj9
	0hSEKh9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfVM-00000006Ms6-14sF;
	Wed, 04 Nov 2026 18:14:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfVL-00000006Mrl-11Kz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:14:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99B3140AE8;
	Wed,  4 Nov 2026 18:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E791F000C1;
	Wed,  4 Nov 2026 18:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793816074;
	bh=3vEf+vYwX1hHqFnM7XUYCb2YLUrJ0anEL19nMME3t6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TVzyqcSuF1PVT8ycEgOsBf03CoKbEElh0ICRsA70khRVt6jQiJqosC6oikwG5DMgV
	 sxnddqQk5RM+Yqv8c+AKtibwY71XD9gV4jnu+nGF376zwBJbCKF3/rJNNMuqYoWfT6
	 rtEZTztKSdnOU7KGq1V49jXYUchm6abelorGZQHUO0v5oM8eIHrFBJpoNYvVulJx+W
	 EmEeU4efluLzS0q7d2BgzdYaK2bTROTA61QjrvBWvaCVbGZWR8aL/W8fC5v9sJ3cPk
	 u063LFC6K5k8eqVxBmZH42TnJkpJkYxqO4E+tGnKAycwAusd5jKbIkHR8WaetsNxa7
	 BCjDLaI3JPErw==
Date: Wed, 4 Nov 2026 18:14:29 +0000
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
	mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <20261104181429.GE1650678@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 24 Oct 2026, Dmitry Torokhov wrote:

> Allow passing software nodes to wm831x DCDC regulators via PMIC platform
> data. This is useful for non-DT/non-ACPI platforms that want to
> associate device properties (like DVS GPIOs) with the regulator devices
> using software nodes.
> 
> Add software node pointers to the PMIC platform data and have the MFD
> core assign them to the buckv cells.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/mfd/wm831x-core.c        | 47 ++++++++++++++++++++++++++++++----------
>  include/linux/mfd/wm831x/pdata.h |  2 ++
>  2 files changed, 37 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
> index df8e76e000cc..c4793be419ba 100644
> --- a/drivers/mfd/wm831x-core.c
> +++ b/drivers/mfd/wm831x-core.c
> @@ -14,6 +14,7 @@
>  #include <linux/delay.h>
>  #include <linux/mfd/core.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/err.h>
>  
>  #include <linux/mfd/wm831x/core.h>
> @@ -1449,6 +1450,32 @@ const struct of_device_id wm831x_of_match[] = {
>  };
>  EXPORT_SYMBOL_GPL(wm831x_of_match);
>  
> +static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
> +			      const struct mfd_cell *cells, int num_cells)
> +{
> +	struct wm831x_pdata *pdata = &wm831x->pdata;
> +	int i;
> +
> +	struct mfd_cell *local_cells __free(kfree) =
> +		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
> +	if (!local_cells)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_cells; i++) {
> +		struct mfd_cell *cell = &local_cells[i];
> +
> +		if (strcmp(cell->name, "wm831x-buckv") == 0) {
> +			int id = cell->id - 1;
> +
> +			if (id >= 0 && id < WM831X_MAX_DCDC)
> +				cell->swnode = pdata->dcdc_swnodes[id];
> +		}
> +	}

I can't begin to tell you how much I hate this.

Why are we duplicating massive static const structs just to add a S/W
node?  Is there no other way we can do this statically?

Since pdata is being populated already, why not just pass that on to the
consuming child device (the regulator)?

> +	return mfd_add_devices(wm831x->dev, wm831x_num, local_cells, num_cells,
> +			       NULL, 0, NULL);
> +}

-- 
Lee Jones

