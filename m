Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D55CD5E387
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 22:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8gBGyPTDJo8Wblkn6DK9LVzHMsd9X3M336TYhnbuuI=; b=eIDioTKA68jy9l7wwVsFfxatGx
	gJYH9pzrQgsFr2wScgNYIJNnKrWS2djq0d5C1W9DT1Znx+GrfkJZE53tnx1OX1tIC6AfU7MA0r8rh
	zoH8zUCrLbxpyFEyTmquF5KXULpveDxai4p3YU9YhUUh1AXapaFZic9uZR/mqg7RZHkB9GEt7qdte
	mx0G8R4SADUFJ587dUCptJNYRqvGd8WhvOpfmNbZ8APLjWxHngOe4Xmo04ku2Jl/Nxfy+LXxkYjMF
	g8SBLVnfgjHaf+uDutpU8pEb/Y8W0XFQUg739gTI0zKOGOyGEs6HC070T59qfl9aR4fk9W8sSfVLi
	HpKEOLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9uN1-0000000E53j-1Lmy;
	Sat, 09 Nov 2024 22:55:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9uJY-0000000E4eO-1w9W;
	Sat, 09 Nov 2024 22:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w8gBGyPTDJo8Wblkn6DK9LVzHMsd9X3M336TYhnbuuI=; b=wmCH83XV6CawKCBG+wBFbmq4qJ
	U+tEpY8FgwvM9/lF+DEae3CbhHS1ANMEGtDfnxsAgUk8XV0poeQzYLbRpGzQeT2gwLizmjSAwObte
	J+xi/zFNarxQae70PAfKGE8VqX/frWY/0TDgYDAwizyltIzH8YvAciiOetgodJDTekUqN9dkoCftY
	bO/mbg/agRoMdWtEL0VNkNuO3dH7o24rjOfJKxZMOuQmSVukUScXqaOYSqgBsubcqPqh6YwCpQslU
	60n8tX4dZsbrUdXK/DlQDgz8VHecI194PvUnj1fE9VK81QAKhv8tBMw6utWI/s+G+y4OBzaXHLvIM
	4XRiNUGQ==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t9uJP-0000NE-3s; Sat, 09 Nov 2024 23:52:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	mripard@kernel.org,
	zyw@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	Thomas Zimmermann <tzimmermann@suse.de>,
	airlied@gmail.com,
	groeck@chromium.org,
	simona@ffwll.ch
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()
Date: Sat,  9 Nov 2024 23:51:58 +0100
Message-ID: <173119266840.1201296.18042535241169632590.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105133848.480407-1-tzimmermann@suse.de>
References: <20241105133848.480407-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_145220_526657_1EAB76CA 
X-CRM114-Status: GOOD (  12.46  )
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

On Tue, 5 Nov 2024 14:38:16 +0100, Thomas Zimmermann wrote:
> The code for detecting and updating the connector status in
> cdn_dp_pd_event_work() has a number of problems.
> 
> - It does not aquire the locks to call the detect helper and update
> the connector status. These are struct drm_mode_config.connection_mutex
> and struct drm_mode_config.mutex.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()
      commit: 666e1960464140cc4bc9203c203097e70b54c95a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

