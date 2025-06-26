Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68003C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2d2Vib0GuyDVu7M9Ce7pUr5HgzQFLyntB7u5aZuKic=; b=RNeLGi/s3+EBeqaHcJclFzwgAA
	InTK6n9I8GlZsT/NZeCCQTTw2BkF1n2+Gct+WUzMJG0FyqZVdOoIfXWIVfQVnVFu6v0EciEgAV5Tz
	oKlgDykAjOsA5UuR62wWrNacqqE0ATGjlU8s+DDyxIkNW3Dzy4DtwXUzdCWFKgStwl8Oa5yVuvhJd
	JIUISmmZfA/YXwQpIX4HSkcI1F+wY80quIJBbq4nn7DPqRzOzz3bcoOQ9qH+OvMwyhbQujiU8FXWx
	edck/jp5Y0Nmznv2u3KXa653xOb93s6RoRLtw+qWmirdTPZLlqa7JBzVbBHZ9zb4HQ4qJhljmFvPd
	L/pgQEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvjf-0000000D1T2-0mTF;
	Thu, 26 Jun 2025 23:10:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtrf-0000000Cnxo-0sX1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 21:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCC7045A53;
	Thu, 26 Jun 2025 21:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC89C4CEEB;
	Thu, 26 Jun 2025 21:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750972234;
	bh=2pVH4lCdwLTdq7UY0LCJQ6LUSrPucSQUm9GeMgpyRv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+hlhwPjR5jNqudoQQnXqbRVXAKa99P9+841M9qjr8qCMsc7NFV0SoklmqxHn7cBa
	 8vmTt4m5pCqfSNQtoc0uQWEvTK4aosDgoZwliHHi9lmlaLCKrrIlDZjHEYT6FzgKBw
	 hhJhoZwQvzouiZ4t60TciyNviyhnCyzr9e9Tp9aUd/GiRSmbCDj1K8L+w296Ss/GUo
	 XsKIqPjJoLzda7hyaOkQTSHgtBFhoDxGDhBsN5vJmpgsxU1FTaaC6dCTr/NGyUQ1SA
	 YdYjhB/q3DZhQseTyr0CDGQEQjwUQ5eiNZW8eRWsd2ZOjF8OhRG/KEajOsWM1tTvMi
	 Z05tIi3KzCsrQ==
Date: Thu, 26 Jun 2025 23:10:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yongchao Jia <jyc0019@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v4 0/2] i2c: imx: guard and drop prefix
Message-ID: <5e2sd4nlwdcbutsxgosij3d45g2ngpzgn6jmn567pjdxsgwzee@gh6duqrxbex3>
References: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_141035_265014_58362CE3 
X-CRM114-Status: UNSURE (   6.65  )
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

Hi Troy,

> Troy Mitchell (2):
>       i2c: imx: use guard to take spinlock

I merged this patch to i2c/i2c-host.

>       i2c: imx: drop master prefix

This patch has been already applied here:

614b1c3cbfb0 ("i2c: use inclusive callbacks in struct i2c_algorithm")

Thanks,
Andi

