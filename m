Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B88BCA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sywg8iRUIcC+LFpPdVUH7AYVGdElA+Lmuu0M26yEpI=; b=eWTbn9U+rl+ZK3duBZNMRrDp52
	tfQvrH4sEIpUqWpJnQoGdjOnJ4Zuim1LPytmLdy++K92CArtqvO+trhk+9uf5EdxWhvhoutXkT2BK
	0p/E7NHxzQNrDg/KLDrcFw7ZVjfS2tv8kRfACSCoUYba+aRWp0ZBIJjmKfNcE0ZqEToNvj4TWH8Pa
	uf4O47q9R2AzhpAgLf0kxYrYSgv5+QS9kI6xcxVdIcgS0+XUAmUl3L+YxFpdhfEgyStjFIG8CgWWt
	NyIHrbY1/aB1r23IvTIeMoFg5z6oeMluCLSzWrW7Xnb5hbMalaIMCU/6Hhnr2To5kPZ/9nVa4nsGl
	GdT6mAVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgLm-00000002Q97-3CtL;
	Thu, 28 Aug 2025 17:23:50 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbR1-00000001S9x-1U0y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:08:56 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55f4978bc0dso1081084e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756382933; x=1756987733; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sywg8iRUIcC+LFpPdVUH7AYVGdElA+Lmuu0M26yEpI=;
        b=XmIldfyzKt+eI/9N2QWHt6Y1QxLjQg7uovqWMdHByCBl792SRZaOM+dH5+NeZL3UhM
         W/J6fkpd9CNn4jtQWVdEX+9hYdVO3LLioQTvq+icusJJtCPEeOzYWBAD6ipQp6d6H4Q+
         xdf0T9w1Eeh61AKf59KXPsd3H+8ve2mCVzV72LxkKsgqXLknntj+IonzV3TA8q32dyy3
         U337klulXVZXnnh7Y4UzTXCG4E/kmwvj74rZEjwua23OLTBX2la+gumRT3kkDKl34lw8
         d/tG/hIeU1VprCJ/cj7xlhmIhcR37dEEGTvqZ5LwtIskWMg+FiDMSIQ8xx26MbV9zGT/
         K+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756382933; x=1756987733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sywg8iRUIcC+LFpPdVUH7AYVGdElA+Lmuu0M26yEpI=;
        b=Jf9FW7IfCy1j/UGMe4fRagiL5YGMRCN6cz9frm9XtxpU3WfOT02Vigh8g7OHno2c8D
         npwcIUx8TcN6jkuBY/r6z8tdBhDQjXmc+dxSrEJdS7/sHVHex3DKcrCex6jXPHgUKbfa
         /EXpy9mk3fihuQg9VA3O9jXolxjSBV7fv4MaU1zgA5mM7Ne4nwVtlRCBeNYWaJ1H8jV5
         EirvLsWV8wG0EKMgVdTbB0wnXeZCOnIpqvQCec4drexy2fHO+qVyr8QjwlwHyJ5z5S7b
         s7lfsaH+MO8iVtJRgJSEjecXHgOzTEOZdfGoMxVsmDSl5O+n8mUB04mq6tELgRIEQmfs
         vfYw==
X-Forwarded-Encrypted: i=1; AJvYcCXjcjcSPfAVvpiKLodOK1HICr+Bj6+zSD/6UDLiXPzZ3b+ZFOY051Z0OdPFEjxS5NarRj6iRt7EzeAMfxw/6l/r@lists.infradead.org
X-Gm-Message-State: AOJu0YzrICoVtVGxVToH/O6ZRBphu6WWbE2zCP6eMl2rs3KUqBi0ajqF
	2RrD6cuBb8tUsF6GrogvThvGq0dzAYIG7kWiKmJBAYz7IIvTG3cHwNmHw50W4IrxrRpth9+Z/jQ
	sgQKRaUOGs+jr/vsPmDwLBHchsRGGIUyF4w/6yNIp8Q==
X-Gm-Gg: ASbGnctINiJGT+5sA8ax0Utp0h3/CrFfeUCg7ovpLirzcfrUg0fLCUvQrLte9hiamZm
	IcjCgSy9CHVPVIRNnhKvXPce4V5esH7y8moVMvrAITsBXzwjVz2+ege5ValbBrQtNkO5+XJgwQ3
	wIi476RQz2+UI5Na29QmwpoibK7MDSuaOB2KOKjxV93fomygjfMda4LaRTP4/pggTY0DBLIVqhY
	7UOwO7dCRJzBYMVvg==
X-Google-Smtp-Source: AGHT+IFg3M1giQrPALPiOG52C1JhN5PlRo7Xbw3xLek1Xu/lN9fGos88k4kc0ylKwurf0xKqLRcKUK5Mrc5xQ4s7/mM=
X-Received: by 2002:a05:6512:6509:b0:55f:53bd:b137 with SMTP id
 2adb3069b0e04-55f53bdb50bmr2129835e87.31.1756382933088; Thu, 28 Aug 2025
 05:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
In-Reply-To: <20250825142603.1907143-5-kees@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 14:08:42 +0200
X-Gm-Features: Ac12FXys7kn8v1WW0NYPHPp9t-_9fYAtRAX-1QlGxBAnqlbjxr2PgRu8yVVv_Ow
Message-ID: <CACRpkdYnM98n3JLBwVnVD3BRf4qrg4g9aBDqL_2Qb_cao6f5yA@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>, 
	Sami Tolvanen <samitolvanen@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Puranjay Mohan <puranjay@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_050855_386934_650F9AFE 
X-CRM114-Status: GOOD (  12.88  )
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

On Mon, Aug 25, 2025 at 4:26=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:

> From: Kees Cook <kees@outflux.net>
>
> The kernel's CFI implementation uses the KCFI ABI specifically, and is
> not strictly tied to a particular compiler. In preparation for GCC
> supporting KCFI[1], rename CONFIG_CFI_CLANG to CONFIG_CFI (along with
> associated options).
>
> Link: https://lore.kernel.org/linux-hardening/20250821064202.work.893-kee=
s@kernel.org [1]
> Signed-off-by: Kees Cook <kees@outflux.net>
> ---
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Puranjay Mohan <puranjay@kernel.org>

Yeah that was not a good neutral name to begin with.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I don't know about all that fuzz with providing the old symbol.
Seems complex. Folks anyway have to go over their config
symbols with every new kernel. But if people insist. I'm fine
either way.

Yours,
Linus Walleij

