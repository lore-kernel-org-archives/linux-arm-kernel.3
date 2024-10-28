Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135ADD3399B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waIkFoDc9o8tfquUd+Jq31IwxgRT/dvr5qXaHNOIhWo=; b=N1c8LD1ACusucR0kqvsYRMnPlB
	nxr42cF4TOT2RLxZBJd65NzU+EDVWeJ2fUv/DECWk+UNmuDPe//fk39lQMnOuFHrxpB8LbewUWwn3
	fsXDNoEL7BOvjlkospIS989akYj9Ue+9f7XVMaMUjc4jt8gCjW3z/n+FY1w/xO8uOF1E/CUHe46PT
	eMewwQQKI/mI//K0UNs5iOJrhrfl8zvGQwtg3cdtzBzMf72shYBxtLgSYfXK1oAt7UgztfABLfatn
	6mzwt2/9+WtfGn2khpXV0Id1LL2vUYqj7sryjRNphJSmuVsuO3tkj8pX0l/kWFGc4s115IoxFBuvX
	XSd/KIBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5S5y-0000000BNy1-20X8;
	Mon, 28 Oct 2024 15:55:54 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Rgh-0000000BJdN-201O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:29:49 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 3538F4C76F;
	Mon, 28 Oct 2024 15:29:43 +0000 (UTC)
Date: Mon, 28 Oct 2024 11:29:35 -0400
From: Aren <aren@peacevolution.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Ondrej Jirman <megi@xff.cz>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] iio: light: stk3310: log error if reading the
 chip id fails
Message-ID: <xcavh66uxpl2orehtlzsy4g4udr3p2yqsq5pyhmxdqdmnegsvq@jpomr2uuwspz>
References: <20241028142000.1058149-1-aren@peacevolution.org>
 <20241028142000.1058149-6-aren@peacevolution.org>
 <Zx-jj8FEldW6sG55@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zx-jj8FEldW6sG55@smile.fi.intel.com>
X-Spamd-Bar: /
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730129384;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references;
	bh=waIkFoDc9o8tfquUd+Jq31IwxgRT/dvr5qXaHNOIhWo=;
	b=jVywxTyHeY6lKYwG8i5PTfRP/7qZwmdlQe7GjZlWL0oBVH5yipYwH0z6jwVEfzm6YjPqk8
	gD+QZ9a2OSgNOTu0Ydxk0hym7qiQlZM7vBDKXI2RHM2VSizmYwd/IrLHHRl+jsFlfB392V
	/MbvO8kGCGYKOPs6UdalfnYcS8tHJYM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_082947_629833_3B07C710 
X-CRM114-Status: GOOD (  12.53  )
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

On Mon, Oct 28, 2024 at 04:45:35PM +0200, Andy Shevchenko wrote:
> On Mon, Oct 28, 2024 at 10:19:59AM -0400, Aren Moynihan wrote:
> > If the chip isn't powered, this call is likely to return an error.
> > Without a log here the driver will silently fail to probe. Common errors
> > are ENXIO (when the chip isn't powered) and ETIMEDOUT (when the i2c bus
> > isn't powered).
> 
> The commit message does not explain why dev_err_probe() has been chosen
> and not simple dev_err().

This function is only called from stk3310_probe, and this condition
should propagate it's error, so it fits what dev_err_probe is designed
for. dev_err would be pretty much equivalent just longer, like this:

if (ret < 0) {
	dev_err(&client->dev, "failed to read chip it: %d\n", ret);
	return ret;
}

Regards
 - Aren

