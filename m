Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA77CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 05:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bje43vOA/n+19r7S0TcLj4o3Rl7bZDJnvRI+HwsLsy0=; b=MkdnE76C+c6O155QlGRAZkYMLd
	2FFG3m0wZ3VGNCT2Tu/z9123LKKUB5g76C1h/eJPQ2YvS4o040sWQljtUqbHcgKu2z10jNnE/4AEP
	/+HWWhDqzGflzykjGJWdLFfewVnI/IutLZA4tWZDUXP0ch1k1x4VBOYHXe7gfuxYqQLDU+E70eIsN
	zPNWvw2jJxHY1VoWmjZmOGr/ffSMUouHIQr2jdWbg74XZtN5YuW7bY4GjCvfINpWJLmuGKrtQi+jU
	a3dbFu3UQErYTeTkiN79ndftHgzv6tjGTKJiD7hiXxkl6/ewvtLY7UMjKIvOLG9gS9YzuyYwr52jx
	znNa+fOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60bm-00000001JBj-2ANt;
	Tue, 07 Oct 2025 05:51:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60bk-00000001JBY-2X4Z;
	Tue, 07 Oct 2025 05:51:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E8D061215;
	Tue,  7 Oct 2025 05:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384EAC4CEF1;
	Tue,  7 Oct 2025 05:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759816289;
	bh=LPQQPlIwuR2+Qcdx0QIWLHqlQNGepDAbb03LkBRGWUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JAJlWI1h8cZeELmkitk9Hz2GVuULYk1cHI3gCRt/ZfSKrGohI+U9rVFP8ZXwFrSa9
	 DW/iLS9KT0KU+6L0wk+LFrZMaDdcd0RIeAbBO49gFGrHqZu2RNnBuGI2/+9phU+GhB
	 Y9c1+pAR4MLaUzmZetibux383gBX/aA7BoudcwkM=
Date: Tue, 7 Oct 2025 07:51:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1 3/4] usb: dwc3: Add Google SoC USB PHY driver
Message-ID: <2025100735-gulf-error-2ce2@gregkh>
References: <20251006232125.1833979-1-royluo@google.com>
 <20251006232125.1833979-4-royluo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006232125.1833979-4-royluo@google.com>
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

On Mon, Oct 06, 2025 at 11:21:24PM +0000, Roy Luo wrote:
> Support the USB PHY found on Google Tensor SoCs.

That's great, but that's not what your subject line says (it says "usb:
dwc3")

> This particular USB PHY supports both high-speed and super-speed
> operations, and is paired with the SNPS DWC3 controller that's also
> integrated on the SoCs.
> This initial patch specifically adds functionality for high-speed.
> 
> Co-developed-by: Joy Chakraborty <joychakr@google.com>
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> Co-developed-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  drivers/phy/Kconfig                 |   1 +
>  drivers/phy/Makefile                |   1 +
>  drivers/phy/google/Kconfig          |  15 ++
>  drivers/phy/google/Makefile         |   2 +
>  drivers/phy/google/phy-google-usb.c | 286 ++++++++++++++++++++++++++++

And as others said, you don't need a whole new directory for one single
.c file.

thanks,

greg k-h

