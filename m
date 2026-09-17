Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746C3C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhnvHXmqUmnS9g4y5J7KmcXx39UVV4BRbHPaDoXYC7Y=; b=c/cF0hKBg2oEoJjSVkpE7OjZZi
	qSSABZyUJt5HOxqt3HFOJcEf7xTUA8NJ+tK+CyZeyQNSCD76wIIoDhrXsgXBSqRNnTD0AZMNFip/t
	vx6cIvCL6woGT+7Q7HtCJFgpqq5biSVYTHmpvNx1ohn8UCyDkrYJqAySrqXxmrhiA7NK7FpSPl+18
	n2bGZYZasAPXCVIbXqk83vxra9p498jcZ2nVpO2hVUtEK0NFIDA6+rRgmbK4An4CeRH/HmUGkanSG
	RHrsjT/IXkxvmeSnO4ijHgVL1wen/T44vZJxzOHoD8uf+P/ak08box9SnDoel62X80pAytZOZl0qk
	KoVrZzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77hX-0000000Av7M-2m33;
	Thu, 17 Sep 2026 08:42:39 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77hV-0000000Av6Z-0R5H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:42:38 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d3931so4194495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 01:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789634555; x=1790239355; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qhnvHXmqUmnS9g4y5J7KmcXx39UVV4BRbHPaDoXYC7Y=;
        b=g+D3SuOE0rj9wBXPytRWtG4qvj8Tio5g1g6gwQlIOhAH6qxnZYO4EBB41ExJ4cKFtg
         96XXUBY+tZWbDgwrn+4B7NoeVGmGoWEjH6i6YC2Jbz0mvAO6RVFbT9aCh4l7z94ZxYNe
         BdFUEJM3+7Jq6FhodifNia9wk/AR9mYjnxpFNFWDmxtu79WoeyYPlzGFBsWi/lh2t4ls
         N3LldU2mP2aV93k3xsrTtCFTdUbojzZh+JgNjdxZ+Uyl5Th24kPgFQG0O5IDbqwWiJNk
         UJ8mwowwODdcwVtcdsoAIUZXNeT8Bn0x+x3bSZdvTjJnnsc9pvQjfsKtX31lkaQswiCH
         SO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634555; x=1790239355;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhnvHXmqUmnS9g4y5J7KmcXx39UVV4BRbHPaDoXYC7Y=;
        b=Eqz2njZaOd4SM0gIn4qecZcvImRa62ToHX1F95ZxMFHfaoBmdosWqJ7W2vfUg41Nfa
         /9+jJZvbhjoHE3YPprt3qsO1zxdRDkfcrEfNHrPgto51LTl4ili9aUMCnGj4ySB/8OwN
         wJbeUKFzgWJPOvRDO3BIUsyr5kSMfTfmMe/TgOuAVr7zthWgDcTBqGHXLYHzeEnGvHWC
         E4gsbF9yefjxdCYvvBE1lPNa4Bt0EtA8yinTHvn86ExP9sDW8dHPhgsxDTQxy7qelvOY
         3ZzrQbYUfTiHOtdfADyxsSRlCTvO3wpsQ0Ludpfk+3+6AskHTGW89HZDy3q5XG1h0hmX
         9EBg==
X-Forwarded-Encrypted: i=1; AKwUvByAgq2280fIGR7mxrq/x+iehkS055Nhmswu2Yq3yR1qUFsx0YG6OnVKqEsQSY/GzBePecRIQw9yKM7iSa/HOOTf@lists.infradead.org
X-Gm-Message-State: AFuF++nwmMYDAxlVOp9ChJGb/OSkwwsv4wj/VURNyVxTr4vGU1nhB1D1
	ai73WUFnSpsXh9qdUOCGY7B5ydFe/bS4fa/qO1JRJ9Q5s11Ebh8kkjV7
X-Gm-Gg: AYBFou25PhxYOF2KBL3SeCMXJBpRwUwFY4ifL0GWw54ANcZnXricuDCvAW5LWEw8xMc
	NtJx0KnFvNYf5F2pjQxI6SFAzocR84e5vNPO8nOzWDqeKUJYkIKdMw1NCWlWl6ApS1DBtgjUGYm
	jw+s6edenRrvRt/V7kyGA0t+Ftorcc1ah3SHXvmT1kn/IlcEvklGV9NbowUIgLuBxr/6BJDYPIE
	y2gW7xOWqz3cLPQ/QxQFYvjhp05efYo1cPHIgSef7xlSbIF33D1jAvca/FLSC/8rrWRSlSLmxou
	gAFpk2JoxWFQ4g7owiA/1nEeOVOiXmEkZrGAiNBl3zIYeZwijbjlIajnNDPc/fOWEvHc5HksdgE
	B27DsdWd80eApbnzQ15erTZc+Tw49yJNaULnoCNQZjZNKqOjPTpV7PvbbxO7ld8lpgUHwI2gDKc
	vubhw6eEHWVvPwH5kyGoRvZhpSax6zKF0PgOeil46lX+JwTmvXHJUIzaocd30sPgG4JDMDY455K
	vODncbkbC/kY+RkE/wX0YYEElrf13YltiS6NtNk5hE5BssB9IjrQxONHjwKpiNQMGbatFGAam6G
	z+5zruV4/ccgVXefB3NYbxZqiFKrWV3JCKpNAgsGhUcxDxTQTj8/6AIRX9GPOUVsOVDiIlvFPHv
	KhAsru6NkV7/i1cL+w5krg7Ly4Q1bNmTmj5tRzVGeWeocJjnL14qf41XLmbNMRwKpIQzcJWbyGw
	PtFp5CcYIWNlOz+p4=
X-Received: by 2002:a05:600d:6446:10b0:49f:bc43:9e8e with SMTP id 5b1f17b1804b1-49fbc439f6dmr34380115e9.26.1789634555063;
        Thu, 17 Sep 2026 01:42:35 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1d0978sm56898145e9.2.2026.09.17.01.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:42:34 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:42:33 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Frank
 Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: imx: add missing
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <20260917104233.00007a85@gmail.com>
In-Reply-To: <20260917102429.00002faf@gmail.com>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
	<aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
	<aqq_ymTi1I951uQp@SMW015318>
	<20260917102429.00002faf@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_014237_161351_A7BD03B9 
X-CRM114-Status: GOOD (  25.18  )
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

On Thu, 17 Sep 2026 10:24:29 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> On Wed, 16 Sep 2026 11:11:54 -0500
> Frank Li <Frank.li@oss.nxp.com> wrote:
> 
> > On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:  
> > > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:    
> > > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > > on teardown or error, causing potential resource leaks. This series adds
> > > > the missing calls.    
> > >
> > > No, as I've explained repeatedly elsewhere, it does not cause any
> > > resource leaks. [1][2]
> > >
> > > The autosuspend setting leaks if you will, but that only matters in the
> > > theoretical corner case of someone rebinding a different driver (which
> > > will soon also taint the kernel).
> > >
> > > So don't exaggerate the impact, this is essentially just a cleanup,
> > > which is fine in itself.    
> > 
> > Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> > include these pair functions.
> > 
> > I get many similar patches since scan tools is more powerful now.  
> 
> I suppose that could work. One would still have to scrub the kernel of legacy
> use/dont_use_autosuspend() calls though, so it could end up being a large
> patchset.
> 

On second thought, some drivers do tend to disable PM runtime system sleep
etc. so it probably isn't as simple as adding the autosuspend stuff to
enable/disable.

-- 
Kind regards,
Joshua Crofts

