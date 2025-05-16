Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D471C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 10:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVfxvrCQXv1stWTNGX4NXG+vcy75UugbfRcy9FAUof4=; b=gxjSEVNa+wEkCcDV3zf2Mdbcw5
	fz+GyOS/uG/InMQYCrS3pw59mjyd0/3SJdxPlVzSbY0dAQjycnw2Q41A2g7O/SrD38waoenSpMiyh
	CvtCKo27bWGqR0HqTpIln71ou63MxzcAmdXSF9XrvuacEE05Px4Glfyme3lvI8Qkn2k+jlbSAZvsO
	MgK7KumeucNRU/wEgmnzmTgHq90PueZ7b9fe2g0txJ06W9NuzwnIwalTEjbH0Dw57PbSEjZF+lCN8
	Ira1jU/jBsI9z6xgHuaqgoq0wxq3zP7jthPwSnzo6I+/0pJAeiHP3ot4MKV6xy8Gf+k+VdfhIukMI
	CzdiWFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrs5-000000034bN-31W4;
	Fri, 16 May 2025 10:00:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrq2-000000034Jg-2W80;
	Fri, 16 May 2025 09:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QVfxvrCQXv1stWTNGX4NXG+vcy75UugbfRcy9FAUof4=; b=KyESI/2J9ezWNblBEXm8WCY5Vx
	N0U6K8cowUXXXmvRS21Yz3CFNQF01H2tUlXEnlpnSymSWijOPM4wuA18OBysE8g3XQMj4yFYRJTBs
	VJ6WcqCkCQK2BXggU71M67bIiMNvzg//sKECW9IUOuIFZUkbzkZWfB3XyM4iG4H+RPlX0Yw12AXFi
	VAZkVGylkbqpe+685ZOX7YOaL+MSIrvGMk95uxNPsNxtRG18D3YZ+a5Z/HFWL1yQI+BDxJmln1pl/
	Mtk/ViNcfB4w0c47ve5aE54sxZ+w9iBxM0roTDImQ4HzIYBlmWBVfBcx1S7RreM67pjt4/poXXeBG
	ZqDNxL9w==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFrpU-00016q-Dg; Fri, 16 May 2025 11:58:12 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: long.yunjian@zte.com.cn, hjc@rock-chips.com,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 fang.yumeng@zte.com.cn, mou.yi@zte.com.cn, xu.lifeng1@zte.com.cn,
 ouyang.maochun@zte.com.cn
Subject: Re: [PATCH] drm/rockchip: Use dev_err_probe() to simplify code
Date: Fri, 16 May 2025 11:58:11 +0200
Message-ID: <2022996.jZfb76A358@diego>
In-Reply-To: <94e0951b-46e1-439b-9dbc-c2009a78b04b@kernel.org>
References: <20250515203554564-j1jBXUXR6bdiN6zARicC@zte.com.cn>
 <94e0951b-46e1-439b-9dbc-c2009a78b04b@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_025846_656670_87A2C028 
X-CRM114-Status: GOOD (  14.08  )
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

Am Donnerstag, 15. Mai 2025, 17:54:20 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Krzysztof Kozlowski:
> On 15/05/2025 14:35, long.yunjian@zte.com.cn wrote:
> > From: Yumeng Fang <fang.yumeng@zte.com.cn>
> >=20
> > In the probe path, dev_err() can be replaced with dev_err_probe()
>=20
> That's not probe path. I am not sure if you really understand this code.

I think that is somewhat debateable.

dw_hdmi_rockchip_bind() is part of the rockchip-drm component device,
so part of its probe-path. Also I think just the presence of EPROBE_DEFER
which causes the device to re-try probing later is a nice indicator that the
code in question is _a_ probe path. (and usage of EPROBE_DEFER is an
established pattern to make that component device re-try probing later)

And the parse_dt function itself is part of that path too.


> > which will check if error code is -EPROBE_DEFER and prints the
> > error name. It also sets the defer probe reason which can be
> > checked later through debugfs.
> >=20
> > Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
>=20
> Incomplete chain.

Yep, the patch needs a 2nd Signed-off-by line from
long.yunjian@zte.com.cn please.


Heiko



