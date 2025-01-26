Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D39C02181
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 12:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KGHfLuP3yfCvrd6niU02daJ3MN3GQPttYCq64ynsaU=; b=d0MyUAo7U82odO/PBra2Mr+vl9
	IUha/hwXXSsouFB07Qz3qO0/IpI9Hs9nJqkE3Oo9Pt8RI2on6iW7rZIJ9wm8MmPLMpP0WDFr3c1Vt
	xIvQzZw9HdqIXWUtmk+28YmF56Xsg1SHQxun4HXN1CjYrptYqxImzy2i6asLz8pvvmiyYKxDkEgqZ
	0y9tSQ98nZfyUsoYA6WidSEQGUCfddAot6T+8YSILdqrsd8j69fvBB27xOubQu6oWGsLpFb/2pdrP
	RWGXV9u5U6vS1guSIYBVg9mBpeBsg0wkTmU8Q/74VRXDtLNRzLAyMlOMD+KK9dFyvJG2sKRkzdfQk
	zlIIBHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc2DD-0000000HOsq-2PBl;
	Sun, 26 Jan 2025 12:58:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc2Bw-0000000HOoG-2ffC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jan 2025 12:56:45 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21636268e43so76907435ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jan 2025 04:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737896204; x=1738501004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KGHfLuP3yfCvrd6niU02daJ3MN3GQPttYCq64ynsaU=;
        b=DJkXbuqZMeap2OVnxyyFB2dCcGSLrhzJDK8r9P3Cx0zsDx6tW5PfgUAlqGn4e1WJQY
         D/0s/kbFfGkERQkUwEYsGvIB8pbFPymgEQirVaXoOaHhHnUUdQ6MRWK7CL1CY/qTDOSC
         nLi0qikrQ985utSG8Z9Jjn9+Gke/Dq6BTHspRvyAo4FrT6gbavjYBDh30GuJONbtau8o
         TzhY6wnN9hPk3nZYDqj8TBotfa5yXijxGhCrRtG3e2n3jSrB6M/2D+WSbHRNZYoaqcd+
         F+fJuzIVYeNnUPgoXJz0NusN+5ORryiJUZcPewDOnpY4TshV0htMKmuv4Tj1dymU+bcQ
         WvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737896204; x=1738501004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KGHfLuP3yfCvrd6niU02daJ3MN3GQPttYCq64ynsaU=;
        b=qPeWHiGwMyC41ptcR51avVrs9Q3w5d/mLONvDe5N+2/YRdQtKh4FhQf1y8pukdWGzr
         SkSQvQgXXsuSE+Y6F1FPrCVMsqk842y+EXEU2SpyHpcISZYTMAtgeSIpWips8vQGabV6
         0Ky6AbNEef0Og+WyaCAOJvV6i9gFKLDEEnw6xeo2iRBNsbk4noxjgPBUpYBNtW3G/edo
         WcvBTa2JZv/vl1XLAQ0KTXMkdhWSgmZM7SN+YlE18ltNZ9WVupc2EahlekGH8aKES2HC
         h/Ml9PCFSpnwoSGcvBPtTcq3awwMr8BB/WVp3M9RSEyMMngo3zzfqQIcO26G4Fjg65rZ
         cHEw==
X-Forwarded-Encrypted: i=1; AJvYcCUUgzYIGcN+NvXAVt2Az1rzU5vKnbtq7rtq8/xR4Nl1747AkkpoORjrlGi1PDiyiyu2Ihoa1r7X5bO7HfjNVJuX@lists.infradead.org
X-Gm-Message-State: AOJu0YzOAVDWQI3B0Q5aldlalrn3fiio0MfKzZkjCVuXtCsjwcl2KT1E
	4h7IIgYZcKpH1XqBiC3draAEdQ56sl3mxl4HwGxRsFGyupVjyWjw
X-Gm-Gg: ASbGncseKfYt+othZgq27uR3FAwA0wz+prMxFMdC1OuvOsAJQ6KQmbqGZa7Xg/ARkRr
	m4WdZv7YZRnkgd/h8Wj1MBnuRPYVXug0SjPZur9HTmco/oMQkxlGK0Ytku5J5B0MVL/C/H2YNLX
	A3Yv4uhzx3bdPBTEfYdGo5UxJXmZ9E1Vlut2xSpTN00FaanWtjlUuth3DNoyW1ryuXIicn5f2ru
	ExcpH8n6NRkrEJmE4iwm2qy/3/mWGnYAX++RBjCVgGr+PoxKKCqGeESuugaW3Mkjif2RY5kpfm/
	Kg==
X-Google-Smtp-Source: AGHT+IGYKczzJcB4xAPfGWm8estAlez/srV9f9KVlzRCuc8f9pkMAG6+IqGmDY3HU1400WQhVY/Cuw==
X-Received: by 2002:a05:6a00:330b:b0:724:59e0:5d22 with SMTP id d2e1a72fcca58-72dafba2625mr53847801b3a.20.1737896203562;
        Sun, 26 Jan 2025 04:56:43 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a77c7casm5263334b3a.139.2025.01.26.04.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 04:56:43 -0800 (PST)
Date: Sun, 26 Jan 2025 20:56:25 +0800
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
Message-ID: <20250126205625.00006d64@gmail.com>
In-Reply-To: <Z5YeEVrI3zx4VOtF@shredder>
References: <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
	<d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
	<20250124003501.5fff00bc@orangepi5-plus>
	<e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
	<ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
	<20250124104256.00007d23@gmail.com>
	<Z5S69kb7Qz_QZqOh@shredder>
	<20250125224342.00006ced@gmail.com>
	<Z5X1M0Fs-K6FkSAl@shredder>
	<20250126183714.00005068@gmail.com>
	<Z5YeEVrI3zx4VOtF@shredder>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_045644_679952_29358CFB 
X-CRM114-Status: GOOD (  15.50  )
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

On Sun, 26 Jan 2025 13:35:45 +0200, Ido Schimmel wrote:

> On Sun, Jan 26, 2025 at 06:37:14PM +0800, Furong Xu wrote:
> > The "SPH feature" splits header into buf->page (non-zero offset) and
> > splits payload into buf->sec_page (zero offset).
> > 
> > For buf->page, pp_params.max_len should be the size of L3/L4 header,
> > and with a offset of NET_SKB_PAD.
> > 
> > For buf->sec_page, pp_params.max_len should be dma_conf->dma_buf_sz,
> > and with a offset of 0.
> > 
> > This is always true:
> > sizeof(L3/L4 header) + NET_SKB_PAD < dma_conf->dma_buf_sz + 0  
> 
> Thanks, understood, but are there situations where the device is
> unable to split a packet? For example, a large L2 packet. I am trying
> to understand if there are situations where the device will write
> more than "dma_conf->dma_buf_sz - NET_SKB_PAD" to the head buffer.

Nice catch!
When receiving a large L2/non-IP packet, more than "dma_conf->dma_buf_sz
- NET_SKB_PAD" will be written.

So we should:
pp_params.max_len = dma_conf->dma_buf_sz + stmmac_rx_offset(priv);

Thanks a lot, Ido
Have a nice weekend :)

