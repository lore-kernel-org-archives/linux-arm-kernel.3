Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D304DCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYiGHVY1xpFWEX6h4yQg4Y2KYAiZFnPKyRrFWVlw2cc=; b=tYToC3xkfoguNu5ylXJYNmm5SL
	NvQ1TZrg+tOBssCvpBsfDXiJEqDx8QKR3m3BDLeg6KGqbZRRyVH3itE4gyjnaQD8m3l32HoWJFNeF
	uE7jMnBUBRquvAfcBlZbt2FwXi9EQM14qOFVfftrVbFBOTbg9kaC5HigBD9ongkpT5mOwfWDrTIgO
	MrcYwai55mZCl5LReWxGm6aVFL4sa8APi9nPPdr1dX3ttonp9TzK9+Ip19qsKoTn/Hn45cOyhIVmG
	h+l/1lYMSoDM7OCUzj7iX+EwG73JakSEd9JIM+Whdh67mKVQqb24pMwtNmhw00AMMaF7iwsGPXWg6
	xg9eI7DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAMt-0000000EaWi-1PFv;
	Mon, 15 Jun 2026 16:40:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAMq-0000000EaW5-27e6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 16:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781541655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fYiGHVY1xpFWEX6h4yQg4Y2KYAiZFnPKyRrFWVlw2cc=;
	b=Uoj0X2NOV/QRESBh4kjzxC5gx3z5mc/eBDxUpR1T9mLI2nJhvVuE2hnojXIFQcO3Tevw3S
	NjiLIFtFHqesxsoSAZhy8v/MDyGDrvwGH2+YLuJ64JhR4AaSCXdcnz2MGsxIqK5mqOWUiI
	4J6fcnr26qbs87Vzwm9DbDixbaK49no=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-pKbxKlWHPG2hj1cS2jU-rA-1; Mon, 15 Jun 2026 12:40:53 -0400
X-MC-Unique: pKbxKlWHPG2hj1cS2jU-rA-1
X-Mimecast-MFC-AGG-ID: pKbxKlWHPG2hj1cS2jU-rA_1781541653
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915c8347cd5so734052785a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 09:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541653; x=1782146453;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYiGHVY1xpFWEX6h4yQg4Y2KYAiZFnPKyRrFWVlw2cc=;
        b=hQCgRU5isqNBhKwRAowtu2tRrMMnoJROwP25buZJUKM7P4Hz+Ue9aGFx0+7ImZpiNL
         DHeLZjjLH+/jVYH6rQzQO4/e/o92MVwBs5BMW9CQKecoy9lAHTVucRQvRjAEwjmOld0B
         VpMdzrQDwegruLLJaTgnzUKEP9wIgLUzBm3XShk+9XnBosK3DMfTK8/DuL6oT0zb4t89
         4cxvHtzRzexeA5c2gwS8Chcxo1CenBCuzSYtEWRy92g07EdNOEBeqNUxk2kNZIzq+a1E
         04qk5MfSw4afF/Mk9ZnvAGooyPJQmEb8ocQjQdHiXkAL/jkDHAU00JuKGNrR0j/aOu1q
         jZ4A==
X-Forwarded-Encrypted: i=1; AFNElJ/Dpeqee8GzhDlBreBKAQ+Sqg67ZGppgh5zfLxzxakrG0ANolO7BYcUK0e+QVIleyWShiP7yV8rL3rqsxWE81E9@lists.infradead.org
X-Gm-Message-State: AOJu0YzIxtMK2X1acF3/8SJj98HnEfYXlygzdwLrOXYje9LYp6ZJH89P
	Hse/S4Q+0D+g71he44zkCe3uxjQiOwMAint3BiO/Cm3jzyVCcTqjZ5nSxxooC/M+vh5YOcV9jXc
	1uTbnh5nyJoODl/58WIRbkqYGFzm0lhkNIqQR3SrunVaAv52MK/9PLL+eClLV2HWP6nOeHlXC5h
	mZ
X-Gm-Gg: Acq92OGXyDbrt5yu+Mxp6eWafWjf4oq8onSf9CjAsBhpC0rHxLjpisbZzFBXvafgUPw
	Ulw7eZ/KyP/BUr+ro6BJMjg58qJUAlAs/wX4ceS7l99YYuu79A3Ip5WnCMUIOOp5tbQX5RzWk5i
	dBRClcILT727dbvaQ/eU+7pTJVoCJCEJZEFUgWQvjJ7PqfrcsfgZbBd0rIYLzF5aCoaXbG5eepe
	csMqLg9ls1TcKt6Ga/3HQnjZIYsoL5PA06FGY/saXfhgYBwMtMQM3G1ux4BHcsdZX5bGkIJTYvT
	TLWtlMEDQBff10rSGWddbSe+dcuT4eCU3dj/JOXY5j8V2S9lejRhQdbAEUXe1ZVPeuvrwxNscvu
	mxTM/0bUgb1bAU+h/KSQPppk3vaT/AzsafIdtdpXJzqVSKlZdSLlHsO20
X-Received: by 2002:a05:620a:31a0:b0:910:87f4:9a26 with SMTP id af79cd13be357-917f1e44e09mr1835939685a.41.1781541653030;
        Mon, 15 Jun 2026 09:40:53 -0700 (PDT)
X-Received: by 2002:a05:620a:31a0:b0:910:87f4:9a26 with SMTP id af79cd13be357-917f1e44e09mr1835934985a.41.1781541652604;
        Mon, 15 Jun 2026 09:40:52 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f06835sm1180700185a.14.2026.06.15.09.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:40:51 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:40:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v10 4/6] clk: Add KUnit tests for assigned-clock-sscs
Message-ID: <ajArEQ1rA7AtH-uG@redhat.com>
References: <20260612-clk-v10-v10-0-eb92484eda38@nxp.com>
 <20260612-clk-v10-v10-4-eb92484eda38@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20260612-clk-v10-v10-4-eb92484eda38@nxp.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SMlbZncAkuauDOrSOsR-AgUjnxX8o83MSCifMxI5xZA_1781541653
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_094056_622772_7CDBC0A7 
X-CRM114-Status: GOOD (  15.21  )
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

On Fri, Jun 12, 2026 at 04:46:26PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add KUnit test coverage for the assigned-clock-sscs DT property that
> configures spread spectrum on clocks before they are used.
> 
> Extend the existing test infrastructure to support spread spectrum:
> - Add struct clk_spread_spectrum field to clk_dummy_context and a
>   clk_dummy_set_spread_spectrum callback
> - Wire set_spread_spectrum into all dummy clock ops
> - Extend clk_assigned_rates_register_clk and test parameter struct
>   to propagate initial SSCS values
> 
> Add a new separate test suite clk_assigned_sscs with three categories:
> 
>   1. clk_assigned_sscs_assigns_one — verifies that a single
>      assigned-clock-sscs entry correctly configures spread spectrum
>      on one clock, testing both provider and consumer paths
> 
>   2. clk_assigned_sscs_assigns_multiple — verifies that multiple
>      assigned-clock-sscs entries configure spread spectrum on two
>      clocks, testing both provider and consumer paths
> 
>   3. clk_assigned_sscs_skips — verifies that malformed DT properties
>      are correctly skipped without error: missing assigned-clocks,
>      zero-valued SSCS, and null phandles, tested for both provider
>      and consumer scenarios
> 
> New DT overlays are added for all test scenarios:
>   - kunit_clk_assigned_sscs_one{,consumer} — single valid entry
>   - kunit_clk_assigned_sscs_multiple{,consumer} — two valid entries
>   - kunit_clk_assigned_sscs_without{,consumer} — missing assigned-clocks
>   - kunit_clk_assigned_sscs_zero{,consumer} — all-zero SSCS values
>   - kunit_clk_assigned_sscs_null{,consumer} — null phandle
> 
> Co-developed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Looks good to me.

It's probably not appropriate for me to also put a Reviewed-by here.

Brian


