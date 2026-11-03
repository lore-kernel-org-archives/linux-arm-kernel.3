Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65640606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 06:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v/Gq1NEl;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mZ/0YRCX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OQG3Rpe6sTxKeQSDXn4PTSV6RnWCQvYTk9rhHTjrvog=; b=v/Gq1NEl0eiDce
	BsBvu/vrx49wdd5S651+q4Lf8nEzoZ8tKc02Sk4Djyh8MybwpTjg+81pAbyXDQFoCQsy1joD6M6jr
	ZaPpvlNYG+kP92icwrJ/I3bHnm4T/Kmv99POVpxOo/KiEnCVzkrQPZva3QB3qRCNNZeboR7pIodlD
	z2isgdsxb0bGqAoSqXeVDQDARjgen3kkRChOE09+TVEObD0pS3SM4JmfeM0QgBuLjkqZ7bckaNoA2
	rIv7IhIGKOyd6EAspro33VjE0LHY2oxr3hHIUaKGNdagHKOa2JI6LLhtJvEho1CJXAJcPXykpouvX
	XfLtQIWD05XP/sstpf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7ai-00000001AwV-2zB1;
	Tue, 03 Nov 2026 06:01:52 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7af-00000001AvG-05PV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 06:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=OQG3Rpe6sTxKeQSDXn4PTSV6RnWCQvYTk9rhHTjrvog=;
	b=mZ/0YRCXPreDbWsTT2WI0GF1zW4Z7NZ25mxEHLaWuDJKTi+xeh+5HDnj+kOl1+
	gElUeb7xSjDPliWGtY3T3iCEBiUd5edBGj/3S8yawz+ZgCbCdF8gDD+PJQS20RBd
	0IExIPjFoeX5BFXhr603vdY/QBUmH5SUr1CGnSixKTQRs=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3vy2UeOlqvBZcFA--.42044S2;
	Tue, 03 Nov 2026 14:01:03 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: thomas.bourgoin@foss.st.com
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	dinghui1111@163.com,
	dinghui@lixiang.com,
	edumazet@kernel.org,
	fujiahui@lixiang.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	liuxuanjun@lixiang.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	zhoujing3@lixiang.com
Subject: Re:Re: [PATCH net v5 2/2] net: stmmac: restore RX descriptor buffer addresses on resume
Date: Tue,  3 Nov 2026 14:00:52 +0800
Message-Id: <20261103060052.2226087-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <872a93b8-4bd9-4718-89e2-019fd3c5b8ac@foss.st.com>
References: <872a93b8-4bd9-4718-89e2-019fd3c5b8ac@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3vy2UeOlqvBZcFA--.42044S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw4ktr17GFW8ur17ZF4UXFb_yoWrWw1rp3
	yay39rtrykJr4xCr48Xw4xWFy2vFs8Xa15Gw1rJw1qy390krnavFy3KrWYya4xGFZ3Xw1F
	vF4UZ39xCF4DCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEna93UUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0h9ahmrpeJ9hkwAA3H
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_220149_481755_FDA0F4A6 
X-CRM114-Status: GOOD (  24.99  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thomas,
 
Thank you for reproducing the issue on the STM32MP215-DK and for
backporting and testing the series. It is helpful to have confirmation
on another platform. I understand that the backport required changes,
so I will not describe this as testing the series as-is.

>Overall, I’m okay with your patch, I have a few suggestions:
>
> > +			stmmac_legacy_serdes_power_down(priv);
> > +			mutex_unlock(&priv->lock);
> > +			rtnl_unlock();
> > +			return ret;
>replace these 4 lines with: `goto error_unlock;`
>
Regarding the error path, agreed. I have replaced the duplicated cleanup
with "goto error_unlock" in my local revision.

> > @@ -8503,6 +8577,18 @@ int stmmac_resume(struct device *dev)
> >   	stmmac_free_tx_skbufs(priv);
> >   	stmmac_clear_descriptors(priv, &priv->dma_conf);
> >
> > +	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++) {
> > +		ret = stmmac_reinit_rx_descriptors(priv, &priv->dma_conf, queue);
> > +		if (ret) {
> > +			netdev_err(ndev, "Failed to restore RX queue %u: %d\n",
> > +				   queue, ret);
> > +			stmmac_legacy_serdes_power_down(priv);
> > +			mutex_unlock(&priv->lock);
> > +			rtnl_unlock();
> > +			return ret;
> > +		}
> > +	}
> > +
> >   	ret = stmmac_hw_setup(ndev);
> >   	if (ret < 0) {
> >   		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
>
>You could move the calls to `stmmac_free_tx_skbufs()`, 
>`stmmac_clear_descriptors()`, and your loop into a dedicated function, 
>perhaps something like `stmmac_resume_descriptors()`.
>
>In my PR, I also factorized the loops so there is one for TX and one for 
>RX, instead of one loop for TX and RX in `stmmac_clear_descriptors()`, 
>one loop for TX in `stmmac_free_tx_skbufs()`, and one loop for RX to 
>rebuild them.
>By doing this, I managed to remove the `stmmac_free_tx_skbufs()` 
>function. It changes the PM sequence a bit, but I think it is okay. I’ll 
>let you decide whether you want to do it or not.
>
Extracting a stmmac_resume_descriptors() helper also makes sense. I will
look at organizing the work per TX and RX queue.

> > +	/* GMAC4/XGMAC secondary address writes overwrite the OWN bit. */
> > +	dma_wmb();
> > +	for (i = 0; i < dma_conf->dma_rx_size; i++) {
> > +		buf = &rx_q->buf_pool[i];
> > +		if (rx_q->xsk_pool && !buf->xdp)
> > +			continue;
> > +
> > +		p = stmmac_get_rx_desc(priv, rx_q, i);
> > +		stmmac_set_rx_owner(priv, p, false);
> > +	}
>
>Since on GMAC4/XGMAC we need to set the owner bit after writing the 
>secondary address, why do we need to call `stmmac_clear_descriptors()` 
>before reinitializing the RX descriptors?
>Since `stmmac_clear_descriptors()` is a loop that calls 
>`stmmac_init_rx_desc()`, and I verified that all `.init_rx_desc` ops set 
>the OWN bit to 1, could we call `stmmac_clear_descriptors()` after 
>rebuilding the RX descriptors instead and remove this loop ?
>
Regarding moving stmmac_clear_descriptors() after restoring the buffer
addresses, you are right that the GMAC4/XGMAC init_rx_desc callbacks do
not overwrite those addresses. For a fully populated RX ring, doing the
initialization afterwards could replace the separate re-arm pass.
 
The complication is the partially populated AF_XDP ring. In v5,
stmmac_clear_descriptors() unconditionally sets OWN on every RX
descriptor. Moving that call after buffer restoration would therefore
also give descriptors without an XSK buffer to DMA.
 
The v5 ordering was intended to leave those slots CPU-owned afterwards,
but further review exposed problems with that approach: the legacy
clear callbacks do not clear OWN, and the unfilled slots also need to
be represented correctly in the software refill state.
 
I am addressing those issues in the next revision. I agree that the
better ordering is to restore addresses and chain pointers first, then
initialize/re-arm only the valid descriptors, while preserving the
legacy descriptor control fields and the existing RX watchdog policy.
Unfilled XSK descriptors must remain CPU-owned and available for a
later refill.

Thanks again for the suggestions and the testing feedback.
 
Best regards,
Ding Hui


