Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F0BCA0FEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60iKAkP3LNe0WedWNS1417UnpVB5oYJPCUr+7fQ2LGY=; b=0cul7prXoY5SNQbz2pWTAPhiXj
	vsSXMOvzR+rSa9BItofAkmwWp5b479CFy+0VFe7HD16UskGfYAaa9TqKbVo00gXXxZ1dcXDWvDMxo
	1tGYb6e3OUcBRSYx/AjdaxF0gt2iQ6ydCXXTPVCr75i5jPqXhNlkY1tc2J+F3DcjWajPbhfiLUA8Q
	fc+InC3FSouMomY25X+CJQrNRVet/Bgph47NqhDlEE8cRk/vfxCOI15I4LQb7iH8ekYzlC2uBRGLw
	auE+qTM+9x9alHJubZE0og0/65cOn/5yGBIUxRZSAmuFNsHDjo9j4nFy7sK2KSjvBtQmOtwcabyox
	E/GwsHiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZXb-00000008ZlQ-1Omp;
	Mon, 25 Aug 2025 15:55:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYhN-00000008OWC-1KIb;
	Mon, 25 Aug 2025 15:01:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2467e454c46so1880785ad.2;
        Mon, 25 Aug 2025 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756134088; x=1756738888; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60iKAkP3LNe0WedWNS1417UnpVB5oYJPCUr+7fQ2LGY=;
        b=g90Kugcs4eYjgD+5l/Skt1yDJUuFGUGQBUh6sQglPN9dCQJTzc+am3sqwUjkAPIs1P
         Ktp64RMLMswgNhA+lcRe8oEgPfODWsYeQD3m+EJwM/GiOuSD62yG3DTkv8zXZHwS+6XQ
         2UcJ5XC2BVeS+ry7F0iUCJZ5astDz/YPVM5lnlFv544mb7oZkmR0Mjoq4+nhD8feNNEz
         12To2flHwgIjNfEiaSrm3xCbNM1XwR7ZPuyatKbqN7l0Ky7Y3UdVigblFfca+tsozk4p
         HrSuGUbngf6CBOAXhVuDk/yY0EKrdXKfnMQ70D2FnzLc/uMUHCKF7YGhINNAYrbcJU36
         hM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756134088; x=1756738888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60iKAkP3LNe0WedWNS1417UnpVB5oYJPCUr+7fQ2LGY=;
        b=bmZv/ij4MQAcZ6Z3cry0KA9PoT4W11wK9zA9ArjK3tAp9Fq0o03YdBPzoPk9QVL6XH
         Lx8yUEB0x9I1z/hxdUAbeCymrfgtbb2SB/4EJHKbmlaahvPfkB0uX+51QZA7lni7GVOC
         woZSBc+N5bwmiSpZJWOd5JuyVoTs/BZVXBkC4gvqFDKVOtAJ7eW8rJThd9FwMhm9isPq
         /BjRY3OjsCRFEEQrUeUnAhpStZKsRnM7Xa2anFk7m204RUoC9QLLxYIbiGG4qm1thYzL
         ZYzIrQni/PbnEVlut2NkEnTNzrZiFSR9FMLclBhnauWNFb045zSV75nI6Eh1fGguvsV/
         CTPw==
X-Forwarded-Encrypted: i=1; AJvYcCUwxD+CwazumbHKA1lJtezkF80oIQSSz0rnMOVI2Ji0KixJuFy7gLadBzW6Y5BZyl3kkjVmjZWGTJjKfRk=@lists.infradead.org, AJvYcCXvumkknbA4HnPyvdB1vBm2u5sEWDLbks8OxaVyw3cHRftA+E9ZdpRK2ig7N5un8uuSwglPDwOBVaU7mDl9HC2i@lists.infradead.org
X-Gm-Message-State: AOJu0YzV/BlyfrA0jit0T/vFPXwzsYSuxr3RJQPs7QxQ3t4ZYuw1/5dG
	JqvwzrBszXip4C4mmwjmpRqrxjD8I1qcifgsFXY1bR/LVxatn20pcwJ5iMHWpJasIkdMl1vzrkt
	55gpACBks/oKQhNqC1Pad0O0jjUqJ4J8=
X-Gm-Gg: ASbGncvdfsd0iiSu0bhMS3gqj6DfssEGZhfjYAExaS7fgARuIGyTlJE84mf6SnP6h6O
	joe4jvKHq3H5MR6WwM4eQgWt5BdqLPhVbKLbUzU7QN/VxyozWGWz9P4J5Id7VHn8jzZUwmPNOPJ
	je2Aicfm4Ja71d2r0K2WXfyKB+InLzo3vQtNhdDlGSDmy3SQ4emI3X85HtWeHHDe7dUuh6s/UwX
	1YdYs2gCZPkZyvr0emgF+n8YTEllezYtSQUez64Ez8pPJ0NbtKsQO6BT5A3382GTCal4MIRjKHq
	aBKBxLUXXo94cTEsRjXRtcBnjg==
X-Google-Smtp-Source: AGHT+IH6iiTQnmspwpwZFl3fWU7ZoF4htCbSAXCmYOC5YgyGhCHecWhDJChnNEZn0Tbpwb/nBEcItL6vKFF5JoBFO9I=
X-Received: by 2002:a17:902:e5d1:b0:246:9df4:d10 with SMTP id
 d9443c01a7336-2469df4127fmr48184305ad.8.1756134087549; Mon, 25 Aug 2025
 08:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
In-Reply-To: <20250825142603.1907143-5-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Aug 2025 17:01:13 +0200
X-Gm-Features: Ac12FXzL7PU_Is1-tccv7Hdj8Uae-cmowXNNIswc_ypx-UP0ygKjVjE1oakxuiw
Message-ID: <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>, 
	Sami Tolvanen <samitolvanen@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_080129_488333_AB2AC1C1 
X-CRM114-Status: GOOD (  10.37  )
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

On Mon, Aug 25, 2025 at 4:28=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> -config CFI_CLANG
> -       bool "Use Clang's Control Flow Integrity (CFI)"
> -       depends on ARCH_SUPPORTS_CFI_CLANG
> +config CFI
> +       bool "Use Kernel Control Flow Integrity (kCFI)"
> +       depends on ARCH_SUPPORTS_CFI
>         depends on $(cc-option,-fsanitize=3Dkcfi)
>         help

Do we need to do something to make the transition smoother, i.e.
keeping the old one for a while to avoid a new question etc.?

Thanks!

Cheers,
Miguel

