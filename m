Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807F6C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSAeQ8xKPoGHZfbgMhDEnJIjE+pmVuNSBbErMj5IbBU=; b=cZEC99vuhAK5tFtV+DoOxp/zNf
	A5LAIztNLfcyIcH8RcSjd7LoNEWSymLFnQQ/V2c4a8/jR4kJMiEDgCiLyEsRzKdbR0UedgQy9kpky
	VU7dbmqOE/DrpuMMcgsBsGnJ2k2RIHsYYrhojNapSOCi1TiIdfXrYvElaZhvSJ0H2GdJ5ma+y8KoG
	5SerE2OmkDc3asbtc1BT+bDNp8bYN4EvdIJEZCirWNnEFtYskea6X2bZ5EN9LhIMDpNmynLbRW6yb
	36amdHxDfBsZAQ9LDNXotPlA0zwJLd0CAgxPdSpA4P+DHk1XZ4C53yLKZolMj+YFiPM8jXMKFJYaJ
	fEztPBKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgoV-0000000Fjbt-0T1c;
	Wed, 06 Aug 2025 16:16:27 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgSQ-0000000Fg7D-3CTA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:53:40 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61592ff5ebbso36594a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 08:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754495617; x=1755100417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSAeQ8xKPoGHZfbgMhDEnJIjE+pmVuNSBbErMj5IbBU=;
        b=IcheL6etxzbT//7iwNSXkzkk96SEmT8kvm1qnW9aSY1iHvS8YyTnxwMDuBl2dTnj9E
         AX+2MkpLKwPYdLKT7Eh9xJzBybMQy5xPdcwCDeDT1nl1XmdEM7iJOhif1Q8p3y2D9fWS
         QzZbIlvce/JwtqRFoaz1bXqjPBrfHxYNUyi+HO4GFn+qu4U4OEBobUexkjtzdOp2YaYU
         BC3Rgx6OrppQH/jdFMja7afpTNsC3p8lRNLrKOtKePUT5oNpT+8D4EC679PaUKupxcZE
         Mf867iBAkmqi3Xw3V3ieFYnOeErrUEP5mjAAVkkPn+TJ1T/wcx6l0Sea1rxj8e+7Zsuo
         N2nw==
X-Forwarded-Encrypted: i=1; AJvYcCWOMu4BAl99vIDWZRNdZA0K0zVWz7VTxnptoSwe92aPpucsu2lx//qplPNeaN6Wq6cXu2qp9/TwKZOMtcaRpe/E@lists.infradead.org
X-Gm-Message-State: AOJu0YwYKptV7ENAV+IF1hhlRCPLwsvaV0vubrEO4PyIQf2caVqz2SgE
	DJ2jcdd+voj348oDX2uxuXKIAoG9X4dSziq1876B+y4vLicSkFuUFL9c
X-Gm-Gg: ASbGnctWZT32ii3BpJnBADonq/bwALP3es4qr/JzFhh3gfGXsWylsKWEUHlCFq/YUsV
	al4RsqXgZIcUeEP66hYCYLaJMbKKpnERR3MRcQ84HCQpQnFh3w0iUHWUWgbj3vfBDTD+f7LSqgu
	fLx2ylforR6dcSk4Qn7DJBaMU02kTRUV6VUJ9Ne5LeGleSvMsun+WHeb7E44KG++ko91nK7ZeRM
	dbj4aKm3VpQJWhMABrTI/Jjur1CtCyDJaF04Jo9lXJqALMvtEvWWdKQSEXnY2rVSKMx4bop1Vq1
	UlgS9OsyuZqsjv1ZNWdC5H7CNLpe9GrNiRV4CKfImm5Au2m494n2UdsBqvTt42cewtjr4Ol9xpd
	BzXfF5q0SOgIK
X-Google-Smtp-Source: AGHT+IHuBBGXbLT6LQjSZys1BSvev5Nwmr6rX2z0GgBOu+Uy6QESOe3NVaVXCJ6mKYT5g9BD1FbwFA==
X-Received: by 2002:a05:6402:1d49:b0:615:78c6:7aed with SMTP id 4fb4d7f45d1cf-617961be368mr2723204a12.32.1754495616673;
        Wed, 06 Aug 2025 08:53:36 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:6::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8ffd72esm10214364a12.55.2025.08.06.08.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 08:53:36 -0700 (PDT)
Date: Wed, 6 Aug 2025 08:53:33 -0700
From: Breno Leitao <leitao@debian.org>
To: Nirmoy Das <nirmoyd@nvidia.com>
Cc: catalin.marinas@arm.com, cov@codeaurora.org, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	mark.rutland@arm.com, paulmck@kernel.org, rmikey@meta.com, rmk+kernel@armlinux.org.uk, 
	usamaarif642@gmail.com
Subject: Re: arm64: csdlock at early boot due to slow serial (?)
Message-ID: <d6frpsfybjhdu6m77icrduuiqu6p7zfx3sbzfz62dvafkpaj56@sa5y7lvbvivu>
References: <aGVn/SnOvwWewkOW@gmail.com>
 <20250806114441.1605047-1-nirmoyd@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806114441.1605047-1-nirmoyd@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_085338_799092_B0CBB8C9 
X-CRM114-Status: GOOD (  12.90  )
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

Hello Nirmoy,

On Wed, Aug 06, 2025 at 04:44:41AM -0700, Nirmoy Das wrote:
> Hi Breno,
> 
> I tried the latest kernel which seems to contain a fix. Bisecting it led me to https://patch.msgid.link/20250604142045.253301-1-pmladek@suse.com and that indeed fixes it for me.
> Could you please give it a try.

That is awesome. I've played a little bit with it, and I see it solving
my problem as well.

The machine is booting very fast now, taking 0.8 seconds to hit init.

	[    0.811320] Run /init as init process

Thanks for the heads-up!
--breno

