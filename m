Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6484FCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59GDvGkxf3cHZtAQ2AAidgdUgpnfTEwmRZmFMmIXUBM=; b=xlvcKHP+Tw8FD69mxpIhoRkMA6
	FBs8cBrEZqSrSgKYXrrrnLemQeWP5Wa+Frv4qiXXOscC4Kvm383AIOfWIy5spwbqytNSZW6xuMQGm
	Ndk457aFOa9FODtRFSkxmOtaR3RS8fhIo9BJalcQH/DTxtFkaC/jBnvykdndx2hzT1rjxnuCE0ByL
	JfYVn4iqU9W5Y/FkZY5s44Trt2jhTE1jYQt0cxDn6btDcUhjHqp9LhAefJJKg4RZHIZUQxR8+Bo50
	ykURhuFYKxv25PMRpVAAaPeTFrV1tTVLOidBoulCXJXTH0lK76GcbIWsZhl2ZUBMwpGmNE+9Jz7RE
	QFGGOntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbBJ-000000093kO-254V;
	Thu, 11 Jun 2026 08:54:33 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbBF-000000093je-1g2w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:54:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A1AD2C49F69;
	Thu, 11 Jun 2026 08:54:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A6925FF03;
	Thu, 11 Jun 2026 08:54:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3564106B9477;
	Thu, 11 Jun 2026 10:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781168064; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=59GDvGkxf3cHZtAQ2AAidgdUgpnfTEwmRZmFMmIXUBM=;
	b=lNi/XdDnbrP4ELsevq7Ct9EK0bIg9nouRauRmtlYYjVjULpigORAvDxGGIx9sWsnTega8d
	CZf4OQFho7OL2/4YdDVIYm/K8CB3CIBJD/j/2vTX0VBvuqJLmv0oEVR7zh19M4b/ge3LSQ
	I2oE2bQyA4n+xqhkktJFocnIJl8ZfolR5BmmP7DSeA2lJeyE8Qqt/chMWuJUBpu7ckat5d
	6LqN5ctT1Gh45eEQJGF4vmL/O+6834D7Rj2Y0Jmk1MyxoA0QrBvNkgluqK0DH4kKQOD70o
	5rtwoDTKSSzav4WRygvNcut1xMaDp8mIAiG2zPw/LijjDBAqo3ubc/YA4my+IQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 10:54:14 +0200
Message-Id: <DJ63DNXUOW46.1DI6982PGPFRR@bootlin.com>
Subject: Re: [PATCH 19/37] drm/bridge: samsung-dsim: move drm_bridge_add()
 call to probe
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>,
 "Stefan Agner" <stefan@agner.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
To: "Maxime Ripard" <mripard@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-19-45e2bdb3dfb4@bootlin.com>
 <20260608-mellow-weasel-of-politeness-a56172@houat>
In-Reply-To: <20260608-mellow-weasel-of-politeness-a56172@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_015429_620545_DCA09F7C 
X-CRM114-Status: GOOD (  25.38  )
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

On Mon Jun 8, 2026 at 1:58 PM CEST, Maxime Ripard wrote:
> On Tue, May 19, 2026 at 12:37:36PM +0200, Luca Ceresoli wrote:
>> This bridge driver calls drm_bridge_add() in the DSI host .attach callba=
ck
>> instead of in the probe function.
>>
>> This works for current use cases but is problematic for supporting hotpl=
ug
>> of DRM bridges. The problematic case is when this DSI host is always
>> present while its DSI device is hot-pluggable. In such case with the
>> current code the DRM card will not be populated until after the DSI devi=
ce
>> attaches to the host, which could happen a very long time after booting,=
 or
>> even not happen at all.
>>
>> The reason is that the previous pipeline component (the encoder in this
>> case) when probing cannot find the samsung-dsim bridge. What happens is:
>>
>>  [1 and 2 can happen in any order, same result]
>>  1) samsung-dsim probes (does not drm_bridge_add() itself)
>>  2) The lcdif starts probing multiple times, but
>>     lcdif_probe
>>     -> lcdif_load
>>        -> lcdif_attach_bridge
>>           -> devm_drm_of_get_bridge() returns -EPROBE_DEFER because
>>              the samsung-dsim is not in the global bridge_list
>>              (deferred probe pending: imx-lcdif: Cannot connect bridge)
>>
>> The samsung-dsim will not drm_bridge_add() itself until a DSI device wil=
l
>> try to mipi_dsi_attach() to the DSI Host, which can happen arbitratily l=
ate
>> on hot-pluggable hardware.
>>
>> As a preliminary step to supporting hotplug move drm_bridge_add() at pro=
be
>> time, so that the samsung-dsim DSI host bridge is available during boot,
>> even without a connected DSI device. This results in:
>>
>>  1) samsung-dsim probes (and adds to drm_bridge_add() itself)
>>  2) The lcdif starts probing multiple times, but
>>     lcdif_probe
>>     -> lcdif_load
>>        -> lcdif_attach_bridge
>>           -> devm_drm_of_get_bridge() --> OK, returns samsung-dsim ptr
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> We should probably amend
> https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#special-c=
are-with-mipi-dsi-bridges
>
> To mention this use case here

Right. I haven't updated the docs for this v1 because I was not sure the
overall approach would be acked. Now Dmitry acked it overall, and I kind of
infer you are not against, so I'll look into updating the docs in v2.

However I find that section of the docs a bit hard to read especially from
a newcomer perspective.

A better understanding on my side would help in doing the right change as
far as this patch is concerned, and as a bonus in improving the section
overall (that would probably be a separate series).

So I have a couple questions to start from:

 * Do I understand correctly that using the component framework is legacy,
   not recommended for new DRM development, and that converting existing
   code to stop using it is welcome?

 * The first bullet quotes "The upstream driver [...] isn=E2=80=99t a MIPI-=
DSI
   host". If the upstream driver of a MIPI DSI link isn't a MIPI DSI host,
   what else could it be? What are the use cases here?

 * If read literally, none of the 4 bullets after "Indeed, there=E2=80=99s =
multiple
   cases that needs to be considered" covers this driver (it does not use
   the component framework, it does not use DCS, and the upstream device is
   a DSI host). However the 3 bullets after "The ideal pattern to cover the
   last item" appear to cover what this driver does.  Do we need a fifth
   bullet for drivers like this one? Or...?

 * To me it looks like the "bridge" word in this section is always used to
   refer to the DSI device. Would it make sense to replace "bridge" ->
   "[DSI ]device" in this section? (especially as the DSI host is also a
   DRM bridge)

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

