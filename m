Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476CACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 02:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ta4pHybjsRd5oAb5H49GhrRgg2InYaGc8HOWjDuWw8Q=; b=ZbZvchZT9HNNVz29bVKpao87UC
	d8tn3uAG9wr6wUiXhLWlqBjlcdGu+nsVF12no6jkKlF6fcNMCLmF8j/Xu5v4AIsLdeYx8csdIeakh
	6h5lkM3ylHw98tVfhGlLRqeWkJPvcT3OH80EbaXq0Vj+QQnxc0MqgbVPp5TgwvhPwIL+pmZ31QYNn
	oKVLZAj331P5okJfx1z/L/mIrhWjAB2RvK8wtpQVS/mT5ufzMUu3SFoT8qSlM6FyhoHjrXFa8/NiQ
	HNZjzmAIH6PmSCYYuMz04WyMgoI/eZQhNTkulfPBo8P1OwnfQnLEpRTo+mz2srCXjJ2bZt+7rhgjA
	XNGJlaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHCR3-0000000GaHQ-0Bux;
	Fri, 07 Nov 2025 02:42:45 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHCR0-0000000GaGc-1fjf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 02:42:44 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-44fe903c1d6so67442b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 18:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1762483357; x=1763088157; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ta4pHybjsRd5oAb5H49GhrRgg2InYaGc8HOWjDuWw8Q=;
        b=Jo4DktC7AN9cffe2cTWsZaiIauzEcLPplykUvEy1V8fkk9JRsTrWtWY/frhQDF4eLG
         f2RmQuG03EW17y0FQV3VUTwqXFL/4BAPsIccM+5kKTqsuxeMWuv47fMFGXetnFWPSfCa
         xR+bI8q1S2sgjdJ3lBMkcu7f9pzD5IrdsY91YGZo1Jwm+1fF5dXKeJZJJKGiN/0pVft0
         cIhYxVHkfcQXvIwpFyo5VG1gqzWTh7bh2KjSODhLofpZ+CGGWafWwJDCcXzsTSZL8SR5
         3iVA9mvoVlpa+E/33HDYJT0mE8yJ4TD5JFK3a6wjXfV8Y6ZjJC4TqIWBDq/ia8EWl2dE
         pYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762483357; x=1763088157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ta4pHybjsRd5oAb5H49GhrRgg2InYaGc8HOWjDuWw8Q=;
        b=pkWOXThPm4JJMRv4/+7+az6SBQCM9sHrQRRR5mlcOapEwwKngWqOxt2hpiRWTEQHWr
         QsPHa4TEXOJqvJji5OhPo/j14bwazSWWsXW7jez3kyGWAu9ILiVNgIv97w5tQeNG0w/U
         BGww6XaR+1We4/KbchDjldx6iTySIF0SkdnLm8qjZ80iPvyAvzlUivuJR48LhawAHsfe
         77CCy1zWk/rT8ztUVyO8YE98Eb0GXYcQlF8JRk6HoQfTpQiEE3DdL91DD9kLf+Xuf2Bv
         llhHV7HLS4EtXMyZxGeC+wlyOfe7vaN+v3GlT2IIYzKY6DYuTh8RorhrsyhRLKXHvvWq
         eICw==
X-Forwarded-Encrypted: i=1; AJvYcCXedbu6TADPskBwYNi14PE89zJisUyxHf911acDdNYItYQXOgCtxJ+OqQznRV30LqKu3y4wMnsXZLl32fTX8YNq@lists.infradead.org
X-Gm-Message-State: AOJu0YzjS7V7MK2nbCy0rfjyVOvAIETLEwQzRDY7qNN3b3fM8kY6YVbP
	gSSsI9zDzKp8hhk+4gEIn1QDk9A6UCMSpIsT1E9oFB7CiCsxnR6JfDq6OixAbPqEWcCuGq/6osg
	TIYSHmkP4yiVZWno4PkhYXOtyD280b//PzpopHhBi7A==
X-Gm-Gg: ASbGncsShhsFD2Qn3jP9H0tB1Rjp+AfOdpz0ZSmGS7R3OL7TFx1hpaiHbmiDURR63Pf
	k9au6UT3aA5gPbLq35fSX96AGwt8yEEt3reugzudoWKUoPAJOOvMMa0ydt22ntsEoRo1T1XVKJe
	z2wI+aZzae6dsjU/hp3vWScT3Oh7aoZPde6mcdRWR1SAImHvNx/BX5ZxyLtJLz8R4weELSgulS7
	cF8yN3oX4Z0jTY8yPgDOA4+u7Uz4xSdcUjxRIwb00aMXsEH3YbjDuhiBRrnNzCmTiXUftsTZ3cI
	x+0uVxzb
X-Google-Smtp-Source: AGHT+IGb0n2soPVhA9HW3Yi/ug81lmtTpcvsCQ9ShMeI3zEImc6F3+dHOysOTdbZsRZbSPkSfqhccOrjI+KKkLT4UmA=
X-Received: by 2002:a05:6808:f8d:b0:44f:e3d2:59db with SMTP id
 5614622812f47-45015d583cemr1045696b6e.16.1762483357292; Thu, 06 Nov 2025
 18:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20251014031425.93284-1-cuiyunhui@bytedance.com>
 <20251014031425.93284-2-cuiyunhui@bytedance.com> <aQixsIQXTjYyhRVj@willie-the-truck>
In-Reply-To: <aQixsIQXTjYyhRVj@willie-the-truck>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 7 Nov 2025 10:42:25 +0800
X-Gm-Features: AWmQ_bkNdWjndV3isxnVf7u1V6RwPPlMP2i7v5fPfn_48ruw1DHahvSQ2HKDsok
Message-ID: <CAEEQ3wk5Ru4-=4Ecnc6kQAAbR57806xxYTz0o1z4KfgZE6Cg6w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: Will Deacon <will@kernel.org>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	dianders@chromium.org, johannes@sipsolutions.net, lihuafei1@huawei.com, 
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_184242_753986_48C04B40 
X-CRM114-Status: GOOD (  16.76  )
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

Hi Will,

On Mon, Nov 3, 2025 at 9:44=E2=80=AFPM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Oct 14, 2025 at 11:14:24AM +0800, Yunhui Cui wrote:
> > @@ -306,3 +307,85 @@ void __init hardlockup_config_perf_event(const cha=
r *str)
> >       wd_hw_attr.type =3D PERF_TYPE_RAW;
> >       wd_hw_attr.config =3D config;
> >  }
> > +
> > +#ifdef CONFIG_WATCHDOG_PERF_ADJUST_PERIOD
> > +/*
> > + * Safe maximum CPU frequency in case a particular platform doesn't im=
plement
> > + * cpufreq driver. Although, architecture doesn't put any restrictions=
 on
> > + * maximum frequency but 5 GHz seems to be safe maximum given the avai=
lable
> > + * CPUs in the market which are clocked much less than 5 GHz. On the o=
ther
> > + * hand, we can't make it much higher as it would lead to a large hard=
-lockup
> > + * detection timeout on parts which are running slower (eg. 1GHz on
> > + * Developerbox) and doesn't possess a cpufreq driver.
> > + */
> > +#define SAFE_MAX_CPU_FREQ    5000000000UL // 5 GHz
> > +__weak u64 hw_nmi_get_sample_period(int watchdog_thresh)
> > +{
> > +     unsigned int cpu =3D smp_processor_id();
> > +     unsigned long max_cpu_freq;
> > +
> > +     max_cpu_freq =3D cpufreq_get_hw_max_freq(cpu) * 1000UL;
> > +     if (!max_cpu_freq)
> > +             max_cpu_freq =3D SAFE_MAX_CPU_FREQ;
> > +
> > +     return (u64)max_cpu_freq * watchdog_thresh;
> > +}
>
> Why does this function become __weak? Neither arm64 nor riscv override
> it afaict.

Would you say there=E2=80=99s any particular issue here? If some architectu=
res
might need to override the hw_nmi_get_sample_period() function later
on, wouldn=E2=80=99t __weak be a more reasonable choice?

>
> Will

Thanks,
Yunhui

