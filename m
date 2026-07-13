Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC275C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qguXd1Bmb0JoPYCTB9Cy4VECjzPPKEDsS8mS+lKAv24=; b=2NJPwS1cW0Z3/rzAsmXiWTnw0w
	a9UKjqou7WJX7ZyiXCmpRWzCMIFe3oft5E3cwxmeerHANOyFyuMP+epUIBVMvlfpL1R6MVglYyIXo
	n9NFVsPE4NwJficdJYJ+V+8dx6qk+Kqdv54gfXopJ7N5v7Fkwj+h4hfZs/CcqS7GVv0Zluufaf4Wn
	GvCs1GYNPW8s9wovtkbgC4Qs5YE+aM3cXnLySiR39JC3j9gEruWA/DecSOGTzY1EM9fzkWBZhDOBI
	NczK9jLfXv5yXJBwCF9qE+XOdkDd/MGKKC50IC3ktU7TPESEv4TqQsUOh2ZnjprdNlWHKG714fu1E
	FFhi1Ofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFUq-0000000990t-1KWy;
	Mon, 13 Jul 2026 12:10:53 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFUn-000000098yF-1jzV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:10:50 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-6662551100bso3737575d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783944648; cv=none;
        d=google.com; s=arc-20260327;
        b=GiIv9XE6Yk7xp3yZ/pZYBe51DHnLc3DgZUytauZtGwtMKD1Bvv9lmyDsb5tMVqdYWg
         VwY1sBFAyZLvDfBSKPruI5QPPgB0jvlc+wW3AOS4nxsdQBEkMPaqv2kZhrrhOvlh8r4l
         VJkUaneVCWsANJ3/TkMNKsocr2cEKSeiFpLj8rboLQia7o70VRlXWoYFEOXYEyOtC7oQ
         +qaMtl3hCiHehCvePbpGWOu3uPvaO4GixRWtJI/CPSKcNyqsGgfUMwYTcBa6Xwt1jUgu
         XmTL2BscpBeFcMFdsSu3riIKcS33uG7dIq9MDV6aeVUVtcQkrWShQo9vYpefFC+OO5gx
         yUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qguXd1Bmb0JoPYCTB9Cy4VECjzPPKEDsS8mS+lKAv24=;
        fh=RsN1L9jagbQMJy7n95sS3HITAmZahP0l4nZIo60+Fok=;
        b=HD6EfOY9rZtl7gHbi6cFMNaNV9j/WTC3ncY4zdckDIzBV4pTDWaaMRJnvZqftDZ7Fh
         w1fZXzPVMUqvqquMSXxOYxcXCM64WoXno4VXBnuXGgstZH6+16m5YTxkCglVNA/By5vh
         Dz6TP39AoKuT6L/yJQitcfpfB/gs0T8FOLHsW58/ZcigNcB8DIxKRDnJ1U9b/88+WGPC
         xwbB2fHGEYjXfpXnllKvrJ5cw52gTUvcIuC/qTWWk6r8LQ/ke7Nr5/dmHpQ7zym99e+4
         ME3bfEc1gjIsSH3uMZCBOBchyx5I6PSA7oa642BU2KUVGJlkyB/9LGfjs4VXw8fXTnvs
         lYXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944648; x=1784549448; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qguXd1Bmb0JoPYCTB9Cy4VECjzPPKEDsS8mS+lKAv24=;
        b=OM8C5ziN4LGbOK4fzvKRs8C/UZugYqpWKrzPWSTZUJyTbMSo65nOY0vSFUuxeGwASk
         ZXYooFt9hFfTpblyLMKjR/cM+nz+ml1hTOY0Ype/IrF7quA5RMEQOxA7rDF4Ceqe3U8J
         3dDLQwa9kZKoAKPkhQlMZKhUDQEoy5j8mfVA5UKgYsoYfDx1/yB0+tHXyPPwRplZWlMs
         4g7JCIIrXS+cKOIGQrc/V2A4zgj1uKbWYkgK+slZvPsj7FS9P/L5VUOdatx65JvwpjeS
         FWC42RTXEBi4GymLkQEtH988gjmKQVvv5oRBxBeK6tSTU/9T7u6KpfnPemhGvM0C+4RU
         tHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944648; x=1784549448;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qguXd1Bmb0JoPYCTB9Cy4VECjzPPKEDsS8mS+lKAv24=;
        b=aHqoB/N1NPugDzIPGLOMqCOuBCyJQec3igKRfrFUecivBYU7zZ40GVY/Wgh5aHKxfl
         AkEVsgLTERdaImgEMn2BFBpoiGLi+FXbMnq/q7rYoTcQF6MO7RHqTnga18WwHaylxw85
         DN+CpizCWIBJFBE8mXdyJYoeGZ6623JAsc/MCzZSTKYYfU8C9Q9/y8FKB4wZZCTfgpbP
         A4b0kKrNqYMind4ClT4TOfkr8rfBtYL8bkuoGE6g+HR0V7cNNG0W9TjJbL70W2qV7386
         2+8v4UPolbziTU95VxKAPeCnZtLTEFaGpSp+o/jmM8ztC3h601zR1ViU352FZC+vI/SE
         sQkg==
X-Forwarded-Encrypted: i=1; AHgh+RqONEKBi4KUq7e57HLyaXoDwTQQJ4AinC5y9S1sN0gvPVSsYeLOToe/jvQaNxDC7eKUAyuYvf7dLtrQVDd19Hho@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjug8U+m8G5l6T7mxxVVMY+bKnaWvAZOrDKsRuf35TJ02zxN+H
	ibSv0on5Z4bU/vkULZKoxkOT3YiHw14LOBurAwb3YQH6GogDRGoBxZoA4RkysbvkcfQcqyUKcRq
	P9qFqRkBo8GIumC3c39EvrhNV+EVhkDc=
X-Gm-Gg: AfdE7cnaJQ9iR+VqhvE8tFyeWSizI/eHwl6B0W99akAgzyFVsnrY1/kIIXSnCv+FBbO
	emtd54DhOzMns747rFcwIGnHMqn5+LZorVr8B1Dkk4eTLl+eqApM7dcaMX2r1CMOE54c8V8Lfjk
	WtXqmHGv82xmh5NKhDQq4dR8pUEoQoF6jkEmiqaedSs0yC5+/SAfLgvPrAE53mRIL3sxJ1JoZsa
	IjRPmonMW0ELJg2xXy8c2apayAIZkCoZyl+vPkAVHIHLKhpMA4f+7DlTBg0lfcbAZRT+/Zdn90=
X-Received: by 2002:a05:690e:1555:20b0:667:8b90:2e55 with SMTP id
 956f58d0204a3-667d7ee139dmr4779810d50.97.1783944648180; Mon, 13 Jul 2026
 05:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260705103256.284467-1-lgs201920130244@gmail.com> <20260706-dashing-dazzling-sambar-453a4d@sudeepholla>
In-Reply-To: <20260706-dashing-dazzling-sambar-453a4d@sudeepholla>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 13 Jul 2026 20:10:37 +0800
X-Gm-Features: AUfX_mwaflEwq5O1c14YKWIRx5LpcE_68yYNnGKkNrsplECeT8LOM8_s9_IYQRI
Message-ID: <CANUHTR9ed+A5OJLX802LZieSvp-m=pQQww4Y4F=7VcEO5PPN1w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: scmi: Check pm_genpd_init() in probe
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, Ulf Hansson <ulfh@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051049_512765_F7F64AE0 
X-CRM114-Status: GOOD (  22.48  )
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

Hi Sudeep,

Thanks for the explanation.

On Mon, 6 Jul 2026 at 17:34, Sudeep Holla <sudeep.holla@kernel.org> wrote:
>
> On Sun, Jul 05, 2026 at 06:32:56PM +0800, Guangshuo Li wrote:
> > scmi_pm_domain_probe() stores each domain in the onecell domains array
> > after calling pm_genpd_init(), but it ignores the return value from
> > pm_genpd_init().
> >
> > If pm_genpd_init() fails, the genpd has not been added to the global
> > genpd list. The probe code nevertheless stores the genpd pointer in the
> > domains array. A later provider registration failure then unwinds the
> > array with pm_genpd_remove(), which can try to remove a genpd that was
> > never registered.
> >
> > Check the return value from pm_genpd_init() and only store successfully
> > initialized domains in the onecell array. On failure, unwind the domains
> > that were already initialized.
> >
>
> It was done that way intentionally IIRC. We don't want to remove all the
> power domains if some not so important power domains fail to initialise.
> You can log the error if that helps but removing all the domains that
> have initialised seems bit of extreme.
>
> Are you facing any issues on a real platform or is this just by code
> inspection.
>
> --
> Regards,
> Sudeep

This was found through manual code inspection and has not been reproduced
on real hardware. My concern is that a domain for which pm_genpd_init()
fails is still stored in the domains array and may later be passed to
pm_genpd_remove().

I agree that unwinding all initialized domains may be too aggressive.

Thanks,
Guangshuo

