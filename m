Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648B5D20682
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+j/Dyt2kX1KcZTxk4BFPDXWyhzYkXuFwe5a7yW2SXhg=; b=VLiD6v2ZzdYifpj6xlMs6p9MOj
	R0dqEZVO+T6iUmsnFgRgCEpKXeWSodxVWcTBTqzsJUwQy9zlRgFADoeBxaX3wt/cTaiYFDd7bj0x6
	zBEBwnRDTaS4+KOimIejASij26uYbZjUVIitPnsKYU0ghq4xfd60GZc+zikLpzqyDwMX9xloI4+Ou
	8qRj87TijL+6OQBUJQdP7tCSTrrEjj9LP3N+N9pCUlsD93DnYIzPm6rql/ANQcsGdnWMq/VeOhU4S
	pg1Y/0BPiismHznGvIgDEYfzA6H8E2YqlyAS0dWvpFVNbPIlo7a+IBHOsQFps1YOMwI0heRzlXLIG
	/TtiQ3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR97e-000000081of-1aV4;
	Thu, 04 Dec 2025 13:11:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR97a-000000081nf-3tPe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 13:11:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD883440A1;
	Thu,  4 Dec 2025 13:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793D7C4CEFB;
	Thu,  4 Dec 2025 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764853905;
	bh=+j/Dyt2kX1KcZTxk4BFPDXWyhzYkXuFwe5a7yW2SXhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdbHbA+kiUZDRXwApyFbS8/kSEPio8MVHsoe7cCdxa4qu0+SShbA9HZKQRO5XVT5M
	 5pI/eDL1skHttyIeVy3WtGPUeYg9ma4iCDaDGFbV/hHsELYZ6xKXAQTFN2x75BO3uw
	 v5o9Z0DnZveASsbZZBDggo5nC2DeJR+QXmB3UuPGz9OH4u7iKiFvp4+xmQqBZJNihd
	 XONQn+wZMmKFlPwFfZrQps4Bu1zFOsrtKKmLu2IyGDp57xbbiJrog6Io6NB4CBZdjk
	 weHtGtAYyjKQ5pcvbggaYAAkFNWVi8mbhf0/eZRPzvILRbkw0hnmLfrklFx2Wgwhij
	 krCwcXhQ2ut9A==
Date: Thu, 4 Dec 2025 13:11:40 +0000
From: Simon Horman <horms@kernel.org>
To: Jie Zhang <jzhang918@gmail.com>
Cc: netdev@vger.kernel.org, Jie Zhang <jie.zhang@analog.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Furong Xu <0x1207@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: fix oops when split header is enabled
Message-ID: <aTGIjNiHhWHd_RkN@horms.kernel.org>
References: <20251202025421.4560-1-jie.zhang@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202025421.4560-1-jie.zhang@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_051146_983252_CB96CD1F 
X-CRM114-Status: GOOD (  13.00  )
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

On Mon, Dec 01, 2025 at 09:54:16PM -0500, Jie Zhang wrote:
> For GMAC4, when split header is enabled, in some rare cases, the
> hardware does not fill buf2 of the first descriptor with payload.
> Thus we cannot assume buf2 is always fully filled if it is not
> the last descriptor. Otherwise, the length of buf2 of the second
> descriptor will be calculated wrong and cause an oops:

...

As a bug fix this should have a Fixes tag here
(no blank line between it and your Signed-off-by line).
As a rule of thumb, it should cite the patch where
the bug was introduced.

Perhaps in this case the following is appropriate:

Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")

> Signed-off-by: Jie Zhang <jie.zhang@analog.com>

