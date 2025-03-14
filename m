Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3753C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BOoTpa7j7kOWDgvxrb0tXDEr/wUI29Rp0UJrHYohJA=; b=OQKnH9gIbT2n5Kz/KNwmQscEdg
	iI6xzuAk+kK9ByQFiVutTi26RcvuXinjRxEIJvFQ/gT/Trx/Bls4R5jO85knhiJBhVqVqutnF3g8G
	9U/pOdPLYwYlWlR19HETMcO1uxWtDG5JdAy8dXcfs1M4JHLMXDReeENv9fTn9PhgLe4idh28biZSl
	cssmFU3VW0jjS+d0qU6S28/g4N7dPxwqMKYtk7igCBDnhRBGXAjgZQQAIy0XMuE8YY7b8uyFGJ/YD
	KIN1hrbV2s0uuUAVLoPlnlm8RP03JxDruC7c0TvBuiJkQD68fcrebjps9FDjrr7NMrfS/Mrjo0crh
	eUn/qkAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9pp-0000000F1oE-3ikU;
	Fri, 14 Mar 2025 18:32:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9az-0000000F054-219x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:17:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF6AE5C4D3A;
	Fri, 14 Mar 2025 18:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31E9C4CEE3;
	Fri, 14 Mar 2025 18:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741976240;
	bh=1BOoTpa7j7kOWDgvxrb0tXDEr/wUI29Rp0UJrHYohJA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=pUZr8M+5YqTB0gwHjL2uSg75N4jc4CDIxlCHb7r1mXjx3YKJCmr8XK4iL2+emxFei
	 lX2P5axT3LQE0vqeQiA9N6V6JNTGttlyHixDMwDJbeY7sE6LXdmX62UZ/mLGzaF1PU
	 sjWxU+hkq4nT+hHhYo/NY/ggRFfO5MJ+KMinzqjzhJW+1fjnTsQZst58KpmkzNFSkw
	 Ncw+wZWsjOUl3j7zOLzEFpzV1gSUqyozZTFKyb/8rC28QAuuhb7M8Tn5DSPCt1Vub3
	 H6hpRu+O4ZAO2S36uWVrdlryZxxok2R3VVfiu1ZRaOl4IvEra9sYRV9cEhTxpTGVu6
	 2Q/eSha1g30iw==
Message-ID: <028ca14a547f52456a10529508cb0207@kernel.org>
Date: Fri, 14 Mar 2025 18:17:17 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 10/11] drm/bridge: ti-sn65dsi83: use dynamic lifetime
 management
In-Reply-To: <20250314-drm-bridge-refcount-v7-10-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-10-152571f8c694@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Fabio
 Estevam" <festevam@gmail.com>, =?utf-8?b?SGVydsOpIENvZGluYQ==?= <herve.codina@bootlin.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Inki Dae" <inki.dae@samsung.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Marek
 Vasut" <marex@denx.de>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Stefan Agner" <stefan@agner.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_111721_574661_8531812B 
X-CRM114-Status: UNSURE (   5.62  )
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

On Fri, 14 Mar 2025 11:31:23 +0100, Luca Ceresoli wrote:
> Allow this bridge to be removable without dangling pointers and
> use-after-free, together with proper use of drm_bridge_get() and _put() by
> consumers.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

