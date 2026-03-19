Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CC81090239
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkjoYtdYF/Iwzn1meCEZtKvbIQUJOnHhQ0CtQ4b7pPs=; b=NBc9QQGGkB3uafSqU0eE8dGPmH
	MFMpD0xM9EQEtUVxgIoyN2K58TtH27MQUdPU/FkU5gm/7kjL8FmaY/jJii2h/0NN6B/W0duIDRX4B
	fxUXPRej8u06HNqu7sMI3GWvx01UMcHsp+Yz4FZprZ6KwUbarZ06yCOa9mriUgB7pWOicvjBfLz1q
	Oo84azdqbmbl9z5RGX5Gcat0o98mWvM3jZetdRg/o0w2ymQURCEBW7OwJke1KXtzPg6xvi7fD3S/M
	8vvgiWs2mWiEZHap0Jd//2T+k4y7/BBra70Q2/XMS/0w0zR/e4Wtoyce2B5trOzCwDqQQL4IgAAF/
	frBeElaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EqO-0000000Aqt1-29t4;
	Thu, 19 Mar 2026 14:59:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EqM-0000000AqsK-3LYe
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 14:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XkjoYtdYF/Iwzn1meCEZtKvbIQUJOnHhQ0CtQ4b7pPs=; b=Bw6ECVi4pu2HR/zUzVP5fXsapV
	EvrZkOxuFiqrNT3dP/f+dKpt8Om9rxIqeKI2x0q0EuTLdX82cY+qB98i808K2LJr5jBsDmq960o9v
	HlwtcmmeunMhkv42uNTfZRjVPtMq8TT4QVo3kWfzETrsGjxhr2yYUcsasq+uVdvDEDY41MZ5R1PTd
	3Tg2qhLqo6w0Xgf1ZCMbtlgUAfyStiRQgzA24ET+AljKpIXkgniHzzt4WcApcCXJ8e14Fidm9JTAx
	6TdM8spsbMWFrWCAn52EDIJ/g4SK22o9nvjz6IOzRdtSZ5G4liUxb8mIB95Mvg0UlPTOWDw/yi+6F
	kPVF7Dkw==;
Received: from mail-24420.protonmail.ch ([109.224.244.20])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EqJ-0000000Dl54-1vkH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1773932353; x=1774191553;
	bh=XkjoYtdYF/Iwzn1meCEZtKvbIQUJOnHhQ0CtQ4b7pPs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=skI9Q9j9XLKLTVSVbYnDqcv61aIAeUEqWJiv9ZRh/zbdFJQbTCS5vFu3gKJkI/uyD
	 UDptZ9rm3O0hYcOJhAoBsjNvY7BZfucxl7wn+kGjiqldAT0QrNgDUciqfIolNwKDCH
	 OXWZYyzxY+EXtksLqOE7XzgL6i0Z2E00FnwE840eSRlumtynxE6lEt8aWHHnaCe6Fh
	 7MWkOIMm2+7C/nBdFaRV0Ef76iqRyKR+9G9QfjUgUOsFG20WV/yAql/WYBzbYo99jn
	 ZFhBKCs8DAYWUCJNgYTorFEgLTG8MDOo5hqx1VeiGRiTVnqJM7taJDhy57iESgGNYs
	 l5dwOT+VUQHBg==
Date: Thu, 19 Mar 2026 14:59:08 +0000
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Pekka Paalanen <ppaalanen@gmail.com>, Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v8 04/11] drm/fourcc: Add DRM_FORMAT_Y10_P32
Message-ID: <5zkelJBm0aeSnp__adMEfjOl_GAg7G_W1GyDWix8dQ48gqSmuM1if1c2Vz_xPNNpKy8_SiUh4l7WRs-12b8_DkD0PUWLdCwubo2k_DLh5eE=@emersion.fr>
In-Reply-To: <20260128-xilinx-formats-v8-4-9ea8adb70269@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com> <20260128-xilinx-formats-v8-4-9ea8adb70269@ideasonboard.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: c8860550323f58a7acb7ccfa1229875c3a51527b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_145923_797324_26FC9AF1 
X-CRM114-Status: UNSURE (   7.32  )
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

On Wednesday, January 28th, 2026 at 18:25, Tomi Valkeinen <tomi.valkeinen@i=
deasonboard.com> wrote:

> Add Y10_P32, a 10 bit greyscale format, with 3 pixels packed into
> 32-bit container.
>=20
> The fourcc for the format is 'YPA4', which comes from Y - Y only, P -
> packed, A - 10 (as in 0xA), 4 - 4 bytes.

I know we aren't super consistent about DRM format names, but=E2=80=A6 this=
 _P32
suffix doesn't make sense to me: we never had it before, and a lot of
DRM formats are packed (in the Vulkan sense [1]), so I'm not sure why
this one would need it.

What's special about this one is that it's the first (AFAIK) which has
3 pixels per block. Some YCbCr formats are sub-sampled, but always use a
square block.

I would suggest something like YYYX1010102. We use the "channels
followed by bits per component" pattern elsewhere.

[1]: https://docs.vulkan.org/spec/latest/chapters/formats.html#formats-pack=
ed

