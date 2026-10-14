Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B8ECC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 20:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hvbv4h83/gh3e9PL4i/Jed17SUFA0/98By/JOQOBZh0=; b=OS+2cnes8hN1CxmpEi1Vyx/3+M
	kjflIUYUtkg8jPXCJzUFEXDbP06RkVmQN6nkcwfx7NGflHYpPHWpc0/35l0aH/PO35xEmQiN86KRg
	NhVHq62y5NfJTI8rZjaSuaZANdp+TPmnv7Z9j10O4Ark8GKVIRWob+mOWo3wySUs0Oyg0Lz9DyMuy
	ODNan0sA5uuEwWE35chDmdwzinraOULRVXtc/odNfvmWtUaAuOGlr43syM9X3GUFi79Syzrv6uguZ
	pXUeCFkilQLV94xCIVZDQHnGBcmILmKNMvmxA9SbQDpeSOkAfbx2N4tbaENhJke12tl90W9WQsvCp
	q2qJLIsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5lT-0000000GHVC-0UaT;
	Wed, 14 Oct 2026 20:39:55 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5lQ-0000000GHTy-3PDz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 20:39:54 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-91986c5cb75so8574746d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792010391; cv=none;
        d=google.com; s=arc-20260327;
        b=oZRDp0udgw98CieFZbsJpyv7N3K9R4MyiBo0U5fmR/3r44dNBtZ6TUWqyocXK8p+c0
         UK9EuDtITU2w+Ioe9xEBTGBabu/6NjPK4adzi8OyEPzBW4FvvZoBKYK8F7DxIZwpSXy/
         bz6G051Mo9DiR5jn3Rb95RhizOAspMvtGsjkytHzy4c3f1dfj5JouDI66DZe6jyYoxjr
         A3Lm/S+1BBMs5KRFUtwb9E0Ebp3d3N+xhZLYvOcX4GUar+4KaV/lh2JE338dib5wlX6J
         Ny+ItW5SnxBLXQ71IiQvXCa1yKLm85B4wrAuUsP2YeXZdnkr/tOzG3RJN3Tv4rtO+YMR
         N+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Hvbv4h83/gh3e9PL4i/Jed17SUFA0/98By/JOQOBZh0=;
        fh=BQ26inqxrhVXUZe0NpiS92Zm4FjXeUSoq96qn6OzGsk=;
        b=pkDSvJkHOturv4aSDd+uQWLKBkbgMlomaH2y4iOYwoFkitlG0F6CilKR4Cofzhefh8
         1UkXRESYZ/SVZTgPh5UZxQEajvMrnaVGfrBDZ2aLliJWR2PoNMeqNZhiJrb26uuOiSe1
         nG5kR94nyALu5eOdNki4ev4sermgVbRbRmyjC29eHhQzyvDo9svO0ESAFbUNoUMTI7lv
         JHqmR4IwnurlJKv2t2MhlqVHgYjTHlzYIr6zCb9WmHMw3GopkRFn5frXw50xaTUuPhhp
         w/SrLTumOPmm5tR1duwrWJJWQHtWVL5NjsWRCkD1ErXBXTZloGMj3zOaN2rawegSh/gO
         +yoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=genproof-com.20251104.gappssmtp.com; s=20251104; t=1792010391; x=1792615191; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hvbv4h83/gh3e9PL4i/Jed17SUFA0/98By/JOQOBZh0=;
        b=mAJYzC8wBULiwDaVXouqhQwe4u+uQ4+XwXjhTS3QUkpxI9NQOjBCrv5omFfx0ausR5
         sf9QGStuNv8cvfFUeuVzKgfdjrgbVrQbCnZ1JYGemUdwc2UJH/f/Ojt3UtOBq/Nalr/f
         H92vJ6eHDXPM/vfTh6/svTKhMYvf3ZlQwnZFSKpILJfpVH5M7Xs5mPHx67m2VapPb7pK
         N5RjgjeMUnjQP3K9YLhg0yGG59Q4k+FZOAV5zDJLkp4z4IbPv5jeSVseluyM7wrWXJp/
         pI/BUcvWls1MmVkuOMQdfHhRV0RIocuTecj5kjK5sGcepKuyCk4yFrrjl63yyi3dkEzr
         VcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792010391; x=1792615191;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hvbv4h83/gh3e9PL4i/Jed17SUFA0/98By/JOQOBZh0=;
        b=jyD4UztFNdgOuYyBEFxl5D4SjPlDJTy38+bsauzf+bHDMbNd1tCn3846KSvjwPquHZ
         y+S6dUVq7xJhFwim418hS4najJ+jmNdu37DJwWbUAQMaLFBOIKkeblduE/LyaHywbpbI
         G9D7HGfi4aqugocn4R6roMivWP85CNU+SrjXFWprlVKf5qNoPT2COQvuYm3fRB0y/Xo/
         KOnyh7zj6ZWovNhasDdmCvJRA6nVU09rOhv6zQpva3JEykJyiK097UzlTWhNDbEKgwJf
         4MCpL4+lW2QNvT1SOw4w19U85aGWLpyK4MOHxuNNXaLEP9M6G35FE1whrJWEHIzkpFyW
         emSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoo4CUWAVcflTqWQyBusCIJjLjhWo7l85VvMBn9Th0NirxKrlQGsw7FWTmgCSuKR7Mvtlijr1N4RP+WHRIJDBF@lists.infradead.org
X-Gm-Message-State: AFq9FYI8mf5SvwYfDN+QLGntGqYsyU0H2LV0BUjVm78pV9AyGOdChXyB
	GQVRdiARhjS6csv+ViLg8lg+DyAGvyVDck50A23pc+ZSh6ZLxgSDwv6H0Xi7qha5UH6PnsHN0D7
	nOwwhrUaZXn+RjsE7yVceojpy2nY4XrQ7veGqMr0X73nvHyutfnI2MNBFZAhEKOc/
X-Gm-Gg: AYBFou3UWH/KUqDgzA7CkGlZdK6vZn9yrptGt0/29OKeAh9esCnkBF+205XefVj9Drd
	LySgLBmxMIQ0JdVhNoEcGSEywYVgFbnAhG9GsfjofDNC9lMINu9Kl9wSNFnPw11lDdBJhjUXRhv
	52YqfYlod1uecsJ9FEoErExg5IfLcI9RrTJbS0R64g94iJ9eAzHqL2d+Ue5x5cgSi8cz7kpXHFU
	DAFY3DH+U0khPOSGDJ8ZVfD/ZgPU8cC77RyOPQGDIL2MJQ/NRRxw/BHTYcAyNaci7ZnKNzDNWJ8
	WrwzZiuk32QGf99bzB5oIjpDgvXtW8CA4772SvnzEkPI0iONGG5kI1wslPJVeEfMeVWDiSgG3Hi
	DPNv/XPjhtYKg
X-Received: by 2002:a05:6214:5082:b0:91b:80ac:66ea with SMTP id
 6a1803df08f44-91b80ac67d2mr172010016d6.24.1792010390916; Wed, 14 Oct 2026
 13:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20261014152604.323310-1-ebiggers@kernel.org>
In-Reply-To: <20261014152604.323310-1-ebiggers@kernel.org>
From: Vladimir Kukharenko <vladimir@genproof.com>
Date: Wed, 14 Oct 2026 22:39:39 +0200
X-Gm-Features: AclHuK9hyj4qEGknIGYgSBtc9GBfZkkTP8Pl6YErh1Uue02KgFYR-0JbdSeWHNE
Message-ID: <CABB2QaKKvuTFt5fHa6+=n3siom4TFYCqZ67bcHyHTrD+PogojA@mail.gmail.com>
Subject: Re: [PATCH 0/2] lib/crypto: Use size_t lengths for Poly1305 and ChaCha
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_133952_914001_F41782F4 
X-CRM114-Status: GOOD (  11.78  )
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

Hi Eric,

Sorry for not replying to your question on v1. I was already reworking
the series in that direction and should have told you.

Thanks for doing this. I tested your two patches with the lib/crypto
KUnit tests in QEMU on x86_64, i386, arm, arm64, powerpc64le, riscv64,
mips, mips64, s390x and UML, plus temporary tests with buffers over
2 GiB and 4 GiB. Everything passed, except for two things that fail the
same way without your patches: the POWER10 Poly1305 interrupt context
tests (I force-enabled that code, which depends on BROKEN), and two
Poly1305 tests that crash under QEMU with AVX2 because of a QEMU bug.

Tested-by: Vladimir Kukharenko <vladimir@genproof.com>

One gap remains on 32-bit arm and MIPS: the ChaCha assembly there
treats the length as signed, and size_t is 32 bits, so lengths of 2 GiB
or more are still handled incorrectly. On a Cortex-A7, which always
uses the scalar code, a 2 GiB + 4101 byte in-place chacha20_crypt()
changed only one byte.

As a suggestion, I've sent two small fixes on top of your series:

- arm: use unsigned conditions in chacha-scalar-core.S, and
  DIV_ROUND_UP_POW2() for the block count, since DIV_ROUND_UP() wraps
  above 0xffffffc0.
- MIPS: the partial block code also relies on the sign of the remaining
  length, so a small C chacha_crypt_arch() passes the assembly at most
  1 GiB at a time.

Feel free to fold them into your series or handle it differently.

Thanks,
Vladimir Kukharenko

