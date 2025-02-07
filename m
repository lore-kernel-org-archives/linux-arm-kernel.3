Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3A0C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIOirByBUe+Z/pgSS0CP2M68HwFVjUFI3KKx8O+0aLM=; b=b7m8Q/nKBXYe1x
	dch8DS49nYQij6rEz4+Z6XWXpuAs45f3hkR5tf/Tu/s0ToM0lcax9+t2UxXZf4VUHI2HFpMQPXQv1
	jh5DaSVfsK3nC/58sQZHQtWRicBv8YnCCq3vAzEFZdxLQusplrzUvRekF0/5beThwP15h98n7xD9A
	+rGBnwFwSV98kF/301pYdE3SoMEk6jXNvEU3NM/ymRJI87o+5HWoIbxBwuayeQVoDsLMouU61Eijo
	JYRBJt3Fhwb9F3LGrETfx2E7nnf260vU/CVzME5tfMp4IH11ZPrRHJaChKtpPKyUi6HVWv+rH51PH
	cN2sSYwV/H+d1Odd+k6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKFd-00000008vfE-2Yl9;
	Fri, 07 Feb 2025 09:02:17 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgK7y-00000008tU9-0VeX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:54:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5221143421;
	Fri,  7 Feb 2025 08:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738918460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bIOirByBUe+Z/pgSS0CP2M68HwFVjUFI3KKx8O+0aLM=;
	b=bRuyJMiTRrELEebdfdiA9B0NSk7cW0ACh8i8N6hUx8PLACKgule/KvdQcnqB9lKe7dUNw1
	eD/BJlPRZFmDTaRa7bHHHXSO8ZtdQM9m5MgYCIMgoSMbVe4hSsFx+z3IfTeLJ5aT11v9Sa
	AeUA2lH1hS9QJBP74PsqnxaNtwXAS/z2oEGU+Eyaz9Cb/rOSAwRUJ3CcwSBuWByv3RsfME
	JSywNs/Mf/VjZNRgr9KyPKVoZxB/20BvhgAifmEsMu9OcuxHfasWSbrIde0nqYZFEYp74s
	anr4OLGDP60vxZHT5o9+YQIWqgetIyGW7qMCZmOM2XnxIjC1YYPNsS7hEMd5KQ==
Date: Fri, 7 Feb 2025 09:54:17 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 05/26] drm/debugfs: add top-level 'bridges' file
 showing all added bridges
Message-ID: <20250207095417.4328d05e@booty>
In-Reply-To: <vnmkwcqv74y6qxbgmq7s5fkodjxiaow3hbob7xacfw2n6tyuth@ldddeoshkqdp>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-5-9d6f2c9c3058@bootlin.com>
	<vnmkwcqv74y6qxbgmq7s5fkodjxiaow3hbob7xacfw2n6tyuth@ldddeoshkqdp>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrt
 ghomhdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_005422_294642_8C969E76 
X-CRM114-Status: GOOD (  17.51  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Herv?= =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Dmitry,

On Fri, 7 Feb 2025 04:41:12 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Thu, Feb 06, 2025 at 07:14:20PM +0100, Luca Ceresoli wrote:
> > The global bridges_list holding all the bridges between drm_bridge_add()
> > and drm_bridge_remove() cannot be inspected via debugfs. Add a file showing
> > it.
> > 
> > To avoid code duplication, move the code printing a bridge info to a common
> > function.
> > 
> > Note: this change requires exporting bridge_list and the mutex protecting
> > it.
> > 
> > Also add a comment about bridge_lock to make checkpatch happy.  
> 
> I think, exporting mutex _and_ a list is a bad idea (especially since
> they don't have a proper prefix). It might be better to make the
> bridge_print() function a more public one (and name it
> drm_bridge_print()) and move allbridges attribute definition to
> drm_bridge.c

I was also not happy with exporting these two symbols, and agree
exporting a print function from drm_bridge.c is cleaner. I'll rearrange
this for v7.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

