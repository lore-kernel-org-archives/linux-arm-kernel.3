Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145B6CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNNjaKv8UKkb1Uz9SG65/M2zLsNI/nbiv3MfshiBmYc=; b=RUcgqJHEZ4uQDbsbrF/2jdsgt7
	tRv0cS2gP0bi6rc0gSuR1m3Nz02obRinIpmwdNyJwrzaopOA9FAZyyBU2l9QxxPxxWlWl6qZsfDYF
	8X8SmFKa6HueL/CgdKTds7Fe1dCcbPPPT4nxLtPDNTf0bcosnPBlusme5LPa71Phe9sArD6/sJtiN
	YnJnnDEzaW+P/1qUoppFzK4ddlz6cEB36H7JvDf61HejwPC5DqjXsGnC04K8IEa1aE4y2aDwNTGWj
	VBteL7C/R6r26BIUIWbgW8+H6CI9ZZkqYkwUEvYwwzLg4TByVp3nb/TZYJA/CCuGeEhkJa1HuF+f3
	gsmlkVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGtz-0000000ExHB-1r5q;
	Mon, 15 Jun 2026 23:39:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGty-0000000ExGw-0nNp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 23:39:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EDCEC42BA3;
	Mon, 15 Jun 2026 23:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22CE1F000E9;
	Mon, 15 Jun 2026 23:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781566773;
	bh=GNNjaKv8UKkb1Uz9SG65/M2zLsNI/nbiv3MfshiBmYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fPMgCvK7zvSL4WN+HNIYzac/rPEKPktiZXucF3h+37Mi/U3iHhUDcNhLa9Bosi/tv
	 TeKaUwtOBb/2PMAi03rA7P4e7G6dhuypbZBjhed7nXw2X+HW2EuGZpKn8YaVytsRXS
	 SHdI3+j8ZnBMaPU4A48Zn9LCpTU5o6M7Tv9fZZsSBbBTYd8e3ZDTxsrp3DQymXcwDG
	 d2wZGS/hUyPO34lKU7UEvGyfYCf8LQZAiZa2WJ6UuPkU6zs6O4tNjI+xG5RRMVaq2W
	 y81Z5ydhoCC1OETektoFclEiL56hniyMI5KuoUAJxCsTwbjdHEOJ1XCerXGkPbSNK5
	 V0YePBhj6n4DA==
Date: Mon, 15 Jun 2026 16:39:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: m-malladi@ti.com
Cc: elfring@users.sourceforge.net, haokexin@gmail.com,
 vadim.fedorenko@linux.dev, devnexen@gmail.com, horms@kernel.org,
 jacob.e.keller@intel.com, arnd@arndb.de, basharath@couthit.com, afd@ti.com,
 parvathi@couthit.com, vladimir.oltean@nxp.com, rogerq@kernel.org,
 danishanwar@ti.com, pabeni@redhat.com, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, srk@ti.com, vigneshr@ti.com
Subject: Re: [PATCH net-next v7 2/2] net: ti: icssg-prueth: Add ethtool ops
 for Frame Preemption MAC Merge
Message-ID: <20260615163932.50bb3df0@kernel.org>
In-Reply-To: <20260615231041.1007484-1-kuba@kernel.org>
References: <20260610052511.781752-3-m-malladi@ti.com>
	<20260615231041.1007484-1-kuba@kernel.org>
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

On Mon, 15 Jun 2026 16:10:41 -0700 Jakub Kicinski wrote:
> > diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.h b/drivers/net/ethernet/ti/icssg/icssg_stats.h
> > index 5ec0b38e0c67..8073deac35c3 100644
> > --- a/drivers/net/ethernet/ti/icssg/icssg_stats.h
> > +++ b/drivers/net/ethernet/ti/icssg/icssg_stats.h
> > @@ -189,6 +187,11 @@ static const struct icssg_pa_stats icssg_all_pa_stats[] = {
> >  	ICSSG_PA_STATS(FW_INF_DROP_PRIOTAGGED),
> >  	ICSSG_PA_STATS(FW_INF_DROP_NOTAG),
> >  	ICSSG_PA_STATS(FW_INF_DROP_NOTMEMBER),
> > +	ICSSG_PA_STATS(FW_PREEMPT_BAD_FRAG),
> > +	ICSSG_PA_STATS(FW_PREEMPT_ASSEMBLY_ERR),
> > +	ICSSG_PA_STATS(FW_PREEMPT_FRAG_CNT_TX),
> > +	ICSSG_PA_STATS(FW_PREEMPT_ASSEMBLY_OK),
> > +	ICSSG_PA_STATS(FW_PREEMPT_FRAG_CNT_RX),
> >  	ICSSG_PA_STATS(FW_RX_EOF_SHORT_FRMERR),
> >  	ICSSG_PA_STATS(FW_RX_B0_DROP_EARLY_EOF),
> >  	ICSSG_PA_STATS(FW_TX_JUMBO_FRM_CUTOFF),  
> 
> [Medium]
> Are these five new entries duplicating values that already have a
> standard uAPI?
> 
> The same five firmware counters are exposed through the new
> .get_mm_stats callback as the standardized MAC Merge stats
> (MACMergeFrameAssOkCount, MACMergeFrameAssErrorCount, MACMergeFragCountRx,
> MACMergeFragCountTx, MACMergeFrameSmdErrorCount in struct
> ethtool_mm_stats), and adding them to icssg_all_pa_stats[] also
> publishes them via emac_get_strings() / emac_get_ethtool_stats() as
> ethtool -S strings.
> 
> Documentation/networking/statistics.rst describes ethtool -S as the
> private-driver-stats interface; counters that have a standard uAPI are
> expected to flow only through that uAPI.
> 
> Could the firmware-register lookup table used by emac_get_stat_by_name()
> be separated from the ethtool -S string table, so the new preemption
> counters feed get_mm_stats without also showing up under ethtool -S?

This -- not sure about the other complaints but this one looks legit.

