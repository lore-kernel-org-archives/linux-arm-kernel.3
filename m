Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8DED6DDC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 06:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74TOSSDm+PS8FEqf6ClWuGbANBPqdjyv4qB8j32Po7M=; b=o6QbOOPo9iVxhAbuJR+giZ3hB4
	utJxkO0AEP2gBLz+uBCxIoPjMhFBLRH3hlLx3Dmg1AtZag3oE5xyrBEpk98M5rXaKwdT6WxUTBuLR
	0evLoBAyxnMfE+fVDaGP1aellIsYJfbJFhhHyqMzdJkeKKv7F/SwFXyyM4MDJFfZjsEdYJ6AQ9keq
	dW9the4PwAeL5CaXsm92BxjEUQMz1rQKWi5dBU0oiCvO1kTBc8BToEBPmJb59RFmCoAVAYrpRF8e7
	s8zRaYq0M9N0vDOvV4AGgl3Fwp80WhbtD1ohtVVpBONCVBog19h9PozDCJipOB6ff9EJ/JOU7SRH1
	abNcXatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvgY-00000008aDB-1aeA;
	Mon, 18 Nov 2024 06:56:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCveI-00000008ZoZ-03jp;
	Mon, 18 Nov 2024 06:54:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731912852;
	bh=Z2davH3euLXzw7+JmOS0iNFu1RheIVz/v10S5oNSC4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JB1zCxRJ1gz78ADZYPJCeXUPq2IUttOwtcq8qjfQb5rGvUyPrtrq9zUFt6DDS+RRr
	 reKB0vfBrersIUELTShL1XDxmj08OzGzQc4hctFlBYvlShoo13vy0H7u1axYVdRINo
	 h99kkC36MLN2ARcdb+kRgLmvHPlioMhRtRdB7cRIhQibvtBmGX3PQJdnclABpHP2h6
	 KS8MVRVFguZJQY2WZrLMluCmWAiuG5lSdFJmS+e5J0dlE0MxQ/ULqcMZPfeMuVuZW4
	 awlmPNGnq3aS8mpfl90fjMCV+w/x2mFfXB/zGGqSIhbLL0hhpLj8qOcfQ49WF/eUYZ
	 L/Zvr7WDM0frw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE3E217E1245;
	Mon, 18 Nov 2024 07:54:11 +0100 (CET)
Message-ID: <f6fe51d5-eb16-45ae-b85d-c89ad874b65d@collabora.com>
Date: Mon, 18 Nov 2024 07:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Add support for 180-degree rotation in the
 display driver
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fei Shao <fshao@chromium.org>
References: <20241118025126.30808-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241118025126.30808-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_225414_234916_72E5DA1B 
X-CRM114-Status: UNSURE (   8.06  )
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

Il 18/11/24 03:51, Jason-JH.Lin ha scritto:
> mediatek-drm driver reported the capability of 180-degree rotation by
> adding `DRM_MODE_ROTATE_180` to the plane property, as flip-x combined
> with flip-y equals a 180-degree rotation. However, we did not handle
> the rotation property in the driver and lead to rotation issues.
> 
> Fixes: 74608d8feefd ("drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



