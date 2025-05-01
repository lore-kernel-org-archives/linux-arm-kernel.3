Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D35C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 14:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dxA/ueHw2n/Jy8hlJL67l7y9wvJhvydWWKyuEo021U=; b=kk+pZGGbCU78IHeamBo2jh+CV0
	BaSHOCryGZbCIBP2xq7bnTiD05r80ceSaChQxa7o1I9RnTyvLNfx+63M76Ktmkqvffp2yLAH41Ncx
	dzwG6HIhm5JYuPUBad0ZCAYZzAh6cTO6tbEmq/XSTlbriHayFO9gLpA2DzImDB63yHWfODsVEf8ON
	eEnK3VhPquolCrN7AFekKHqyJVPBWkJrXNV2I5Dt6b5w3uA7uZTIEkDFOJvXv76neWRit06saRsoV
	/dlnfX0oLC4gfl+pgW5k11AhGdsLj+Ca8fG34IeWH5gEB7ANdXN61g6LWJnt9Zkw9N3w3o2iz/WC/
	8N6JbfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUgz-0000000FvlR-2Omd;
	Thu, 01 May 2025 14:15:13 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUf5-0000000FvSh-3JHm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 14:13:16 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-309fac646adso1999373a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 07:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746108793; x=1746713593; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dxA/ueHw2n/Jy8hlJL67l7y9wvJhvydWWKyuEo021U=;
        b=JvFHGpWD+3cFw1LRHQdZhuJj/2T8b1NNfGkkmlHd2RzZc8yIyuip+w7rGJBsO4Hbwa
         gJ3oK5GMie/6QOlZ19QK+O1sipdxWdIuAVoZQtofQXy52VanC0tXz+2bk7rWF6KLVA9H
         YPKkzzHZVw1pehsSy6PYc28TF+NpMzGQjZCls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746108793; x=1746713593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dxA/ueHw2n/Jy8hlJL67l7y9wvJhvydWWKyuEo021U=;
        b=QV1i4rXy9BVPBCggt9beDDQKdUlyTZO4IPL+97Eh6jS3EI10YiyFBSvYfApmRTuAs5
         BQqT+Xr3rgv9qM0MagUucDUF3IoMnSJAHNGSic6VKwEaVz+X6s5FBOs7eAMyAmvbNG2s
         qiVZS5zFyW5kAkm+JUM5XGr0Ta040OpIktlRPEeLQlB47vlFof31BcGfkoN3JHX2Q65N
         YV4FkrjZH538/QhtPKqDS8me7ADAZiVPVS0EtJgkDq1uuYO5dQTMHzJN96HWkkeEQm2m
         yZ7LC6/Mplco7qYSZsQderP45ktADCCguE3kjFD0jsKLvMUZ5gZmd6gTIJ78QKDEaOdF
         M5lA==
X-Gm-Message-State: AOJu0YxqzBs583spLgvizPYhD5kCfEJ/nCTFGhpN4ZSwpCBymieW9+Le
	jV0+QPnnJY77XumU2oH58XTw4k8T2Lw6nYSdFkClpoJ5D9B4iAkcNrt1Yw8mimeCS+79CdjToWA
	=
X-Gm-Gg: ASbGnctz03SHqw+2Ub4yTU6uRbanVY2ISz0ZBzplGxCk0/24hSXh+QjvNZKxGGxRwou
	Dg7XvJTEeUeDWi+nSx9YrZUOSsM/L4+0o/fz+iz6lBG34qPjbcE3keLI0Ib4Ok9HhfQv75Y8OYc
	L5V+q0jmzMjRj+7AViTDFFtKva7uanxrjg5s2HTWL5OJ3pmijQuuJwn77dCMCwY9htUeIjHqfQZ
	tsgdOIBvyyWXcOPJ9bA+b3Wnsh5lXbFJ2qGu2qbonoVxAgAk6897SLf+ymEApbv2ulP82rQjOq5
	yKLSpmxC5AvKXpyPhIT98XJll3YsRNXXQC8dqT7xt3St5e2dxYXHCGKBZXC1gTNMpfiQkUuxTZm
	0y9MZQSpa
X-Google-Smtp-Source: AGHT+IHtMOUwf5uuzWXV3r7ftxpEZXtaIEe3G1TU+Yv15SAnlV3CpklJQZrWBvyRbVWyTjZnfKwN6Q==
X-Received: by 2002:a17:90b:2e44:b0:2fa:1c09:3cee with SMTP id 98e67ed59e1d1-30a42e9a5a3mr3743973a91.9.1746108792934;
        Thu, 01 May 2025 07:13:12 -0700 (PDT)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com. [209.85.215.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4764226csm965135a91.43.2025.05.01.07.13.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:13:11 -0700 (PDT)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b1f7f239b31so1704580a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 07:13:11 -0700 (PDT)
X-Received: by 2002:a17:90b:5787:b0:2fa:6793:e860 with SMTP id
 98e67ed59e1d1-30a42a61722mr4348612a91.0.1746108791093; Thu, 01 May 2025
 07:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250501104747.28431-1-will@kernel.org>
In-Reply-To: <20250501104747.28431-1-will@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 May 2025 07:12:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UFfKiP359ub-qJQmLFxub_d+XyPvY+bMDPtOhvY16stQ@mail.gmail.com>
X-Gm-Features: ATxdqUGPKyL0la7ATCzNmkyD2QpZruTZA-YIbkvmWxNqdKwgC_HABqFBaGH5BUQ
Message-ID: <CAD=FV=UFfKiP359ub-qJQmLFxub_d+XyPvY+bMDPtOhvY16stQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Lee Jones <lee@kernel.org>, 
	James Morse <james.morse@arm.com>, 
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_071315_851513_25E51877 
X-CRM114-Status: GOOD (  17.22  )
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

On Thu, May 1, 2025 at 3:48=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> Commit a5951389e58d ("arm64: errata: Add newer ARM cores to the
> spectre_bhb_loop_affected() lists") added some additional CPUs to the
> Spectre-BHB workaround, including some new arrays for designs that
> require new 'k' values for the workaround to be effective.
>
> Unfortunately, the new arrays omitted the sentinel entry and so
> is_midr_in_range_list() will walk off the end when it doesn't find a
> match. With UBSAN enabled, this leads to a crash during boot when
> is_midr_in_range_list() is inlined (which was more common prior to
> c8c2647e69be ("arm64: Make  _midr_in_range_list() an exported
> function")):
>
>  |  Internal error: aarch64 BRK: 00000000f2000001 [#1] PREEMPT SMP
>  |  pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>  |  pc : spectre_bhb_loop_affected+0x28/0x30
>  |  lr : is_spectre_bhb_affected+0x170/0x190
>  | [...]
>  |  Call trace:
>  |   spectre_bhb_loop_affected+0x28/0x30
>  |   update_cpu_capabilities+0xc0/0x184
>  |   init_cpu_features+0x188/0x1a4
>  |   cpuinfo_store_boot_cpu+0x4c/0x60
>  |   smp_prepare_boot_cpu+0x38/0x54
>  |   start_kernel+0x8c/0x478
>  |   __primary_switched+0xc8/0xd4
>  |  Code: 6b09011f 54000061 52801080 d65f03c0 (d4200020)
>  |  ---[ end trace 0000000000000000 ]---
>  |  Kernel panic - not syncing: aarch64 BRK: Fatal exception
>
> Add the missing sentinel entries.
>
> Cc: Lee Jones <lee@kernel.org>
> Cc: James Morse <james.morse@arm.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Fixes: a5951389e58d ("arm64: errata: Add newer ARM cores to the spectre_b=
hb_loop_affected() lists")
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/proton-pack.c | 2 ++
>  1 file changed, 2 insertions(+)

Crud. Thanks for the fix.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug

