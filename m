Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62278606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 15:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hY8pbp6I;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OE0zYjef
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JZ3b6uOYaWmanMHrxXUHX0LYxPXGkpVXbBJ4GITzGzI=; b=hY8pbp6IThKfNI
	E4PCraCxAoNj3r6uJEGnx+biVaI9rvmvBFVDzp0BkYreHutqBgyxAImzJUCQMwEhWn2A5F/Msadhk
	EtH+y6qBK+m2724znBa+49YsfR33sXC3DbedMCM7ydJcWDQW8vGKM7EjqaNln3sLCEyOFjk7id6q7
	Nli7TZ45nxOoNfZdzJQ+ljWv5Pda9u029e0Ra/gCQ8E7i8G+02BVLDYTW+CLCt7x8qhFRwNIldi6I
	ooaHnBa3s8DNiX/YFogW9f+AvOMjpc08eZ9o8hx5bSTYJBbewveRx+TDskECOTDInQ5abVXpp3Sig
	hfs1Qu3dpl6bgu57fbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSFA-00000009ePe-1hFI;
	Thu, 29 Oct 2026 15:40:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSF9-00000009ePQ-1l4n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 15:40:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E218600DA;
	Thu, 29 Oct 2026 15:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664C11F01816;
	Thu, 29 Oct 2026 15:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793288441;
	bh=JZ3b6uOYaWmanMHrxXUHX0LYxPXGkpVXbBJ4GITzGzI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OE0zYjef0FwGlZV1Zy9CQPEj+Gyc4C43cEj+ZgdnxHR1Jdgr9nLhV0js/V4mwS6LF
	 bcQkGSjgZse346B1sNIeXb0Xk2T60V9KBU9Yde3s62j2Ubqweguf+76kehcqIfMyiZ
	 OVwHVGgCq6woJSWw0k/nE0QmgCN0temQ8CgyvyVjadB7bzYR7aH7Zez3/J+emgNZJ4
	 7IFbl6uze4xtg4MTbZDTtzrKLvjP8UHOq1Ew4Ue1rcXFS7DOJ9KYNdVmbYzAiWxFv6
	 hnQ2zApi5nIOPVFHV399NuKf8oeSt5MOPeQroy7TUnRPTFdJZfV30cTfrUusPCmsuM
	 6edLvC9SIncGA==
Date: Thu, 29 Oct 2026 08:40:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Ding Hui <dinghui1111@163.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, "open list:STMMAC ETHERNET
 DRIVER" <netdev@vger.kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, dinghui@lixiang.com, xiasanbo@lixiang.com,
 yangchen11@lixiang.com, liuxuanjun@lixiang.com
Subject: Re: [PATCH net-next v6 0/4] net: stmmac: fix DMA descriptor ring
 cleanup issues
Message-ID: <20261029084040.24c85866@kernel.org>
In-Reply-To: <3fdea60e-abe8-4ecc-bce2-672f4e3d6b47@redhat.com>
References: <20261024071319.875921-1-dinghui1111@163.com>
	<3fdea60e-abe8-4ecc-bce2-672f4e3d6b47@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 11:24:17 +0100 Paolo Abeni wrote:
> The merge window for Linux v7.4 has begun, and the net-next
> tree is now closed for new drivers, features, code refactoring
> and optimizations. We are currently accepting bug fixes only.

But these are sort-of-fixes right? Aren't these okay to merge during
the merge window? AI bots will keep reporting the pre-existing issues
on net patches if we merge this to net-next. Dunno.

