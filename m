Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB2AD2D0FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 13:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DEAwSb9yqof+c9Garw5rjnnpV/QvVgWVFKuzHYD64x4=; b=4drVRQktHDSXS8815XfeOf7hJe
	EJXixlrZT46ju1UhDZqPQmyZqwm2+ig8CT4tWOVcPV15BTSfOpVNwV8nJ7C/Xsnw4AQ99pPFpNowY
	9MEh9LEGaZm9EHCTCmpA9bFsNLc7MgeMZ6BY1pnnOfpK1czdbhBpB4ajoyk+06i7MQM7+5TYI4zAJ
	3fzTow2uRe7cy3/Gaegea+mF1qE3Tw7/b19WVFbtnWlxONoxWVgu8vxM+yGtDBK9GS46uL7LJRflx
	ZB3KV9FZqAoajhSdQ4MoEBclbt9t2sk3lnOC0B1uAvCyjD7RZF0WdeeWl2Q/u+KwAoYYq+1QLeyFu
	8mNntmPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeQB-000000079pw-1bJ9;
	Tue, 13 Jan 2026 13:26:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeQA-000000079pn-3Th5;
	Tue, 13 Jan 2026 13:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E99D860017;
	Tue, 13 Jan 2026 13:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F45C116C6;
	Tue, 13 Jan 2026 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768310813;
	bh=5eSbp2YejVlQwsJ4Tq8iaUtRuMK3R0vtPTKJ4VgmURA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZ0wuhy9YZyNvVi22+zuJIOVkP0qOSxF3UNW2yaaxZbmn9qHW627aYg/NdHLqT+Kj
	 3qC6OdpuIVsYKkIlh/zuE9bQHG8LXIJ8sAvY8t8ll7TyjiWMIJHh3W8T9qtKAJlD9X
	 JMbnODszUYAWs0x0jwDD0GGhM8dGIj8iUf54gT8poFdNT9QKOSKW+XODF/tFQ95ZgM
	 826aWti8Ov0pCK1ZnQDPtL3tos/X9RVwDwkEjhCbrd+xBqCgJyd0R9T+evPrlD3ufw
	 Br7yo18JqRrnINxfdLvyNCvTX+JgGdmtLneogsJJAjc96TtI3zmxbcpTGK8T4frOxX
	 u9eusivCcfW9w==
Date: Tue, 13 Jan 2026 13:26:49 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2] net: airoha: Fix schedule while atomic in
 airoha_ppe_deinit()
Message-ID: <aWZIGbwN1fdHCgnb@horms.kernel.org>
References: <20260105-airoha-fw-ethtool-v2-1-3b32b158cc31@kernel.org>
 <20260108132218.GG345651@kernel.org>
 <aWDLg6RzI4s2VgIH@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWDLg6RzI4s2VgIH@lore-desk>
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

On Fri, Jan 09, 2026 at 10:33:55AM +0100, Lorenzo Bianconi wrote:
> > On Mon, Jan 05, 2026 at 09:43:31AM +0100, Lorenzo Bianconi wrote:
> > > airoha_ppe_deinit() runs airoha_npu_ppe_deinit() in atomic context.
> > > airoha_npu_ppe_deinit routine allocates ppe_data buffer with GFP_KERNEL
> > > flag. Rely on rcu_replace_pointer in airoha_ppe_deinit routine in order
> > > to fix schedule while atomic issue in airoha_npu_ppe_deinit() since we
> > > do not need atomic context there.
> > 
> > Hi Lorenzo,
> 
> Hi Simon,
> 
> > 
> > If I understand things correctly the key problem here is that
> > an allocation with GFP_KERNEL implies GFP_RECLAIM and thus may sleep.
> > But RCU read-side critical sections are not allowed to sleep in non-RT
> > kernels.
> 
> yes, right, RCU section is atomic.
> 
> > 
> > If so, I think it would be clearer to describe the problem along those
> > lines. But maybe it is just me.
> 
> This patch is already in Linus's tree.

Yeah, sorry for missing that.



