Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0206F3D60E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 18:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LafMpKW3NSnJa5FfLZmmzqltgjxT9kZoM/+zl6NnOfY=; b=XRiVKaAY6GwCKAAH8bvm+JlAao
	u6O2LvnU/u65sXTfAerx8vQJckf90mxNpB03ReWrQaGxGJxllysIvS7cXKAzuccve1xK4bbmAv55y
	SJytVpKLbAyEwLqmvX1Se7cxtVPtgFQYfzylPj5Mr7dE1KCb6Qmuunq8pQoMBHXFe5u7SGBwibMUS
	n8CMLvbZWs1L2QaDtZNSipD9/rmffqzQifTYgL0aqRlc0wnpfV6gvOTJCugW8+/ycpAsr/WKXUjKx
	+4Ez63ABjoOn6gCz6ZQuzhLqPUA+1NjtRuzAc1P4X+gdnDclIKW2IJ6fVg9EWHGTxdAn/Vz4G7i6S
	zcD6msqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ubh-0000000ADzk-0xL5;
	Sun, 29 Mar 2026 18:11:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ube-0000000ADzM-31Wv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 18:11:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B32C640499;
	Sun, 29 Mar 2026 18:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C467C116C6;
	Sun, 29 Mar 2026 18:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774807884;
	bh=LafMpKW3NSnJa5FfLZmmzqltgjxT9kZoM/+zl6NnOfY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LQbJ0d7m1/4MbRj5Gfe3XxX/23mxGIieJS6s4DaYHm+Hy+HdfBeqs77lESjTdVKM1
	 kLcU88DlmdETb6SoRTQ4+OyHSjoapDFHBEge2uuxUKb1o3xXGf6p1GuFmMOaKQtLO9
	 xXOXSvM6pn71TueIDWkAkVDJpL2US9YS3eRalTUuzwedoDvXsz75Le3501eDcZXjzK
	 RWe0z6zORWeLKVgYFCiWkSZLsOIkdj3A5ZtgTZAmTb7y2dMRisBDtNZSJDJ5IVrwrh
	 jKT0plrGbQ3ctfzbGza+89J2IVfsQdVX5AUR+x+XjZMtw9ZMLDajWVUTrIyWTZTYjk
	 wqVk4LEnc1eJg==
Date: Sun, 29 Mar 2026 11:11:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, Ong Boon
 Leong <boon.leong.ong@intel.com>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 00/10] net: stmmac: TSO fixes/cleanups
Message-ID: <20260329111123.740bada9@kernel.org>
In-Reply-To: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_111126_784832_17A6BC81 
X-CRM114-Status: GOOD (  10.07  )
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

On Sat, 28 Mar 2026 21:36:21 +0000 Russell King (Oracle) wrote:
> Hot off the press from reading various sources of dwmac information,
> this series attempts to fix the buggy hacks that were previously
> merged, and clean up the code handling this.

We have a limit of 15 outstanding patches per tree.
Please follow the community guidelines.

While I have you - you have a significantly negative "reviewer score".
You post much more than you review. Which should earn you extra 24h
of delay in our system. I've been trying to ignore that and prioritize
applying your patches but it'd be great if you could review a bit more.

