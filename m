Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC232C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdepXRfOEoQRVYwcpWcyKZs9GtmS+di7yb74Y6cRJNg=; b=ldDQAobRQFXr4xc5F++HWHRFJE
	TzpXceEfzJHPEe6EMBjbWdJJpDBgdrlGVxDL8sB2jmXMm28kdrCrkTmHl2ApPwfCfVJEpP0ODAT+T
	hDf0FwmzNRBYqebrNe6CLuVSzdxdx2MiMLwoYabhqEK7Rk5xUwiUOkeuRPe0SupV4ztrR53dmuYhy
	dF8K+GJGDl2Qt2aza9oot3eH0T/72j4fT5TfqFzTX+/LkpRr3WRosL/T7cSyLvKO2EDR/joTgSmCp
	t0BQ39/whoUfa45mg7jTcBp0ClnhmstV8gJ8wVviQ92Zv9KJm7vNndNHBvvQla0P3rVmnX/oxHAkF
	UUQopBzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwj9D-0000000ABAi-0prS;
	Wed, 19 Aug 2026 16:28:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwj9B-0000000ABAa-26LH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:28:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4556B439A7;
	Wed, 19 Aug 2026 16:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7531F000E9;
	Wed, 19 Aug 2026 16:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787156893;
	bh=IdepXRfOEoQRVYwcpWcyKZs9GtmS+di7yb74Y6cRJNg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=l/6WUj6QP3QWDdH3LfH9Wm5cGOhFPpX/LGylk/NmXBqs2lDQNmODI5cjKtoQoePdh
	 9luPw4NMCmRaT90Y4ioOU/Js/yg0jbSiVC7WJsifTFwSic2Ns0JZ3B0ES/bKj9Uinz
	 kuCmuErJzjFh6GsZYPgU+Ilb9oO2OssYBGRHFLWUKXcRtjMAp04TOXWsIfb71QlCUl
	 NkMrmcqGJJlHsA0mZA35pFYyu8jIJI4PjYwCyHT1OVevBtTUBz38+YVy72poW2jm3r
	 IpIENmIwECCvJzK3VU6JO322abbhyxs1Hv8X/ONMiNWm6ockA9jTA+Py6Lqh7WZp/2
	 MsCHtzBWw7wIw==
From: Thomas Gleixner <tglx@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>, Zhipeng.wang_1@oss.nxp.com
Cc: Marc Zyngier <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jindong Yue <jindong.yue@nxp.com>,
 xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/5] irqchip/imx-irqsteer: Use devm to manage the IRQ
 domain
In-Reply-To: <aoW8tbTmjMKs1IEO@SMW015318>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-3-Zhipeng.wang_1@oss.nxp.com>
 <aoW8tbTmjMKs1IEO@SMW015318>
Date: Wed, 19 Aug 2026 18:28:09 +0200
Message-ID: <87tsoqjcrq.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, Aug 19 2026 at 09:24, Frank Li wrote:
>> Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
>
> Nit: First patch also need fixes tags to backport.

No. That first patch is not fixing anything and I just explained how
this is done.


