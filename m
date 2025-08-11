Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04C2CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxrZzkcx2EcLzf1PmmakOYUaazHyNZdo2XN9MJYVzZ4=; b=Vb88TyV5mPczwZZtu/hucwQJJe
	OValGj7EN2sgaMl6E7I8T+DaGaS41ljgCufN7uIpKid9446YJ5/onbxzI3VyShb5CVxfyGFVYGsmL
	SwdeschHAEX3TXPWRsVybG/y9pKwhiWMn4CQ6cHU6lvuwIbyxnZnRQogTzy/qAgY8KbBFBYrbcCYz
	mGmISrKPyhW7r+o0pRMsCrEZduccuSdOUuevvmv9EXKbRyCCbtncYsv5I2j0zyMvJ3Ro9iSXZNLCr
	CPCSXxO1UfpbXswRx9poZZLZu3gVN8iFS4uWgr2nTWMRY+GoaiKtwYdgH4sWHWusJJj87v4DxMo9z
	Wy4TNkCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulabB-00000009ADY-05t8;
	Mon, 11 Aug 2025 22:02:33 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVTM-00000008QFs-3l5o;
	Mon, 11 Aug 2025 16:34:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1754930035; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WALDvJUiY6agdTMVjbOdgsyLM0rooteGQ1Q2+Z0txOcryAUTuTDrS7mM7LxWJM7O7i83n5j7BBH5lSg1sMmcBL+jZytUwk2x7B3aJ+lSexS2OhFQpK2d9cQL7hrr/UiuO/OxE2nQ1huxt241vyQbDwAZ/FSemnay6ZWkE4YWSMU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754930035; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lxrZzkcx2EcLzf1PmmakOYUaazHyNZdo2XN9MJYVzZ4=; 
	b=RY1IHERjRqTpFmJVzLZqtb7WDX0BgvvM4TkMXtDkdMckef1FY+3qmdcLisKwAAizhPZ9DsTQF8M94z17CGYhnyOV6Wq2aFjVNtpuvO6gqmZdrNCxqIOZaJVumTQxbbWgZCk+hsTcMUFPSvn3LFVVOZoea/HiORk1hPbiKapc+Dg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754930035;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=lxrZzkcx2EcLzf1PmmakOYUaazHyNZdo2XN9MJYVzZ4=;
	b=TV+lgzfYkfuWIOP8R63YlN16wY89pJ7dNVeThEbfhEOD7qpDzJLA3U0P22xI+Yuj
	8MBiFiTw//d7JKgK+mQqUngx7dnAK1Lj4uDzx6JbPsmuQtkpm6REFRNU8C/b5qweOCA
	aUDweGIL5Rx/sjCGVnrMMLi27lnur8BWxoLMqZMQ=
Received: by mx.zohomail.com with SMTPS id 1754930032659396.3146876115104;
	Mon, 11 Aug 2025 09:33:52 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Mon, 11 Aug 2025 12:33:51 -0400
Message-ID: <2377895.ElGaqSPkdT@trenzalore>
In-Reply-To: <11040209.aFP6jjVeTY@diego>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
 <11040209.aFP6jjVeTY@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_093408_967101_160D71F6 
X-CRM114-Status: GOOD (  22.99  )
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

Hi Heiko,

On Monday, 11 August 2025 05:56:00 EDT Heiko St=C3=BCbner wrote:
> Hi Detlev,
>=20
> Am Freitag, 8. August 2025, 22:03:22 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Detlev Casanova:
> > These variants are found respectively in the RK3588 and RK3576 SoCs.
> > This patch only adds support for H264 and H265 in both variants.
> >=20
> > As there is a considerable part of the code that can be shared with the
> > already supported rkvdec decoder driver, the support for these variants
> > is added here rather than writing a new driver.
> >=20
> > This patch set uses the newly introduced hevc_ext_sps_[ls]t_rps v4l2
> > controls for HEVC [1].
> > Therefore, a patched version of userpace tools is needed for HEVC
> > support (added for GStreamer[2] and in an early stage for FFmpeg[3]).
> >=20
> > This patch set also depends on the preparation patch set sent earlier [=
4]
> > as well as the iommu restore fix [5] (already merged in linux-media) and
> > Nicolas Frattaroli's bitmap patch [6] to support setting registers that
> > uses upper 16 bits as masks.
> >=20
> > [1]:
> > https://lore.kernel.org/all/20250807194327.69900-1-detlev.casanova@coll=
ab
> > ora.com/ [2]:
> > https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9355
> > [3]: https://gitlab.collabora.com/detlev/ffmpeg
> > [4]:
> > https://lore.kernel.org/all/20250623160722.55938-1-detlev.casanova@coll=
ab
> > ora.com/ [5]:
> > https://lore.kernel.org/all/20250508-rkvdec-iommu-reset-v1-1-c46b6efa6e=
9b
> > @collabora.com/ [6]:
> > https://lore.kernel.org/all/20250623-byeword-update-v2-1-cf1fc08a2e1f@c=
ol
> > labora.com/>=20
> > Changes since v1:
> >  - Add parsing of the short and long term ref frame sets from the new v=
4l2
> > =20
> >    controls
> > =20
> >  - Add RPS cache to avoid parsing the same data again
> >  - Fix HEVC pixel formats selection
> >  - Fix multiple indentation errors
>=20
> when applying the series, git was a bit unhappy about some whitespaces:

Mmh, it looks like some rebase issues. Thanks, I'll fix those !

> > Detlev Casanova (12):
> >   media: rkvdec: Switch to using structs instead of writel
> >   media: rkvdec: Move cabac table to its own source file
>=20
> Applying: media: rkvdec: Move cabac table to its own source file
> .git/rebase-apply/patch:535: new blank line at EOF.
> +
> Warnung: 1 Zeile f=C3=BCgt Whitespace-Fehler hinzu.
>=20
> >   media: rkvdec: Use structs to represent the HW RPS
> >   media: rkvdec: Move h264 functions to common file
>=20
> Applying: media: rkvdec: Move h264 functions to common file
> .git/rebase-apply/patch:278: new blank line at EOF.
> +
> Warnung: 1 Zeile f=C3=BCgt Whitespace-Fehler hinzu.
>=20
> >   media: rkvdec: Add per variant configuration
> >   media: rkvdec: Add RCB and SRAM support
>=20
> Applying: media: rkvdec: Add RCB and SRAM support
> .git/rebase-apply/patch:200: new blank line at EOF.
> +
> Warnung: 1 Zeile f=C3=BCgt Whitespace-Fehler hinzu.
>=20
> >   media: rkvdec: Support per-variant interrupt handler
> >   media: rkvdec: Enable all clocks without naming them
> >   media: rkvdec: Add H264 support for the VDPU381 variant
> >   media: rkvdec: Add H264 support for the VDPU383 variant
> >   media: rkvdec: Add HEVC support for the VDPU381 variant
>=20
> Applying: media: rkvdec: Add HEVC support for the VDPU381 variant
> .git/rebase-apply/patch:3483: new blank line at EOF.
> +
> .git/rebase-apply/patch:4035: new blank line at EOF.
> +
> Warnung: 2 Zeilen f=C3=BCgen Whitespace-Fehler hinzu.
>=20
>=20
> Heiko





