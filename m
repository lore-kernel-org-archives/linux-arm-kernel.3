Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE29CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 16:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsoEtYln4+6Ly5LWRix+6Kzr4MOEUJ1YKSS8CRff6kM=; b=oEZuamkKME4IjB1DxrDuLcwDGx
	bIRkwy6aEPJdz+WG08wFuyckEhLJHgYhpXlWFqwky62y/XSC421qGXach96DebHqWWVv4Bf20rUoC
	SEiQQ4IdBBfMiOTW0m3iTRN2To20GweMRjItbog5x7gxUhH5gpSOPpED+0+fDr1klZmDvxrB/pj3D
	ydy1MRr9Qu9gF7aBpZOVDyDlfIkAv7WLXaLdu3PHfE3CsfWeHizWq9DanD4S1e8JFhdlAFCyeO8yc
	a+IzQ3Y5AWmqk3P+3sghWT+zIfPuppTzOSpkG9AdY5qByrxz9ikBQi+7OQ5K+hj/ACA8tpad3fn3A
	Zf8cp31g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqa9B-00000008h7E-0jFR;
	Mon, 25 Aug 2025 16:34:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZMz-00000008YcO-0FLz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 15:44:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45a1b004954so35958765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756136667; x=1756741467; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VsoEtYln4+6Ly5LWRix+6Kzr4MOEUJ1YKSS8CRff6kM=;
        b=OlG3o/KC6VTO56B3y5y8S42eKUeo2l2GBBxho6DBuy+l3AbsvjlARTtCDc7i8NW8TR
         VmshD/FY03tDig+d78xydUUQTBkh8tcvmZEHKN5JcvE4Mgyabtl/T0umtXf2Mh5UzUna
         tFQa0wLIRfaPsYinGeFtdeh5Kmtgu65KNls+zAmZnZ62EIBTuFFed1LszLC+A/GRl0Gw
         zSZRt9VzKw3wvtK1MLfsw/SDYdCBr42ExjhDgKiwDAi0JGt7DXF2e7EtKCXJdDK+F/N5
         nWQAU3Bp9mn6vvEddgS4TnjJLDyDt+iWw0CPJFj6jAurdCDZvfYcTQuQ3DHz7lgd1mz1
         ciuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756136667; x=1756741467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsoEtYln4+6Ly5LWRix+6Kzr4MOEUJ1YKSS8CRff6kM=;
        b=YKrk6BFqZ4FASd/DQ3z6ES2dzjATs9eRCF1ZqwE7BSqJ74PYXMMwOAD9o8guy1WhY+
         94u4DJvhh0ZGfjBYrZXlpOxa6o2Px/2n/Rz5w2lhPoLTndVlwvWEw3urZ/kxGpzcH1ba
         79xleHF2dHefPUiZtJyakuYUDrX6VqY1u+YhxMs+J4kStcjpWbXnYOhmznAn3n1iybJ9
         WJ1kKVkH8yPnEZpjjNw2nNZrpoZUcmrnxy/BAUgCXmU1VH/E7/wzOKf50u/I9b5P4CEY
         NtzlltKAGEGST/JyNZxv/1QBVAYlqw30SGk674XXvbZaeP9srtVOFD4LDg2EiiP2MkTD
         XXxw==
X-Forwarded-Encrypted: i=1; AJvYcCVQOQERk2HYVD+WSGeivJZit0PLvxtPf3wZnGFCToWwETMFlXmLmfBJoSXDs5WpSNte4sHp1QMzCdofvpr/Cp0y@lists.infradead.org
X-Gm-Message-State: AOJu0YzfYzzDugsjAdmIb6aeBp6kOLwHculuIvvc9VksKGb5wwXhOiXV
	8W2YTKIzVF/z4rLAFV4qiDDF4OmpHc8KrGFhSMUegiupw9bDUhMlAU6M
X-Gm-Gg: ASbGncsq7GlytxI3de1eZI0u9bFRgThmzVcDFIOK2GE+WM7j99kJDVG7hjEXj9+7KH6
	l6WtsaNS2sCqgsboU26tR0Vb0d3WDOVgpqw/QOxDiVMfPG+wODxQyux47l0CCceEjiIYioQzWrP
	7/L6HDXM2XdxzAZ58e+O/4t6yrn88CFDfo3vRba8aipOu5gd/NgDmmhmAYE3rJle98RZHjNZ5+k
	UwmqTJwlhtHcvEUu07avcQSVSb+PmfJcT9rsc8+f6tjxM3Vp9XsGLccG0+oom8dbeE09m04aQZK
	aN9Bz1d4Jk/FpOwoP9IqnaQdf0PtYvnhHCZ9vaUp7GjkcfWxW82pCY1Rwo31pGMKI5NO+5cNIE5
	C965nMdYFX/QNa17IPA19xdAHC7HA9QP3znd5RJZdlJXXMXJaWs9XoLqY/mMh/pWI3Kh3VA+PkT
	w=
X-Google-Smtp-Source: AGHT+IFSi8NXd9p8dDHHrT8TXcVru6c0IjGWMlP8jM1KABVnPN67yWWMt5ZuiIUYpqnay3gjKhFKeA==
X-Received: by 2002:a05:600c:1c87:b0:45b:4282:7b61 with SMTP id 5b1f17b1804b1-45b517dae7emr101078695e9.35.1756136667074;
        Mon, 25 Aug 2025 08:44:27 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211cc8sm12028458f8f.36.2025.08.25.08.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 08:44:26 -0700 (PDT)
Date: Mon, 25 Aug 2025 18:44:23 +0300
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, 
	linux-kselftest@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Eric Biggers <ebiggers@google.com>, Mark Brown <broonie@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Shuah Khan <shuah@kernel.org>, 
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] selftests/arm64: Fix typos in malloc return value check
Message-ID: <u4bv3ypqrdaz5klrvs57ptp7tu25etf7xzvoytrgnz2xohiysj@vua5mcbpznio>
References: <20250824131647.490439-1-zlatistiv@gmail.com>
 <ed07c6f9-e389-4387-8585-6f1206da1a07@web.de>
 <aKxf1X1u8QHAdvqW@archie.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKxf1X1u8QHAdvqW@archie.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_084429_104454_D2E3583B 
X-CRM114-Status: GOOD (  15.11  )
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

On Mon, Aug 25, 2025 at 08:06:29PM +0700, Bagas Sanjaya wrote:
> On Sun, Aug 24, 2025 at 03:40:44PM +0200, Markus Elfring wrote:
> > > Fix double "-ed" in malloc return value check
> > 
> > Refine wordings in error message string literals?
> > 
> 
> I think what the patch author (Nikola) intends is "The error messages' wording
> use parallel structure device, where the second verb should've been in
> infinitives form. Correct it."
> 
> Thanks.
> 
> -- 
> An old man doll... just what I always wanted! - Clara

Thanks, I did not expect to get schooled like this (in a good way of
course). Should I send v2?

