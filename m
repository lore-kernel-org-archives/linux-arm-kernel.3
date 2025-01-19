Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00A3C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 01:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEy3R1KBMOW7TvJCUpX/O5fE7prXvW3WufuGeG7lAkM=; b=CHqmzsPNEYW7cvx3gP75My9Z0a
	thkiR6v51qmzcJ4+cl0fsxJJT4SmV1Ff8C1Rm2yxfm7400O6+XlK7YatpXpjwWc5Ui+pPle7AzDHO
	GgyZT4WgTjtTndNU1y+3Ewq65ookK9LrJpK3qQFHGKKgsaB72rgwEG4NDOOFRcfiBAPAMk3mkpzoG
	Brco92rWfDktWIHu337GqdtXSIVgslQlqAG6Q5eqc6Lkmd+9S35by5ih6l8yylaARAf6+RpnqqE4E
	/MnAWTeTkwJA7yuAhKGo6niqRSclc4tq33N7ADvMusVtl784HQWTEBKLZmvhnN4Bgbw/TPcRr+jWg
	pInvPTMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZJyq-00000003AFP-0IH7;
	Sun, 19 Jan 2025 01:20:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZJxY-00000003A04-29Ag
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jan 2025 01:18:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3ABCE5C0773;
	Sun, 19 Jan 2025 01:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B37C4CED1;
	Sun, 19 Jan 2025 01:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737249519;
	bh=jMKpCmcqxvK3DzGSgrWoq4Cf+fLj1e49WAIOl9sn4Bw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FypJzpKXhRnecHOXBnK4x7g/SScCG/2nh+yqlCEizq567Kq/kBgEru/17+9uCocP5
	 eJe1BcJaoMGYagxJe6FvZZ3SPKfNzAS89vwZ5sIgR4+J6j9/NGyrEdwH2ZipmogB9Q
	 steQy6Y/gxSA64JEC69CiF+yQZrQIk5V1iINWkjpJeWcDTISTnOUZC6K5uWpcNG2Fj
	 BLe67d7mhG3sYShHECxv6zv5TR7xGKNQpYMWLfVCSbdeeYuNzjGgngxNKHKdnwA3hc
	 9i4R47cU8S/Wo/o9rIwkR58wRiyySpmHQ0XOXF45SI0ezGeuLlwTh8MDT8tLH5wfyV
	 REdq7OprwISqQ==
Date: Sat, 18 Jan 2025 17:18:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Radhey Shyam Pandey
 <radhey.shyam.pandey@amd.com>, netdev@vger.kernel.org, Michal Simek
 <michal.simek@amd.com>, linux-kernel@vger.kernel.org, Shannon Nelson
 <shannon.nelson@amd.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 5/6] net: xilinx: axienet: Get coalesce
 parameters from driver state
Message-ID: <20250118171838.215e58ec@kernel.org>
In-Reply-To: <20250116232954.2696930-6-sean.anderson@linux.dev>
References: <20250116232954.2696930-1-sean.anderson@linux.dev>
	<20250116232954.2696930-6-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_171840_617513_E8234031 
X-CRM114-Status: UNSURE (   7.75  )
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

On Thu, 16 Jan 2025 18:29:53 -0500 Sean Anderson wrote:
> +/**
> + * axienet_cr_params() - Extract coalesce parameters from the CR
> + * @lp: Device private data
> + * @cr: The control register to parse
> + * @count: Number of packets before an interrupt
> + * @usec: Idle time (in usec) before an interrupt
> + */
> +static void axienet_coalesce_params(struct axienet_local *lp, u32 cr,
> +				    u32 *count, u32 *usec)

W=1 builds hit:

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:277: warning: expecting prototype for axienet_cr_params(). Prototype was for axienet_coalesce_params() instead

I'll apply the first 2 patches, 2nd one is almost a fix..
The rest may need to wait until after the merge window, unless Linus
tags -rc8.

