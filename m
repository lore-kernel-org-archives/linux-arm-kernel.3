Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A4CCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 15:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oo7DpZ4wl1wswOWuSb4aFqE1cYvWje2320z/a0W/Glo=; b=4C9toRIP5r8IWDaSvClwKA9i9K
	3DlLfKPCm5+LzZwZiIdtv53UjQu+yVI4fNehI38ZiIqj/3G1hpwqSJ/DV2N5uQuIH2u4hf/AdkXzJ
	4knnim1u4AWq89QGVQrY1SUhGLtnQnyHV2o9MaQB6rzvXDtBtp7lII4lfvmHX6fVSRq28WJ08NKSc
	Dxe18ha8q8o8IbzWAHQ0jp6Hd4eoBqOWvncUCVUSlgtb+0VtANkuPL4ZCOdXSfOUuZgCcLheUv3Gr
	R5ZYO96Q7xr720PdnViviI0SfhYUO28Is3klmwb5QhrSxVSniLArafbJEP37B6tsLg/l/BwhTeih7
	v7NkEPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAs0V-0000000EAzZ-1ynn;
	Mon, 20 Oct 2025 15:41:11 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAs0S-0000000EAxv-3T2E;
	Mon, 20 Oct 2025 15:41:10 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cr05752FhzljBC1;
	Mon, 20 Oct 2025 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1760974855; x=1763566856; bh=Oo7DpZ4wl1wswOWuSb4aFqE1
	cYvWje2320z/a0W/Glo=; b=vDdO+gK/7aLRcCYqexOk3vyB/qSdU1m71g/jSNSO
	WYA7nKpxkNrQs127L28ptZvN9LWzUJPJ3+/+/p5fjrZ8A/kEhFnrZ0MmpZv+1xvZ
	jMPv5odsVYbu6k5lpHWYCNVk/XAukCt0PnNiQGH0m7fI9/fJ9pOl0OllpUnL32sC
	FNMkeCMTD8CMgozwVMuqptLt8ntFgux8f5TpK1YO7+hlUr6BVn0buBxm3sJLkIlu
	Nj5FKVfHkAzQzi3hyYky5jWXqaHBORTRYJ/3f2TlAWRu/mCIs8xMz2opfK/tNJJb
	BPYpqW1A1UYXVV7F1JzmDKyz2vUfouC+TMJ5Nhr4bKWAiA==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id AT_bPrdYl-hz; Mon, 20 Oct 2025 15:40:55 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cr04l5K2pzlgqVl;
	Mon, 20 Oct 2025 15:40:38 +0000 (UTC)
Message-ID: <05167a77-f34e-4c75-aded-3c907c4ba446@acm.org>
Date: Mon, 20 Oct 2025 08:40:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] scsi: ufs: ufs-mediatek: Add UFS host support for
 MT8195 SoC
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_084108_955119_68E306C8 
X-CRM114-Status: UNSURE (   9.23  )
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

On 7/22/25 1:57 AM, Macpaul Lin wrote:
> Add "mediatek,mt8195-ufshci" to the of_device_id table to enable
> support for MediaTek MT8195/MT8395 UFS host controller. This matches the
> device node entry in the MT8195/MT8395 device tree and allows proper driver
> binding.
Please always include a cover letter when posting a patch series. The
cover letter generated by git includes helpful information like a diffstat.

Thanks,

Bart.

