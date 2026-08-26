Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34278C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 20:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdBgprMEYcaiSUj0ygVN2sdfjT+LVmQNKAKHSXm0dYs=; b=YpFDbTBg0+lLLyqLrgBm6M2FDP
	v5ga3Mo3TajVzZ7bR0cycqs0jd5BpOjsIqxDNkSdLrhNjDi1uyghF2tBnyDPOYdRbdqNtC6KZ395X
	bFVCdaYOq9KCoHHd0JGY6/YUgZWS9VOh1k5qE7WTOv9wJmWpxh1AYq9kUlj0nRqK8IOBV1hwv2n7F
	h2AIYABzF2RIKVvmbR9uFlOl4qO8y/7TRDpwMfRTQ97CI2u2Tf6npVrHyr5XFRR2KG+Q1vRfrmTmA
	0GmIGaXEEwBLKR+agkQ1fm7+bju/f5tVwxvVSNZT2GbyudI5DQl/bkrgJfTsormVnVd2cF8luRxSs
	0MJYfvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK78-00000002yzX-0fD8;
	Wed, 26 Aug 2026 20:20:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK76-00000002yz9-3Oc8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 20:20:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF3E06011F;
	Wed, 26 Aug 2026 20:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8CE1F000E9;
	Wed, 26 Aug 2026 20:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787775647;
	bh=sdBgprMEYcaiSUj0ygVN2sdfjT+LVmQNKAKHSXm0dYs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Q294isjThieFDrLugvFd1j77TaAVB2QAfsB3TQVc990b36f+1TuRDchhHGUOCTYmZ
	 /qLud6mlMd5GX2gWFNZe7LJ+1QxL5wZWzZUyDBEUF7I9TXv5y2wYtUeu0+FCRaTzWY
	 cAvQDhTC0CuVC1M7qyRBuC5L8U6uFwyvdHHUh5/doxL+wsmj852Ov18fcsA5Om74iq
	 /viq4ftEPN1BpJsgIKXReyaVM8HFTfdzvgUX2sFbi8IqxPsYPvyR1B5ZN32bVpr9J8
	 5M2idS8spkwUTRc0+2K7cK0hA+Ho9M2Ks1MKT3zuz1xdZnFcHW5VUrPIjhanKtqtlf
	 2GfQQKik9shxA==
Date: Wed, 26 Aug 2026 13:20:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, Maciej Fijalkowski
 <maciej.fijalkowski@intel.com>, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 aleksander.lobakin@intel.com, horms@kernel.org, magnus.karlsson@intel.com,
 sdf@fomichev.me, ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, guoren@kernel.org, dtatulea@nvidia.com,
 witu@nvidia.com, martin.lau@kernel.org, yoong.siang.song@intel.com,
 intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 linux-csky@vger.kernel.org, leon@kernel.org
Subject: Re: [PATCH net v3 3/3] net: stmmac: document oversized AF_XDP frame
 handling
Message-ID: <20260826132043.39fb435a@kernel.org>
In-Reply-To: <dc2ccb14-c7c0-402b-93b3-afba52df78fa@bootlin.com>
References: <20260819160535.1472459-1-sdf@fomichev.me>
	<20260819160535.1472459-4-sdf@fomichev.me>
	<aoceSoSFMx69Z9up@boxer>
	<aoeoJ6-njBxcWs4w@devvm7509.cco0.facebook.com>
	<aogpDsa8hz6CPpD3@boxer>
	<aoiIarzdjk92RkCN@devvm7509.cco0.facebook.com>
	<20260824111443.34bffe04@kernel.org>
	<dc2ccb14-c7c0-402b-93b3-afba52df78fa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 26 Aug 2026 14:42:25 +0200 Maxime Chevallier wrote:
> >> Let's definitely fix it properly if you have better ideas. But since we
> >> don't have HW, I'm not super confident doing anything sophisticated
> >> myself :-D  
> > 
> > Let me take the first 2 patches and leave the stmmac for later.
> > I don't think anyone involved care particularly deeply here.
> > 
> > Maxime said he bought a bunch of relevant HW. If we finally wrap 
> > the AF_XDP tests into driver runtime he should be able to help us...  
> 
> Indeed, I haven't started looking into the AF_XDP (and XDP in general) on
> stmmac, lots of fixes lately on the subject so I'll get there eventually :)
> 
> I'm currently plumbing the driver selftest on my setup (ethtool -t) and just
> runnign this uncovers lots of issues al lover the place, once this
> passes I'll get on the kselftests and see what we can do on this.

Also if you try running driver ksfts - please keep us posted on what
the blockers are. I _think_ we just need to teach ksft to cross compile
C binaries?

