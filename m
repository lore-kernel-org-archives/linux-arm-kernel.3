Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC4FF4180B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMR6+tMRWqw/5ZkkVWOFdtzmHg4qmhvHpNtYaKiQ9JY=; b=pur4cOKDHBvhzCC/qMFxY9utcd
	IVHeiG5oMlZMqJy5zG7kuvXF5M3yRCXCsSjnXKFVbQcxlqXzKlWwAxQASGjodApOW+q11zC6tlIcH
	Cd9rx3R9+FlmDAfplneZOP5qPfaduDza5QVziBRfrkqmdeAhksBMRUAHINFuByYc0m8BPmd2KRi/i
	IpmVECqQfW/RK8Be8jnYUXf93Eir5eFzdz6+D5kF04FyarBiJIkdnUunNDX33UToCNEh6tJENbrEt
	UWjOKs3xRWJXUs/EDibpBwlfiYE0kiUDdmOyQOQ0mxSTOrbeT69r3ypjWzg+fof4ZE07E9ncOsDqS
	4CjznkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcQC-00000007abk-0U5q;
	Mon, 09 Mar 2026 15:21:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcQ9-00000007ab0-3suH;
	Mon, 09 Mar 2026 15:21:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFA5843E9F;
	Mon,  9 Mar 2026 15:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C57CC4CEF7;
	Mon,  9 Mar 2026 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773069684;
	bh=yjH9Qy6R6RruoyUt8z/lT2greWmRoBg2fSGT8Nm76Q8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=U4L5dPhPxfqs4JNxt0xMlRXLGgEgFbnOQkZVlti2gjv5KyyiBwar0P13MLfQ9bubh
	 qoAYnquJqnlBkPmCiE6OKMAJ4v/QiqauKhbUAXkoMJ8Y9RrRG0IkIJ28p7FTw5mPql
	 6plPQyAshZdZ5b7qevch3261+Fjqvboq/GTm2b9uI8FmPBQU/hkEKtdTz8FnEoRKLC
	 ZEBYDl4se1JJHja0XWGGDOuK36m958TCJ/Yj3Lycd18LJwFnAXMo5fB6XXjPurHM9o
	 oyMWVj8KaTN+fQHJ+Vc+dbKpr6WF/9ejDtfgkMgS/2g73umL5BRttrc8oPU2gxO28Q
	 8m+T8znrqdNyQ==
Message-ID: <c693c826ce1791fbab960af03ed75138@kernel.org>
Date: Mon, 09 Mar 2026 15:21:21 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v10 02/22] drm/display: hdmi-state-helper: Use default
 case for unsupported formats
In-Reply-To: <20260305-color-format-v10-2-a58c68a11868@collabora.com>
References: <20260305-color-format-v10-2-a58c68a11868@collabora.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Alex
 Deucher" <alexander.deucher@amd.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Harry
 Wentland" <harry.wentland@amd.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Leo
 Li" <sunpeng.li@amd.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Robert Foss" <rfoss@kernel.org>, "Rodrigo
 Siqueira" <siqueira@igalia.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tvrtko Ursulin" <tursulin@ursulin.net>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_082125_987499_218B6B4F 
X-CRM114-Status: UNSURE (   6.65  )
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

On Thu, 5 Mar 2026 15:19:28 +0100, Nicolas Frattaroli wrote:
> Switch statements that do not handle all possible values of an
> enumeration will generate a warning during compilation. In preparation
> for adding a COUNT value to the end of the enum, this needs to be dealt
> with.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

