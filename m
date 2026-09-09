Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC901C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 01:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9uYx/37ho+cFtcOGygmvTcxEv9p065hqpHDOll9q+U=; b=th1KhOb1VQriI4ZZZuvDUs7/zU
	jpIoRuGe8hgsbKoPvLv3QdOA4siUeKuUQi3V6CGnX67Ok5kkZEe0NWb6oFC4ldC3kRMq/XSvghgcJ
	eR4MkuKsdI7Kxdcf5HsaXa4Q0YnVNOQjB2M3XUfUavvYdYuofgZXU4FV2RiZM5IYy8PjaCv2szo6Z
	VCGMVnRazqM00SrJ4AXhn/8tiGElXc8+fBZNtTHEjfSw6Ns58JeAeWlcC8Ur24UfC8EMwt0oKnLrW
	D8iQaoy3xTEWwzxRnv2MOzcS+x33UK30pYe4aGAfrUzv/leTpj/pX/ItFfhYvnxh2JX5nMOcEvCOb
	6USSf7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x47EE-0000000Absm-1dpP;
	Wed, 09 Sep 2026 01:35:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x47EC-0000000AbsL-0y0k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 01:35:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DD24601FB;
	Wed,  9 Sep 2026 01:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F67E1F00A3D;
	Wed,  9 Sep 2026 01:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788917755;
	bh=s9uYx/37ho+cFtcOGygmvTcxEv9p065hqpHDOll9q+U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nitcr9Ce2oKpPvjWbKlDUICtbcxBPgWi+AN9UTkIpb0+HD99EVpHzbT8wByXcgh5J
	 i+SGY/THaXtCHTjFsU8XssU/CCVt1/xYABBoE0f9OYTmLu0UPRclX7U84HBYvd+AuE
	 G08Ut5NaBnY6i7alzzERADzerBJv6gxlaiAJWEarV+DPHwr69kr+30Dtcrvyq0HI0O
	 AOayYzuSur7IiBU7mTTJLtuwtY9i+94tyJ2VKcOG38rsJpdCtjWAFpE8AlOXDdJEnN
	 JW9hBev2c1W4t/JUlr7jcy+7Z0zvVIVUJTbmC0iYc3eg5ZfnwML0+Y8irfFnd0HwSX
	 TWwOJSfXQWYIQ==
Date: Tue, 8 Sep 2026 18:35:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev-bot+sashiko@kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 0x1207@gmail.com, olteanv@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: preserve real_num_tx_queues on mqprio
 setup failure
Message-ID: <20260908183553.7a204e81@kernel.org>
In-Reply-To: <ap_fm9S7zSAbGSKq@lore-desk>
References: <178885859069.219967.17905742130775758644@kernel.org>
	<ap_fm9S7zSAbGSKq@lore-desk>
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

On Tue, 8 Sep 2026 12:12:43 +0200 Lorenzo Bianconi wrote:
> > So dev->num_tc goes back to 0 immediately after the driver restored it, and
> > skb_tx_hash() ignores tc_to_txq and prio_tc_map when num_tc is 0.  On a
> > failing "tc qdisc replace" over an already offloaded mqprio, does the still
> > grafted old qdisc lose its priority classification anyway?  
> 
> I think in a error condition, the driver is supposed to restore the previous
> overwritten values, then it is up to qdisc layer to manage the error condition.

I'd translate all the AI complaints to a basic confusion about what
exactly is the problem you're fixing and how it can be triggered.
A better commit message may be sufficient. An example of sequence of
tc commands which used to lead to loss of config / broken device and
now does not would go a long way.

> > For taprio, the new error also takes the disable label, which clears
> > priv->est->enable and reprograms EST, so the schedule that was just
> > installed is torn down.  Is that intended for configurations that used to be
> > accepted, for example:
> > 
> >   tc qdisc replace dev eth0 root taprio ... queues 2@0 2@2 ... fp E P
> > 
> > Also, the two remaining users that still ignore the now meaningful return
> > value, the taprio disable path and stmmac_reset_tc_mqprio(), were not
> > updated.  Should they be?

This sounds relevant as well.

