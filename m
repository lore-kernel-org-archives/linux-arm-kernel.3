Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B44CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 13:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+jrB+zMzNqMBdDvN4+tou5imejhnBWnfKj9A1+/y24=; b=xgJNGYgq/1LmwoPGoUT/Ydn96v
	6THmGv+7mJE6tgWBAaKDZvVNNWRif17cvxVMj6K4iuHuAIwBNtvetIgmdkhhBkclwV3k6EIjeWQuQ
	QcCDbjRnz0ZGtzggJ9HaJfpCMmXFvzGm8VZu5bleuze96IO2dXSaBYG0dZr1MT98GAH3gH+zMQPst
	GZaHDcYrkom6jp66pKPKH5P35Xv+hFlUjlr8wXHt/2SRDcnHPGJAQdyzcMrpOEU8eCyd6MqNOPdtJ
	BTkpbaIOaFVRrPwryo/bvWYZWTyzz69QFZhgryxF903yDcPLrt+yAcmZ9EeGirNJci1rkUplBzXdI
	xqpkSZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mT5-00000009gNP-0d3u;
	Thu, 25 Sep 2025 13:57:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mT2-00000009gKe-34q8;
	Thu, 25 Sep 2025 13:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758808622;
	bh=eVtI5KuXcf+iFYpz0dJERf2R3K4zLl1HHo6brVgQCa0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MtaN07ET/VwbJQu4G8dyeqXYDtfqBddMTc8oEZHCls7uBSIYJbgHnx2Fzgnxe+rt7
	 LSVNgv7S2WaVJQ2lBwoYVsDHyI1MR37vch0hdlS3akdvRPJ4CkKYQSnlQQVpTZCvZm
	 FFQVDXEG0bBIjZQdGl49Qy3k9vWX8xjP4hok44wu3DBYYDxFaagtXtsf+yf+uC7QSO
	 pGUWf8niVexakTQ9cWYwvRoefqeg3fIDf/nMccECXFBpwHSbdx/4V++OxpkSFzjKgW
	 IWEUK9s/AdF1A7WYo6Ds2HHayNod/xtVSvuv/QSAe7/a0GGmJg57rG3YyMQvzdmH9R
	 l7QPqppdNPacg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 059A417E0FBA;
	Thu, 25 Sep 2025 15:57:01 +0200 (CEST)
Message-ID: <719dcef6-a360-41cc-a5c5-fdbe53ec99d3@collabora.com>
Date: Thu, 25 Sep 2025 15:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/mediatek: mtk_dp: Fix hdmi codec and phy driver
 unregistration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, matthias.bgg@gmail.com, dmitry.osipenko@collabora.com,
 granquet@baylibre.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
 amergnat@baylibre.com, djkurtz@chromium.org, littlecvr@chromium.org,
 bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20250924103708.19071-1-angelogioacchino.delregno@collabora.com>
 <20250924103708.19071-2-angelogioacchino.delregno@collabora.com>
 <72pgsr4birfy5wtf5umsfkahr7tplnih5wxoj4x33igapaspmg@7iafkarq4hzg>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <72pgsr4birfy5wtf5umsfkahr7tplnih5wxoj4x33igapaspmg@7iafkarq4hzg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_065704_917876_F3AC7B67 
X-CRM114-Status: GOOD (  15.52  )
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

Il 25/09/25 03:09, Dmitry Baryshkov ha scritto:
> On Wed, Sep 24, 2025 at 12:37:06PM +0200, AngeloGioacchino Del Regno wrote:
>> During probe, this driver is registering two platform devices: one
>> for the HDMI Codec driver and one for the DisplayPort PHY driver.
>>
>> In the probe function, none of the error cases are unregistering
>> any of the two platform devices and this may cause registration
>> of multiple instances of those in case this driver returns one or
>> more probe deferral(s) in the "wrong" spots.
>>
>> In order to fix this, add devm actions to unregister those and
>> remove the manual calls to platform_device_unregister in the
>> mtk_dp_remove() function, as those would otherwise be redundant.
>>
>> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
>> Fixes: caf2ae486742 ("drm/mediatek: dp: Add support for embedded DisplayPort aux-bus")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dp.c | 30 ++++++++++++++++++++++++++----
>>   1 file changed, 26 insertions(+), 4 deletions(-)
>>
> 
> You can save yourself from all these troubles if you store the
> registered device at  connector->hdmi_audio.codec_pdev (see
> drm_connector_cleanup()).
> 
> And of course, you might use DRM_BRIDGE_OP_DP_AUDIO in order to reduce
> code duplication.
> 

Fair point. Noted! Thanks! :-D

