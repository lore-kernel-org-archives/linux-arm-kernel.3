Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8DDCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 01:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWTfsYajgxspjw0BEVIGAJj43TSZuMXWhqAKPxCzuMo=; b=d5CFozcphhpP8pmnvSNJwOIN53
	wOZI6IgO2j8OBN1kxSmkA6/eAxobEqAqXh/nr7UJ1JnM8FQ4Aw1KQzhgbYrhduizEYGrnS6Wsjm1P
	OI88lgwB8hFs0bBYz/8mHXrGcIKB7qmHfUi/Rw9XP6+rCT/O/NwW1GpMGXVDF3F0FKH9xQwHCqjEQ
	5ITjWogkzKsz9MDy4NEI4J5J6f7IVKp7y4TmH8qcIVma4BPvlmmqowsGrVJweUoW0KSHSrlBXXSzV
	Epp3VsF2/NyO20zqTCfcfEtzc1/YesCMAAaSY72dEGdmFxUi930j2pP+SU8z0bjfLAQeiPgwKInK4
	QvHdbhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urneT-00000003yNU-3P1j;
	Fri, 29 Aug 2025 01:11:37 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urlO1-00000003WbX-0Vb6;
	Thu, 28 Aug 2025 22:46:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2489d5251f0so1878565ad.0;
        Thu, 28 Aug 2025 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756421188; x=1757025988; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWTfsYajgxspjw0BEVIGAJj43TSZuMXWhqAKPxCzuMo=;
        b=imY6oXIiD8TBWJHGI1OkB1Fl+NnlfUogrturdwePpuO836pIRDAsN2YCFta/KK0EyY
         35Ow0B7xiAJp2tnijocKAKEdYwlXmSZrQf54GWYQIBdMI9enhAn577+6fxG803xVtZB3
         x3j9zcpjB44Hsu27374u/O1PxORq2z6AiUefzzAmUuhHUyZM+ESdj+ad3XbQoFfJYQAU
         JK2axvk5fhZf7Ufdxz7D/sMxwIKbGMuczuLgyHrQthK9ssL3iQdXh7vkDJZctc7Q/jDj
         Xd/uRuWfnJtVpiBxzv42CBXxM01FSZaJKMmigzDzjeTKkegVld6Bh4VbGQi5Fmz5qskS
         4O1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421188; x=1757025988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWTfsYajgxspjw0BEVIGAJj43TSZuMXWhqAKPxCzuMo=;
        b=jPWvCOcyY17vVUaQnSkX9Cqh9cFcg1HtCAx62GiqI14q8suZUy6CPcq+rFNTJKO3T3
         K+5BPWuoqz3FRhLjXVizt6aMellOedgJsMmgOA+W5GQn4ZOoUaRIDJWriRNvCMoLLViG
         VG6OlhCT6GOkjPeg0G6/t35RD/lQ44/bRjTsxPK7UrVAErICe8+UJT6Stz5Fga4dWMhf
         UBTtxR1Qy8AAfdQ0Z/XWr0o33mLuzinXy8ybzDm7luSk34bEreqJsw4UjA94Q+KLzBQR
         9OgG1fFZUcY1PEep0UtW7bsIBmzbT6aF1VzdRUaS8qRwsgieRNySdSt7QCHyK3076LCA
         Xfcw==
X-Forwarded-Encrypted: i=1; AJvYcCUGNhm1qckiSPUMYoPL6EYaCf8QC3ykl4eZDpPrcQ1cV29hBjlp+87gel79OD22MZQWFg5sSd83SNraL0Y=@lists.infradead.org, AJvYcCXNdjZ6wvAZ/TVGueAFF9NgWxi6TeGiJuqG2TLpWYZmlYP5jHGJeAI7D1VCVrzMLMWddN6yPDpoep+x/R6R9tCj@lists.infradead.org
X-Gm-Message-State: AOJu0YxoOnpInsumCroDvJo2LYWmb0Om3sFNtcPuiXEPLh+Qj76jIjK/
	36i69451EIqmDVisg2qGQh8DOjzkvZ1LAM/lTWp6+xjqQrBX+0BvZSYgFqbLmatYx6UTLgNDk8O
	7UivjpVTURm1Zei6lI1oZc4AzbGucfe8=
X-Gm-Gg: ASbGncvdYHhFkN5rsrriW0Clm9UYoSUyu/wK1ShCHJB9xivaTT4ZwMqVKH6PoZCo+CO
	lnREv38b+yDsvdjKdcgb0HQHTOS2djdbRRbtTEsWZrAxx80nMYshGOdyKVdCePpT2wTHfKz/X5v
	RA7qjOrHiMutC3veY4qYYjZbQo2k96enqCJn7Td06jV5cosluaudXOJ92nZPI9v9zqxu6TEZlYB
	w5u2akTnfAUlCil7dw3lNAR0Gc3QZokZ4upGeabtd6bknvWBkNSwe/IyCK8pO9xCO1vekIqfV6Z
	LTdLBRcbug7tpeQ8RLFz/HaGuA==
X-Google-Smtp-Source: AGHT+IEki7N5+ZTphBMAlPvPh8Ed2D0soQ3ee4I0yeC35pDHbq+VM6I/+v50+BWUjpOg7vsfojcxdwe+ytoieurevJg=
X-Received: by 2002:a17:903:2f0c:b0:248:b43a:3ff with SMTP id
 d9443c01a7336-248b43a098cmr46736235ad.8.1756421188295; Thu, 28 Aug 2025
 15:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net> <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org> <20250827193815.GA2293657@ax162>
 <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com> <20250828201915.GA219815@ax162>
In-Reply-To: <20250828201915.GA219815@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Aug 2025 00:46:16 +0200
X-Gm-Features: Ac12FXy71Ta7noj8hoAJaRqNi-cWiWGGHMHvo9xSNtrTkaZTnVcq8IZX729diUc
Message-ID: <CANiq72mRKHunT2Zkdj4dS5yHrx==MsmY33BvBqOy52_pNqrZFw@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Nathan Chancellor <nathan@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, 
	Puranjay Mohan <puranjay@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_154629_163260_58080AFE 
X-CRM114-Status: GOOD (  12.24  )
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

On Thu, Aug 28, 2025 at 10:19=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Ah yes, I reread your suggestion and that would probably be the best
> course of action, as it does avoid the extra symbol (although I am not
> sure what you mean by one less rename?). As I understand it:
>
>   config CFI_CLANG
>       bool "Use Kernel Control Flow Integrity (kCFI)"
>       depends on ARCH_SUPPORTS_CFI
>       depends on $(cc-option,-fsanitize=3Dkcfi)
>       help
>         <generic help text>
>
>   config CFI
>       def_bool CFI_CLANG
>
> then keep the rest of the change the same with the rename? I guess the

Yeah, exactly. The name isn't great, though, as you mention, if users
with GCC see it early on.

By one less rename I just meant that we wouldn't have both CFI_GCC and
CFI_CLANG "moved"/"merged" into CFI later on (just 1).

Cheers,
Miguel

