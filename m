Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EF5C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQO2yLCuvyyjb9kwnOf42UURUHWUmykZv1MVLPFfndU=; b=UfPkdpzdkHm2T4Y5WieZgioLi/
	1sAmrZVeL9BDAF7ai2M7CZhvmyentMUvvPhfuVY6aeNM9s/CLPcwcG3aqJCK56PzRZV2enNQD85Q6
	JZqT52XT38tiQVk6Ofa3kr6BYLuRlAXG7IKVW/iaCD1QUkJA9anolaHJh58Ih8ENv01GmPDcR/w73
	iMXHxoXqAINUIeZGrKagVZvVCkeOXYVjqYY2+rXPkUPgeR4dhTtp7Mls2u6vDN6AtO5loVJUxARFf
	n309bhqLwgVSt6b8NfQ4rumju8UbGrq9QzqkRCW6q6oNmJC6bvuPWogaz+FQRHQcrImtz0xTaziUj
	duDHirPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PLw-00000001Nje-0BwX;
	Fri, 04 Sep 2026 08:32:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PLu-00000001NjO-3HJa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:32:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 713DC43716;
	Fri,  4 Sep 2026 08:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDF91F00A3D;
	Fri,  4 Sep 2026 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510770;
	bh=AQO2yLCuvyyjb9kwnOf42UURUHWUmykZv1MVLPFfndU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=Bpf/CL+mJpaJzRAHF4YSGGkjyZT3Tgm8ZZ00BZVxvd300hDOS32rnJUr4NJxPZKgQ
	 lWn0O9g9v9ZvzRWkIHkwQuLcbOq/Iczn1VyoAO2eL7q54UsTiHcT8rXKLUAA0aBAQr
	 em3QLSDP4uArMdwvMQWXZ0MfTWHp4KXTY/GGVdVAsByHIhm2rzYBhpi9yU2NQPgtnt
	 QYCi5Gb4vQCjjrGu9ouZCOkRUlR6JvvmDrNqOvg81ov29WM+qI5Atuc3zNmCY7gVM0
	 P8St61CwKFdyqIUJjbkfWlhTfehweZ+aUyF9BbPip2GRJKKQh5qBMt4hZMazS0+7uQ
	 NuvgHLm3SyvUA==
Message-ID: <c25980ef93153c0edc6c5bd73e2e2a6a@kernel.org>
Date: Fri, 04 Sep 2026 08:32:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 08/13] drm/imx: dc-ed: Support getting source
 selection
In-Reply-To: <20260904-imx8-dc-prefetch-v6-8-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-8-26643e3f6cb7@nxp.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Conor
 Dooley" <conor+dt@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Vasut" <marek.vasut@mailbox.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Rob Herring" <robh@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Fri, 4 Sep 2026 15:54:58 +0800, Liu Ying wrote:
> Add a helper to get ExtDst source selection.  This is needed by
> disabling CRTC at boot in an upcoming commit which tries to get
> the source selection.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

