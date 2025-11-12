Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D40CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 14:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9n58C/Mv0Sic3JO1Ea4b119vNwwehDSsas5hUi6V4tw=; b=epCuAfqjpmF/wBJMIzBAksnIvK
	YecPHaNeAmBaBJXn29ndltDVl455w3dKArCyC9HiGN3ufKucLeXmoUdJ7hVBDAORBM7HzDpiKtkhp
	NVGvrhtV7iikMXhmalmK+cL7PlNL9pe8IcdLjHHjn9g42Oe12jWfTBIgydclYnHTp0Kxc6sF5q3Im
	zmtNVJ+B1M1Fzlo4L/hrCShZkfgp179bmu0Mqb8AfPfHrRB1i2SyY5VaVnRVrX/B5d1hQEC1wq4i2
	HyhiEc5KyW+A28BJ7BmVJzTEXMYh3ssdItEWUoe0IytOlgWo44yk7WltpMyc0r7wldO7I2R5HlLjV
	ZVJ97R6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJC0n-00000008wsQ-3aRr;
	Wed, 12 Nov 2025 14:39:53 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJC0j-00000008wrd-3ZVF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 14:39:52 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8b29b6f3178so80477385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 06:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762958388; x=1763563188; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n58C/Mv0Sic3JO1Ea4b119vNwwehDSsas5hUi6V4tw=;
        b=DQGv5BRUAc12WCZHZRNRLL/uOTJPRlgrKi6Ep6siUC6+dV1vL9Qt3q86RvyxJoK10o
         HuWIWmXHXLhxmPlgn26EHsKF/NB8FhlAzYpg1p0j2Y6SiDxQkBnOMUPJM0ukpHhJEflO
         XbdswsoZLQfUChOzcWa7fE9NTZi24IgfSliY2M6y0L2ZakGzHF0h/nsvQ0S569l32xYo
         0mxJCuvUUmmEKh6czEgmThzE/UTjR9O7sGHvu0DDEXH7853R9gkW0qnWVAaudYg6dvFv
         nWf31C40nramN0TP4+ZmpisQIiRLlEsFdWpEjC27vGRYSvbKZxJqiq0Y12QFOF13uBD1
         DBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762958388; x=1763563188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9n58C/Mv0Sic3JO1Ea4b119vNwwehDSsas5hUi6V4tw=;
        b=KEcJc4DwKDK/RG9bjn/OKtEBQBzFRERvllDjnRXjSQP5en9X+E9t2ndx6yaasykYmb
         zv5aGYp72fWgsbDd8VuKQVdP9W6a9qDRuHnbVO4gLZUEjs2SRPXThEqogev8yv7AZy7O
         ZEndVR8RYFJt3v60v8nZdhR4/MDte2I4R9HfOi294OvR5fdq0PCZYMdWUYxQsgBO1UPx
         PvsQjBPqgE5B8GlwG//FgZpusw6mGAZXp0UzNYUMdUqrpYA9g/2ETWDcKV6aVSLu9mfS
         y5ub6/bh/MbiGmVytDH2hkIEvfuY2l1Lp76j+nWKlmUJ8VFt46jAMpgSPCfvYsT7KYWL
         QgRA==
X-Forwarded-Encrypted: i=1; AJvYcCU3WhLgAdcLD3Ibp4RDvGnyyLI5sCnAn4Tq56Z4S3hF+g4yvHbqf9vZ0kUg0MNs7/7aicN2pUbCVJdNYfmtvmST@lists.infradead.org
X-Gm-Message-State: AOJu0YwneTKVqCd1bfRUSnHVnaMmjyzn0R/JzvPhs4RU9C/v4Ig1qTdt
	ruuVeLlJWXFWCjxBcVnEw8+tzQIlxSl2bRfcEKVGkRM6w+1AK/KCNyro9fy4GDt5mKNf+SJdNKK
	gU5/jhasnO0B6AWFBrqDigt8dg714jn7SCrvlm+jdCA==
X-Gm-Gg: ASbGncuLxqmv+rLplPtkZoawqX627rTUtAUbCc51yMg3I6ySVHSVR8c+i7Gm/wSKwRA
	tca9UuIcryoI3LShqiKMJ/5JJ4siOjnu0IfDA49LDiLkNza9awKstUl9MTEIQiaLo2mg4FRDkF3
	P5W4nk9POYCydFBWZdNV/hL5FdKX4BzyY4eM4dvRoD5dgbhS/Cww1ti+ykcW2OkEPgUrsAIilZX
	ep7XpAw8yYlM1DrTqxLrkjBw7AWsjfDnGQ5eMQRdeJpVssougVIzrxiI1tBcWVNqd1AhIeLcbN1
	o523HdiQqOlYqInskg==
X-Google-Smtp-Source: AGHT+IGnpkiHznlH5zXNOKiPFo/KCAMlC5+0ynlrBUlzZrbvE5iwlpYeH83Geq1qBEqYYCTAjLeH9AQU++RBF0SSf64=
X-Received: by 2002:a05:620a:44ce:b0:8b2:621b:fa30 with SMTP id
 af79cd13be357-8b288a0e91cmr917876285a.35.1762958388236; Wed, 12 Nov 2025
 06:39:48 -0800 (PST)
MIME-Version: 1.0
References: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
 <20251111-arm_coresight_power_management_fix-v6-11-f55553b6c8b3@arm.com>
 <CAJ9a7VjpmWdethzwpKuo8mvGxU69HjZieGh+6iqTN6aSEow5gA@mail.gmail.com>
 <20251112111923.GG281971@e132581.arm.com> <CAJ9a7Vjj_KXA0aSvDPatg3eN-PJ3Q878n2RF53aKJK1r53d8SA@mail.gmail.com>
 <20251112135609.GH281971@e132581.arm.com>
In-Reply-To: <20251112135609.GH281971@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 12 Nov 2025 14:39:36 +0000
X-Gm-Features: AWmQ_bmPygnuwldpa5fzQR6VdWUmHZJ1_8h0SO_N15kN6XSHpNY6NUqpGV-SDcA
Message-ID: <CAJ9a7VhyJLjkUO-5Z6n3Sufr7eQMB5+jH-RD2jQTbJdhAvWi7g@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] coresight: etm4x: Reuse normal enable and
 disable logic in CPU idle
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_063949_921458_E2C393F6 
X-CRM114-Status: GOOD (  39.44  )
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

Hi Leo

On Wed, 12 Nov 2025 at 13:56, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Mike,
>
> On Wed, Nov 12, 2025 at 11:58:26AM +0000, Mike Leach wrote:
>
> [...]
>
> > > I prefer we can use a separate patch series to address this issue (I
> > > should review Levi's patch series so can make things proceed). At the
> > > meantime, I would say this patch is still valid.
> > >
> > > As a side topic, actually we have found issues for the config is
> > > reset when start a session so the user's config does not take affect =
at
> > > all (see etm4_set_default_config()).
> >
> > This code is used by the perf session - not the sysfs session. This is
> > deliberate to start from a stable state and add any configuration from
> > the perf command line.
>
> My feeling is now the discussion mixes up two things:
>
> - Should we apply user's parameters (via sysfs knobs) on a perf session?
>
> - Can a perf session overwrite user's parameters?
>
> For me, there is no reason to prevent a perf session from using the
> user's configs.  We might disagree on this, but regarding the second
> question, a perf session definitely should not overwrite the user's
> parameters =E2=80=94 it can ignore the user's configuration, but it must =
not
> erase these parameters.
>
> > The perf session deliberately ignores parameters set by sysfs - in
> > fact the first act in parsing the perf event structure in
> > etm4_parse_event_config(), is to completely zero out the entire config
> > structure. Then the default config is set - which guarantees trace is
> > captured, then any perf command line options are set in the registers
> > (e.g. timestamps, address filtering etc). After this if we have s
> > cscfg configuration active, this too is added in.
>
> Seems to me, a correct sequence is:
>
>  1) Clean up hw_config;
>  2) Apply user's config on hw_config;

The configuration system was designed precisely to implement the
concept of a "users config" without the unnecessary burden of having
to program up all the ETMs via sysfs in a multicore system.

The users config you describe is simply repeating work already done.

The danger in using sysfs configuration is that the perf session
cannot possibly know if it was set by the current user of the
resources or left over from a previous session.

The only elements that should affect a perf session should be those
that appear on the perf command line - these being the traditional
commands + a named configuration if present. This means that the owner
of the perf session is 100% sure of what is being requested.

Changing the configuration of a perf session via some backdoor sysfs
additions is unacceptable.

Regards

Mike

>  3) Apply cscfg on hw_config.
>  4) Apply perf's format/config on hw_config;
>
> In this sequence, the last applying config has highest priority (as
> the perf format is the latest setting from user).
>
> Here I am not quite sure for step 2) and 3).  Should we apply both
> user's config and cscfg, or we apply only one and ignore another (e.g.,
> if cscfg has been set, then ignore user's config, vice versa).
>
> > This ensures that the configuration run on all the ETMs used during
> > the perf session is identical - which cannot be guaranteed if we used
> > sysfs set parameters as part of the perf session, as each ETM might
> > have different parameters set by sysfs.This gives us predictable,
> > stable and repeatable perf configurations.
>
> Why can't we leave this to users?
>
> For sanity, drivers should reject invalid parameters when a user is
> setting it, once the parameters are accepted, afterwards drivers should
> simply follow the user's settings in a runtime session.
>
> Thanks,
> Leo



--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

