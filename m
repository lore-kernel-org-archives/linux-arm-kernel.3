Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2656D5B847
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 22:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVirlTRNThIlw5izD//IoFLz8dbGPSlaVi5YQ6nWJuM=; b=nWHcGzcgjz2Q6Zb1tfem0M/sur
	jCyLPDQ1EQgPTe8pJFJMTFktkEGPE9vvpGhugX7IO2qWVhMR8yGzE1s8mdHDeMzK3fmYL4Q2bPvpq
	h+B9tcgcSux4BLE09Q9+BUwVuyLbpIXv7pQPppwM0M/IaS1BrR8+4DwPXa+UlNHtl/jigOHQzMgxK
	YTob3IIc2o1Mrwpt4pc6eglV/xFeLdLbKuasRWbifkNpFeCnd15NN3Wh7rMljI7Da94jHt77lJRC0
	Sx/yhNGjlZQ+JkihhSP0R9dPrmctvPksgzAVKD+FH3fXKJdrbFxBwSRcYswo8FX9aul/B4IW1LjVI
	Wcvp5FmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ygi-0000000CaJ2-3i1f;
	Mon, 28 Oct 2024 22:58:16 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Yf7-0000000Ca8c-0pAj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 22:56:38 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5c96b2a10e1so7515752a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 15:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730156195; x=1730760995; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XVirlTRNThIlw5izD//IoFLz8dbGPSlaVi5YQ6nWJuM=;
        b=vSk4BlU/7cv+aCukSqDv4Dad8AtTbzQxhFbM4hpvEvgzkghFowNC6hEQztFTgrqYuJ
         PuXAwSkTOMrHd6LVyBdjvfSEB+JapiTJNOzf0hdjRgO6jaULS1oJ81hbIMMHw6hpaAbF
         HpDlD3yrbdoodz6a1H2MI7e5wNJKL26wOPlh83yNKnS7HYfqPtbE432vkxfzUTRbEQKv
         XgvE2PPCeEmBQqhf4MbZxQ/fl1HuVHevurPBjLc3cMe6mCe+fPE+vb0q97TThAFaTIto
         BPDfJ+OqkxL0TeKVeUGaunl/3H/o3pWGKHsffvtvQciGlX4hTs29L09fP6GJvxlAdmut
         WEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730156195; x=1730760995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVirlTRNThIlw5izD//IoFLz8dbGPSlaVi5YQ6nWJuM=;
        b=ZxnbQe0mPg6MmS+B6thDmW37xPAwUuUu3mj1fhOnId7IHyvJBZSQRg8jZXht8FZXee
         EKRDUeJpBV4TUV4/7HU/SCzAczO76HubYBZd8V0e2FWYNP0mbcqXgbr404cnVy3bPENh
         Pd/PD0AQl88XlZb8QTRK+4rzw9v8xrlrZPn//y53Ld90UemkKtHEODy8GfDrCSMmODy0
         /aE0f2u9r/u9dW4gZrsZrjkKXvezWt6ALzZLgbeCsjNK+yWHegeiqxpJmvHqmTbwYRWR
         wIU1hlUJ6cDLBV3XMA9NiSDzhUJNX1drLYLsbzacYPFdBZuOe/O7Y/pdKBvKpXDCEpAS
         /ixA==
X-Forwarded-Encrypted: i=1; AJvYcCVIMdJD3u0PjGBABihnX2t+auE+noJMKVCWbKZshp8OxNofb3N5CoFXjH+ZlUDBHRJDwUB9Eydubtmu7FfoG4ZU@lists.infradead.org
X-Gm-Message-State: AOJu0YwL3ZYYAIwMKN2zTsOJyxu8eZWqoUgFzOEYGbmqFtZ9n6KVxKln
	aTIrWwFzsdoEEUOWTbC16xDL0l15kpmjljWVzY5PKxXHwY9EXqhC7n0Q3erFy7Km/nLY1yYXrn2
	j0Femlolx5DIkErAPnqGxiAAz4S0B/N+YEkPWLw==
X-Google-Smtp-Source: AGHT+IF+nARq3xO0Wchcpvg4D+JUkbPZjSN4wHXbnO04jBNcQohZsJW3DXYyIkia0+QEiSgA8N9blw/TGhiEe8MkXiY=
X-Received: by 2002:a05:6402:13c7:b0:5c9:547d:99 with SMTP id
 4fb4d7f45d1cf-5cbbf889742mr8302467a12.2.1730156194611; Mon, 28 Oct 2024
 15:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1730136799.git.robin.murphy@arm.com> <831CC29D-3B89-4091-8145-0E310FF838CB@goldelico.com>
In-Reply-To: <831CC29D-3B89-4091-8145-0E310FF838CB@goldelico.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 28 Oct 2024 16:56:23 -0600
Message-ID: <CANLsYkyUCwb5RF378VWwW0axiOU1RT4oTa_sTTL+jSqVF5DawQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mchehab@kernel.org, 
	andersson@kernel.org, Beleswar Padhi <b-padhi@ti.com>, 
	Andreas Kemnade <andreas@kemnade.info>, iommu@lists.linux.dev, 
	arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux-OMAP <linux-omap@vger.kernel.org>, linux-media@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, 
	Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_155637_295872_9C15CEAF 
X-CRM114-Status: GOOD (  17.31  )
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

On Mon, 28 Oct 2024 at 14:46, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi Robin,
>
> > Am 28.10.2024 um 18:58 schrieb Robin Murphy <robin.murphy@arm.com>:
> >
> > Hi all,
> >
> > It seems omap-iommu hasn't had enough mainline users to avoid bitrotting
> > through the more recent evolution of the IOMMU API internals. These
> > patches attempt to bring it and its consumers sufficiently up-to-date
> > to work again, in a manner that's hopefully backportable. This is
> > largely all written by inspection, but I have managed to lightly boot
> > test patch #3 on an OMAP4 Pandaboard to confirm iommu_probe_device()
> > working again.
> >
> > This supersedes my previous patch[1]. Patches #1 and #2 are functionally
> > independent, and can be applied directly to their respective trees if
> > preferred.
>
> I can confirm that this series works on omap3 with v6.12-rc5 and
> Camera is back to the GTA04.
>
> So you can add:
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
>

Many thanks for taking the time to test this, it is really appreciated.

> BR and thanks,
> Nikolaus
>
> root@letux:~# dmesg|fgrep iommu
> [    0.522613] iommu: Default domain type: Translated
> [    0.522644] iommu: DMA domain TLB invalidation policy: strict mode
> [    0.525177] omap-iommu 480bd400.mmu: 480bd400.mmu registered
> [   10.752563] omap3isp 480bc000.isp: Adding to iommu group 0
> [   10.811218] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
> [   11.039489] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
> root@letux:~# dmesg|fgrep .isp
> [   10.752563] omap3isp 480bc000.isp: Adding to iommu group 0
> [   10.841522] omap3isp 480bc000.isp: supply vdd-csiphy1 not found, using dummy regulator
> [   10.948577] omap3isp 480bc000.isp: supply vdd-csiphy2 not found, using dummy regulator
> [   10.990814] omap3isp 480bc000.isp: Revision 15.0 found
> [   11.089324] omap3isp 480bc000.isp: hist: using DMA channel dma0chan15
> [   11.115905] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP CCP2 was not initialized!
> [   11.168792] omap3isp 480bc000.isp: isp_xclk_set_rate: cam_xclka set to 24685714 Hz (div 7)
> [   11.220062] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP CSI2a was not initialized!
> [   11.291748] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP CCDC was not initialized!
> [   11.362152] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP preview was not initialized!
> [   11.404266] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP resizer was not initialized!
> [   11.485687] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP AEWB was not initialized!
> [   11.520874] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP AF was not initialized!
> [   11.574981] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP histogram was not initialized!
> [   11.594268] omap3isp 480bc000.isp: parsing parallel interface
> [  106.102905] omap3isp 480bc000.isp: -------------CCDC Register dump-------------
> [  106.110595] omap3isp 480bc000.isp: ###CCDC PCR=0x00000000
> [  106.116973] omap3isp 480bc000.isp: ###CCDC SYN_MODE=0x00031704
> [  106.123657] omap3isp 480bc000.isp: ###CCDC HD_VD_WID=0x00000000
> [  106.129974] omap3isp 480bc000.isp: ###CCDC PIX_LINES=0x00000000
> [  106.136810] omap3isp 480bc000.isp: ###CCDC HORZ_INFO=0x000004ff
> [  106.143615] omap3isp 480bc000.isp: ###CCDC VERT_START=0x00000000
> [  106.149932] omap3isp 480bc000.isp: ###CCDC VERT_LINES=0x000003ff
> [  106.156799] omap3isp 480bc000.isp: ###CCDC CULLING=0xffff00ff
> [  106.163299] omap3isp 480bc000.isp: ###CCDC HSIZE_OFF=0x00000a00
> [  106.169616] omap3isp 480bc000.isp: ###CCDC SDOFST=0x00000000
> [  106.176086] omap3isp 480bc000.isp: ###CCDC SDR_ADDR=0x40000000
> [  106.182708] omap3isp 480bc000.isp: ###CCDC CLAMP=0x00000010
> [  106.188598] omap3isp 480bc000.isp: ###CCDC DCSUB=0x00000000
> [  106.195068] omap3isp 480bc000.isp: ###CCDC COLPTN=0xbb11bb11
> [  106.201507] omap3isp 480bc000.isp: ###CCDC BLKCMP=0x00000000
> [  106.207550] omap3isp 480bc000.isp: ###CCDC FPC=0x00000000
> [  106.213684] omap3isp 480bc000.isp: ###CCDC FPC_ADDR=0x00000000
> [  106.219909] omap3isp 480bc000.isp: ###CCDC VDINT=0x03fe02aa
> [  106.226409] omap3isp 480bc000.isp: ###CCDC ALAW=0x00000006
> [  106.232696] omap3isp 480bc000.isp: ###CCDC REC656IF=0x00000000
> [  106.238830] omap3isp 480bc000.isp: ###CCDC CFG=0x00008800
> [  106.244964] omap3isp 480bc000.isp: ###CCDC FMTCFG=0x00000000
> [  106.251434] omap3isp 480bc000.isp: ###CCDC FMT_HORZ=0x00000000
> [  106.257568] omap3isp 480bc000.isp: ###CCDC FMT_VERT=0x00000000
> [  106.264251] omap3isp 480bc000.isp: ###CCDC PRGEVEN0=0x00000000
> [  106.271606] omap3isp 480bc000.isp: ###CCDC PRGEVEN1=0x00000000
> [  106.285400] omap3isp 480bc000.isp: ###CCDC PRGODD0=0x00000000
> [  106.301147] omap3isp 480bc000.isp: ###CCDC PRGODD1=0x00000000
> [  106.307220] omap3isp 480bc000.isp: ###CCDC VP_OUT=0x00000000
> [  106.326019] omap3isp 480bc000.isp: ###CCDC LSC_CONFIG=0x00006600
> [  106.340087] omap3isp 480bc000.isp: ###CCDC LSC_INITIAL=0x00000000
> [  106.358001] omap3isp 480bc000.isp: ###CCDC LSC_TABLE_BASE=0x00000000
> [  106.372985] omap3isp 480bc000.isp: ###CCDC LSC_TABLE_OFFSET=0x00000000
> [  106.379882] omap3isp 480bc000.isp: --------------------------------------------
> [  118.617980] omap3isp 480bc000.isp: OMAP3 ISP AEWB: user wants to disable module.
> [  118.626068] omap3isp 480bc000.isp: OMAP3 ISP AEWB: module is being disabled
> [  118.633392] omap3isp 480bc000.isp: OMAP3 ISP AF: user wants to disable module.
> [  118.641937] omap3isp 480bc000.isp: OMAP3 ISP AF: module is being disabled
> [  118.649627] omap3isp 480bc000.isp: OMAP3 ISP histogram: user wants to disable module.
> [  118.658508] omap3isp 480bc000.isp: OMAP3 ISP histogram: module is being disabled
> root@letux:~#
>
>
>

