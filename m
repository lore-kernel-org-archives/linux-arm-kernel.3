Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8ABCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 14:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yA5JPGmM9+DIovHFNOYfqsmTWKkkgyERhyC5rBngGI=; b=dlw6j6SAdd3D2/Cc+VLMhLf0R5
	OiWJhw/jbGOO30qYJ/PEuntEst5DvCs5cujVlieDe66tkwK6k6jGMOmhRUTK6ZVYf/c75/a1DrnUN
	WcpUIf/81Bc3OL/aVRKFfxXPBO0iSYEKl3LtJJbXYumgJuNAQZjkh4U0ybsOGREDcXcMoadDUpd2q
	Lwn5s8Zs7YjzngLxoi0cSrnuASGyr8/GlPaF+zy++9q4K+f+GJNWaOxby3R5n6lrxyhfKAFNsnOUm
	OTDmO0V06cdzixMPyzsLE810NenIaivCtehic0vkb2n0TkahGttpkfyDNHc5s8RoSl3fRMYj/zBTR
	u4TDyX8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usjI1-0000000AINb-2tr4;
	Sun, 31 Aug 2025 14:44:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usjFI-0000000AIDM-3mUZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 14:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1yA5JPGmM9+DIovHFNOYfqsmTWKkkgyERhyC5rBngGI=; b=J4+35CvvDsKQ/kpNwfXcCm65GQ
	rXJLTHlYgXGoL76HF60A5gT1N1DEllJg4LEeY4poc2aDrrSYcXeG7ROhzylm0vhj0SgbxdJnGBkWp
	G133F7bu7ZkfIkLtj0i/UAKgC7eBpnuyUPQCf1K3hS7Js+IpPQGdn1ueLxX3R5eC5Yt0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1usjF7-006eZw-E6; Sun, 31 Aug 2025 16:41:17 +0200
Date: Sun, 31 Aug 2025 16:41:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] pinctrl: armada-37xx: Use int type to store negative
 error codes
Message-ID: <272eb94c-0d19-47ee-868b-94d07a692877@lunn.ch>
References: <20250831084958.431913-1-rongqianfeng@vivo.com>
 <20250831084958.431913-2-rongqianfeng@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831084958.431913-2-rongqianfeng@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_074128_942078_16968631 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

On Sun, Aug 31, 2025 at 04:49:56PM +0800, Qianfeng Rong wrote:
> In armada_37xx_gpio_direction_output(), the 'ret' variable might store
> the negative error codes returned by regmap_update_bits(), and in
> armada_37xx_edge_both_irq_swap_pol(), the 'ret' variable directly
> stores -1, so the type of the 'ret' variable needs to be changed to
> int in both cases.
> 
> No effect on runtime.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

