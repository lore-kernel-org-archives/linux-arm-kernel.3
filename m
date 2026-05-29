Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CB0CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RTjgH7cR4g1plwKCLhYGLVrvQZCj948qud0birIVKE=; b=AHr5x6R4heSYLGTFF3CcrQeDw7
	0vaXMam3jwq/+9LvoN3bieC4h+WKkFYcgTAzvJ1v+S9fbDPXNnzXUtkU+KCJCy68IGjLCxcgL1zoB
	fqhetB+cUl4drv6n+il8SpW5qOAlzyR5kxg09uvxEwn239xS2duwc4GtBc7cX6YXVvqHgl1RKPWF6
	F/P31WD8m0Kam0UxCp106sXz5ay/W6EfSLneUVkVnlGHDihxRU7cWOvGF9Xj4D9adredWa3SO2yhV
	3lKPjLTq+Osq0M7cVJxG4lns1HgqOGZZscSTUvnwpacuru8ZpSaxVSpVYf0AaaAlsvsiueG6JYh0C
	WEmg8miA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStm5-000000075aA-1a9l;
	Fri, 29 May 2026 09:45:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStm2-000000075ZY-2Mvk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:45:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38FA243568;
	Fri, 29 May 2026 09:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7761F00893;
	Fri, 29 May 2026 09:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780047901;
	bh=7RTjgH7cR4g1plwKCLhYGLVrvQZCj948qud0birIVKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HNcHfibnRNMLyOqVp7W9kvfKqxv/RbLwtM3Codujo0cAFq3R63T8yeLjyld3drx2V
	 6LwPSdOa6ReLeYSW7hna3tQvtoIG9pFATM1ZEeglDwJbPyVzM2vFOjc1htVhMBl0fb
	 GzO6mjodOKj08HSLPFreBXUB+7tuhm+yZsxmfisz8ZxnB7TuEjnxcByJt5P02kv1iu
	 D4lYpo3ne3AM5bbQohx0IbiE0GLPgB1p+2BWQZOY6wxQSaIVpuVxK7djGcq3Jjd9SY
	 oOU9uHrUNwW8EdX8JwP2a1bVc8K0itiNRamsK/lWmu0eO93YMvWGQUr6QlKHcwPcsD
	 RSdb5gDwoh8iQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Simon Ser <contact@emersion.fr>,
	Harry Wentland <harry.wentland@amd.com>,
	Melissa Wen <mwen@igalia.com>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	Alex Hung <alex.hung@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Stone <daniels@collabora.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 00/19] drm/atomic: Rework initial state allocation
Date: Fri, 29 May 2026 11:44:56 +0200
Message-ID: <178004789161.1619320.5591445399376924968.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
References: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_024502_645008_08189D00 
X-CRM114-Status: GOOD (  11.50  )
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

On Tue, 26 May 2026 18:46:12 +0200, Maxime Ripard wrote:
> This series started from my work on the hardware state readout[1], and
> more specifically a discussion with Thomas[2].
> 
> This series expands the work that has been merged recently to make
> drm_private_obj and drm_private_state allocation a bit more consistent
> and ended up creating a new atomic_create_state callback to allocate a
> new state with no side effect.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

