Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81212C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 17:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tU4zVqjsmoIfqvS43cfmupX6NzIQQKSAzd5QQ/IuB4g=; b=Y2YRIEkA5QX0s+5ksEO5L24YKF
	o+X6S+uJWMrkT3eCic0SgrlghGdJuOnXzWPijJ3cx/Q3oJ1sO7MIyIa1SV9HnlIN3JXaHJ1Z0izkP
	4fBWLzZbGaWzCzE7flS5ETWh3p1xhygOTrjGkHQWEFr6KfO9YCY1GmN6+acIEaeSEJ1Bli6gGFmgA
	PySNP6GYUZsMRux3rA/n4mNJF7RHMzKMPNPtewCojcKzcUE8aCRZ3ZPlPQV8ub7r5OE9wGVnVWtsB
	lUp7+ttmX51/C5kcjEBCddvzqh/Ju7Q3lfeW28p5rZZIwxqhTIW34LxWhWb20uqhK4hRPwibPUu9J
	TAsU7riA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUZ5-00000009Bhn-30Ky;
	Wed, 26 Mar 2025 17:29:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUJQ-000000097h7-3dQ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 17:13:10 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2264c9d0295so12335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 10:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743009187; x=1743613987; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tU4zVqjsmoIfqvS43cfmupX6NzIQQKSAzd5QQ/IuB4g=;
        b=t7lSplLgV2a7u8/CCdkBIRKKoussAHq7dBz8Jns2xG8l8rFS0ci7nabaQIj1AOKpci
         pKOyGjVq63Z5hudpc8WAmUagZTCD8LpS9QjLX5RUp0MNW/lx2xPJmgl7ZWz2PLrW8HnF
         NlaGMpaat0HyavOyX8ZUOYtGi/5fmfmMamUcL0yKFJ2G0PUHABQzYLdOy93uLYEElDrO
         HzFRH13YzQ7uCWVgp1AQVvO+Y+Q/rwQYAfXwHV0xz6xZ7NzAaZXfghfP0Wuzh0zYGqf0
         hbaGoXeR1JwYWA83TCiq+kV8e86d5OhNZpHz6daQZaKw6heWFtstxZK7WyrfveJgfVVa
         aM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743009187; x=1743613987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tU4zVqjsmoIfqvS43cfmupX6NzIQQKSAzd5QQ/IuB4g=;
        b=VRvXCWXuZh+h+eQ1Ddniz7564aq18bu55hLc3b8Jw9/hbmilNcAPoJQTCJCr9ZSWWe
         o2s1mU2NSFa2cZtC6PTy43nlWsNoz4dqClGv2hcB5YzUByd2p4BQKIkatPiV8x4+45MJ
         8EYDGlyLr20XnwffDKIpgBRKHbUCjWgwjLkZOSuQcjaq8CjPSvvhoEDctTxPZJCJHwAR
         byFpaIsdxp9zfaEKGynwX4sP2JqlVAB1cO1/nmrm6l5hdate0QK1g6u/Jy9AQzbKzyI/
         G1pgJ4JawkQja2gihLIigdq+OfHqXQfaMGzoswdtXcCchnJOFjg7gWlfzYpYgZT5Gny7
         Jeew==
X-Forwarded-Encrypted: i=1; AJvYcCXwe09xz2Xsrks+CNwxmvnyUGIYTFKCxfilb3YfDN05xmXhNe4Jf2itq04U4FP826M2j2UGB6wVNWsHUYOgHvyX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3UnjPeF8PUVXsm13qJLd5J/SGDtItIWml5YfgYIjyZttdjIde
	NOEfn6kK0RY1+T8e/1HsTDMjBKV25V/kWAeoSt/YKgIxaDQOeyee+yZ5aKmyrR3ljU/FQOU354e
	OVgrwG0frJjeJDyQyt1noI20U/GJmpkCZibmp
X-Gm-Gg: ASbGnctWQRB2JzjElLvGfIa+yxY6un9FTy9xlMBllMclOeSLQay0JvYrTWoS4LktB+0
	1bivk9FepKaKOxzD/91OtDcIAji2UaOIfx+RzUgn+Hd6naZ/9oh6p6s8KijmvK2PP+mUs3VKPaS
	C3B/NFXv/oS+3A7dQp+dQsULkZGKWAYC80pwtn7hiUS/VHcPGB5Tksx7YW
X-Google-Smtp-Source: AGHT+IFvk39LnkeMkX25OX1JcG8F54jZn2W19dDnfX7iWusa4FMz7ouKzjv48eaBIVtkQbCfKLgP4xKq2VNnjn++uzA=
X-Received: by 2002:a17:903:13d0:b0:223:37ec:63be with SMTP id
 d9443c01a7336-227f365b723mr3316495ad.4.1743009186911; Wed, 26 Mar 2025
 10:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250325015617.23455-1-pcc@google.com> <202503251242.FFDB6940@keescook>
In-Reply-To: <202503251242.FFDB6940@keescook>
From: Peter Collingbourne <pcc@google.com>
Date: Wed, 26 Mar 2025 10:12:54 -0700
X-Gm-Features: AQ5f1JrGljJm4PeWBnKXpI12td-rU59plY-cd4apU9o-HArGlIBfJwqu8UHG7l4
Message-ID: <CAMn1gO5Ero80wm=P3_-BQAFPuefUr_VUBV-msTN-FD6oL_1Gig@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
To: Kees Cook <kees@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_101308_926230_DD23893D 
X-CRM114-Status: GOOD (  11.40  )
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

On Tue, Mar 25, 2025 at 12:43=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Mar 24, 2025 at 06:56:13PM -0700, Peter Collingbourne wrote:
> > This series fixes an issue where strscpy() would sometimes trigger
> > a false positive KASAN report with MTE.
>
> Thanks! Should this go via string API (me) or KASAN?

Let's take this via string API.

Peter

