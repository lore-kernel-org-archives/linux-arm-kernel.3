Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE01F47CDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=; b=cN0LiWZ2+fn0DVRY9YSd8BwwQP
	ts9/vRh8m3Yvk/7C4oHbySZc15a/g3mMjtkVG2FCrmvpSf4/zyTRQK2AjM7jT267BIxOKAOSHDFrb
	Jwp1KrOkl1WDc4DoYQv3BnOTCWQVA0mMjkkkfhOrEryMRsWl3aQgPbRjhG5+wHeuabwv/mIOxOKuN
	mDwn6AlTMReKSqffiw/bJB5q3HmXrF1mAKDSIovgpZUsRP004hyI/qSPOsimvBSlJhzgdQGAzQQzT
	/rw1VIh15x5sO//kWL/uNL/ucN0VwA605ctbu867JPbsqYUS7krJ0GFGUMyNJp0JwTcB53OYm5oyg
	jjxahskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyG9V-00000002a4j-2ZYD;
	Thu, 05 Mar 2026 21:22:37 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyG9T-00000002a4Q-0wJR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:22:36 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-79852e01cd1so3881197b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:22:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772745754; cv=none;
        d=google.com; s=arc-20240605;
        b=YmBuKVlD00MZl15uqAc5pqigc2+gxji1pukJ75dRDGZPbI/t+U6hKdO9lYKz9sObAL
         BJrZpPuYpTgmbYPgBNRG4SCq6y0mQj1/ax1Y2gJcST3UAWqh+pGiXON1aZCjylwpg9eQ
         kuNfbqOhNqsnI7TdKSJB8c/tdERMTWcquwd6yJRPAcGwR6l6iqhonk81l/+8BLJ7gcDd
         i6+fcsR3c8ZXvmbdvYKtjbYiulaqOstSwHbI66P8nF5wMwIkyT9uGLFwxR9iAzLoJ3f4
         2Og9gJb9lFItW4Wkh17lD+s6KHOsAVJSnTJXMjwPe+SJJPuflntA7TQaahCVelnZpeTD
         4AKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
        fh=snjRL1bBpSg9bpXGK+j8O5RZEp1TKa8LQSr9rB1pfw4=;
        b=PkQSp2/AE8v0rhWul+R/V2rGhWIOra+FS4xrgmc8UCHcWvkDk1yInrL1MouudGlmND
         woIupoC7jRC4sXDRbgCIVyWSCCdaxwNCix6glT5PVGkxj53T7xoSCNipFXS2t1cl9X8W
         h6uu1JhltPlm44MxsYfuojo0gxyhCrYtBxMomV/sBklIKBm0sImu/KMLIBJ4Ce10Yn41
         0eUqJjCOk0QwvuETTCUbikjxoNckNUZMdE8PjJ3/26/PqPHllNKMQM6eK9hcAH3RG/tH
         oqWvmtfIRBgWJbrXFQXS5A5Ppq/mc7MMVZt+/ymao3RKdWW7jRxuLspHgscsI5xz/BAk
         wDeA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772745754; x=1773350554; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
        b=Ykto2nGMcMolNknnB/TldNg8Y+4NdgYdB6hTTmVLm2UYLh2qiKN6dWVdEdRpgDAxNs
         5J+2DZikiHHgEAKbR6pUNyON9NUrG8uXc1MSPyQjKE16NA921Cy2hH1R66uUhepOcC7e
         9IEGfwP3lwlDpxn/yIWEyjIrDJgKq9ytFaqUO9O48x+ExfJBnwhzV7xKpPl4vfIVs6Tw
         yhy8Q/56hmJ8GLv35fap7C5NjiBhz/y9ddElzbOsbOWybef2dxAcb0+7gFcV2DOxMPwN
         Jyyrcf3nsMxQzE9ztS6w5wYm0GXUZRpCj1ZVupg4u2aesEMshUMg3w8HAL1aAN01MtW3
         XksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772745754; x=1773350554;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
        b=cvhE++8zz7V3HzZEtL2otD9x+Bj7HrEFm8gDKNQFeMu1iIwEZ8nxrrb7+eA4494Ajz
         CP0vd8k3oN4ojld6EQJiAE1zQoxYWipejSnVrXcpcSquY/GZxei4YnOthwhZr9xVzeRR
         6WmqFEgNyDd68MhjBg8VFdh9d6zznFnO0+HAbY+s6YA/BzsB0K7ntdWRFLWEXuQ6GyEb
         f1nX0KDtEdycGqVEFQEaTLDbcVdf5XJirecPgelz0XEcw86yhrjfMgnh6oag2RF3+8RD
         ntVJDoQ7w381Xo5j4HxiGzqt48g99bp1qdYDVjdm3BDI41ayQ204sCjsLo6fWtoo5568
         g+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmCMo/ySi5csWc7lRE38V199mlmUax5aiYj0f8A8q9+8i5EDuCniKTH72zB5AYyzzXOqMYF2oShaoVcA+feM32@lists.infradead.org
X-Gm-Message-State: AOJu0YwUn7j8nY7SedcQoXY/69C9rr2QvTvEugq0T5sJ/RKoy/s4g9iI
	Uu+BPNlsKWrcPxQvyGVq6vqnch7jpnHgtMA95EGunvUmPefPL3ip4FQBFKqK9tGmpiSeUFnil8J
	dMlNuIvr6eF+Rbtfre5kf2ybOIX3qGsE=
X-Gm-Gg: ATEYQzyAO2lDuA7r9Z/PfYQnuoQzv1xC9BXlAo5his90mhupFpUqp9gikRm9CZ/VcNg
	jbXu2B5dh8M5Ft8kt8N3zaAufkLahe4ZpCaHmZOmC3oMndXYPTOZts/x+olsN3kuIkrzSZEgkKI
	q4bezqQWMnpq9qdCBs1yOx1YKA2SkO5twO8BcuYgehgYub2T/bFllP/ZJW+rE7WhWaOu0fCI129
	QntjpOJW+hqHIus/J7uUWg8g5TaoqGDP4F+M+oDruwtm66S7yezB5y+QeMJN4cAocn9xsMwx3jQ
	fMXnrz9+
X-Received: by 2002:a05:690c:385:b0:794:2fca:81a with SMTP id
 00721157ae682-798c6cdffacmr55975367b3.8.1772745753906; Thu, 05 Mar 2026
 13:22:33 -0800 (PST)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 6 Mar 2026 06:22:32 +0900
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 6 Mar 2026 06:22:32 +0900
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <aanievpHCv0Sz3Bf@wieczorr-mobl1.localdomain>
References: <cover.1770232424.git.m.wieczorretman@pm.me> <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me>
 <CAPAsAGxpHBqzppoKCrqvH0mfhEn6p0aEHR30ZifB3uv81v68EA@mail.gmail.com> <aanievpHCv0Sz3Bf@wieczorr-mobl1.localdomain>
MIME-Version: 1.0
Date: Fri, 6 Mar 2026 06:22:32 +0900
X-Gm-Features: AaiRm539DykMmBy-Zg-BtYOlfUPQKOJ6bwMQcvFff9WH9ZMuhoRcwF9c8D83p3A
Message-ID: <CAPAsAGyiukChPLYO_tQci-7Bvmnnxh+w=bO6eUYLrO3RVuUThw@mail.gmail.com>
Subject: Re: [PATCH v10 01/13] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Samuel Holland <samuel.holland@sifive.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, workflows@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_132235_291822_8578534A 
X-CRM114-Status: UNSURE (   5.24  )
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

Maciej Wieczor-Retman <m.wieczorretman@pm.me> writes:

> Thanks, that looks really neat! I should've thought of that instead of making
> separate arch versions :)
>
> Do you want me to attach the code you posted here to this patchset or do you
> intend to post it yourself?

I think you can just squash my diff into the subject patch.

