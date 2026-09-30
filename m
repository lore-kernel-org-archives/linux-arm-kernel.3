Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECC8CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K+xd8PsGh7vgGlDpxABMwFI7ScYfqAlOP+8fqZEkAUM=; b=4YjpW7feuoHfWa
	VJOXQN5UEAKgRCZ7nNSttJBpC0UaHMIHedcuw7S/OtgKGGVjnRnYNoXl3rPAH9WtTOme9mQnUOJHf
	R4/hWrbED+9RNc2VjB4JFCIuLcx0BIZllRnt/a4eFBHD3oWGz5fbMQR4jYEnsLDOCEmWdTJPG3QIY
	r/C3GkNrIfXYpO6ckHWjwXOhvlLxxEgUc19WTmon4Oz9dwXrxDITjenlA7z8pSoIfNHP/t0NVxJBy
	WOIDrjbrFGhAIYghT7JIZnjrwn/UWI13JuxPTnHoIANN6hW5GsrIKoIwnsKOe7KNmqpp7IQjVq8oA
	Oi4mpGV+2uyOTzdvoxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Pb-00000007Dgb-1W59;
	Wed, 30 Sep 2026 21:00:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Pa-00000007DgS-1Lww
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:00:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 16CA0417D1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04801F0089B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790802022;
	bh=K+xd8PsGh7vgGlDpxABMwFI7ScYfqAlOP+8fqZEkAUM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZrmGMKEwAFYFJ6Bzh4Vz8fnUoOv9JiyZJzqwp1fnYiYNSdXlLw/WhqketgUM8tv47
	 i5lMQjDAGk2/9iO1S4YziDHqiSqbgaJ6J/yeT/XP5A8j7FlKonf6tHudvIKnjIHjcL
	 zpemFUrwSUpe+L0CVBhFEh3W5ychpk9B1YddxaYtxC+QHVaAFjKJx8HxHa6lbqFsjj
	 6raaekgmOL6EMHN1F6nBicH6NaM8G+ZtcZzT8AU1YCpGlDeapOsbYnmV/fXLdCXztM
	 0BnZukWtxpaPqpgi20H/bksWTQyKflIW/uaL3KJDbpiiY/PpCpYkeYuMMi3mGPWxbo
	 XYKqZyj2OqWXw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba4415869aso65538e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:00:21 -0700 (PDT)
X-Gm-Message-State: AFq9FYLBYvzyu5lJiGtKfJtMNsIkiCjPG8lTUSKE0FnBVpgX/IKAU3zQ
	2gE27cOMxZYcUqyL0LneTDJC1blBaAg1C1Ik2KvjhKPJN/C8W/gVk+tFaKFudo2e0GolMxISnEC
	90gOoNT0VYwHi7BAVGks2zDffFCJI+50=
X-Received: by 2002:a05:6512:3986:b0:5b8:c160:e3ca with SMTP id
 2adb3069b0e04-5ba405e1793mr1109566e87.13.1790802020776; Wed, 30 Sep 2026
 14:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-10-will@kernel.org>
In-Reply-To: <20260918161407.2300-10-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:00:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLnwaOcUgkc0hg1237w4HZ3pW5ejvWq_77GgDqKn07K4nw@mail.gmail.com>
X-Gm-Features: AclHuK-hEnRRhnMkXgdY-FOaLdv1L_6t2b0wI082mHofCadQfsZ8d0A6HHRhNBY
Message-ID: <CAD++jLnwaOcUgkc0hg1237w4HZ3pW5ejvWq_77GgDqKn07K4nw@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] arm64: stackprotector: Re-enable per-task stackprotector
To: Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> Now that 'current' resides in TPIDRRO_EL0, update the per-task
> stackprotector compiler invocation to use the new register.
>
> Note that this requires a very recent build of clang [1], as (unlike
> GCC), it historically rejected all registers other than SP_EL0.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Link: https://github.com/llvm/llvm-project/pull/188054 [1]
> Signed-off-by: Will Deacon <will@kernel.org>

I get why you need to do this now.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

