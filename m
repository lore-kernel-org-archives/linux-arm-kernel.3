Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AE9C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUi8TvaGZ/ONLDR20xtbgTj2PSwgrawqHUmwvPH281Y=; b=UqaAW9m3+69MFPmnkqYeZq1Jtz
	5LUsOOXNq+1RYStYIiDipNKSJrtn6kO964eixJkz0bg0lMLw9xxT2dKK8q4+b77+UuMh+ZThEoBQ5
	WHiBW/xTDclRHaBX6V3ofKLKvpyaL3l8AwgdmFvKVM0q4+BLZRQh1ol9HG2pJEz0b9mG5EzdwvSkf
	sgljbcwJUbXsbKLKBRB5Iy2UViJNv/c5FlHV/mtRvdUYPkdT0hekqsjlUUMe7up++3Ra73Np9DsD7
	8U+mgoDyFQTWUtiDsSeEYsu74DZ/+Ufpy4Xa6IwdGPgDv4xRK2D/naOasySK4Kty9hoa90DT6xW1E
	e2IT1Huw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSpX-0000000CNuu-3h4P;
	Mon, 10 Aug 2026 16:26:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSpW-0000000CNuR-2thB;
	Mon, 10 Aug 2026 16:26:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2595A60052;
	Mon, 10 Aug 2026 16:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE791F00A3A;
	Mon, 10 Aug 2026 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786379185;
	bh=SUi8TvaGZ/ONLDR20xtbgTj2PSwgrawqHUmwvPH281Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iZLUvplyIcNz5VE9d3kCC55idVkZrcMUkNQMbp9OGxSTxJfNYZ4yr2JOIOsKLJAn8
	 OObjougUbmk/38Tg1bYoCpjH+ub9h5QwXhL5o/8zljucHR+7DSNhua66AetPZHytcQ
	 3y2CRfYBQvSNkeuKQbvgCx8L6hlt9D3WV679tfLe6BvPHzmCHXlH9U99BxReF/HGin
	 TL4hR+2U4zuEU+faiR9plq7xmFoQFSgBVHxVjTPoHNr+pLGwQl794ToVshVql7ZgUD
	 g+L0acQ0yPs3jYsKAs1idJ115olPzn+IoDNqdAlrajYd2g8cEdKKUpyT9Dcts4aZoC
	 Zur8II8DGV73g==
Date: Mon, 10 Aug 2026 18:26:15 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v7 13/16] power: sequencing: pcie-m2: Add usb and sdio
 targets for E-key connector
Message-ID: <hxidwwqeooyo4fwjc6rmbsfv35b2af7flub23qcpwin6bqj5ff@h46sqvwc6k6i>
References: <20260724084328.3943997-1-wenst@chromium.org>
 <20260724084328.3943997-14-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724084328.3943997-14-wenst@chromium.org>
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

On Fri, Jul 24, 2026 at 04:43:22PM +0800, Chen-Yu Tsai wrote:
> The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
> UART for BT. Currently the driver only supports PCIe and UART.
> 
> Add power sequencing targets for SDIO and USB. To avoid adding a
> complicated dependency tree, rename the existing power sequencing units
> "pcie" and "uart" to "wifi" and "bt". The existing target names are left
> untouched. The new "sdio" and "usb" targets just point to the renamed
> "wifi" and "bt" units.
> 
> The "unit" names are internal to the power sequencing framework, and
> should be confined to a single provider. The names are only
> informational. Dependencies are tracked with pointers to other units.
> 
> The "target" names are the strings that the consumer uses to acquire a
> descriptor with. As these remain the same, existing users will continue
> to work.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

