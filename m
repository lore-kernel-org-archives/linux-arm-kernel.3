Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6A4C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/Za7g0FQ1lSb2oVYg3YfT9f/o0ed3+rcLZGrY3qbaE=; b=PA8U3RSJbsy8VsDkJ3fSrnTIHL
	+mXPyJJ79hQCcTp45iA12slGSiC8IE3YOiQtgJ8Q0jyc4BqRlGPpl1OjISdIY4rhV7GpIpbhwhRrN
	kgNPN1LXX08ixMuFNdLA464RQo1AtmgDemanJ+AfRYjWxX+nAPGo96U4acz5uSGd+ldShPM8zXcLd
	9SD/ERBsshe0nJV/Qf6WVTJ6cHtXeaZn4l1u59CllVN1F7xSJV2NvOvDU32hBtLcbq5D7FtNkwj/S
	jTsZ7lwoxil3XxlOzrU1S6dEYxUOTUqSsFnpc5AKJJu64/xjEQW1Zc96YeBDAO52PYr/LI5li9JXP
	7yZ5adHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4M5s-00000002hLh-1UNM;
	Mon, 14 Apr 2025 15:51:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4M40-00000002h4N-1Evd;
	Mon, 14 Apr 2025 15:49:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4EE265C41E7;
	Mon, 14 Apr 2025 15:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A9FC4CEEB;
	Mon, 14 Apr 2025 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744645775;
	bh=0OlpI8A8o3k0NMv+HqSy0AS0cRdyO/+tn5fykeOZP7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a7Dfn27v2z9ZYmy0BaU3Q/yhi7InElazHQbj4WEnKg/E8+xjMDxQj75Ocy4CAujAD
	 cTTFE0mMPKjwFvgLVjQNK3KZG+wUXT3oYuoqWs6NR4ZUpCo5fmm/bYSZH62yM67h8k
	 fBksYdPnntidj7W9Sw6E8crMJWCOkfjhbbbF/tpvG319NLX5Ad35iRuJvMW6DWkb44
	 eZKXIMntYOv4gjlwPFzlRrSqhvgVTLN459PNe4jMWtq09WmEgrdldKGth+7UEqAwqd
	 yG61IBJHmyiyaEIDBozSik5zC/IWCYP3C5PF9BDCSpJ2knidaqT6qnqpTL9xXiP0GP
	 MPnffgRyhJkww==
Date: Mon, 14 Apr 2025 16:49:30 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Davide Caratti <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v3] net: airoha: Add matchall filter offload
 support
Message-ID: <20250414154930.GU395307@horms.kernel.org>
References: <20250410-airoha-hw-rx-ratelimit-v3-1-5ec2a244925e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-airoha-hw-rx-ratelimit-v3-1-5ec2a244925e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_084936_377211_0E51273E 
X-CRM114-Status: UNSURE (   8.89  )
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

On Thu, Apr 10, 2025 at 05:25:37PM +0200, Lorenzo Bianconi wrote:
> Introduce tc matchall filter offload support in airoha_eth driver.
> Matchall hw filter is used to implement hw rate policing via tc action
> police:
> 
> $tc qdisc add dev eth0 handle ffff: ingress
> $tc filter add dev eth0 parent ffff: matchall action police \
>  rate 100mbit burst 1000k drop
> 
> The current implementation supports just drop/accept as exceed/notexceed
> actions. Moreover, rate and burst are the only supported configuration
> parameters.
> 
> Reviewed-by: Davide Caratti <dcaratti@redhat.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v3:
> - remove duplicated entries configuring REG_PPE_DFT_CPORT0() regs
> - Link to v2: https://lore.kernel.org/r/20250409-airoha-hw-rx-ratelimit-v2-1-694e4fda5c91@kernel.org
> 
> Changes in v2:
> - Validate act police mtu parameter
> - Link to v1: https://lore.kernel.org/r/20250407-airoha-hw-rx-ratelimit-v1-1-917d092d56fd@kernel.org

Reviewed-by: Simon Horman <horms@kernel.org>


