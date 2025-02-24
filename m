Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C89EC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1EHSTzEQ92GkWe5nywbq1cueM9EbdwXB/DLHyzBjiE=; b=dE5hdsUwAiz7j6cIbnHhgJ5d3M
	UVy95OIPaVJSnnh27LfsP7mwBG1n6qJAwy8SguPSZK7zoODbbE/XuPwhqZ/HESRcr0QUCLnYXL9BX
	K3NNwPd3PD+/FPKFMz+k9mPDkP35pj5ts45R3FOuO7QDa7neR8oz5zylw8VbGzJGyxr8GV9vsceL0
	E8pgTGeqmJb3cGlxVrMSpPshfRHsiJ82wvBK1GVDPKbNMIW466EnerL7yJ5aK4BOquFogebYQbIew
	igilbhyEiijoFC8LzkhoSpuG7DMOXnOfNETyrhWrjUQVPnsH/IdrYpggjIQbnqlOry6yd8+Hoa6eB
	hfDst6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZkK-0000000EALS-0daH;
	Mon, 24 Feb 2025 14:47:48 +0000
Received: from mta-65-227.siemens.flowmailer.net ([185.136.65.227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZPb-0000000E5by-0zee
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:26:25 +0000
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250224133516dc0f6e49989c1856a2
        for <linux-arm-kernel@lists.infradead.org>;
        Mon, 24 Feb 2025 15:26:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=diogo.ivo@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=R1EHSTzEQ92GkWe5nywbq1cueM9EbdwXB/DLHyzBjiE=;
 b=SqKLFB7YwFbWWuEhr1MCqeKYnEQSz2VXFg7KrCFXnKFuDZY7mSc5YJYSAjU1wQvwlMMJCt
 fNUnP2QSV6I9EUzxZMEvc5SC3itYYCVA322Y0yr0He0gd13YDjKUYKUVfBI9wU3Gar9Jmkd/
 shcYOKByKL5tTG/tyK94Pr3Fe/6dmoIUIdMZWFabYfQPz2xhL4ksBMwnVwlTidc9jdC2M7Rc
 5w1/rq+g/gke1Wu0E8PBPBaKrgDfjFls5heEdYK9QE1dialj0BEepPoRtGhqcZzfFiWN3lVu
 AVGC7tefTMsEt9u5fWy2SjZtn268N3cIykNwJOv4uwyE0uNaJniZiucg==;
Message-ID: <b437f359-912f-4b9f-8de1-9c1122fee26e@siemens.com>
Date: Mon, 24 Feb 2025 13:35:14 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 0/3] net: ti: icssg-prueth: Add native mode
 XDP support
To: Meghana Malladi <m-malladi@ti.com>, rogerq@kernel.org,
 danishanwar@ti.com, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 u.kleine-koenig@baylibre.com, matthias.schiffer@ew.tq-group.com,
 dan.carpenter@linaro.org, schnelle@linux.ibm.com, glaroque@baylibre.com,
 macro@orcam.me.uk, john.fastabend@gmail.com, hawk@kernel.org,
 daniel@iogearbox.net, ast@kernel.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20250224110102.1528552-1-m-malladi@ti.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@siemens.com>
In-Reply-To: <20250224110102.1528552-1-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328357:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_062623_873822_905ABA00 
X-CRM114-Status: GOOD (  10.07  )
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

Hi Meghana,

On 2/24/25 11:00 AM, Meghana Malladi wrote:
> This series adds native XDP support using page_pool.
> XDP zero copy support is not included in this patch series.
> 
> Patch 1/3: Replaces skb with page pool for Rx buffer allocation
> Patch 2/3: Adds prueth_swdata struct for SWDATA for all swdata cases
> Patch 3/3: Introduces native mode XDP support
> 
> v2: https://lore.kernel.org/all/20250210103352.541052-1-m-malladi@ti.com/
> 

Just wanted to let you know that while I don't have access to the SR1.0
devices at the moment I will have access to them later this week, so I
will test these changes then.

Best regards,
Diogo

