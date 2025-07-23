Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70887C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 21:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWyJDF3Q2SumP8IS31W52vFdyTdD9QP8y32xJ3aVsWU=; b=PE9U3LtDCXDRA/MOOfNiH3x+Qq
	O4Zg5j5hAeSD0iRzHA8qvzySgc7On5ku6jphV0QQngIOzi5pL5KrpcP/5YKGZZCwROQJykbSFKRaV
	0pj/VO2OHiWnAOt8aTmZzShRfmSz3yX365eERPQ0rBgdZX10lalbX0fRWU2XTHH+YSpnTIe3v4fuZ
	a6MhMgOTM2GtsslIF//05lTOiY4Hg7/Z9f3bTuvY17unXwk/FpsNu9TTtxdB4h+bYLzpK0/7E3TY/
	6uR1L/wlryvwBuRAKmbKRnHG6V9Nw4PUcTayKWTjQSc0G4UEBHN8tTPOmOaMYmwPzF8uef3UlXZD0
	uytz789Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uegrU-00000005y9n-0l2W;
	Wed, 23 Jul 2025 21:18:52 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uegp3-00000005y2C-0kXN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 21:16:22 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso1489a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 14:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753305379; x=1753910179; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yWyJDF3Q2SumP8IS31W52vFdyTdD9QP8y32xJ3aVsWU=;
        b=i2iJRW8XWAiuJO26XqdOZo5K3F1w84PIpCDV8eoX9yGiI6XK5Xx5XkbbC+q6LuZLRQ
         NtyzZ9Gyb+z7jEt2hq+9qP98zMIgfqGZDAuNJCyIHwjWmTO1wkikRwD1iu8myE8DK4bs
         RLCKmGJCWOQ5BpOWBYyOsjg/3Aeok2YptG+7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753305379; x=1753910179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWyJDF3Q2SumP8IS31W52vFdyTdD9QP8y32xJ3aVsWU=;
        b=gj07pQmpZVJYdmgEvGx5Q4dFeAJaq7shM7klTADv3T6oe0X1wlpHnZeKVmJKw3Ugbj
         kgzAEs20XKS0R2JttKrPMLo42Jbav7NyckhITrj93tdeo+C/QcsgpETM4c/Ceu0Lsh1b
         VpF6SM+s51C53av4c7Un6ti1+SMuoyXh8Hw0c87o/8G4cfmZaOOc0o98JwHIBibrLoW+
         O54km4MIILl4d68zxdBBHjLC4+w/+fiwxaH1gCz9axNIJpnQnfH1iEZscnKO0v4ljXGY
         bYrFahX70uYz+ux0hO/WqMP0kXaMhRKUKher8XwsTXaCBRm/CoRXCXF3q5dcG+K7ysFy
         8QEg==
X-Forwarded-Encrypted: i=1; AJvYcCVcdRKbuhxt0OxC8nXltTLzrz8CXYA2aCxVaPxovB25CHIoiqVUDFm3wTxspR+oPUsW5iIQ5MkJSle+6JpSgNjK@lists.infradead.org
X-Gm-Message-State: AOJu0YwdhF0Zy2kiQC3g763qfWqFJcp2Y6u01MNhdEzG6uzd9XL+mRPm
	Jl6TXXKWlPR4R6PZXo0XQJUEK1S/8fkLmJ6FRjdJCLH9Gvdfacb2OK4XPfMjQb05sHqdVjiMnCq
	pXqJjLFHxVbWRCr2pYHtu1IvW+3LLfhDSWNcYXffe
X-Gm-Gg: ASbGncsjamFdZATQRZiayeIRKv29Vr4oIP7RXX+7DY9Rf7CVsdqspjCaf1JR29lstC6
	9ksvoqMk0TuJ2z2NRBALY7dVosQGrYM2AIZmuBsTzPC1d0c6poeN8vji7Iyv8N8+EUWEVdJlRMh
	VZJ6cSaU4YSBUFoCmz5Y+pXuQvbJc/JwVZzSUQD/unyJynpy54JjKnGLbN6DZTFcUx50cJ8imG6
	OFW+Q+UPlKCe7EOs1cdDXWeVLvOOE0nLg==
X-Google-Smtp-Source: AGHT+IGkycQnfe72S9SyWbMalkjmg0I49bPxAmbp0MCvmAI2AYuaRbELjXuXnq+jCKrEmFtw1MggLjmHYfDowt+Iv2w=
X-Received: by 2002:a50:aa8a:0:b0:607:bd2:4757 with SMTP id
 4fb4d7f45d1cf-614cce2f67amr6758a12.1.1753305379189; Wed, 23 Jul 2025 14:16:19
 -0700 (PDT)
MIME-Version: 1.0
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
 <20250723-zealous-turtle-of-perfection-e67aee@kuoka> <e9e33fc7-4705-4e6d-bd33-ce9dc1a9b94e@foss.st.com>
In-Reply-To: <e9e33fc7-4705-4e6d-bd33-ce9dc1a9b94e@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 23 Jul 2025 14:16:05 -0700
X-Gm-Features: Ac12FXyYNcqm7jBBLCa0VFOXC51yHGdhXmCX5kALRLR-kvG2ffG7jYjz27Mm2C0
Message-ID: <CAODwPW-bwg-CD8qfP0cb58QVFLfJSqj6DhZSQuqHxsEdLz1QDA@mail.gmail.com>
Subject: Re: [PATCH v3 07/19] dt-bindings: memory: factorise LPDDR channel
 binding into memory channel
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_141621_245754_0CE9D2CD 
X-CRM114-Status: GOOD (  14.90  )
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

> I don't want anything specific so yes it could be cool to have a generic
> node name.
> "sdram-channel" is fine for me.
> @Julius what do you think about it ?
> Is your existing software generating it in the kernel ?
> I'm curious about dynamic node name generation.

I'm fine with whatever for the example here as long as the kernel does
not rely on any specific format. `sdram-channel-X` seems fine.

On our platforms we generate these dynamically in the bootloader based
on what we enumerated during memory training, so there's no kernel
code for it. If you're curious, our bootloader code generating it is
here: https://chromium.googlesource.com/chromiumos/platform/depthcharge/+/refs/heads/main/src/boot/memchipinfo.c#25
(We can update this if there's kernel consensus on a new format, but
we'll still have older platforms that keep running the old
implementation and we also want those to remain compatible with newer
versions of Linux.)

