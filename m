Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBF9C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3egj3xil5t+2kEU59ZiuZ3tI+1HrouwDHvplqD1veg=; b=EuFKn/QHmo1SpiwoujwHEphf64
	yHjz+YVmsJ8qY1IAZbwgPkAmJ81DbaaVGP4Z+5tpbK+Va5GxdA2PYdjTyN8tJ07Ncu7ZBDGDuAilF
	Bi6VDK37j+Yfh/tyQG4XpSw44HAcJ6MmWsaxqqyLcJlsZeSA7ZQTLOCHRfqj55b8L0ciwvkIfJYOa
	y6LO1hxA57RTfSkHLvArOTwllwYVI4Cfz7FW1xOJ6F82NccBgyHem7q6DQL2i55oKSSch5U2qjq16
	rgyMIs4rOWQQI5yesOUGmoHaA1KzCUXO8ymIsQRYuyvDp4QJz8Xwc/BVnL882bg6d3GveMEJq4dz2
	+0VOMpVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwIk-000000004CT-31Bw;
	Thu, 08 May 2025 08:08:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwGm-000000003xN-33Xr;
	Thu, 08 May 2025 08:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746691574;
	bh=ZPSaHnlBmfL989bwMg4ZlSVegQ7uQgB+oa4cG3z5HbU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YCwYQMd9nunF9QpMZjc5MxjW95bgBcb85rbW9F+aY0V8MAL5G7M00D9HhSElzI9T8
	 hCskk2oIqljr9N61RBRuzKStTv+ojjhGKPT1l0n+HX86ITnD7qreGM/Afvb3sU9DsX
	 rpF0b3j/jt4jnQST4oOZbWBJuWnLpGM5HOsTSwinSqVGXi5S0kj3d0ykEcyIznorp5
	 psS8qjwj9456qzway+841+MvwYKPi8AbKqYZagO4QYrc5PYMgj7/IDtIjEWNwOyVfn
	 1vCm7JWZ9vSPP+qfmU30g0f+x/ER17M2aklGCy3ZAlxsp2DtR7qCryUQzzwBmaXRi5
	 Bi4+hTskYK3Ww==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2A34A17E0C0A;
	Thu,  8 May 2025 10:06:14 +0200 (CEST)
Message-ID: <fede9d2d-6225-4760-8920-c5963665ca1e@collabora.com>
Date: Thu, 8 May 2025 10:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: mediatek: Fix a possible deadlock error in
 mtk_cqdma_tx_status()
To: Qiu-ji Chen <chenqiuji666@gmail.com>, sean.wang@mediatek.com,
 vkoul@kernel.org, matthias.bgg@gmail.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, stable@vger.kernel.org
References: <20250508073634.3719-1-chenqiuji666@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250508073634.3719-1-chenqiuji666@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_010616_920068_B5B41A00 
X-CRM114-Status: GOOD (  11.40  )
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

Il 08/05/25 09:36, Qiu-ji Chen ha scritto:
> Fix a potential deadlock bug. Observe that in the mtk-cqdma.c
> file, functions like mtk_cqdma_issue_pending() and
> mtk_cqdma_free_active_desc() properly acquire the pc lock before the vc
> lock when handling pc and vc fields. However, mtk_cqdma_tx_status()
> violates this order by first acquiring the vc lock before invoking
> mtk_cqdma_find_active_desc(), which subsequently takes the pc lock. This
> reversed locking sequence (vc → pc) contradicts the established
> pc → vc order and creates deadlock risks.
> 
> Fix the issue by moving the vc lock acquisition code from
> mtk_cqdma_find_active_desc() to mtk_cqdma_tx_status(). Ensure the pc lock
> is acquired before the vc lock in the calling function to maintain correct
> locking hierarchy. Note that since mtk_cqdma_find_active_desc() is a
> static function with only one caller (mtk_cqdma_tx_status()), this
> modification safely eliminates the deadlock possibility without affecting
> other components.
> 
> This possible bug is found by an experimental static analysis tool
> developed by our team. This tool analyzes the locking APIs to extract
> function pairs that can be concurrently executed, and then analyzes the
> instructions in the paired functions to identify possible concurrency bugs
> including deadlocks, data races and atomicity violations.
> 
> Fixes: b1f01e48df5a ("dmaengine: mediatek: Add MediaTek Command-Queue DMA controller for MT6765 SoC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


