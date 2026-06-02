Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC2CCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 18:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQ/ShSVerF3nHBt9YMs/KOfemqRk/C2hqrvxvJUY/r4=; b=XNSU49weNtUMIN0gWvdwidv4q4
	4PAqIQ5ilX7gRn4NypyK4mQJZZPAtQ81oaPJYzyy6/PWVX8VdzGqgrWiomsBwDLGFZpc3vT0AfZCv
	wAJF3wEolYrF1boRY1z0EaZS5XWY3SItKSGO2a1KZJ3yvqpRyWW2h/wvqV+qzEqwyqHJhMwqs9yzu
	cBqWubBvC4SgVLFAOnzJFM5um0Y3u+EbQiWArVs2etcTXTxsFRiBS8Ccg0KjULFLhuG5rOvV9mjoe
	Mt8TKa6kOhtSqGVbiLf45ywh3vhYqkzRYePkfrIUg4Rr0JH6KOWqgtaqKLyw2o/7SWOZcX8or7xWG
	swf3d1mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUU9l-0000000DevL-3Rbe;
	Tue, 02 Jun 2026 18:48:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUU9j-0000000Deuz-2Z4e;
	Tue, 02 Jun 2026 18:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=bQ/ShSVerF3nHBt9YMs/KOfemqRk/C2hqrvxvJUY/r4=; b=eQyt91Hb+iKzpD2z/Q5HdzC7oA
	lHgvBQlcohpqxZ+e9FUIj0hRWFQfql8KO99YeAHgK31Vaquv/H0Olqkp/OHWwyrtF2mFntCDmdkno
	8Q3IBhnsWeTsxTQsMMeM8m+cyTustAU3n9MimjOsgM+MdlN5mkD7m2H0XtixuKE/REP5E/g2C1HMb
	yu791S02UFO/PLF5zJcrILVZwy8pZmajXAK2N18QsM/itIg1V5Ioh8fk9NpZzs328yUi2LaghMX4h
	EpH1bOBKqGnUg2zQvxpv/lf7SqwiEnNuIuuzvHj2bLcQZ8PJH8RDqoZ1yOBGKJZUDZ3VWu1fY3KXY
	RkXrbA1w==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] YUV support for VOP2 background color
Date: Tue,  2 Jun 2026 20:47:41 +0200
Message-ID: <178042605608.614111.131135337224991312.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601-vop2-bg-yuv-v2-0-e5aef1d16fec@collabora.com>
References: <20260601-vop2-bg-yuv-v2-0-e5aef1d16fec@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_114803_684394_089CB934 
X-CRM114-Status: UNSURE (   9.88  )
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


On Mon, 01 Jun 2026 21:00:02 +0300, Cristian Ciocaltea wrote:
> Since commit bec7cbfa7d4f ("drm/rockchip: vop2: Support setting custom
> background color") the VOP2 display controller allows configuring the
> background color of each video output port.
> 
> However, this is currently limited to RGB formats.  When operating in
> YUV overlay mode, the color must be programmed using YUV format.
> 
> [...]

Applied, thanks!

[1/2] drm/rockchip: vop2: Rename CSC_BT2020 to CSC_BT2020L
      commit: 09dfa47fc557f945871dcf279c8e687e55d3550d
[2/2] drm/rockchip: vop2: Add YUV support to background color
      commit: 28e670a0885cf2501fd51189ce7b6f5b7cacebf9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

