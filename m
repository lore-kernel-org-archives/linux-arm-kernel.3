Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13F2C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 14:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRoGRMBV7PqtgKTAeThep6xLjkOzYN0wpsMcbJOtKx4=; b=Wx2qvI6R/r2vX/eXcHo5FEJexZ
	c/96NTs1IFtN3FBMRO28kOgcoedH4AbPPH1xagnYOB79Kebb0q9hHQv/eY+6FqyzBxGD5Zn9UKo4Q
	U6CW3kCUF9cLKHCZOcAC/xkm/IkqPMvUvgClm/pNEgtUh8OaMHzkXEmLTwDoViqTMVJrOxExGrcnX
	j+4ZbuhynZsrANF2kByXOkt+ExteAH0vziCez16v0KV9LEeRhBmMFC7Vma3+L57wHax6z3LqLhvrB
	K9AXuOMYqAtoCm40mV4bMBVIRBhY21VJ1ZVk6bYaC28v0RTYj3EZCETekqAeWR4GrqB1+daq7c+0f
	tGFziOHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKe4q-0000000Fx0u-2Ftm;
	Thu, 29 May 2025 14:17:48 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKd8d-0000000Fq2f-2Kn2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:17:40 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-70e4bd65106so9393507b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 06:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748524658; x=1749129458; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LRoGRMBV7PqtgKTAeThep6xLjkOzYN0wpsMcbJOtKx4=;
        b=GGThjfPqPBrUFpNmeBxJSjOfD+VA1wZjhbiEUFq2Rqc3Q767QlH4JYrzhwFGd02HN9
         fwLc9O/0xKgkKqctxIrxXJGQl0b8FTsOvYb7PGWRg9waOv4SIuWTsJIq6IWbRch98EQk
         XdSFtyqSo84oyGb4OowGw6Q6sa7PH84bNxy57lQ0rCb0tO+C9NG57wFTdudAGMdRmtSg
         YnMn+thCFRs9xpT9MyI+6SP5SZjq3z5drBkanZey6E24vhB+PRd4oMKgJP2lBg+bv76/
         gDHSwFnmJRg+P0tcALM9V7rnN9xDwhKR2jdY3Ucp4vyp36YH1nD9bHHtyUD5FUxM5Wnb
         wPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748524658; x=1749129458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRoGRMBV7PqtgKTAeThep6xLjkOzYN0wpsMcbJOtKx4=;
        b=RFPU5+5tMJJUJ91VKt0E77TftUeTkwZoklgaqGgkynSYbtg9BDYXO7KWXzXTtWzBbX
         Kaa3pqBIjzNGPX6x0k2/fhh8uUiEHHSHrCXC9uUP7LPnO2foDUQBx+FBUvduwa4maqgi
         RXu4AqFVfyrjJrXLN1JU5hVeOaoRn3MsFxu13Aio5p16+CMCHxJ4mqfURuJL8RLi1I0W
         Vs47xTfY8CvqiHfzwew1GzjfcC8vIqJkfmW5Jb//apNY4dX+Rxb/NQQqRlovrSNrOUG6
         U7na9Fm1lACdBS9iX6vD92cwkCxGIMe0x4Z8BEVBJTZhD8ugPjcwf/0WLNAQxBZTEmzY
         feng==
X-Forwarded-Encrypted: i=1; AJvYcCUCgO/NrIfMzIM/bvuryIpSRWue9H43oQAxX8w/PUy1FWHdehaKpFHZky30KJJsv4uaZdbusA54kje29pFUCN+T@lists.infradead.org
X-Gm-Message-State: AOJu0YyjVb7L43rXGARZroqhljM87rr5HfrWtPo+TIyGM1t47RTuTXEm
	cwVRvvCLr7a9TrZ5vbv7zQNcTJCqPECF+Z2ANZt3AGy932uvei7ZoQbJxE1wd9n8R0vURf+bG9O
	XbfQcu9xyeWmRzvkhP/lUoOaqfqRPvhctWYmBxAr8gg==
X-Gm-Gg: ASbGnctGLPvDOzxjlbIrZlilP9OdRLjrIow1JS1BuqF5B7WwjWiODgvjTi2Cggr6Uue
	Y2Wy8nwKngCjDFGBWFUeLC/tRS5VqW7+rjDSXIIArFQThN7zzYfFW4NslMy+UnSq42HDIR/INNR
	4j+lmifv6RvCx5sPKzdQhvFs1+owLVwI4iug==
X-Google-Smtp-Source: AGHT+IFmyl1zNSP/1T1Fu+Ipq6e7NtBsNPd9Sq1kBRpXHvD2CvYn2FtBpyWhYLC/DqeY2/E2ImvPRZWBInKH8wClwcU=
X-Received: by 2002:a05:690c:6905:b0:70e:2cba:868c with SMTP id
 00721157ae682-70e2d9a6cb3mr318642537b3.11.1748524657490; Thu, 29 May 2025
 06:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
In-Reply-To: <aDhWlytLCxONZdF9@lpieralisi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 May 2025 14:17:26 +0100
X-Gm-Features: AX0GCFttNUvo5SsO8pMKnRvfFUtx-_6vAOX9kBCeKJ98X_-miBgBYJmCbmILETs
Message-ID: <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, andre.przywara@arm.com, 
	Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_061739_603550_F58B1D5E 
X-CRM114-Status: GOOD (  23.97  )
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

On Thu, 29 May 2025 at 13:44, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
>
> [+Andre, Peter]
>
> On Tue, May 13, 2025 at 07:47:54PM +0200, Lorenzo Pieralisi wrote:
> > +      reg:
> > +        minItems: 1
> > +        items:
> > +          - description: IRS control frame
>
> I came across it while testing EL3 firmware, raising the topic for
> discussion.
>
> The IRS (and the ITS) has a config frame (need to patch the typo
> s/control/config, already done) per interrupt domain supported, that is,
> it can have up to 4 config frames:
>
> - EL3
> - Secure
> - Realm
> - Non-Secure
>
> The one described in this binding is the non-secure one.
>
> IIUC, everything described in the DT represents the non-secure address
> space.

The dt bindings do allow for describing Secure-world devices:
Documentation/devicetree/bindings/arm/secure.txt has the
details. We use this in QEMU so we can provide a DTB to
guest EL3 firmware that tells it where the hardware is
(and which EL3 can then pass on to an NS kernel). It would
be helpful for the GICv5 binding to be defined in a way that
we can do this for a GICv5 system too.

> Two questions:
>
> - I don't have to spell out the IRS/ITS config frame (and SETLPI, by
>   the way) as non-secure, since that's implicit, is that correct ?

Do you want the DT binding to handle the case of "CPU and GIC do not
implement EL3, and the only implemented security state is Secure"
without the kernel needing to do something different from "ditto ditto
but the only implemented security state is Nonsecure" ?
(Currently booting.html says you must be in NS, so we effectively
say we don't support booting on this particular unicorn :-)
But the secure.txt bindings envisage "kernel got booted in S",
mostly for the benefit of aarch32.)

> - How can the schema describe, if present, EL3, Secure and Realm frames ?

The tempting thing to do is to have regs[] list the frames
in some given order, but the spec makes them not simple
supersets, allowing all of:
 * NS
 * S
 * NS, S, EL3
 * NS, Realm, EL3
 * NS, Realm, S, EL3

secure.txt says:
# The general principle of the naming scheme for Secure world bindings
# is that any property that needs a different value in the Secure world
# can be supported by prefixing the property name with "secure-". So for
# instance "secure-foo" would override "foo".

So maybe we could have
 reg : the NS frame(s)
 secure-reg : the S frame(s)
 realm-reg : the Realm frame(s)
 root-reg : the EL3 frame(s)

??

thanks
-- PMM

