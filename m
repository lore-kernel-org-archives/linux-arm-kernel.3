Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182BDC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lp16JU5FMm+EXEArS8EabXXQ9auyjZu0uXVS9eVDVQA=; b=JLGoUUC7wMxQ6BZ68WP0JCe4pM
	5SB9eic/+cpKh/yEYKT5FXJemKS5VCakzP6uY/9JiNrAWA9ItC2uN1qJBMOvYvxZXaAJ0xqMtu+SR
	e1C90mmFiDBSk9F4SBeub3vdbO3/xbIEmTGmL8JIFuUk5zpQ7wWhhbOqNojOQdifGg0bAng5W9qts
	+psTcwvkN/XmrpFefXOYbcbtfevRq8IrB1LR25QcC4avMKa1uGIEE779kEtTHcaPBBLakJI8gkOvX
	FWdD0l8rTNcoGhf0vUp0TEQWtzG732JbBqFOSvdfWRyyPjjj3wXsZ7y/yePbBIh0ZlHbrh/DInrOn
	Hhz2mjzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcxl-00000005tjF-1Aep;
	Tue, 01 Jul 2025 15:32:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbRG-00000005b6y-28oW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 13:54:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E014C4671A
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 13:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5511C4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751378061;
	bh=Jng3wkmeznNgaZJCbfupk58RsqV3AADGX9KcfOwgqY0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uUKq4jIPUxYByK6SlEFyvyt/h0fGGotsrjQ6Q3Xe4WxxwEeNQTBhOVmVeHIXwomb4
	 Cf/wkVx1zZ6E2MbtfuDxJI9dZK2dzucNRIwix+R17zFavhXsQWYLprFY+/xy1ic/UA
	 ditp3Bqh2xRhYEJNmEfoZ9jdd7Z1ysUwnpw9RDYkuXkAYveQeJVw+hXO4T297IfE9m
	 7qlezuIDgzHIHF0zOy1bbu2nmQUzWLWltV+XT5ERreJPYYFObopx6XTZTsldEE+K00
	 37w0xaDyD0p99AVc8uCWl/+pJ7ia/8ggqYNJ3CcHHgmek+DCJ1723zrRyN7Bqrw8hi
	 vZn16wYO9hlMw==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-610cbca60cdso2138442eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 06:54:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4l25zZkOJNnwQbJFoVCSFNjLzFfPfGx4OaBTmubh2le6z5pqWWgp0UtMPLsgHk2X4s+Sli0Ch97+ExDc6Gcfw@lists.infradead.org
X-Gm-Message-State: AOJu0YwexAsHbq4mgrefaFmxnOi0JstfK9DgqpFtBC+BHQheP4BoBmVX
	1yM4fOMXWcMjacx0zcSauFUycioweCOW4zN3ib5hx3Dj04yiOBRMHgJBNZul1KqL1FYsrSFXTIN
	9zudqLT2uAXlVH0ibr9cTbSpqqlML5lc=
X-Google-Smtp-Source: AGHT+IF8seE+Id7xG8WQlhFiBqridThxc49oWjknLWJxi/lTNTz9icUtsuqR9A2rhC3Lo+dq/lpP/fUkCq2qp3nRons=
X-Received: by 2002:a05:6820:994:b0:611:b561:258e with SMTP id
 006d021491bc7-611b90965aemr11674984eaf.3.1751378060915; Tue, 01 Jul 2025
 06:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250620131309.126555-1-me@linux.beauty> <20250620131309.126555-2-me@linux.beauty>
 <aGPMM9Nw2-99sWRL@arm.com>
In-Reply-To: <aGPMM9Nw2-99sWRL@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 1 Jul 2025 15:54:09 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h06-uQq57So7GzBMJ48dr42z3hY0EBFHSUmsjsVaUgjw@mail.gmail.com>
X-Gm-Features: Ac12FXz4Xi7TozQTSvDj_v42bWdO4aRE3ZuU9eQvEt5OUBffGU8gt-jQaTTOshI
Message-ID: <CAJZ5v0h06-uQq57So7GzBMJ48dr42z3hY0EBFHSUmsjsVaUgjw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ACPI: Return -ENODEV from acpi_parse_spcr() when
 SPCR support is disabled
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Li Chen <me@linux.beauty>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Hanjun Guo <guohanjun@huawei.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>, 
	Liu Wei <liuwei09@cestc.cn>, Ryan Roberts <ryan.roberts@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_065422_598406_2FA65344 
X-CRM114-Status: GOOD (  23.54  )
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

On Tue, Jul 1, 2025 at 1:53=E2=80=AFPM Catalin Marinas <catalin.marinas@arm=
.com> wrote:
>
> On Fri, Jun 20, 2025 at 09:13:07PM +0800, Li Chen wrote:
> > From: Li Chen <chenl311@chinatelecom.cn>
> >
> > If CONFIG_ACPI_SPCR_TABLE is disabled, acpi_parse_spcr()
> > currently returns 0, which may incorrectly suggest that
> > SPCR parsing was successful. This patch changes the behavior
> > to return -ENODEV to clearly indicate that SPCR support
> > is not available.
> >
> > This prepares the codebase for future changes that depend
> > on acpi_parse_spcr() failure detection, such as suppressing
> > misleading console messages.
> >
> > Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> > ---
> >  include/linux/acpi.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> > index f102c0fe34318..71e692f952905 100644
> > --- a/include/linux/acpi.h
> > +++ b/include/linux/acpi.h
> > @@ -1503,7 +1503,7 @@ int acpi_parse_spcr(bool enable_earlycon, bool en=
able_console);
> >  #else
> >  static inline int acpi_parse_spcr(bool enable_earlycon, bool enable_co=
nsole)
> >  {
> > -     return 0;
> > +     return -ENODEV;
> >  }
> >  #endif
>
> Rafael, are you ok with this patch going via the arm64 tree?

Yes, I am, thanks!

