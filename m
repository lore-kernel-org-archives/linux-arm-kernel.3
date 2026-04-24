Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4A3FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 22:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqL2mlSpUN8CVPORkmc2oKWN9yGLQSNrcwCUuZmT0D4=; b=tFXK+QFpMGzDrjpth4P/Ek3l+C
	GhtMFECHXmHSBpC01n1lwsbgVnWo9H4jTmgNbPu/WFDkeipNx92FthmrdOk5mwmwUGHNyATQROG1r
	YLlJr7Y/0hV7b9omxUsFkLt+cdWbNQuciIcGKeE0YhO334kL1mMlLC43vYt2o9WgMF6IRACdolIGn
	aEVGDiLIJjTZ8jNQz7qE4EpRkb9VL6CAWmEV9XUvNj3qbImLUTADDLqrRWda8oH0POa0PtfqY9xfU
	9+o05MMjQrmaAM/acul05k4n8/iFaQhKiIlbemAkwBQgdQze8wTcSu6AQpFApHBfSOw2rjgE6du8D
	w/pZrK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPRT-0000000DrT3-2sMD;
	Fri, 24 Apr 2026 22:56:11 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPRR-0000000DrSI-14WO;
	Fri, 24 Apr 2026 22:56:10 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4g2SxN4ZKsz1XM0nq;
	Fri, 24 Apr 2026 22:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1777071361; x=1779663362; bh=lqL2mlSpUN8CVPORkmc2oKWN
	9yGLQSNrcwCUuZmT0D4=; b=MaZ7L+BVDIGalsO2C+WMEUaOVXljHEzOzXoIN0gf
	rHH4rLLwldCCavvU//v2uWVb8vKV9/lU0K4wLEOJ/zEET93cz/4/ZDxbsorCuV/K
	lr0fHZWY/69m4uFLZQXIbh1Tv8sOPoFWCxvvKUw6PIFlheYRJiq67dYL9Li9kKPV
	wN/MxK3JLXCik76EpganxgnUlVk6FC9zGIVFc01NdK66v4FC8jpcgzC0zQCq9Ujd
	ZudzmHryZa/xQreq6gmExLm3/4LjIBMp1m9fuVrBExkiQNfn52qZmwDjMaTcatRF
	cP3GLhmf+3c8pw68hD8Nj448uolKIAsWObabFjpaoxH0Ig==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id GasHTLTR0J09; Fri, 24 Apr 2026 22:56:01 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4g2Sx93WmYz1XM2FN;
	Fri, 24 Apr 2026 22:55:55 +0000 (UTC)
Message-ID: <a496a84b-66c8-452e-99b6-622550afeae5@acm.org>
Date: Fri, 24 Apr 2026 15:55:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Revert "scsi: ufs: Use pre-calculated offsets in
 ufshcd_init_lrb()"
To: ed.tsai@mediatek.com, Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Avri Altman <avri.altman@sandisk.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 peter.wang@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com, linux-scsi@vger.kernel.org
References: <20260424063603.382328-2-ed.tsai@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260424063603.382328-2-ed.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_155609_337469_F72E63DB 
X-CRM114-Status: UNSURE (   6.72  )
X-CRM114-Notice: Please train this message.
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

On 4/23/26 11:35 PM, ed.tsai@mediatek.com wrote:
> Note that these DMA addresses are only used in ufshcd_print_tr() for
> error logging, so the impact is limited to misleading error logs.

Instead of fixing these offsets, please remove the ucd_rsp_dma_addr and
ucd_prdt_dma_addr members from struct ufshcd_lrb.

Thanks,

Bart.

