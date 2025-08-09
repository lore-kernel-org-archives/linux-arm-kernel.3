Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63DEC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 23:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2JXXj8j0ACBeCVhsD1Qg12ZabPpPvP/efmSapfSjzw=; b=lQsgjPHRn7XK3/LM2ox9Sp9CD8
	28TtbiFy7V5S9RKGWeMvWp8NaJjAe70RkeWxojv4ygaTUMclDoAvH/HVLCL0saDqaiNO4Pk/jiW3C
	H1I4zNUV+p4NfIi8+eaWm4UuGFBwkNDX68pdsImEsbCxSNpJFqRVPmSrCTo4dW+Tu7ji1mbhgdzSN
	jC6kVF3FgkgILjiailYZuqWAdDE5LQHVWBGeE35qAug3NrTMZ4gERpEcknTazpwb8wqiqDzHZj+4A
	YD4YzT08nB80dmLUdRWtIWylhYXJlWODoLfqS8bSyckpyfoDqRI9ZbEjMorE/Rm0LrpHSlgv4zYLB
	WFLMPxMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uksdA-000000052CZ-20UK;
	Sat, 09 Aug 2025 23:05:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uksae-0000000526i-33nK;
	Sat, 09 Aug 2025 23:03:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 039CD459A1;
	Sat,  9 Aug 2025 23:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D834AC4AF09;
	Sat,  9 Aug 2025 23:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754780582;
	bh=st/eweHiwV92mUXCvAGpIiPGkvX3rErOBfHnwy2GSps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J3ho4kiwrH7rHSL79nbnLEr8Fi7+3PMWKaPF++iz6+hi+MdR9KEEzcVlLj8ka0pf8
	 8ghHe6EwgDyqH/6MV9E7RSlM3Xis2bC0eXh7XcwncUYg4cyhRzZRzt4ng/01hji6ic
	 z65whu1Kmp7Ovfvwvh5erXF+18ebGI5bDc9aCuD93E8d9YhJshoNIwWGXbxU9QDWKF
	 T6zvn7zjM3jiH2oit4GZPg9RFmtdfjbbGuqabHV6PdIu87V7pgvTwqzOXruVNSYlSb
	 mHqfQnZ7Pc/teaw4LYKyETrSoV1BFexfdIKEwp7BhRQebwXFhy3xHesvJQdBdZXBTD
	 JafFkKw/Bf4iQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3325cb38a78so28491151fa.3;
        Sat, 09 Aug 2025 16:03:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWu8TJHFuHEHe6b9tj7ljq73/oROY+zEKIwESHqq7t8Pl7x/s3IL13FlttQidzlaXNvuSF2HTBxa30Zrto=@lists.infradead.org, AJvYcCXw6R8oPCudG1H3/ZzQxp+TyRnsdWk1cu5tfA/R3mcy8mDoWKERVhYfrcqQFGVVcR77rGlyPoSM/WD/nKORZP5G@lists.infradead.org
X-Gm-Message-State: AOJu0Yw11YBE6fuUDuIloqXiYvZAH+NbN2+Qhvxjs4f316Ug71csCnmX
	faATk0LcQfjpFXlKKdIWiW9qtZZkHcIgfAMpbZw0SYSMyjwknm4mFSwkDBAuzmFB29FOkovPMBZ
	/6Yspjaaxzix+qNoQ3/qNlJNKV0ywvPw=
X-Google-Smtp-Source: AGHT+IHacj93S4TAyJS2Y33dq5fDEf3fw3H8pVieqGYKOrts0lqIXyoZID+Z9tXd8YeI87NlNCl9WjBC2eK/6u6auvE=
X-Received: by 2002:a05:651c:3799:b0:32a:7270:5c29 with SMTP id
 38308e7fff4ca-333a213e262mr13218821fa.2.1754780581250; Sat, 09 Aug 2025
 16:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com> <20250714060843.4029171-6-ardb+git@google.com>
 <20250803010449df1f5cfb@mail.local>
In-Reply-To: <20250803010449df1f5cfb@mail.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 10 Aug 2025 09:02:49 +1000
X-Gmail-Original-Message-ID: <CAMj1kXGQyLXwk9Bq24xhPPsB1nO9RcSkvh=0p8aNP=Q=Az8V7w@mail.gmail.com>
X-Gm-Features: Ac12FXyxSfM9EC_oe23LQ4fW6u1l84sRZB4iGnVNSBFl1E9opWCoKNhC-oXMcUQ
Message-ID: <CAMj1kXGQyLXwk9Bq24xhPPsB1nO9RcSkvh=0p8aNP=Q=Az8V7w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] efi-rtc: Remove wakeup functionality
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_160304_811146_19387B23 
X-CRM114-Status: GOOD (  25.85  )
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

On Sun, 3 Aug 2025 at 11:05, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> Apart from the topic that should be "rtc: efi:...", I'm ready to apply
> this patch.
>

Thanks, please go ahead.

> On 14/07/2025 08:08:45+0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The EFI rtc driver is used by non-x86 architectures only, and exposes
> > the get/set wakeup time functionality provided by the underlying
> > platform. This is usually broken on most platforms, and not widely used
> > to begin with [if at all], so let's just remove it.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  drivers/rtc/rtc-efi.c | 76 +-------------------
> >  1 file changed, 2 insertions(+), 74 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
> > index fa8bf82df948..b4f44999ef0f 100644
> > --- a/drivers/rtc/rtc-efi.c
> > +++ b/drivers/rtc/rtc-efi.c
> > @@ -112,48 +112,6 @@ convert_from_efi_time(efi_time_t *eft, struct rtc_time *wtime)
> >       return true;
> >  }
> >
> > -static int efi_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
> > -{
> > -     efi_time_t eft;
> > -     efi_status_t status;
> > -
> > -     /*
> > -      * As of EFI v1.10, this call always returns an unsupported status
> > -      */
> > -     status = efi.get_wakeup_time((efi_bool_t *)&wkalrm->enabled,
> > -                                  (efi_bool_t *)&wkalrm->pending, &eft);
> > -
> > -     if (status != EFI_SUCCESS)
> > -             return -EINVAL;
> > -
> > -     if (!convert_from_efi_time(&eft, &wkalrm->time))
> > -             return -EIO;
> > -
> > -     return rtc_valid_tm(&wkalrm->time);
> > -}
> > -
> > -static int efi_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
> > -{
> > -     efi_time_t eft;
> > -     efi_status_t status;
> > -
> > -     convert_to_efi_time(&wkalrm->time, &eft);
> > -
> > -     /*
> > -      * XXX Fixme:
> > -      * As of EFI 0.92 with the firmware I have on my
> > -      * machine this call does not seem to work quite
> > -      * right
> > -      *
> > -      * As of v1.10, this call always returns an unsupported status
> > -      */
> > -     status = efi.set_wakeup_time((efi_bool_t)wkalrm->enabled, &eft);
> > -
> > -     dev_warn(dev, "write status is %d\n", (int)status);
> > -
> > -     return status == EFI_SUCCESS ? 0 : -EINVAL;
> > -}
> > -
> >  static int efi_read_time(struct device *dev, struct rtc_time *tm)
> >  {
> >       efi_status_t status;
> > @@ -188,17 +146,13 @@ static int efi_set_time(struct device *dev, struct rtc_time *tm)
> >
> >  static int efi_procfs(struct device *dev, struct seq_file *seq)
> >  {
> > -     efi_time_t        eft, alm;
> > +     efi_time_t        eft;
> >       efi_time_cap_t    cap;
> > -     efi_bool_t        enabled, pending;
> > -     struct rtc_device *rtc = dev_get_drvdata(dev);
> >
> >       memset(&eft, 0, sizeof(eft));
> > -     memset(&alm, 0, sizeof(alm));
> >       memset(&cap, 0, sizeof(cap));
> >
> >       efi.get_time(&eft, &cap);
> > -     efi.get_wakeup_time(&enabled, &pending, &alm);
> >
> >       seq_printf(seq,
> >                  "Time\t\t: %u:%u:%u.%09u\n"
> > @@ -214,26 +168,6 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
> >               /* XXX fixme: convert to string? */
> >               seq_printf(seq, "Timezone\t: %u\n", eft.timezone);
> >
> > -     if (test_bit(RTC_FEATURE_ALARM, rtc->features)) {
> > -             seq_printf(seq,
> > -                        "Alarm Time\t: %u:%u:%u.%09u\n"
> > -                        "Alarm Date\t: %u-%u-%u\n"
> > -                        "Alarm Daylight\t: %u\n"
> > -                        "Enabled\t\t: %s\n"
> > -                        "Pending\t\t: %s\n",
> > -                        alm.hour, alm.minute, alm.second, alm.nanosecond,
> > -                        alm.year, alm.month, alm.day,
> > -                        alm.daylight,
> > -                        enabled == 1 ? "yes" : "no",
> > -                        pending == 1 ? "yes" : "no");
> > -
> > -             if (alm.timezone == EFI_UNSPECIFIED_TIMEZONE)
> > -                     seq_puts(seq, "Timezone\t: unspecified\n");
> > -             else
> > -                     /* XXX fixme: convert to string? */
> > -                     seq_printf(seq, "Timezone\t: %u\n", alm.timezone);
> > -     }
> > -
> >       /*
> >        * now prints the capabilities
> >        */
> > @@ -249,8 +183,6 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
> >  static const struct rtc_class_ops efi_rtc_ops = {
> >       .read_time      = efi_read_time,
> >       .set_time       = efi_set_time,
> > -     .read_alarm     = efi_read_alarm,
> > -     .set_alarm      = efi_set_alarm,
> >       .proc           = efi_procfs,
> >  };
> >
> > @@ -271,11 +203,7 @@ static int __init efi_rtc_probe(struct platform_device *dev)
> >       platform_set_drvdata(dev, rtc);
> >
> >       rtc->ops = &efi_rtc_ops;
> > -     clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
> > -     if (efi_rt_services_supported(EFI_RT_SUPPORTED_WAKEUP_SERVICES))
> > -             set_bit(RTC_FEATURE_ALARM_WAKEUP_ONLY, rtc->features);
> > -     else
> > -             clear_bit(RTC_FEATURE_ALARM, rtc->features);
> > +     clear_bit(RTC_FEATURE_ALARM, rtc->features);
> >
> >       device_init_wakeup(&dev->dev, true);
> >
> > --
> > 2.50.0.727.gbf7dc18ff4-goog
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

