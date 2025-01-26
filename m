Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CC8C02181
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 10:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ecirtyp08OWG3CnMrgQHnomqjmrMG04Uo5mPDcC4TFM=; b=IJQVFaVBubzw3FcsxyhA9JR0Nj
	+Ley9A+NawK7fo9z6bA6Zk1/Hg0YeL1k+iyy7mZCDeDtEh9qIpiHPKzeO1NUYa1gUT5H02WDc+BBc
	kgHzazh1uJBOuUfryJKZVYP80llexBXXaa5uF4CcWdod9gys9ZlSXRbJDz3q7x3Owq+upiH4AKDGW
	NZCd2wzTDTyFmg7yyObQ/YD/AphbdjUNPejH7eXwZ63kuw1gKlhyoDR7vYXBvYzeHugDsKTKMCPgh
	SI8Kp+NJgOXE42nj962wYXbp4DEWipZMWIoBfqIuYfu++Zdahy/jeElYVcXAmGBS/ILo/M+CkTQyW
	85xwGGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc02W-0000000HKjZ-3ZgJ;
	Sun, 26 Jan 2025 10:38:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc01F-0000000HKfj-06kR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jan 2025 10:37:34 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-216281bc30fso82219085ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jan 2025 02:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737887852; x=1738492652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ecirtyp08OWG3CnMrgQHnomqjmrMG04Uo5mPDcC4TFM=;
        b=gT5dlx92ntUiTS23MBwTicT313ITvW70cTyiNVnaqwMDoO54bD+8N/F4gGG+fgXxKh
         U5MJ6kM/Px1mqVKdxCFXv1vUmLN/BesQN526owjbGtSd0nTFp/oibnMqXOFLFXRihjAt
         DsYKk/SSmD2Zp3brM9+nqtJIHnOJIl7eAcK46/X+RFoPmC0TTH2jXdZvLLtJFKpZ0lOc
         ZKI/wQ/DSBSTHhwp/LNPCU3dOGpN13dIfuoF51x2BDWx3xQAyxDafzsYju9vd2nM8Txg
         5rYXjMDncVbx/ym7LxbeEx8uENuLI31aiNWRdtGDpBUmBAEYBUCjRSE+XUthe/gKFU/y
         fzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737887852; x=1738492652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ecirtyp08OWG3CnMrgQHnomqjmrMG04Uo5mPDcC4TFM=;
        b=prcGWynR/SX2LFcAg+L3xvVkBK4+Ki1p9zCX8PNbg/bE7c9lx471+wkN3WbixBNT8s
         z5c0x5ei7bF7XDrfMQlji5TOKy355ROhE3qPxIP4iy+Hfyg3PUOdk8fhXrNJBGXcAxsz
         T9CLSU+7I9mTHI1YsPwmbtTtLBwUsFuzJsZvA15myDJZIBtt29rY8Aujc76xs7Xi9Axa
         l5acE5dHKPSSPkCAEkxw+/IhYvbVxZjzC6KqL4kzZTtJreE7sleO+l3a9K1uR6qpqVqn
         qtnd2YiNI/GCp1rCSqOBH3dKOOoSgGlUW3NAjsqL0R4o5JN7XJWMgIuj54Jzhuo5oJbo
         kW9A==
X-Forwarded-Encrypted: i=1; AJvYcCWjlb6hPWiwpeFflKIYYrtVH17NYoIIHam+Dsy/9Nj851fnhITLDT7HIATOsB0gsOS+5lScPedLmo+1S/SEAC1q@lists.infradead.org
X-Gm-Message-State: AOJu0YxQJ/YR1lfAWzgoET7p1AyYzWhlSSyrITScdE/b9EYdmJISdGh1
	9j/2XKYxetJwT0os32mJ8C4etA/o4aOWJMCzTbTE9OP1S8kH8SWm
X-Gm-Gg: ASbGncvbXcajKmxZsdciK+w7TAvk9EEbfka0PG2mYDq3f8L/IzJ942YgmJubtW7n2KS
	lMQiotno3bykDO6aiSyb3DWgExsnuYEa7hdEzKMMwiFK1oNpq1XuLJRUbYeE+z1fQW172ZGWkXR
	R9iiME7vthoaIoQBYdhaKsbG7YCY9UvB3l/xWYuvyxaXDlYdKGSrUR8FTR81Cb1XVNg5SMXPrub
	p8keEU/r/F23WfAPD/bv+Iw02PmDG0OyfXGv13wtk3/iIVrP8ccjHIlLZbMqYPeDvXzRwapDDk+
	OQ==
X-Google-Smtp-Source: AGHT+IFgaTg1pL07xIfW9KbW3VjCnfQqBoPnEBRDQmsyx+On2i68wqvPnp3VcevKh/0hXbChCB3geg==
X-Received: by 2002:a17:903:32cf:b0:216:5af7:5a8e with SMTP id d9443c01a7336-21c355ec9c0mr536393545ad.26.1737887851920;
        Sun, 26 Jan 2025 02:37:31 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141175sm44375105ad.117.2025.01.26.02.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 02:37:31 -0800 (PST)
Date: Sun, 26 Jan 2025 18:37:14 +0800
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
Message-ID: <20250126183714.00005068@gmail.com>
In-Reply-To: <Z5X1M0Fs-K6FkSAl@shredder>
References: <cover.1736910454.git.0x1207@gmail.com>
	<bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
	<d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
	<20250124003501.5fff00bc@orangepi5-plus>
	<e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
	<ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
	<20250124104256.00007d23@gmail.com>
	<Z5S69kb7Qz_QZqOh@shredder>
	<20250125224342.00006ced@gmail.com>
	<Z5X1M0Fs-K6FkSAl@shredder>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_023733_069931_46F4F25B 
X-CRM114-Status: GOOD (  14.18  )
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

On Sun, 26 Jan 2025 10:41:23 +0200, Ido Schimmel wrote:
 
> SPH is the only scenario in which the driver uses multiple buffers per
> packet?

Yes.

Jumbo mode may use multiple buffers per packet too, but they are
high order pages, just like a single page in a page pool when using
a standard MTU.

> >         pp_params.max_len = dma_conf->dma_buf_sz;  
> 
> Are you sure this is correct? Page pool documentation says that "For
> pages recycled on the XDP xmit and skb paths the page pool will use
> the max_len member of struct page_pool_params to decide how much of
> the page needs to be synced (starting at offset)" [1].

Page pool must sync an area of the buffer because both DMA and CPU may
touch this area, other areas are CPU exclusive, so no sync for them
seems better.

> While "no more than dma_conf->dma_buf_sz bytes will be written into a
> page buffer", for the head buffer they will be written starting at a
> non-zero offset unlike buffers used for the data, no?

Correct, they have different offsets.

The "SPH feature" splits header into buf->page (non-zero offset) and
splits payload into buf->sec_page (zero offset).

For buf->page, pp_params.max_len should be the size of L3/L4 header,
and with a offset of NET_SKB_PAD.

For buf->sec_page, pp_params.max_len should be dma_conf->dma_buf_sz,
and with a offset of 0.

This is always true:
sizeof(L3/L4 header) + NET_SKB_PAD < dma_conf->dma_buf_sz + 0

pp_params.max_len = dma_conf->dma_buf_sz;
make things simpler :)

