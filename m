Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B99D59D62
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 19:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrJ1FOde7C7l2b0SVwYeKacdb8UusY8nYK4jp5LASto=; b=QphR0FS5jgha4TScwZLYeRYvNX
	RuKm3VOvoxHPv2wjSZJu/CwbgRkYXsp1W1Cvu0gyGUIgEDGdk0RAkfQWWqjJJxlWcXv4rHYgHodfo
	+UmV3o4d/BSb0ZdLCZUl4LHDChRdoeNS5uI6u1fzruu4Vs1wDMgDThJlOAQTrXFG0ughLg3IgWVSc
	oxMh/Vb0418WxWmNJAHv3C57LuvEqNnRW6jrvQT/3tDwUKrnWnhmY+/9IMqYH2S4PxhYHGMrhd1HG
	cd4rvrjEHyX+YZZWARgMUVvKqvUR5QICAcNtcbVB9a9VjYhCE5okbBTNVlebLMG2lCXTekI9f7p6e
	qZERPNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFege-00000008xdz-0RDZ;
	Mon, 25 Nov 2024 19:23:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFefh-00000008xVi-0DBj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 19:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2F84A418E0;
	Mon, 25 Nov 2024 19:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232C4C4CECE;
	Mon, 25 Nov 2024 19:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732562575;
	bh=cR+2lAqux8BQO+qUMCt4HF9pTTlAFOCVXTVfvXPCgyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sznULkPUYqcnIXwkdgMaSwbvbWw0jlYvp5qrC3DwrrOsYRKrGNVvwnwcM+15wVFQS
	 Xzbq9n1JanZU7fN/rQGiY51+5a5mDETpQh2ItTCPrxuThIKmUb4ShHWIFnjmoueBvK
	 Mw8h8NGE/qVkBEeGCoOhrC1Rlc9JICoj447Z9JYZPclXWg2CUqZe7Z2M/dwAFitSWi
	 Av/d8lE1QE3AfheLu/Ai6XKPHn8uz7hLl5xmiB/Qpr0hhUM6zeUlSqQRF/AyPhBYX5
	 ZMqKPBBHYq5GzArISM+aZLgMPZhfXdupLk1RoK6hrXRJ0nfN0zENicj+tL87yMJY/M
	 uzYnE2tVsSQiQ==
Date: Mon, 25 Nov 2024 20:22:52 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com, 
	michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, radhey.shyam.pandey@amd.com, srinivas.goud@amd.com, 
	shubhrajyoti.datta@amd.com, manion05gk@gmail.com
Subject: Re: [PATCH 2/2] i2c: xiic: Add atomic transfer support
Message-ID: <nseg7dpgansb6lpxj4co37duafzwiyt4spgolltuir47dedcsc@eyvam2o4o623>
References: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
 <20241011104131.733736-3-manikanta.guntupalli@amd.com>
 <d50b2caa-4d3a-4c1d-986c-6fb3c0a2f850@ijzerbout.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d50b2caa-4d3a-4c1d-986c-6fb3c0a2f850@ijzerbout.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_112257_156341_890EE204 
X-CRM114-Status: GOOD (  20.44  )
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

Hi Kees,

On Fri, Nov 22, 2024 at 10:29:27PM +0100, Kees Bakker wrote:
> Op 11-10-2024 om 12:41 schreef Manikanta Guntupalli:
> > Rework the read and write code paths in the driver to support operation
> > in atomic contexts.
> > 
> > Similar changes have been implemented in other drivers, including:
> > commit 3a5ee18d2a32 ("i2c: imx: implement master_xfer_atomic callback")
> > commit 445094c8a9fb ("i2c: exynos5: add support for atomic transfers")
> > commit ede2299f7101 ("i2c: tegra: Support atomic transfers")
> > commit fe402bd09049 ("i2c: meson: implement the master_xfer_atomic
> > callback")
> > 
> > Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> > ---
> >   drivers/i2c/busses/i2c-xiic.c | 245 +++++++++++++++++++++++++++++-----
> >   1 file changed, 212 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> > index 052bae4fc664..e5e9a4993bd4 100644
> > --- a/drivers/i2c/busses/i2c-xiic.c
> > +++ b/drivers/i2c/busses/i2c-xiic.c
> > [...]
> > +static void xiic_recv_atomic(struct xiic_i2c *i2c)
> > +{
> > +	while (xiic_rx_space(i2c)) {
> Let's remind what xiic_rx_space is
> #define xiic_rx_space(i2c) ((i2c)->rx_msg->len - (i2c)->rx_pos)
> 
> > +		if (xiic_getreg32(i2c, XIIC_IISR_OFFSET) & XIIC_INTR_RX_FULL_MASK) {
> > +			if (!i2c->rx_msg) {
> This check is suspicious. If i2c->rx_msg is NULL then the while
> above already dereferenced a NULL pointer.
> What is going on?
> > [...]
> > +}
> > [...]
> > +static void xiic_send_rem_atomic(struct xiic_i2c *i2c)
> > +{
> > +	if (!i2c->tx_msg)
> > +		goto send_atomic_out;
> > +	while (xiic_tx_space(i2c)) {
> > [...]
> > +	}
> > +send_atomic_out:
> > +	if (i2c->nmsgs > 1) {
> > +		i2c->nmsgs--;
> > +		i2c->tx_msg++;
> We can get here with i2c->tx_msg being NULL. See the first if
> in the function.

Valid point. Thanks for looking into this and thanks Wolfram for
having removed it. I read this patch several times, but I missed
it.

Andi

