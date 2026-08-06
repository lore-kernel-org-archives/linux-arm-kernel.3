Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD06C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 15:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87/H9EMlwH5MQtLg4YoCYwZZh62cqUzZ27PH8DCBgO4=; b=bZnAF0PPdRqyHo19T6idJVKK5x
	ioQQeWGP0oxyTYIocOmpXKp523+XI/c6Nx9uKCRNNXCfvif0vG4HJTDvAH7E+6+i0BT3TRBsX0yQx
	yMMg+6i/3hUEHxgxySdO01huTKGZABhWZDQrocHaV4k9hLX6Np08qvHtPAbb3BcGph4LS9GKhwaoL
	5H/f602U6T/BYGprC7cdCB9MDf7X+qmylwt/rq/j0GSm13Izn0MI4uQE0nmx7slTTCUN3ZOczlzyo
	F6LqA9Z3zL1ev9olgOF4RH7cBFnvECpGayCgSWff311xc9Ls4FzCjZYIM+Uaur+fW8CTjAd6vO/eB
	vOJjDivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0Qn-00000006940-1YY0;
	Thu, 06 Aug 2026 15:54:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0Qk-00000006939-3vlV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 15:54:52 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cad8076b01so29320325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 08:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786031690; x=1786636490; darn=lists.infradead.org;
        h=content-transfer-encoding:lines:status:content-disposition
         :content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87/H9EMlwH5MQtLg4YoCYwZZh62cqUzZ27PH8DCBgO4=;
        b=ElY3oYnPdlBEB8PdaaLkHpNVxbtIKPP+xnRy4ThpF30CUSk3Yzvpg3OXDq+GP3uh3M
         X6OVaYNwuZsNa7jLDhjo+D2cCekiIcp6OB/FQ5ki3B3pLk79ffYqbyICM9+AVl+cx7C4
         6NOrme16Vcv4HKyAxPZ5r3y0Eq4bW+4yJ8HlgWXDi1w2qLmZ+ze3kPu2nrErUB0wkwVj
         Vbv73qsHxriozv/ZhS0NX73YiTXiaKnILloWNWJhsFxa0dQhMVkew9C0cFklq1SBT9EY
         R0pC2RtcjxW/gto0yjptOekksGnzPzcgxVS0ryJpUfGqc2cLDVWEjsi55XrOaNGcw+91
         Jv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786031690; x=1786636490;
        h=content-transfer-encoding:lines:status:content-disposition
         :content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87/H9EMlwH5MQtLg4YoCYwZZh62cqUzZ27PH8DCBgO4=;
        b=cgve/IPofz0xw68iRF5/7Nw1cIpZvX1P0WgAVc1fqtdV8H0dHxTU7hKmgHsUm50vjT
         yLLu5didMGVLIGaFYoYeGNe8qFvhKtIGF/sYjNN5PanvOJCJ08emhem+lzkAFBtNTNMt
         SscsaI509EvMjAkHqKqSEh57y1zdQZrkbbIug9ZjFfKtluEu15KF74y08Da4uVzzVI1l
         nTO55NYVWw4YpLaOvmIVG3ZyzDHwBPfYkBRVKCUa4JrTiMGOMAJN9d3VvocytWzZZVJ2
         IQesPOg5+R8D1el6u6R3sTTCQ3xv/F/phTseH67YZja8vDx1rG9ZzKPypSmqmpsLG5aB
         +jqA==
X-Forwarded-Encrypted: i=1; AHgh+Rox7keeidBIeOPg2nBv6fM+Rp84yD7e9CPR83uerXJm8t33dzxXOGylQxNt8wzgue+GIbatGAt73SAg+Ht+2OIw@lists.infradead.org
X-Gm-Message-State: AOJu0YwR/dl/aJZWV3vvINo3xQzqr9lzybPLO1eP3oh+jrNVMqYKQmWm
	UCmygWUnBQH/mTsNALrXDq/AK63U0mSIBQZR9jF62mIHsVwLrFQqvcXh
X-Gm-Gg: AR+sD10ao7Kzj+mtcfL+Y9WF4Zb/MWB3ZyDPnAat2eJcRzxOmZdgVba6pHSl81u4V7W
	6vqmcfLNbhhQx/ytiXN1OYgX/jVQw+V5DrceiWIzFl1E9zygA9s9xTOKHcAf6WOQ3xVK6BbzqaH
	KvGprOk+grgIFwdLSrvqIorrwPIXx2G0OC8FYeWGlY72Zndulvd8chRUeY8nJp1B4WYcA8yHdBf
	X+Fg0Vo1vsVEylUlQg3POCtxWP6LiFjLT1dPrE5QQjOJplwNjvfdw+ArobEU0XvxKchBrWMsaVu
	QTY6TlPYav6In51R3GRuAQpTdCjGsDTnHfSxFb8LThIbGM+QlnbTyNe/m60Vt23tAZ8lNioV3jR
	MpjSFbt+c09MfECjW1o9mNxBDKvb8rM95DHteb90GHPRjj0SpiySrsGVBvH8cYjEAw1J/jCsICp
	sd7pdgEdAXsV16hJTjrcgnqTbjJg6To/Uwj7CrE+LyVjDJZWm7oPhk5euBH8VjpzI/LS+Mfamz7
	g3hOg6izx8QlejdCq8Nlmv9ZFYqGw==
X-Received: by 2002:a17:903:4688:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d0ca7fbc9amr204312735ad.10.1786031689896;
        Thu, 06 Aug 2026 08:54:49 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4c94d4sm33717415ad.65.2026.08.06.08.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 08:54:49 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: pabeni@redhat.com
Cc: andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com,
	davem@davemloft.net,
	edumazet@google.com,
	hujy652@gmail.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	lorenzo@kernel.org,
	matthias.bgg@gmail.com,
	nbd@nbd.name,
	netdev@vger.kernel.org,
	sujuan.chen@mediatek.com
Subject: Re: [PATCH net v3 2/2] net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
Date: Thu,  6 Aug 2026 23:54:30 +0800
Message-ID: <20260806155430.768-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730090030.201100-1-pabeni@redhat.com>
References: <20260724172040.1653-2-hujy652@gmail.com> <20260730090030.201100-1-pabeni@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-References: <20260730090030.201100-1-pabeni@redhat.com>
X-Mutt-Fcc: ~/sent
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_085450_977875_D78EA2D3 
X-CRM114-Status: GOOD (  27.35  )
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

On Thu, Jul 30, 2026 at 11:00:30AM +0200, Paolo Abeni wrote:
> From: AI Reviewer <ai@example.com>
> 
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://sashiko.dev/
> ---
> --- Patch [2]: [PATCH net v3 2/2] net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986 ---
> commit 30cd2d1bc8bf876e5d201d631684431920a3f165
> Author: Zhi-Jun You <hujy652@gmail.com>
> 
> net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
> 
> This commit fixes an issue on non-DBDC MT7986 where WDMA_RING_TX(0) is
> never set up because idx is 1, even though it is required for WED RX to
> function. It addresses this by explicitly calling mtk_wed_wdma_tx_ring_setup
> if the WED version is v2 and rx_ring[0] is unallocated.
> 
> Link: https://lore.kernel.org/r/20260711112128.971-1-hujy652@gmail.com
> Link: https://lore.kernel.org/r/20260630144831.1109-1-hujy652@gmail.com
> 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> > --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> [ ... ]
> > @@ -2334,6 +2334,13 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
> >  		if (!dev->rx_wdma[i].desc)
> >  			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
> 
> [Severity: High]
> This is a pre-existing issue, but does this code ignore the return value
> from mtk_wed_wdma_rx_ring_setup()? 
> 
> If mtk_wed_ring_alloc() fails due to memory pressure, it returns an error
> without configuring the hardware base registers. Because the error is
> ignored, when DMA is later enabled in mtk_wed_start(), could the hardware
> attempt to fetch from unmapped physical addresses and cause an IOMMU fault?
> 
> >  
> > +	/*
> > +	 * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] during setup
> > +	 * but tx_wdma[0] is also needed for WED to function.
> > +	 */
> > +	if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
> > +		mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc);
> 
> [Severity: High]
> Does this new call to mtk_wed_wdma_tx_ring_setup() also need to check its
> return value? 
> 
> Similar to the RX ring above, if mtk_wed_ring_alloc() fails to allocate
> memory, the hardware base registers won't be configured. Since the caller
> proceeds to enable hardware DMA regardless, might this lead to the WED
> processing descriptors from unmapped memory and causing memory corruption
> or a system crash?
> 

I am not sure how to proceed with this.

Can Felix or Lorenzo comment this?

Best regards,
Zhi-Jun

> > +
> >  	if (dev->wlan.hw_rro) {
> >  		for (i = 0; i < MTK_WED_RX_PAGE_QUEUES; i++) {
> -- 
> This is an AI-generated review.
> 


