Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A24E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLDfF6DLkAmhFafk0UNWf4nDRiuWWXkbwy0Q4hCTIFk=; b=soN3tATcbKJdE6+pcRwfWia2Zo
	g0VOlxaG3xu5Azy8emW7n778sFETfBpg0Ou4mOfNUw1XEC71nvP07UxcPhdqXPoIGHS++S5Sb4DFY
	PxvGV6nnlzs+1FZn3OrQKJsU9FIHjC3S4AmrtxPBtxQTPFcwSKrFxZjbnqEMcO4fRli2c0+xcQlEL
	B63Sfeni8UbHMwvLEcXm4EmZm148U7jWhK57Z+ZpRIhlk+lVq/NpswdeAGQnw4lVCGru/IUzLsbzl
	oICkBBoaBdnymTRoDytITHz7jBF/fmccHKSpNjS6X1FBicHzMoIXVvPo6Ef+111QYDoxcbfB3ROJu
	cnLzw1cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNAc-0000000F3CN-2ikP;
	Wed, 11 Dec 2024 13:54:30 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLN9Y-0000000F2zK-2zwl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 13:53:26 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-540215984f0so3039273e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 05:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733925202; x=1734530002; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLDfF6DLkAmhFafk0UNWf4nDRiuWWXkbwy0Q4hCTIFk=;
        b=lra9SplipG9b3oyBYtPn6OK5VUQaMQvlx4PV8f6OFMLlNsAn59HkpzgSZnPijDD1mN
         N0wjq9hJxM354cYou/VDcIUHw4jJABKb4vP+5E7SkM9nTVA4y07EHVxc105q3lDtDFz7
         H1wqpoD8UQniuCt+UOWm3fJtXdVMTWjmdO0ENEr8L0IWA4Hj0O5d+MWJb0lXsX+ifAS2
         gWTJiAamtDzLsTVDzCRwTsoBGtEJxTO2pKQo2GCm2VR8ndDMVOHTX6Kz45roYCxPu94R
         bG2XVwhIBYAWDUmtgUhF6NNx3fLbTUESNiDa8QIIfzn8F0PeZ64Ajl/kwE9LdF6d+98X
         vggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925202; x=1734530002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLDfF6DLkAmhFafk0UNWf4nDRiuWWXkbwy0Q4hCTIFk=;
        b=pt05lDFlhpy6gsQiB2P4bXAutra35/6RcyB1KpWXXZV6QUIcg/HJ7XdFIYd/K9fnkV
         qSMycVJ79PZzxKxZETaH8c8ACSjC1OH5BOSWS1NhF/Fw5tlNZZJrcbhhoMe5aEqfwDB4
         02Dy/g1vJ7qtJy0JXWTMnXXSwA98vyWWSNxlUbYbwKPt8ahA66vttvdrR2AyYn7sROBr
         2xPQODzd3s7/YhHDjG1CiVK+fkLIT/dlsde15RbkcUA0EBTJOyXCyBrSiaNl+i0JEVuR
         aZSQNzFPfJCN3fXeg1rtjL8fezTqnfWkvDu0R+F/F5VZpk3oAliyfVC2jntJTfdBXhfK
         GjBQ==
X-Gm-Message-State: AOJu0Yy7FCNg9K3L+3RiqSW6Evj5Ufnv542xSSdPoDut2YcgV+Vy1754
	Gb5x6Kn6YMT9hR8QG7DCDVzSXf7kgyBTVDVwKatsd3BiHPkN7T0LbmGXvP6l+iscJT7tL3wFb2H
	s4kEtO/N36i/tDBiAgh7Bwe2S9oOSWqcOBYT+3g==
X-Gm-Gg: ASbGncvnPEM37ueTQaZE4NVmVOZUvMbuAzjyMaTMHBi6svEVfYiD1IJZscGrCoELQuc
	8T1mu8yNXVme8FTpcocRIxBs6aCAC8o1m6g==
X-Google-Smtp-Source: AGHT+IFpSpr7Oj3qJ4QCRaMyoAXW3T3Mn4cdU1emXCSwCgqqhtbRU6US3c71ZX6xXcz95RXUg/DvJ1LdvBmYYHR+JRA=
X-Received: by 2002:a05:6512:3c85:b0:53e:1c3e:34 with SMTP id
 2adb3069b0e04-5402a6056a1mr984021e87.38.1733925202578; Wed, 11 Dec 2024
 05:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20241210160556.2341497-1-arnd@kernel.org> <20241210160556.2341497-5-arnd@kernel.org>
In-Reply-To: <20241210160556.2341497-5-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Dec 2024 14:53:11 +0100
Message-ID: <CACRpkdbsN9WNZ4Fo++FvK+2xxe6VF+66oaBgs4+o3oGUfW4OaA@mail.gmail.com>
Subject: Re: [PATCH 4/4] mm: drop HIGHPTE support altogether
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, 
	Ard Biesheuvel <ardb@kernel.org>, Clark Williams <clrkwllms@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>, 
	Russell King <linux@armlinux.org.uk>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_055324_743462_C759BE3B 
X-CRM114-Status: GOOD (  12.05  )
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

On Tue, Dec 10, 2024 at 5:06=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> With both x86 and arm having dropped CONFIG_HIGHPTE support, no
> architecture is left using it, so remove the remnants in common code.
>
> It is likely that further cleanups are possible in the page table
> code but those are not obvious from the config options.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Mapping PTEs in highmem makes no sense to me, it's better
that we try other solutions to move away from highmem use
altogether.

Yours,
Linus Walleij

