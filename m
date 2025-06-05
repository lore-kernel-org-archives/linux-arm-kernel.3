Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1851EC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 05:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwZLuUROZeytuTcbVvr5dTLUdGCZT6gaO3duMoVto0s=; b=ERf3Y+PCMTi62Kb2j+d3tF2FbU
	O+uyGg+eNiUMuNO6bAVOAlCxCxDsA+NDRfKSS57vonmEq/Rnv1V/DeqDeeSJ5xTwzxrpVYYpKhkdz
	krTHYYXF4A7Mabb9sYGjitTFqPKIbRb3GwtAaogAvTbcsAf2ap+BGsdPS1YRC6Fdrvlk/P+jP7lpt
	6yeYzJzxfaEmiIxwfsRfl6GQDGW73CUylLP+RX74OQw7DVgBZU+sKZXIM1JpUMNSyEmCPQ8JyN0qi
	c/w16zmQCYJYa1Tf688r0tYojR9B5XidA/FFmwfP/hPRtKPvqXl5l1FQcAP8Avlt5towtu8WpsGrm
	TNGS4meQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3dF-0000000EnR5-3miW;
	Thu, 05 Jun 2025 05:59:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3az-0000000EnCK-2B1o;
	Thu, 05 Jun 2025 05:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749103015;
	bh=WkkGM08VMW5SFQ/+XIX9f/SVjIxnmSZqqyIBTfQ8hC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D96Hid6Kq7JQS22naS6+/J1Gkoyyed/yJCJAXYhRomHGd88EpOq8yAz7u5mfEQb7N
	 E6YbQBMT0iTOrL4EVumEKOOji6CTok4mZqPDP1Ng0VI5rUrFjAgJ1FdmRLew5Z5cYP
	 drDyKTf5/1/E6r5vN5DdOTy/6j6u9gvjN/Wz0kqi4JcYht0PmSodjHV+VHtL4zzrCU
	 y0m40domMY+T8E2H6i9A+vL/zZzBAHhbe7og8/uKCDp6xCEWqFChcU9AmZamASRHVJ
	 BpvccimnTvVV3IyLv69tOEsAQQ8zjG13PPnHoW3Pb4opcT16e9DoQo5m/qUE0/Y24S
	 NPbKP/DBp/fYQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0361C17E010B;
	Thu,  5 Jun 2025 07:56:54 +0200 (CEST)
Message-ID: <f40e7b31-5bb2-4d1d-8687-6f728ea255be@collabora.com>
Date: Thu, 5 Jun 2025 07:56:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtk-sd: Fix a pagefault in dma_unmap_sg() for not
 prepared data
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <174908565814.4056588.769599127120955383.stgit@mhiramat.tok.corp.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <174908565814.4056588.769599127120955383.stgit@mhiramat.tok.corp.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_225657_710886_07C6CCD7 
X-CRM114-Status: GOOD (  12.49  )
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

Il 05/06/25 03:07, Masami Hiramatsu (Google) ha scritto:
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
>    <-swiotlb_map()
>      <-dma_direct_map_page()
>        <-dma_direct_map_sg()
>          <-__dma_map_sg_attrs()
>            <-dma_map_sg_attrs()
>              <-dma_map_sg()  /* returns 0 (pages mapped) */
>                <-msdc_prepare_data()
> 
> Then, the msdc_unprepare_data() checks MSDC_PREPARE_FLAG and calls
> dma_unmap_sg() with unmapped pages. It causes a page fault.
> 
> To fix this problem, Do not set MSDC_PREPARE_FLAG if dma_map_sg()
> fails because this is not prepared.
> 
> Fixes: 208489032bdd ("mmc: mediatek: Add Mediatek MMC driver")
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


