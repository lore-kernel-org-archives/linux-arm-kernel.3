Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D375DC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYbY51/WxGMaDR4VDeSov/drtxwtC1OK6EoxP0AVW+Y=; b=KhV3dnk6bSNoei44N7OusN2arF
	vFaj9k4L/EqUyQe+v5pTYYQCV/IWfdaGeUSTzEJwhaMYqRje9FZUucZsZ8dnLm5+znkbm9opvEVxl
	MQqp+5/uciN8cUR0GYl5t07CEDcwlvorvCoKqqIwxNbuEIQh8WpNX9+JmgIlSqeKdM7g8WakC8Wkt
	ENiCDLdiuNZbMJeeiwmjeWyiF+3Q/2Xv2ptqhyoSYzWd49eUrcUfN0WC1rkDe9VNB8MXYZTGFK0HY
	EdSXalDH7Tki5sPAOVDe0DwWJnHqJbo81QlvuQyjvFFvNTJLGjrJDelM00MXliIUaiA7Q6LmDmT9W
	QY2G5k5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4xT-0000000Ctvp-3JcP;
	Fri, 28 Mar 2025 08:20:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4vk-0000000CtfA-1ZO3;
	Fri, 28 Mar 2025 08:19:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C9F9614B5;
	Fri, 28 Mar 2025 08:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D4AC4CEE4;
	Fri, 28 Mar 2025 08:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743149947;
	bh=eXkyQAmWLQhgbflGuE6/2roWByAJGJzRKnWkxqKXpr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qG3GtZtnCFsiKLE21GDIQj94MikZUdLpBnmZDeoZNnTD4vf6OZTlRrVb/NtZAe/TW
	 xMQySvO4HGCmmIA/+2e6Yyf97jRCGtfxzaFD9JfBBdqMCSHugcNjRSf0k0pMeWNgkh
	 JIlDAfdbTjEMPggbhusLn7HjPZRbb9ZyDaSM9gNN1uHaer1mVDimaxp4XXvlg9DaQN
	 8A9hMhvqSYBg39PkGF82aQkFCwKwLe8JRmwdXBGyenkYje5d/VayiU2KFIO1pOGS0P
	 6taEZ0fWLi6pnQqARE7alhTwPZKLy55U8x0/sD7ZVfQmljHmIx4+JjPZQI+p0rSACc
	 ps4zNQAIpwVfw==
Date: Fri, 28 Mar 2025 09:19:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Cc: Matthias Kaehlcke <mka@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Klaus Goger <klaus.goger@theobroma-systems.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de, stable@vger.kernel.org
Subject: Re: [PATCH 1/5] usb: misc: onboard_usb_dev: fix support for Cypress
 HX3 hubs
Message-ID: <20250328-holistic-feathered-guppy-5bac92@krzk-bin>
References: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
 <20250326-onboard_usb_dev-v1-1-a4b0a5d1b32c@thaumatec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-onboard_usb_dev-v1-1-a4b0a5d1b32c@thaumatec.com>
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

On Wed, Mar 26, 2025 at 05:22:56PM +0100, Lukasz Czechowski wrote:
> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
> index 317b3eb99c02..17696f7c5e43 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -104,8 +104,14 @@ static const struct of_device_id onboard_dev_match[] = {
>  	{ .compatible = "usb451,8027", .data = &ti_tusb8020b_data, },
>  	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
>  	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
> +	{ .compatible = "usb4b4,6500", .data = &cypress_hx3_data, },
> +	{ .compatible = "usb4b4,6502", .data = &cypress_hx3_data, },
> +	{ .compatible = "usb4b4,6503", .data = &cypress_hx3_data, },
>  	{ .compatible = "usb4b4,6504", .data = &cypress_hx3_data, },
>  	{ .compatible = "usb4b4,6506", .data = &cypress_hx3_data, },
> +	{ .compatible = "usb4b4,6507", .data = &cypress_hx3_data, },
> +	{ .compatible = "usb4b4,6508", .data = &cypress_hx3_data, },

Why are you adding so many entries? Same entry is a strong sign these
are compatible.

Best regards,
Krzysztof


