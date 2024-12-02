Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF41D7832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yngoBc+P0tSqmoe1jZ+Y5aDigwip9SVRIGIG24gAQ8=; b=noSjk+sUS4D8x4G3L1uci622u3
	lyz7GcnOwvo2PPBQib7H516YFi5yatmT2nM13AgWenkE5jZcOY1muKvLu4k7BhXehxX/28H9/lCFB
	/dNJNV7vb9NJDccb0+HuCsV+MV4BArLffZpfUbqdKvX1ua7mc56RL69yGAnreSaUcYyMlbkZHGush
	J9dPBTBRSIru5gpx0zklGF8XFSdCfTWqLLVtdi4y9qpePwIsl3So4UtHuHDfYdp7jUxiqCgCFiNJk
	l1AlIYd2RW6minF5hrCKKzmbGdcIr3yfb4+XyuSi66XEqdTlC5S/Yuh9M8WvMERRgCsxQs+/ip23y
	z58MSsIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8cY-00000006hyn-2SYx;
	Mon, 02 Dec 2024 15:45:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8bY-00000006hli-2Twh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:44:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E37775C674D;
	Mon,  2 Dec 2024 15:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29BF5C4CED1;
	Mon,  2 Dec 2024 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154295;
	bh=J/q1xWj4DxCp6IzU7uPb7iTssY8YnrBnsl5MtdaRI/Q=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=bBLmPfEuiTfRJnp+ZnwgaRqb9cxXz0K6fMMlUyvDEsusKLVmzaRUkMK6epO8opKEs
	 PwmmSAPf9vdTpehrIfen0th26tLjWFetjQq2vFJs315alQa0XFABW5BAVfcJy5vH3D
	 qCnqbb0sbSC8lSZB9WwLsOaDr4ykQgEM6fQUspxdClGm1c1NZI0O9ThDWxAH9A4id7
	 hIwTG55au1gkzWkIt3zOPFTeeNy8K6nea7RTJUvG/AkLDeFtDbKtDjcZq8Tq7a1zQ5
	 jOfEqNrBFhY8oDlt835VUwvXntb8rAhmkDL0P1EWn8PrpBBLQVNpG3mQzMwHuhfP1x
	 DYAxZ855ED4dg==
Message-ID: <f7d5a7e084f01661572b2608c9a73db2@kernel.org>
Date: Mon, 02 Dec 2024 15:44:53 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 04/10] drm/display: hdmi: add generic mode_valid
 helper
In-Reply-To: <20241130-hdmi-mode-valid-v5-4-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-4-742644ec3b1f@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Chen-Yu Tsai" <wens@csie.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074456_671831_A89F34B7 
X-CRM114-Status: UNSURE (   6.01  )
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

On Sat, 30 Nov 2024 03:52:29 +0200, Dmitry Baryshkov wrote:
> Add drm_hdmi_connector_mode_valid(), generic helper for HDMI connectors.
> It can be either used directly or as a part of the .mode_valid callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

