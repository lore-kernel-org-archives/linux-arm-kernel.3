Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4153EC678DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=145n8WIzUPF9JeXH/ofUgDfxC781KpeLkdBQPlloAZA=; b=lzUSfFfiS30oiEHU0NLC1fdKzQ
	Ii7yBXntgq8EgWKURvvSCURz7LBuNLDoJEYOgkdHNG1T9PQZTFUT0e8NmjQoADmFUWtBp9IAvSlLt
	iDPNHT0g0aGeJe7gPC1Lv9v8141uAWa2F636+u33bt2lQwehzfYJka2JLaI72bvPEsf9EtKbejEiA
	85AURaB1rM4zkn6iIV8JOoS1lzIhn0QjKy8F/W0qe4dloULFg5wMw875fZAaH5UFOk+tXfV8xXkY4
	lDnS3/P17hrsiRefDN8soCJK1WVp1Q3flNwXKoghYfOh9U5ZySoUYkRtd078ll+2F03rJPCbXXSbv
	vkSXZI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMkc-0000000A9KU-1JmB;
	Wed, 11 Jun 2025 14:48:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGts-00000009HMd-2JbB;
	Wed, 11 Jun 2025 08:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749630814;
	bh=BUbdxVLJuS4fYAYAMWAmKlXzifES1ZREElljdWotK8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MLHxkMMm3Hua6frP7w6apjFbxOH+2rWBBkuLeRsn4k+NHtk1y+ngba1mdk+aq3N9J
	 g/uYluVcm8JwfuatvfvZbAKql1NHFo5TmcnVNir6KBVG5iPq2F2bw5syV1z5DHYL2C
	 v5A0jXbjazNOFx3fpGK5hpsTYuAK6dsEVtX9ARcbfByyf8upTEqYuAU7nDp+c7pqch
	 HtPvfn2EUysuDah6+xy31icKlZosKLis9eKWy9y3xnW8zMJlBWByM4zLkmkcahK4cy
	 lMY6UwoImu3hdQhmytu/NWU64U9GHofr4hLCDqq3vHsC8XRtjJDqCsjtNoCyVNnrfd
	 HSDLqLaoeIvYQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 592C217E02B0;
	Wed, 11 Jun 2025 10:33:33 +0200 (CEST)
Message-ID: <e492fb4d-2899-4b63-b69d-1e922c3807d2@collabora.com>
Date: Wed, 11 Jun 2025 10:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] media: vcodec: Implement manual request completion
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org,
 Sebastian Fricke <sebastian.fricke@collabora.com>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-4-603db4749d90@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-4-603db4749d90@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_013336_745386_40FE111C 
X-CRM114-Status: UNSURE (   9.65  )
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

Il 04/06/25 22:09, Nicolas Dufresne ha scritto:
> From: Sebastian Fricke <sebastian.fricke@collabora.com>
> 
> Rework how requests are completed in the MediaTek VCodec driver, by
> implementing the new manual request completion feature, which allows to
> keep a request open while allowing to add new bitstream data.
> This is useful in this case, because the hardware has a LAT and a core
> decode work, after the LAT decode the bitstream isn't required anymore
> so the source buffer can be set done and the request stays open until
> the core decode work finishes.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



