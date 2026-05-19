Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942FCCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWhA2l3IClL+43G9DNlRymSvZYf9QjyK4ldzTg5asIU=; b=YW2GisaHtnTRNWJr6UzD0+jKvk
	vWemTYobL67KjekCpc0kFgi9+dJ4Gfw2qVg6dFEpdZ3l19OJQsUuc1aK6QwGZEFUKxFENg5UuVEFC
	I/GqwuibbN0fN2xTng1EKn1R3HRWIPKl+pKWedKy0kWHDqQin5wrU3y6T/oAupTdkF4F+RAWKsFRY
	tXzO/vxjfdt9nffFbCSTCqgpfjxQqOK+ntPSF8sOgXQgehp1Mfa4HrD2ECeCUEfCAemQEFUlv8N07
	L4Prn/6cYYy7F1R8bB48bZFxLq/Ie/9EuGOTpTjv1usuFC63M+fARIx9m1b5J5p9IO1IMLuEZjiMG
	PDAmpyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJEU-00000001Q5O-0ZoV;
	Tue, 19 May 2026 12:07:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJEN-00000001Pz9-2H6q;
	Tue, 19 May 2026 12:07:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E4903C2B9EA;
	Tue, 19 May 2026 12:08:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A26235FFC8;
	Tue, 19 May 2026 12:07:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23AB7107E8EB4;
	Tue, 19 May 2026 14:07:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779192443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NWhA2l3IClL+43G9DNlRymSvZYf9QjyK4ldzTg5asIU=;
	b=m1WzIo1BcY7oz/3VzBb1IIj5Ph5RHz8dP2VKTmCId9aZNKTn4VmfDWNwS9w/m8lsZCKNoX
	WRxjG5moVsvq5yKK7UTUAK/iI8MUVS1EBF+B+CZ1rjLHHkHHVwWpAyrYrwaV7KD1S40mth
	HbxCCYsExdf9SBZQigzkET7gxIKf5USZCnrMXlfAWF85r1KI748FL0sgD/JIclJqT3GLWj
	abBe7ew7HMe7K6G3dGQdqblic4KP63IXlp1UVyGenxyz3No4rRaC64nR22z+q39rXPgsjJ
	zVNAK3g+nq2gfgPKaQdFzcr1TU9ROlyvEpfmMM8csp0yme3jwRfCpHaqUFliyA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 09/23] drm: bridge: dw_hdmi: Unregister CEC notifier
 during connector cleanup
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liu Ying <victor.liu@nxp.com>, Sandy Huang <hjc@rock-chips.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260518180206.2480119-10-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
 <20260518180206.2480119-10-jonas@kwiboo.se>
Date: Tue, 19 May 2026 14:06:59 +0200
Message-Id: <177919241969.545972.1258246873508613782.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_050727_739664_6D250009 
X-CRM114-Status: UNSURE (   6.68  )
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

On Mon, 18 May 2026 18:01:45 +0000, Jonas Karlman <jonas@kwiboo.se> wrote:
> The CEC notifier is being unregistered when the bridge detach,
> something that happens earlier than normal connector cleanup.
> 
> Change to unregister the CEC notifier at connector cleanup, in the
> connector .destroy() func, to align the lifetime of the connector and
> the CEC notifier and closer match a drmres handled generic CEC notifier.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


