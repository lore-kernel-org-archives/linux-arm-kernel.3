Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAB2C36001
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 00:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEnr4izKJdjnJbBtyeXqqfyvYG+/M2XCUVon+4GL2NU=; b=n3GiH5j4Pz/C9Gl4Q6Q9alT2Fq
	N9wEfouImzYTEXduKaik6CJc5fib5hc9J82caIxdhhaLs/tLwh6eczVizvDssmTVRK//N3bKUXlR0
	HB7oiggvHkhsrbHowcet1EQczwxbNjnh3n3QQWoCX3H+niaB/bSrMZJ/lc72udGHaBqOoab23UuuQ
	g82E9iOjnQG7b++dDmd+ltouGNfYIaZ+7ICydEk87g76u5tKX4wNIdz7znpegleT2fjjCrIkK46OX
	xbV5XriVDdiPVcrc86QT8AalyRztIWKQbkL4efa/OiyWFIf7vQut1HQwF0YoY5f+l6Urp/iPmd7V4
	5dWRrp2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvmQA-0000000GbSd-1nk2;
	Sat, 22 Mar 2025 00:09:02 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvmOU-0000000GbK8-27WK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 00:07:19 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22403cbb47fso50794605ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 17:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742602038; x=1743206838; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEnr4izKJdjnJbBtyeXqqfyvYG+/M2XCUVon+4GL2NU=;
        b=Ux3M2cRJljc7iQI6DGQcjJfSw65CR80yqhFsEKJSne7rTkHES26fRjVAvD0ypdHFSW
         pm0/5Nu9FWzp1rq7QzY7NAnF9I1ky6AzNXI2+R+Hn874USCmdGopdzZ7Jp5VmFokalNc
         GV9+FyeUrWC3n0/vmZgD2WnTB0X7Q+NQXe7g1o20zvnNe4m019mL/AzNQO/5XgzmQqW4
         VjgQpBdZz9wYUxVr/Szp3kwoJjGngTQJhWRS6wxi6RT1iicDS1ZhJCyFgL83hAUZg5+o
         +UcPV5V6r9oMXntRc8tIT6KcDRoDYwuJHsVY32uT3Rnu22qLEzRdoTLdWePhSiSWqdgl
         kxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742602038; x=1743206838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEnr4izKJdjnJbBtyeXqqfyvYG+/M2XCUVon+4GL2NU=;
        b=OPx+sf3vAmlUydiZU7xjgfjjQdZkn5H606R5qA7lrCLJacue05mnnsJlTCtKKop5xG
         YyXOGjkcskvCJTAFYvjrhAHVnpVyvE26FfXSLR+d6kvcMbE9CUD828XayrpbxtqtrtSV
         yiPEszwKxnKmpi7Cy31YvcLkedSAbJoqS/B62Oux4or9DEHLwLWGazwPFGmsum/UEQip
         hYMh24rvDoZGRm6521IqR1DWXXZnIXvbCTh7EZ4V5e1L+C6l92DNUl10Qon/vNnJXxDR
         q9nln/aOL9987CMRlszGphdwRZp/dG7ynZw83MDX6YnuamCuteSkWRk2965F0A4yBM+T
         mrWw==
X-Forwarded-Encrypted: i=1; AJvYcCWt9kxyWtr69+Ka7VI+0UoMd0ZQMJl6mD0O+T5LiEAn+yuAtmSnuutr5cWMQzLQsxdK74t411OIdFUoyHcBjbT8@lists.infradead.org
X-Gm-Message-State: AOJu0YyCa36efMSkX0LYgZtPIBOzWBAtIRW4+SQde8pE/vWQG+gKn4c8
	DN238YXRMNvAHl1wHd9fc1JFe6Ww27eL4PPkBEQMEvDYuzUniOLK
X-Gm-Gg: ASbGncsafWEpFeIVQ5QaLdpgtqr3IN6xtRBr3IJYkvpoTi1m2rCfCzXxHGDEYYnWoCW
	KLHNSfM6ssKjAsPt0u/1c3VPE67yaIRGDMl6ile4/bRFqjiuGfuBlqG9ANXmE+CmclDcs4xsnys
	N0Kgh1DLo9k/jJvHBkpha1Dj1mMnrTy3nqC7Y2xaDVOJwStSJP1dLrB9uBiEqrGxwRl685FSpsd
	a2l1PiTLlF/wg19uIpNQH2qzeUwj1qa7I/IItCDJ+uPV1FoA10asTntEJiwG35SbI+zdT7J/J96
	9pQYleKcuLIR1bj5B6Ba2vevnG6j1HePQ/2H7hsDprvPmGpx0McfeXve5A2Y8YNzW0Yx
X-Google-Smtp-Source: AGHT+IFDUMil8h2USTF/6GZ8khOOE0OmSkPrtNpa2p2cNYAZZHsrUMdhozVcZR9tPdXtRiTCt389Hw==
X-Received: by 2002:a17:903:40cb:b0:215:b75f:a1cb with SMTP id d9443c01a7336-22780c5570dmr79779235ad.9.1742602037520;
        Fri, 21 Mar 2025 17:07:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811daa38sm23847405ad.195.2025.03.21.17.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 17:07:17 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:07:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 2/3] hwmon: emc2305: Add OF support
Message-ID: <b1dcabc3-0bc8-402d-9b28-8bb561d489d2@roeck-us.net>
References: <20250321143308.4008623-1-florin.leotescu@oss.nxp.com>
 <20250321143308.4008623-3-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321143308.4008623-3-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_170718_556872_C97B079B 
X-CRM114-Status: UNSURE (   7.99  )
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

On Fri, Mar 21, 2025 at 04:33:07PM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Introduce OF support for Microchip emc2305 pwm fan controller.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied.

Thanks,
Guenter

