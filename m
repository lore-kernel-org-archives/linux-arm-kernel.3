Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4D2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wct3xXzwtNYwbG+KZ7NzjW0V6OGSi4ER0/+PrKoRIfY=; b=L/W84Egh2WA0XEOacu7riwio8b
	5Rr8fKbFuRzxVAweGl/6F7ODzItATNHJnMZUWvvdRZALRvFBX5ElgdGIBP+1Sbq9yUR4ewlU3SZZ9
	p6d29fJ6HJkfYpUvS1QEWYdPnrKNyT0fqvJcii0ywYzBvs7ix9IvCO/wG7MIYATah+zbCC3JkOYt0
	PnFBhl4Ip83viseltL6XmZSKz6TgQmcXP/8X2WI7gRM3iCkzPxEkJwNgdQcnbvdmJgTzxiC63V0gA
	d2wMcimPQDZ1In10zIEW4NzNhTFzADxWnPQktS1//3qZxRnV4l/IqhX3FCsXgIhZLsSomA4JpRhIb
	+3CrgXKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9kt-0000000F1Gd-3NpJ;
	Fri, 14 Mar 2025 18:27:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9Vi-0000000EzMt-3gMM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:11:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 486CDA48864;
	Fri, 14 Mar 2025 18:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE89C4CEE3;
	Fri, 14 Mar 2025 18:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741975913;
	bh=ngZOWsfXuCD39NLjndi5h6K1uhUdOH7LeujeO4Dg3GI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Mg4rrMcAry4vXwrRGRMZaODYR7HScvj0eqWPlp8rPomU+3SzPYILi9Z5o6PLq2I3n
	 bDh51/9S1vJP+Wi3fJROLpEnMJw9KxIHdcqfK9Z4/0Jb+RyXwPwayqdbdns3x1gRuF
	 LG8EuYiWD0cW0fjhbRb6EY3bJqzp3qojob5pkIkxdBbxSo3wkji4g5OyKULTG6m3wT
	 kTu7WGyoqOy1MbLGQLTLA7q7jW0i1NiJKAjhgtuIjIFZ8XUC3NLN7lo4c9iTM0Mbgc
	 ls7OuQ8SXtpy0fowNpKsOsz2NBG43Xb0m1Bf78/8orKP/BdPaztl5RERtuNxs/KQ81
	 isHcd+RUuaB9w==
Message-ID: <0cc45a0aae50ab25262691c7145082e1@kernel.org>
Date: Fri, 14 Mar 2025 18:11:51 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 07/11] drm/mxsfb: put the bridge returned by
 drm_bridge_chain_get_first_bridge()
In-Reply-To: <20250314-drm-bridge-refcount-v7-7-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-7-152571f8c694@bootlin.com>
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
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_111154_985967_0257CF25 
X-CRM114-Status: UNSURE (   6.52  )
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

On Fri, 14 Mar 2025 11:31:20 +0100, Luca Ceresoli wrote:
> The bridge returned by drm_bridge_chain_get_first_bridge() is
> refcounted. Put it when done. Use a scope-based free action to catch all
> the code paths.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

