Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57B3D690F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKy9NFeqlqcw1t7BKiitB8spU33tefaJ6SaLKo921pw=; b=2I3voMbr3QJ3bAYE0RZGwVUeNI
	PfbNBu3bAf5Df6JrO28/GB2JqfiTAr7gneGOGuJz8FRHf5n885TNz1KbKfATxch8UULFT5ogfLgeL
	U9+iLsfVKlSVDOMPcxYpVLuFZRQMLkFIO7lYbS5yTkkmD5Ofi+8Ph1B8xp9OFvONCtxPAcKr9CNfS
	VeNAKjmYIifSk6uqWzuSgZU9FE/pcza+cM3iDmtOYJEglEX1mKRfHdGuryY/S0G5KPBzfHmUjCeTp
	QmswhtZY1y8gNyHnJremQYaemitYE1s2910pYng9gIkyeDCONDiHi4kFd5Pdbpf3gT/byFVTHkW3I
	8sCHbVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGblw-0000000FFuJ-1pPW;
	Thu, 28 Nov 2024 10:29:20 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbkx-0000000FFns-1VLR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 10:28:21 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4addd900de1so220863137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 02:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732789698; x=1733394498; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CKy9NFeqlqcw1t7BKiitB8spU33tefaJ6SaLKo921pw=;
        b=FguWHFW8Jm7yyD3jjjZJUJrOQuaeFtgX7ZZInZZ2AuxtgJmo++n9WvzyWWiksE7/fN
         70zHN2mcdprIsDCGAUk4lffo5gfyDuFm85SXZ7lXDzYwAn0un+f3keaj/5UYfRp5xkcy
         cxRXZLxGiBPEooY3Vx2Zn27SNgr8Xt0wQwuSBuPkxV+8mi9ET3opPypwLp/oYNuuVl8w
         JODjL2nDNoak3mUsVIHMmjo7qLD4NH54m/xs3ah6DsCYihwh3PQPtTrugg+0jjXj9Fhb
         vpYS7geNbqlDVX7YfxTsh/M2vBW3D0WQbuoSo2aK4woehPRUH4Yf9cyG97Iuq4DaKsb6
         +m1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732789698; x=1733394498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKy9NFeqlqcw1t7BKiitB8spU33tefaJ6SaLKo921pw=;
        b=GOO+X8zSmMOshl3WD9TWeeNnzN5gN73FJs9JAsZjKmEDN0bSLto8i0NRQ9nSIcrLyc
         OpxwsMZp382rQ2/Fc0AnHDYpgiYvisbjlCgbaA+w/vsi3s4bvh30gT16PgqiWfHWXbQG
         4GxNG0DhqRux4V44XNhQC++T1RBdrSgIq1QoGBfQ9a8hWlrS/Z1DZyKXSDDqpG28k5/5
         bRv9vg0tARj5SPeq9DX1gRgza3ZF/EF6IjImKO7TMUDqNGLXrAn9fOALQ4jTuQ9BRHQK
         5F6pIMHCmm7Y4PrN8f8dYw8NW9Y00UI04WBJvYngs4npnjCPb3xHRaG5JxUQ9AozhMOr
         y8iA==
X-Forwarded-Encrypted: i=1; AJvYcCVYxU+KBVNepz5oMWADOElAvg+RFHQ3h6HonNUzhHzLsaeb1SnoroFTzi8bn/KYV+d/awFxqWqvh775RnYwRWyk@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi/enTYPpB+DNG9Hw85QlKvtZLnYiOz5VmnxorxTL0kc5kxl+l
	DFs76hfXdsSWzihvRV+DuK/IRUYWKtrXKsfWrjBaeo44EEb5ngAU1gcoRiEWisyPlXGUWAzBzGH
	sSO++8BxAj/Ihk0IjQTfExCjm0CTN/JIvaYlW/Q==
X-Gm-Gg: ASbGncugrn2x2Iv36XpjvX6Z+6wVD/P9wJlVJ5Sg72GF1jEwJd9WLaURyP7OQ1XfKc/
	Nvo8is2x2GPmRG0fx1chkk86z6B2P6ktSOA==
X-Google-Smtp-Source: AGHT+IHNjCHSookykhJ0jiELmB8RMX1pmwKtceJGivKe5r9uvyYhkK2Li/fKdNaKGIC1FiwJ9jTRq09+7ToPFKBO6rs=
X-Received: by 2002:a05:6102:82cc:b0:4af:497f:aaa4 with SMTP id
 ada2fe7eead31-4af497fac19mr5014052137.4.1732789697607; Thu, 28 Nov 2024
 02:28:17 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYs+2mBz1y2dAzxkj9-oiBJ2Acm1Sf1h2YQ3VmBqj_VX2g@mail.gmail.com>
 <CA+G9fYvh8n=CTCmcCdLViH=o-UXH1Euncn+7YuYkvt5O-k8NMg@mail.gmail.com> <20241125154235.GC2067874@thelio-3990X>
In-Reply-To: <20241125154235.GC2067874@thelio-3990X>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 28 Nov 2024 15:58:06 +0530
Message-ID: <CA+G9fYshK6+AuXSnu7c=j+QJ38kN6O6t7B=DdzqQrMN_rGsJhA@mail.gmail.com>
Subject: Re: pc : qnoc_probe (drivers/interconnect/qcom/icc-rpmh.c:269) :
 Dragonboard 410c - arm64 - boot failed
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Georgi Djakov <djakov@kernel.org>, konradybcio@kernel.org, quic_okukatla@quicinc.com, 
	quic_rlaggysh@quicinc.com, quic_jjohnson@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_022820_205428_BC75ABAD 
X-CRM114-Status: GOOD (  12.70  )
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

On Mon, 25 Nov 2024 at 21:12, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Nov 25, 2024 at 08:43:44PM +0530, Naresh Kamboju wrote:
> > [Small correction]
> >
> > On Mon, 25 Nov 2024 at 20:33, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > The arm64 Dragonboard 410c has failed with the Linux next, mainline
> > > and the Linux stable. Please find boot log and build links.
> >
> > This boot regression is noticed only on Dragonboard 845c.
> > Linux next-20241125 tag.
> >
> > Good: next-20241122
> > Bad: next-20241125
>
> Can you bisect to see what change introduced this?

The bisection did not provide any good results.

I have been tracking these boot failures on db410c and then the boot
test got passed on next-20241126, next-20241127 and next-20241128.

Boot test history:
-----------------
-  https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241125/testrun/26040307/suite/boot/test/korg-clang-19-lkftconfig-hardening/history/

- Naresh

