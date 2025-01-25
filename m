Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E650C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 14:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgdWUzewQLGutGWm0yU3b4mLrNsMLQvksBxEqgoq+88=; b=RvnDx4GnNGtpY8ujpw2Oqw6aUH
	sPxox14hxALo1Ftp8Z0PJGEyZvgqlnxIUw0d/ANDm2ua33lBKesGGS6J8xOT6JkpwX0hQ3lQ+qNIo
	UdlpPiF2jg13eg9p6L6DfVlgxWjH/A55NBIilAXqF3XmWKRADAXSSdKB5f/cJpq6mZbwlKQfp/eoJ
	tWKsG7fVSxouOk+Guord7BMbqdSACST3DHdf7pYjWLp1KFjegdqa6J8Jc+fMPCat1nzV0fBAsKrRe
	wqaK6PfHFQF6vTdsiklaU/n5GaghNvVraYquwYzoyKXWmSJ4p4hDtxD8d/vu89oV0nRpygundTPom
	nP2uQ9pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbhPc-0000000GU1Q-1s3u;
	Sat, 25 Jan 2025 14:45:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbhOG-0000000GTv7-1dHl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 14:44:05 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21628b3fe7dso53039665ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jan 2025 06:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737816243; x=1738421043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgdWUzewQLGutGWm0yU3b4mLrNsMLQvksBxEqgoq+88=;
        b=kWFcEDsNmRtf5Y5XJ3mWLZNwpb2WL4Ki6IlOQfsjBsrNor8yEWJ77nkFLoanMTsZSI
         KHE73z+y9ACRcdT36FXQnFoo+BuqliuEaA2AhkeFtweqNHdLBewngQ9zgyk4WZL1w+0o
         tmL0sCP4U0TP8DC7PpJ+pQPJuupdeZmUcmvJVNswfHzMF2NRNDkvwLeswO5yZZfdHT59
         +fZrSmWT1sFV9NtIbzGxHVRSytdPa3EPpt6sh4t6dp7N/TEzrsnmVVIfvs8SGyW/mdJW
         Kf9hZp7cnePam2Sq7iLCXQSuTdtlQM0mpBfAS78RHK9WfriGNjhu2WmwoS5qmMPahPZB
         n09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737816243; x=1738421043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgdWUzewQLGutGWm0yU3b4mLrNsMLQvksBxEqgoq+88=;
        b=pddnL933m7/ELJLlfSnzpbxPIQKvOMiRlopKwaxDssHPpRu1X1kYwrRUdD2LJbt1oV
         kco1ZrgQ3yawAujCMlK0fK3wQYSFKCQruC1D8haNxBTFJuf9z7jN6RF3rHNTS0J9Zsk/
         R2jA1/Odsbh38rww2WStm4UA4uW/+aZOOn5BZCAcJojFAaYDON4T2nBz3Mj0CJb9jLVJ
         QE4mfsgTAbdcPBgr4BeAAEF8q8lH49wo6w+KFcWuJOLZVxOpxrjEWYsLG6oZ+BOexkH+
         Em3meB9czxyt5wT+DESMZNBWXJpE7CehOhFREUaytAvNF+QJmir8Y0ZB+KPgihllUWI5
         7Txw==
X-Forwarded-Encrypted: i=1; AJvYcCXwqVRX8fvTUbd/xwz6T89VdLIyThZxlk/XKc17df60s1/YSsB2vFzBtFiwmH8IhKWTP6UBdbCbZVP4COOwtwUU@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg8Z/CSXqPY+16W7ND2SdCoDhOP0sDdDKPhl+1YvmHY1Iq1q6D
	rPxizRHg/gL8PSSveiqlQOvoCnaHwm2/yHRXs2tFMu+6+jyhPICD
X-Gm-Gg: ASbGnct9QU/CNVqoqIJZ1WFWWckgrJu2f4iSW87XcG6957A/9pvmfUArEuMCwebdb9G
	DRCuziINVwrLOZ0FMnCZ9u8kJHBhgnFj2NTTuIquBbS+MsV81t+LU/j8sgHdsfY7VZxRwH31Udd
	cynYuLqD1/Xm/vgJlSleeCUdAf9TcXdhb44Vsf+5ysXN9dnpESJW2BKiOyUzYxrDGoGknyhrMGj
	RmQYR79fHLS1AvrGJmX5GJOmt2RBRkAgyyYL85K0rmYbj7FTLlEhpK8tnMrGjhAHM3+tzdQk2YR
	Lw==
X-Google-Smtp-Source: AGHT+IHA+4rV48inAhpZB8n1PkLhWTEJWQ25mbCFZqNsfRh6vVjT5iQKXj9RhiGTNIQSvXLlnOGvHQ==
X-Received: by 2002:a17:902:c943:b0:215:5bd8:9f92 with SMTP id d9443c01a7336-21c351d328amr566604515ad.5.1737816242783;
        Sat, 25 Jan 2025 06:44:02 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea332esm33441735ad.87.2025.01.25.06.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 06:44:02 -0800 (PST)
Date: Sat, 25 Jan 2025 22:43:42 +0800
From: Furong Xu <0x1207@gmail.com>
To: Ido Schimmel <idosch@idosch.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Brad Griffis <bgriffis@nvidia.com>, Jon
 Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Lobakin <aleksander.lobakin@intel.com>, Joe Damato
 <jdamato@fastly.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
Message-ID: <20250125224342.00006ced@gmail.com>
In-Reply-To: <Z5S69kb7Qz_QZqOh@shredder>
References: <cover.1736910454.git.0x1207@gmail.com>
	<bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
	<d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
	<20250124003501.5fff00bc@orangepi5-plus>
	<e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
	<ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
	<20250124104256.00007d23@gmail.com>
	<Z5S69kb7Qz_QZqOh@shredder>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_064404_444408_2EFE2BEC 
X-CRM114-Status: GOOD (  35.10  )
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

Hi Ido

On Sat, 25 Jan 2025 12:20:38 +0200, Ido Schimmel wrote:

> On Fri, Jan 24, 2025 at 10:42:56AM +0800, Furong Xu wrote:
> > On Thu, 23 Jan 2025 22:48:42 +0100, Andrew Lunn <andrew@lunn.ch>
> > wrote: 
> > > > Just to clarify, the patch that you had us try was not intended
> > > > as an actual fix, correct? It was only for diagnostic purposes,
> > > > i.e. to see if there is some kind of cache coherence issue,
> > > > which seems to be the case?  So perhaps the only fix needed is
> > > > to add dma-coherent to our device tree?    
> > > 
> > > That sounds quite error prone. How many other DT blobs are
> > > missing the property? If the memory should be coherent, i would
> > > expect the driver to allocate coherent memory. Or the driver
> > > needs to handle non-coherent memory and add the necessary
> > > flush/invalidates etc.  
> > 
> > stmmac driver does the necessary cache flush/invalidates to
> > maintain cache lines explicitly.  
> 
> Given the problem happens when the kernel performs syncing, is it
> possible that there is a problem with how the syncing is performed?
> 
> I am not familiar with this driver, but it seems to allocate multiple
> buffers per packet when split header is enabled and these buffers are
> allocated from the same page pool (see stmmac_init_rx_buffers()).
> Despite that, the driver is creating the page pool with a non-zero
> offset (see __alloc_dma_rx_desc_resources()) to avoid syncing the
> headroom, which is only present in the head buffer.
> 
> I asked Thierry to test the following patch [1] and initial testing
> seems OK. He also confirmed that "SPH feature enabled" shows up in the
> kernel log.
> BTW, the commit that added split header support (67afd6d1cfdf0) says
> that it "reduces CPU usage because without the feature all the entire
> packet is memcpy'ed, while that with the feature only the header is".
> This is no longer correct after your patch, so is there still value in
> the split header feature? With two large buffers being allocated from

Thanks for these great insights!

Yes, when "SPH feature enabled", it is not correct after my patch,
pp_params.offset should be updated to match the offset of split payload.

But I would like to let pp_params.max_len remains to
dma_conf->dma_buf_sz since the sizes of both header and payload are
limited to dma_conf->dma_buf_sz by DMA engine, no more than
dma_conf->dma_buf_sz bytes will be written into a page buffer.
So my patch would be like [2]:

BTW, the split header feature will be very useful on some certain
cases, stmmac driver should support this feature always.

[2]
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index edbf8994455d..def0d893efbb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2091,7 +2091,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
        pp_params.nid = dev_to_node(priv->device);
        pp_params.dev = priv->device;
        pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
-       pp_params.offset = stmmac_rx_offset(priv);
+       pp_params.offset = priv->sph ? 0 : stmmac_rx_offset(priv);
        pp_params.max_len = dma_conf->dma_buf_sz;

        rx_q->page_pool = page_pool_create(&pp_params);

