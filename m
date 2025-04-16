Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE753C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 01:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXjuke0/1XVuLNfiPlV5GEJxawgB3CfnH2aaqTJFQXc=; b=TlvM7RW8Cd5d9Bi6iWUHq+Rbpr
	Oo/FDse3JD97yx2TPv1mYS30yzCsiQID8wnSoJ7hUrUnYSSIUyPNXzAUldXksFlCDXQZh9w5iHqa7
	9adTWcqrwYwLpPtf0GcLijnVeT41AjYxmAfajcYYrhVYnUqlNuigWnhBvGhoKJ6EWKBcwoksmcHwf
	LjhsJH/3i1eA2gwxsqQtEFXfBpO670uXA/2Chubp9d407wCn/OROM1o+/ROKpI43eS+Ha9L1yp+Tb
	o3fgZfgYeKtq1mCGfhr9OVuMsvxU7vV8Y6qnahIkXFV2Ra4l9JIfBdxxpnK9Ke8R4wvJvKedv/OZu
	1toSPM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Dyp-0000000BQch-1h8k;
	Thu, 17 Apr 2025 01:23:51 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Di1-0000000BOTa-49Z9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 01:06:31 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so529042a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 18:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744851988; x=1745456788; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXjuke0/1XVuLNfiPlV5GEJxawgB3CfnH2aaqTJFQXc=;
        b=a2E6S4KnOzx5wLS30m6W2vRy7/9SOOK2x64A3IVgxgi5QV7CQz1RcuDi/uRkXxOjgr
         +Kjy47DbchshzT5vX7QQMBSTgLCK9qQjN4zFbD6vYaKTCwuL/niQVOiO4hILAF6Qp9ih
         FA2Yoocxq5Fez8YwkuY48FhPCDVazl7xdwKlzAnKW82ffdz2XK2VZ/90oPSarFswBrOm
         mYngMR01N0s6JtMZ5oIERkCw13FH/PXFSyMmdkOYgxgsUCNOlY4XXcOVJGajyb7PwABi
         UbOrTAW2UUA9rJZVPnmA0Gx0l9zC3qBWXrYDR1aWlHu0e3WcXvk3OSaj/VVKazr2xv+P
         ek3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744851988; x=1745456788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXjuke0/1XVuLNfiPlV5GEJxawgB3CfnH2aaqTJFQXc=;
        b=nJzU7XRVMDTwQ5pYiTV+19GdolYZzDN8/0wxb9UlpM9ibPrtTn4U34Ow7u7xT/Fyij
         PxLTm+Iwzz3AX9IKzjiW4Bl/bMrVqB3MF9QbTOoap8SwvQpOmZLR3sbAdBAtFCusqNX1
         vCsGZv2S2xmHSrsXyt9/JOrJkBwRs8INtouUvEZV4ySsU4HQphYg5R0A6OFD3Yc/VHjs
         z2VzXJWGcCfzgKjSKHEtRt7MjZ1Hj+e6B2Hl2+KRhHm1lqG2+Is6B4d0La4cQ5V370ym
         oHPrVSv/7nrHlW/5fJYS4ljfmFpnprsQmutawxfILLNXw31iTuca0bJ9eNMnq6sFjIT4
         B+mA==
X-Forwarded-Encrypted: i=1; AJvYcCU4sqQq5SG6MJElsm/3gaoJuQjaRMFaP2atBMILGd6MTHHOKDfe6mNmxy7TaOBrA1//6tq8am2woPCslcDA55Qs@lists.infradead.org
X-Gm-Message-State: AOJu0YxUe9CXLRqS2b0HvKhHPGu/uYwZdY5u0EjainKaU5ocgYDmAjKN
	1Ppr2eXFMq8SlM5198XCS/pqXRIBrKALDW5mzHXN3fWLcv3KWmPGR7m2MRVBiSgDsPQuduYMnNA
	Mr+LUmE1PO06b7OUJ8rEID+EG8wlhVehH6uUl/4YwdNdW+AJ42oM=
X-Gm-Gg: ASbGncvybJOsvKbmgxUKh+Xll9SBxy9BYnwrGcyEQ7oC4thdDUNRO6d2D/0iCrXeAu+
	ro4vU4RBV1XFaAQgeYYnMYxXM7Z12mTOvkcwPZYVOr57uLfy+pMzpFWqxHCqvUjoNdyUHwhwgg6
	RkdVp1L6YD+B+yRfaDwJ6V9g==
X-Google-Smtp-Source: AGHT+IG9hAb/RqcUyMjum4adu8+LeKj3lYKNlalqPEWwBfkfUt2vnhzCuPcvV73P/EQrHGM4wuLbO44GnaPBGO/0zi8=
X-Received: by 2002:a05:6512:308c:b0:549:4e79:dd5f with SMTP id
 2adb3069b0e04-54d64aea488mr984588e87.37.1744837237634; Wed, 16 Apr 2025
 14:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com> <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
 <Z_-0nX3Z-DLPjL_j@mai.linaro.org> <CANDhNCr5n+HtHQEqCq0ZxbvX-nC3u9ewJ1_fj0h1gFQZ3nB8iA@mail.gmail.com>
In-Reply-To: <CANDhNCr5n+HtHQEqCq0ZxbvX-nC3u9ewJ1_fj0h1gFQZ3nB8iA@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Apr 2025 14:00:25 -0700
X-Gm-Features: ATxdqUFzpyQW831S9hdAwTuoas7KRwwuK39VUOIcXhttpaGT_PCdnsoFhEv7ehg
Message-ID: <CANDhNCo-UF7uVWWMPEYyCzT0R7BTHb+uLq4d8ZfxURuk5r2AwQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_180630_028904_D89E9A2E 
X-CRM114-Status: GOOD (  18.21  )
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

On Wed, Apr 16, 2025 at 12:48=E2=80=AFPM John Stultz <jstultz@google.com> w=
rote:
> On Wed, Apr 16, 2025 at 6:46=E2=80=AFAM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
> > So the whole clockevent / clocksource drivers policy would have to be m=
aking
> > impossible to unload a module once it is loaded.
> >
> > Do you have any ideas how to ensure that the converted drivers follow t=
his
> > rule without putting more burden on the maintainer?
>
> Permanent modules just don't have a module_exit() hook, so that is
> pretty easy to look for.
> Obviously, I don't want to add more burden to the maintainership.
>
> From a given clockevent driver (or maybe a function pointer), we could
> check on the registration by calling __module_address(addr) [thanks to
> Sami Tolvanen for pointing that function out to me] on one of the
> function pointers provided, and check that there isn't a module->exit
> pointer.

Saravana also pointed out to me another approach that the irqchip code
uses: macros to populate an owner field with THIS_MODULE so that one
can easily get to the module struct
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/inc=
lude/linux/irqchip.h#n41

thanks
-john

