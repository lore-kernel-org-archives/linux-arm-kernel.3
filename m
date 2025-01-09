Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE569E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 23:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6uLJ4LISvFEeyya6O/0OdgM/2F3FosaJ8avibEUP1s=; b=euY3C0QKymoCJdFZLC8UqwGalz
	sEgny+RCkDlkfrBuIWhguC6V8A5Jwbaox3Pirq/gyfvKYUbwT+cWJJwgwu0NvAQGSdNQ3fpu8CE27
	6fk6onJllFscoH8SJDjMmVy7uTdIfk030HaZl1flrxUrsMBg8nCKb6SqwhYIsp6zE+keJKOsGqbgt
	GTlKyxAuKhQtdPK1mQ1hB2fKBLxPiTK/OEfn6GURvx35YAv+yGmvjnYRME1bztnxRhiaxPsCJJrMG
	Jc2Dx0NuoPwhMraAMKNaHjuS1elC1mSr2ZBCgPMB8kqtUDFzatSxiiYlAIySdpaoOORNjgldQ+lec
	Kb54ZY6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW25G-0000000DZTJ-3yYv;
	Thu, 09 Jan 2025 23:37:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW243-0000000DZNA-1d0g;
	Thu, 09 Jan 2025 23:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q6uLJ4LISvFEeyya6O/0OdgM/2F3FosaJ8avibEUP1s=; b=iNotGkzkCDk1NX+bHOMVjTv9Dg
	utUSBPQ8G3VcwHP9GssoaOarRozmTDM7zxwWPuFiUbgvggZM17MnLXm9YPJXcM9M17G84IMDseXpe
	45cVbRg8rlFM6gSnZ0qIu7cKWi8C650ernP+ViQ5qW48lItAfMnH22lZ7BEsB/hKC1I+CsSFblK6m
	vquYSm4u8T7/a7s4HI86DYBTVxFXy6Kcf1Hzq1ej4k0SzOf+LJ7c/HrkVOOfpcmKLcASZw0XQKQCh
	5aVsa5QErLPdgqb4VO9DeHf48Kfi4BNqColLyoC4NymBftLa6QeARz0cLYMXG4U4rz5zrQpB3wHlt
	wUhxPHdA==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tW23l-00063C-W9; Fri, 10 Jan 2025 00:35:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Derek Foreman <derek.foreman@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: Don't change hdmi reference clock rate
Date: Fri, 10 Jan 2025 00:35:19 +0100
Message-ID: <173646570326.2987843.9070979804122130287.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217201708.3320673-1-derek.foreman@collabora.com>
References: <20241217201708.3320673-1-derek.foreman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_153547_427349_8389C795 
X-CRM114-Status: GOOD (  10.66  )
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


On Tue, 17 Dec 2024 14:17:07 -0600, Derek Foreman wrote:
> The code that changes hdmi->ref_clk was accidentally copied from
> downstream code that sets a different clock. We don't actually
> want to set any clock here at all.
> 
> Setting this clock incorrectly leads to incorrect timings for
> DDC, CEC, and HDCP signal generation.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: Don't change hdmi reference clock rate
      commit: 1854df7087be70ad54e24b2e308d7558ebea9f27

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

