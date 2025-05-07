Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A189C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 10:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tx722LLBcDX85Nl+UVjthb6rDb0/f2vKG6KsAYhSJ3Q=; b=XAz1TlQ1rpYTtN9Kb1IvUVnhGS
	xt9c1HrE3a837VHw54eIITRNHKetIn2BjH4pTVNFyq5ANnIEGif/Ln6lHV+rIiD3Q55Ps+/2Sb/tv
	Bsvdv27k8xKWHfs9z5Zhz896nssFLniiYpZoVPzTivEqw0KC+47EslMaxXsISkBGRQ1iRrPh9wLx5
	kGaFGRV6i7CF8pAbg35XR+qK4Kk8xoNVY4ZjNe170Rz9DTN4zEPeSurIS+FwnunAo/sTq222+Jme7
	4QijxxWgmUrICX+a3cIFRjAt/3AfHhoEuCGKKHX+tRsjKiPQ1B4LMJWCFLx172l5krNvH4iBAhnze
	rUhQxOrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcL5-0000000F9HQ-1iKd;
	Wed, 07 May 2025 10:49:23 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcJ7-0000000F96h-1nFy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 10:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Tx722LLBcDX85Nl+UVjthb6rDb0/f2vKG6KsAYhSJ3Q=; b=SmQ0f5v84BGP/Ko44iFlRqfT+2
	HqFax0psOtD+BSW8Or6pV5mrEHnzrN/aETO49l4ydOpKEuC97pzM3z6R5Chs1tK8ex4fEp7SO/m1H
	JU0e+0gAz8Xa8+6nY3P1HS/OfYv0ofAJJigMMNM12t8Js9K6CtEaH8HM7R4IjYqSvTW3nd0trtvi5
	Hic5UdV/LPIm4niQh7Jx0bikG4aOmRzBlo7Z/wIzkULy795yqV7YcSPZ6CAcNUDlWOgq4QWkEivJO
	teZxajMdYy4jGeRn9MuD2AKFzEEt0nUY0IvRdybcSOIfY4Oe9sQHvgzFqHtFKP3iCWWUZxN3ca7J4
	G3yBSvsw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1uCcIv-000Al9-0y;
	Wed, 07 May 2025 12:47:09 +0200
Received: from [141.24.82.26] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1uCcIu-000Dr9-37;
	Wed, 07 May 2025 12:47:08 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 10:47:08 +0000
Message-Id: <D9PVA78TMQNH.H3AZTEVZ8SV@folker-schwesinger.de>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Set dma_device directions
Cc: "Vinod Koul" <vkoul@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
 "Marek Vasut" <marex@denx.de>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Katakam, Harini" <harini.katakam@amd.com>,
 "Gupta, Suraj" <Suraj.Gupta2@amd.com>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>, "Thomas Gessler"
 <thomas.gessler@brueckmann-gmbh.de>, "dmaengine@vger.kernel.org"
 <dmaengine@vger.kernel.org>
X-Mailer: aerc 0.20.1-71-gcaf717fc3044
References: <20250314134849.703819-1-thomas.gessler@brueckmann-gmbh.de>
 <MN0PR12MB59531CAA16616476F2E09EFBB7DF2@MN0PR12MB5953.namprd12.prod.outlook.com> <MN0PR12MB5953C8800220724906360D54B788A@MN0PR12MB5953.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB5953C8800220724906360D54B788A@MN0PR12MB5953.namprd12.prod.outlook.com>
X-Authenticated-Sender: dev@folker-schwesinger.de
X-Virus-Scanned: Clear (ClamAV 1.0.7/27630/Tue May  6 11:43:15 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_034722_571538_DAF147FB 
X-CRM114-Status: GOOD (  15.84  )
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

On Wed May 7, 2025 at 12:20 PM CEST, Radhey Shyam Pandey wrote:
> [snip]
>> > Subject: [PATCH] dmaengine: xilinx_dma: Set dma_device directions
>> >
>> > Coalesce the direction bits from the enabled TX and/or RX channels
>> > into the directions bit mask of dma_device. Without this mask set,
>> > dma_get_slave_caps() in the DMAEngine fails, which prevents the driver
>> > from being used with an IIO DMAEngine buffer.
>> >
>> > Signed-off-by: Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>
>>
>> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>> Thanks!
>>
>> > ---
>> >  drivers/dma/xilinx/xilinx_dma.c | 4 ++++
>> >  1 file changed, 4 insertions(+)
>> >
>> > diff --git a/drivers/dma/xilinx/xilinx_dma.c
>> > b/drivers/dma/xilinx/xilinx_dma.c index 108a7287f4cd..641aaf0c0f1c
>> > 100644
>> > --- a/drivers/dma/xilinx/xilinx_dma.c
>> > +++ b/drivers/dma/xilinx/xilinx_dma.c
>> > @@ -3205,6 +3205,10 @@ static int xilinx_dma_probe(struct
>> > platform_device
>> > *pdev)
>> >             }
>> >     }
>> >
>> > +   for (i =3D 0; i < xdev->dma_config->max_channels; i++)
>> > +           if (xdev->chan[i])
>> > +                   xdev->common.directions |=3D xdev->chan[i]->direct=
ion;
>> > +
>
> Suraj also worked on this patch internally and he did set direction in ch=
an_probe().
> So, I think we can switch to below implementation ?
>
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -2909,6 +2909,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_=
device *xdev,
>                 return -EINVAL;
>         }
>
> +       xdev->common.directions |=3D chan->direction;

Looks good to me.


