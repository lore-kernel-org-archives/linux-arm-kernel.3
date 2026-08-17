Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF71C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBwO+o8/g3c8E5g41SDi1C7yT6nUsCVbHkSVCJNe+7M=; b=LJ41bVZrT6rnVWOngHzru6SC5S
	dyy4DVnrbBp7wNLSbLLoHqN8oahUqha5S58MwMiJf2VWIb4/9p5pLEdvv7xRvUQ4xDA9HO0Zp0RC2
	V/G9FoFBogTqQnWq0wej2aAWVf1j5tCvwXz1Qt6gIs5dyoBqYNAi8btzLsRchCtN6HgYa517fZ/5X
	zxjQGE6HtdCqzU1nL2R3p8LXQsqK318/ZrubIrzABo8KN+2/dvyXLzrZM2GQg5X5yW8udTGRYvBpd
	kDL0UdnjRkx+F+YhGIieUID+Jb7wjmhZcYocWsTUCUt9E3KI3qiZvSFuEdXpyyM8NbhlGdNaBsrNK
	G5YjGKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuPO-00000005tUc-2EB4;
	Mon, 17 Aug 2026 10:17:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuPI-00000005tSE-2m5n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:17:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 69997418F3;
	Mon, 17 Aug 2026 10:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3EE1F000E9;
	Mon, 17 Aug 2026 10:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786961848;
	bh=vBwO+o8/g3c8E5g41SDi1C7yT6nUsCVbHkSVCJNe+7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iCLqWUDdgR60lfTw8qDSfaik+jq0gVVQ2pIQ9nR9Fzve0F46IqthNlpYXx6i20W9J
	 V16oGiX5xkxkdMzLCSfTOsdvHXsT9SBAZhaV30aC8Z/eOBonZNfNWYbjFGXdfGVlBn
	 /FxYZRJpb8y1sL2eubbgEaQFBs+RG8chBlTgzsj4WGqiKHohZ+3vl9aoXEhoDFu3TX
	 c1ohb5moXp31CqhGHvH1+y3iYIbS/Oes9dt5cr4dYrmsmvUyK7RjovsJ0y+fG3JeHb
	 FfQOSrNjf+NZ7Ivob3epw0MJSctcl2VDgBOxUd8V0UDQWYQX2Bv1Qbstx4oyl+0zJS
	 N1te37kfU44Nw==
Date: Mon, 17 Aug 2026 11:17:20 +0100
From: Simon Horman <horms@kernel.org>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch,
	saeedm@nvidia.com, tariqt@nvidia.com, mbloch@nvidia.com,
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, aleksander.lobakin@intel.com,
	magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
	sdf@fomichev.me, ast@kernel.org, daniel@iogearbox.net,
	hawk@kernel.org, john.fastabend@gmail.com, witu@nvidia.com,
	martin.lau@kernel.org, yoong.siang.song@intel.com,
	rohan.g.thomas@intel.com, intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	leon@kernel.org
Subject: Re: [PATCH net v2 1/3] xsk: align TX metadata layout across ABIs
Message-ID: <20260817101720.GX265046@horms.kernel.org>
References: <20260813190800.222527-1-sdf@fomichev.me>
 <20260813190800.222527-2-sdf@fomichev.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813190800.222527-2-sdf@fomichev.me>
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

On Thu, Aug 13, 2026 at 12:07:58PM -0700, Stanislav Fomichev wrote:
> Add explicit padding before launch_time so xsk_tx_metadata has the same
> layout on 32-bit and 64-bit systems.
> 
> On i386 and m68k, the old native 32-bit layout put launch_time at offset 12
> and had a natural size of 20 bytes. Using sizeof(struct xsk_tx_metadata) as
> tx_metadata_len was already rejected because the length must be a multiple
> of eight, so the straightforward use of the interface was broken on those
> ABIs. Userspace could still register a padded length of 24 bytes, though;
> mixing the old and new layouts then silently reads launch_time from the
> wrong offset and misprograms packet launch times. This intentionally
> replaces that incompatible layout while the interface is still new.
> 
> Fixes: ca4419f15abd ("xsk: Add launch time hardware offload support to XDP Tx metadata")
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Reviewed-by: Simon Horman <horms@kernel.org>


