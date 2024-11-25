Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B24D58D61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 16:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZbTzJq+rd2Ya7oUflH0JJcpWi8cPBmEaC8LYvNjtPM=; b=KPhHAamGX8h/B+LYNF8Zra0TpT
	8J3eeqW0x2+V3Q+30MFCeM+r7alJCSx3AZ/JW9eQYTSCL+JjHz+46HBtWG1Rxze0i1gnzoA4hTOqe
	S8jzuwq4H+0mf+ablJi8pE8JtpkI3fvdJSqVZncp+rvL5q3tnKLNHD/T7SAhAc1/iM24BJY7P3ECA
	jwXv+qzcz4fULLv7Sit98+EMDo67e0s5VaBHPM2ZqlC62jOWzMLeWNHM5TX+icmf86GYdXYoGZxvW
	ZNkaZrhQ7yDHTqL/75u8w+VJkQQNmcwSHDPqQddDuzNDDWfIiBznOLZNY7GBcNKIpD2V5YwQdkQbc
	0hxD27+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbY9-00000008alJ-0pl0;
	Mon, 25 Nov 2024 16:02:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbWd-00000008aXA-2mj9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 16:01:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 97DB85C59CB;
	Mon, 25 Nov 2024 16:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C71C4CECE;
	Mon, 25 Nov 2024 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732550482;
	bh=nOc3Xy7mhkWTw8qDkGMCJ3rROD2LNWSCNirVNpiwODg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=frwUvWjAT86MGYDE31mxgujfkohr2ef3K4nhK2HbJuEEMJjrBbhwlO8jDeCeKBr+h
	 C2hzW+jG/wlwKgJ2s7UIhxhWAWykVR4hNVemAuy2gBl1kXoUbjDTsPwpzomUIhZdLC
	 eh2vMbpMyNeUbxSJWLX/tGjNTuSwFMyAT10TpsrRV/sYMSuNeqZ2e2iHcDGjYvkOgs
	 K3rfy1A6NPtU0CO//OjJ59wRRitpAxEHDAcdAeMLwnlxQzUPfAZrqOkonRz41u0zU6
	 oXVv78t0UQsZZMydobXwafUq03sY/4SG7BxHadCaevt9YMMDVpoLB2CKCu15OAsz04
	 dcOi1kLNnMMJw==
Message-ID: <08f3944d0330d17984641bb2cb94fb88@kernel.org>
Date: Mon, 25 Nov 2024 16:01:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sean Nyekjaer" <sean@geanix.com>
Subject: Re: [PATCH v2 2/3] drm/sun4i: use drm_mode_validate_mode() helper
 function
In-Reply-To: <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
References: <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Chen-Yu Tsai" <wens@csie.org>, "David
 Airlie" <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Philippe Cornu" <philippe.cornu@foss.st.com>, "Raphael
 Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Yannick
 Fertre" <yannick.fertre@foss.st.com>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_080123_747456_F1550B15 
X-CRM114-Status: UNSURE (   5.21  )
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

On Mon, 25 Nov 2024 14:49:27 +0100, Sean Nyekjaer wrote:
> Use new helper function for HDMI mode validation
> 
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

