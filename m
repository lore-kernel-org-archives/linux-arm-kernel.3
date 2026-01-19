Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64D6D29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IzZqITfxZfsqLMD97cOvLx/oTz7z6A1f/3WBHICk0E=; b=LBfFdc5gNS3h+N/N7xcuts5X+g
	gbmElnsQARnR1Xw3HMBt8i4BM+8zgTA4YVHtdM8hPsAXJobjb1Ts6+daYB2Bzl3Ig8ZuZnEc2vTTQ
	Ow1Zp+x2al5K7sufzp69Gpjq0UKf0AoPTi24/69petvQcGxoNwfDB+uUOCyMzukCLm0diBARTa8xR
	Lf1EcXlVLI1Q+nEapxa0izL1npmSFaqAOL2Jgfzw1m3/VGNc9yGDiofiYG5QAJjgmgLFB1ckW7Hrr
	fuSPSjO7tyweqMRFv8ga5A+gwyaY+1fmh7JtGCo/1K3bjlGioN10vT2zKfEnmoG45ryZa2HXWF5Pu
	MCQWiuTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrxy-00000002RlB-2nxI;
	Mon, 19 Jan 2026 16:18:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrxe-00000002ReR-1jRH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:18:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 00DEC4E42173;
	Mon, 19 Jan 2026 16:18:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C872B60731;
	Mon, 19 Jan 2026 16:18:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DE0810B6B16B;
	Mon, 19 Jan 2026 17:18:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768839515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6IzZqITfxZfsqLMD97cOvLx/oTz7z6A1f/3WBHICk0E=;
	b=pUPvqtSehbxN1xcBr3URpoIUzPLIdZF4ymZLMVtPVq6B+npB/nl1peqzjW3p39QZBEKAE2
	ZTWfkjRz630zT7QEuHuWw2cfvECsBSs9Pj/ZV2ugWXo+B6s+yGT7iPREPZsY2MnbKOgp53
	n2jtpnm8kiqsDutFGsV/2AGTFsIHYaDnCPmV0NIqYzWsJZ4JXmZgpaUEPPSnbnbLl04XXD
	MQlO0OsfnbeuYn5h4REjHALwDvQFmhBbnccS1LSclOWP2Wtiv0B/Mk9BU3+DdNc/SOVaDM
	ia8XbpAeNL3OQd4VA64W43PEkX+DE7zbyYinOHy4P4oJkFNgwmB+Y05Q1YW4Dw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 17:18:31 +0100
Message-Id: <DFSP9XSQ9Q4F.3W0523ABWR97X@bootlin.com>
Subject: Re: [PATCH v4 16/25] drm/tilcdc: Modernize driver initialization
 and cleanup paths
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-16-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-16-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_081838_581537_EA188335 
X-CRM114-Status: GOOD (  10.70  )
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

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> Refactor the driver initialization to use modern DRM managed resource
> APIs, simplifying the code.
>
> The tilcdc_init and tilcdc_fini wrapper functions are removed since they
> served no purpose after the component framework was eliminated. Their
> logic is integrated directly into probe and remove.
>
> Key changes:
> - Use devm_drm_dev_alloc() instead of drm_dev_alloc().
> - Use drmm_mode_config_init() instead of drm_mode_config_init().
> - Align the remove path with the probe error path to ensure consistent
>   cleanup ordering in both success and failure cases.
> - Adjust platform_set_drvdata() to store the private structure instead
>   of the drm_device, matching the new allocation pattern.
>
> These changes reduce error-prone code while maintaining the same
> functional behavior.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

