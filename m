Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F66C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZ7m14nglimJsIUJImK3pMgdcUp8p6Dy4xZ9KKZFCzA=; b=GX0W8CWs6+FSUE7QTOk1i0D29/
	uAb1hS7GROALonl/gtD3QO/GTtt6kl6hOD864LZFIqPa2QSzEY45BGKkkYbOQtWOpQU9vvJJC+SXC
	z00LONHDttIkFbd04C4YJO5+RjivwsLwHjN0hInIffqWtsEbnBerEtKOzFqtVftO+wBTt5HP17CeK
	abh5SG7N8pHsbTcrs7qXfE0rR0LqhJYRclw/cYniacVKFfI5JnNkE09aNR4AQejLr+lTEFUCLhdQG
	lWF4TyNv/k7Hx3FmFyu4sre7uPIy+BxgnS3pyh1+s/9AbcYE/Wg+V3aa8cp/xQI0KoBDltMtiv8t6
	h2WumMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yrI-00000005CYr-26tg;
	Tue, 22 Sep 2026 11:40:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yr0-00000005CA1-12sH;
	Tue, 22 Sep 2026 11:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077204;
	bh=g+uWp8GE5+l5SIkEyY6Vib3qVErtfIu+oq4xkgSWvfo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CvNIdMLdkrFipraKmV6ceiqmuuxTu0xed6CBvGQspKvg4IOHdqZPUou/SFPp96iNn
	 IpDM9+bPlOCDV8PDGQA7zUpHgmStWsRT5uf+Zg3D+NXfflPVMWbyz716mpHSkaeeZ+
	 FKq1U6s9tCaJc6mnkBrVKKbJWs4Z8dVkwBp0Tcz4Cmyzt37YcKMKxY2a1MrQQhnVXf
	 uAvNbgb8Ay9p6hctPP7tDqIx6sIjZwjBWHPxhaJcNfvV1juwKYOr2VOcm0bEbsOnTp
	 rd1g2BHZMXemIbqgiQCIQVJ/X6hpNSq7CtKpgM3F6WL7/FL/e9epS+1IC2pk8jJzHP
	 jy3jEO9a/V5wQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C5E4017E03B6;
	Tue, 22 Sep 2026 13:40:03 +0200 (CEST)
Message-ID: <193cb5ee-09ea-4105-90ab-3968c796ff86@collabora.com>
Date: Tue, 22 Sep 2026 13:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 06/12] media: mediatek: jpeg: fix buffer state update
 timing
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
 <20260922091530.241762-7-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-7-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_044006_451674_F6107593 
X-CRM114-Status: UNSURE (   8.57  )
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
> Update the destination buffer state only after the decoder has selected
> a hardware core and resumed its runtime PM state successfully. This avoids
> assigning frame tracking data to buffers that will be returned early, such
> as when a source resolution change is detected.
> 
> Protect the destination buffer state update with the hardware spinlock so
> the completion path observes a consistent context and frame number. Stop
> walking the done queue after completing the next expected frame, since the
> remaining buffers still need to wait for their own frame order.
> 
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


