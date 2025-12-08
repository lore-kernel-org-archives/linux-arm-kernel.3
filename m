Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3497ED3B7DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 11:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SghhlTO30+SL04MDr1vTqeGFa/2+rxDdJut1zd2NBKA=; b=x2lTMIv6fjLrC5FanEWsbzGcNX
	aW6Ixry+T748vkjfxBkeocG03+HHK0LHAHT9ieJGdJrrM7R0W2dayO/TYu3SbeqK8hE3TAglED5lK
	AC4UOgHMsoPjX8dAtcpRnQOvlS3ZH1ayk2/DUaE2bq5FypL5UKBryc6iaiz/ZKDaeQKCZCKYMt8jW
	6lDcf+S3fFrwZUhzrrT1cl1XboAcu8tUb96Zf9kMQJEgPSyzTSFqsN4iGaUQ+3MfR0E3pnyUcWbM6
	elKqX//IdjL6vCWf6JRfhpG9WS+5XEjxyTQ0NhJnrnmdgGzV+myP/U04GmBDRxxzOE5azxLV/Iakv
	MKaiwZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZ4N-0000000Czdr-2cBt;
	Mon, 08 Dec 2025 11:06:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZ4L-0000000Czd2-0lKS;
	Mon, 08 Dec 2025 11:06:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 608BA44418;
	Mon,  8 Dec 2025 11:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F8BC4CEF1;
	Mon,  8 Dec 2025 11:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765191973;
	bh=+Sg4+xUyee1JdQ9aNzal0X1KGSxSHxdpxDRWre8j8BY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=IOm4weY7TQGzaGOq9hS9L4Rw5s5O2X4t18f++QMBkFetLbd9WX4JEk2F+x+p39to0
	 wki37JFXH/Zr+f+T5z7MmQA6fpjGF6GUrATz9sWrHV2JAaUU395O7VU43JpztG1mpq
	 KgVegQPaV2r4vuEohxqhODX7VQvhZALfdSCINStSM393Ks9noAyLTs32hY6a1GuXn7
	 yiV3kozVHZ+bi5cIxv/qX678bSnWrNEWTjOBlveCzJ6mqgF1vJT+bPm8xt11xBhCq4
	 lh9I8oBTDygDeM06pa8UJiO8dMlR5jz+yOYrFtOtsnlt6OT2+1dOiOrV6/fPDZHdCc
	 6YWWBMQ7lv40A==
Message-ID: <b2cd921b3682355b0c64d107f1dae998@kernel.org>
Date: Mon, 08 Dec 2025 11:06:10 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 0/4] drm: Revert and fix enable/disable sequence
In-Reply-To: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Aradhya
 Bhatia" <aradhya.bhatia@linux.dev>, "Chaoyi Chen" <chaoyi.chen@rock-chips.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jyri Sarha" <jyri.sarha@iki.fi>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Linus Walleij" <linusw@kernel.org>, "Louis-Alexis
 Eyraud" <louisalexis.eyraud@collabora.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marek.vasut+renesas@mailbox.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Vicente Bergas" <vicencb@gmail.com>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_030617_246056_F8FFF2B6 
X-CRM114-Status: UNSURE (   6.33  )
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

On Fri, 5 Dec 2025 11:51:47 +0200, Tomi Valkeinen wrote:
> Changing the enable/disable sequence in commit c9b1150a68d9
> ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> has caused regressions on multiple platforms: R-Car, MCDE, Rockchip.
> 
> This is an alternate series to Linus' series:
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

