Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAC9C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 01:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xG0Wdkt+NUraD2HgOh+0AFsEQcpWyh1rmYJFEEo12N4=; b=Y2s2je18boEt3VRC5mXPPlgNUh
	dqXzMmrcYDlezIyoRgp+FVxWlGZb5BofNMAA0MCs977s/qRPr6R0tuTyptVMgCQ1g9YVF9qt7lKyL
	aiWiUqOh+7Fmdn3haYyO0B26TS/EwTKFf6zOPLQ7hJ+9KFs752IcLIV5uXBI/i+RysWQgxT1jeiAO
	djbD3Ugq9FJeZfeUpUyQIs7gq5xeT4+AtkvB+oD+yO9SbP+2ZBBvM1hCtF0DOq87rQswnGUfRXt77
	eT93esxHPIdeKH+iGoJ5VWnL5y1cLDsKcoS+jHTiYz5zYp83czPBRZUFIUMv+lol+y+ptWapy1XKp
	7mekiVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMzDd-0000000EUdh-2KR5;
	Thu, 05 Jun 2025 01:16:33 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMzBW-0000000EUTE-2glr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 01:14:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-235ae05d224so12062765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 18:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749086061; x=1749690861; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xG0Wdkt+NUraD2HgOh+0AFsEQcpWyh1rmYJFEEo12N4=;
        b=anaFwzrZLie7c7VsPbeu/5KovXWqkJyLysOMPEivWPpupxJZif7TyexPgA2C2kGKfr
         qrDHejS29wT1X0LoyeCwclg6EZlu2wU51Qds4dhdW0YLt7yLn2kyEKaIIBDn8G8x8I2n
         1yhW+HbhovfkIL6JiJWHVeh2ghHUHUXlVFHeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749086061; x=1749690861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xG0Wdkt+NUraD2HgOh+0AFsEQcpWyh1rmYJFEEo12N4=;
        b=NwDfXnXI7i6yVt0duEarulEUJyFZ7vpzobOY2m/Q/bUeXpKRmGH4n3QgyqXknyItt/
         CuSk5CNYrOhC8LmcOPL3H+9uaCW8Q3+DmkXndmWNtoX1O1DsZ1oSq7QTNBl1vaEtm5pa
         +DqEgwKExtA1PFQVknd91ImKN4v/YicdeLzhxoEPdaDrFJ0kbdxDSs2Cuyw5c3mlD9xs
         XpR4I+PUiSIugnprQLrLKTkIClBkO1T0RQPEx290Y5krinvHG3AHO5gl/Vz3zuLj/RZV
         pr3v7216qVLlUInCgeI7YbPXV6oMVbAZywD/edb0/CUJukEgAdZP4xWmobzMRJfJPSPu
         jdVA==
X-Forwarded-Encrypted: i=1; AJvYcCUL+XDWina7m3Wmb6/ltd3tbdPPWsEIb8VCULun6uS6U02ZeSN2rO9TssAuyuKQuRWWDD5xxmvBXSnMCKY1sBBV@lists.infradead.org
X-Gm-Message-State: AOJu0YxFC7YdYvh/IKK6uSC5S1ug3rtOdmifu+DirCRwhdqW7CYBFzDm
	077s+FgFZpUk7MgMkDiAa0S8Okox8tVO8OWyKiDcMx3TP7lMv723WhNFxx31ozHztA==
X-Gm-Gg: ASbGnctGy4TzFQKabcDDM0JcH/MEBMV6rL9fxsYZMCIxokJIExdQFFDfqo6vb7KLZdw
	p2dMQouKcxYiAewLGJLjHOYszZAQy4DINCFdZ93vsVw0KEfBHbFGPMt9B7pUiGqA9anBA8H/0fw
	70tUB9VYhtJestBtA9WfJBGHXltq+1IpLrPJ0SSMj+CNLte+dVHUWYJM3ehc72DjPylWVY8Xe9u
	PPCtXoSzsIcfEl1awLzusB/dwRQRS7GALXHO0F7GYBir8Jn40y2f1alzZymG6bp7I5Vul35R0bb
	VGGDPlx2Jvtt3xYM3qeNQyOXClhQS2UuUTZgR+9Nmkv2J5aSE0SFCqsmD6RgVtQ+cA==
X-Google-Smtp-Source: AGHT+IGslAg+kZSR5r1KLQpvpTAyqVFFwVIFqW/069qKCAdAOWTjgfmHSrr73Y4oBWMXmc3qhryGWw==
X-Received: by 2002:a17:902:8f92:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-235f16b216dmr15063785ad.25.1749086061279;
        Wed, 04 Jun 2025 18:14:21 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:bc6e:7ca0:2017:eae9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd908dsm110307055ad.59.2025.06.04.18.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 18:14:20 -0700 (PDT)
Date: Thu, 5 Jun 2025 10:14:15 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtk-sd: Fix a pagefault in dma_unmap_sg() for not
 prepared data
Message-ID: <yf7ehbrvjj46xl7hkjukygnvy5z3ez43ewqch2mksx2lmkd5of@kthk42zpjabq>
References: <174908565814.4056588.769599127120955383.stgit@mhiramat.tok.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174908565814.4056588.769599127120955383.stgit@mhiramat.tok.corp.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_181422_668924_CCC03CCF 
X-CRM114-Status: GOOD (  16.18  )
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

On (25/06/05 10:07), Masami Hiramatsu (Google) wrote:
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> mtk-msdc driver causes a kernel crash after swiotlb buffer is full.
> 
> ---
> mtk-msdc 11240000.mmc: swiotlb buffer is full (sz: 16384 bytes), total 32768 (slots), used 32732 (slots)
> mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=18 arg=0397A6F8; host->error=0x00000004
> Unable to handle kernel paging request at virtual address ffffffffc0001fc0
> ---
> 
> When swiotlb buffer is full, the dma_map_sg() returns 0 to
> msdc_prepare_data(), but it does not check it and sets the
> MSDC_PREPARE_FLAG.
> 
> swiotlb_tbl_map_single() /* prints "swiotlb buffer is full" */
>   <-swiotlb_map()
>     <-dma_direct_map_page()
>       <-dma_direct_map_sg()
>         <-__dma_map_sg_attrs()
>           <-dma_map_sg_attrs()
>             <-dma_map_sg()  /* returns 0 (pages mapped) */
>               <-msdc_prepare_data()
> 
> Then, the msdc_unprepare_data() checks MSDC_PREPARE_FLAG and calls
> dma_unmap_sg() with unmapped pages. It causes a page fault.
> 
> To fix this problem, Do not set MSDC_PREPARE_FLAG if dma_map_sg()
> fails because this is not prepared.
> 
> Fixes: 208489032bdd ("mmc: mediatek: Add Mediatek MMC driver")
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>

