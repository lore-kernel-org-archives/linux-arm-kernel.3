Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4977D0BB46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 23:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+GGIhNVRRNzgW+SKhAZejb6hvWOJOC4rqgXL5FvQpE=; b=sJUNGRrY/UFnh4YxAUca5H2bP6
	cqyoFRtCyKAXXG95ZV9/ZgclHE+U3SmoQkXdjAg6XoDumC9LYOmcAhdulmckfhzFXbUIkvxAkm/KB
	wMpmTguOQ0oSKCo/UHPs8n9FGlZqRuQOkgIn+0Yw7s4T7E0UyioZlVTfYcnM5eQSn09hdbPdtU2RF
	CLlH/5f+H1wljT3QLp4pmtzreFFaI0+qqvHpk5CL45lShz85kTEfkfz2JR5JqCp4v0FnCDXwbdsf0
	sz5OThT0byG4VV4p6IF6gZ32nhli/7C02bQWcZTDgkaUxIyfzqqH88qS7NDaXi+MYtrKYjlLK5r9I
	vNZvecOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3kON-0000000GBhF-3Dpf;
	Wed, 23 Oct 2024 23:03:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3k3f-0000000G86h-2SXW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 091B45C5EBE;
	Wed, 23 Oct 2024 22:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69ED7C4CEC6;
	Wed, 23 Oct 2024 22:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729723346;
	bh=tTiJ25Zp/ob+6UlLvL2Q98qetxrN0g9WXC9Z7+TXy2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZSDAc0ylq9WjGnZQ++C9sHnrSPc69JXgtFrLsKEhI1piLa47ISpHqlhYpW7KuALN5
	 32P69SSmwXwFPVwXCH81GS7X7xrb9ZPTfJDhOeJ+WXu1sG6CgZOt2mOxrd7YazZexK
	 /QI73g73kzbDYte6IrGIBSOlWp52UwAwZ6WUEmdT6H5zc5Y5PCI+wMV5PCK3LrTDhm
	 yMyiLlQpZXRwxIB15iIpR+PJRA918FZyy7BJJIo9BxjzVtLV0nd3Xtzu1CztQuu+Ps
	 Xih/t4aRd2xAxBgxyWD1/luxMvETkCx3KqXskOeaMqJf8JcKC+wZCEDO6YydIAdfgN
	 Co3+96PhBZGSQ==
Date: Thu, 24 Oct 2024 00:42:22 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, francesco.dolcini@toradex.com, 
	l.stach@pengutronix.de, arnd@arndb.de, Frank.Li@nxp.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] i2c: imx: prevent rescheduling in non-dma mode
Message-ID: <7ts577rxed4mmfkfin7kfdjfjkb6iak2y4vtgtz6merwxkzz6w@h5aefbvyx44u>
References: <20241014131635.205489-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014131635.205489-1-eichest@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_154227_698213_847F5AE2 
X-CRM114-Status: UNSURE (   6.49  )
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

Hi Stefan,

> Stefan Eichenberger (3):
>   i2c: imx: do not poll for bus busy in single master mode
>   i2c: imx: separate atomic, dma and non-dma use case
>   i2c: imx: prevent rescheduling in non dma mode

Merged to i2c/i2c-host.

Thanks,
Andi

