Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6A6C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 18:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbszfIc2ET/PTFgJSbbnkaPhvrSSCjYcL8giV7vQyOI=; b=rKdoO37f9i4LaLYGJkJCLVWpGD
	9E19LcqLbIOXYLKrHIBtDs0blnvglUYzVN15ikLx9xlf1dWxpYgzMrB/eurR5QRod07YE/0BdPxz0
	ZxqEHmUjXvsNZ17GhSbShoLTrmWT1Kx1I0HdUoiOrce4+prKv1dUwKejTZhp5c22meMsPDIs1NGwz
	JPtsR5jrCkZdQyVO33UtBqOWu45EjdAu9skgSOFxUw4k6Jy3BGwQCueOGOEjV/0WFwm0lOUaIGVDo
	bM0XoaWwmQVmmq+fSa50afUho/XZ6jiT1PFAQTq0vnvOLe6dkImrObjO8oMhVu9FOjVzyor45sIY6
	eURyFmOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9T0d-00000007C5o-3MI2;
	Mon, 28 Apr 2025 18:15:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SyH-00000007BLi-1Nwt;
	Mon, 28 Apr 2025 18:12:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0894F5C5EFB;
	Mon, 28 Apr 2025 18:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C13C4CEEC;
	Mon, 28 Apr 2025 18:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745863967;
	bh=KTqQYLBw1XS55ajrDgXBIWQeeAlb817N/mkPEkK6Xfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QWIuA4peX9ZsjZC1m/7A/fpkdxquCZ50ltGIQwsvl5bPQXH6/fG73jq8dNkv3sNui
	 9nXcFpAcjM4s+axJKSCs6FKBzGrFnw/+CllMT95PkfTUroNAchm/SjoihsJ4CW7H3G
	 KY5jNIpRIN+m1dXf+VIuOgNWlOUTAV1n9a+at9yE/XO45hJr+rPtjnbCia6HsoT3V9
	 JOlKkYVPwCMRtxWXyCeGQNB+gAb9BT/SpDdLoA2o2J9xCqE6AbN/22vJ8bKEq69fAM
	 A4ljOqumSo96/ynTfEkG7txH+ZEXs27JJtQFQR1uMIbO/7qNlCBXl0drB0hKzosK/I
	 cRf1JI1duM30A==
Date: Mon, 28 Apr 2025 19:12:42 +0100
From: Simon Horman <horms@kernel.org>
To: Da Xue <da@libre.computer>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christian Hewitt <christianshewitt@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] net: mdio: mux-meson-gxl: set reversed bit when using
 internal phy
Message-ID: <20250428181242.GG3339421@horms.kernel.org>
References: <20250425192009.1439508-1-da@libre.computer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425192009.1439508-1-da@libre.computer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_111249_423675_6FAB5E65 
X-CRM114-Status: GOOD (  12.69  )
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

On Fri, Apr 25, 2025 at 03:20:09PM -0400, Da Xue wrote:
> This bit is necessary to receive packets from the internal PHY.
> Without this bit set, no activity occurs on the interface.
> 
> Normally u-boot sets this bit, but if u-boot is compiled without
> net support, the interface will be up but without any activity.
> 
> The vendor SDK sets this bit along with the PHY_ID bits.

I'd like to clarify that:
Without this patch the writel the patch is modifying will clear the PHY_ID bit.
But despite that the system works if at some point (uboot) set the PHY_ID bit?

> 
> Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support");

I don't think you need to resend because of this,
but the correct syntax is as follows. (No trailing ';'.)

Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support")

> Signed-off-by: Da Xue <da@libre.computer>
> ---
> Changes since v2:
> * Rename REG2_RESERVED_28 to REG2_REVERSED
> 
> Link to v2:
> https://patchwork.kernel.org/project/linux-amlogic/patch/20250331074420.3443748-1-christianshewitt@gmail.com/

...

