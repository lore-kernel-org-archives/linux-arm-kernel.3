Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21DF106FD66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 01:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXTxns2W6eSGRy0mEIfIG3dXjhp8eWYjTL0mDhCObM8=; b=dyxUi+zb6uBMjrjQx5efdfDwNX
	b3f8GYUNdwuAnm+Lii4YAUzQGDvDpXAWBlwYtLn87weov2Ng9knFV3GdSy2C4+yHptqxtF5Fb8h7J
	Kt0jG19cNnRepFcgJ3mN2u4v9Th3md6a717yXDQV7NemnqiRueQV3vPlNc3UJS0s+Iv725n7nMZ/1
	Meryu3+BhJvo4jnpQP7nJei5JEVbtQaR/XAEQYLc2viPkwzkBNSay2P5rMqX1emtKoVnOHkVYJ2iL
	JzOkgWAqB1DewbMTdRh+JyV/AaG32mIrC9Gofc33zOXalPJqMHU1fH4pSNzgAZzZsX4SIXyswPZ5Z
	NNBp11cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0rDZ-0000000G40i-0asX;
	Fri, 13 Mar 2026 01:21:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0rDW-0000000G3zx-125A;
	Fri, 13 Mar 2026 01:21:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BACE9407A1;
	Fri, 13 Mar 2026 01:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31556C4CEF7;
	Fri, 13 Mar 2026 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773364889;
	bh=RT5cCoFd51XlFsbavm43RBi3zqtF/Bni3O89ezyTihQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lKrIEJvi88ynMx73j9D6v1S2E/u0ZviHUojbpcdcohUAxa2J6HsjbBv5IzZ4Sivbe
	 quWYsKvkiatSCzdjRsht3U5CsSpu8huhGkl9jwjdhYL1L24uI05irsbEz/AcmKJgdQ
	 XvHigJGItZOyb0TCkmI7qVMKh0unkdPu1+0Gtl8z7sQYDw24+9EEs4jjBARFoBAoIc
	 nfxqxA/XKs7V5GNkHLk+P69jGQpRhnTE2sbrY0JHhBcasCsX4k1xTmuXxFBIOakVtO
	 8PyL2QvmusaSNiXHDaE1Ti1Ks/i9wSYMDAkHJ0v6An4cNtZUeGYjDzfgniFNptYGES
	 tKrIBzyC5F/RA==
Date: Thu, 12 Mar 2026 18:21:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Remove airoha_dev_stop() in
 airoha_remove()
Message-ID: <20260312182128.33d2d88c@kernel.org>
In-Reply-To: <20260311-airoha-remove-ndo_stop-remove-v1-1-596fe853b2e1@kernel.org>
References: <20260311-airoha-remove-ndo_stop-remove-v1-1-596fe853b2e1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_182130_340203_90630D12 
X-CRM114-Status: UNSURE (   7.01  )
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

On Wed, 11 Mar 2026 10:54:57 +0100 Lorenzo Bianconi wrote:
> Do not call airoha_dev_stop routine explicitly in airoha_remove()
> since it is already executed by unregister_netdev() if necessary

This one is a fix I think? We underflow the atomic if the port
is already down. Once again, commit message way too terse :(
-- 
pw-bot: cr

