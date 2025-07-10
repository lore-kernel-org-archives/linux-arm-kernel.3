Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B11C83F18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNca6xjW1WAdygeLDug3NFe9msEG4tOF4PNjuuyWtEo=; b=2OHejBympdrzduoHxe8WjVfZgw
	CSvLc38GEpebH0Ytw03wKXJpKmn8ZQw3jsp+MIS+Y12u+xj0vAbwuicP3ugAE84iOQhFjBxbf1HSw
	FRuE85dO+k74Vy3qAEO1hjgIR4tVK45RedEIWqckz8fPaMxgudvsRD3ANFe1jIk1Ri2xVVIpj/eUX
	iBbA8caZnusnrAZ9Scm2gkN9nl0Emm54RUIkDQfj82rtG87d9LSg2/1cTGnUb9DVDSiDAoiJU7GLG
	utglBc2jGGv5KmZOHN0tN7DknnFPrAu8YgCL/H/1AirgW+40V2gEaqChqcMOYaydq3oSOG8rCDPbV
	IOrRB5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmiv-0000000BC10-1275;
	Thu, 10 Jul 2025 08:33:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlRq-0000000AxfI-2VXV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:12:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C848EA53D3D;
	Thu, 10 Jul 2025 07:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1ECCC4CEE3;
	Thu, 10 Jul 2025 07:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752131521;
	bh=aIQhENoNro5iEInnHFbG9/vXa6r2JKB29IlUxVOoRHw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=I3kePT4jqdjWj9P8opXGWsukdze0SOAzcPVjDhWJR2/uxCnkwbvsak9tsnDQFjOFd
	 422pW5tVF4fiAKGuRxLSuobbHLYg9sZEmlHUnVRMp2APdrfigh9K0KZuiInswpnJrV
	 Kf6Wo4xDGIFkqeyTvpC0HD/+noeRuXtIsHND5j/u9uxuTZ1U+IZMQjnfkpFlpf78ql
	 u2PYF1s1JWv3t+M/aqwvxaunKdxF8cNu2Kanc2RlHFs5XFEFOn4Ob3EyIhMrhxnPyZ
	 ntJFn+t/4tfg4tAdbCNY5BvCRJMb/b8aRhZHcMdDGpODp+1j5yBH5fiuZn8nJMvCm4
	 DPe0Uig86NFmA==
Message-ID: <4826eea327c406d55dc88f5553a94b62@kernel.org>
Date: Thu, 10 Jul 2025 07:11:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 2/9] drm/bridge: add drm_bridge_chain_get_last_bridge()
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-2-48920b9cf369@bootlin.com>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-2-48920b9cf369@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_001202_709341_A7A9B9A3 
X-CRM114-Status: UNSURE (   5.92  )
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

On Wed, 9 Jul 2025 18:48:01 +0200, Luca Ceresoli wrote:
> Add an equivalent of drm_bridge_chain_get_first_bridge() to get the last
> bridge.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

