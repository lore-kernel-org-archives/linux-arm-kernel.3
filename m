Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A034CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mN6TqIzQhCMb/TWw6EiGfX8Yr9HpJyuJZ+GjX/D3t3Q=; b=hp/NE/R6tOn5ulxHT5cGJhYOJa
	e/z8uitI93uNgds75YuRjD6Z6ikhEf2lOMUqm5DYLGC6ylccQqqZCWRSkDn1h3TFIjIb64AzkNXYy
	PLK96wi4JlEqoYPPE+44TlSEWkumm0cnTxmCPBLP/D6g2WSvrMvdrDaOghhydkWlbOm28AVX7qY61
	gwJ4oDm0RPqai7xV6e20WXzvAhohSq9rx65+sVttg9NwOYUaSSbO6MrWi1LcA4yke4zCTOH6cytbl
	J/XVENgYoGsOUyNHnlNvzWwYXFO0QGj4zbrY5vlOOjVWXSnnoyAadosKT+GOc2wOUAjBl1n+lzejQ
	1U4k8PlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWnN-0000000DOmX-0rKM;
	Tue, 17 Dec 2024 12:35:25 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWmH-0000000DOdM-1VgD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 12:34:18 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso5378974e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 04:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734438856; x=1735043656; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mN6TqIzQhCMb/TWw6EiGfX8Yr9HpJyuJZ+GjX/D3t3Q=;
        b=juG3lPvI/cnDXvNFWSh4N18M7Ons/zX2cufj8yShD4FfPwMRVTNsJVPzY8qovB5IS7
         zmdWXaglhcW6M5/kodD5uQdlszP61fTfcvwgpG9RzvT5yQusbIHwjlOksX9gw7Qp/7q9
         DfbJdlwk2RQd5PF579tKwDAlWtPq82bqjcsGYvbS/ci+MLu7Dd4FPC1JH6QK/FCHk0e4
         RxYqr7Wm11oBlu7+s7bu/z6NhhH31qLihxTXK/xXtBF3FIUTyx3bAvIjVPyhsgcRFe/V
         haPwp5s9SnNfgkwD/q+XG1lj+GTW1KJCjAMSmhASilMz9cXV1OL+ng5zyRXRdnb1Kfq4
         Tklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734438856; x=1735043656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mN6TqIzQhCMb/TWw6EiGfX8Yr9HpJyuJZ+GjX/D3t3Q=;
        b=TlJKOPH1m0HiUj3AzYQHi3Y3MEiQpwuSZPyoJMKBTn2XXaF6eLEV+SEjYO8tPvjry1
         T+4KYtczp+Juf4YPeYRmKVbRrNFbamnPQknldF4c5goisw66APfgWIOWHjRpLmglIY8U
         Uujqb3awUSPxpXU3p9t7jkwe8dU/uJYRGqilTSlgLM8c7l+6G/SCPV37URypWBw1DO1Q
         fLmiKWkSMlzHzkLrec3OVe2IfVZRZKTGOXea8IqL2ncaI/34YY9ZkS7DxDqbQj3atb+e
         w4rT7tqS2c8R0qsFwv/GdDr9rtXupV/X/cSN1Kjg23JFM0Pme/GYbyiiJLJ6fqQUJ83C
         ThJg==
X-Forwarded-Encrypted: i=1; AJvYcCXUHNd1iuVo2WcWlWSBJgvLmKygKGUEI9mdQ3qxUOiXg5H3u8C+DvxEK8jbTSgAE4E0UEtdXy3lnxm+L8fANj4j@lists.infradead.org
X-Gm-Message-State: AOJu0YyF+zU7vsKkS0Bs2qV/2gDnODSRI88Hiq2SQBr5NnICLlHRHjb1
	VDI/9GLuuv5tgU7qYkibn60QqZcynVI2fltnURGlHjFeUlg2HjFcbw4Cy+xt1BI=
X-Gm-Gg: ASbGncvyG3CmC2ICPTFCaXPl1AN4wQnLekPXkG8V+EnXjNNGnbJ7b7lokn6hnwW3BtV
	DZZS4Yf8nNaCLThoU9X/NtfHBSKPx96eHpI1Ino/ttQrEHbjMhNjvQWngbjDmJgtm9sr1/VCkui
	JXPz22+IG8+omO3NJ/YIiloaIqx/RjkaxIdWnC7CgBLDCmQ+mAVbKwIOyhr0spjeB9bw6/mLxEs
	YAQdfhEReqTiUMYbTnScGsu8aZ2jijK1QS63dCRKv3KoVgT7SmZ1dl03QKE4IZ/ysHKgFJiXJ9E
	ewEdZgfvxaDWwnFFb69uOskKAr6Qy/HpQJaN
X-Google-Smtp-Source: AGHT+IG64fF0VZRsJVb2QKgF7su3lKSHe/E+XJ0mDICTjJVwLxaJk7I7Yc82GJIWZQCARYb0bWVA7w==
X-Received: by 2002:a05:6512:3c8f:b0:540:1a33:ded8 with SMTP id 2adb3069b0e04-54090555550mr4911457e87.17.1734438855594;
        Tue, 17 Dec 2024 04:34:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c20e64sm1119838e87.277.2024.12.17.04.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 04:34:14 -0800 (PST)
Date: Tue, 17 Dec 2024 14:34:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"jie.qiu@mediatek.com" <jie.qiu@mediatek.com>, "kernel@collabora.com" <kernel@collabora.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	Jitao Shi =?utf-8?B?KOefs+iusOa2myk=?= <jitao.shi@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v2 15/15] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <fm5rbujzu5og25x3nnxnhabrf4mppyy4nakxrskqtug774llnm@j47ce2zz6xsx>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-16-angelogioacchino.delregno@collabora.com>
 <803bc2bd802506635dfa9ea9b26a6ca40a7f4912.camel@mediatek.com>
 <e5788187-e894-4aab-a41e-a3d7a64762c6@collabora.com>
 <d64ff9f1525fe3563502e470b2a31303de08a7c6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d64ff9f1525fe3563502e470b2a31303de08a7c6.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_043417_390232_AF963DBB 
X-CRM114-Status: GOOD (  33.45  )
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

On Tue, Dec 17, 2024 at 06:40:11AM +0000, CK Hu (胡俊光) wrote:
> On Mon, 2024-12-16 at 12:04 +0100, AngeloGioacchino Del Regno wrote:
> > External email : Please do not click links or open attachments until you have verified the sender or the content.
> > 
> > 
> > Il 16/12/24 09:57, CK Hu (胡俊光) ha scritto:
> > > Hi, Angelo:
> > > 
> > > On Thu, 2024-12-05 at 12:45 +0100, AngeloGioacchino Del Regno wrote:
> > > > External email : Please do not click links or open attachments until you have verified the sender or the content.
> > > > 
> > > > 
> > > > Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
> > > > found in MediaTek's MT8195, MT8188 SoC and their variants, and
> > > > including support for display modes up to 4k60 and for HDMI
> > > > Audio, as per the HDMI 2.0 spec.
> > > > 
> > > > HDCP and CEC functionalities are also supported by this hardware,
> > > > but are not included in this commit and that also poses a slight
> > > > difference between the V2 and V1 controllers in how they handle
> > > > Hotplug Detection (HPD).
> > > > 
> > > > While the v1 controller was using the CEC controller to check
> > > > HDMI cable connection and disconnection, in this driver the v2
> > > > one does not.
> > > > 
> > > > This is due to the fact that on parts with v2 designs, like the
> > > > MT8195 SoC, there is one CEC controller shared between the HDMI
> > > > Transmitter (HDMI-TX) and Receiver (HDMI-RX): before eventually
> > > > adding support to use the CEC HW to wake up the HDMI controllers
> > > > it is necessary to have support for one TX, one RX *and* for both
> > > > at the same time.
> > > > 
> > > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > > ---
> > > 
> > > [snip]
> > > 
> > > > +static int mtk_hdmi_v2_bridge_atomic_check(struct drm_bridge *bridge,
> > > > +                                          struct drm_bridge_state *bridge_state,
> > > > +                                          struct drm_crtc_state *crtc_state,
> > > > +                                          struct drm_connector_state *conn_state)
> > > > +{
> > > 
> > > I would like v1 and v2 has the same behavior.
> > > Why v2 has atomic check but v1 has no?
> > > If this is better to have, add atomic check to v1, and this function would be common function.
> > > 
> > 
> > That's because v2 uses the new helpers, while v1 does not.
> > The v1 must be converted to the new helpers in order to use atomic_check() like v2.
> 
> I just find the description here, and I don't know why new helper need atomic_check().
> Would you provide more information how new helper need atomic_check()?

The HDMI helpers requires the driver to use
drm_atomic_helper_connector_hdmi_check() in order to maintain
HDMI-specific connector and CRTC state. Thus drivers using HDMI
Connector framework have to provide .atomic_check() callback which calls
the mentioned function.

> For example, the call stack to atomic_check(). (You could use dump_stack() to show it)

-- 
With best wishes
Dmitry

