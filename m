Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FF4E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wMbh6rvYZVSfKIY5b2H9creOl/KFkpSykqtHarjLk0=; b=3SNxqAPVD5qkgo37AhK+aa0hc1
	f1KIKrdW0rDHnyFXxCRKKskfpReNc4R4A2z07ea++4DnPuIdFGpe3iSH+lq+QtuauOOzYVq+yXNmp
	dQkA6zJPNWMSVwoa7QW0gcxab+ctGf2IrokIWVyO2cX7hJuJYe5p257PL5nFjQFqHH3TRHrnu4bCG
	z0kKkIsu+nZios2sFmEeTdb7OHuaIOb5R4bnwPKOgLLALgxi1B2j6BBquJczTMgSLmetku30FFTKM
	ke2GA3cs5ytF7zTiP+HJmBBwW/cvzybQOGY+JRc4m4PZ/hg7bblByK13PAsoUo2CtAAcq4f2fWU2l
	ax9GEWNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbCe-00000007Lb4-2XUN;
	Mon, 09 Dec 2024 10:41:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb3T-00000007ITg-2RvZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733740314;
	bh=eoxD+MuxeUWnPi1TZIMlO0bSaVXPjRZntQfrGLycbFM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gLTgnQnBrQOHXgTiFEqwaP4J7pXZPhJWiHMKVa35ctJD/pScumBvQ1i89CcDXlDbe
	 uN2VLWMSOdsVPLLkxto2GuhU6oPFn3FReMvaKz8dXEu9OSjcSWIyLtoIbWkS0jmfUv
	 SrElDBoxZBKSTdZRW0qmmqQrsprgejfg4Oj2hPgiC5BPZcqSV82TQnplbEp0bSSIRp
	 CKac8ygzUqjD23HO22QD6DVSWHbt5jLvG9SY/ysVJ1yPVpQOfB9h4FHomPHe4WhnSy
	 Tf3osirrGWXboRb3hJ59yPQeodODSsWp2RJppVS+b1IWGusHJ77QteY45S1ijSCSfT
	 Z1ybLX9ITLpxg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 51B1A17E360E;
	Mon,  9 Dec 2024 11:31:53 +0100 (CET)
Message-ID: <2cafa6a4-1f18-4891-9626-f7e5b83a4a3e@collabora.com>
Date: Mon, 9 Dec 2024 11:31:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5,01/10] drm/tests: hdmi: handle empty modes in
 find_preferred_mode()
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
References: <20241130-hdmi-mode-valid-v5-1-742644ec3b1f@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241130-hdmi-mode-valid-v5-1-742644ec3b1f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_023155_766690_844167F5 
X-CRM114-Status: UNSURE (   7.17  )
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
> If the connector->modes list is empty, then list_first_entry() returns a
> bogus entry. Change that to use list_first_entry_or_null().
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


