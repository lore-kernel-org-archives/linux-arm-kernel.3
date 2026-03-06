Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1513FCC076
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 21:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxlgg67UVb4y6oO/OHq4lCbl5MwqjQ6CRX1MUtPr0Pg=; b=xRS2tWf3o+ZK2W859QsgeVj2HK
	qHYXzqnqvXSIruBPGfKt/SjvAFfTaOAReJ/bFhEcArHpYToegjfRglorfor4IpOCKK9vc7XK8+b3i
	pMZPyZxTLmfaUOkzyNWqT1CIG8ByJkq7WQ1Sv8aiS/zvnfdnamwGVYo0Xf/m9htycjM1Tm85asvlZ
	dh3L+HHQ3VhARvGCmR5NHkoaTm2LfIfyBo/+qnl/GVMgriqQ2Hob7btNyPezJyBmNgB1MbwmQb53J
	rlqclVqrKbxVS5wqU8kURMa0DD2CN4QHbz6StXxhwTWE4XpCD2SeLwc7nOzgX+eKy15Dj1fqMwTVS
	YPMEH27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycVm-00000004VtH-3aBK;
	Fri, 06 Mar 2026 21:15:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycVk-00000004Vs0-2MSU;
	Fri, 06 Mar 2026 21:15:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772831700;
	bh=b2xKIZVvU9oNpwWfGskzivc5542W5iNveuIWwtPS3D4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SMAvJLpM0AucH2FC7JWxiudQ1BoadPrwmgjnGc17sKtxxIxs/mJGmiNX5x5j+V1oQ
	 Z9C56kerzEd6F4vGEj91VkStUeFOGhghtmxo1VYp5gSTYHQT18TV5flyL93s5TPL63
	 FlGjh0XLuuYOzUd1gazWPzVODg2rbkDwqtN7r1JnWWDSdjYwxNNiR1yTF1QL8389/N
	 Wa5rGoNJqw+YLbgF1o7Zi2pfVRSP+MZt0P2Bx3iHcVMFNWTdCQiATScYEPK+hkE0UY
	 0t02Kd9hILR8RM7DxXSf1LiN0PctHRg/Y4Mtac385Hnz+Feub6CBoH9qKgFB7Sli9y
	 vTNjcFeZa8SUw==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7787A17E0071;
	Fri,  6 Mar 2026 22:14:59 +0100 (CET)
Message-ID: <8360f269-7f10-44e7-9654-dd5894a88abd@collabora.com>
Date: Fri, 6 Mar 2026 23:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 14/22] drm/bridge: dw-hdmi-qp: Use common HDMI output
 bus fmts helper
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org
References: <20260305-color-format-v10-0-a58c68a11868@collabora.com>
 <20260305-color-format-v10-14-a58c68a11868@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260305-color-format-v10-14-a58c68a11868@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_131504_782880_A06905D6 
X-CRM114-Status: UNSURE (   7.49  )
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

On 3/5/26 4:19 PM, Nicolas Frattaroli wrote:
> Make use of the common drm_bridge_funcs.atomic_get_output_bus_fmts
> helper for HDMI bridge connectors.
> 
> This allows dw-hdmi-qp HDMI bridges to participate in recursive bus
> format selection in a meaningful way.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

