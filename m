Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9409FCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRzWuCGpSN7hnP44f5gqzC5UuxA48SBRaJlrsOJokz8=; b=uh8CeaZ0K7tOMTE+ScGv/t8bvn
	XKWD/0jaMAtHEe4ojV+fP3hwSILl92Jr64S7irtEKTE6OgXALMBxHN0woUW2RViCZLhuXLjY8vEdQ
	9tPva0nRg0KYZKXebI+FzYHkxUlNS3YaWZnLdnSqPHSfESWf8P9mh1fJpYEOea+5td2eQAaHTiW4i
	Pn1CibP87Sgu3BlvftHtu5GSY+cRZFCnKoJWIHwmZUFq5lUbIgJuUx8bYHRi2XrU0Dd+CUfIg0hBP
	iWlsSSwkf05Mj3l+ldDQTlw2uGEQ82lDT+HyaJbk53qT/qqgp6/JJxrXwgNBKF764/+oDMpO5/MgA
	CQ7+X0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIso5-00000007aS2-3sHD;
	Tue, 11 Nov 2025 18:09:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIso5-00000007aRb-0NrO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 18:09:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23DAC60205
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 18:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B4DC19421
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 18:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762884567;
	bh=hRzWuCGpSN7hnP44f5gqzC5UuxA48SBRaJlrsOJokz8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dAkRoWr6gKqiTS7nXrIz3+lIhTLF6a3iYlCpB8vfg+36WUESohxTaBZnMB+I5+Jzo
	 cQyrOZS8UBQHtK3HGVXePJTZwk3aqpsqkie5SRW95J9piZIicScJlhQ1NuIsxI/dvo
	 FTfIgVPX1D4arnnbJeS/K/NiIrNz7cu/wccHlo5xeBu2Qzb+c1p8qeQjM58uX3LR7s
	 PBIdcmQ+IoqLXPYJr7sKsbJATmGOZUnY9RNkjeLLmNLVy1u8iaatZS+39bCV+26+Y4
	 WoWRpeKiyJuFjMia0KwT3tA4NkQN7HR9GmlBxz73ppkWmMPB6vHpX+A1L6oOeGE+1C
	 6+CMN100tfYrg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-362acd22c78so34010561fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 10:09:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOtqRh8ZaU2bbkX007n6LMb+mZ54IibVH/SJoRJWO5L42X5tKofICucB+SX8Z2R0+P3PBIvtU8Hv4z3xMg7Ut2@lists.infradead.org
X-Gm-Message-State: AOJu0Yywk9KmQT8WnP4BowEZMSfp95rwiQKe6QELdg4XoI8C+qFWNb2M
	7fS89ZunIKX5uaJDp6xLqHohPrsSvsij/f+UE9uaNnV4ZSIbKjiEc8qc8FwufP2+K7I9CCDWqnK
	1YQrANQzvRa6gm7BeB7J3S3e3wP101UI=
X-Google-Smtp-Source: AGHT+IH+vlAqWzKbl8RBzatfARjBWPp0/kjkNw96di46YW12EtUe8RsSCT1rqVKGDAn4JpAh8fwnVotjuTCE6BT5zaw=
X-Received: by 2002:a2e:b053:0:b0:37a:3180:472b with SMTP id
 38308e7fff4ca-37b8c3c5050mr572891fa.29.1762884566166; Tue, 11 Nov 2025
 10:09:26 -0800 (PST)
MIME-Version: 1.0
References: <20251111060212.1963608-1-rdunlap@infradead.org> <CAC_iWjKYBgjG=C7NgAFwn6uBSMS0t_WepazvcTQb-gPewL9ckw@mail.gmail.com>
In-Reply-To: <CAC_iWjKYBgjG=C7NgAFwn6uBSMS0t_WepazvcTQb-gPewL9ckw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 11 Nov 2025 19:09:14 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEe9QfPQaCuw-kBnATGbvsy72twRTzid+uGs5kifD18Rg@mail.gmail.com>
X-Gm-Features: AWmQ_bn6a9xN1rQuUplVLq-mkEskC-N0KOi35QceiDDR7QHvWxSTRYRR9bJQZpY
Message-ID: <CAMj1kXEe9QfPQaCuw-kBnATGbvsy72twRTzid+uGs5kifD18Rg@mail.gmail.com>
Subject: Re: [PATCH] efi: stmm: fix kernel-doc "bad line" warnings
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 11 Nov 2025 at 09:50, Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
>
> Hi Randy
>
> On Tue, 11 Nov 2025 at 08:02, Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > Add a beginning " *" to each line to avoid kernel-doc warnings:
> >
> > Warning: drivers/firmware/efi/stmm/mm_communication.h:34 bad line:
> > Warning: drivers/firmware/efi/stmm/mm_communication.h:113 bad line:
> > Warning: drivers/firmware/efi/stmm/mm_communication.h:130 bad line:
> >
> > Fixes: c44b6be62e8d ("efi: Add tee-based EFI variable driver")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>
> Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
>

Thanks! Queued up now.

> Is the fixes tag necessary here?

I'll keep it as it doesn't do any harm, and it makes the stable tree
doc build a bit less noisy I guess.

