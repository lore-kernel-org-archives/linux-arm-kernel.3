Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1E9C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hp9mrowOiBNinPIkdPwJdxIaRmTewvkis1qNuqUG7eM=; b=S4YK6zZe/E1GLQDV1gFod66e48
	2j9cw9mPOtW+UVPGvCM2lCu2vQD9AxOZPNwodxDmjeBFmAkQuiJgSUPRkREeI+EXDUp70Jic/ZtUY
	0cYbPJS/b4LbzDFQhn6d1i1tNQTQtIVOCXp0XnZvkPhDOMQ0Uy41O10tFJLupIYBaHtIe2w4JUUwS
	Se5Oyh7kM2rFtXKv/LERYUyXZePujrcayW5harzrG50SC1i2HX2755N8mU7YKtVolVRwD59WxUqXm
	tnFRNexdMaU5Q1s5T96ONBm+hdv9yQV1jJpeZpcH0d3qIZ32n5t227k6rodSRGCqOsXl8LiBSHHJN
	Y1p/3+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KYk-0000000CeC6-2FAJ;
	Thu, 17 Sep 2026 22:26:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KYj-0000000CeBU-2Yuf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:26:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FCE6600AA;
	Thu, 17 Sep 2026 22:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49BF1F000FF;
	Thu, 17 Sep 2026 22:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789683984;
	bh=Hp9mrowOiBNinPIkdPwJdxIaRmTewvkis1qNuqUG7eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ejn0xVuOyE+Vjz9cxODd86WSyGTH7DjSP+tiPmxvVfp3sUqvcH1kOniuNb1xbDSjD
	 5HdcNGpclFt0/eOx0jd9AkCTvArwlTvroEscLXOKMRoj+xO8Fth5cg7fHbeG22rRc3
	 xAGY4DuGok7eTUetwkTMCSlh5z/GLBokLpadygR0iQG8AtUCkJBHMEN4wyAyOqqvO8
	 uvX/hHTd8EYQ0kNOBsVACcx/eed89Xnn6LT2d98PROCcZEUSS+LhafZa8oR5iqxBY5
	 g3YM583evaItELWO3nw8+9REvSosKJQj0tMeuW65Z7S11f1D9yYjFx8BLUo9ucoVgP
	 GFo+IG8OtranQ==
Date: Thu, 17 Sep 2026 17:26:21 -0500
From: Rob Herring <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	Oskar Senft <osk@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Vitaly Lubart <lubvital@gmail.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Breno Leitao <leitao@debian.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	James Morse <james.morse@arm.com>, Paolo Abeni <pabeni@redhat.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Dave Penkler <dpenkler@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Dan Williams <djbw@kernel.org>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Alexandra Winter <wintera@linux.ibm.com>,
	Julian Braha <julianbraha@gmail.com>,
	Karthikeyan KS <karthiproffesional@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v2 3/4] dt-bindings: uart-routing: Add binding for
 StarFive JHB100 UART routing
Message-ID: <20260917222621.GA4081995-robh@kernel.org>
References: <20260905102901.126035-1-changhuang.liang@starfivetech.com>
 <20260905102901.126035-4-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905102901.126035-4-changhuang.liang@starfivetech.com>
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

On Sat, Sep 05, 2026 at 03:29:00AM -0700, Changhuang Liang wrote:
> Add device tree binding for the StarFive JHB100 UART routing controller.
> This controller allows dynamic routing of inputs between built-in UARTs
> and physical serial I/O ports, enabling use cases such as Host <-> BMC
> communication via UARTs.
> 
> The clocks property exists in the hardware, but the driver does not use
> it.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../uart-routing/starfive,uart-routing.yaml   | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/uart-routing/starfive,uart-routing.yaml
> 
> diff --git a/Documentation/devicetree/bindings/uart-routing/starfive,uart-routing.yaml b/Documentation/devicetree/bindings/uart-routing/starfive,uart-routing.yaml
> new file mode 100644
> index 000000000000..1977f2ed20a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/uart-routing/starfive,uart-routing.yaml

Unlikely to have another "uart-routing" binding, so move this to 
bindings/soc/starfive/.

Otherwise, looks fine.

Rob

