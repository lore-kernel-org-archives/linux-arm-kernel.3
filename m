Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C295ECD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 14:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPD0U5NZ4eXf//hJDc4itwhE90Vj8iebVbR8OA3Plrs=; b=j0AxGGY2PuczJtY4jgTHa0xGjo
	P7o2GCE6O7UaurJ1GwopUJH30c3omb8Stagw0/SkobKWpFm5PeS/Q9mgxQc8jUEwpAC/bbla/fz8W
	DovHtytcBOv56qMeyMH4QwjUJhzTXKcPKD5RvW70QH9OzbNNc0/3qzCFl7dOR6SXOQBAL9R2E7EVi
	vUJDRkhFZ6LvcGx0qAJ3IKKZ77NLUGlCwcSGNOnaqVStbviPDw/NLtT4UGh7plVBXVwcW2hbzpTX0
	Jeo8KYqNrHdiroNVKZF5Nm3eHwjlCBjXTfpgTv/szdutTgglQR01/wlwaLDyDR/iWQgsVdCtdwfUz
	TX7svS2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY32S-0000000B5PG-2Npe;
	Fri, 12 Jun 2026 14:39:16 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY32P-0000000B5Or-365m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 14:39:14 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2bf2911f93cso83875ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 07:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781275152; cv=none;
        d=google.com; s=arc-20240605;
        b=iP0pvtzB8/s2b2S+6HnvsPaahzyZVtzCG08ICJDe8bTZo1EiLnwXP2oU5I0DzvO4l+
         jPYW3dQfQD1H+O4RMMYJmu0noxuTis3qWOvFPok432Kp8c05yd9jvkRdCXZ3adFd0+tz
         zy1j4v9KVNf8CUMjI6XR5cD/Ss72FY9pBVjEZiJ8XLFKXTBcU/Xm3jtzkV0m9RmqVChn
         IvAqEIX3PWuGnISXjsY2Vc+pBb5LkYXq05J3KAZ8re3vkLnfutb2S82W4BwdZPQ31SLV
         /npHIYKe23nhFFb3yjyWMV1oiqzT12XB63WI25+q50y7qeULQyzpGTZsylxpJknRG5hV
         KS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pPD0U5NZ4eXf//hJDc4itwhE90Vj8iebVbR8OA3Plrs=;
        fh=SUdd0JdXpev6+Ea2y3hsagepbS1asalbLUsLO7byL64=;
        b=HdG+BAgsN2nk2U5o7BU4Z8vy2dwuffMYcnlclPDtYF+1G1qGzo2qYkkDOIUMruifi6
         G9NpWPUQrpoL9X/G3VfU+mmLjrrEF0nkghcb10Y8LbMVDU8Yven7Wu8n/eAvkvPytJD4
         RHN6T5HBhiinKsYtkp1SNOid0JQfXof8Cho8BJk3BO1tMIjVubw92VY+Vn5GzQeHbajR
         48/hv/uIlCUhHS3UaaDYu77Z7eTzF50tve08q8o2FEzAhiIwYsUPIbAUTr+Dl8Ykmw1l
         E6LznV1JfGAaoiIYZ687Y9A+XPZujuC+ErUb8s216VEEBHm84BNz70f0fiP1PiC6Jc25
         8ikg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781275152; x=1781879952; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPD0U5NZ4eXf//hJDc4itwhE90Vj8iebVbR8OA3Plrs=;
        b=dAXzBdUW9DY25zXGzoFc5B8F/dH1dy4I8On7G5O0CsEa9PKu2ztyvy6CbiXTLiWwn/
         OrZFgU0cI0CmM0Hw7pOXK2x0TzsgvTtH/6W3AdY6Y+n4+CvIr/WXMHXxBMrLD0htN1GF
         7rCIt/O6WUG7cvmBsMVcBQBUs5t+eCPXjLayFDCMiJ7eYd7tVGbnKttXLVg71yNwGUuN
         XsDoqv1WaeBaAmhNyZrP1rRtQp6bRyNFHYrOuvlZ9TKE92EoBfqFK/na/O9CHjQAk6Os
         KwYtt9+zJmbANKLoGdTx7HffIa8PJ6JpqsEi5B+APfJl08qURrskcfIGNlwuJ7R841hI
         tHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781275152; x=1781879952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pPD0U5NZ4eXf//hJDc4itwhE90Vj8iebVbR8OA3Plrs=;
        b=V2StoA1593dJm2dRTPRFXJVnC7e2lA6Q8hYxB5KYmYx8xTowGLQkpWAmEECzJa0h07
         1CvtYRNf4WzA1DUbQLOXg5apZN0XbDBM/qSnTQJUtTf/vMqwxVcQvTsXm/bVccX9B5RG
         p2iGnUOwbm1aXKEaH7jTs0ddxwmCy/96Sc4wUOkVOoX9Y7UKxx6yOyohYh3/xoh4d/yy
         j3NCb8E3OZyG76XRdQq3tq4rA+YMGYhlve3t96O6sMk/Fnjg4iB6dj8QfsNaVS2zwHsh
         VVUTJmKJ5iyYE2fIb10pmqYKMNec6UKlWWSmJZa6rP84CjrJ9NnjumwU8xEbVlNPpodT
         YvXA==
X-Forwarded-Encrypted: i=1; AFNElJ9jm5A/qGZs/rZvPZvevz7nj7BI/uTQfML2ENfGjwtbbPUeSYEluz46kToAzGJCoIzaH7BXbeWNzxsVNbhF2LzV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7/1R41UKyLVxewOh+Nq7LrcDo782dCfEfmP2HTsJ2/kdXCXmu
	80exHZ8BAFVlBIXV3ulRSTJk06B180oYa/LYqBcCiXd1OXSHPFhqb1LgyWwCIUYyQje5nlJTpL6
	NhttKpgYHCjD+Si5jM+faPLLSUx+AYaoOM8NGwUxk
X-Gm-Gg: Acq92OEw+N0iBaZ8g43HIxMsJQ/O26yHRFOugJhl/YtZQCP+QpRKy7YhaOhh3XWMJLw
	Mwbyp5pEzxNiWzSeWRqGDQtnScYhyfBWd6nFZnZTmv0KVkgMjF5YdZkvI76XQZpeKHILQ9KZv2P
	kB6Ihm5UFpVfQjjbqhiSZSy0PhoTEJ2gxQrQ6lnUHeFV/4LoPpf4wv4R4pyR/vqDIoA9NtcJGVn
	qx31/Zj47/TQvFYQzOB2VDR05WkKHPDDHSwLcgZOZeJ0I1UtUKA7ArhTuIpYQigHs9qKpp6XqFN
	SqnZFOZSF1B2V2XwPif9FsdFpVZ3yS5PCjxpbjs2
X-Received: by 2002:a17:903:238b:b0:2c1:4a67:5f31 with SMTP id
 d9443c01a7336-2c405c8b703mr1596605ad.9.1781275151261; Fri, 12 Jun 2026
 07:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260612133139.1919042-1-petr.pavlu@suse.com>
In-Reply-To: <20260612133139.1919042-1-petr.pavlu@suse.com>
From: Peter Collingbourne <pcc@google.com>
Date: Fri, 12 Jun 2026 07:38:58 -0700
X-Gm-Features: AVVi8Cc9-HjgSxhb69tvudsXLdOhYLKLMYT9ddnMNb-ycz4VaCGBguQJI8Ay6yk
Message-ID: <CAMn1gO79nDnUXuTR6LJ61kGJ8zH5gvV5st5-OjjqxD4cOxds0A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use --force-group-allocation when linking modules
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_073913_780727_148E9BD6 
X-CRM114-Status: GOOD (  22.48  )
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

On Fri, Jun 12, 2026 at 6:31=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> Specific code, such as outlined KASAN checks, may be placed in
> COMDAT-deduplicated sections. When linking modules as relocatable files,
> the linker by default preserves such groups, potentially leaving multiple
> copies in the resulting modules and unnecessary group metadata.
>
> Use --force-group-allocation to have the linker resolve the COMDAT groups
> and place their members as regular sections. The option is available from
> ld.bfd 2.29 and ld.lld 19.1.0.
>
> Remove the workaround in arch/arm64/include/asm/module.lds.h that was add=
ed
> for the same problem but limited to CONFIG_KASAN_SW_TAGS and .text.hot.
> Note that this code currently has no effect anyway because all .text.hot
> sections are placed in the .text output section by scripts/module.lds.S,
> since commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and
> related macros").
>
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>

Reviewed-by: Peter Collingbourne <pcc@google.com>

> ---
>  Makefile                            |  6 ++++++
>  arch/arm64/include/asm/module.lds.h | 13 -------------
>  2 files changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index e156e2696efe..1729af0690b3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1189,6 +1189,12 @@ KBUILD_RUSTFLAGS +=3D $(KRUSTFLAGS)
>  KBUILD_LDFLAGS_MODULE +=3D --build-id=3Dsha1
>  LDFLAGS_vmlinux +=3D --build-id=3Dsha1
>
> +# Specific code, such as outlined KASAN checks, may be placed in
> +# COMDAT-deduplicated sections. Use --force-group-allocation to resolve =
these
> +# groups when linking modules. The option is available from ld.bfd 2.29 =
and
> +# ld.lld 19.1.0.
> +KBUILD_LDFLAGS_MODULE +=3D $(call ld-option,--force-group-allocation)
> +
>  KBUILD_LDFLAGS +=3D -z noexecstack
>  ifeq ($(CONFIG_LD_IS_BFD),y)
>  KBUILD_LDFLAGS +=3D $(call ld-option,--no-warn-rwx-segments)
> diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm=
/module.lds.h
> index fb944b46846d..792a0820757a 100644
> --- a/arch/arm64/include/asm/module.lds.h
> +++ b/arch/arm64/include/asm/module.lds.h
> @@ -4,19 +4,6 @@ SECTIONS {
>         .text.ftrace_trampoline 0 : { BYTE(0) }
>         .init.text.ftrace_trampoline 0 : { BYTE(0) }
>
> -#ifdef CONFIG_KASAN_SW_TAGS
> -       /*
> -        * Outlined checks go into comdat-deduplicated sections named .te=
xt.hot.
> -        * Because they are in comdats they are not combined by the linke=
r and
> -        * we otherwise end up with multiple sections with the same .text=
.hot
> -        * name in the .ko file. The kernel module loader warns if it see=
s
> -        * multiple sections with the same name so we use this sections
> -        * directive to force them into a single section and silence the
> -        * warning.
> -        */
> -       .text.hot : { *(.text.hot) }
> -#endif
> -
>  #ifdef CONFIG_UNWIND_TABLES
>         /*
>          * Currently, we only use unwind info at module load time, so we =
can
>
> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> --
> 2.54.0
>

