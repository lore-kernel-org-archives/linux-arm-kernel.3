Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75286E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 07:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9NKrOBgZu11P2nfAfAF/ZlFaKTebEaW6uPR22t+uqU=; b=zCEI75/BDhw3KrE08SjSFVM7DW
	1JKkvnmF3OsFyMKxQRtwl/nHlf/MiM4ZXgmJPH02Qca5gVBepK7ICu5HL/ge4QxTRR+R/8J067u61
	yk+dXi4GswKASBt3FNR2PrBPDRKhrhajAmaMwNvjN/IZrP7JL0cXNEkm9jMm91DkpTHYj7CpmhFjZ
	AvW2/f7fjX82hN+VMkFX5LU8QLWeZKkx4x+4lQdzU6o6KdfR+N0Y4n4CFQnxNnGhHa+zlkXJTmmNS
	fKUYbElpBud+dVEnuCXJthPkhrDA61bxMhtj7H/icsscuevyNAVwUFXlby5BnMY/iaivQzksltRp8
	G7F3GUmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIk2t-0000000BkWy-072h;
	Wed, 04 Dec 2024 07:43:39 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIk1m-0000000Bk4Q-3kCe;
	Wed, 04 Dec 2024 07:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733298151; x=1764834151;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=gK06+f1C0mBtgYKTZ09XhG1sOVFjumSjIgGeM6ZwmU0=;
  b=JbmURXo97MbGQlWyxfmRCwyqoTszCrXRO8NWX3FclIKkgp/Y5pqcl8i9
   eE5MYVfHaxgF9JWViH9SZjr+R1GtjPUsxFX+iUtJDDXg81VrXagwWDsli
   zO414RAROg6QxSfIAMPrtPtGJb/LKOOpKhGvUpuimo4z6PndyOSchTl39
   PHSteGHz+D0phc4UqrJZdHnJobQUTNw+IBrmdHuFGqPietTjvG9kM07sI
   ge9Op9rMh0paJEouvFIB7hSqkx9dWwmyEukrSpDzmjq5ToSihG9/DCead
   Zbrmuu9m4EzR7JQEpc6utFgc4/1h8+c6It/3+hURQIbZ3fMBxmmTNacjA
   Q==;
X-CSE-ConnectionGUID: /KztvD7VT7CcUnw2maxGuA==
X-CSE-MsgGUID: efYmaFQSTo+GqjtCESHPnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="21132177"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="21132177"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:42:27 -0800
X-CSE-ConnectionGUID: ztyXjIeiR26vOG8EeEOB9Q==
X-CSE-MsgGUID: MiRNI+71Qr6pKR5u1cWLig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="131139278"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost) ([10.245.246.205])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:42:14 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE
 <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy
 Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 7/9] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_update_edid()
In-Reply-To: <txzri7x4pdeakx4juandk3hfhsbx3dhlulxfuehqlmrr7b3wpw@jaunqktsro6x>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
 <87a5dc4zd5.fsf@intel.com>
 <txzri7x4pdeakx4juandk3hfhsbx3dhlulxfuehqlmrr7b3wpw@jaunqktsro6x>
Date: Wed, 04 Dec 2024 09:42:11 +0200
Message-ID: <87v7vz3ne4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_234230_969575_A42E846E 
X-CRM114-Status: GOOD (  16.63  )
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

On Wed, 04 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Tue, Dec 03, 2024 at 04:25:58PM +0200, Jani Nikula wrote:
>> On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> > +	drm_edid = drm_bridge_edid_read(bridge, connector);
>> > +	if (!drm_edid_valid(drm_edid)) {
>> 
>> What's the case this check is for?
>> 
>> My preference would be that bridge->funcs->edid_read() uses
>> drm_edid_read*() family of functions that do the checks and return the
>> EDID.
>> 
>> There are some cases that just allocate a blob and return it. Would be
>> nice if they could be converted, but in the mean time could use
>> drm_edid_valid() right there. Additional validity checks are redundant.
>
> This was c&p from drm_bridge_connector_get_modes_edid(). If you think
> that the check is redundant, could you please send a patch dropping the
> check?

Mmmh. It's just scary to *remove* them, and that's the reason I didn't
want you to add one in the first place! :)

BR,
Jani.


-- 
Jani Nikula, Intel

