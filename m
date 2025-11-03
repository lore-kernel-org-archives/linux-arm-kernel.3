Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAF7CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1CE/ASXsIRjWuUnu0c8hgdb5wptP9A4/4iSGGy03BQ=; b=upHjdVRCeFx5jFmGyhc5qIAmby
	zp2qxOLz6Xt0D7GVOXYHxDfEx4aVd1H7d3FMtIXziS3/D62hj6XrUgnQhIAV6/Fuvf4vKdUe7P5BG
	OVqBlSQq2jWPubgjw1bUPPMnH1yQmImL7XOevKQrCRolfILVo1i/KdAw2iWEphNhgSXyAn5eiO2Xs
	h12wEWbF9Tt976jGNst/ZIiGdIUlSfEjralgvNMu9k/b5JpFkhRjZNFg7cPx/a6bMoaVhqH9FgIt+
	RwuODfa+NLfoTXz0guHuaX2hHQntRclhfdA/GKumXsJv2XShcRAcz37uDWinqk30Qk5K+plxe6/+T
	axwr9SMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFw6y-0000000A4mk-2SbT;
	Mon, 03 Nov 2025 15:04:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFw6u-0000000A4mF-3EV6;
	Mon, 03 Nov 2025 15:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762182281;
	bh=fVtluIbeBjbr7fW4cjAQSGDP0SUNMAZ8QABeO5dcYv8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MNht16rOJm0uEPV6QW8pJpQMbBjHB4vW1kmoKPUt+fZX3HWoDqTprbcqpG8ofuzyS
	 UjixtQ0+yii8ysd/iDJKXpQ8tbWnCb55DqV84SryBpWwaBTH2ErWx4d+JTSpVht1Sj
	 V2yzmqkrq50eoYiDV+1JDDHEb0KGZPaY2uknjtNr22WmUS+8prZy30qa0eusPqw7Qs
	 PRFAZnuuYy03LHYSkiwB7YZpGjRmQfMi3eN4ZM8Y21Q9fsOku89rMe9oaIWR3mIbOD
	 3Yxq80814QNRzW2VC7SvSZddTmeUsafKs+0WVzxs8y6kVDJtGH+NSiiNuKJ9PHZvS5
	 gIfyT5OjkpG6g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34AC817E00A6;
	Mon,  3 Nov 2025 16:04:41 +0100 (CET)
Message-ID: <0826821a-45f1-4793-94bb-575f08eac83f@collabora.com>
Date: Mon, 3 Nov 2025 16:04:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: mt76: Use of_reserved_mem_region_to_resource()
 for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251031175113.1453100-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251031175113.1453100-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_070444_968578_059FF924 
X-CRM114-Status: UNSURE (   5.01  )
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

Il 31/10/25 18:51, Rob Herring (Arm) ha scritto:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



