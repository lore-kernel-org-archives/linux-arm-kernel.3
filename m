Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C15DC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 18:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5ssgy8v1nToduf2dudMHLP7F3zMv+EGGsLhk51SR5k=; b=XbuKa5fbIroVZ1SbxJMGbW44jl
	lqNz3PQOOLTb1BvmklJRQZB2RnJIHwoGrY4wmjWEmBySyUWmP3HpMkn8Tfrx1cQ0I4h0KZB4UauYd
	nSytsVOLAw09C4mpWC/gVraf8BuAqJAz1ejnV5RYpfMt1TphZ4Jg8ZUPFLBurL0S8G2GF+hcCzpTZ
	oJD/ICHrSsX4m7gpsoL0Pw2o/5g1POw89BZxdrHy7VDdjgbA7BZNU0bvImF0P7NsLBGRAZk3K+oOf
	StNw7KYDQgDqpKAEVZCE/Jth/3p0FNzKEBoETiYoSKAoVkCF0TK0Tfnv/3z9zfk9KBE35E4auhQgd
	+KrH6VAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmbJ4-0000000CXWL-2X4x;
	Wed, 22 Jul 2026 18:04:34 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmbJ2-0000000CXVW-1bBL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 18:04:33 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-51c01c79467so14471cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 11:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784743471; cv=none;
        d=google.com; s=arc-20260327;
        b=nh7SyOtqflHZ758GkHzAdSLIUZ03W/XJSAwBdYRC21/tDvikDR4c+5//gC6YwzSWGT
         Ybx/ZLU/5dqgLeDrSkYYRD6rzGckIywfrmno6kbdNW3mj5qcS8/Z3ekJcJAbaVxFP9DX
         iN+VHvDDCu7oZgx1cXgxjzHO5UMuVBtCvpajSSi5fxh6Fa2+Iwg0Uo7s6Phn8ekpVNyE
         UywCZIa2vl1vnT23g1BR5ZSEPsGeC6LexRktbqPITXuEY99rMxbkM3diObuIfgYiqQJC
         zv3AAUVLEfFsFHt72A9JsrhK7d77VQL7NycOZuPybJf006+Hse1h4eK1AWOWd8uFSDDZ
         asXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+5ssgy8v1nToduf2dudMHLP7F3zMv+EGGsLhk51SR5k=;
        fh=sWA0r7pwBnAIIwh6lhOu3L5CURv6JHeOW2TfOX0Q55U=;
        b=CGiUN+8h4XfVbWrhbL2rdFDgZCBLmt7yqBHJVtxMa4IUd/b5sIBwHAimBy+6mJoyWC
         rMrJWB1Q8F7Lhh6U9XqZlLZkFq6pIeP/oIhmIGTiF9hyZepz+xsH8DB7A7WkcQUA8MAK
         5Pwk8kSLAEjhM8K7RoZ5gERw+EjvyLZ44PRbPrMmYX3bQd+ZoGL7p9i9CM5J2MG117Sm
         8LZ1IFfuuG106Fi11PzpfVKqrtQ8z2rlmZbL7i3SSaCai8kf5UFNUbJuUr3WPGNIpsfG
         GjoblO7jY7t72lsBFKQbe0dWtVk0wfyevIeLymzcBQAnWXQqVGfGfz6N+TmG3tJSwpUb
         la4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784743471; x=1785348271; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5ssgy8v1nToduf2dudMHLP7F3zMv+EGGsLhk51SR5k=;
        b=DneW3YhcBoKZKg/zxyGopucVu9/o14sZnDNdWvgwbYrqYZaFzYWUjincLMMXiCrAWD
         L9uTMyQ4GdTG4yK+POEYbF4oKlhoxLZxqAIBsX+5ZIMjlN0G3tLx1gmn01N+EADcSoN2
         vTgCHLrpF2QVSvFjmbJ8VtwGmSljRcdA3HYhb7OF2wYyu4OKUsbCAeCUph9cGCfh0ti9
         O+Gs8BIKdCxHYBSTaq+09i3dMD/s4HGYzvRsDxAr+FF0w4C/WFEo6NCmJuCErYqY3chN
         rypvk+j8jw9hc0E99syP0nrpkc9s6lIFwh3k3ac6P6CW9+3Q+40DOa9hBO4mIU2UjiaE
         mRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784743471; x=1785348271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5ssgy8v1nToduf2dudMHLP7F3zMv+EGGsLhk51SR5k=;
        b=sqY/Hw4lwGwkJIC4akMKUxAEO90mRRVLmNqORocU3Ajk6nImXRJDI+mcdScghQktyI
         soJVWffVggKRD+taOnlCfciBHdd7jV4uPpgkNnQiKt3b9mtoOoGd5VtX6N+ptfn2uKJ1
         qoHWI/HP1pEXeSz6yPXjurz8Oe/lVW2O1Jd2imWPst+ZvBUwtfT/hecAiUon2NrrNcdn
         GWlhIPXmh6WUxa40FPFi1U1KtmTky7bVvjNHuSKI8/EFacnSTJ0sJFbcfZVUzKqIqXIc
         A0MGjZeduL1T5NlJGVbI62CzV5EcuCdzEzdxY64UcdefvAat11srilVOWDz2wQoiAQp+
         Ap3w==
X-Forwarded-Encrypted: i=1; AHgh+Rpr9WAaY+UhBKweBIDVCHfthHF0I/Ok9cE+h5pbOF/R3zi3vo5vK94/S9DT5h/CpTI/OQ/3wWWsRr6novjBA1m1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw+29IM/BT7TxdZNtzOLx+bne8Q5L3LAdRIR3OJvpDXcmqV0BV
	b3iNHQJFPuheBrl3tpeL99oV57LIaF0kXOYhIImm705l7rWyZILGWAPutb+m0YxRi/NPiBmRdoc
	rUv7QaKkdkF6O6BqyqaN2cpI+2oRRrJkRO7bWG7Rq
X-Gm-Gg: AR+sD12CZqtCWEpMzFbH60CBV2R/HRRPkBqtUtqgKts7X6/AhMLKAr8vGce3ERVeDgQ
	CtV4hgTO5qahNB1c68Fx8mSbxqgPe+OIiHQCW88inJBe9KT7VJHRgTWv/0akRRP2xe+aywk28m8
	duv3IM3pZePuCyLRna1t5ohRL0wIlLAp/9UGlNq5iw2VXAppgr0C0VlmkX8ZwULRwAy2D+BVOgm
	OgSFrAyYZAxdXWnlMJzx01ETdtGFOHpakI+95imzsjTKVPV2p9U++TwxVw=
X-Received: by 2002:ac8:43cb:0:b0:51c:935d:8d74 with SMTP id
 d75a77b69052e-5283be3e9d4mr374341cf.9.1784743470255; Wed, 22 Jul 2026
 11:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com> <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com>
In-Reply-To: <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 22 Jul 2026 11:03:53 -0700
X-Gm-Features: AUfX_mwbxqkU-iAMaiWQ1yNey3EgrzgXznb4NhUQjYMjtNDBUtwxFYY_8mI2M90
Message-ID: <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_110432_427996_3C371FA0 
X-CRM114-Status: GOOD (  11.15  )
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

On Wed, Jul 22, 2026 at 10:47=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> =
wrote:
>
> I think the issue might be a parameter mismatch: in C, the pointer is
> declared as taking a parameter `void (*)(void __iomem *)`, but in assembl=
y
> `imx6_suspend` has no parameters, so Clang generates two different hashes
> for them?

As long as the C prototype for the assembly function matches the
function pointer type, the hashes should also match. Can you dump the
hash prefix from the OCRAM and compare it to the disassembly of the
call site?

Sami

