Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC44FCC076
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 21:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dG3YSxcjib0+eymLETNN9ZtXKgqSw80WFDr8cUiqrnE=; b=ab9m172NQc7+0xKLbGF1uh0MQa
	FYqMjjyaYk4ZSpRYRouFshhrE2ubXRKB7PxtioMm4fqa02yPRML7sFVcZiwLXkyzp6bo7shYe5mjL
	rCJCTPRLEelj1IJyD/yF5ieL/mnTDwHmCYOx6D5+D60myw1NnDuvD0t1hx8IdBsHt2se+1gSXSp6L
	S6HEaz+IJlubIbkuwMESsbtbD+X0WL+87irSVjV18wHDaPSgIgmTizbhUnLcZrZ4uVAzty7cAVufH
	VZpCaTbHq2dBq/UEgEqdmCvZbxXLyTzeAZp+WiyzG3bNnMZzlAycEN8FGosEu9X/RPGFtYI1PqglM
	Kz2Lfoew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyciI-00000004WlO-2eXC;
	Fri, 06 Mar 2026 21:28:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyciF-00000004Wl0-2kKn;
	Fri, 06 Mar 2026 21:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772832476;
	bh=8AcXATpPHhAW6+VsEJt3fbqjfR+nRZ5oVmrac43OOrg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TKuE5TCY9pEao6ovX2ljN+08xIEW10blai+3m0jm5lIqeNw1ZtMCznKG1mP5WDIZa
	 RMy8xazy/23QolllpOLPnM3DiBpIdv86oGjBjzgKGYmPUFe0o5AZVmGdLurCUda0JQ
	 OmEwFnoXG8n8ZNpeIqkW8oVCvVmcmF6s7Wg5DfvXLqXrnEX6+tZM4LQN4fZNcuLEEG
	 Jfy9uq4P/0HDrrTyIYtoAlj/aDYFhzyuRf91VNqojzpQFlYt4I1WkkkkteEwnp8djt
	 WxIJeugI63Mz6WslOt1Hk6ceagZFYi5AwF1vZ4o3IqKEguUiKdtrQEyR4KlT6/MbPW
	 1vV1T6W5Cx2Hg==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C482617E0959;
	Fri,  6 Mar 2026 22:27:54 +0100 (CET)
Message-ID: <84b30917-5d09-4432-bc49-873d1b2674df@collabora.com>
Date: Fri, 6 Mar 2026 23:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/22] drm/rockchip: dw_hdmi_qp: Implement "color
 format" DRM property
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
 <20260305-color-format-v10-15-a58c68a11868@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260305-color-format-v10-15-a58c68a11868@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_132759_865592_42DEB31D 
X-CRM114-Status: UNSURE (   9.24  )
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
> Switch between requested color formats by setting the right bus formats,
> configuring the VO GRF registers, and setting the right output mode.
> 
> To do this, the encoder's atomic_check queries the bus format of the
> first bridge, which was determined by the bridge chain recursive format
> selection. Pick the input format if it's !FIXED, otherwise, pick the
> output format.
> 
> The previously unused GRF register color format defines are redone as
> well. Both RK3588 and RK3576 use the same defines; it didn't look like
> this as there was a typo in the previously (unused) definition.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

