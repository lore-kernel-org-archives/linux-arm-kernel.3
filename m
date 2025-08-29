Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3000CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dis7nbiiCt2fP4GWwjgCXhTEHKxInIHXXX1XONaAGoM=; b=cuQFlUGW+4/hAyVDtUQ3PwSXl3
	XytNyGzLApwAUEeV6o1viDsqmIakCHJQZLk4myn5ZHwtLpKgehxQxIFkoe3FHUBAA/+++doiJzRMo
	/NEdkUZ3BOqExBd36XzTfnU1p+8/41bmtNsZonG1HVMZpWe8XNuv7glDRFo/bUjpQIQEnfPwMiYXP
	9f+t1IyDSCvM9Rx3qy5zg2KorAj5PGuSVrP7O6GpuFy2HOAd/03vNX9eNxTbtT/Rf1i0LHsjBpgx/
	tutGzaxHcnwFeBKTzNBIJmtnEW2maAL3Vp/sTGzzAy4NPPRFEB/soEG4tE+C34ZHC+X1VPp7y1aE/
	5hhh+w+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9oQ-00000007CRB-3PRK;
	Sat, 30 Aug 2025 00:51:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us6jc-00000006tXL-2Nap
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 21:34:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-24458272c00so27627005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 14:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756503251; x=1757108051; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dis7nbiiCt2fP4GWwjgCXhTEHKxInIHXXX1XONaAGoM=;
        b=DLPBiDKynrn3cgAraimLqo78VAWmAyA9rYT8puwoWO4DV1aHRDhQW0XgeoOPvMJS9S
         aWTCKXfs0TRtOYfQvWy6GVkfgFu99ggXf51WYPUqw44lpOWajvA43X2YH43TRP/nuThX
         dAfX7xNu6DivB/5Gz8OU8DRDHb56lIZYDSJ8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756503251; x=1757108051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dis7nbiiCt2fP4GWwjgCXhTEHKxInIHXXX1XONaAGoM=;
        b=AcWdacx70gfiW7vTpLAPKaRUvdQ1+OvOCIZkk1rTi29c1+aQii74fBGiKccSopgv+V
         z0I+NSAR7nqdZEIy0VmF5NKTmwZ2kWj0t5KN8jX+4fvKcOFztUCOjmaWgvJ2moNj2sU+
         Caz8Mo8AspiTy1wiDsppqCcrcUvAmzZr6sv3m8e8ml8JVOFlvOBvw8zXBiyhOhiW4+EH
         718MMyw8KOQyqAu6Tty8E40G0lJE5cCs8n+YDCXmcVP4OZH7Z52DJmQvO542c88v58fw
         cU55SY7zSJKVfgIBtXhCbIVoKMILgc6WoFCVdYkvSuDmficor3qFls5tgsH6AEQ0aF9M
         vBTg==
X-Forwarded-Encrypted: i=1; AJvYcCWnh0KaZCvY3yrTiGB2aXLP3WKDhWG4n+COFuFnVyboOFZC+W6xnYG15MTjTG23UhJ2WB1qea8XYJKrB6qX3IUC@lists.infradead.org
X-Gm-Message-State: AOJu0YyWT0BeIwnaup3rIM0DUeWV0b5SmPWZxCRw7PkSGjIOBbfeT0YB
	W8RJq7IxwBzai6RGjZSUcim56jxoDMzTppu7iqBqPfLpRiUOXhdPXT8k9cL4yQJ9afQssWQ9Hnm
	DNGc=
X-Gm-Gg: ASbGncsiM0KWocPJ1Xq5Z0R5abBLDDAG/0Q2CUrRtJyJHCiS4iUXnO+4t8BbYdXD5qc
	JTxpHU4zPr6xqlNsTbrEuwOzxNV+4H7hDru0+Jb3oQWkwj8PJChlUCOS0P2rjZjqGpxuDAYxIQK
	hSP9K4Uc1uAtL0d2D54Xnz2Dxa/+/dufUivQ/t0YiUniE+YBX2UhI5NZmYVSxOpLulERSjqMGRt
	fzUcGXWd0k/LK5vnvmuVVgxcYnyy2vzIPt3IcDz+vKaUPh5IMcAN/DXsVkqrLjRVAPO9kxiyfl7
	8LtSK3IMEPQ1YvB8xlnu2N/M4+c8zxSwC9XPg06Q7A518b0KY8AYemmfBl8uF1aCEW45rHAd2tA
	+XYfGHMX+xWn1uW7Y63t6NFa2Txj1dqaxxnfQTZU5Jhn3toOfQjyJzekPFCRtbzZrT0uDs24Z7G
	SHUAs8DXsmJtk=
X-Google-Smtp-Source: AGHT+IEvKkT345364rP0clUjhwizEv1WolHQvmJYiYF8WkEOklm83a9enI5VxOsLabblHE8TzZIN2w==
X-Received: by 2002:a17:903:1a2b:b0:245:f7a8:bc68 with SMTP id d9443c01a7336-24944b1f682mr903375ad.57.1756503251315;
        Fri, 29 Aug 2025 14:34:11 -0700 (PDT)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903724936sm34490635ad.40.2025.08.29.14.34.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 14:34:11 -0700 (PDT)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-249406d5878so1399195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 14:34:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuawmjHVDlxxxZKh9B/jFF7WoNtRhHPwdCnNye27Jzyvk5s/Oz3bD9UPyz/ogjypvZYaONeqIOlM6IjE9/h9zv@lists.infradead.org
X-Received: by 2002:a17:903:1a2b:b0:245:f7a8:bc68 with SMTP id
 d9443c01a7336-24944b1f682mr902835ad.57.1756503250127; Fri, 29 Aug 2025
 14:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com> <20250827100959.83023-2-cuiyunhui@bytedance.com>
In-Reply-To: <20250827100959.83023-2-cuiyunhui@bytedance.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 29 Aug 2025 14:33:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
X-Gm-Features: Ac12FXwa45bnt2Fo7fophuQQG1oKhw1sdW41Dqgu52LADz5-5chJEPC22bATC7M
Message-ID: <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
Subject: Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com, 
	masahiroy@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, mingo@kernel.org, 
	lihuafei1@huawei.com, akpm@linux-foundation.org, jpoimboe@kernel.org, 
	rppt@kernel.org, kees@kernel.org, thomas.weissschuh@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_143412_637157_C4ECE60E 
X-CRM114-Status: GOOD (  14.13  )
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

Hi,

On Wed, Aug 27, 2025 at 3:10=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance.com=
> wrote:
>
> Move watchdog_hld.c to kernel/, and rename arm_pmu_irq_is_nmi()
> to arch_pmu_irq_is_nmi() for cross-arch reusability.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/arm64/kernel/Makefile                   | 1 -
>  drivers/perf/arm_pmu.c                       | 2 +-
>  include/linux/nmi.h                          | 1 +
>  include/linux/perf/arm_pmu.h                 | 2 --
>  kernel/Makefile                              | 2 +-
>  {arch/arm64/kernel =3D> kernel}/watchdog_hld.c | 8 ++++++--
>  6 files changed, 9 insertions(+), 7 deletions(-)
>  rename {arch/arm64/kernel =3D> kernel}/watchdog_hld.c (97%)

I'm not a huge fan of the perf hardlockup detector and IMO we should
maybe just delete it. Thus spreading it to support a new architecture
isn't my favorite thing to do. Can't you use the buddy hardlockup
detector?

That being said, I did a quick look at your patch. I'm pretty sure you
can't just move the arm64 "watchdog_hld.c" to be generic. Won't
hw_nmi_get_sample_period() conflict with everyone else's (x86 and
powerpc)?

-Doug

