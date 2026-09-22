Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91427C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOIgHatIHLrv2JYlRas1UVhwebFVBfI/35oMsXcgnkE=; b=cVKlqgbCMCL7NOtSTh+rI6Tccj
	CMqULJgPqY2AmEz6xj0ofee+w0mo2uCZ2cu9KSF9Q9qBWXBocg+c4nmkhMpXVDBJNEfWn5cYE0xIm
	K6m8SM89M9jZYgjaDvg6c3r2Ib0qmzUs5z8Ni8IK3X7mZH1hTlUpaa4puWeBihwPewajvNAbxtmr9
	f9p/jbC/pjaRQ35FJUWjLiwTXTEFr0FP9cVwZrouWbLFrTQqX+H/QLueaJszoDGOEpNVrBE9Cxgqk
	bMxMq3n5vRTcqcYmP/ai8vh8PsLEqki3D6pypP3+BjD3lOsK/I6BFFMq8ZtXh4ysN2MOcjvml77ou
	+YtutuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yr1-00000005CBg-0268;
	Tue, 22 Sep 2026 11:40:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yqv-00000005C5x-1Tfa;
	Tue, 22 Sep 2026 11:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077199;
	bh=wXBz31YYAqZAgxYBge5P36ysNsF9WzmlFm5K4PaRbgE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=oE1ydEiXT0YFVSwwKAwRK1QjdOU8PyAEzxmKSShu5U0YKqp1bvu1S5Vbm69pIoR5k
	 SvId+xQbBPwc5wb5EhWDvjmP0RneGeoIbNs3X+n8S5yVjF1avpa0wXFk/yWeaZTkjx
	 fGMLlUz1vSjcaL6jN1Z8cNv6Lbtp4TY2ZHkUjClNTtdeigTh0/hPWFuBWljNce1z4L
	 8ZLVj1nG31VxEjFnlmxzn6rSGzq9x1S3xQGeSyZ0bd+KQHMr+3y0dMf9IofL3HtR0u
	 aegtKGbtJ+EcxdHw0+/fxlr96ICWP7wlPpocoRWBroUExx6fJCOSSYzQUIoPZLbbbE
	 u2tfVvONXUlbA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB4B817E0E01;
	Tue, 22 Sep 2026 13:39:58 +0200 (CEST)
Message-ID: <3d056e8f-2d03-4356-b205-f7c1fd47d713@collabora.com>
Date: Tue, 22 Sep 2026 13:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 08/12] media: mediatek: jpeg: fix remove buffer
 removal timing for multi-core
To: Kyrie Wu <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-9-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-9-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_044001_613559_B0CC7B2A 
X-CRM114-Status: UNSURE (   6.97  )
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

On 9/22/26 11:15, Kyrie Wu wrote:
> Move calls to v4l2_m2m_src/dst_buf_remove() inside of the spinlock
> protected scope to ensure all necessary operations are performed
> before buffers are removed from their queues and ensure proper
> synchronization of buffer handling to avoid buffer lost.
> 
> Fixes: 86379bd9d399 ("media: mtk-jpeg: Fixes jpeg enc&dec worker sw flow")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


