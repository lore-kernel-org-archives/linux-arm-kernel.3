Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CC0C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 21:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsqCLPan+/wNGpTkf7z9LhaHDgvbDsbIV+JINchj7hQ=; b=orL0kZUnLwQW1/RwPhmxN++YTw
	+PirQSHght7Oeb2P3tSsjT9yyEPN1T/yHScvoQJ+NYGJjJUnpCwyIJ/yITiMCVsuZCNy2RbEc5X3T
	fEeX51NptpXYMhO2gJ+Pr1XHmHHYkGUjZmGw6pkCb6VLbv5+FFxg2vW36MMd27+YsMo6QuLy/u2jc
	pXOGh6qJZ0VzkOB4uq96KKS1EKswl0V6PZPQ60/DfyiK6/uGx40CzrovIfFyJE0HW8TIZT/73Iz/X
	ySDsHQZh5Jqx8AWllXr+kWWGgLynrkhVvoffKXn64ZHxgF642NFh5xkJNVjlf/PR5xTSQb5HY0a3c
	g9F+kjEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvqV-00000007ygL-3AOD;
	Mon, 20 Jul 2026 21:48:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvqU-00000007ygA-1KJK;
	Mon, 20 Jul 2026 21:48:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B314B43726;
	Mon, 20 Jul 2026 21:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361AF1F000E9;
	Mon, 20 Jul 2026 21:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784584097;
	bh=vsqCLPan+/wNGpTkf7z9LhaHDgvbDsbIV+JINchj7hQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fEwtl3ikdnwq7ANP9ITcthGzt7EaCg7gjT+NTRtJpe0A+BMU55d9tEfJeh2jLjyVB
	 mg8e5cxFlRRyWx7S4T7dE+33+qs6H3iPeHxUNeEKafLTSwhDSt7dqtlvuq3jYLAXK/
	 mbM5RXuIhPCMWu79pMX6d2aQvvW59RqECqPHDgexpOjXx7B73FEJkppTeQm46SmMh/
	 osVkwjyydU9mAl3hBB4q+quKyCG5zB9cp9tz9zbvpz2Saakt88ieKKy/ZdW1Lw8nwE
	 5ocNGkgBrp0r5KHMR5tkAE9igmUxYiHzFgb67zKztUKFNPRupwA9gZYJcMy+tDLYJW
	 hvTNF7o3dxzKA==
Date: Mon, 20 Jul 2026 14:48:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, Madhur Agrawal
 <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v8 0/3] airoha: add the capability to configure
 GDM3/GDM4 as WAN/LAN on demand
Message-ID: <20260720144816.4d32909b@kernel.org>
In-Reply-To: <aloP8n-EVtAHnl-l@lore-desk>
References: <20260703-airoha-ethtool-priv_flags-v8-0-015ba5ac89ee@kernel.org>
	<aloP8n-EVtAHnl-l@lore-desk>
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

On Fri, 17 Jul 2026 13:20:18 +0200 Lorenzo Bianconi wrote:
> I'm not entirely sure what the next steps should be for this series.
> Thanks in advance.

You have to repost, once a patch is 2 weeks old korg patchwork bots
insist on marking it as archived.

