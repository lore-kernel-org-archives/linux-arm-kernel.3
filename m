Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DA3E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stisqZzXKCwrEm7Tsl1o3SOUQmBoEfSButbnNg8s3zI=; b=SxfM23d7W4Ghot+nyzeID59Wiz
	a8o6FUqWMVb2x0mMvb/ynqLhaMVklYp9KeMW11PKT7CE9uMxqx1wnF+fVlO5J/dESUf9UUYf4UteR
	0W1MBHn8KY1CNkDJVyc6BBzCNhhJYVgQO18JdcHEnqgYNyNq8Xs1aVvF1nIJwTLrQ9l1jMkftw5X8
	z9PUnHF0Q7Jiz1oCYKD7pZsqZBenfuH1Mc9tRgzhzEoqVI1KGJCGmQ2KigO9BUxY0KMQZA5y3NyrJ
	0iPCIZjPEB5BaHDhuWRiCc2v5zJV9xOONlJjnARiaO3qOXHWBthPdHmj29BUMpN/NDZ37O+GUCeOI
	MEJlgdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBoR-0000000Eqt1-335A;
	Fri, 10 Jan 2025 10:00:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBjW-0000000Epgy-3cOo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 09:55:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8DE5BA41C63;
	Fri, 10 Jan 2025 09:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26485C4CED6;
	Fri, 10 Jan 2025 09:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736502913;
	bh=gkpmHwnR8Yh/n2rNCUGtcEYp1sllwOnm/9K7DGRRUzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QItRPsT0l45znuNh9ylybQ2raG04cRGacxDaULTQjfASc3ljcAcN3fEPXrtBXqb+p
	 WxPuyaE0d8IDZ9MAqTXM+ZQTPBfIW21sWkmX9gpzLgaVHsRTX7ks8+rvu9wwOOc9fn
	 Om5dh2yMYMF+cojubaOPFKgzmpdIxvUz3V5E1yEyi1r9PpA7xSc0oOWcjcMBgCsgYU
	 RZZMEbBz/DYif8pmzqYtRvpPgEIK5Gku1mEmKYs2bVtTfuxnzcN0FUUWh5RyT2fFWS
	 MJT5XB4gIOXEBD8ws0bhuFQdxyf+BUzugMTS9xSdJmRPtAHAQ6SK9/fEMHEh9KHYAz
	 kjva7Qi2GRWTw==
Date: Fri, 10 Jan 2025 09:55:08 +0000
From: Simon Horman <horms@kernel.org>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: stmmac: sti: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
Message-ID: <20250110095508.GT7706@kernel.org>
References: <20250109155842.60798-1-rgallaispou@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109155842.60798-1-rgallaispou@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_015514_965852_7E0E0551 
X-CRM114-Status: GOOD (  10.79  )
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

On Thu, Jan 09, 2025 at 04:58:42PM +0100, Raphael Gallais-Pou wrote:
> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
> Changes in v2:
>   - Split serie in single patches
>   - Remove irrelevant 'Link:' from commit log
>   - Link to v1: https://lore.kernel.org/r/20241229-update_pm_macro-v1-5-c7d4c4856336@gmail.com

Reviewed-by: Simon Horman <horms@kernel.org>

