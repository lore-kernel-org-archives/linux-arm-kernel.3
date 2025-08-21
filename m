Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6FDCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzyta2RpwZZkPSoINkCs6FPoiQyGdt7Ek43OoHB8SWI=; b=ao2sLNWKspKGTmq5DeO7EUFVKl
	tOzkFiiQpEJrYHHrjgADruddIu7+f0iLtMIkWjnjj9SpvRzYThKcdw58O1O7+w9+GpDtSSv+CuWUA
	Y/6W9NjHZ9X9SWNE0HVUvgHuWO4wfZYSqgJjwu5fDIzcw0EJ3/V3rFv4ViBOy7ntbgug3MugbEkuJ
	Q6PuPxMGQ7LqJL/aA158M29F5/45mvmZ0GyxDlLqX+gMnKqQf8Cq940MjHcKs17tm+MDTRpaH2h5v
	e3MnGZxwVb+U0hcTMmIlrVVEfELGnabXlW1hBZE9lWpCBO2L5tRGgIfIGhltpulwYKAEdFJpI5rUK
	1K7lJ6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upF1r-00000000xrQ-2Kev;
	Thu, 21 Aug 2025 23:49:11 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8nb-0000000021O-095a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 17:10:04 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55ce5095c8fso1138360e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 10:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755796200; x=1756401000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzyta2RpwZZkPSoINkCs6FPoiQyGdt7Ek43OoHB8SWI=;
        b=zEKmTyXHl8tYVYOGRbrXrheZN25fqD4C27vPb8h5Iup9maTMUJbZFb9t+UkRzNpD5v
         447kaNg7BZTOOTZv+hirYaxOG3KZuxsaop/zM/bzqfuGpJnl7pbptNw47EMVeNSYljtX
         CaaR/w1D9Q3lI6XEdB17CeovpwpXBi89IR95pGOxtN+l09C7893ABPwtbJR7cvJ7E/Wg
         VVducf1Ty6FxTrBiz4Nf6AiQw1R5efNDdp+8sLmCYyohTJD7LuT67b3Z4FsgabYSMffo
         0mHSxdrkLZ8BSbONs29h22k9RTbLJ/tkWYtsY1qpQ8TlLVM0mkf3GQwUG/IVfZFXV2cg
         WO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755796200; x=1756401000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzyta2RpwZZkPSoINkCs6FPoiQyGdt7Ek43OoHB8SWI=;
        b=bjCT8a+hvFIBdSLFXOwBkd62134vNll1tLkpyb64O9xJWKlcXUp8T3/xBkozjZy5Hd
         xeaq8xCo7w0Mg3/PIGz9gu1QwObXVRViC6VPNgVOJoAuI5BGCXXJh4YMnXJnyU7eBTEj
         JvDGvD7hz0/FhpSSwB7m2Qho17h2IcClX4q5BKfTYBQM+CqOJ1fJuwd3UL4YiZoiP5/D
         GuPrecIp61X+kWxncdJA5Y+Wk6Vuebl8ZFhpw8JUTwlL6P3R1XbA/9anEIF4GDXrz3bc
         OLn+QABmjXHQTr0jXpX9e8wqziIP3z51i5QoqEqla/rIYruRq+8ClAktMZB+ZUrEbN1Z
         tLvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsqiWHKaZRNSx9PPmrmsA/c5GrqLDoXhwxDUNGz/AJu2tjitHZJrGr5174yCWgpwsBsYKCHFRfyt+J2rU2qjGN@lists.infradead.org
X-Gm-Message-State: AOJu0YzcsyoFlw0Rvj7EORgZYvPSMiuWk0O2LWT4FYF/IPqSv79A4R52
	0ExPSfk2LKKgtkgnNHi07dXMejOq+yblPJSNFhrjQTM6hUlcFneBhSNCM2Ue4xCzdWnkhSUQPFQ
	zQh0R3wWOxgxWCU4ZJcimnGI7RyOFeC+isjEt8eA=
X-Gm-Gg: ASbGnct/77GfIQl5qaJOMbfIq24sluQoQ4eU/3xKM2iffSKBUSLnFwrzFf7pZk1wn8i
	xMkz1dLdch4Go9YEj6QJB8G+/FoSl5vZsIdX7QuX/s8mkw3yODdktsZ1t0Hm34QXGLzfgwPVnhf
	S7iPTFZnrh2JI9XE9ubnHKf5NSD+SkXM5/aT3llVeJmd1E/tTLdnCZjns8vARG0RtB1nHibHL8+
	rDZJyP0oQJMkODKAXw5Lzrl6icB2/CEYQi4h98jwUI=
X-Google-Smtp-Source: AGHT+IGCtOn7tbH9t0p8srawhbiUJfL181nmv8fCMU5ZSgZahzHyg5r83rFQoVb5IzGafcrdKfDNDNBRg7nmKzntFD8=
X-Received: by 2002:a05:6512:3d87:b0:55c:d64e:f941 with SMTP id
 2adb3069b0e04-55f0ccefb10mr68135e87.1.1755796200079; Thu, 21 Aug 2025
 10:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
 <20250821-vdso-arm64-compat-bitsperlong-v1-1-700bcabe7732@linutronix.de>
In-Reply-To: <20250821-vdso-arm64-compat-bitsperlong-v1-1-700bcabe7732@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 21 Aug 2025 10:09:47 -0700
X-Gm-Features: Ac12FXzdv4nEar1SRFxGb-uqGlOF-O5VXp_mUrNfgvVnxfVbcoJVpWP9zgsBo4I
Message-ID: <CANDhNCqbZbhSLgvFYnzK0Fmu2qndQ-7qHwHmGtRcFwirgZvcEg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: uapi: Provide correct __BITS_PER_LONG for the
 compat vDSO
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_101003_077890_C7350A01 
X-CRM114-Status: GOOD (  12.33  )
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

On Thu, Aug 21, 2025 at 12:56=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> The generic vDSO library uses the UAPI headers. On arm64 __BITS_PER_LONG =
is
> always '64' even when used from the compat vDSO. In that case __GENMASK()
> does an illegal bitshift, invoking undefined behaviour.
>
> Change __BITS_PER_LONG to also work when used from the comapt vDSO.
> To not confuse real userspace, only do this when building the kernel.
>
> Reported-by: John Stultz <jstultz@google.com>
> Closes: https://lore.kernel.org/lkml/CANDhNCqvKOc9JgphQwr0eDyJiyG4oLFS9R8=
rSFvU0fpurrJFDg@mail.gmail.com/
> Fixes: cd3557a7618b ("vdso/gettimeofday: Add support for auxiliary clocks=
")
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Tested-by: John Stultz <jstultz@google.com>

Thank you so much for the quick fix!
-john

