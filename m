Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C79DCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUwutcLP2TU0uZmoKGbkLCKDIFQshb+hzWxBL6xH0Wo=; b=aZqOxtnXHWc48TY3pb7iQ5UfCu
	3dXjqQ53EYamb+vb+6MFt1bzjM6nOeKSFXkLcMFT0HwusJboiHqp+S2mKU5UEimOMS4ozbxWD6GsI
	Aa1oZplinwJKeAl+CewApfwNmQY3HlropVfQg9rb3nJjmhoK7FHUHRuIAEdgrob5oQNW413CM4VCO
	I01UhgwEDRY0E5fHZSnvV+Yp0CLXq/ftki8Sab5wVrE/onIGqlvQ/D9J7mJFHGPd/F+m7Y+oFpECL
	lksdH9xzabHFWVglc5WZk3uISu+IdhJeW/Wn1+8H9t9rjpvdv/Uk1haseYlLh4b3IJ1xVkzsKVtfV
	3S5x2iSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1A1-00000007oES-3riI;
	Mon, 18 Aug 2025 14:48:33 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvmY-000000070Sn-1105
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:03:59 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-333f8f02afaso31962081fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 02:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755507836; x=1756112636; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUwutcLP2TU0uZmoKGbkLCKDIFQshb+hzWxBL6xH0Wo=;
        b=Hubv1sXlRG4QURY56BRy7MwJMX68VdS2W//4PSezUFhzHp7THvfMNxtL7VDw1GDz9H
         +LKzqX17MsUtFBFIRjH92QD7uRfJIxIHcktBbhOQFFo2bdSlSEadwAqKKxSXARIn3kbT
         21RF4opcIJKgLMa5R3UOKW88kcmxr3IAt1YqOhWPktQt/RM3PO8eYAplckO8S1VLImqI
         vHv1U9REhd06kgMuRFjgF98hlZHKBgkoONMMJENg3XapaCDiUNZf8waFkU4ViaPHsP75
         YgFxnD+ATLVHCeZ3eSw4o6DhQy+dBWZLo6ftx9AtyKTWZRKL913Px+NP84IdiIy3VrzN
         0rJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507836; x=1756112636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUwutcLP2TU0uZmoKGbkLCKDIFQshb+hzWxBL6xH0Wo=;
        b=fRaElIcn6QhOcr4Im/dX1nOuL31li3gp87ziUPJexgbjQQKhVuP8zevtn51uBIWRrc
         wYA/xX2gmc4ofZTyJKIvrS8XzSzcNpVtPWdlS6ouymgTVESb3ZcDgCCe9FMyo49os+1V
         ftwtTu6x5dStkh/9LMxtP3MbrgfaIDcJOQJbGFNVC4nPqaM5GFF8BQrIVQzV9Hk/A/RV
         adrlUr9gAD4PLpOwcQFI9niHI3+YkpKITp5FdGU5Ae7Ei1Pm3zhyoZlLdT8JmBZ36OY0
         QB6LM7vYpucD1pzFf4Giv7NUd/BQGNR5C4r9pek041lZ5WAL/pOEMaJSWqVReezuy5Da
         lnBA==
X-Forwarded-Encrypted: i=1; AJvYcCVhAEwaC0VhmV1tj1GuhRxkHPXYN40hbdeQqWhZC58PIBt0K/7FcRzvxgrXQH4kMpq5NCBpwNIpnHtP6+Mf+HOy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7A+bfpHbJJD3UcBV6S18uQEnm426q15IhBnQ+LYWKDfzf2cRT
	LsFvq57X3g9S+lBpNljmBpmtnpEIe4ev4Dikd73Ozno5p9diWUTQ93tJKxeUTRO3Nx+60LSDJCb
	DlfB5b5n4rGHVmqDIYtqr5rt5dIw7sPG3uq66WXYp9A==
X-Gm-Gg: ASbGncvPw/mFqEASs7OonRypZf924xcDzS1MfXhBc20PZQjFEdxNDMW6H8sJ0+e/YeU
	ym8nZR16z0f9DsDj3SP080DIAzNQGW4vwfKdvBNu2M2aj6xJtL+ilU0MSv9dYxDa/Ks0FXg1vRS
	SfzdaISOL+3svy7MyV7PHilBZf9q6JIs72GRBYnu6VRhVjGM3tPonRBsPl8Oa3UQ7wPVeUFxT/z
	iqaxoWghbuYZZKUOw==
X-Google-Smtp-Source: AGHT+IE9kamzF6h6Mj0Uthfqb51rMDCl6ApaA6r9yCxNefG5kg1EpxapoTSKZbjphVliY5NG5jt71S1DTJFc+QzXeWM=
X-Received: by 2002:a2e:be21:0:b0:333:bf9e:d75a with SMTP id
 38308e7fff4ca-33409809840mr30484411fa.6.1755507835692; Mon, 18 Aug 2025
 02:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753039612.git.dan.carpenter@linaro.org>
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 11:03:43 +0200
X-Gm-Features: Ac12FXwmdSMJ2XrjVzm-k9jfEa6zy3nIx6AoVfYXMCJMow6Cz5Q3z1FJ4deDBS0
Message-ID: <CACRpkdapzTTJhAvY1BL8GnUpCc_iHESbY9bFsNTE4Z6FjusiJw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/7] pinctrl-scmi: Add GPIO support
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Cristian Marussi <cristian.marussi@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_020358_291361_E444931E 
X-CRM114-Status: GOOD (  12.21  )
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

On Sun, Jul 20, 2025 at 9:38=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> This is version 2 of the RFC.  The main reason I'm sending this is becaus=
e
> there was a bug in the first version where it didn't calculate the offset
> correctly so pins and groups weren't linked correctly.

I'm thinking of applying patches 4, 5 and 7 of this patch set to get
some movement in the code upstream and make less work for you
to rebase the thing, would this be OK?

Yours,
Linus Walleij

