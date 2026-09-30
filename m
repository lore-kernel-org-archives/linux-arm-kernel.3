Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CC9CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjmEz7DEJdgRMfvXHXMbt0X+mPHt3JAbY1oLpvUqkxw=; b=0Bsb0U662bgOSCJvf2Cnnmm57d
	hLzTrYAKndcpzmYAc8cQJ+FWTmMbERNtKJwnaxt+TBE1EOMcxIxfujkQULB5Hy8HEyfUVLLF+S3EU
	XMEekw7zOkIYm0wd395yFJFTm0qltqWgi0aPSYcz/3Xz9kVwIdCZnEw0TDdweaacsDZE48xqYa+c2
	BPUkz9ZpfepvUc2RAFDRfXvreOO6Wf0fczByjLdSthrsxfXIWn6FJxEvJWVOEfo6LyUyg+AaiQNh8
	b6Rm9nwHXgMDk0qS2GfiTHb0NwFuQnLhdXyryHv9o6UjiODetUOFpfwPZGH9OgdnO0BR0GmTbFawv
	lQzO6vPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtAA-00000005ybg-2vSI;
	Wed, 30 Sep 2026 12:11:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtA9-00000005ybO-25XY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 12:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UjmEz7DEJdgRMfvXHXMbt0X+mPHt3JAbY1oLpvUqkxw=; b=BkIPytlcKPZohqlAbQsxVcrnY1
	WSb4wDR5w42XZjgAF4JxEW4QvDzSTwkct7ikjx1UEISvcpdrpO7cVSM/2DCelpBSSBb8QaVYaFRQ+
	79W+ds9ticLR7K9gRbjGwLuRiq4moMgYivNIjBhFXDxjGR5p+0vhaa5tKwuEQsjZvgVVanpyKKZc0
	VY1K21xITDpzuDYZRNOYV8QoGI+agg/z9HkwBkkHpO73WhC0TfenRLaKkePyBQPU8iMWp3b9sop3K
	2faDuuRIdLk4LzW5XWpwUsE9z9t0Bke967cNdtZwSaahd0xpFzRGV7GsxDxbKoiDKDcG2/tleopzB
	IMBNrnMA==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBtA6-00000003lZt-3EPw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 12:11:52 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so32478475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 05:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790770309; x=1791375109; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UjmEz7DEJdgRMfvXHXMbt0X+mPHt3JAbY1oLpvUqkxw=;
        b=hPQlRsWJE9nBD2tDrTU5Q8sX+uWUA8Vj5T4VqpL4foREz+H5l9TLBswKFY4hb4AHUG
         +TEv4ScpDrKm7U51DnR3mzskFYU7V/5vL+PRu93bTy3hm/xznLEKaveFneyCi6dSrWMh
         KMnCD6YMbE2gvyUY3YSoVNj0YBynuPfjYhBEphgYqf/eG4oS2t5amIfC230p5RBpcCFT
         4OtitDDBiKXm+TIzYdV0udFAMYGAqeQjGcL6d0Fs16voHvrfmSEF4agVJSqMEpDNAnvd
         C+pTDi1xUKg8V77zDDsBAAeBARt6C5mnASChUtQIhOUkN6d3YIphmdb87KXTYWDD7tV7
         WtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790770309; x=1791375109;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjmEz7DEJdgRMfvXHXMbt0X+mPHt3JAbY1oLpvUqkxw=;
        b=GLbe6T/SOsm85dJAQb9pm8dElCr54Mrk61vSEyg9u0pbqCbjxsU773QvmRzGXyvmba
         da6AzBpfEChu1HhSx8Fji1z7GOnoySKoI/dnYquFh3hJpyHI/qb4ZvXdwq2XI8InOCJ8
         7p+FcowT2tj5h1eZKXwllRl83G3n95E86GYnXBNCAmxga59KsOVWygUByyDdd81CNVuZ
         ix9l0M0SKwk2hMAaSLwLYMsFJwPDjhcPZTncpxxy+9vsAIKbZzGHJfMd+P8ld+2INX2n
         QaBH+O/GZnVAEqhtQvNX9HCQxCgUhqOmpEuRFFd6WIad+FTHKQy85m1DVQ6iivBynAJE
         7Ajw==
X-Forwarded-Encrypted: i=1; AKwUvBzQSfmRbI3t3qQ79uBHfcsTOlxhSk1gBZb16bjITXvCsybZiEn9kL8i1h3dhzzIni7SlPIVfpg5YCATXEiW8IBu@lists.infradead.org
X-Gm-Message-State: AFuF++k05w107Ic6sKbStMMePCETH2VD1BlCR9lKyewkLGTLKPSZEmCH
	M9VYg0Vi8fNWebXr8RyTkvfREcyyx/nOCTP1ftVJy47/13EjQ4fGyoYz
X-Gm-Gg: AYBFou3HPn1MzbGemZWKcp4uPRgq8uTclCZVnpgVS3wwRkR31Waf3CRAuIWvgGoTuUJ
	5MYdWdj0WhUl/9mEfz3UvwyV2Fv4WybEpL8a3i7s4xJ5UsAzbR3t3DYlwGbnPEkrQ0TP1D7BP13
	n6Pvk9K1RePIITayWoLSKuqwrWPurHlEOkSorvLru+7ltbZFzY8a7Zn9cGArPkDrzaHwhlYpeY3
	eolCNb7novLNQaUbrtFaABtB72NDFTscjStrHYd7vsOeGz3PZQyUC4049TvoeFBO14VSQC5MDn3
	RcMX4ZSPgZG6FqQdTZP0S7DXENGO76DrlGMA+o5XRQnFoW3v+fP6Rf0hYpzrX9PHnxfo0LvYLCj
	pMCLntVKyuzrO/+LNej9/spjcwcksAeOPee4Ock/l/X6ysiWv8mdIJdv/D/oAFZgoDUcrimj5Ue
	ZDODeL/xFEUXHUn0d4l3ZG+zlGw/X0vHiFA8QwdKJk7oOA+dXrTbQA8Rx8Vp4o5sscC2dwqacIB
	xqwWg065D1prmqapdLUcmcmqBlZapzJ
X-Received: by 2002:a05:600c:19cb:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a01c175025mr13081675e9.31.1790770308790;
        Wed, 30 Sep 2026 05:11:48 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01771b0e8sm58527975e9.12.2026.09.30.05.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:11:48 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jason Li <jason.li@cortina-access.com>
Subject: Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
In-Reply-To: <f6d0478a-3438-4903-a9e2-5d314f5948c4@app.fastmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
 <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
 <179076583795.3054628.14443934429806440798@gmail.com>
 <CAD++jLnZBpoF3H3-sqzmrtwzxLGombFMdSYMVo59jiGFYcyCFA@mail.gmail.com>
 <d97a806f-a5a3-476e-8910-30027a6f568d@app.fastmail.com>
 <179076863241.3327419.16233537387530771884@gmail.com>
 <f6d0478a-3438-4903-a9e2-5d314f5948c4@app.fastmail.com>
Date: Wed, 30 Sep 2026 15:11:46 +0300
Message-ID: <179077030602.3399593.12266354979192327093@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_131150_957804_1708473E 
X-CRM114-Status: GOOD (  26.62  )
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

On Wed, Sep 30, 2026 at 02:02:43PM +0200, Arnd Bergmann wrote:
> I think I would go with mach-cortina here. Or even better would be
> to find a way not to need any code. If you control the boot loader,
> you could just implement the psci ops there and actually bring
> up the CPU from EL3. If that doesn't work, maybe it is time to
> actually have a generic spin-table implementation on arm32 the
> way we do on arm64. As far as I can tell, your code is just
> a copy of that anyway, though we have so far never added this to
> common arm32 code in order to encourage SoC vendors to use psci.

The boot loader is the stock U-Boot 2009.11 from the router vendor, and
replacing it on these devices is risky enough that I would rather not
depend on it, so PSCI is not really an option here.

A generic spin-table for arm32 would work for me, with two differences
from the arm64 one that it would have to cover: the release address
here is an MMIO register in the global control block, not a word in
memory, so it has to be written with writel() through an ioremap(), and
the Cortex-A9 SCU gets enabled in smp_prepare_cpus() (I have not
checked whether the stock U-Boot already does that). If that sounds
acceptable, I can post it as a separate patch in v2 and drop the
enable method binding and mach directory from this series; otherwise
I will keep the small platsmp.c under the name you and Linus agree on.

> I don't have a strong preference either. If nobody else has a clear
> guidance, changing to "cortina-access,..." would seems the most consistent
> to me.

OK, unless the DT maintainers object I will switch to "cortina-access,"
in v2.

Thanks,
Fil


