Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BA9C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 14:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewzjsdpoAykHhEBFgJ/UB1pQfM2cO3t1vQCCzVyKC6Q=; b=HdDYPyhck/EYlFNDCA3uho5yc6
	NzeAUEm+gUGTMOp6IW3/48H6b27Ezov+MGaKaMv25WHLFbVvGKkKyj+rAmViRSErYEzazPPyKCvpL
	3Y3YWZosICR/7/n7TGbgFogpiSiKc5WfAvvx1sLv2urrLipyuOiA9GQRXf47uXjDIHISffiPaa8U1
	Ht6Wr8toyxaYFsKmmsIfd/XEOhxQ965EA8ASUsT+OcGOrW5fRHd31t3YzQSKwPJmcyzwBUoe5Qd+G
	TTIkS7aZZjc2cuX2TornkuqNDCqHyHjFkN5umlrAsEBDnDvzuTERX7dJBbVPfmnX+g1yMQ8/RcDfw
	ci5EYJDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOQg-000000033lW-2kt3;
	Fri, 08 Aug 2025 14:50:46 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOOA-000000033NI-2lK6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 14:48:11 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6199f850ca7so1010273eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 07:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1754664489; x=1755269289; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewzjsdpoAykHhEBFgJ/UB1pQfM2cO3t1vQCCzVyKC6Q=;
        b=p2sw+cRZYNbRA/hOrizZviUmDuvOHUt8v9D4rubQIHzrRXZR0jFzfR1i5mBPfUyhw2
         fJA56mJp1xWfC8obwH/c2DKHRCgbhzI/ifFjbMHUfVxcLJ6XMox+6+ZGWkoWq+M+ZZrm
         zYmJO4j6qKQu7LZjyZAhQB+CQ9CpM/QqK5trqZUfwsE+Q/wOGWS88H9ezI54Qk28uDmi
         Mej+3mecyg/PeDZYgEcjmglOsnpyb2cOfxdYWLw6yuZkpiX/Yt/LqR2bLnyrG96bexQq
         bD6OdiQnGiG1kNJ/l8yozML9S9aT4B2l8poL0PnDSrv8HrZKw0terklYtxR9sFQld3UM
         l/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754664489; x=1755269289;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewzjsdpoAykHhEBFgJ/UB1pQfM2cO3t1vQCCzVyKC6Q=;
        b=ozj9FJRF2XtvC7lMT/jM2DIoorwyAzXN8daHzstRjUn0XI2uMN7Do5dKpfDMvt+l1P
         QMGbcWHIvrYVYFIOmyESepd4rBneXa6x2UPN4WEK9rLykYUadq96u1oA9jzStr+AVW4q
         jcXBqv516vBadZqH93u9sGRuimg0XGmuAlZBbCNojcBQqtDbUxnLFi6Kr+be6fXdDFOQ
         Mi6YJqWeKo3DNaGyRsL5f5Atf9ViogAAEXT3RNCZ7z/2aNP4Dwo0SCRxCQVpNhJJc1vt
         uxOnW17yvLEJvfCPAkNxxwnm9Y6TFd0zzt6uIzl3lcWA+oi/hVrXmFwb52GNTYDxrf2y
         IvSA==
X-Forwarded-Encrypted: i=1; AJvYcCXUs7Oz9670/+jla7EG8gA8oPSA1px0+wW5wpzjo9MqDWGq5p+PlZYwbY2qdKL4OxB1cbh0+6P8HVLsr1lX7Tmq@lists.infradead.org
X-Gm-Message-State: AOJu0Yzynllc367YwLgEgYxhFXacvBUpEMyizEvMZgIaNybxwsr7p/7c
	+D/pPx9jqawczx4tcGrZvyMuIyPGC/4m9lubJAV8J+p/EeU1jAw/JRc7PfR1W14EGBM=
X-Gm-Gg: ASbGncvoz7kujDKmCdZGG6WQwWKb16soQS2phLNnuNi/bWu5s9F3cRGDGyP5Q8UExw3
	iGMeSW2NCCAEqEVQDFfzQrU2hqJPuP+xvcwADr7HQaFdhNZKqLJuTVBIVZye0FkCe5w2ZDMbY7D
	JV1dKd3r/+t5IhyZ5G0a6t2cDRE+htCt7NC/d8PFpWf3UdZ85a+BQBjGrMBcUCbFF0TGEvs4ouL
	1JhIbazr/1hBJT+XqtBVzE4hUfNjQS444J7DHAbYdIMu3GxQPET/MCGqbjTs8w94JNzT+WvyP09
	3mfC52rNhYrrycj6tij/9HlFXF8MDbqyLLXuLgIS4JNr1MUeRmwAuu/H9OsWwIjOu0jWsTJBiOM
	L26zGMDi0y3abs2SzYIVqELWED0s7p4vEE17y
X-Google-Smtp-Source: AGHT+IG4hCE+IdcT7gDI6Y/FY4GnDriutfuUfIR5SNfXBdFrj25/eWOpBz8eI1y/JTwOMLKAIgdhrw==
X-Received: by 2002:a05:6870:e311:b0:2ff:8ee5:d1f7 with SMTP id 586e51a60fabf-30c21080f92mr1906932fac.1.1754664489207;
        Fri, 08 Aug 2025 07:48:09 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:e698:accb:897b:ca29])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-30c3a9d052asm123722fac.14.2025.08.08.07.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 07:48:08 -0700 (PDT)
Date: Fri, 8 Aug 2025 09:48:03 -0500
From: Corey Minyard <corey@minyard.net>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: ipmi: aspeed,ast2400-kcs-bmc: Add missing
 "clocks" property
Message-ID: <aJYOI8BzUSeMiuJm@mail.minyard.net>
References: <20250807132852.3291305-1-robh@kernel.org>
 <a14b98078554e27453fc1f96a667b299a15fd4c2.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a14b98078554e27453fc1f96a667b299a15fd4c2.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_074810_789098_66C31B68 
X-CRM114-Status: GOOD (  15.75  )
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
Reply-To: corey@minyard.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Aug 08, 2025 at 11:17:29AM +0930, Andrew Jeffery wrote:
> On Thu, 2025-08-07 at 08:28 -0500, Rob Herring (Arm) wrote:
> > The ASpeed kcs-bmc nodes have a "clocks" property which isn't
> > documented. It looks like all the LPC child devices have the same clock
> > source and some of the drivers manage their clock. Perhaps it is the
> > parent device that should have the clock, but it's too late for that.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Thanks Rob.
> 
> Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Queued for 4.18, I'll add it to the next tree when 4.17-rc1 releases.

Thanks,

-corey

