Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8012CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioQkr+GKAfJYKZV/T+4+6GXwiHc4J3vIRn+JfgGfGZM=; b=RME8TvasYAurIkrN16ilixMPOs
	x++ZRacebxjonBd/ZQuRzDmX8aCIHhljrmQIc2ym3Pzv2z/msnyXPf5uGRcM278AIRY102EVhS+iM
	koEvWTNtobKRCqKcfUHPXkIWquxrkyWsLNiMpJ2w8CCabA79M7vZptyn5Q+hzbD8BUUkyySh1czwV
	RD26HjHfLwspTm+euHvEwPHtKFd0Umwvvj506ussy0FRXxiA2kEH3EvrxbQ3MAFBgOqCea+jsja9R
	b+ZxXU8yQSGFnJhz0vHfpuAybP2YktGCTb2n9Mj1ntCX6j9nPLrJ/MCQohWlXPPyMzRrxB7erOQ1I
	502OI71A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNSO-00000005EkW-008n;
	Tue, 02 Dec 2025 10:18:04 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNSL-00000005Ek3-1e8P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:18:02 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59577c4c7c1so5902425e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 02:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764670679; x=1765275479; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioQkr+GKAfJYKZV/T+4+6GXwiHc4J3vIRn+JfgGfGZM=;
        b=VJJhos8dGN0OBjA++wu1/3v3WGmjTfNGSfBxFQa9bGJb+Nb6NG+uOwoBVOe+cv/6h1
         i1IDfixMV0tWzilu7xjeSKeZ1n5xXHXaqy04bPUnZTRMkL54RSRITB01njUBOe+LEGP2
         BR8Ud8nox3L+I9SuIC2SdPslniwvkeBUYm2xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764670679; x=1765275479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ioQkr+GKAfJYKZV/T+4+6GXwiHc4J3vIRn+JfgGfGZM=;
        b=AA2DgQ7frtfiqRUg4mBuXRnAYiLls3XiqC9A+0dees+wVKjgmEzzZ8GHq2ukZX+Omm
         ShPbj/BviIG2bRYo6mnpRfa/l8F9wu3CnLAM99w1J7nrrgVciiBdRlTmTUU9mzu/LISQ
         m7M2JF4DylCao+RU+H5j1wEKPwIuM+33oeaLNy5UGq7h/HyNMRLxiLfYFef9GbxcsgqB
         A0T7/qTWGZDx/eSrWycT6hbw+gg0RBPYxxYPYOfGfs1cBXx0z4UWnUW48zGNbMMvBePC
         Bwv4byDZNRysWhMSmQZe8ymHVY3k4BRwcC3FN4vjF1XUHbSwNgvxLw6pAfGSd2Ufgpu/
         ajWA==
X-Gm-Message-State: AOJu0Yy2G52O2O87UT2FNtchEE1KiYPO2TX6XdCp/vbvkXZvJULzDvJM
	ubU33yCdXnTN9xpIKV+/w3ZNLWiTzZgDxhz8UVgvgp5GdgyTOQxYEF5jyRLZ5wvliGdhmZF4Xn+
	G8Zbg6xF/ViTtGRum42Mqn2wcyPJhQO8G3ZDtrxKU
X-Gm-Gg: ASbGnctuUVoaisC4WlIjzL8oxEbbK+9E9dtfMCS87GAL8V6gfZFTyYtjxV9uQMRtfRK
	3ZsjZ0YhBaHJk/7LlqpWnkitcPq4e9dUgc51pxA/DYt1pOWEU7n2ZV9JWqujkc57rQkE7LN0eJX
	91s5VMtQRBieMw+YKcaisWGcW/xQiukJibr9RuqgdwF5DrZWrLzrWn3NtxjtdOpm9cgRYkL1zde
	t5NAaP5Cc/f9vJFRGDwSugqzQwzXEHciYWZWVvw73NLtF9JflAEPxXHiPhM9AIjQfrXnxy9x1l8
	+2/ftA6SNyH8suGL2k8HUr0FxQ==
X-Google-Smtp-Source: AGHT+IFMbNYfhx/IxwWIQN6hcIz5muNjsBKHxTkZZuialnPyRfu0ht8VSNm8f5GhN/j4yvFDY8oqqVS+Wnc7sR40ZBE=
X-Received: by 2002:a05:6512:4010:b0:595:9989:16fd with SMTP id
 2adb3069b0e04-597cfb0b5d1mr748225e87.11.1764670679281; Tue, 02 Dec 2025
 02:17:59 -0800 (PST)
MIME-Version: 1.0
References: <20251119181333.991099-1-sjg@chromium.org> <20251119181333.991099-8-sjg@chromium.org>
In-Reply-To: <20251119181333.991099-8-sjg@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 2 Dec 2025 18:17:48 +0800
X-Gm-Features: AWmQ_bkDP2tY6V4lgah0ZJ6jJsxSJmd_cZ-9gWNxark5x0Lt7dHgeEEKpi8sTO8
Message-ID: <CAGXv+5HiV7EE9CNPRT5EbL8AM8n68Ac1r-=esQL5dgaPDKPTWQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] scripts/make_fit: Support a few more parallel compressors
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, David Sterba <dsterba@suse.com>, Nick Terrell <terrelln@fb.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_021801_484324_B2232C4A 
X-CRM114-Status: GOOD (  16.59  )
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

On Thu, Nov 20, 2025 at 2:14=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Add support for pbzip2 and plzip which can compress in parallel. This
> speeds up the ramdisk compression.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>
> (no changes since v1)
>
>  scripts/make_fit.py | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> index 9dfef11fc4b3..64038f17a51e 100755
> --- a/scripts/make_fit.py
> +++ b/scripts/make_fit.py
> @@ -57,10 +57,10 @@ import libfdt
>  CompTool =3D collections.namedtuple('CompTool', 'ext,tools')
>
>  COMP_TOOLS =3D {
> -    'bzip2': CompTool('.bz2', 'bzip2'),
> +    'bzip2': CompTool('.bz2', 'pbzip2,bzip2'),
>      'gzip': CompTool('.gz', 'pigz,gzip'),
>      'lz4': CompTool('.lz4', 'lz4'),
> -    'lzma': CompTool('.lzma', 'lzma'),
> +    'lzma': CompTool('.lzma', 'plzip,lzma'),
>      'lzo': CompTool('.lzo', 'lzop'),
>      'zstd': CompTool('.zstd', 'zstd'),
>  }
> @@ -220,7 +220,12 @@ def compress_data(inf, compress):
>              done =3D False
>              for tool in comp.tools.split(','):
>                  try:
> -                    subprocess.call([tool, '-c'], stdin=3Dinf, stdout=3D=
outf)
> +                    # Add parallel flags for tools that support them
> +                    cmd =3D [tool]
> +                    if tool in ('zstd', 'xz'):

There's no 'xz' tool in the list though.

And this hunk isn't mentioned or explained in the commit message.

> +                        cmd.extend(['-T0'])  # Use all available cores

Zero is already the default for 'xz' in 5.8.1.


ChenYu

> +                    cmd.append('-c')
> +                    subprocess.call(cmd, stdin=3Dinf, stdout=3Doutf)
>                      done =3D True
>                      break
>                  except FileNotFoundError:
> --
> 2.43.0
>

