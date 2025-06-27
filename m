Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477D5C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pS+ZPyznlJ3iS5vNN9mSK0o3DY38FMnpY0fJETaSO/s=; b=lcxQacVKHn3Aq7vwLwDmtOLlE0
	3bd8ppp5lMOFsHU444v17YO58YT7yjZ+JFDpO+ChrK4QYXopyIB1EJI/jY/wMBFcBkjuh15sChMY5
	EidjcXSPf7yka6BJA+41Afnntt4+4+v+9vUQ5RsxdLd54UwSDiRDmxj6q93Ku44ybZrckxv1U11pf
	mFzr8LDa1SpWnO2Xp1MeAWI+OF/721yf0ggtLnx8rUacaBfllXdmqC5LYq4OSIcphpXUyXgra3uFp
	DVgnX+B7dWmumEW/NzKj7uUOXptuQHcQUcjgAVi1cNAixomtj1js/7P2Fived3q1yeANfq6S6N/vV
	2ELxJiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7bp-0000000EYEI-1B1x;
	Fri, 27 Jun 2025 11:51:09 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7VE-0000000EWyr-0tX7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 11:44:21 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-31308f52248so329814a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 04:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751024659; x=1751629459; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pS+ZPyznlJ3iS5vNN9mSK0o3DY38FMnpY0fJETaSO/s=;
        b=T1aGpXOZW7WjpyjASl1lk+i9LZVUbRl7H6YqvDCRQeChHcBk/gxrTSpI6Qbh81J0EL
         /wikUEbcbqqgMKFdWnzND/baPGSNBapfGcaLtGtmgz+ZzsDk4+alb3j9PUBr9az4DQG6
         D0kwlci6ydjtP4mgLnlF61szY5BHXj1Ernf1ZqR4+Grjin9lNWd7yCnSHjtt/rLLoQDi
         wZVT+IlTVVWA1sSv+IOMdmgy2bzSzo+0I7d6wEy4m3dJFMU1zXZhkJKI2FRi3ZeOCE1X
         n63rFANnmEyBSgsSvI+t9mdNZGspldVXvtqy8ZxrvnAgT6oYIDpY3HyMvntlIM7HKORd
         BEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024659; x=1751629459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pS+ZPyznlJ3iS5vNN9mSK0o3DY38FMnpY0fJETaSO/s=;
        b=CTVEgdSJmgk4EEWCkDtMar1GBoDVeYx25s/ncquIlShr55Ro8/ag4280NWD2tHu83p
         hNdxQ/Xz0dexnhbpPMm7iAXhCKt2hIN0ij5A4nEGeZEiLy0vN14DeZ0cZE4k5sDbU99l
         nmreA6p1kEZXK9FwHXA2fPSFZEWo2OnTWPputCOADkLuayGjGJutVAUeIeb5fHUvUfW7
         e41zcgU3m1HKP+moG2DHtxA3CFBjVcM66QragURw/Fr/McMi/2+dutXE56650hDYQLzA
         btDZtWuMlys7YZSXxSg7UoFUQ7GnPUzY1jM2cDueQn3T+35LClJMroK2KWt4l0gqq5eF
         4RqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDkC3RHTpG+ZUBCUbbpt2Kb43iXaQFlkURsnbZH80ixU3vDVnXzQNeKRCsPV9d4bL8rIXj8MLC2dbnSyFRig6t@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8yBzmhSpDNJA0xeO37HOuEChBKSWzI5tCUo/eds568dQtkKTS
	V7bThe1aH0pKpvGbrezS1BaLNkIzT/y8Mzl13aTY+gYsunTEtS5AiGj8rBlB5WNdFb3nZLwu6ig
	NFACJvN29x2R9qb99m9djxyh2pELhSK8=
X-Gm-Gg: ASbGncul1aA6R4wUyGttGjwqexrC7WaetFyd0zLpLnZy31swhcCGRrBHfSIGvr4bjT1
	3YQ+LLu+R3bxMQSEXJ2zb1TsfkBS4f26tlw4MyNqwHGMrhIHcIny2zY5kLuC4wCsT35N6RnQpt0
	WmlSLTItmj3Rh7+EFfylwBPW9W4EV3wBvt6v5xALmkiAQ=
X-Google-Smtp-Source: AGHT+IE366TUu7KMH/hZ3aJAQfk1MJ2VG8O3hymjtiBQTP+jBFFLF0J1kyJhKcyp/4h7ZGpYnNpQeVzFO4P2hKv7u9M=
X-Received: by 2002:a17:90b:3d85:b0:313:14b5:2521 with SMTP id
 98e67ed59e1d1-318c92af3a7mr1613655a91.5.1751024659411; Fri, 27 Jun 2025
 04:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250627094102.770689-1-jfalempe@redhat.com>
In-Reply-To: <20250627094102.770689-1-jfalempe@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Jun 2025 13:44:06 +0200
X-Gm-Features: Ac12FXx-5LTvv9I-ZDb9-nivG3KWk1kM0W75cZm76TLxZSE56N1ptu8fSUOgiIc
Message-ID: <CANiq72=aiAnn3n7ADgmKUNNSp7HfBjRc1ftG2qSD4EFUkS3jqw@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_044420_258976_719A62C1 
X-CRM114-Status: GOOD (  10.00  )
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

On Fri, Jun 27, 2025 at 11:41=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
>
> +/// On arm32 architecture, dividing an u64 by a constant will generate a=
 call
> +/// to __aeabi_uldivmod which is not present in the kernel.
> +/// So use the multiply by inverse method for this architecture.

This sounds more like a normal comment instead of function docs, no?

By the way, formatting:

    `u64`
    `__aeabi_uldivmod`

Thanks for fixing this! It is nice seeing 32-bit arm taking shape.

Cheers,
Miguel

