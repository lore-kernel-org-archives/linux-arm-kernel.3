Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF1CCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zV5exWY9InxnSYXMek7ksQrF9O6g4mEkP+VjtOZIA4g=; b=rKkL2uxHAjXTLzskIk5Q60eJcX
	4lqxQg0amzkCivwYNDc2Ad3BSLwb3BfO/K2420MnqALcMs0m0xFFo5v1dhkY/OGDcpko4pneIro/5
	qSfDtORT8uJ9u/qdwNbrDZyt0PrArbozRQjrxDv//skfvmMJltrScUL8KflziejGxgfUhSIyDLmBF
	9YlfpdKPp84aZi8kA/gs0VinhlnvdhXVwUQuWLeAQwRWIVtuONhByjYU0CskgeXJ6Pb0l1bx79J5d
	2TOzElda7oI418lnBDIUE/FASce9BUwYsGAknCH/zs+OCJkckyU+A4z89sqzGGcqJcgzvRk8N3Tuh
	Lkn4STiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmGa-00000001jGS-3gcy;
	Mon, 19 Jan 2026 10:13:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmGZ-00000001jGG-1r1B;
	Mon, 19 Jan 2026 10:13:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA8A46014E;
	Mon, 19 Jan 2026 10:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E657EC116C6;
	Mon, 19 Jan 2026 10:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768817626;
	bh=1P25O01V1+pU3qLbbBJW/GjfXAE5BGBvNtHpKC+MLLk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=IoP7E/9pRu+7PDLd0H764jZC/uaNamD0WEa4z1KHQ1LWmWDuerkPTvD00JtG85EOm
	 SzdPIkNXbCfn6Md0mGJ1ogDNrUlWfYU1KRUElYJpxZ3ji5qbTBJlJDcSjQcC2+mviQ
	 ZE/wyaZPh8k7s/KFqIk92XNEj6nHbp+MKbgOVDgXzCLBRNPoVgD69UHUxtGvi1aqJi
	 iNASTiwUxup4KrDlPpADUKJgItJpUr2eliuygQdOW5LikrdFAKge0CU9xKkXvS/5es
	 ZLften5mQg2ZaW9SoWZc5htrDu8insI8Ww82s/O0GqFp0V6EbvOVPO8lCv97yl2k9S
	 EZ2Y8jIU3vGdw==
Message-ID: <2fb910198a3be542215592ac3f22d6b2@kernel.org>
Date: Mon, 19 Jan 2026 10:13:43 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: check the infoframes
 behaviour
In-Reply-To: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Chen-Yu
 Tsai" <wens@kernel.org>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Rob Clark" <robin.clark@oss.qualcomm.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sean Paul" <sean@poorly.run>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Wed, 7 Jan 2026 20:14:58 +0200, Dmitry Baryshkov wrote:
> Verify the InfoFrames behaviour. Check that reporting InfoFrame as
> unsupported doesn't result in a commit error. Also check that HDR and
> Audio InfoFrames are not triggered if corresponding features are not
> enabled.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

