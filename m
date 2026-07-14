Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A32C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 22:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnY3zyFinC3+lm72vnzw/gDx1kFOPSh6nzQxKUrgSKM=; b=0pLbaN1RgxtbXi1jut2lPOrJnk
	IxLGsZC+4Vngz7lL6S10ByU9gBC+6COkMgi0wY+s1Ou/SxsIo96/tV+iRtIFSrm7RfgRBxwvXE90I
	8HFB7CPUycNZZgZP7yRI5Qg6mnn/Dl+tE0HMkepm/3wd0UhnTcReOE9YSnprZOwYgwj9kQ3wlIfXz
	QwiF2QtTZkEOveRFBZW/aDLw4851blNPyO6/8uZsAEtWU8xOhO1MQ8ZAVM3TZKC8Nu/OUtr7DfYLd
	omShvMs8A9gDmJzUR5OqBixnunSIaJYH0YI7R2tfURlqUEX4JkuEI0bPpJK23dS9XMa7xEIHjJflr
	IkndZTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlZd-0000000DPAu-25ly;
	Tue, 14 Jul 2026 22:25:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlZc-0000000DPAV-1gYT;
	Tue, 14 Jul 2026 22:25:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CF230601ED;
	Tue, 14 Jul 2026 22:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F831F000E9;
	Tue, 14 Jul 2026 22:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784067955;
	bh=FnY3zyFinC3+lm72vnzw/gDx1kFOPSh6nzQxKUrgSKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N98NbSqpiwClF1AgURNZpLcV2roeim3qj6ofCisOzrlaFw2JSk5FNtXl6hVOyIrpk
	 uN5nJInB316XY56tbnTv0qZIdDtETMWtXsxiDrGANR3eETeX5R/R666jWhgkf+XJa8
	 pkQ+JS1G7lcRGalcFWyN3OJ3Xs1xcgf0tCzTcFO332gW65eSVlptxeSmo8wME+curv
	 A1JJZuDNOVVkUBZTUVDKkKa620F4Mya3ECF7JSiyM8AhOGRx8EsJMLPHr131yrqG/h
	 67+L/NdfLDGvUvoDJUXg5+H1k6LilDwJTMK3V+EMOZ/GxiKrlXKBd942W+EtvH2nmK
	 k4IoUrixnUi3Q==
Date: Wed, 15 Jul 2026 00:25:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: rva333@protonmail.com
Cc: Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] i2c: mediatek: fix WRRD for SoCs without auto_restart
 option
Message-ID: <ala3XZ1Jw_M8sZlt@zenone.zhora.eu>
References: <20260709-6572-6595-i2c-v2-1-b2fb8510d1d3@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-6572-6595-i2c-v2-1-b2fb8510d1d3@protonmail.com>
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

Hi Roman,

On Thu, Jul 09, 2026 at 04:31:29PM +0300, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> MediaTek mt65xx family SoCs have no auto restart, however, they still
> support the WRRD mode in the hardware. Because auto_restart is set to 0,
> the WRRD mode will be never enabled, leading to read errors.
> 
> Fix this by removing auto_restart check from the WRRD enable path.
> 
> Fixes: b49218365280 ("i2c: mediatek: fix potential incorrect use of I2C_MASTER_WRRD")
> Cc: stable@vger.kernel.org
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

merged to i2c/i2c-fixes.

Thanks,
Andi

