Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E39ACA6CB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBlgqY7VV2EwO/Lgzd0ZgnwzJXBWMV0YXSVxYj3hN+I=; b=HnsMLhoXyWtcP+85D/VAGJPvi5
	M+i7Pnm9JUTPTTWNZtr9YamVk6iRAZZh6f9UA9/oI1ypDQZLybRp4bX0xeKwiku8LnIRZwtzAbPFz
	2hgBf2MdXV7bqeVNePN/IoOIfUfA+O3HbheSm+4yFneTTuaHURJxjJFbJ+Gp0LvFrH9JimgKb+oVX
	2kNGCIVTIQyRrSsyvw6RP/qZaYDb5rzJ611QhTKm3ACfzwuJLYvM4LmHRobKVF4m3NJfgikexuBUT
	g/cKiQc4CXtVODrtmexdT4XRKvoto2Ey5Q6YgvBAnb/q81c2J0OUhr+YO/ed7HZWIZHg2Aa8pVrBI
	v59bwSnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkewl-0000000DtVQ-11yP;
	Tue, 27 Jan 2026 09:01:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkewf-0000000DtV1-3Gr0;
	Tue, 27 Jan 2026 09:01:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769504466;
	bh=noo9XsAcC7n3F4JCncujc4ESels/5xcyYpBpkJ9bFy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X+gIjFdNgCgMDfrS3icP5NKrOS9hVcQAijOwjnlOVaFJbTMXEuWg76e95TRg4cr3n
	 Qo1v90TEZ4mAtIdolCQ93aNR8Tiw1xJG2lXMwY2G4CvJe9GSxEcA53mJK0B61VHczz
	 UimmQLOiDqrBYcdh43olLdK9W1YCW1xX2okD+gj0I5EBqUnQiFE884Jqmh3g3I5Tsg
	 oQ/cH5uq7Q0TAeJf96DrFwzxkOT56ban2l0SblMUVbSPcqxdr3fmKi6xADdMsr0IFH
	 yEExYV37cf8rW2C1z3xjRz6r+MgSlwbv5qjAf7EMzfHz2ETwhW2I6mrge9m+IrpxYI
	 nz4UnXHGvmcqQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 198F317E1276;
	Tue, 27 Jan 2026 10:01:06 +0100 (CET)
Message-ID: <e5177fe1-2ee1-465e-809d-92233efa2095@collabora.com>
Date: Tue, 27 Jan 2026 11:01:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm: Add CRTC background color property
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Matt Roper <matthew.d.roper@intel.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
 <20251219-rk3588-bgcolor-v4-2-2ff1127ea757@collabora.com>
 <1425ed35a21bcd9633524d4fc747b71a17068363.camel@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <1425ed35a21bcd9633524d4fc747b71a17068363.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_010110_024007_06B92E54 
X-CRM114-Status: GOOD (  13.60  )
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

On 1/26/26 8:23 PM, Nícolas F. R. A. Prado wrote:
> On Fri, 2025-12-19 at 23:46 +0200, Cristian Ciocaltea wrote:
>> Some display controllers can be hardware programmed to show non-black
>> colors for pixels that are either not covered by any plane or are
>> exposed through transparent regions of higher planes.  This feature
>> can
>> help reduce memory bandwidth usage, e.g. in compositors managing a UI
>> with a solid background color while using smaller planes to render
>> the
>> remaining content.
>>
>> To support this capability, introduce the BACKGROUND_COLOR standard
>> DRM
>> mode property, which can be attached to a CRTC through the
>> drm_crtc_attach_background_color_property() helper function.
>>
>> Additionally, define a 64-bit ARGB format value to be built with the
>> help of a couple of dedicated DRM_ARGB64_PREP*() helpers.  Individual
>> color components can be extracted with desired precision using the
>> corresponding DRM_ARGB64_GET*() macros.
>>
>> Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>>  drivers/gpu/drm/drm_blend.c               | 39 ++++++++++++++++--
>>  drivers/gpu/drm/drm_mode_config.c         |  6 +++
>>  include/drm/drm_blend.h                   |  4 +-
>>  include/drm/drm_crtc.h                    | 12 ++++++
>>  include/drm/drm_mode_config.h             |  5 +++
>>  include/uapi/drm/drm_mode.h               | 67
>> +++++++++++++++++++++++++++++++
>>  8 files changed, 133 insertions(+), 5 deletions(-)
> 
> You should also add a dump for this property in
> drm_atomic_crtc_print_state().

This and all your other comments have been addressed in v5 [1].

$ grep background_color -B13 /sys/kernel/debug/dri/display-subsystem/state
crtc[82]: video_port0
	enable=1
	active=1
	self_refresh_active=0
	planes_changed=1
	mode_changed=0
	active_changed=0
	connectors_changed=0
	color_mgmt_changed=0
	plane_mask=1
	connector_mask=1
	encoder_mask=1
	mode: "3840x2160": 60 594000 3840 4016 4104 4400 2160 2168 2178 2250 0x48 0x9
	background_color=ffff000000000000

Thanks,
Cristian

[1] https://lore.kernel.org/all/20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com/


