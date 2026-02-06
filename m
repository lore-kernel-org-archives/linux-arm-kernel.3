Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FB3EE2087
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 10:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdIerPrJ5KZ/8FdB/rGbtRgqMXJEegZRmHjuudB0qjM=; b=nvZz6KPAGOknrtwh1cJvyBJQ1V
	nJnYtGNxhStyHXChLowRE4hW+6KPOQ9bO+KrakWu+22Q110RYxrL0GVHOnOP8UiIIeCM0iOmi+Dpg
	vTYqg1jPXi9pHWbexj/UNQeEIwqNTzIZ19DpVuEBjkgLhplxWUR8o/dDM7ME4fnrXzN73ugHqok65
	9RDJExi1DRGs7QrHZ/2xL9sc1tx7Ugzm0JgZ3YVEyJ7IHBcZ1N0TfDh7mW3YhOfUH1w9gmQu00cLd
	VgmotgnywlEtDjMcD4hK4XKQHaL9weTk5UUuxOauf/SNvxy/5pfhl/+Na0IcPVOakooEIUZ2YmfBZ
	kUXm5cmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIkh-0000000B940-2A8y;
	Fri, 06 Feb 2026 10:07:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIke-0000000B902-1UVl;
	Fri, 06 Feb 2026 10:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770372466;
	bh=9fuBPc9bEbfZELGhdzbq1jFtq+pJY6BEhn2yGGEDIqQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QCU/vuEhbGeqeSOEJFUbbfQ1ZstU0JYv3y5ZtuLxv0k/DgUWSBW4+xdDgR6BUBTcZ
	 lHX7rXNseGQJoCMR8R/rPpQpiHH6B/V0/6/hZ9ewN/SaAauuuAdJ3kqcbLqepdrkbm
	 /+tHtbIaBMDLWamHQPyuSOJzxX9SV4i3B02x1WSjRQ8W7/n5CBkQnhuPyiBBYJm3PO
	 XYhmc70gS2kTTGi5tQaEz9gjaZnnyOFPmvJwNIfvsC5bdKIvg7qRYLniCe2CXmFa0N
	 saQe+hexMwFxmB+ZqQ3BZ6qN7ylAhFt3Gzn5sC3E5aJkt5RndYdIxCHI51yibv0Cuk
	 5Stgn3C3MB3RQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 930AF17E1502;
	Fri,  6 Feb 2026 11:07:45 +0100 (CET)
Message-ID: <8d043341-9099-47b2-a1fe-538502e40f99@collabora.com>
Date: Fri, 6 Feb 2026 11:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] drm/mediatek: Introduce DDP plane_colorops_init()
 hook
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 daniels@collabora.com, ariel.dalessandro@collabora.com, kernel@collabora.com
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-1-0cb99bd0ab33@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-1-0cb99bd0ab33@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_020748_546097_5095CF64 
X-CRM114-Status: UNSURE (   6.93  )
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

Il 23/12/25 20:44, Nícolas F. R. A. Prado ha scritto:
> Introduce a plane_colorops_init() hook to allow DDP components to define
> how to initialize the color pipeline on their planes.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Just a nit for the commit description.

In preparation for adding support for per-plane color pipelines, introduce a new
plane_colorops_init() hook to allow [...etc]

Otherwise,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



