Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153A3CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fXrczP/tH9sGyN44YbyszhSBDmNu6JorF9M9mPbTjU=; b=pN3Oyx2t5Iu0y/wET4bXcvSFn8
	OLpT2R2KhLasS1L3xMiS9QctclTnlHvd406Bf3f1V5hUgIYN+tt2s6CYpn8i1SWj//4dhY9PTlj0B
	0OsCaTBNCw7gNX/f4LGLXzMmWOJHB4p/rS9wol3vwupUNeE3YzUkjLoUANT5AwQOBHrgex5nd7N0B
	o7W9a2eI8RBHuis9lNkIQpekT9odBhfhACFHGSghbB5KfRYdYP3a4VBmE1gzwDqgFxJjcKlMeeap5
	oNjMzz3PhdXezFMHpAapcxvDkcfT/eZUgkLdDXHV0oYVwUo+oM1LM+/NAy0WrczfySqHTINPEq3Se
	d8RxPVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDW8l-0000000Eu7B-3xwx;
	Mon, 27 Oct 2025 22:56:39 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDW8i-0000000Eu6b-241n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:56:37 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-63cd60ca2b2so5743031d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761605795; x=1762210595; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fXrczP/tH9sGyN44YbyszhSBDmNu6JorF9M9mPbTjU=;
        b=meaOPKf/4zqC+Ttuvb0w7HHhBJ3FA49S3QaWvZVUF5V3cUjutNVZj9DIca2eBMOQ/U
         5eUG8aZIz2t4jEWbuL5zb8Cz5a9laO/i1JSjne0G0C/Ba7A5bP2moRI1/YNo0M5fQELN
         +DBRTHOKXKBwEZsA5dVYn9RbPuTlpmxg6TgSW5sIrX6mKkFCNgisn5Khxm/B2gSyWLM9
         qgBwFEF5Fab1h5NBqj4pxfkwUXXHnbr9TF+OCOvqbp+lMHFJ7+vyApcLH3Wwjb5LmRvV
         fnFgSEk+uczfzQD2HVan4DjtBz6eQJDaE7Z1VzPAkCU2pmvgjjxgjqfDXT56N0M5CulX
         3VZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761605795; x=1762210595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fXrczP/tH9sGyN44YbyszhSBDmNu6JorF9M9mPbTjU=;
        b=MMOAoL+gYGFFVz7VtCaRhB/97Dv0+4iYcWp4Fl0CfYHcH0pEyck3llcSv0XOrffozn
         YNnYXNoMr+j2Qs1YKzwFHh34S4HPVcqFT1LjIMME1xHLoMzJ1vVE1AvUvISZQbciC7ml
         RmpOznFZOtHkTne0l19V9FGmJ+nTzSly0zX+WkA/FR3L4p70YgJf19ocR39zi0EOXHpW
         xfVhVQ+o+6Vhf8xPSrxI4FbW7Ydxyqrxc4tTbVwNX/dugN0wrrkFDEnj2fhH4LQRqUbu
         mFVSeWp23qjCV/UKTWvxTjXl71shdw1IAv3RkWDs0OgAzVJ9k/hjIflNyMBHwfl5tfbc
         Hwvg==
X-Forwarded-Encrypted: i=1; AJvYcCWaBnP0HIZm8vEHC1ifw50eEAUHtYBonBpfkcWhBk1MDtG8SlRc+/7YKdQChTiJFJZLIW8eUXjXggunUn1DUNSu@lists.infradead.org
X-Gm-Message-State: AOJu0Yxekf/F6t6Fn9fsnDtTSO0fDqQ0oT6/742Ou1gXfifJ6DcwqWW7
	B73jRjuBtXizda91W5n48aS3VK/lL0ZDu7GjOKUNiNWBHmJ2BtWiDidnGAxLk9GDFd1El63gwgW
	ZFjXUPRVw4aVrQ27WTuaqzzSHrEW05/V19De4487MZQ==
X-Gm-Gg: ASbGncsSZcBTuSs2ZRtCqpsWNg2BrA2Atqq0FREHGRQ1mwpkSgYoI9pyxUScF8QPnf7
	n6cOZa08z0phU/dQ4myL5HyOS924ZMWCCw1UGq4CWXDWKSFZ29gu2G3Z9U47qmcCOWKYnfGqVJq
	00PtSCZvtfj6a5+ExfIW44aBT6CTkQnv4jKPHWftwUymf15FwezGN1upWEOtp8gsGhIWTENJQ0q
	KQPvtsCAluKumoFVjoAkE0/l1+E+rrgQ5nhM5ub908kz/59C4YD0hFq/L+Y
X-Google-Smtp-Source: AGHT+IFJxZPsBn36jb9IqqtiTCDa4X0Ih3+3+W1DlxJFcn7w7OJaZooe7uHyHPMcjKs42kSUEEM7iqG3b3fxHPvN1mY=
X-Received: by 2002:a05:690e:4184:b0:63f:2b69:9a2a with SMTP id
 956f58d0204a3-63f6b8559e7mr1530051d50.0.1761605793644; Mon, 27 Oct 2025
 15:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
 <20251025-idpf-fix-arm-kcfi-build-error-v1-2-ec57221153ae@kernel.org> <CABCJKuesdSH2xhm_NZOjxHWpt5M866EL_RUBdQNZ54ov7ObH-Q@mail.gmail.com>
In-Reply-To: <CABCJKuesdSH2xhm_NZOjxHWpt5M866EL_RUBdQNZ54ov7ObH-Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:56:21 +0100
X-Gm-Features: AWmQ_bno-qx6koLOtrZwcQNDXGnT81r2Gd96qzGlQrBISAXpENMYtJk71SRHkpM
Message-ID: <CACRpkdaeOYEcK9w1oy59WBqjNrK7q5zT2rzg8pHgDdZdKWVKZg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: Select ARCH_USES_CFI_GENERIC_LLVM_PASS
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Russell King <linux@armlinux.org.uk>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Michal Kubiak <michal.kubiak@intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_155636_544280_DFE46E40 
X-CRM114-Status: GOOD (  14.33  )
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

On Mon, Oct 27, 2025 at 4:54=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
> On Sat, Oct 25, 2025 at 1:53=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
> >
> > Prior to clang 22.0.0 [1], ARM did not have an architecture specific
> > kCFI bundle lowering in the backend, which may cause issues. Select
> > CONFIG_ARCH_USES_CFI_GENERIC_LLVM_PASS to enable use of __nocfi_generic=
.
> >
> > Link: https://github.com/llvm/llvm-project/commit/d130f402642fba3d065aa=
cb506cb061c899558de [1]
> > Link: https://github.com/ClangBuiltLinux/linux/issues/2124
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>

I didn't know Kees stepped in and fixed this, christmas comes
early this year! I had it on my TODO to do this or get someone to
do this, but now it turns out I don't have to.

> > +       # https://github.com/llvm/llvm-project/commit/d130f402642fba3d0=
65aacb506cb061c899558de
> > +       select ARCH_USES_CFI_GENERIC_LLVM_PASS if CLANG_VERSION < 22000=
0
>
> Instead of working around issues with the generic pass, would it make
> more sense to just disable arm32 CFI with older Clang versions
> entirely? Linus, any thoughts?

We have people using this with the default compilers that come with
Debiand and Fedora. I would say as soon as the latest release of
the major distributions supports this, we can drop support for older
compilers.

Yours,
Linus Walleij

