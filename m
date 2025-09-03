Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6518CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vc5TDK1H8Xst9gKhvws3EuxZaIkfxswLhF5fBNdm9fc=; b=ypUEe0U2PiLeSO2chJ0X1JMm1T
	pKXFgdGjl16fRauVoZMixQpx0jOKBrz/HG7FotBu+G41Czi/ONPg6L4ipBECatUiz7CPFYN4izns5
	7PI0yzPw8sgz+KJeTnSvVGVEF/YFi75FjZ33fm9BD3D6g44gFxC87nrPBT6xtzg8h1iZjC9bnhloj
	Qt9vXyVWieYal7i8Ld4hu0rJZbARS/ZJMpZxAQLa7akeHGyEe2xlADuJzZh8Y+GoHE73t9HDDqP0d
	lbYCTnpJsUD/dPee0VDXRCHA9xPcgp+ta26J9m2hPvlfio50jBEEQxZZ7sWEwucOqVFR80K7/X0MI
	fZ943bRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjKY-00000005oWi-2tUh;
	Wed, 03 Sep 2025 08:59:02 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiO3-00000005Kay-2yOn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:58:36 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b046fc9f359so22476566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 00:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756886314; x=1757491114; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vc5TDK1H8Xst9gKhvws3EuxZaIkfxswLhF5fBNdm9fc=;
        b=K0YOLahoCShcmvILb1A8OD2jxlHvH0Oao/NnQElpDvkpwt+qaH+anbOUbW/iE2DA7v
         pj74bpMH4TYdGRv50HApC7Nja6o0KmbljSCnwl4S3q6bPquH++pNUQ0WL1ON2QXnV9XC
         J1MuMAxrecR13M2z+zw7vOaMhGktp5mJuSTtaV9AuJ6j9JWAe5J+BXS1Ok6+lg27WpsZ
         IBZ9U/vMkHoIoezN3erRfVKGw8PW8mbV7qW5e286piYRcnGQ9dNihKps5sJNTsQRt1uw
         I0N1sJbEWrg689n2u/wgL2g154dRWOuzj+SD/YkxddYTbw79mR4Qfd+kZ1VP6sdjX3+k
         cXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886314; x=1757491114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vc5TDK1H8Xst9gKhvws3EuxZaIkfxswLhF5fBNdm9fc=;
        b=mrDxxJX9x550pehfySNFA4SCGAKDQvB5KXHQ3QT3tDe9YiNQfmEqUPD+So/kMjoNTI
         HcvH5V9W7h8MiIaWiv4IdDuxkpxYMpbwQ4pFy6LoR5DOUYSg/tUog1qmE7lH0Iuay5/m
         AzIiF9oPvdXgbr0XgNTyCTLoon44kHKgPyQG3pdosF62kkNAtBODDrtM93nNzzoDADy9
         5l0fX9BTX133mhMt/HvXL4Q3Ju7KxwnQlH737Kpb7WIRaN2YBkhg2Zjmb3Qqu1A9mO72
         R2DSS+pzBAJ9qHH6upeZad8oiVvs4pOpXGgSyCBTnwKAumrn694c9Y6U4pt9E4UN97Lh
         Xo+g==
X-Forwarded-Encrypted: i=1; AJvYcCVNChqIl7s9qbXgE1iTa6Uj0kTTYkT9uoiEIvj/iWk1HyDsaM1g7q+B2gIPE1EFtzI0R1nARdNo2vVma7tEtf2b@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4h/6LSR7yTBHM/knThRBmkBG7AZseulUj/0mkEw+dN3kY6DMo
	EK9aybvISTRPHkGk0AAbYlcAIPDSWz/5+ZGzTYNcZsOocmhF+8LKjFpX4K/zg69b/2Y=
X-Gm-Gg: ASbGncvMCt6qMxfViVqPQRf1W1OYT4WXq8iQeOYfcsvYxuSi2g9CobqZrm4PUU6erbM
	h+VyLAu21KB8elnTBjyyv+69RJFKkHq0pH1KmSk0AAIbULS3h5U0U+0joAYTMt3vhv29r8kvctl
	Ag2zBmxItFY/XJlXPZfxhIrNAYucVFNOjqd8TJd+rfjRva+N9RKDQIukm2Yed51BbtCeei2x/3a
	nfYxYZd+IFO8N3UKb27bxj7i/e4yXlpKAe4XsgE6xny50Q+q9eZJFCIZOzsBc1fiBEIZqwW+gch
	9nxwYfpD8y5oWZ1B02FsybUdu4smlsBnzknGXABL2Z9yiKI6sOelWMdjjZTP2RCQNhlloN4PH1X
	h3i+LWtlKe4W9U/ShjGe39P1kOmzbw18/hyqUiZkWi6JpHRSXcRzOjxCWt0NJVkgNOrNqJnhaGj
	zxZ8KiGvuqDVF8o3YaT4mihFUtt3E=
X-Google-Smtp-Source: AGHT+IEn64Dxy1FDWMJAmp+prlXFdQxbLUeI9Tc0ZftSDAzkPfUTGMaspxdMpVBKzN42VG8J7KFQzQ==
X-Received: by 2002:a17:906:c10d:b0:b04:20c0:b219 with SMTP id a640c23a62f3a-b0420c0b768mr1025270966b.64.1756886313590;
        Wed, 03 Sep 2025 00:58:33 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413782b94sm875084566b.35.2025.09.03.00.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 00:58:33 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 3 Sep 2025 10:00:29 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v4 0/3] Add pin control driver for BCM2712 SoC
Message-ID: <aLf1nc20SRkWJW51@apocalypse>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <CACRpkdb8fFvgyWPAaP6AumwHUYhnvc7BXX0V5kwO4sts6zSGUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdb8fFvgyWPAaP6AumwHUYhnvc7BXX0V5kwO4sts6zSGUA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_005835_747067_A138E450 
X-CRM114-Status: GOOD (  13.92  )
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

On 08:58 Wed 03 Sep     , Linus Walleij wrote:
> On Thu, Aug 28, 2025 at 2:45 PM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
> > The following patches add a pin control driver for the BCM2712 SoC.
> 
> I have merged the prerequisites providing .function_is_gpio(),
> do you want to do any last minute changes or shall I just apply
> the v4 version and fix up anything minor in the process?

No further changes from my side, please go ahead with V4.

Many thanks,
Andrea

> 
> Yours,
> Linus Walleij

