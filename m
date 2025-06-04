Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1109C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 20:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+9cioOEbudhepUywjfVI9ITBQV/u+Nkg6uYOHe/678=; b=rOGJYwNoMyliu81l+hZyzsLrr8
	Fs9oeu34xiLo4Zoucj2b65mYNkw7AVE/I3jbRrD8lihQA/GdNAulbO4EyWSSQgkHg39vwZvQQ4wA8
	uvKyNeMvjFZdjuC8QJpBfac4Pvo5uHz8JJ6eSZLC7Fj5QXYYVkJzFPtyNRlTJ2S9fHVu4+M+75dYw
	0GaPAxQGAGbAu8jbdgWCZpw6eQOIrUbpJubCqD5c/31JTIWn8ibiTAx+QYoWwPwdZWZuac3P+nGVE
	MZjBpkerQ2DxBD384l91CQ6gOMWegpeDuXwQM/SeFKhN9O7gRBK1ttJqORzngUfXxi7YvLvqYuOXW
	nxUuNFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuV3-0000000EAhO-2Ggv;
	Wed, 04 Jun 2025 20:14:13 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuQe-0000000E9mR-2TRe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 20:09:41 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e81826d5b72so297300276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 13:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749067779; x=1749672579; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m+9cioOEbudhepUywjfVI9ITBQV/u+Nkg6uYOHe/678=;
        b=xEfSKa6flcJfHLwA+bybHLBk8JDMhnXPz6EXNXrFtgELR0u7ZFEHGJEwf7YfWLWYjh
         nmyLv713CNoTKNO6VtQ8NnkVhQAiaT68689k3IKCDI249itDisFGrdQsvxBWFdLEdFIZ
         hTbGr9I7p4P96ZAqsDPdNl5Gaj0IEAJyKGtPMCdI2fXQu6Hu1X5IiHqvCgdlN4ctAmXz
         TS7TW1WQRS8+6vM8x0UnWstP6TiODSpvYoNfMmLjprN1fqNesLZhGYz0SoZs7meBVRB9
         iLidGpY/CTs7GNkova82/2K6+yydVB6cN8kYCZtcTkSNRbecYOcFD3h6RcqbVHK3z2r/
         kJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067779; x=1749672579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+9cioOEbudhepUywjfVI9ITBQV/u+Nkg6uYOHe/678=;
        b=Ue5fdF8M6AEKEcuF0Fvybo+VEP3TfcGKxfe6teUXNB78ahtxrddIr8hsuhsc48+xRA
         tR3e3SiqoFoECysOLdLCLD5UO9R0/ULHRvigjPuePxn0W1ZqiHAoYWt9wVuwTe6GhXAr
         AloY9Q/+VG27tzGjFxpEjxQonLbTtOdBaPcqrTGhOPnpyaFm6+rXsMcCPrjIXXpgDH7i
         exgi8S6C0gy/H66c5wCKrTXcNgrF3qQR6lVQ2oCbM+hPiD5q8LlE3gu2XzYbr41paeht
         icf1htL08sRW/L4YdtQwRPCXPdDU2aSGGteRtRQtQlHonazWctTnKxEowZE3sGZXEUPH
         PM6A==
X-Forwarded-Encrypted: i=1; AJvYcCX8Xja9xTn881GL7rmyEJVe0bqbJFyZ/yFy28VaR1YRh21ffE8IZVLS35c79WMpfPRk+zIUYVwwPr+U8ebVc6BD@lists.infradead.org
X-Gm-Message-State: AOJu0YyXGgJ/c+FsFtnMsJdqxCVAW5twFFTGIHXL7XvdeU1FsDYD/quo
	B6Zr5OQiQh2Z2EJf5nGs+20+IrijSDneC+SXcO0r6r0RiLKrMQZa/bnLKRIP3GuoCgdIPbJnEeg
	XBR/lACwVT2JfYclz0BKVmH5lEYm6V1ZvaLHzK2T9mg==
X-Gm-Gg: ASbGncuBJ1vlv9FUYPmuL2Hf2LJtu46a92izooPMvzV760fZCT0srWFVNyKeX64Ug7l
	hrGWUeGi4+W9VySQFtErxBcFSgytAxyOFrAhyKZRM8MMGxJZyjQ9wqioMu2VS4n+JygupeU7bMh
	2ZAonnOigROBC3dCiY/DoWJwvl6zQ3QWSewA==
X-Google-Smtp-Source: AGHT+IFfyHVpl5KOssQDfj1VF9PKEb6eRaVwPXBHdJuglfUTXJlEBLRN4J2v8X9ZotLnlmipHWNU4MoJGSrUZ7zPwjA=
X-Received: by 2002:a05:690c:4b8a:b0:70c:a854:8384 with SMTP id
 00721157ae682-710d9df47fbmr63637507b3.11.1749067779039; Wed, 04 Jun 2025
 13:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi> <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
 <CAFEAcA-JrS0BiT66iin-pRVFadrY-pnJZ8TkDNxcjErknSCnUA@mail.gmail.com>
 <CAL_JsqL7x53an2-MaLHP5tfVXb4JxT8ORUMaA8pL-gMsWLJqkA@mail.gmail.com>
 <aD/0tuak7Hja8k4g@lpieralisi> <878qm7ec19.wl-maz@kernel.org> <aEB10JC1bwwOJfWh@lpieralisi>
In-Reply-To: <aEB10JC1bwwOJfWh@lpieralisi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Jun 2025 21:09:27 +0100
X-Gm-Features: AX0GCFumJ6vnRiYJlX3zD1JbrCnyiM_8nPMgYGa3ClGdrZqd-3fF2TLHNRUNxvs
Message-ID: <CAFEAcA9xBJiRQ+UMvyOSOqOwMPYrjja0Vhk8j4_0V7f7_0ETtg@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, andre.przywara@arm.com, Arnd Bergmann <arnd@arndb.de>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_130940_646746_CE8BFC61 
X-CRM114-Status: GOOD (  21.05  )
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

On Wed, 4 Jun 2025 at 17:35, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> Can I ask again what:
>
> status = "disabled"
> secure-status = "okay"
>
> for a device means in practice in the current bindings ?

From software's point of view, it means "if you're NonSecure,
ignore this; if you're Secure, feel free to use it".
From the point of view of something creating this DT node,
the usual reason for setting up a node like that is that the
device is only present in the Secure memory map, not the NS one;
so marking it that way lets you tell the S firmware where the
device is and also tell the NS kernel to ignore it so it doesn't
try to probe for the device and fall over when it gets an exception.

> When I said "a separate problem", I meant that, extending secure- tag
> (that applies to the "status" property only) to cover other PASes is
> independent from the GICv5 binding *if* we define, for a single DT an eg
> IRS device per-PAS (with realm-status, root-status, describing what the
> reg property represents. Is that what secure-status does today ? Does
> it say "this device MMIO space is secure-only" ?).
>
> It does not look like there is much appetite for tagging the reg
> property either and making it GICv5 specific is a shortcut IMO.

I think something GICv5 specific is not unreasonable.
secure.txt is careful to define the general principles of
how the naming scheme works but then to restrict it only to the
specific cases that we've blessed as OK. I think that's worked
pretty well -- it's fitted the needs we have and the GICv5 is
only the second time in a decade we've had to revisit and say
"we also want XYZ" (the first being /secure-chosen/stdout-path,
in 2018). I think that's a pretty decent track record. In
adding whatever we want to do for GICv5, I agree with Rob
that we don't want to accidentally open the door for more
general use of secure-reg or whatever on other random devices.

thanks
-- PMM

