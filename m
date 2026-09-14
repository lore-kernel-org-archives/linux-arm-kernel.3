Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3C7C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ql5ehSkWJ4bvkoim8QgW1gX1cEzMuu4pWOWteAQ8rfk=; b=lfm94P57QlKu/ZmTNBA1V5UoPT
	2j5DmAKF0hpwRjVXcV7FEHbNGfxGf/w+W9cULKX78wdL59HvLU6ANEAyDcrRuO0pkIQIlOqz3Pl1n
	gtENfTA82wbkw0KH1z1bTurL17AvHxBL55Exc4ubZ2gb46qYWOY0xDF09NJAvO8hp8FilMfJ69WIY
	IQevWPFRY4A3rSeC5lkl4i0I1lCnMxSwhO1k2+RsWFGs4Ud5fEL4RPDKl19kw2gr7itsoP+ptC+Bg
	2H1fKINFkDr2IV+pBihuHrWvC2cikRPNq3KsoPP+QdbUpLZQCvoNxMzwCJg0IbrYkH+KU2eHnhPPd
	TxXm8dVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65MH-00000003S8i-3zuf;
	Mon, 14 Sep 2026 12:00:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65ME-00000003S7F-3rua;
	Mon, 14 Sep 2026 12:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789387221;
	bh=m9JcQKlRQjZVbqhQ2VHxzc4rLiM20zJgOt77Wk2JpRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DL28zptPOAtc3ROz1NSReXnmLvC9uHrd51vXm3BhIu5SY1RHWjwyyGf2zn4K4b3X3
	 /GG2a+EMVTAAGWDPSpdQymSJFflzKqTXJjWEeHxzs/F5n2tkftkuYh4xgqTItszt4C
	 bQ9ch3SP1E6EE2sXuhDzzKeCUp+NDbCbhPDfNSEfXCaA+8e+Qgh4hvLxdgztG3LDFT
	 jgxv0FfJ3JXfK4FCZUnqKEn7kpiXPbrEbgynQirlQXWvz4RnFUX+40jjEWiBEanLil
	 KGOhIE1fz1CMLRaJQMqmn63ghDrbfJwILs+CExOoaY/us3qh73ppfZoz3F09520ine
	 VS2Pfftwcx2Uw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 843A817E0074;
	Mon, 14 Sep 2026 14:00:20 +0200 (CEST)
Message-ID: <dcce7b12-edbd-4764-b154-ba178b74eb78@collabora.com>
Date: Mon, 14 Sep 2026 14:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi_v2: fix VID_DOWNSAMPLE_CONFIG
 register offset
To: Julien Stephan <jstephan@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 CK Hu <ck.hu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tommy Chen <tommyyl.chen@mediatek.com>
References: <20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_050023_112515_FFE7FF2A 
X-CRM114-Status: UNSURE (   6.04  )
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

On 8/28/26 14:10, Julien Stephan wrote:
> According to the datasheet, VID_DOWNSAMPLE_CONFIG is at offset 0x8f0;
> 0x8d0 is the VID_CSC_COEFF_0 register.
> 
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


