Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C02C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 15:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJoPaucZIFnXnjQ/FLCpU0B/Hs2NKUJWGsU9FtU7bzo=; b=LgDWDhP/szBWxH186et2lWnpMS
	l92FDnoYL7WHeu8oZv8m+o6DBcnsjL+6b0cDROsOufyEjkLge8QhzjLKsaAX8hmgEultv3zED8qTY
	U8YaNkUeUU9iFJNR6gx+m+A/LZVvaBbyBhxURVfMj1DPgnnRvJqGdaDtttkq8udQjRGQDmMHjCyaF
	0s5E77LeYiaUEcVk4ollwhWNYdXExX3ZmuXlLQp8d2VfNsmDMWcNTSFMAhuKyS2302SWONK4iay+X
	tzdsGZ4Kmt76JJcGpH7L43MTtzXzvvugdhslMmq6e8ePclWL5WZldgM/il06B2dAmZuL/xDrabmIr
	aqoWQBbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9UH-0000000DIua-0PTF;
	Wed, 30 Apr 2025 15:36:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9Rq-0000000DITm-0UMz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 15:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746027247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJoPaucZIFnXnjQ/FLCpU0B/Hs2NKUJWGsU9FtU7bzo=;
	b=UKVoaF73yRRQBdFZiMTm0af9JK8wQUzB0aw0q2g0uq6On+p6mvRhUc689tQOZ5eGBcswKK
	6Ig0V+TKx/IzXAWUj0hY2RacULIFenOW7f9N/jzXkGI2Z7A0+SCwaba5vrLiMTSh8A13cD
	ldia9lDe9sGNGnt5no7HMgDkaPMU38k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-DsrLZapIP_ShTJVboPTrcQ-1; Wed, 30 Apr 2025 11:34:06 -0400
X-MC-Unique: DsrLZapIP_ShTJVboPTrcQ-1
X-Mimecast-MFC-AGG-ID: DsrLZapIP_ShTJVboPTrcQ_1746027245
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so36064875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 08:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027245; x=1746632045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJoPaucZIFnXnjQ/FLCpU0B/Hs2NKUJWGsU9FtU7bzo=;
        b=Bqcd14rG3ifslPNVVGp0OcmTTxh/PVMJf9h1ZhIiz9kgRR+tc0WA+J/EoGey04JIAF
         aVj7TjrcsklU63Z7egx4EF6srQ5bMSGSLOa35zQJRT8HeoMQQEfHrtC8peFtfMVQHBkT
         9SERp2Wl7aZctmK0j/0SIN8itCdcaikgLfaIowD633tyjUxdIhmU9ITX2xkTNxcLf4o8
         fmhqBrgK93iAf4zzaIqyDX1dmvyysU5Wl5UwdrABJd9gyolm1K9qOLSdrGbDfsGd0yyz
         6V9xFb3fZYh7llc7+8XAk+lPSsaVj0cMiKxa44fQ342mNocuScj8y/J/CW9oMSap20Bw
         X6oQ==
X-Forwarded-Encrypted: i=1; AJvYcCV52my64UyVVh1aV4OjnVb3fQx5F4nX4/YPNDIZnG4JyO+Fg20bkBUNzfPus+iwSVxZMx8u+b3I1b2trAwCV3H4@lists.infradead.org
X-Gm-Message-State: AOJu0YzU9vsbVSQ62YWbvYZQjh17XQf85yqRNzrV+0TtqY6Qr/MLPZ6P
	yrQX1sPURNBQ9x7exqC0ZbpNWGd6YozGjfLLt+Etqj1TMC+ctyXR4busRaylxBk47uUVcn3WVAD
	B5Y9QUmkHzrU8sWuf63Kw8sDT88CJpy2eyb0Zm3rLZ6wxdZxGPPCR7USQ1nXUOXk8qPYutaY9CG
	P03ea+AN2A0fxYEwitzjydZ0ZXDXI+KxAiUceOZPP8bHNRQlg=
X-Gm-Gg: ASbGncuDMKV7vadVjWrqTYSQW72d7PILIwfutiLlHqeyHNeKDS0FjqofUmifPTb+voZ
	5Sgrd+SStcy3up0ZMPODpWpZQhuYsbbLBy4w+Kl+5hNC9K6yKrGnuT4dKnsApSlxu0e4=
X-Received: by 2002:a05:6000:2401:b0:391:412b:e23f with SMTP id ffacd0b85a97d-3a08f765388mr3341419f8f.15.1746027244914;
        Wed, 30 Apr 2025 08:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHov0v5K/n6/DRccdHjKs5WmhgmpFrJkqxQNq/Ywqeh0XLYmlSqiXndUXHVAiZ/ZlcAJ4dhe3vZdGR3coN91jM=
X-Received: by 2002:a05:6000:2401:b0:391:412b:e23f with SMTP id
 ffacd0b85a97d-3a08f765388mr3341385f8f.15.1746027244490; Wed, 30 Apr 2025
 08:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
In-Reply-To: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
From: Jan Stancek <jstancek@redhat.com>
Date: Wed, 30 Apr 2025 17:33:47 +0200
X-Gm-Features: ATxdqUH8YC4jX0Iz8XoZNaSKHHlD0K50_lPFdPbF6ryiUzBGB2fjQyjacawuu7k
Message-ID: <CAASaF6w4Y5oH+eWE_ap95H_zpewbjs05xY77oCfZd91qy8d5cg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] vdso: Work around and reject absolute relocations
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nam Cao <namcao@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G_gBw12MovwwIQCjWy_Ri6smNtgKuHRLpj6dJx6hWAY_1746027245
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_083410_250938_8950897A 
X-CRM114-Status: GOOD (  14.38  )
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

On Wed, Apr 30, 2025 at 11:23=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> GCC on arm64 would incorrectly emit absolute relocations in vDSO code.
> Work around those and break the build if new ones appear.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Link to openend (invalid) GCC bug containing more explanations
> - Refine commit messages
> - Don't fail on commit absolute relocations in debug info
> - Link to v1: https://lore.kernel.org/r/20250429-vdso-absolute-reloc-v1-0=
-987a0afd10b5@linutronix.de

Tested-by: Jan Stancek <jstancek@redhat.com>

v2 works for me with both reproducers. LTP syscalls run passed as well.

I did a scratch builds of latest Fedora rawhide and ELN with this
series, both passed on all arches:
https://koji.fedoraproject.org/koji/taskinfo?taskID=3D132140190
https://koji.fedoraproject.org/koji/taskinfo?taskID=3D132137468


>
> ---
> Thomas Wei=C3=9Fschuh (2):
>       arm64: vdso: Work around invalid absolute relocations from GCC
>       vdso: Reject absolute relocations during build
>
>  arch/arm64/include/asm/vdso/gettimeofday.h | 13 +++++++++++++
>  lib/vdso/Makefile.include                  |  6 ++++++
>  2 files changed, 19 insertions(+)
> ---
> base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
> change-id: 20250428-vdso-absolute-reloc-a226293c1761
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>


