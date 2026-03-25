Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5046A109C04B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 17:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TllsjPFo8gb4TyIWjEnfjHPZ2SVBIH2YCBi6sU7qebQ=; b=FCQUk6YhjcEbKqefA9ktjKRiUi
	kM+yMQtqyY2l9A5cwTxSTKrBj5aybOyOYlXjFgVzAnZLHzUEXPa6cy7korz5g486HZtq3rW0Y0UHw
	FJ2yVT4om4+w3pW/We2dyDawOA8uMMv7wv/30XpmDw8G7ihTf5hYNsYgyjbaAS186ftXcXHGIV49r
	D/pjfmWghRBtOITH2H1OhkMlmJ2Cw+PuOf1ley+pJfA2sl11+sj/hBlZIe6CDruL/7OvYlps3Kv7a
	iKxbbKXdcUHuKkPUQP4Qn/BTINdTmDctUAWChdeULHy/sSM7YhVmZc5M8i+8i0CaMB5rq+J/OuTNI
	HBq1WbNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5S5l-00000003zrd-3Gnl;
	Wed, 25 Mar 2026 17:32:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5S5k-00000003zrH-0hbM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 17:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61EFD60121;
	Wed, 25 Mar 2026 17:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815ABC4CEF7;
	Wed, 25 Mar 2026 17:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774459947;
	bh=8GqO3HvzzJYkW4x/N8W7oxwcQYGvUt7FuGhmUNDQxF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QEwG51+BxvWtX4QW7gjq6ZbpQGJBo/T9WUazsM124tztml1mRxFCKiPQE7sz81ytU
	 Dw2uXcRldpqql82RqvHzfQCGuoLlO1YIRBDVvtWTYwo2jkoJ+bPXYXDVAPYdlOHt0C
	 vFAhk6sYsKKik6IrFri2uKGLn4nftG5d/sZGMbokmfkNAkbGky2M7kv+UoAsNltX6U
	 YhsZr1YQUcSyUk6MUvLmcGRTeBMEsviv2TlUcaBrY4CiLFRlfejjb2eaTgZxOA3JzQ
	 B42mGbPARNyVrMy2ASSvRqpL4vK8aOfOkdVK3jnZgDrHL56ztiWNUb7OyNlFrtOvkX
	 dTfQxRElWzGNw==
Date: Wed, 25 Mar 2026 18:32:23 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, festevam@gmail.com, stefan.eichenberger@toradex.com, 
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] i2c: imx: fix i2c issues when reading messages
Message-ID: <acQcEtaTU-8KZlFn@zenone.zhora.eu>
References: <20260218150940.131354-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218150940.131354-1-eichest@gmail.com>
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

> Stefan Eichenberger (2):
>   i2c: imx: fix i2c issue when reading multiple messages
>   i2c: imx: ensure no clock is generated after last read

merged to i2c/i2c-host-fixes.

Thanks,
Andi

