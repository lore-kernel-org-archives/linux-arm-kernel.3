Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F050C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 14:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWbzEFFsbCei+Jsuh9cPPDwwtCpa1GZNCwDSFbiDwXo=; b=oEfMF2WV+y6cREVOZhdF9tbyI3
	iDDVf77hLzFH/yZImfmms2beRfvZGfRcRmiKYlCuYiAOE9FGe7ZoWcmbPb6g0PV5DjZ2xWQsfok1Z
	VDIVBTK1Fx0FHnGgN3P8pKaWme1ZjRBro+gNw5stWnSaF7UZluGZ3oN+lijhu8FDV5VsCL7Sj12AE
	9yUXjkS6mpNY9xm4QilXLrAOHX3CgOXLtmawzN+rHO5yP+l64gqkBiCZAwq0Uoc09yhqDtvn5vC4k
	pDix7xpesfGYS0Eu7qH5oc7l0KGvZoox4hVmYW/6pkTFO9pFoZnc5ajV+qKJvV3kkaCkeog5OAM2c
	xU+HIJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkky5-0000000DG2S-1iJT;
	Wed, 19 Feb 2025 14:22:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkwc-0000000DFl8-24V8;
	Wed, 19 Feb 2025 14:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mWbzEFFsbCei+Jsuh9cPPDwwtCpa1GZNCwDSFbiDwXo=; b=irZ5rRhZQ2JppQrRFwhByPVOuG
	PuzQUCY1wKQ+TrvlvHIoY+RLPtHbt6BWIdNxG3aIBXADQu9DkiohTaz4ZE+XbhrCHtPnbjki7zicM
	+QTMFDxTyEbold2KHlyENMeFbFC8Bdfbc4QIkJ8y8FkFBRp2BK+bCcc19XmeDeJDWk3C6UZ+2cHb9
	y9EIP6sgQNcyGvEkRVEFJvedAlrBpGh7xVd+FX6vTMR0wXUmgRK1dU61JSuK2qNivoTegsnBxo35n
	t+ZYpaDd7MXlaAwNb4cup9gZuphhxYRG3H/MS1hUXUUWZz9TJWurZqI87QxF3L8wjtz2kiUk4JNGP
	W56DRzVw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkwY-00000002BML-1rW4;
	Wed, 19 Feb 2025 14:20:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A59075C5998;
	Wed, 19 Feb 2025 14:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A12C4CED1;
	Wed, 19 Feb 2025 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739974851;
	bh=jOlrkiD0YDVnxiss19yqwIELdl/2yHZAb820zbK7+Y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eIwtcQJFf0s+4hIHMz0Xth5Km8xhl2Lj7ZaQuf7QLCMOqOAThRQfWtj3OOU8+Ik2C
	 CytUQ7xJ4zfZOAOJvCrqBSZxlDw0azh39huA2Zuu5ZtJlOIL5m02V31EfAhhq1xWd3
	 QyVWZb0x+NzZ+cKpwIfGziYdpiVNagt0okrwp+Cw=
Date: Wed, 19 Feb 2025 15:20:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <2025021938-swan-facedown-e96a@gregkh>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_142054_747792_8A0C9676 
X-CRM114-Status: GOOD (  10.11  )
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

On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
> Add helper functions to create a device on the auxiliary bus.
> 
> This is meant for fairly simple usage of the auxiliary bus, to avoid having
> the same code repeated in the different drivers.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

