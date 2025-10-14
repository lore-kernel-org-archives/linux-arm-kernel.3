Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F554CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOKTEzxthTTOyJo5wyYsOApQpBkoR2xVJ5lgMd5eWf0=; b=pUzLqt7NHR7fET3p7ajlHYAHNQ
	+ysMQ//LztYPZ/x2ncntsm7l2XedDaqtpS8Q/f8dI04tqY6j9tt4krv/HXKAozYdWlnJfmdnDT7RQ
	ZTCtCB+ErBjTeMesCYtZ+ExHMPKnF0DoVrdVjRUPPOL6AXARO9wCMfJ6BURq/Px/GiqqhuYmOJBi3
	TvvwEBMVUI31fgB4JKCm6VcmQHBkb841tU5KUeMm5+467Yd3JZDE8TxTOSyG0uRJ2SINPBZDFOwDn
	3bzgXUuRjDNok2FFf20cyIme2iKou6nsVZ2Kn4h4PP57w2Zw2O6cJUeVp3Xb4GZkaLPVzrPTQGXZp
	dGhsDNKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8akK-0000000Ffcb-1gCe;
	Tue, 14 Oct 2025 08:51:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8akH-0000000Ffc9-3hPK;
	Tue, 14 Oct 2025 08:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=GOKTEzxthTTOyJo5wyYsOApQpBkoR2xVJ5lgMd5eWf0=; b=Wggg5Hg2zrlFhRN75mqTEvO8h8
	0Eo4dwBq3NohXRqW/1cPCAKRZx001JFprEkea5bCzEL6bRfKdXhthD2wIUi0FWTn+hQs1+Z4BGnuf
	TVYE8i318rFNhU2EIN5uQurWG7DUnmIPkgKog23Dr0Yid45W9LbzxrYBAI5xG87XnDOtRcaZYK0OP
	q23gfnpn99lJiYA9dJmK1Swd/l8lsTuyOCytHEodg/UZu39NrqRwnVInjZoQYqiwF7AYEmWqcIZd2
	Aug2ylh/JR6Zywai6wDhUaBaLXCnI+s7iteXTF5YSUpffwyD4PS9jaR7XfW6rHjUEcbgaNWXbLn5S
	s3dVqvDw==;
Received: from i53875b75.versanet.de ([83.135.91.117] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v8ajr-0005hQ-Gr; Tue, 14 Oct 2025 10:50:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: christianshewitt@gmail.com,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	Michael Riesch <michael.riesch@collabora.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] drm/rockchip: vop2: use correct destination rectangle height check
Date: Tue, 14 Oct 2025 10:50:25 +0200
Message-ID: <176043181223.1370357.8939972845329921599.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251012142005.660727-1-alok.a.tiwari@oracle.com>
References: <20251012142005.660727-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_015101_934632_C0D5C814 
X-CRM114-Status: UNSURE (   8.71  )
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


On Sun, 12 Oct 2025 07:20:01 -0700, Alok Tiwari wrote:
> The vop2_plane_atomic_check() function incorrectly checks
> drm_rect_width(dest) twice instead of verifying both width and height.
> Fix the second condition to use drm_rect_height(dest) so that invalid
> destination rectangles with height < 4 are correctly rejected.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: use correct destination rectangle height check
      commit: 7f38a1487555604bc4e210fa7cc9b1bce981c40e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

