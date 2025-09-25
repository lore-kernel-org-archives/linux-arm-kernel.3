Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A219CAC5BA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 19:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOzyRe+3fMSMSulDoCd/U8Ee2YvY46RKA0vukyO785o=; b=F5LTtvmHY2uHOy7CqC4jx8QYyj
	XlT5p1aix0QAQMcupLqSoOS7X/wlUjVuAGyzZ5jeVuj2VfjSTY0p5OOV+3C88h8sKCIl9jtTh7WS+
	CBLINpY0ze+NmOueawjlzAb/fJDiSgJGvRw/+yc77l7hNhP6ki3woL++fnMP8YcZ+kw8bTInTJnz+
	EqPu4cMX2RjP+vZ7/cc5A4DefL36iel1F1gTc4VjmqVUJXukj5sDOWcxBLTDCnpMNNGajVoOntnte
	CVz53/l2wsxxAGAjn81/fgRztjd9NJOVWflaHEmXSvMvoozunYuefURfWsJeelsxVYTO5vwhsjtHH
	utUD+84A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1s84-0000000CWHP-3pAK;
	Thu, 25 Sep 2025 19:59:48 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1s83-0000000CWFB-2B3e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 19:59:48 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-77f2e621ef8so1859299b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 12:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758830384; x=1759435184; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOzyRe+3fMSMSulDoCd/U8Ee2YvY46RKA0vukyO785o=;
        b=fMvQz6JyiGU9MAzeTJm/219jodKwXOPzisvh9yDMy/HXx0yBcdOxJuVCmRlTuBIPki
         oy1ORSD/Ti245zMQG3Aec8BK8IKxmUo0TvLw/Bg4ZfPh1/Lx3ap89i5pc3dViuZ4m0Bi
         ORrsxgXFlq63z7wMES9l6wAzH8AHj7rMaH+pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758830384; x=1759435184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOzyRe+3fMSMSulDoCd/U8Ee2YvY46RKA0vukyO785o=;
        b=iVE68jTwUzN6T4/lyQei7QVdZ1rMQFys7POwH5D54P97PCd+nA36RzYM9/Me946P9s
         xfIG+Bjw39JgXKLz69j+Q7UqiTXSQxE1MIx6gmtCdttgwpaqfyYA74ldgAeXxhIPZSmb
         vUkEUoKxiIuWchyVHOdhRVkpWikj1n8zsW9mwhVdN7xUvfhiYFJbvl7aSAsPuKTxtyAz
         seyeObVWgn4p4EtFoXEuyCupQsmJ1vd7ULcPlgz2OY3LdJKSBjDSgV+23Mt4BmDmtXNW
         AQZujSiLb5UoyJsLecHCTS2ZSpQIiOzrgCX/c1XfBr9gd/1MoR/4Jv3Ntmmo75nBroY0
         6PgA==
X-Forwarded-Encrypted: i=1; AJvYcCVu2CvwvrUF7YNm5LKliJCyyJvBKLyCNriMJTM1Ym1aoC4YN2XyxMxezXRZMnab5h+ZqIqlyCOQcjzFwq++od9U@lists.infradead.org
X-Gm-Message-State: AOJu0YzOekQqltDVD9qOXGZQ42A9YMqZDXITcPPIsK8RQBcbincxxd3r
	Agg7tisxh5PKAvc+79lpMUn5HUl3GNu338Xut0uW9wpK+eL3xYy9+AduUzzi5EPN6lsaZd3Fr4J
	M3SU=
X-Gm-Gg: ASbGncsG/vn0e0LRo8ozGteFx10Vajx4pkKLFCaBP7FFHHUsUv88rtzKi51pe2JnDx8
	e36A9obX1r6+fxtcv9D1JqqP3S95v/7+LrxarbUhX+i/fTtYhfDYSLuFPyNdMGAMVn8mPgbwPsW
	gzpX0lwVWUglYzbszRrFPI2IQI+PNCtb+PdZBzVydNfstU6a1ca2u+UJhKuIWvaHavV/+JBXxCk
	FvabSylSZ3EbrIjIRccO02KmH5hg+VJDoInnpniKVUSr70a5us0pOO97sjef0et2In5Cnj2HJMe
	m6mHcTi2NIiY1ptknz6OjGuP2KlG/HXmCoSK65H0EzMyE5juCjzrE6rfFO0wsjnmm0O3FX89CzX
	mUA/NAcjidPKwZZ/OlFwQoXlfOM0rTw2fjjcxtdUusZQ5IDPf7wna6bl2ws0h8Q==
X-Google-Smtp-Source: AGHT+IF3Oa4afi3zFbGZ3G41Klh5nnaOPR4sPE+jtMp770qjXzz8XpVDAdGltJ0F8gHUJJvnV1302w==
X-Received: by 2002:a05:6a20:431b:b0:263:7cc6:1c3b with SMTP id adf61e73a8af0-2e7d9ea1699mr5305574637.60.1758830383945;
        Thu, 25 Sep 2025 12:59:43 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c5575350sm2844466a12.26.2025.09.25.12.59.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 12:59:41 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32df5cae0b1so1641598a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 12:59:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXSSRfBhKOsoTL9Gw4/kg/p68lVK/wl5LZZKJJFxYdVeXFqciFDL93I4KMpfoqatIrICLvI2QdWycurLlVJjQ16@lists.infradead.org
X-Received: by 2002:a17:90b:538e:b0:32e:18b2:5a45 with SMTP id
 98e67ed59e1d1-3342a20b94dmr4932192a91.5.1758830380238; Thu, 25 Sep 2025
 12:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com> <20250925084806.89715-2-cuiyunhui@bytedance.com>
In-Reply-To: <20250925084806.89715-2-cuiyunhui@bytedance.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 25 Sep 2025 12:59:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
X-Gm-Features: AS18NWBiujTv-FGvPpgY3gBOBVEPrJ77epiIZ9CDp8xRQDwQ7FOMR9gCNXwR3xI
Message-ID: <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] watchdog: move arm64 watchdog_hld into common code
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_125947_553496_DA9FB90E 
X-CRM114-Status: GOOD (  13.56  )
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

On Thu, Sep 25, 2025 at 1:48=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance.com=
> wrote:
>
> @@ -17,6 +17,7 @@
>  #include <linux/cpu_pm.h>
>  #include <linux/export.h>
>  #include <linux/kernel.h>
> +#include <linux/nmi.h>
>  #include <linux/perf/arm_pmu.h>
>  #include <linux/slab.h>
>  #include <linux/sched/clock.h>
> @@ -696,10 +697,12 @@ static int armpmu_get_cpu_irq(struct arm_pmu *pmu, =
int cpu)
>         return per_cpu(hw_events->irq, cpu);
>  }
>
> -bool arm_pmu_irq_is_nmi(void)
> +#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
> +bool arch_perf_nmi_is_available(void)
>  {
>         return has_nmi;
>  }
> +#endif

Should the previous comment move here, AKA:

/*
 * hardlockup_detector_perf_init() will success even if Pseudo-NMI turns of=
f,
 * however, the pmu interrupts will act like a normal interrupt instead of
 * NMI and the hardlockup detector would be broken.
*/


> +static int __init init_watchdog_freq_notifier(void)
> +{
> +       return cpufreq_register_notifier(&watchdog_freq_notifier,
> +                                        CPUFREQ_POLICY_NOTIFIER);

I think you need to do something to prevent this from happening on any
platforms that override hw_nmi_get_sample_period(), right? These
cpufreq notifiers will be useless in that case...


-Doug

