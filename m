Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305FDC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TDGL1Yo9WUa7EYaDeq6rKMNtM8TcEfBcdKsVKLdb84=; b=BFKKnzPnDFL4l7wOxt6zyi8WIM
	fPqEHd2icFRMMNEhG5tGog7ZyWn6i83jCaGmil8g7nc/0HhqPOsJXC8bfnD+bF4RugiRiz1sWnRnQ
	IF54PLBF2L121YwhlILmH+bF0JgRMzpMVl3Vg/YXTwTJO22extzZi/ucdTb3muAbGEYXQHDQ2pWK/
	l1hwzqLgGDnkTGvuLtQ2G/06Wf73Ysj0dxugCll8BL2mRi9CIdQ5LP/WLUPbq2Yu6zstr4uE9S+xI
	O54fQZCYJViLyz5WYofNJRAOlFZPEEq0egiV2uaW704aQZGlA67aSnuTNccMBVOSeQwcW4vvNBoVb
	neXeadvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFjx-0000000EL7Z-2hCi;
	Fri, 24 Jan 2025 09:12:37 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFfz-0000000EKU1-1s2H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 09:08:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87EBB148468B;
	Fri, 24 Jan 2025 10:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1737709705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3TDGL1Yo9WUa7EYaDeq6rKMNtM8TcEfBcdKsVKLdb84=;
	b=VFQJCpZKT4v2bWICHiuu78a9CGYgUp1sr7cnCedBloWdD6GWPAXnghsRSedlkPBeZ7gcDX
	3wMP5P5oZWvn1VZHiyIumpvTQulgLLDXlJ3kIxxBomhPYNKkAqeHZek3r0NUFmZzoUcidw
	c3ghwwguuC8kmP9MsfzNUBzQ4GF1gDmzEbtjGTAzt0ymipFgDK2eGzhXE/CKbuBj/hWCXZ
	aeukNE8V+gGxqOO9gEpk2vRFFdWop9cagbY3oiqnaImpqy06e9aD2J9EW0/a+oOcZ43uxb
	8sUG8VcCvNUD7W+sCamjNgpw9iX29qjLnafEEteCBlXQBO8VJ7WxXt0QFbHJgQ==
Date: Fri, 24 Jan 2025 10:08:21 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH v2 0/4] Add more devm_ functions to simplify probe path
 in drivers/spi/atmel-quadspi.c
Message-ID: <20250124-stumble-unpeeled-165f2211dcfb@thorsis.com>
Mail-Followup-To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>,
	Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250124085221.766303-4-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124085221.766303-4-csokas.bence@prolan.hu>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_010831_651189_680A5605 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: Len Brown <len.brown@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Alexander Dahl <ada@thorsis.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>, Varshini Rajendran <varshini.rajendran@microchip.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

Am Fri, Jan 24, 2025 at 09:52:16AM +0100 schrieb Bence Csókás:
> The probe function of the atmel-quadspi driver got quite convoluted,
> especially since the addition of SAMA7G5 support, that was forward-ported
> from an older vendor kernel. To alleivate this - and similar problems in
> the future - an effort was made to migrate as many functions as possible,
> to their devm_ managed counterparts. The few functions, which did not yet
> have a devm_ variant, are added in patch 1 and 2 of this series. Patch 3
> and 4 then use these APIs to simplify and fix the probe() function.
> 
> Change in v2: rebased onto Linus' master, which is:
> commit bc8198dc7ebc ("Merge tag 'sched_ext-for-6.14' of
>  git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext")

You can pass '--base master' or '--base=auto' to `git format-patch`
which adds a machine readable line to your patch or cover letter like
this:

base-commit: bc8198dc7ebc492ec3e9fa1617dcdfbe98e73b17

This way tools can find out which commit your series was based on.
See for reasoning:

https://people.kernel.org/monsieuricon/all-patches-must-include-base-commit-info

I'll look into your patch series in February, after my holidays.

Greets
Alex

