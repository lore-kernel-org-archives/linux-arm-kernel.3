Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEC7EDB7CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 08:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAhnvdn7hKx6YnOufXJRDlAYALMzw6HqrxcTsLc/17U=; b=rO9537b83hdFXINc/Xd47eLd4o
	7l3GIyGYqdG7ToYOZ1b+80BcQcfjGLzIteB/OIMjUeAKXfEeV2WMTPsrjmhfKVicIk3ajndC2yK8n
	rOtQ6IuvUghgH7nf+eSIEhuIbQW7gpUaRJjW7icUlED3/O4Y7vnCXnIuo8s7gQ2QMWdcGBNbL8lkJ
	57MWyyS39wHh2zdghZKhKS3zaPZrQBGvWDQ2+XIWXKQzH3J7oJYMZ5cVP39E1zXH/8Pj7sjcuRvqy
	RawjppJHnlF/5MNXfxQJYNm4+OMLAoRnWHGVjb7yFEWHLnvVEM54r6zhjyfatIZ2UI4I4sFDgYIRe
	2UFur0Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lB-000000068fF-1iTL;
	Tue, 07 Apr 2026 08:26:09 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1l9-000000068dy-0acP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 08:26:08 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-482f454be5bso59757735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775550364; x=1776155164; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GAhnvdn7hKx6YnOufXJRDlAYALMzw6HqrxcTsLc/17U=;
        b=L9PHCSLfEM47X+c6vJTANEnq0+iXDcCGQySJCbInSRYKU8CGV4lwKMwa+23BSqmYqb
         rnxdrAikRcSMEOnVtH6yHIqfuA74uET9pqkmCcC8Q7G+e0EdwesVI41ZSULSL58qvZQe
         YydXXcQNbazBuZu5zzyC+29mYmn2Dba5BV7UdEXfZMRAPPk0WHTjjPGB9KZbEm8jNvZv
         IQtQRUTLAjsqbA4nMyFD7ad+cFC5hM6NuzU9cd+iSFtm7xOOwR3hpqTsLA3cxxntmS6X
         G+tGojPm8HwgNZ5t+USOiNOUmG38dBDOQEutdAJp8FW3tk0LsaT/8rznwBMvMoucF1Es
         Mgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550364; x=1776155164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAhnvdn7hKx6YnOufXJRDlAYALMzw6HqrxcTsLc/17U=;
        b=sy1M4Oyy3SFIL7MeUMPq+F4b9arxjqABR/z69fTyysUysElO2NX1qbVs4f9hjVTkl4
         xn7m8q5hNUGWPjwHsZWpD+V+BvN13gVGnkGWgUbxdGWPRA7YX4SD36pIl8rP55oCz+Y8
         oCyD8K0BEwbMPmPlUjFX6wQQ5ov70wDvjJffWiBVhgztTJ75P5zs3M5zR1wjWSvW/Gsr
         ELg7s6VxnmoevPOE1LU99MbTKUcd7zqC4VD3ZUM+zzdI0e2wg8UIrdEDS6f11cM600XG
         nwLe/qfnzo1hSM5uZlMd8HdgTCDF3wo/KbnfEnbeBU8VV7wmXcV/m+L19aUq1h1MYGzq
         N4IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXICtaOmbZ27LQp9D+Li7Qq4itYjyk8OcQiXyn+TeVHzEPNNYh1dXL8fRGmKVSTtn6t7WtBCF0omRUVh7dlGc9k@lists.infradead.org
X-Gm-Message-State: AOJu0YzCzKfozhSIbfQ2Duml7bmb3jSWAajyFlxQfyFoUxnHxDsHE2yA
	xbSYe/ww9eHnjA996J/Nn9m+Kk1F3tU82GjJzC1cA5Z3wSAHDdOtzUjH8x66aCT0tEQ=
X-Gm-Gg: AeBDieu+yE9iRbkCUZHNkNakr8+ydOWcbxpSV7JURyJOOBiVedGMhpbLTVucp54sFP6
	4+BsFbCGBI+3+1XDeFOKoDDAGWfw2oQP8cH0NtUUt78DpUf8mFyQ0AkSbm0/c/+mjDqy/eluXBQ
	VCpNfTcsO4CKGNoMae3jmXpI1P5GdG+bhPCozlizp7NGstpT47h2modhyWUi/+hpUKG1fJK0vcz
	pbYnGaTe/nKQK7kyxT+C1Kfp4bC7cQZJr4b9QssYn6HvGrlYOQYVDKsiH4ov67scKvAdKBWcRQt
	Sa3HvvXNVn/rr5erCNi8mdqrjcmoKaTeTbhD0RJ9b3HAh7SGOBYiBrmM+rVn/EbINOTveQznDCL
	xI0dISJ7Rga2v/qqYoC6XVcC1dv91wIbzXpt9aCwEYAj9vchufLS7RkWdhq6/1z97POX/n4LkTq
	U3zqP3sMrTAmtg1Ijj+aU+g+vMMFELPCH7gTOItWVOL7ROEFin3Q==
X-Received: by 2002:a5d:5d0a:0:b0:43b:9b0a:7e80 with SMTP id ffacd0b85a97d-43d2115aed7mr29018679f8f.3.1775550363998;
        Tue, 07 Apr 2026 01:26:03 -0700 (PDT)
Received: from localhost (93-41-3-120.ip79.fastwebnet.it. [93.41.3.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c637asm46018051f8f.14.2026.04.07.01.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:03 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 7 Apr 2026 10:29:09 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Message-ID: <adTAVQddjxHgoh9k@apocalypse>
References: <cover.1775223441.git.andrea.porta@suse.com>
 <11b5eee3c22cfd034bb4b425d28a5a3ff2a71828.1775223441.git.andrea.porta@suse.com>
 <20260405-enormous-glittering-avocet-285f82@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-enormous-glittering-avocet-285f82@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_012607_183053_79D77DCD 
X-CRM114-Status: GOOD (  12.17  )
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

Hi Krzysztof,

On 09:52 Sun 05 Apr     , Krzysztof Kozlowski wrote:
> On Fri, Apr 03, 2026 at 04:31:54PM +0200, Andrea della Porta wrote:
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +
> 
> Missing ref to pwm.yaml.

The reference to pwm.yaml is at line 13, as follows:

allOf:
  - $ref: pwm.yaml#

currently right after the maintainers: block. Are you
suggesting to move it after the required: block?

> 
> > +additionalProperties: false
> 
> and this should be unevaluatedProperties. See other files.

Ack.

Many thanks,
Andrea

> 
> Best regards,
> Krzysztof
> 

