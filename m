Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610F1CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 09:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZeY91bsLZ6XcUtAEW8LR2FhjQcmo4GITFYewTgQyTU=; b=uwTvrXhbDQ7lZGrRYslj8CCeTP
	TdSLR1mbkktf3fJg6XvPfbHbsZQRBwGsMsv/46WpIpzl0ELDd/HZJlpInJWsdqcUyH6/pX6Uz7p1Q
	0xh+twH7ZPXBxZol+SaHEex0x4yOyzHzt9RbBQ+Z5Wxt/xht7gisQjeG6/OR4HgwPVH8CJE3wGaYS
	quu+HJorkMuwNpeT7zvOiVU+9DXLwCHZIJQgG8KyYlShXqXVAIKsqk3qWE5xeMF+gDb7XIvuAaNAA
	GIs5YF3upaH5IGHsuMVy9gWZhHTzTa8W45XnhGPLyNQXnwGiG/pnnEaCVGCN56bal7NZ9gZieiQeQ
	YvCoEFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmHl-0000000GwJa-2Txa;
	Wed, 17 Jun 2026 09:10:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmHl-0000000GwJU-0eIY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 09:10:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6109C40740;
	Wed, 17 Jun 2026 09:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A941F000E9;
	Wed, 17 Jun 2026 09:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781687412;
	bh=cZeY91bsLZ6XcUtAEW8LR2FhjQcmo4GITFYewTgQyTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CNWs3zZjlcA1gaAwoIQDc6sIc4rHPrYCKFvz7Um7OaHbuzS+Y4+tufkSTTKo9VznT
	 AmtO+GEq/K5WbBGhV+xtrE3dbM4Yoa+QO5NCpaOYX28GKwBkVJWtTGab6YKgEA5ZFw
	 Pg+o2jnNE5W/vOrhkQc9TBjJeYb47U6KT82pxmY5fVmi2NKDY0cONakXjsCwVrVzE+
	 dgdg54ax9/H6QMlpJFrkjcwcFpnmQ1ymNfj1xtaMoQHZCgozdo+Adu/tFmtisgZRbl
	 0ixZcaweD0r2hNv0fkXjzvZucg0Z+U4s5/qy6fyo4ejUZpggvV7TPsXvMikUjhtCCa
	 tHUzFSzxOuLBg==
Date: Wed, 17 Jun 2026 11:10:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>
Cc: aisheng.dong@nxp.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, carlos.song@nxp.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] i2c: imx-lpi2c: mark I2C adapter when hardware is
 powered down
Message-ID: <ajJkQIUD0gu9nlf3@zenone.zhora.eu>
References: <20260525031450.3183421-1-carlos.song@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525031450.3183421-1-carlos.song@oss.nxp.com>
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

Hi Carlos,

On Mon, May 25, 2026 at 11:14:50AM +0800, Carlos Song (OSS) wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> On some i.MX platforms, certain I2C client drivers keep a periodic
> workqueue which continues to trigger I2C transfers.
> 
> During system suspend/resume, there exists a time window between:
>   - suspend_noirq and the system entering suspend
>   - the system starting to resume and resume_noirq
> 
> In this window, the I2C controller resources such as clock and pinctrl
> may already be disabled or not yet restored.
> 
> If a workqueue triggers an I2C transfer in this period, the driver
> attempts to access I2C registers while the hardware resources are
> unavailable, which may lead to system hang.
> 
> Mark the I2C adapter as suspended during noirq suspend and block new
> transfers until resume, ensuring that I2C transfers are only issued
> when hardware resources are available.
> 
> Fixes: 1ee867e465c1 ("i2c: imx-lpi2c: add target mode support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

merged to i2c/i2c-host.

Slowly I will check more carefully all your fixes. I'm sorry for
the delay in this period.

Thanks,
Andi

