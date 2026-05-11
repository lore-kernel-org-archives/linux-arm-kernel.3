Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20850CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+Cerdam1U54WBH71GKfZQRR4jeB6y2Uccd1vRw3E2Q=; b=wEyraugsrOycjh8KFdEt4yzMqV
	LynFQQz1kjPmVZPbnG9oMG4xw83W1LuJm1KMjXwNwrYAweBOiM5O7x3amXjc+0AxC97EmxOZQgE6l
	MMhuMPF6FMIzYLga5jMqzxTdMXznQs4o5PHbql+/zg16m07MqNpOX7RjRcZ4aji6ehhbj/Gnt6M/V
	YgREMChHFSnECEh0QeYUNXhz6Je8yeIoW4F70f8dAZz1IeP6LMwlqMggJY144hYk6EuiFb+UzOPNw
	uSCgGR/LA0YAiOB0+IpZaVA0ztTkwCOSKUkSRCQ4htN19mdFubhNyHLz8auB1h1MuMrMcInX+jaiZ
	KIstcK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRua-0000000Dwhx-1gf4;
	Mon, 11 May 2026 14:47:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRuX-0000000DwhL-3DNk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778510828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u+Cerdam1U54WBH71GKfZQRR4jeB6y2Uccd1vRw3E2Q=;
	b=VqFa1zGh8aFIvgC1shlPY2/eQo21Lky3OFYKCDEdtbRSRbjcpygswTHGn4WtrXRyaNZW3O
	E0pCuBY2gzDGij7Y0kcFy/BLuqUtr7tC3+5snGFwJ6k1pGWkEkuNMQ50lPzrCq6i75QZRa
	iUam9EnYVrgvMvnLpWG4xRr1eUhAkkA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-XwzaMrPfNT-Yv_gd8LoYRw-1; Mon, 11 May 2026 10:47:05 -0400
X-MC-Unique: XwzaMrPfNT-Yv_gd8LoYRw-1
X-Mimecast-MFC-AGG-ID: XwzaMrPfNT-Yv_gd8LoYRw_1778510824
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b7a1ea06bfso96900456d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510824; x=1779115624;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+Cerdam1U54WBH71GKfZQRR4jeB6y2Uccd1vRw3E2Q=;
        b=F9x3oJpvdM67hkhX2CxEIuMOfmBUQVFM09HMoEm2vJ+m//6LO8SIAus6G1BHPTrDC7
         GAFqXK0tsiCnin2DjjoXhz30SpAXh6/ajYljzdvdn2i+UoY+Bc/0QQjYIgt4mvBVT8Oe
         zZzeogtzA6gjvtPXPpxwIH0Y7q66N6zOPYXCwJurpY8BzqcxnIPPgTpKU0vk4z8gZ1lp
         iFBvgnvNPei55xoqr07fbrAdaHjcjFONTD4vPOq3gjmYlBo7S/IfW2Y7HRVepo1ILLIM
         1FVqLVZJX80rBruxtvcjxwGboOF31Wzr+s8DMg5OfQW+TY3XFgoSISs8ZE/JqqlxPkLj
         u24w==
X-Forwarded-Encrypted: i=1; AFNElJ/fG0X0ydEoN+QOky+/kaYshjHJ0F4kWFe1nrHL5HXK89otoiKdVBtZBcIJW0bupOwdFmTu+DGdt41E+hKdCr7M@lists.infradead.org
X-Gm-Message-State: AOJu0YzC8bfdnCI8Dn69wczMyvNsgXAACF52lqjsF+AowxKRdFkDlwXC
	Vcy3B7l7h7q2IKdoWVUva3eyTnlqcvHtH/Luet1F6DYCLOZEDEMA8NXRccIfKuWxCHXiwB4UlGB
	HWjqXhjk2z0FY3ts7MG56TR+4GTiR0xxEvf0ARb/f5r13RKnlWju21ifgArBvkJ5YCJt9Ea2w5o
	yX
X-Gm-Gg: Acq92OFeQn+0+UWJ+VpE2SzIQm9j7o4sI7OfxFfkgtUjRsGi02fltagn5IQ/HDMnm5l
	CZ4gbxadsBQGVvotIkmh9hnaLCOr3Sg99lSA00PeWsSPUJeiOYhXYkUZxTNwowNy2M+kWKUsHTs
	m230uE67IGq3unJcDRD1g2eXsPrawGUREjc3upg7DMTaOIcnPjTlKsvTvGUT6k2MVO4VTnCKLx8
	UM5Wy5M5Eh/NOcsqTQ277zZ5Z1fmfNkxb7jVLux2keNkEzPOzmGebMi++4nXUaG8Zj1FIFwRFta
	/tAs+sGWNcVqdXE3bdM3Uc8D7ruH/W1Zc3jB9MCSuZyU27f4nA84lpjzNFwy53pucH8Z+0SwvQF
	yCiBrYohfkfVvYTo/sU7o+nrRKK0or6eElYZdU5H0Klq83tO+OLH0B/e9
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246563746d6.26.1778510824394;
        Mon, 11 May 2026 07:47:04 -0700 (PDT)
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246562986d6.26.1778510823795;
        Mon, 11 May 2026 07:47:03 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d6442d0sm310791716d6.46.2026.05.11.07.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:47:03 -0700 (PDT)
Date: Mon, 11 May 2026 10:47:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 05/15] clk: scmi: Use new simplified per-clock rate
 properties
Message-ID: <agHr5VZAPvZkSlJQ@redhat.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <20260508153300.2224715-6-cristian.marussi@arm.com>
MIME-Version: 1.0
In-Reply-To: <20260508153300.2224715-6-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y3x4TTqlU-dHLxIONciQxHrRijR0qO3-NAZ2VbTfn8Q_1778510824
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_074709_931179_01A61921 
X-CRM114-Status: UNSURE (   9.75  )
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

On Fri, May 08, 2026 at 04:32:50PM +0100, Cristian Marussi wrote:
> Use the new min_rate and max_rate unified properties that provide the
> proper values without having to consider the clock type.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


