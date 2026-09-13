Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226EFC88E5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y44+A28Y3BNV9Kwrp3SpasZ4quyu/gVpv3kXvPsZ3r4=; b=kZl3vX1ke2t0Vgeh1NuCekGxBl
	6bWvvR/roNaVewSdrSkegF3ZIKJBKErU4B7cw5eOCfGicBm96ioqjlBRAQTZXEoaIDJ9Cdp44Odq0
	/dNYPLZ2nHWVLN3c/ThFIe0o6/yJ7c7WbIpZfLwOGzF/+ecXkhG0207YLdtURziQAeURmIAPUkK/g
	PFOzAKIycnTDX0YSaSiXS+lNgpHce7fPej3PzMw5xrFSrJ4FEUO+Vdavl8qw+c4AsvgV2M5D21Wq2
	wWhvBQ+KH3pofJyYSWfLZV+jxj+phuwzqlDKDrK6jT6yD24b/U7Vc9wQd/bx7W1t7tnpa/8+ialfw
	mKofwutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5i6Z-00000001cBJ-0M9Y;
	Sun, 13 Sep 2026 11:10:40 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5i6V-00000001cAw-0qbB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 11:10:36 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id E7E5B1FB90;
	Sun, 13 Sep 2026 13:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789297828;
	bh=y44+A28Y3BNV9Kwrp3SpasZ4quyu/gVpv3kXvPsZ3r4=;
	h=Received:Received:From:To:Subject;
	b=T0VFBHWpT29SQ0+mCZ1RszeeutgP4OtMHS6BpRswhxVHUsxyKJAOjzTDWzV5t31Cj
	 oMLwjimg1hEn9U5xEb6VE/5ryXcEuMq4KyehetNnTRjvZU29KcvxJTm05LFMX8IWTR
	 jRFoEtP7vyDg4H+Be43YTOgQ+urDJEKOKh6Hjc4axSKzT16YQem3WuuAC/T+376yy5
	 kuzu1QqNEvu+tNuvnVR13VcfqMdLn0rfP4jh8DfwtbQFVr//MEqZbDoehLRlcxsCMH
	 tKbzxXunpmTKf3feVGyZ06Lt2p7XppYDszP849m/ZlFDzpWyGoFD0iMct6eQgtdG/c
	 +VcqUgXh0btkQ==
Received: from livingston (unknown [192.168.42.11])
	by gaggiata.pivistrello.it (Postfix) with ESMTP id 81B107FA3F;
	Sun, 13 Sep 2026 13:10:27 +0200 (CEST)
Received: from pivi by livingston with local (Exim 4.98.2)
	(envelope-from <francesco@dolcini.it>)
	id 1x5i6N-000000002jM-1jMz;
	Sun, 13 Sep 2026 13:10:27 +0200
Date: Sun, 13 Sep 2026 13:10:27 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH v4 0/4] drm: mxsfb: Support LCDIF interface bus width
Message-ID: <aqaEo1-aS7Srsgxv@livingston.pivistrello.it>
References: <20260813092836.38367-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813092836.38367-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_041035_426245_09EFD903 
X-CRM114-Status: GOOD (  16.02  )
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

+ some more DRM maintainers/reviewers

Hello,
just a gentle ping to the DRM bridge maintainers.

On Thu, Aug 13, 2026 at 11:28:30AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The width of the physical LCDIF output bus can differ from the input bus
> format advertised by the downstream panel or bridge.
> 
> Such a distinction is required when the LCDIF bus width does not match the
> width of the downstream display interface. For example, an 18-bit or
> 16-bit LCDIF bus can drive a 24-bit display by wiring the available color
> bits to the appropriate display inputs. Configuring LCDIF solely from the
> display's 24-bit format in this case selects the wrong LCD_DATABUS_WIDTH
> mode, changing the color-bit assignment on the LCD_DATA pins and resulting
> in incorrect colors.
> 
> Use the common OF graph endpoint bus-width property to describe the width
> of the physical LCDIF output bus. Make the mxsfb driver derive the
> corresponding media bus format from this property and use it in preference
> to the format reported by the downstream display. When the property is
> absent, the existing behavior is preserved.
> 
> Set the endpoint bus width for the Colibri iMX6ULL and Colibri iMX7 boards,
> which route an 18-bit LCD interface.

The first two patches in this series should go through drm-misc-next.
Please let me know if any changes are still needed. Otherwise, could they be
picked up?

Thanks,
Francesco


