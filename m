Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739F9C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 19:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQkbAL8gDFRxpXIIle+bm2wnXM0lq6rIv0I7IeHxRts=; b=HJtBtoNVUY+N1HXZXR32pTulYz
	K9xU3T+wnVspG97Aaaf06tKaPPqXIW/CZAZAe0YjkFnpAUUwrIfNRKv7a6CmfZN3XZV6q9y/KPht6
	TRVvlbdM6VzuFjO5+84/h+46vT+s/uFFPGyn9eztd/kG0Xi+52shPCyGJqLRG/0Ycn7aLJgu+bM+c
	x3C90Num3k4Gop0B5UeiLz2NMqH1VAUimBN5Jvsub9y8QDmIa/pig0+SjO7tGlj+61QUbWFmkTrYq
	UMdT/CFWV8RJymP/nERyyQbLR0Uqn6JfcwLl+uy8eeBaugvohUZCzPJh0idYlqM6h75s4f5no2UrR
	57s4GVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVrn-0000000CllN-1xdm;
	Mon, 10 Aug 2026 19:40:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVrm-0000000CllF-24yw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 19:40:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 173844140A;
	Mon, 10 Aug 2026 19:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF201F000E9;
	Mon, 10 Aug 2026 19:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786390858;
	bh=aQkbAL8gDFRxpXIIle+bm2wnXM0lq6rIv0I7IeHxRts=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LOoKrRiYuDgUfvBRlZ4LwZbOfjNQeTCquT58/+SCiWtzUlO7Pm0sAMjtC0i4Chvey
	 rDhUlVnfXNhfG3oJaRFwr7DOiXl0bJlyyzVAasYb2FdUuRTSLii0fH3dTI8TOF3t0Q
	 9XqNyxp2KIbMwjtCZ4s9+hvDj0bVXGV5qQ+Hpy/NbPPcW7tZvOGnitOs+YNQ8s95QF
	 d0nMri9FbdSbVw6Ggqc5RbQ6qKIDDtLJTRFk/BxYqgjhHnniaBNvruhP9SDD2h4USF
	 8F2RiDbWegBBBDZoS6TPkmVDavKW9k8CZhHRrqXL4Ei2Xi1vUeyPAd9Y++rIcFA0kL
	 cUqINYnzLeVqw==
Date: Mon, 10 Aug 2026 12:40:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, saeedm@nvidia.com,
 tariqt@nvidia.com, mbloch@nvidia.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 aleksander.lobakin@intel.com, horms@kernel.org, magnus.karlsson@intel.com,
 maciej.fijalkowski@intel.com, sdf@fomichev.me, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 alice.kernel@fastmail.im, dtatulea@nvidia.com, witu@nvidia.com,
 martin.lau@kernel.org, yoong.siang.song@intel.com,
 rohan.g.thomas@intel.com, intel-wired-lan@lists.osuosl.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, leon@kernel.org
Subject: Re: [PATCH net-next 0/3] xsk: pre-existing AF_XDP TX metadata fixes
 from Sashiko
Message-ID: <20260810124056.469fc9a4@kernel.org>
In-Reply-To: <anodof8GsDZHZb-S@devvm7509.cco0.facebook.com>
References: <20260810184753.135756-1-sdf@fomichev.me>
	<anodof8GsDZHZb-S@devvm7509.cco0.facebook.com>
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

On Mon, 10 Aug 2026 11:52:01 -0700 Stanislav Fomichev wrote:
> On 08/10, Stanislav Fomichev wrote:
> > A few fixes to address pre-existing issues from Sashiko review.
> > 
> Ooops, this should've been targeted to net tree. Will resend in a few
> days in case there is any review feedback.

Please make sure you look at the Clashiko review before you repost.
Looks like it got kicked off already so let's not waste it.

