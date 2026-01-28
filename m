Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B26D3F074
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifdIKBALmrDtlGji95Dn4uLjAd1QzXtIVq+J3SL2uiM=; b=mwvuro7P5ackxjT9nil7hvFvWe
	8IIf7kvY+/gLpL9R+2NG4A09QiVpGm7RZ39dIspUQRYbPdu21X6l5eWaO0kmQtcDpxo4ryK+CF4Ym
	kTpy+EF3TMiWYCD73IwtpTf7kRAzxaqE6kVs3srkLQgWTBxt7eLpNHqiRuLu9psz/yg/VtBdMlu9+
	Xi6VXHnZxCZNn7R9r3cx60lTTievAAHd8ftalcV6kDmQ81SxEsZMAa6NOZOrsmb/qWgkSto628lsn
	yS9BcJ7i0MGoj9buHNRK1UYoNJZUX23AIqr2Pj6H+LU7xCCebqCVz78m6BZ9T6T/nRvZnAYKGVm5B
	8l8c/Acw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7RI-0000000GHFU-3iVK;
	Wed, 28 Jan 2026 15:26:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7RG-0000000GHEU-20GM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 15:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ifdIKBALmrDtlGji95Dn4uLjAd1QzXtIVq+J3SL2uiM=; b=BsV07P99v8XbY2L6w6VKf5ahg1
	4QxJKbDccemO080G6GBXbY7fSePlsBA9mZZBO7ZUHmw2dMSuQb+e6XB4wYdti+CiH/QfboJpm3NZG
	HFYvzCn8gEAHgn3hQqfbN7rDyHKuIzhUKPPiXp/4c7PSzGZzcDgdsdN9p+9B0Ail0jwF5+R3B46EQ
	OaIKjaWE/mKaoC3BmJC6+80vat9BOpo+YYbV/avz/BQmtiEZQ/fSN5rBrs1R9z34AhiP3fUp3W7+F
	b9X3NlV5Nrf0kCUgZa2+9cKQnaHtdzk6xNwn74WGpH09IBaMAIm5SLW+b+2CsAMhZrgGQgNt9DcT4
	0zBIf4Xw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7RC-00000008pk8-3Fxm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:26:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 95FCCC211E8;
	Wed, 28 Jan 2026 15:26:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8D176071F;
	Wed, 28 Jan 2026 15:26:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09B66119A86D4;
	Wed, 28 Jan 2026 16:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769613989; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ifdIKBALmrDtlGji95Dn4uLjAd1QzXtIVq+J3SL2uiM=;
	b=ZBrv5OTsxnvC31C9xB5u3t92JpXYvSfGTBtbzpE1nwuHruAK57TjVcGMS3APCHv4l9SF/E
	wnqAQ55EFsg6Uj8+Ym01dWq/BJk9kjEcjm3JoqkQjhOyiTejWsxXKc9iZ6Utsubt6Y4bzq
	cqdqoHfypaQthCvQtpBCwD5UR+Mrs/C+MyqWvVgQ8NfmSW0KnRnaztVhOs2s/Pk6EGyLqc
	+qNIkWAByljlRPA9ZsxpbMXwdVOfJA1pNsG5HdTOzd4POa95lQpTLenMXpI2+eS7+mdf9W
	v03OkG2M3vHFVTUlnyDCCl7Ch2B+i2I0bsHAaRRmhM5ozz4ujvb/gEq/asKfVQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 16:26:22 +0100
Message-Id: <DG0BSWR9XRZS.29D743F5RWI8N@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: (subset) [PATCH 0/3] drm/bridge: imx: A few fixes
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
X-Mailer: aerc 0.20.1
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <176951374753.94588.10653964166300906894.b4-ty@bootlin.com>
 <f11d4407-9951-40a3-bde5-583ca1ca5bc5@nxp.com>
In-Reply-To: <f11d4407-9951-40a3-bde5-583ca1ca5bc5@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_152635_020100_D6FA176D 
X-CRM114-Status: GOOD (  17.12  )
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

Hello Liu,

On Wed Jan 28, 2026 at 2:50 AM CET, Liu Ying wrote:
> Hi Luca,
>
> On Tue, Jan 27, 2026 at 12:35:47PM +0100, Luca Ceresoli wrote:
>>
>> On Fri, 23 Jan 2026 17:22:14 +0800, Liu Ying wrote:
>>> This patch series contains 3 bug fixes for i.MX8QXP DRM bridges.
>>> Each patch fixes a NULL pointer dereference issue and stands alone.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [1/3] drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference in imx8qxp_l=
db_bridge_destroy()
>>       commit: 852c68bf42965ee38b465d2d6f7b965eb0b5dc1d
>> [2/3] drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8q=
xp_pxl2dpi_bridge_destroy()
>>       commit: db7e7ea838c916ee4cdf26bee126fd36f58295dc
>
> Any reason why patch 3/3 is not applied?

Yes, the reason is there's a patch conflict and I still have to find out
how to handle it.

Patch 3 by the rules [0] should go to drm-misc-fixes because the bug (added
by [1]) is already on Linus' master tree (since v6.17), but it does not
apply there due to a conflict with an unrelated change [2] currently on
drm-misc-next.

Note that [1] and [2] are the two commits mentioned in your 'Fixes: 'tags.

I had a chat with Maxime on #dir-devel about how to handle this situation
but still haven't got a final answer.

I guess the correct way is:

 1. apply patch 3 on drm-misc-next, where it applies cleanly
 2. send a modified patch for drm-misc-fixes, to fix ASAP the master branch

Would you send the patch as in item 2, so it can be applied to
drm-misc-fixes and have master fixed ASAP? Note iit should not mention [2]
in the Fixes: tag because [2] is not yet on master. I can send it of course
but you can test on hardware so that would be the best option (and I'm a
bit overloaded at the moment).

[0] https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-=
drm-misc.html
[1] commit 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to de=
vm_drm_bridge_alloc() API")
[2] commit ae754f049ce1 ("drm/bridge: imx8qxp-pixel-combiner: get/put the n=
ext bridge")

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

