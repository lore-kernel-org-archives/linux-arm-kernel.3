Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A028FCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 21:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83EPZXKBOBM5AguXJ8RL1d11Fbsi2HEnYmkbY4my4vk=; b=dX+H+18vtpQ2/h6QaW3MztB6cs
	Hjujeqbi3C8DsrHRpeTbvhcej/VnW2Cw5/4gYlz91kVYYVvu3nst9hN48ioHwp+rKyPys+oMMwa3G
	01IEuR1JhYFNZP5bmB7oPGjJscINRuy+duYlT8zqV1YvNW7YifPYYxhb6Tp4x75eP0AhMwsNgMSZZ
	Mwkc+1s99G1otuXuoMBJRQ39HCgn1vPxKaTIo6kKafGllEHH3S4VLGtvq5Awg63mwgPN7HrWbvpni
	O1QpM7y/9o8Yo8u+kWlVqB6DYYaxYMyg6FnKV6Br2H6IjuIt1U1SD7s6BU8dz2G62u7LL+mGyAqWS
	XiYfDOsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urNqk-0000000Gtaj-1Flg;
	Wed, 27 Aug 2025 21:38:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urKhZ-0000000GRjG-3weO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 18:16:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F2C043AC3;
	Wed, 27 Aug 2025 18:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9B6C4CEEB;
	Wed, 27 Aug 2025 18:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756318613;
	bh=tZYQGAhNSp8+YB6v2kG/8xFnCfWMXDbO7lN7RYNrlm8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j999Rflxi7w5R7tVzCQHs4bPSgFvUnumbiY6DTM/jWC/T17eF4KC1wdJNsrOTNr/H
	 KZIyYiOFtw8xiQzAVBOhGAE5NOIBEolrpV3vlddbZT7jUSy7646Wd9bW9ei9ZXcOXE
	 dAoxlC3yo3sb60t7DBbJcCLiInMv136DCt7RBLX9PWDavGNSzFNbZkUw+svZ/lrOMT
	 bKqSDVcVMIa5zAldh9d8QkO2IXCrEhgrYLbbBmlEHV5Z8+XH04QKU4ryOVmkvfhGgF
	 dHMO7P0Tzhtj+XT9cj6g7uE3YOSfqXy7Wj1W5Z5X6cTtmvPsFn4EBBf6kvo6/rtDaW
	 aOBZkZ8RJdGlg==
Date: Wed, 27 Aug 2025 11:16:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukasz.majewski@mailbox.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v19 4/7] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20250827111651.022305f9@kernel.org>
In-Reply-To: <20250824220736.1760482-5-lukasz.majewski@mailbox.org>
References: <20250824220736.1760482-1-lukasz.majewski@mailbox.org>
	<20250824220736.1760482-5-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_111654_005882_8338DD83 
X-CRM114-Status: UNSURE (   8.56  )
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

On Mon, 25 Aug 2025 00:07:33 +0200 Lukasz Majewski wrote:
> +
> +	/* On some FEC implementations data must be aligned on
> +	 * 4-byte boundaries. Use bounce buffers to copy data
> +	 * and get it aligned.spin
> +	 */

Almost forgot, the word "spin" appears here rather out of place.

