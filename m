Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0B6C5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 23:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=; b=pdU1gUXsJQMJGZDcy3MJvqYjb8
	H8XiFAfzzA9kpfiUGD6Tv1GFgifsV9jXAehpUwxiwbckdjHHUrUjruI1RoBu/u9I8Y9pUQMORy0Hk
	kF042fs8cixYqXOxmXcez58Yg2Ge48lkIGAVl8bzrIY1x5VeGjJv19xpuGz697c+qYeQl5dmdgUyB
	WQmjszQey++8gwDemcObqXcoEAxTv7gVSbi4UgZmDMmkOqZJ7tJG0Sd627fjpL0AhOoUgTuQDXlJP
	5WlqgnEVDeaEINSvOFgyGB8xsunbvOSnSSCyaN7wE28zoaKObehf6GP7YnjU3kGM4Vnz2+CFLEcca
	f7x0YGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTsj-00000008rsD-2ONO;
	Fri, 07 Aug 2026 23:21:41 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTsg-00000008rri-0Ofw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 23:21:39 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84eb072307dso12165b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 16:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786144897; cv=none;
        d=google.com; s=arc-20260327;
        b=eUWVGXA5eJ9mDYgxgl6Tnn6fyhV92ko1VQh7Se/uO+Se6EjXJ9GvSKYommZtMIEr1M
         OzHCESYQxYcmhtJJ4nG8rfhROsJ0lvTqrWjqfYoB20iuHjWdo5i4Jinp//WJXnWdxe+l
         GTjU3G1bimHByR6EyTNjUup8QTTNiWJso7gj21Tz9taJZQoD/UMqMNERYXwl6Y2qb4eb
         0Bzj+By114w9JT4Yni/SJHIeJjnEGHfmnAOAZfJOoJ3dA3GeLWHfUhv+RVuVkH7zOD4Z
         TTmpBpDmjVzLlaGPckYv5sFsR74jNg+DFqzyF/zNpfTHh4jgooiEu9SD53v+tJnUdhy/
         w/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
        fh=+4X2LK2ONo00ehYT0r69fLu6PJOLWVMwOLMiUHblhl0=;
        b=GY0iNSYYZ4MiLK9vxIt2etWVxB52dRVxCy7tkKWs3Ek5IDBBOXsvQ3JUYVrhzdsQp+
         Pshwdy0gkvOL5XNn2xd6UuDKikxdUiCFmniFQRJY1619jBRWoS/d4zZF3CToJjZudjjV
         euiERBUrrbn8uFxzRyKHsFoyYIIay9XJ7HM4TCJmYmwqEbMBd6XrPxBKtCnDJxkc1HuU
         OOVdHs3Mxg88fXinACJWq7BJqmBXhPS3hbwHOAFHuvjFhSGQZTflgIf4vVyzUdWWRk8g
         KAROSCW+vjqfPeJkKSIrJ5MfQealsNifKm3zsBV/7ur1mJHoOhc4PwlUNzMJrf0IuZd2
         IFzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786144897; x=1786749697; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
        b=N929csVCvn7o1boLu010bnjxWfHh06TEhUV0cNuOT0dsjWO+agxhiHW470LcQ4BMH0
         aoktSczRh9iI+HUylMBEUwk7w7AQNgllS5T0p5p/+FGOcitJxTTjV6aPOnqfPO2uNh5d
         b+Dda5sRig1TuDTAPP67YCU9wOc4Eb4Q3N9hUHASD50Tt8kbEJvBNCbYl3oMG43OJpgP
         Kuu9Rgul24swohVngyIQpx9v4+KOIBxzMDIXTSqyKjJhqJQTg6id364v6iHxl8hg3Kk7
         ChMtVy52DGqq88YkwhMZZw9fBdZvYWipkXeuOLyz3fXPnFUNL7SdAkgNmEQsPkIfNBFl
         acGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786144897; x=1786749697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
        b=pJRVsNzsYvtFdbDcYneeoD+p5bXmn3LHflLGzb3XrV3OLULqTg3KkY+ftBi6AT0xDT
         8Vusrn2qXMTwhivgHj7Oj6xCLVk4TVSNLFwarfQPVvslQS1qcDPqrElhD9RsPc+392VO
         pnvbggckxOESt+Qhk88d9FgcIF9tJgdNHVXP9BXf6bv4e3SNlY4Gy5Ie6l2m7WELHiX6
         ZRnCPOaghNAVcvpk9MeUBTJBUaY0m45SrAMf3oF1LSFdttSg2w4+IPiMXSjMF5q2Zr+Z
         orZtduqOsw05efGa9jAdInRTr7TWKZx7fU4KtDmDEc/bleSdC9hdRu36B8thUt0efenJ
         TJBg==
X-Forwarded-Encrypted: i=1; AHgh+RrAaK0AdsxzSc8CtAnBahGh/bNVieiXfWuIkBmKfQkr9D2+XEJvO3wSjibqbnaEhGwa3yC1Rd9GgbzYdSqJBZN8@lists.infradead.org
X-Gm-Message-State: AOJu0YzqIAXiGdrCCIyqUu21IMMB+JYbvfCsWxzdqOVPH8P5cBgtwV28
	qGi3f7uQYR0l4PoBr33zKhzWhIqlbuSIqPx+zyzmuhjkF72pYlgru5N/2YWD/JNddkY9INI4nW+
	Ro4M3maJ/2CTjbEyAfRijnhoJwsp6NhE=
X-Gm-Gg: AR+sD11fxYP3GQ+pQYhHouFqbJsiI7w0SS4FpaRvd6/Jb6xe+z74ML8iN8UmTEOWTdo
	IlvFNDPxhTifLenqUSxGuU2u0PPQdlCORRShVvpe+8xd3Ur000ZRTGehR8VUr9AOHPqfww8T229
	x306FJEehtCoOh0wYQCdP8TknHi2QEy7xYLBvOEy9GVCA3NKD4JTdgDl0QzhUDbxJusle13JUdk
	JT01pKK+wXYC/wF+Pe91d3p3jMvyXSyziSOWsAUa9Yd3vjDQ74bhIy9MzzT8YB06DU9pDEVMmeG
	sgWDZCijABzWWKqpkKaFDMYaf9MWdzVDTwC9vecArtFkAXQTYbJMeW4rDeMTyLOAxy08qSURJET
	LxltNOFcW/JbHHhdS/gWTgjsLzSF1mPjqrLkLsJIqFmJB/Uzsoc6x6MIsmE1/
X-Received: by 2002:a05:6a20:2589:b0:3bf:99ea:aeb2 with SMTP id
 adf61e73a8af0-3cb8646fe2bmr20610739637.4.1786144897090; Fri, 07 Aug 2026
 16:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260807221429.155946-1-ojeda@kernel.org> <20260808.074341.1056015191905819805.tomo@flapping.org>
In-Reply-To: <20260808.074341.1056015191905819805.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Aug 2026 01:21:23 +0200
X-Gm-Features: AUfX_mzt6ITrqPgmG06xYNP1noGEoKAQULArIyU1uaz5hrUcXcfHz6eFuH5RVl8
Message-ID: <CANiq72n4=fz=JNKY0Jdm8BnLa=RmHB2B7s0bO47YTJ7hygqBZg@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: fix `dead_code` warning in `warn_on!`
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, arnd@arndb.de, krzk@kernel.org, 
	alexandre.belloni@bootlin.com, linusw@kernel.org, chenhuacai@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fustini@kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, kernel@xen0n.name, 
	loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_162138_136522_1AF20660 
X-CRM114-Status: UNSURE (   8.10  )
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

On Sat, Aug 8, 2026 at 12:43=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> I sent a fix for this bug a few days ago:
>
> https://lore.kernel.org/all/20260801024841.786664-1-tomo@flapping.org/

Ah, right, sorry! I also saw another one with `rusttest` for arm64 and
riscv64. Did you see that one? We probably need a `cfg(testlib)`
split.

Cheers,
Miguel

