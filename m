Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0FCCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 10:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgnJRI/egxtjaoqDVVqBQgVUu4WIklNB+SAbz2GeD+U=; b=3YmJKzGBtsEseoIwXNUDlVJaaS
	oWvgb8KSjMY3wR6NtC6a4OBjBgAU9Ut7/qnCfJQZj6LpHxxIvL67MPA9jdU5WA6Mopzp09nmyZxC4
	2BR8a7f4Vo2VW59xIUuMcJagiCEETmAX0FoWeEoePcDkvpTHIJOhC7CQpvBlRvm5CMoSoMCK94Xtn
	MwwUeDkW9D32NfGIx/M2DWWofFvpldLGTKaVw0Vn7Ebx8EJzjhIMjgUDwYZsacxYdOJvTylJYDzhX
	Etlj42MlKKfSCSG+4EyH9Hp87QyucJipEuQqgkD7xu7QnXOTdh3NOvDDPHD8eDTH2aPsW6zScWSz1
	5BvJyCig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTPM-00000000xZN-0iFa;
	Fri, 05 Sep 2025 10:11:04 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRtG-00000000OiG-3fu6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:33:52 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-6188b6f7f15so2577084a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 01:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757061229; x=1757666029; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SgnJRI/egxtjaoqDVVqBQgVUu4WIklNB+SAbz2GeD+U=;
        b=EX9zpU3Y1pHz9YGFMI4nCLLkoS1F2LtzFygvA9vsckMFWt6JOeAbU7H2c9/1GhXUWN
         xx+Al3K5hv5rdkMuTIsIcFwUM4RErrSYxwjCYMvaqStDy7sdIf7hE9tm7Z/ZhDrHtYer
         8K9FD3feWGco4vxg/dKDVz6rlxwyRLVg8m7p/c5H2HptOGvQdcXPdfiLRRbhqzz3GpoL
         hHPuQas8+Tgt8KlN7jSb41+FUplTL8R0I7qZuO4S6NTRAX/1amvbbKP7n0qmDzoMB+5E
         SZhxM3q615krLZS5Jf0xQ9Yaqogc0T6BsvfH3m7FOeWyW2WAghZ3VD7AyRRJMS0jwuP/
         G7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757061229; x=1757666029;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgnJRI/egxtjaoqDVVqBQgVUu4WIklNB+SAbz2GeD+U=;
        b=g/U+X1g/x0EjQAR5cSgJ6gqAFQJ+khJqD0KqqL0Dgf+U//CX1lVZDn5TmRc92gjtV5
         TU5qbNFDr6Vi4z0tX7sH1izvEj7mYPQoDgWAQHSGozXehh9ieaCgtqzfBlRpk4CXNNoo
         cpiiKaenUi1qVmMigwEcbtt0H+sAAY4J1NrCCEpqNR7RPx/yWL56HLN6P05ocgaYO6cu
         To3EQY64H9Cy6PY3Ohus5rCJrIRm7KUv8epdy6lrgmPqPE2etF+q7XLrctRG2YK1cvBW
         qDo6wybVN8GlhzZ381KRsG8Qh6hnUNMBxIsMRJU0qkKedbYLJQUFuHkkLpYikpSDDVLO
         xmLw==
X-Forwarded-Encrypted: i=1; AJvYcCV0SLBgGJjBcxhw6wsS3Susvc3nMBbPauMTW8QO1ZgAexECyOOeU/83Vm51uwekfislT998SACX3KS3kGUtiAQu@lists.infradead.org
X-Gm-Message-State: AOJu0YxQFk9SvTMZoqkk3koQUw1EniDxhiHgiPCQk05KaGRlkkU9WPdo
	LXpi7n399E983Cii/xxAiVwJDcFZwIqHrPx/tZpp5IcR4rdd/o5whAssF38+YXW7JZo=
X-Gm-Gg: ASbGncssKK3J9htS6R2Vrv6Q20bYDYTUw5C4KtvKh46iN18at7UAoesJeCoxgYhrQ0p
	VPBxrd21A87HLm1TcFhEtTofNofyUMwpLhaWU3HOcfMh6xuLrVnI+lvP352Cf4W/zjhDrSUQQOr
	tGiiOtbxrNJCkTQl/nRJqaet7nAwBiLhDUhX4Qug/UxdDLGzYFqfOdN03kvvmokJvHMjWhoSjzn
	eJ7OD5P2205dnW5ddZJbZlvh2eEN/8rO1dCKoI3IumwYoQ6XjgTbrPSTthTD9UpYNRsEN11LdXF
	+YQEE/1vgonUfckhc4nnzU2hqEWC5KO19btxgMxvRYBa9uSeqYM5uUYgUxxMdfN+pFo/T6jxWOq
	V6h43TtOxrJWLIXOG7OMdia0wiAN9MCQ1z4YoVl6u4Gws0KucoUfqydkPSCjl4OX42zPOCbN9gG
	Sc6gSJ6bGKLd7H5jFMWiG+x8ZM/MrTOVGu
X-Google-Smtp-Source: AGHT+IGKUP3RZ5t2/gasPzJzuI8AOjzwK+b1qdxRjHmmhV48QCT+F5m6d9XTYWi3CHhwJeSzib8Gkg==
X-Received: by 2002:a17:907:a44:b0:aff:9906:e452 with SMTP id a640c23a62f3a-b01d972d878mr2222435766b.31.1757061228746;
        Fri, 05 Sep 2025 01:33:48 -0700 (PDT)
Received: from localhost (host-79-31-194-29.retail.telecomitalia.it. [79.31.194.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0474be5e99sm476564766b.94.2025.09.05.01.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 01:33:48 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 5 Sep 2025 10:35:45 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Peter Robinson <pbrobinson@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
Message-ID: <aLqg4ZTbUjsgoMwy@apocalypse>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
 <CACRpkdY82ohgX_7YP16DJrzDvxMHcSu3rW+UtEmrP0AQiD_Exg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdY82ohgX_7YP16DJrzDvxMHcSu3rW+UtEmrP0AQiD_Exg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_013350_912642_C2ED2D02 
X-CRM114-Status: GOOD (  14.78  )
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

Hi Linus,

On 21:06 Thu 04 Sep     , Linus Walleij wrote:
> On Thu, Aug 28, 2025 at 2:45 PM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
> > From: "Ivan T. Ivanov" <iivanov@suse.de>
> >
> > This driver provide pin muxing and configuration functionality
> > for BCM2712 SoC used by RPi5. According to [1] this chip is an
> > instance of the one used in Broadcom STB  product line.
> >
> > [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
> >
> > Cc: Jonathan Bell <jonathan@raspberrypi.com>
> > Cc: Phil Elwell <phil@raspberrypi.com>
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> Patch applied!
> 
> > +config PINCTRL_BRCMSTB
> > +        tristate "Broadcom STB product line pin controller driver"
> > +        depends on OF && (ARCH_BRCMSTB || COMPILE_TEST)
> 
> I changed this to (ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST)
> because Peter Robinson told me the Pi5 needs this driver too.
> See commit 1d99f92f71b6b4b2eee776562c991428490f71ef for details.

Indeed, thanks for spotting this!

Cheers,
Andrea

> 
> Yours,
> Linus Walleij

