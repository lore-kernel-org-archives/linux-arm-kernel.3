Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B65C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 23:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJNzFE7VvnlPZNhCFn8ImmUxFTpbrysBKDM1JZHDXZM=; b=RgkZ1+Q7j2Xou7VAH1oTljZArn
	kV7CodwVHAZ1kWUVUTZBNQESPC4036GdJAcBUsa+RDuhEogX0lA/rwhg9lP6foZzzATQAZpKGE5MG
	2fvlfCsPcWAMyLYkVvqRymhIYy64OQD3e92CKJFAo6gyrWUAJL2jCvhIpk76Mrfc9TGboyax768+Y
	9MSuywK0xSxnOVF06lkJRmpKZ7XPRYprGnYkV0A6s2NDSFTglv2DFsEkfm1vl9X2k9XTNWy6OX0p1
	yENC51JVGX2rZdiMoXnj1SID6seo8JG2uIiRoND1qHhafwuadSvwJbODz0TtLI6HpQtLwdL9/I9B/
	M/f6fjSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8aF-00000008PXG-492g;
	Tue, 10 Jun 2025 23:40:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8XB-00000008PH8-2kem
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 23:37:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-441ab63a415so62905845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 16:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749598656; x=1750203456; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJNzFE7VvnlPZNhCFn8ImmUxFTpbrysBKDM1JZHDXZM=;
        b=cUXAHMwqwUjoJkFe+CRV2Ee7m40lGP7qFRiXgwVar3xf2dOAwOIYCgM7YI02RI2H4o
         G5kuVyJZmxw1673dklV1CVZsp3OHfQ0lgfqdX0WQ52sNBxQ0JkREIjITIMq+YL0L7GZM
         Gjs1xotlzLa+UusWf2rxuKiETCqhEIUkbCV0rnocV4GtBEBoX3PkAkyw63fOnlkIQzHs
         SHGSavClySpF9JYS3Io/MM1qONzdka4+Zu9uAiZ/08coWPkSTEZ5ZTxYQHKIHXMYn0eb
         7kUzGK57oFGLyFISCpb/sII7hfOE5pfa1EID3GQpwDjrkZXswjPx5MfvElLE+0Js6KgL
         io6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749598656; x=1750203456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJNzFE7VvnlPZNhCFn8ImmUxFTpbrysBKDM1JZHDXZM=;
        b=EW83w/4c3HlYH6G6RYjG2uWbxHo+Mhztlc6sQDxRFgjWQLg+Z4Cocof1AbrE17m0UC
         Tfse9Nvz8weWt2v6BZI2aKnNQZ6cPyubBpGemvxehRSgAx+WVAoZB4965qeEmy3NniMx
         K+eJrwKCsGBW53C876O/xASNvSkcw4X6I3cTB8+5LT3dI5VDw8Lzd746mPdC3fbzy9XL
         VraYxpZFbdHr6YOpex+LrV9DpXKk574xjtRMPrNQNhod0El4RG1m1wqJa0T2SQIEnpgZ
         fJnJED+vEMQKX1huGVhibY5GV9h1JfTt4whuIun0sAzSV8uTj4w8TDoXZfuJvSq/tKoq
         zZCw==
X-Forwarded-Encrypted: i=1; AJvYcCWnrQdQyJR/O4sZrkfGHEnhO6Sm/TjXwsCH3Cz81OPqrsqh4umxFYdiVh9/3xEuyNJqdEfM8apGdK1LW1X5Ld4u@lists.infradead.org
X-Gm-Message-State: AOJu0YznbdNKBYBj9BiIDCNEBBEgLx/ccNwruC8GZuoyTj8PeFDwv9HO
	KobaUWGwwsG9uvbAq9Kmltv7aLKM5jTmmzPruvDGUVuBEjDaU68Hfz3j0vx3D1fNSLkOH9NQqz9
	vLnnlqQ9IR0HFqUPYor3qc9CbiQfmCyvECFcJ
X-Gm-Gg: ASbGncsue5VgXJwpMvHvzxDqN7bAvmWtPBqqxVOb0Kx3aa6WguJikBLVsARlsqkSwKM
	Qc0hZXZR4jRjBng1xGlxCi7CpI15UONOoe5HgQF0GvOU32fjhEnCOoui4KMZ6wHi4lt8FcjbW9i
	V3xc2p402R9/1oYlWbYiZ3sl8feXZRoMYe0+MkD4P9Lr2j5CNRVEBGEWR/bBrnoW7NGzhTKBjt
X-Google-Smtp-Source: AGHT+IElMJ3i2PmuTfa/qFjfOX4sNk3pxcRArmvT4ejCh5bYu9oIAifBXR0vhj40iwi8qO3TMDySg23ge7hNiffsMJA=
X-Received: by 2002:a05:600c:c04e:b0:44b:eb56:1d45 with SMTP id
 5b1f17b1804b1-453249a1500mr4594725e9.15.1749598655721; Tue, 10 Jun 2025
 16:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250610232418.GA3544567@ax162>
In-Reply-To: <20250610232418.GA3544567@ax162>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 10 Jun 2025 16:37:24 -0700
X-Gm-Features: AX0GCFtk53WMO2eoVm0bCjNtOL0Qa7RHkS0ZCpiTafT9vpr0jFRVwCZdt3LGp5U
Message-ID: <CAADnVQ+jNQyC=RcoiwDXeHj9y6CGzr322scz_8uGwCDVx-Od4Q@mail.gmail.com>
Subject: Re: bpf-restrict-fs fails to load without DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 on arm64
To: Nathan Chancellor <nathan@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_163737_695925_256BBAD9 
X-CRM114-Status: GOOD (  27.64  )
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

On Tue, Jun 10, 2025 at 4:24=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi all,
>
> I recently adjusted my kernel configuration for my arm64 systems that
> boot Fedora to enable debug information so that BTF could be generated
> so that systemd's bpf-restrict-fs program [1] can run, as it would show
>
>   systemd[1]: bpf-restrict-fs: Failed to load BPF object: No such process
>
> in the kernel log. After doing so though, I still get an error when the
> program is loaded:
>
>   systemd[1]: bpf-restrict-fs: Failed to link program; assuming BPF LSM i=
s not available.
>
> With Fedora's configuration from upstream, I see:
>
>   systemd[1]: bpf-restrict-fs: LSM BPF program attached
>
> I was able to figure out that enabling CONFIG_CFI_CLANG was the culprit
> for the change in behavior but it does not appear to be the root cause,
> as I can get the same error with GCC and the following diff (which
> happens with CFI_CLANG because of the CALL_OPS dependency):
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 55fc331af337..a55754e54cd8 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -210,8 +210,8 @@ config ARM64
>         select HAVE_DYNAMIC_FTRACE_WITH_ARGS \
>                 if (GCC_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS || \
>                     CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS)
> -       select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS \
> -               if DYNAMIC_FTRACE_WITH_ARGS && DYNAMIC_FTRACE_WITH_CALL_O=
PS
> +       #select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS \
> +       #       if DYNAMIC_FTRACE_WITH_ARGS && DYNAMIC_FTRACE_WITH_CALL_O=
PS
>         select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS \
>                 if (DYNAMIC_FTRACE_WITH_ARGS && !CFI_CLANG && \
>                     (CC_IS_CLANG || !CC_OPTIMIZE_FOR_SIZE))
>
> which results in the following diff between the good and bad
> configurations (and I already ruled out HID-BPF being involved here):
>
> diff --git a/good-config b/bad-config
> index 252f730..539e8fd 100644
> --- a/good-config
> +++ b/bad-config
> @@ -4882,7 +4882,6 @@ CONFIG_HID_NTRIG=3Dy
>  #
>  # HID-BPF support
>  #
> -CONFIG_HID_BPF=3Dy
>  # end of HID-BPF support
>
>  CONFIG_I2C_HID=3Dy
> @@ -7534,7 +7533,6 @@ CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
>  CONFIG_HAVE_FUNCTION_GRAPH_FREGS=3Dy
>  CONFIG_HAVE_FTRACE_GRAPH_FUNC=3Dy
>  CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> -CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
>  CONFIG_HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS=3Dy
>  CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=3Dy
>  CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> @@ -7558,7 +7556,6 @@ CONFIG_FUNCTION_GRAPH_RETVAL=3Dy
>  # CONFIG_FUNCTION_GRAPH_RETADDR is not set
>  CONFIG_FUNCTION_TRACE_ARGS=3Dy
>  CONFIG_DYNAMIC_FTRACE=3Dy
> -CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
>  CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS=3Dy
>  CONFIG_DYNAMIC_FTRACE_WITH_ARGS=3Dy
>  CONFIG_FPROBE=3Dy
>
> Is this expected behavior or is there some other issue here?

That's expected.
See how kernel/bpf/trampoline.c is using DYNAMIC_FTRACE_WITH_DIRECT_CALLS.

Theoretically we can make bpf trampoline work without it,
but why bother? Just enable this config.

