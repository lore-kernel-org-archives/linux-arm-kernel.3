Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1053CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 20:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTaOMsodtgRUq8XpbHVyhD37ZGMGFGwNGtASXm9Po2o=; b=dLaAvpEhMN4m2RT07CamImWYm0
	UbWq5RhMKG18k9Lxpl01elYXPqd88NyZc1mOSOZh6blUXjI7AfmyOUXqle/9RC/+hwoVVU5IYRAnw
	kK5Uc4nkwp9pzw5iIjV2ueZXCjzrMyvVKsu1iJImfNG4TGNyGUZoI7SHOJjoPT9RKg3N/ESmX7kdf
	nD5i11ljxVGMFgtoFx4eGvuJ42daCACs76Cal6H7DdWya7SmovzLFQg/QrykFSNpio9EfSv9Yzo3N
	SyNPEBsNu0yxQYPGeavAL6+cryl4Ud54z5q096kEufVO6WefOLZr9cRZN0OXTwXW3VDWtcE2UmYLc
	feUn9nIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZwT4-00000000IbI-3JV1;
	Wed, 17 Jun 2026 20:02:34 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZwT2-00000000Ia8-3RlD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 20:02:33 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-9638f7e9896so1050423241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 13:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781726551; x=1782331351; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTaOMsodtgRUq8XpbHVyhD37ZGMGFGwNGtASXm9Po2o=;
        b=Jmffrz+RjE/FfJJSr9N9IeZRvP/Gy+0CAEPIjOdMy/lIO2Q1H/aS1CxDW+/l/MkNT7
         k6Kc184rHmkeN+btaoOUqbGrbvYN+eXrllfP6pB4CC3Ey6as9gCZHEkjysiLHPuM0Aya
         PQa8xNrkV1ap8U5JMp3IYWuJVLRuCuoGI7xBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781726551; x=1782331351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HTaOMsodtgRUq8XpbHVyhD37ZGMGFGwNGtASXm9Po2o=;
        b=XpbW3VV82hVQAWOa3ttMpAluFMium/5i8/IzATnN9qt1aR5zT+RGCEKWrcsY01dz4p
         UfSds9pqLYy2gqStbYOmgI32W8JLaQnACDFYdQ7i1EuacklPqyjmn2Z3/AbmJ/E4Kdh4
         IihHdaq1/9lNUCRWW5csmCrg6Kq7Dqf0thAdi0BWkJTZY29ZuIEPcKVzm7PCoG4HfJ0w
         cAJ+cOkrQhleQobeQG4bYYraxQGIGJTL1OgAcLBHBmeJyu7meedukv3uY0aiLxdSfdnj
         dXJbKrVnSG25mz5ii+k6KRm5UPngacPmEWN+ABm43gK/UMyHPK+/12k3Mq0kq0d0lb7c
         I+FQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YOfFgV6Ccprfw+MJvBK02AHxVXC1LUCIsv/ok6sazoAF3DtcDhcFS417U+V++uNNPLDE+SnyVHPHuXtMJpQcm@lists.infradead.org
X-Gm-Message-State: AOJu0YzJIVizsdvJ9fSMC+5Hgydy+zrvO21JDaEJWiQSn/fm2qlvEVsd
	c9QZs8C3PADVTAkE1chmtOuGvx4kxrXXtdWEgS5jnYmjMMQRITIktm3r/2dxEX0I6MBdgoflEqg
	SMjs=
X-Gm-Gg: AfdE7ckLI/AsK0KlK6mh512X+h3asCXMFqU7h9L1GWR/yGYAVDt0Dm4odNB0B0QaDDU
	wIPTL2injdkQs00y59YPDflVPvL9Qw640m8Le7y5NfEvZRWgmpOH0TNMjOEJv/LgNV2IWXmPLKA
	AerZTVsc0cFyOOW3ArLSkUOHcfN1Zg6rXUGJZWIoaLbQjzo0U13OY5T+H7kCK8/nkVhUOEabxDd
	17IjXTqcS+JE4EEe7NUhn8jbt60Sr0WcDx57szH1e/Gaa21Z7aanxJdySsBgof46rGBVRQzRZaJ
	idS9pJVBxanqqslkpp8ZUBfnSTQVhvyKV5KlEy+nrgWzpWFJ0fPqmZ7EBAn6U47CV6sHSkbIR59
	GnpZGxYx/eTdkG0fux5WkDzlEp13sW9GZEyz9eQdlEWYEW7e6YgYWeFUOn8f3h1ms01c1xncUWj
	H0ct0Q5R23RDfJCo21+41hvBAM/akS0Cw7TPrOPQ5ptuvCzQdo21Y=
X-Received: by 2002:a05:6102:3313:b0:6ce:d923:7642 with SMTP id ada2fe7eead31-727b4fbfd36mr553803137.14.1781726551486;
        Wed, 17 Jun 2026 13:02:31 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966a03d7117sm8137829241.5.2026.06.17.13.02.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 13:02:30 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-72257ba51e3so1213811137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 13:02:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Zae8ikNnEfNXBfkhzzsKurNwL49Q1KUQrTqof9Kyz16RCq5Y00zxJ009thd6qWwbX1AuD1IJYktO3vhTW7TvR@lists.infradead.org
X-Received: by 2002:a05:6102:441a:b0:6d3:4e:6d80 with SMTP id
 ada2fe7eead31-727b499df48mr485597137.11.1781726547692; Wed, 17 Jun 2026
 13:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1781709543.git.kas@kernel.org> <b4fa56527950c27715cb603f8b35dc8652be955a.1781709543.git.kas@kernel.org>
In-Reply-To: <b4fa56527950c27715cb603f8b35dc8652be955a.1781709543.git.kas@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Jun 2026 13:02:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9Vv6SUDr-ocuD5vp5w6ZCRM9jRbK=pCogQhYZ+jeGCg@mail.gmail.com>
X-Gm-Features: AVVi8CfCpXyjSEb8EYFqmwk9QVgZHo5eGMnJ0vI6j33_G6TOeXQwDdxOJT-BBxY
Message-ID: <CAD=FV=X9Vv6SUDr-ocuD5vp5w6ZCRM9jRbK=pCogQhYZ+jeGCg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] firmware: arm_sdei: add sdei_is_present()
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Breno Leitao <leitao@debian.org>, Julien Thierry <julien.thierry.kdev@gmail.com>, 
	Lecopzer Chen <lecopzer@gmail.com>, Sumit Garg <sumit.garg@kernel.org>, kernel-team@meta.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_130232_872176_5435BBCA 
X-CRM114-Status: GOOD (  13.24  )
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

Hi,

On Wed, Jun 17, 2026 at 12:20=E2=80=AFPM Kiryl Shutsemau <kirill@shutemov.n=
ame> wrote:
>
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> invoke_sdei_fn() returns -EIO when no SDEI conduit was probed, and the
> core warns ("Failed to create event ...") on any registration that hits
> that. An optional consumer that registers an event from an unconditional
> initcall would therefore make every boot on a non-SDEI system emit that
> warning for what is simply absent firmware.
>
> Expose whether SDEI firmware is present so such a consumer can skip
> registration -- and the warning -- when there is nothing to talk to.
>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  drivers/firmware/arm_sdei.c | 10 ++++++++++
>  include/linux/arm_sdei.h    |  3 +++
>  2 files changed, 13 insertions(+)

From a non-expert in SDEI, but FWIW:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

