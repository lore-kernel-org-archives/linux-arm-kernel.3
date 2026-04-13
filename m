Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2885F34C4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 13:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3U+lSIq/7q8TThDCAdlK4dB3enw2H+Hf1Y4jF2Gokgw=; b=Im0PwIVFG96RDkkX31zOkqaIrs
	13lMBBh6PaWBj4jO+FrTEeFe3SBOxvhde+2dKrZTaK9G11Fqup61HpYMyrP4FJGA93MHgQEdHM7X6
	stQ0FIrxXW9k2GAqufTxg6Re2Bc9UkMEgxxlDiwp7dqR/U13Io6d4A3HCkgE1FLNemIkpx2xG3Gyn
	79I5XVEKPG4d1sNBY2NG4QuW6ejj25vdvAhTbDuAY0YdmnsSMY/fYoxF93dQ4Rit1UZJziNinEXpm
	X79sGo6d5WsK1qygYrpGCY6czUL9JUeQLlSvhUNmwYHQWef8qOey+olSjQWXLVmlxbt0c7JwX+/O1
	g+GnBbnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHMj-0000000FklE-2mLG;
	Mon, 13 Apr 2026 13:30:13 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHMg-0000000Fkka-1qmy;
	Mon, 13 Apr 2026 13:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776087010; x=1807623010;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=EaZDrPfjh85b39EOno9cB8zfjPEN60TUCM0QTg9HfXk=;
  b=DYu7X24UEzWPsNGSBn+uzZOc6W09thJXZnfh2heFWDpvf3vS4k5qNQES
   gDxdnjbRQWG9JmtVc9EGm2Bua4rludNv7Oc0ee8uclS3fqzIcaDJ4YNZ3
   z1NlDaONsJHir0q+GcytAxkRR4Y0J5/W3DZvpXF3i/cYuy1mLjEAQLm11
   t0BZyApoTJGBv2zj/LIwQN+ULVDZIbSPquzq87N3oz/NOQFmCa+rJ7ziu
   IZHIPTpL7aLa1Li50mQ/HOfQ/Rxn6+Y8C6UY/ZHmaDvY0oBklQxIUV7Jb
   cjvV8Ir8uUheB3+YIxJxBmYdtOL/x9d0ESg9UeC5c3tVUYr/xd2ex05e+
   A==;
X-CSE-ConnectionGUID: vLOnZnRPS8ONR5pr/4xeYA==
X-CSE-MsgGUID: 5OB6ifZqTNC2DV00SD13bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88403936"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="88403936"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 06:30:09 -0700
X-CSE-ConnectionGUID: tbwxH7xRTmyJJtkVf0RAUQ==
X-CSE-MsgGUID: p06gP0HZRyy5S45NUTJScw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="228916730"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.182])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 06:29:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kory Maincent <kory.maincent@bootlin.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Rodrigo
 Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave
 Airlie <airlied@redhat.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Eric
 Anholt <eric@anholt.net>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Mark Yacoub <markyacoub@google.com>, Sean
 Paul <seanpaul@google.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH RFC 00/12] Add support for DisplayPort link training
 information report
In-Reply-To: <20260413141000.0e190dcc@kmaincent-XPS-13-7390>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
 <adgNxaFhbQaxC5E_@intel.com>
 <u4ononk4cpccx77gvlywtfen5rmyslvr72v7olkhdrjf65aqce@xo777vofhcan>
 <20260413141000.0e190dcc@kmaincent-XPS-13-7390>
Date: Mon, 13 Apr 2026 16:29:55 +0300
Message-ID: <3698b69f20481ff9c6fb1002b46f9862a1fdd03d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_063010_593290_B63A381C 
X-CRM114-Status: GOOD (  28.96  )
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

On Mon, 13 Apr 2026, Kory Maincent <kory.maincent@bootlin.com> wrote:
> On Fri, 10 Apr 2026 00:36:09 +0300
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
>
>> On Thu, Apr 09, 2026 at 11:36:21PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
>> > On Thu, Apr 09, 2026 at 07:08:16PM +0200, Kory Maincent wrote:=20=20
>> > > DisplayPort link training negotiates the physical-layer parameters n=
eeded
>> > > for a reliable connection: lane count, link rate, voltage swing,
>> > > pre-emphasis, and optionally Display Stream Compression (DSC). Curre=
ntly,
>> > > each driver exposes this state in its own way, often through
>> > > driver-specific debugfs entries, with no standard interface for user=
space
>> > > diagnostic and monitoring tools.
>> > >=20
>> > > This series introduces a generic, DRM-managed framework for exposing=
 DP
>> > > link training state as standard connector properties, modeled after =
the
>> > > existing HDMI helper drmm_connector_hdmi_init().
>> > >=20
>> > > The new drmm_connector_dp_init() helper initializes a DP connector a=
nd
>> > > registers the following connector properties to expose the negotiate=
d link
>> > > state to userspace:
>> > >=20
>> > > - num_lanes:      negotiated lane count (1, 2 or 4)
>> > > - link_rate:      negotiated link rate
>> > > - dsc_en:         whether Display Stream Compression is active
>> > > - voltage_swingN: per-lane voltage swing level (lanes 0-3)
>> > > - pre_emphasisN:  per-lane pre-emphasis level (lanes 0-3)=20=20
>> >=20
>> > I don't see why any real userspace would be interested in those (apart
>> > from maybe DSC). If this is just for diagnostics and whatnot then I
>> > think sysfs/debugfs could be a better fit.=20=20
>>=20
>> I'd agree here. Please consider implementing it as a debugfs interface,
>> possibly reusing the Intel's format.
>
> Sorry, I completely forgot to include a paragraph explaining the rationale
> behind using DRM properties.
>
> This DisplayPort link information report was requested by OSes to allow t=
hem to
> assess the capabilities of each DisplayPort connector on the system, and =
to
> guide users from the most to least capable ones. It will also enable the =
OS to
> warn the user when a cable is too long or experiencing noise (indicated b=
y high
> voltage swing and pre-emphasis levels).

The selection of the number of lanes or link rate are at the discretion
of the driver, or link policy manager in DP spec terms. It does not
really convey the capabilities of the *connectors* but rather the
current *link*. Ditto for enabling DSC.

I don't think the voltage swing and pre-emphasis are really diagnostic
measures either, but a response to measuring and adapting to the
link. And if the link training failed, the driver may have already
reduced the number of lanes and link rate to compensate. So you could
appear to have the perfect link only because it was so bad at high link
rate that it was reduced already.

The policies may also vary from driver to driver, and possibly depending
on what makes sense for the hardware (e.g. power consumption with or
without DSC).

I think "link information report ... requested by OSs" is vague, and I
don't think the concept has been completely thought through. I can't see
how you could present reliable and actionable information to the user
with what the patch at hand provides. Or how it could work in a generic
manner across drivers.

Overall sounds like an XY problem [1]. We should focus on what you're
trying to achieve first, in userspace, and only then think about what
the appropriate kernel mechanism should be.

I don't think this is it.


BR,
Jani.


[1] https://en.wikipedia.org/wiki/XY_problem


>
> Since this is information that OSes will consume on a regular basis, expo=
sing
> it directly as DRM properties seems the most appropriate approach.





--=20
Jani Nikula, Intel

