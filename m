Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA38C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/tOyA1p7QjHDsifRN5k+/Gb8kyRYOVF0Azt3OIzzyw=; b=0WpRPObFCwJ07GuvESOV0lOnPu
	2YklxDLV+WAyg9eTiFi3ki9MipKci9iGa0g3n61m0jLyfUWm62AmUSeT6Qzmg+arw73e8XLdTpvWv
	sFVdPqWWeZRwkh1DEWB8S0ciDOBfXHoA910Db3dDPGVCiqYdo9i6z0SsAPLD/vwlq1jWoxVRIICPU
	lzSX8yE0AG0zs2TxfMfW7XebW9TMOEbhrOwII+DpxAewxRYk8NazkNaJLMjizGTvdbDM7Ns5J/B9P
	/otRuCADr4+oCwEzLwSSQr6+rZGRJ51Y0hO2vsEOcc2GK7UR5T76v3oErNsNgQfRTY1XOVlHVgskj
	XEHcM2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7E6-0000000CbQT-2TVF;
	Wed, 15 Jan 2025 17:30:46 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7BN-0000000Cau7-3WgP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 17:27:59 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2166651f752so159516465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 09:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1736962077; x=1737566877; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/tOyA1p7QjHDsifRN5k+/Gb8kyRYOVF0Azt3OIzzyw=;
        b=uwNwymVCxXeli6gw1OCYUZ1B/GIH1xIUaUAYlPIw5QRilU/Wz1CpsVxwYPjGZwlF4t
         vpgluYiHe4+p8MQVm/zcZ0CuyeS1jaR+pxgJ3kB6ayugFUVNlGQzhOdzdUeSe+ZlDSfG
         Q+2XjCIxQHnRKQ/nfJsueXzvtcIhe53DNiopI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736962077; x=1737566877;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/tOyA1p7QjHDsifRN5k+/Gb8kyRYOVF0Azt3OIzzyw=;
        b=RpeDL8CBFN70c5AvsCWwTXWw+bK3I0qdOO9kVIdzLu3QhkSL0BaCPQM/M8XRH8Cvim
         DTH34sDfqpLgwBPKvpRMq98tu2KX8nwWrrrBskZDtL4S7iVqjJmHyRlY3K/xNqLlS0dz
         o/B/zYvD+PmvO9FwdgRFz+4WspDMKveGmrLo6Oll7rxxN9EhhD8GwrJpSgnTsL0zBuT0
         YUOviaqsOpfdwBq6gKsW4/bLHfUrRyUlRR1F7GksfnP2nvp32FHxER0Q3ctnletAp7ct
         6nDTvb0tBpCkp7+xJQOgzosjzwwtAFEcYwhpAym6BDR/WOR3zrRXerua7cIjrYjM+YNT
         aoEA==
X-Forwarded-Encrypted: i=1; AJvYcCUjaDKuzqBkMdiFQUPcFsRgHX3bxNGC0RRef56gpeM5k72iE0tn87iA58+oXdyAa7cy9wr6SKLaLM9TN18E9N7T@lists.infradead.org
X-Gm-Message-State: AOJu0YwXy3dhGI3W5x4KawxCzwacU/4QZ8RpqQrldnAVZugqjpws+fHs
	fumiffHMfCSNGbWQWxajTfNe8vdmZp9n5Pi02hp/4o4OwgWN7Uj3HbpgRF4EDoc=
X-Gm-Gg: ASbGncsXTYlGHjAYzKAQh0qB9Oxl+tk0V6WPvTAMlJOPndjmHFPmjwvVwtktrEKnlFz
	zUNCMwG/T/K/dFK2Dt2eAii/Ilm3aatUH5nkLHW0KHV84VOIcqXTp/8kzrj0kWU5bejjCucRW+F
	piS158RmPqViZIsezu+LrOKkEjZAo70CJviSgsyXeFNtH63hMCv9kZBxQVncbbAws6XhMAk7j5p
	tCdi1Hem6UssUMKgmrnBel4ln8rGmy0skxrfM6+cfFvp11gFL/y78OCcgeP774sSuK8vAogW/0d
	STtvQgGewEJBEn9osZWm8N0=
X-Google-Smtp-Source: AGHT+IGksVKSylJkV0LbwF+RW3gakMaxvSakIRb83Rj9Zk5r6cV3J0tIrcgSWtS1CavXnppBEpmgAQ==
X-Received: by 2002:a05:6a00:1906:b0:72a:bc6a:3a85 with SMTP id d2e1a72fcca58-72d22007a0emr30575531b3a.22.1736962076898;
        Wed, 15 Jan 2025 09:27:56 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d405485b7sm9320991b3a.2.2025.01.15.09.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:27:56 -0800 (PST)
Date: Wed, 15 Jan 2025 09:27:53 -0800
From: Joe Damato <jdamato@fastly.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: Optimize cache prefetch in
 RX path
Message-ID: <Z4fwGc50mAfrMmYJ@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
References: <cover.1736777576.git.0x1207@gmail.com>
 <668cfa117e41a0f1325593c94f6bb739c3bb38da.1736777576.git.0x1207@gmail.com>
 <Z4bzuToquRAMfvvu@LQ3V64L9R2>
 <20250115103358.00005b57@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115103358.00005b57@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_092757_987324_88C6D997 
X-CRM114-Status: GOOD (  26.26  )
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

On Wed, Jan 15, 2025 at 10:33:58AM +0800, Furong Xu wrote:
> On Tue, 14 Jan 2025 15:31:05 -0800, Joe Damato <jdamato@fastly.com> wrote:
> 
> > On Mon, Jan 13, 2025 at 10:20:31PM +0800, Furong Xu wrote:
> > > Current code prefetches cache lines for the received frame first, and
> > > then dma_sync_single_for_cpu() against this frame, this is wrong.
> > > Cache prefetch should be triggered after dma_sync_single_for_cpu().
> > > 
> > > This patch brings ~2.8% driver performance improvement in a TCP RX
> > > throughput test with iPerf tool on a single isolated Cortex-A65 CPU
> > > core, 2.84 Gbits/sec increased to 2.92 Gbits/sec.
> > > 
> > > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index ca340fd8c937..b60f2f27140c 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -5500,10 +5500,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
> > >  
> > >  		/* Buffer is good. Go on. */
> > >  
> > > -		prefetch(page_address(buf->page) + buf->page_offset);
> > > -		if (buf->sec_page)
> > > -			prefetch(page_address(buf->sec_page));
> > > -
> > >  		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
> > >  		len += buf1_len;
> > >  		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
> > > @@ -5525,6 +5521,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
> > >  
> > >  			dma_sync_single_for_cpu(priv->device, buf->addr,
> > >  						buf1_len, dma_dir);
> > > +			prefetch(page_address(buf->page) + buf->page_offset);  
> > 
> > Minor nit: I've seen in other drivers authors using net_prefetch.
> > Probably not worth a re-roll just for something this minor.
> 
> After switch to net_prefetch(), I get another 4.5% throughput improvement :)
> Thanks! This definitely worth a v3 of this series.q

No worries. For what it's worth, it looks like there are a few other
instances in this driver where net_prefetch or net_prefetchw can be
used instead. That might be better as a followup / cleanup and
separate from this series though.

Just thought I'd mention it as you have a way to test the
improvements and I, unfortunately, do not have one of these devices.

