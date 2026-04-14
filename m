Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98887F531F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 07:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSwJySJHo0hT7GXeWrDOalz8cnz5bMLyfqqv3BHlXRA=; b=2z4XaOmVymwuNjtIF4dzVjntxO
	ey8jTXYBmvUCjy7s8Kmy7ExDC7d1P8//3KlPqHMuD9SChgbGtwBSq7hNNm0P1ldBJPzxDbSoKV0J8
	hYMjkkG1Lb2rBfM1MXE5gDGpqcyfgDQ53iU15FHM850ZH4PGR6bRElNalZysnbJ5Wraxh9Klgl6g9
	FSbV8U3xBa8LPYW0aVTqZqtHrVKISXAOVbNz/8dFhBJDuKkvXlksfDfDUhlvsdwTSTXIX5VwEN9CQ
	te6m6CLhkp5or+cA7u3hihbeLYYxB0GPrF4dLSlGPtiBvovaivfFBqxSpk6vjII0gZxcmserL3lAz
	I9oaILGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXnM-0000000GsKL-3X3s;
	Tue, 14 Apr 2026 07:02:48 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXnI-0000000GsK3-4C0K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 07:02:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4D47BC5B1BB;
	Tue, 14 Apr 2026 07:03:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EA1C5FFBB;
	Tue, 14 Apr 2026 07:02:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE66810450D08;
	Tue, 14 Apr 2026 09:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776150160; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GSwJySJHo0hT7GXeWrDOalz8cnz5bMLyfqqv3BHlXRA=;
	b=OJBuMBRnZ+1k0pvNy34xrHqO2sDtPpDWaR5tU5nqeGGgWSkYmHpD2OCmU8elLppdM+FZfO
	w0DduviNhyxdv6HA5bPmhN6QWm7zZhJe9bpszUAgTALiVlrDx7Z/J1cBi/t/Ry5rdFzOqu
	R9JonwE28Dtat/FKH00kCLyUE0whYkGlR+uKNLDuDgfj/Rdw8vBC2f0BPneCgtCaLa/GIJ
	jH1rCkKR5yfbF2aexL9UkLhqJVKUEXAtibTr52l0hPNZ6RGKDm20chWzXLhfzHC4ky6OIq
	KWfO9iSdVGivMNMZCB0IM5Bz+oH6rKh94YLpmIIoLEF+6QQz3VK4UTlBsapH1A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 09:02:27 +0200
Message-Id: <DHSOOH7FU7Y4.1R63I92H08W86@bootlin.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 10/10] drm: of: forbid bridge-only calls to
 drm_of_find_panel_or_bridge()
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Xinliang Liu" <xinliang.liu@linaro.org>,
 "Tian Tao" <tiantao6@hisilicon.com>, "Xinwei Kong"
 <kong.kongxinwei@hisilicon.com>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 "Yongqin Liu" <yongqin.liu@linaro.org>, "John Stultz" <jstultz@google.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Michal Simek"
 <michal.simek@amd.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.20.1
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com> <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-10-acd01cd79a1f@bootlin.com> <nligqvm3lq6n556onglmb345arxztd4pc6fboo4yrs3bfu27eu@uiyu2xklnexb>
In-Reply-To: <nligqvm3lq6n556onglmb345arxztd4pc6fboo4yrs3bfu27eu@uiyu2xklnexb>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_000245_245533_8C2B9E41 
X-CRM114-Status: UNSURE (   9.58  )
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

Hello Dmitry, Maxime,

On Mon Apr 13, 2026 at 8:04 PM CEST, Dmitry Baryshkov wrote:
> On Mon, Apr 13, 2026 at 03:58:42PM +0200, Luca Ceresoli wrote:
>> Up to now drm_of_find_panel_or_bridge() can be called with a bridge poin=
ter
>> only, a panel pointer only, or both a bridge and a panel pointers. The
>> logic to handle all the three cases is somewhat complex to read however.
>>
>> Now all bridge-only callers have been converted to
>> of_drm_get_bridge_by_endpoint(), which is simpler and handles bridge
>> refcounting. So forbid new bridge-only users by mandating a non-NULL pan=
el
>> pointer in the docs and in the sanity checks along with a warning.
>
> Are there remaining users which still use either the bridge or the
> panel? Would it be possible / better to drop the two-arg version?

Yes. I counted ~20 panel+bridge and 4 panel-only callers with this series
applied, and on top of those there are devm_drm_of_get_bridge() and
drmm_of_get_bridge() which to me are the real issue because they make it
impossible to correctly handle bridge lifetime.

We discussed this with both you and Maxime a while back. AFAIK Maxime has a
plan to make every panel automatically instantiate a panel_bridge. I think
that's the only reasonable approach to get rid of
drm_of_find_panel_or_bridge() + *_of_get_bridge() and make bridge lifetime
easier and safe.

@Maxime, do you have updates on that idea?

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

