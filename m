Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA204C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jd3IUK9b2ENpeBLR3vD3mvrxN+DK/yrnezgemW0jfIA=; b=fCjSyvR0RTkzL0B85INtdD03Hc
	gObTQ2CD6X2tyFfCSDRDdIjjNGB7vVmW3KRjnLhtowjB805gQcsGpXd7sqyUx2LpqYbelAaiy+Dv0
	dXc9wDBUWAw7odcrydzE6qjHhdiGTho67XQcyluE7QGO2UThsJX+lJ6S1RaHjmHib9S+DktiK7h4m
	rOoJrHQyXBiekmep3bp2L8KWO8rpUCVvCTJ5oNviCJquG92pPoxdk07lui69lYPKJNrJcD7facQFJ
	hmi462tiaOhbDkBEjz3g+qSFmo0p0dn7LQpekSYhEoNeDt+K1EhSCSiQs34C6Y0jgO3NICJkn+9a0
	RSKPrWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQlJ-000000099IB-36Rv;
	Mon, 12 May 2025 10:51:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQcf-000000097pf-1js7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 10:43:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 392455C61CD;
	Mon, 12 May 2025 10:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECF8C4CEE7;
	Mon, 12 May 2025 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046580;
	bh=6x1QLi7LcIsqD3IL8qJqmDDVfdxhcPb5ez1PwvD2gPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iIVEnHDgmreN03M4pVM94GM8M6XPKPEjCVjYIWFe12NeiDynEGP2x78sn6Q6FBYiJ
	 f337hafcKQy9A0gTNaSjGN7pew+e3YOr9NXA6mBVxPfroE4f20DnNvPWqFsaNJFjbI
	 zNAGMtgF0+biOs5OrNsYgzR+OdSY6Nx6k2z0pDBfmXl+Nil03X0xNbw68Mo5y9nBf+
	 pGkWjZ5OG7sj3AKBwRdNEucgmFfPh2wa+FPfg1vcDbUwjF+gWkGiWaAigw5lqC0KuM
	 sNl2x2E8PSvYYULuPiZcgzB0w+PpAZUjWfm9u/SmaIKxGfwVEZUqq2RUgrCKgW+OP9
	 kceRFI8b3QJcw==
Date: Mon, 12 May 2025 12:42:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Rafa?? Mi??ecki <rafal@milecki.pl>, 
	Junhao Xie <bigfoot@classfun.cn>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Kever Yang <kever.yang@rock-chips.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] media: allegro-dvt: Add DT-bindings for the Gen 3 IP
Message-ID: <20250512-fabulous-provocative-raven-ec3a81@kuoka>
References: <20250511144752.504162-1-yassine.ouaissa@allegrodvt.com>
 <20250511144752.504162-4-yassine.ouaissa@allegrodvt.com>
 <595adbaa-15b4-4917-b3ad-9bac3e2333e2@kernel.org>
 <knnumpmyq4ewvqcfor3vqynxbplynajdlmz3p6f2ywadvmz6wo@5uz53eubbkfg>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <knnumpmyq4ewvqcfor3vqynxbplynajdlmz3p6f2ywadvmz6wo@5uz53eubbkfg>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_034301_506713_6FFA1C1A 
X-CRM114-Status: GOOD (  12.87  )
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

On Mon, May 12, 2025 at 08:23:11AM GMT, Yassine Ouaissa wrote:
> issue fixed also, thanks.
> > > +  significant advancements over its predecessors. This new decoder features
> > > +  enhanced processing capabilities with improved throughput and reduced latency.
> > > +
> > > +  Communication between the host driver software and the MCU is implemented through
> > > +  a specialized mailbox interface mechanism. This mailbox system provides a
> > > +  structured channel for exchanging commands, parameters, and status information
> > > +  between the host CPU and the MCU controlling the codec engines.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: allegrodvt,al300-vdec
> > 
> > Undocumented prefix.
> > 
> > What is the actual device name? al300? Can you have al300-adec? or
> > al300-dec?
> > 
> > 
> 
> the device name is al300, the vdec is for decoder driver.

So drop vdec. Compatible should reflect device name.

Best regards,
Krzysztof


