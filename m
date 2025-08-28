Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E754BCA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOlmlhx/uoqj1tpz6UAHfclWZ6+mPZOOZPCd2SEw9SI=; b=Q6I3lsqDp0URa82oOnDskPI3lw
	jVOw0USsxsT/OWp6xdwv6YtRXS7JwAYn5ZYWijxp99wzHAHCZPLLExdy7QOm1s6MK2fyXxtJA4eym
	rD2NfrFHb2PzRHFBvmNuFH+13nAmAkoPlWXcwOTCa5D0yw3qoKLUpmwN7z2m0qzXOC1rKz8cu1CMX
	GR5uk+1hME1I/UW1xGPQXanXKHM/Wr4OvigW/MSgFrg3pYKeCCuRvjt/6QvzyKZCABNcWgvnW0XBF
	PjFeqrEJeYjiwhEfWeNkv9muq5Dr41KW7MhcrTBJ0PTjisgv3kko/ySkQ2rDYsNQkzbLm8ix6P/3k
	X7SC5Z7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm1X-00000003gMD-28tI;
	Thu, 28 Aug 2025 23:27:19 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urlXD-00000003XrB-2soD;
	Thu, 28 Aug 2025 22:56:01 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2489359cc48so3009045ad.2;
        Thu, 28 Aug 2025 15:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756421759; x=1757026559; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOlmlhx/uoqj1tpz6UAHfclWZ6+mPZOOZPCd2SEw9SI=;
        b=UhroEcIh+TLGM3gRXJHfRPp+QCdZqRidSYsdR/X7dhYoQt+kLi2w7tYGHqWsszm2kz
         7QCZNyNA5+YSFXJNjXm5w/0PYN8Ob4Zqr6aPe9J0OqHPT9LcTJB9PtbvmunVfP+yO4yl
         F3U2QqlSGBjJLVuLyZhrQCUTZCz8DGjPFNJhXelaq4lIsKMZ1c7MnyQaekyT5+kpsoC4
         uS8dNUtrUueCtueBythUemSlqLZEMD66ZKeumZkU6n+/C3IyVjc9pnCAHwzxF8UtXD7H
         19hCoFhclb0qi0piyrCp6sAl4mYbuKBbIDZXGoQHUTH0WkeUZjDVA7DwCNNVP9TbqMxM
         1x+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421759; x=1757026559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOlmlhx/uoqj1tpz6UAHfclWZ6+mPZOOZPCd2SEw9SI=;
        b=J+oGgy9uXt4cxttCGvIHmlyAcWrb1yeJUXwL+bLYkSAEcMSc8i/VArVjuXgeaeXwVo
         N7OdmVMwePuZJRrep8bNTN0Qj8oPZOKKnienIVsVX7E0LOVVDpZxO2xLeD7P1cZ1baOu
         +FCqHoGvmSAkXGV2+BO2onO/ELyK0Ti7Pk3icSsiJHGhiPxOkeDSkiwAV+2H2o53nuWX
         l1jDoIdVkWafHuzQ4cBtUpgscRHkakXva0rM8yKC8R7plnhcodYOhUzw2vwyrei4ATTV
         7o6BK63S7+yNEloW6twmkKMc9xAnT3XO7RETUlkX5Ose84q+Ck83uMuKLxRIgXXL6Qtp
         Vr8A==
X-Forwarded-Encrypted: i=1; AJvYcCVzv/Q7X5baYbtjXj9kmmcCgXuRy9RGLxkuYKLkEE1amB6J/3fP6qtRqyTUH2od7r8RAF3xZE6eQO8zK2+VN4Wf@lists.infradead.org, AJvYcCW8HIKos2VBHkmjND1ARrztkZJHZBXM13ao09qE7+rTs8BpsYtR+GlbYOmlkkgWvT5FVthql018Y27CuZo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiFY1/+Mcf2EhfpyMZ0yyhIZhd40uYzQNNXXIK9vETTVtaxi4O
	au8vPHsWY0h+INLRGz2O2+H8z9ETIlK9XvwV8U2xRc0O0MOKFzqpclnrakqMN4Ppe66A0aT8jNv
	sZ2Mkg3qAEXn+/pUyPCzQ+bVHPagtf1g=
X-Gm-Gg: ASbGncucwnRAwYvux+bgeY/BFyyAXhtQbmkNsP1LFSZkthfPqSSufg4kaaZL0myR6Uf
	ae5HjehAMgn/CHoCfDhuJycXbt8CAZ3prbkMoYQLe6ZcJdGReDWoyHM84IepJFc3jhlLeeeHfjK
	gbPM9pWXyr2r0zalZS1U7lNUzOB4Mr+8abTydSTXtkVcSvefdpnxqxgFhsNq9oIidZqxUJ93LCV
	o8dsQh7CBj7wNu7wpnx+MSEnmuGWVMW2yJUJrLRaqLko+7X8R4sUjHMiToUpqdtlryFoIVBE6kN
	Q00UTn+j31rfVPPb8+/bTdb+vw==
X-Google-Smtp-Source: AGHT+IGyhiVQPmqOT0rpkocxIF4+MoNVf9DAEsmChvxF7JPD+Cb6PcP1MNWLZ1lQ4jj5g+ohcbCqTNY4bA0OxcF+1AI=
X-Received: by 2002:a17:903:22c8:b0:246:a93c:aa0d with SMTP id
 d9443c01a7336-246a93cacc7mr149453825ad.11.1756421758714; Thu, 28 Aug 2025
 15:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net> <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org> <20250827193815.GA2293657@ax162>
 <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
 <20250828201915.GA219815@ax162> <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
In-Reply-To: <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Aug 2025 00:55:46 +0200
X-Gm-Features: Ac12FXxNeQ4YfImZMukInEZi5M8BoR7IH_90HG8_feBBu1eJLxGu0KIOUkXPLIY
Message-ID: <CANiq72=1XKdy6VrAPE7xH65nadFzmrBBJWsLw5tYmxNJqFbnYg@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Kees Cook <kees@outflux.net>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_155559_746208_0A5C80BC 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

On Thu, Aug 28, 2025 at 10:32=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Oh! Keep CFI_CLANG the visible option? Will the later rename work right? =
I'll give it a try.

Yeah -- whenever we want, we can move everything to the CFI one, and
hopefully many users that enabled it will not see the prompt since
they will already have the value there already.

Kconfig doesn't save the unset value in this case, so some users will
still see the prompt. Which I guess is good for the GCC users, since
for them it is a new possibility after all, that they should consider.

I didn't really test it thoroughly though. Caveat emptor and all that...

Cheers,
Miguel

