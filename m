Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D96DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 10:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39d87he4w+nqhvnifbqZl/bqbaPjTdXMuZ/SdAklOjo=; b=3jo+uyS5L6607+FPy+hhjE3r/2
	OuFDdX6Ukap9MmiMN6k56WPXTd4L/bSqlRZ+pN+Ie7s0qfCLIHehWHqcra4T7Q87KMcf3YxdMh6+f
	faQSiTANwZ+tFgBE54cnghBqvcZGFTcCG60yRIM3qi3A8gvbao7cwHmZz0Bu4FfCi05Lmw9t7E6Wf
	i0QrA/UjQ2TLvFfzvkoN05S1qFcbGnc1gfATn6am0Q4CiwZ8eVJun3IXGk5//ZgzayjR4YDpBXtmy
	ccTWiqqgM3JMxbv25V9MieDOlHBSb+AL4JgZDXUx0V21v2L2BGd4H2fysAWtpT5UehWQHVDrhXrRg
	ji1lB9mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titFy-0000000EYKG-0sXE;
	Fri, 14 Feb 2025 10:49:14 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titEW-0000000EY9Q-2KSa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 10:47:45 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-6f7440444efso16505357b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 02:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739530063; x=1740134863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39d87he4w+nqhvnifbqZl/bqbaPjTdXMuZ/SdAklOjo=;
        b=Ya8CbAI51mUyEZiCcVsH6dzWo3mUc4JwvDLwulCgMFwsDDb2blzeMS26JJTjzJpyyU
         wN+aByn7L+Ox51pI5bf+OhC4xhTV3YiTTbyRnTtJe4yu4AzwM0CsnFRrg8oJbvf9FhcF
         0QER61jslNfdmtVAL4yQ8tHxag1Rv0OcPtufD5CyKdKM1soz696cTlMOV0C5oEeecF9b
         k4vR9I3vRs71jwwAzFpz5fyQxQRZNf1a+WtF+0Ks+/KuAk82kfI2QpY8ENPEWCga2GU6
         ULpUxiiJiuhHwVkH4LiX8F9uwvEtzH2JDGEgKPQQbaswL7pJXJ7fyrwvBt31Abc4BxCf
         o5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739530063; x=1740134863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39d87he4w+nqhvnifbqZl/bqbaPjTdXMuZ/SdAklOjo=;
        b=cnonDx257sE2rP2YjCbECnytnTftXKPs57PFi/XbM7PeRoscBYjyC4LQft9Lm/QKMB
         gz19erxtksjBhrNU27b4NVQD1tHXTV7i4YRAGreWQnoH3+KuymOw81C/WdJ+ACfm6OqI
         8VemJHmo7IZ0OtUmCRH818kOcRph23aJ8ZdeaW7ZMu9sYeYUabiaUaSTTY3eYcX/DBZD
         bwCnRu31fKqicwcscfAGrLWMmc/P9j+BlqFu7YEowEuUo1ZtGMqCBK5TTnhwCKCiBlbW
         3w0QSbuBJWyFfg8i5L+NkOyxtQW+D4x5y41QLRyw5ueNnNpUMVm/yRbz3V18B/aS23e+
         B9pw==
X-Forwarded-Encrypted: i=1; AJvYcCXEa2QPJyIywvblRwhhpcJRtuNlwvSX10I5YzeoOuEytUNg6XN9VJqDUhw0Lzjl3wipf6jhFLTqZHgFHJ1pdel2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzp52tiMpNRCiUeNI8roxRXgczvsxafcV+i5+bAFdvpeB/HYRG
	1EJjvWgwTkDEs/OQEwA8egejAp6T58aza2nN9qTGDgcFu14nwCkq3Bkps0gLHXdU7345bcBaCIl
	hOUUgFqgUGFrTOgDjTy5Zl1mgaINdSZjW+qG4sw==
X-Gm-Gg: ASbGncvgLOHcXbq7F2buxYJdoRqI7Ajdr5qhKZRLp+Hl5ik/URIg/8I4SM2933GVxwX
	GIW4lzEoUm0YmdWCxAQ9KwvfmjlyTLTuuyu9JrnvGrQETZ4qKDAyrtjMGZK2ToHGECjc/SDNW
X-Google-Smtp-Source: AGHT+IFpq/TAGroz+gdgkVpMwZHPYA3s6SCCL9gaFmmcJASK+ip50/1eOiWJmQBpq6AFdEspn1ZcNflRwFQIDYc7lB0=
X-Received: by 2002:a05:6902:f82:b0:e5b:248a:bf2f with SMTP id
 3f1490d57ef6-e5da81e7effmr6876170276.31.1739530063426; Fri, 14 Feb 2025
 02:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org> <20250214010325.GA12626@strace.io>
In-Reply-To: <20250214010325.GA12626@strace.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 11:47:30 +0100
X-Gm-Features: AWEUYZlN3BW34B1Z-q6x6cSfXH7J9CenfXpmXt_ykKPAp-0W_NVi6kBmkZfgRDs
Message-ID: <CACRpkdZJYFUhmPg3EWJeU42fzJMzWm7Sgn3XfELB2-PSCf6Ssw@mail.gmail.com>
Subject: Re: [PATCH v4 00/31] ARM: Switch to generic entry
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	Eugene Syromyatnikov <evgsyr@gmail.com>, Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_024744_589089_CA4C39C1 
X-CRM114-Status: GOOD (  15.03  )
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

On Fri, Feb 14, 2025 at 2:03=E2=80=AFAM Dmitry V. Levin <ldv@strace.io> wro=
te:
> On Wed, Feb 12, 2025 at 12:22:54PM +0100, Linus Walleij wrote:
> [...]
> > - Tested some ptrace/strace obviously, such as issuing
> >   several instances of "ptrace find /" and let this scroll
> >   by in the terminal over some 10 minutes or so.
>
> Could you also run the strace test suite, please?  Given that it used to
> catch quite a few regressions in the past, it could be useful in this cas=
e
> as well.

Sure, where can I find this test suite?

Yours,
Linus Walleij

