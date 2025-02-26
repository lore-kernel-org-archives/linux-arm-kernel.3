Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B811C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBvlcDZJjiFBF2gq7CnaJtPrKlUyhkTAXHh7O8k3KuU=; b=lJHbuINSsgE53VEqhZxu0X7UZY
	L4aLYW2odhVqTCjVpI/uqPryqu6GYHXu+xJgCcDphaX2KyfG6wmC2Plm2yCH01a/QS71n/0Mmqzb6
	RDZ1tKj6wri1Dcmwm+XtKptNpcFwmpXdXW0jZMKIutQSDQye2yZDdM5HisrBVdP1P7DIPuW92YZiL
	C+CUdFua59cmpHAqnESC8qAYQgX25CkSj5fSRyBSMlVVK8W4cFgeHWHL4FKjfQTMcQubzk9/AOCTq
	OJqfidoOLM7+85QDWsle/APZhI8D6M01tUFGmQ55RSVi9YabXOkeHNHlY3emFWlYE2KX0tspuyEBf
	uGo2sklA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHPw-00000003qoO-3Mpg;
	Wed, 26 Feb 2025 13:25:40 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFfc-00000003UX2-2XSB;
	Wed, 26 Feb 2025 11:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740569624; x=1772105624;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=bj8u/VTfvEKSVadoM6eWhJguZpmIx7UFV9zPkjdjO6o=;
  b=Q6ytFVy0B94ZOPYXgpDWxSd07r9X2IlJVKmMwPXakYKBZ8FORzDtxLrg
   ZXUVhNCMtQsEn8FjeDk4LPgGWg/tgv0QCSogiIhenPndtfA9uXjitpgBa
   5l3duEsWy2KQrtvtCXHmviwdSp2B3ZDDBPS+Kosuo62P3UYBBB38z3x6l
   UrvD/trhUrwDaCZgxF95POU6Zko9YvT0+LG/R0JrMX0YCPfCxu0gxGdqa
   zYSP3avgTFJ3PNdqP8GCchqneBm64kRp+Uh0b7YWoTW1m0DL+t9T1mbLd
   GYdYOJktlYB26llgzqSMbraMNSZ9gR6y0Z1vSvBstKmQgCk5PJGUH4PEO
   w==;
X-CSE-ConnectionGUID: f52+H702SoS15wKAhSptZg==
X-CSE-MsgGUID: LQiIKRYmQ362kJGNwejMtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="66781900"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="66781900"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:33:38 -0800
X-CSE-ConnectionGUID: TJihvrrsRgeQybRZ0yeiSA==
X-CSE-MsgGUID: 5L4ZB8/RTCS7cCKbWuK2zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116680184"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.74])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:33:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Yan <andyshrk@163.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Sandy
 Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, sam@ravnborg.org, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>
Subject: Re:Re: [PATCH 2/5] drm/rockchip: stop passing non struct drm_device
 to drm_err() and friends
In-Reply-To: <f5dc475.a51e.19541d449c5.Coremail.andyshrk@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1737644530.git.jani.nikula@intel.com>
 <f42da4c9943a2f2a9de4272b7849e72236d4c3f9.1737644530.git.jani.nikula@intel.com>
 <2c0a76c3.618c.19497bb4329.Coremail.andyshrk@163.com>
 <87plkcbfp0.fsf@intel.com>
 <730ee1d4.f63.1949b97fc99.Coremail.andyshrk@163.com>
 <21d7745d-8fcd-484f-b1f2-82fd87dc8079@suse.de>
 <f5dc475.a51e.19541d449c5.Coremail.andyshrk@163.com>
Date: Wed, 26 Feb 2025 13:33:30 +0200
Message-ID: <87plj53ppx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_033344_647075_CA423D30 
X-CRM114-Status: GOOD (  21.54  )
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

On Wed, 26 Feb 2025, "Andy Yan" <andyshrk@163.com> wrote:
> Hi=EF=BC=8C
>
> =E5=9C=A8 2025-02-26 16:33:21=EF=BC=8C"Thomas Zimmermann" <tzimmermann@su=
se.de> =E5=86=99=E9=81=93=EF=BC=9A
>>Hi
>>
>>Am 25.01.25 um 04:53 schrieb Andy Yan:
>>>
>>> =E5=9C=A8 2025-01-24 19:43:07=EF=BC=8C"Jani Nikula" <jani.nikula@intel.=
com> =E5=86=99=E9=81=93=EF=BC=9A
>>>> On Fri, 24 Jan 2025, "Andy Yan" <andyshrk@163.com> wrote:
>>>>> Hi=EF=BC=8C
>>>>>
>>>>> At 2025-01-23 23:09:09, "Jani Nikula" <jani.nikula@intel.com> wrote:
>>>>>> The expectation is that the struct drm_device based logging helpers =
get
>>>>>> passed an actual struct drm_device pointer rather than some random
>>>>>> struct pointer where you can dereference the ->dev member.
>>>>>>
>>>>>> Convert drm_err(hdmi, ...) to dev_err(hdmi->dev, ...). This matches
>>>>>> current usage, but drops "[drm] *ERROR*" prefix from logging.
>>>>> Frankly, I prefer the original version of the log.
>>>>> It is a platform driver, so it should use its own device.
>>>>> It is a driver that works in drm subsystem, so it's better to use "[d=
rm] *ERROR*" prefix when logging
>>>> If you need to do struct device based logging that is not the same
>>>> device as the struct drm_device dev member, you need to use dev_err()
>>>> and friends. You can't and must not use drm_err() and friends.
>>>>
>>>> It's as simple as that.
>>>>
>>>> The current drm_err(hdmi, ...) usage is simply abuse of the macros, and
>>>> must stop.
>>> Perhaps when you initially designed this macros, you intended it to acc=
ept only drm_device,
>>> but your code implementation didn't enforce this restriction at the beg=
inning.
>>
>>C'mon. Are we really arguing about type safety now?
>>
>>Patch 5 adds a little getter function that does the type check on the=20
>>function call's argument.
>>
>>
>>> If that's truly what you intended, I suggest just reverting this commit=
 that converting to use these macros[0],
>>> as neither drm_err nor dev_err can maintain consistency with the origin=
al log of this driver.
>>> Alternatively, as suggested by Sam  in the initial submission of your p=
atch 5 years ago,
>>> there should also be a macro similar to drm_dev_info(device *, ..).[1]
>>
>>DRM code tends to keep a reference to the drm_device somewhere and=20
>>fetches it if necessary. For this patch, it should be possible to fetch=20
>>the DRM device from struct rockchip_hdmi easily. Just do
>>
>> =C2=A0 drm_err(rockchip_hdmi_drm_dev(hdmi), "...");
>>
>>This would resolve the problem without new logging functions and keep=20
>>the "[drm]" prefix to the messages.
>
> Yes, this keeps the "[drm]" prefix to the log messages, but it also chang=
ed hdmi
> device from drm device in the log messages.
> For more efficient debugging, it is preferable for log entries to explici=
tly specify which device generated them,
> especially in DRM systems where multiple devices(bridge/encoder) may be p=
resent."
>
> And I'm ok with this PATCH. However, I would also like to know your and J=
ani's opinions on whether we can consider
> adding an API similar to drm_dev_info=EF=BC=8Cas Sam suggested before. Of=
 course, this could be left for future implementation
> by others.

I'm not at all thrilled about adding loads of variations of drm specific
debug macros. They just multiply.

The way around that would be to use _Generic() to allow passing either
struct drm_device (which would use drm->dev) or a more specific struct
device to be used for dev based logging. I'd be supportive of that.

However, this patch series is a dependency for implementing generics at
a later time. I'd like to start here instead of piling on more work.

Furthermore, there's been talk about drm display object based
logging. The generics could later be expanded to allow for example:

	drm_err(connector, "Fail\n");

to translate to:

	dev_err(connector->dev->dev, "[CONNECTOR:%d:%s] Fail\n",
		connector->base.id, connector->name);

This would simplify a lot of connector based logging. Similarly for
other objects.

BR,
Jani.


--=20
Jani Nikula, Intel

