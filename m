Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225FFCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 01:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXwN6JZC/WUQTMfBHr3Bd3LnHkUTM43nLhov5HUpSdU=; b=bXqc8yHvQqCtpYYOmMv0m37iDH
	M2jHlxL27pi9OgBz5O6cQLuTSEELVEEMGZSij5vd9cQDa8iUhyo3XxQmLk3yAFAHO551qn+HCI2un
	PtV0qd+ric0qVEbMo2aX17bSD+0zaSch+9AlSuEgsiWErRKTXoaE2KrgBdW4SBfxzkOQkIQ0QhKde
	Xd38wcM5O0VpTOXeLrpL3dRoFiNx1QDipiM4WdkJpkoBg/zNSwVj/hdWFa7uCER9/qtNVHtyK45P2
	0IpG/PpllkT+eguND+bWaSUxrUNd3tDPM4KKsslrM8Q+ZAVWVe7CSe3yXXPYIAvf1xHXY2IXe/3A2
	D7YrHXDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCSE6-0000000ATu9-3f9F;
	Fri, 02 Oct 2026 01:38:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCSE6-0000000ATu3-0zeW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 01:38:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCC8160218;
	Fri,  2 Oct 2026 01:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F89F1F000FF;
	Fri,  2 Oct 2026 01:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790905095;
	bh=AXwN6JZC/WUQTMfBHr3Bd3LnHkUTM43nLhov5HUpSdU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DE+sN2TAacbTJs2xtAspJ10UZCCgqos8nV2XVEF9omhMF/RjqmZ9vQZEuG1lS2+Z4
	 xxqQP+CzvQcIi87eHsMwsE/RPGzhftCF0LK241GOYoWgb4RO0JgiiVne+CpVqatrXG
	 xlROJAFQ2n1btiU4ixnzxy6q9S5TQpoJKNfm138TMxGJPAfLGiUXSc3gB9QoS6saVZ
	 3gddjaFum3v4I13xuXefCJNKfKIpvDCNl6z2rIkNlin0F6xveIA/Avtv8r2KUaGgKn
	 mg1uA6aR83lb5lutb+MRNa6kSAJtqW/ooePFA3Lfryq7O2GW3CHYrPzorQUFyGaCCT
	 g/oRds0mdPcvw==
Date: Thu, 1 Oct 2026 18:38:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, radhey.shyam.pandey@amd.com,
 michal.simek@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, robert.hancock@calian.com, sean.anderson@linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4] net: axienet: cap the TX poll return value at
 the NAPI budget
Message-ID: <20261001183814.4e9e88e6@kernel.org>
In-Reply-To: <20260930071536.627964-1-maimon.sagi@gmail.com>
References: <20260930071536.627964-1-maimon.sagi@gmail.com>
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

On Wed, 30 Sep 2026 10:15:36 +0300 Sagi Maimon wrote:
> @@ -1027,7 +1027,12 @@ static int axienet_tx_poll(struct napi_struct *napi, int budget)
>  		axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, lp->tx_dma_cr);
>  		spin_unlock_irq(&lp->tx_cr_lock);
>  	}
> -	return packets;
> +
> +	/* The whole ring was reclaimed above, which may be more than the
> +	 * budget, but a poll must not report more work than it was given.
> +	 * netpoll polls with a budget of 0 and expects no work reported.
> +	 */
> +	return min(packets, budget);

Please take a look at commit a58cdf56b6e, that's the correct approach
(incl. feeding 0 to napi_complete_done).
-- 
pw-bot: cr

