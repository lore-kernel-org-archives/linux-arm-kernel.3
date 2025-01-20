Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13EAC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 20:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKSOu3tDLH1HfYO1eexon5zbrOsX/xK2Vv/FVabti6g=; b=SlLTzNrCzpY1VHR4VDJg5ZGliw
	h8IBwn09E/npxdS3ommjpkZl2NoJkVr8kMJrIq2Fh9eFcsBiAMeyFIDjzTKoaSAMUYZWkYHGFDo8X
	/Ov6UG4nHqX4g+dYnc56rzgsrwmmQKjvTbrfMVSlWQGEmNQ3QwB0AL7UTMCHCaC+1Rx8HEPBVTDYo
	UYAXjBXKPiSxKlbUm0LZPpMH/36okLesDz9filCupwIm0ZM+NYLCYPAzSIyoC8wddIS/D1NBeqiiZ
	nTvYT8fhD5p8qajRb1BCGhIsdz0eAfnLLAKwqoqG9OM1Fl88p37fDqUJIdN6wR3B0S29d1AmUt0o4
	pOO3LbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZy5P-00000006NFP-3bwz;
	Mon, 20 Jan 2025 20:09:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZy49-00000006N7y-0OQc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 20:08:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71D345C5A48;
	Mon, 20 Jan 2025 20:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1371FC4CEDD;
	Mon, 20 Jan 2025 20:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737403687;
	bh=aGb2QpaJvRtjEmeNSrWQbWribxm6Ts1/Eac/8u/SorY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PwF8CHEDwHRAcjUJDlUCdzQ0OIJ/NkPeyd6WzZddg5UiYw4dF2ZI/Nj0/Ni2G+NFy
	 aWxDrKlXxSnbikG5fzqk9JoCDxwj+tEq3TohUFKadpo3ruuspy4A8GTTLQBOzEXWkJ
	 oK5eMgJyxVPE4OXPog1HGYVI3/EOiDlAY/H+gfQzphhYViqnXem0byyyVilhHXQkrd
	 Y0fPcR+n0N5eLhZulG8zofPpT+w/O8QX+uameQNXt6KvOc75Qpfia/72aW36OrRfc3
	 m1GMsKV8J43/Y704H0giQjOLLZD5kw84V1RhPWHqN2wVM+C84SUjvK5hehVW8aAMKe
	 iyWy4uwXGevRA==
Date: Mon, 20 Jan 2025 12:08:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Vinod Koul
 <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, MD Danish Anwar <danishanwar@ti.com>, Siddharth
 Vadapalli <s-vadapalli@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 srk@ti.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dmaengine: ti: k3-udma-glue: Drop skip_fdq argument
 from k3_udma_glue_reset_rx_chn
Message-ID: <20250120120806.4d1fd70e@kernel.org>
In-Reply-To: <20250116-k3-udma-glue-single-fdq-v1-1-a0de73e36390@kernel.org>
References: <20250116-k3-udma-glue-single-fdq-v1-1-a0de73e36390@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_120809_180409_5C938F35 
X-CRM114-Status: UNSURE (   9.26  )
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

On Thu, 16 Jan 2025 17:00:46 +0200 Roger Quadros wrote:
> The user of k3_udma_glue_reset_rx_chn() e.g. ti_am65_cpsw_nuss can
> run on multiple platforms having different DMA architectures.
> On some platforms there can be one FDQ for all flows in the RX channel
> while for others there is a separate FDQ for each flow in the RX channel.
> 
> So far we have been relying on the skip_fdq argument of
> k3_udma_glue_reset_rx_chn().

Assuming this goes via the DMA tree:

Acked-by: Jakub Kicinski <kuba@kernel.org>
-- 
pw-bot: nap

