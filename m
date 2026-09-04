Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265CCC79F87
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTWd52yFP65YxYGX1jhsbarPqnM67tVSqN38zDBl1Vg=; b=cjpaLEyiUkMMFunf2hSXFuB2uH
	mrW1H4UcAI7BfSU/BdddbTA9lVT7pyai92IA+943iO2OhyFkPAAejR2JKC0EsgbV7XLLrXyo7pXvt
	mB7LEPG84VORo6hnsDdB5Hp8vdj1TgeaF2/mHO7/9c17MKelsxUc5hxgeToFlhJxNpSpbh+ETHekL
	8qzIrSkmz92BDjiV6dnIf7Zlq50zyA+2oyThQ0moNbDTTLT92Kj0tMTHQc1cRdBJW81N1eDiIXZpX
	1y/kTQGLtmfj0Cg2QrXqOc2poj6qt0JjjC2ixXBPyLuD+5IZmZ3zFI9vZPdsIehMsfuoHipf+kuSi
	7ihS0A5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2X4a-00000002lrT-3m95;
	Fri, 04 Sep 2026 16:47:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2X4Z-00000002lpw-17Tj;
	Fri, 04 Sep 2026 16:47:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 270504049E;
	Fri,  4 Sep 2026 16:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FCB1F00A3D;
	Fri,  4 Sep 2026 16:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788540446;
	bh=fTWd52yFP65YxYGX1jhsbarPqnM67tVSqN38zDBl1Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ElI1ve5Nd6BtihDq8JaFfsbnYd4kSDgma7wyhIvYWOE8sajceMkHCCY/FR8jt1IcN
	 z4QP+OlpDxeCsq+Tajo5otPR1LuICxOv2ztASH57u8nNUyHjf5mmoFCPrh7DfDDN/f
	 VxGANRriNDW+vUGOX+EA1x5CuCswzULJxRW730rg=
Date: Fri, 4 Sep 2026 18:44:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 07/16] usb: core: Move struct usb_port and related
 APIs to port.h
Message-ID: <2026090430-botanist-ungodly-0299@gregkh>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-8-wenst@chromium.org>
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

On Fri, Sep 04, 2026 at 04:41:46PM +0800, Chen-Yu Tsai wrote:
> |struct usb_port| and its matching container_of() macro should live in
> its own port.h, matching the split we have for .c files.

Why?

> Move them as described. Also move usb_port_is_power_on(), since in the
> next change its |struct usb_hub *| parameter will be changed to
> |struct usb_port *|, and becomes a non-static function that only
> references |struct usb_port|.

No, please don't do that unless you have a really good reason.


> 
> port.h is only included from hub.h, as a subsequent patch will directly
> use fields from |struct usb_port| in a static inline helper in hub.h.
> The USB internal headers don't have header guards to help with this.
> 
> Also drop 'extern' from the header declaration of usb_port_is_power_on().
> This is not needed in modern C.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v4:
> - Dropped 'extern' (Andy)
> 
> Changes since v3:
> - New patch (Andy)
> ---
>  drivers/usb/core/hub.c  | 16 ----------
>  drivers/usb/core/hub.h  | 48 ++---------------------------
>  drivers/usb/core/port.c | 16 ++++++++++
>  drivers/usb/core/port.h | 68 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 86 insertions(+), 62 deletions(-)
>  create mode 100644 drivers/usb/core/port.h

hub.h is small enough, making a single .h file that is 68 lines long
for no real good reason isn't a good idea.  Odds are this will make the
build take longer as you now need to open/read/close another file.

And if we really want to do this, it shouldn't be burried in the middle
of a long "enable this platform" series where people will miss it.

Thanks to Alan's review for making me notice it.

thanks,

greg k-h

