Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1CBE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Bh1FBjZZWMzXdrXAckB33Nihe+sKbFi1T/vD5LdVG8=; b=XAcMkRpLI6etjYmJnxHvfCKWO6
	z8GoJD/31oMnLUOog9hT08mskgQYnAGJoUUWWB+GIe5NdMLVlZc11QLFeZRPujCB/Dpr/BpBze7X7
	QIykbRgjRW3GmkukHCBXZkfCmo4x6PZVUWbtQkTq+nLNUT8Pe0dm19jYIl0ea3hOHgGnkJSTNzaFx
	16xL4GpUkknK9fh1q7xWlsa220QKTRT6eiRHn8XCywZsjeRx3pM9KamqN372QCDH+btV7xNYPaN9v
	NnbLDFUY3RCnitbLP3XRxxGayL8PpJ/g66KUq5AjefUorv7m97414Ako2vU8MpGGO4SIIXWrIrffb
	BS742nXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb8a-00000007KFz-3xvR;
	Mon, 09 Dec 2024 10:37:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb3F-00000007ING-39To
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733740300;
	bh=k0uZ2UEiQzgNKBRrB48UKpg6beGJR/i+NshtGEJDMvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DOSzIIbxNs4m/3Mx4eetw8fASpCfbWVS8J/to0FOK37EpAjqQpT//KZQ6ws7Yr2nZ
	 3He80xCGICgu2tUehGh4YwyO6Ola5AwNN0q4mEwR6Hc4dxR6K8qTpQpS1PQS2uqyrI
	 T2TEoT7mvCYR9l90aBs6w4pYB0/i0Qzn5wPt75XgIgTUqdzkPHVBHKVaf+pHOz+aj+
	 sbeijpuLLkSiggw6x4tTrTURF0LzQ/q22GzB7u8UOxYv0Rtuvw16NIYOpbvresYkcr
	 Kna8YTPCkXCmHQd1pcDO4cK6QEslLYCMbhK922NP8JfYW08kQKUbFdbTY/GD2qqvnM
	 qnJwUDAF0JKbQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 73B1117E09C0;
	Mon,  9 Dec 2024 11:31:39 +0100 (CET)
Message-ID: <5d722361-5ea3-4734-a2af-41aa8c2eab0b@collabora.com>
Date: Mon, 9 Dec 2024 11:31:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5,07/10] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20241130-hdmi-mode-valid-v5-7-742644ec3b1f@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241130-hdmi-mode-valid-v5-7-742644ec3b1f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_023141_934848_D2E6991C 
X-CRM114-Status: UNSURE (   7.52  )
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

Il 30/11/24 02:52, Dmitry Baryshkov ha scritto:
> Use new drm_bridge_connector_mode_valid() helper if there is a HDMI
> bridge in the bridge chain. This removes the need to perform TMDS char
> rate check manually in the bridge driver.
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


