Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38552C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tYIxWjH4asPJ7vGr3zm8KkssG+yJatoWr9svY3RnU4=; b=M9avBN3Rz+iFNeXvnk8VQnEbY5
	HMPIQGYHw8WcuEkFAYFlFm6cGgdYbCeYNKwLJGP5J3X7aQOmXYr4zS405fOQpo3iORakIw+k+UwDE
	/2fqdfkBdbMTenkPvpn16CstgdInXOXqkCUAn3NwILqw2yAS/LLONLrLtSvjzGSr9Y0SenCGWdSXo
	s2KBpPWoGnIuH1wvPbzG7qhehbMS/HuEZR+AYlCwc/ylrlL6BH/MjCl8GroDOxRqWIY39pPAHN20h
	pnD0nvcsQh5I3Lo3uB6lqT0T7wCmlevkIxThjnvQb7GlrctTtcfdw8bbesIkn58jW2lz1O2/Io0oV
	34IiXDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKWK-00000008zbe-3KOB;
	Fri, 07 Feb 2025 09:19:32 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKMe-00000008xMC-3w88
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:09:34 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21f2cfd821eso33156595ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 01:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738919372; x=1739524172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tYIxWjH4asPJ7vGr3zm8KkssG+yJatoWr9svY3RnU4=;
        b=kRUVv2v7286RgR1oFHxg3XaYtEdKxVYjssOqPmKyLvLebWFC7IovCPSL2tjOKci34D
         kLmn+KUv6psNEQ8Mgt3VUa5gWC8RAsJCWINiyjfI1iHAPGKsai74Ur/lHjeaK0RCYx1i
         9lWrqy9dQrRFNWzsscC2QiLReaNyzTa4ZSB+VhIZq8+vKEci7zPuoSzj+geidYVcxB7P
         y0+UqbU7WjjRf4s3/RluoFmRnyAeufJUNzBI+djngkVepJYc0+5Pi5P2n8NYqyz4+/GU
         sY6EBQzqN/WHZ4oG6zZs1kckdcuCAMNvekOxuq2RKIGzh9hOUqOtj3bLZVUKeWF65IrX
         Z9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738919372; x=1739524172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tYIxWjH4asPJ7vGr3zm8KkssG+yJatoWr9svY3RnU4=;
        b=eDmghwUvPTCZjC4GWinWSMs9pjlSJNn6XGU3j+kGfE57d3dfK79cG0/34BTLYoc39o
         IFdWBa47FShPDs+pRl67vUzNbju3zAMqEZTNI/CcTJ0hN5x4GPLCA9rwbPOAZsxAgQuw
         dcq3ejDFUP0klKExRqHp0vU2g7V4GtQpgUNGScWCryK905g6mhtYE0nR/3k1REJvxZ6u
         MhWz1EwBgzXucj9QUT5FVmdVH8IGi2M1cTmkFWTXWqHaU+zI60uIUFtw6wBqu47BEnLf
         7XVnzgnbLwdY7UXSA4RwafCs28GBw15rA/iixYiZG4SAOFDMYmvaNqQfvj9F1mbXV1v3
         GpOA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ysN6NB1CtqjA6s+AZ7sIHFjQW6aujTbOv2y3yeY2pUV4WbyPKfvWLCdz3wOvAtaRX5zmBFpz4qgns1O7gmGr@lists.infradead.org
X-Gm-Message-State: AOJu0YwBuWcc0HEhVe6ChHtt9ELdqD2hgux9zij+KLQwwiLJl7umP/+L
	yfbyTRXXcvXlZZYLJn3jVs2tVcZyr8I+7MAtZFDwfch+pkIf8PNX
X-Gm-Gg: ASbGnctYuiBfDpvEDN9p9q/0Vpfy5LWytmw54DB8OYAb9PZRam/h7eLzsDqIXIXPxd4
	Dx0luO9u6lmM/0CPpGd7NQSzh+pSJfBRG21bVZwe1eoHY36VQlYeihpQokVGcz+l2IEHxGCs7JR
	8czCusDW8DSO8Lzooxdt+L7jCmHgcFwd6oCPGpIs8OFV7UNVewsoEgcKJc8D+6ec+5QjfGU2qrl
	Iap2ySTKxz0+o9YRc9ZBCYccQ1gWmlzK5YrFPNXc1GSSpW7zp8ekTsO2J+O78HMlK3G9Ejgcqb5
	bATW3UnG9JY8
X-Google-Smtp-Source: AGHT+IHdbdRPTIQl2gSZ+CotH7ac/oBwZCxsHs4UvbL1u5MkN8h8LbL1QYV1lgF7a8TsacFSkfg1rg==
X-Received: by 2002:a17:902:ea0c:b0:216:760c:3879 with SMTP id d9443c01a7336-21f4e781389mr39271805ad.46.1738919371696;
        Fri, 07 Feb 2025 01:09:31 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36881e14sm25847215ad.207.2025.02.07.01.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:09:31 -0800 (PST)
Date: Fri, 7 Feb 2025 17:07:44 +0800
From: Furong Xu <0x1207@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Ido Schimmel
 <idosch@idosch.org>, Andrew Lunn <andrew@lunn.ch>, Brad Griffis
 <bgriffis@nvidia.com>, netdev@vger.kernel.org,
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
Message-ID: <20250207170744.00006ceb@gmail.com>
In-Reply-To: <108592a6-de5b-4804-92ff-c7d4547beff0@nvidia.com>
References: <cover.1736910454.git.0x1207@gmail.com>
	<bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
	<d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
	<20250124003501.5fff00bc@orangepi5-plus>
	<e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
	<ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
	<20250124104256.00007d23@gmail.com>
	<Z5S69kb7Qz_QZqOh@shredder>
	<20250125230347.0000187b@gmail.com>
	<kyskevcr5wru66s4l6p4rhx3lynshak3y2wxjfjafup3cbneca@7xpcfg5dljb2>
	<108592a6-de5b-4804-92ff-c7d4547beff0@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_010932_981656_DA91FDFD 
X-CRM114-Status: GOOD (  34.60  )
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

Hi Jon,

On Wed, 29 Jan 2025 14:51:35 +0000, Jon Hunter <jonathanh@nvidia.com> wrote:
> Hi Furong,
> 
> On 27/01/2025 13:28, Thierry Reding wrote:
> > On Sat, Jan 25, 2025 at 11:03:47PM +0800, Furong Xu wrote:  
> >> Hi Thierry
> >>
> >> On Sat, 25 Jan 2025 12:20:38 +0200, Ido Schimmel wrote:
> >>  
> >>> On Fri, Jan 24, 2025 at 10:42:56AM +0800, Furong Xu wrote:  
> >>>> On Thu, 23 Jan 2025 22:48:42 +0100, Andrew Lunn <andrew@lunn.ch>
> >>>> wrote:  
> >>>>>> Just to clarify, the patch that you had us try was not intended
> >>>>>> as an actual fix, correct? It was only for diagnostic purposes,
> >>>>>> i.e. to see if there is some kind of cache coherence issue,
> >>>>>> which seems to be the case?  So perhaps the only fix needed is
> >>>>>> to add dma-coherent to our device tree?  
> >>>>>
> >>>>> That sounds quite error prone. How many other DT blobs are
> >>>>> missing the property? If the memory should be coherent, i would
> >>>>> expect the driver to allocate coherent memory. Or the driver
> >>>>> needs to handle non-coherent memory and add the necessary
> >>>>> flush/invalidates etc.  
> >>>>
> >>>> stmmac driver does the necessary cache flush/invalidates to
> >>>> maintain cache lines explicitly.  
> >>>
> >>> Given the problem happens when the kernel performs syncing, is it
> >>> possible that there is a problem with how the syncing is performed?
> >>>
> >>> I am not familiar with this driver, but it seems to allocate multiple
> >>> buffers per packet when split header is enabled and these buffers are
> >>> allocated from the same page pool (see stmmac_init_rx_buffers()).
> >>> Despite that, the driver is creating the page pool with a non-zero
> >>> offset (see __alloc_dma_rx_desc_resources()) to avoid syncing the
> >>> headroom, which is only present in the head buffer.
> >>>
> >>> I asked Thierry to test the following patch [1] and initial testing
> >>> seems OK. He also confirmed that "SPH feature enabled" shows up in the
> >>> kernel log.  
> >>
> >> It is recommended to disable the "SPH feature" by default unless some
> >> certain cases depend on it. Like Ido said, two large buffers being
> >> allocated from the same page pool for each packet, this is a huge waste
> >> of memory, and brings performance drops for most of general cases.
> >>
> >> Our downstream driver and two mainline drivers disable SPH by default:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c#n357
> >> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c#n471  
> > 
> > Okay, that's something we can look into changing. What would be an
> > example of a use-case depending on SPH? Also, isn't this something
> > that should be a policy that users can configure?
> > 
> > Irrespective of that we should fix the problems we are seeing with
> > SPH enabled.  
> 
> 
> Any update on this?

Sorry for my late response, I was on Chinese New Year holiday.

The fix is sent, and it will be so nice to have your Tested-by: tag there:
https://lore.kernel.org/all/20250207085639.13580-1-0x1207@gmail.com/

