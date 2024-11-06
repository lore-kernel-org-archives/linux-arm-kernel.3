Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEB8D59F75
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 22:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+ZvtJpgPQ1FG9AqgF7gSBqYNYSiUWWYwTG23bs23QA=; b=4Pj/72pJq5lbaiz6f91AjwQ76O
	YzzMQZfCPF1vglQqjhlGYzWXvQWBNYtsdCyJSo638XRY573Y5rQKfApMP9VV+t1f1KW1b2TBQM+aR
	k8XHzhWhxUlyRg7oJWiZyAH3hE5/sxB8Uutsw38KgvHXKv+AYxNAgA04PzS4K0sTFTF4sRzm3mYYD
	dBS+zhM3eDGjGWubrVYmYt3ra4VT025R8O0khh99EXPVNTnGWto/jjKZRHPS6QuxqSe1PAQOLoIR5
	skFKWRHQqJdNhjjh5YVXbP7SZxsdMhVLba81xMHvKBeJqbXMo6+nlGMdR642RIP4bBvVVtAJzXS5M
	Gr5n3jYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8oLa-00000004tpl-1f9m;
	Wed, 06 Nov 2024 22:17:54 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8oIP-00000004t8F-0rAU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 22:14:38 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5c947c00f26so2302a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 14:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730931275; x=1731536075; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+ZvtJpgPQ1FG9AqgF7gSBqYNYSiUWWYwTG23bs23QA=;
        b=fkj7wHAJ0ZrggOqQNCFEyx8gHB9zertSkDRfyPbZpg+zdWQP48Ktj6EPJjpw5HTosJ
         s9yIDExygfS6AOlicmUEqTzSxU8QbpMmxkq5CSxYOaYrS6W4RzW6A0/60al07LBDSY24
         HlTMZ7VTW6kezbGHNENM1KqjI51PTe+VTXogyHALNY2xcdelXfnv2YwOUpdstxxjX4/K
         vzi6iXayioTjMQmVqH08MdNeCNksDghGMRPk/TxO9VD2zLqq526rgz7nsGaPczs2M3xV
         JTYcfin/Ppvk/pwXMa/OPtzt/MA78L8LGkrr4RWD3EzjyWOAZIMAQ2VyGo+N8/+V70zb
         +oGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730931275; x=1731536075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+ZvtJpgPQ1FG9AqgF7gSBqYNYSiUWWYwTG23bs23QA=;
        b=Re3+epWduv+/lxnxhp/HphihTOcQUvTERgDS6GK3Nfox6YU1J9CBLXXgJiACW9J4c6
         qIGIJezPiITIkaBYWGee06kOfT+FXXiKCxZ+2eMvgoVnxDn8WZYY34vJDoae5e/MPcjJ
         ReDR2W8dJn+2moDERsx6TUN4rftgXq0YSJk6XLUwgT9geSQ6a6TYfOcea7yUc1K/Mxkb
         3K3+JIV4IUCY7Ftid6yDBBnQpIRyK2KLWPNOx8EFVHul7mLi0qxKF0WA9Zp9CiCfFK2w
         fl4AtEMxXfQsva2amyOSU2o9eMZzLt0LoZmUNLeOSbTO26AZd9f9lcdthL1moy1t7lDL
         1qFw==
X-Gm-Message-State: AOJu0YyWyUY+ghy1bLhAoKSLGeFNnwb6FMJvH7tWw3PakpfB+8DIgej4
	R3ays/Er3/Sil4dxd4P0heAoJgqehtOX9KEvvJN3ESWSqTRF85KJXYMig6IgJWilnTM11y7MHaa
	49M4OeVcae9tEO4hypdeJiawa0NYzYeXJsNn3
X-Gm-Gg: ASbGncuwT5iXCvJ0t+KV9FZGesiBVnED5zNyF5kUZFmfgLGaKNRUq5hA49fHQfX2S08
	n9GgLFzEoTL13NdeQ1SasDdFAqd88aRT3kc5dEgx51CW8zWlaFG0woYwfb7U=
X-Google-Smtp-Source: AGHT+IFAaZQ/kcCub4YPYUV8tR54Qm3m0H1s4WiGb2TtSUWD4syXy0WBTd+l++jA/d7TF1sK9tblMY3mMAOK+PfxFjA=
X-Received: by 2002:a50:8d09:0:b0:5cb:6b7e:9634 with SMTP id
 4fb4d7f45d1cf-5cefbc29fcfmr231655a12.2.1730931274824; Wed, 06 Nov 2024
 14:14:34 -0800 (PST)
MIME-Version: 1.0
References: <20241106185513.3096442-5-ardb+git@google.com>
In-Reply-To: <20241106185513.3096442-5-ardb+git@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 6 Nov 2024 22:13:58 +0000
Message-ID: <CABCJKufVg8tDeX89wfgrjLU=E4V+0GKqSPrw84s+WQtSsb5PMA@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: Dynamic shadow call stack fixes
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_141437_303320_9140C713 
X-CRM114-Status: GOOD (  16.97  )
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

Hi Ard,

On Wed, Nov 6, 2024 at 6:55=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com>=
 wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> When building modules using the large code model, the emitted DWARF
> metadata uses large fields for the code references too, and this is
> currently not being handled.
>
> The CIE header frame contains metadata that describes the size of these
> fields, and so this should be parsed and taken into account when
> processing the FDE frames (patch #2)
>
> But first, the handling of this CIE frame header needs to be fixed, as
> it currently [inadvertently] used hardcoded defaults for some values
> that happen to always match what Clang emits in practice (patch #1)
>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
>
> Ard Biesheuvel (3):
>   arm64/scs: Fix handling of DWARF augmentation data in CIE/FDE frames
>   arm64/scs: Deal with 64-bit relative offsets in FDE frames
>   arm64/scs: Drop unused prototype __pi_scs_patch_vmlinux()
>
>  arch/arm64/include/asm/scs.h     |  8 +-
>  arch/arm64/kernel/module.c       | 10 ++-
>  arch/arm64/kernel/pi/patch-scs.c | 93 ++++++++++++++------
>  3 files changed, 80 insertions(+), 31 deletions(-)

I was able to reproduce the issue by building modules with
-mcmodel=3Dlarge, and I confirmed that this series fixes it. For the
series:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Sami Tolvanen <samitolvanen@google.com>

Sami

