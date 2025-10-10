Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0BCCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 08:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/Xo8ew0L5FECVPdkYszzTEPu1YGq0tz2Pf/3efb/XY=; b=WxMClxzME2lLZtVm2+qo31kX+c
	TwE2hmx6waalZkW8I5fWsvP0oOLPkkm8sxjk3k/6e/J+KMciyfdW/LQL9sV90F33RfrSEJMRVXDYJ
	YhStQoEddmASmmbImcTyOUBJ3hzmN+3zxjQTM500oU7sxGlvw0c7IqMNm5nKywuu4kmE5OjLYbMtp
	m9iF/qFrNtHGyaA7OeSb/fQqARdU7krHxJVDzZtPmhMUfVqdY0M0b93uAK5VIwyDYBYb55KdXMs7+
	jStFHi4XwSHCz3MQDgawrw6LxZI8hqW/c8+aZRAYwVX1rM3bij4EBTgfQguuaxFC8uOfhoTyK2pE/
	IdL1NozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7870-00000007wS8-3X5T;
	Fri, 10 Oct 2025 08:04:26 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v786z-00000007wQu-00lc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 08:04:26 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-635349b6fe6so1835702d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 01:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760083464; x=1760688264; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/Xo8ew0L5FECVPdkYszzTEPu1YGq0tz2Pf/3efb/XY=;
        b=w7y3CfMT2JCKdEZt+RBlr1ds965L4mOWpbGx0W3VKKdIRDHUxp2pZeFr+eKv43XRG9
         dnQSKJIiJKEdStpJG2+WHpDvnVbT4bXF4WYpfQOl1eqJ54GTlhKZhUtZ6zsS5s7HddES
         PrycaIpU4IwcUpsThGtydKfgu2JntYyKQfsJdHs83PC3TnRBKXAFxe1rvazCvYQkDMAv
         U03CtLl66qp0Siq5uEsOkG868qxqerMEX3QxAwz99bLJ6JyrO/fKClHjOphYkNsjQA0j
         8ShBZ2ku74yung/FzfdFjNjAUSKujHtRVFaELqiJfWTbbG0qvJbebG7z8CPMAym1j2py
         EALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760083464; x=1760688264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/Xo8ew0L5FECVPdkYszzTEPu1YGq0tz2Pf/3efb/XY=;
        b=Mo3hVHCzqCX/LyNTfUX3ovTbk9Ck4p2s0HyuD+WwjVGZHlwi2HyceTNgxxWXL8qy/K
         ysUdP0EFRGDmnr5ITIaF6Fai8WVe2mC610yyuX/8sexpRMmXeanAgCfskdoJ2PilIGd7
         TaXiKg+LmUdvlAmtIrGX2OmhM8O/yKUVIQHKBZBFOTZTrb3YWkv/VeMb5nBf7RyBGSx6
         H4pSVWLYuOW5NDvADvPa24DxDaMS0aUOAt8MuB3imhK6mGJY2dtX73jOci5mX1M9K0dF
         rpragKob5UVNjbOHsEhzMG9kDx0kEne/9RUHR+z0I5BuEjskPsDQFB3csbY05Vt9E0x5
         Euiw==
X-Forwarded-Encrypted: i=1; AJvYcCXwZaQYTZ+WvTsFDhYZxZQMduPZZLgI8xUpaS4Zdc/IrtuPq0wShVXKDepy7+fUNH6yzQJb3AEdDAm2X9g4l6dH@lists.infradead.org
X-Gm-Message-State: AOJu0YzW8gRoTa7ZdBxM3KLaD5yXiIrqgYpL6Z7mDAfLzR9A1XwfWCtl
	02iVrE7tBezyDX1Kl6+uHALV2odOievNC2h5YaUSyaDAFcP6iR1JxMN/YXohBd+uLLFE8cMGZtx
	hnVxGIz/q4deGqpGa9hP/qdmnqvjP9kKblbo7aDb58g==
X-Gm-Gg: ASbGncsOW2ltBzsnQvhSSj9a6LsDotw4J4X6oz8Wy2UfEsWUE8V4nbxXsqj0xK2f1iB
	K7FgxY47uEjFUMXL3Z3yBsZsv6Yvq/rAzE5002TWzoer8QtGmckAkiXj87sT6MEEmszAKHAHQtp
	mEF8ZEJZdnRhsOOE2UYbPfjj9n3tbCF7l/+acnavicxE3zLLVBm+0qroiV9ENdCzY0NjSqI8bJR
	q1t/SFVHz2boTDsqupoutwtGXNbVkY=
X-Google-Smtp-Source: AGHT+IHK7SB5Cnn9QOkw+sbnesDp7lzRrH2FM7xkTeY2Yi0ZWo4oU7txEbfLgYeg0eGw6i4221NM2N1SzpTNshdDD5Y=
X-Received: by 2002:a53:d90e:0:b0:632:eed1:da93 with SMTP id
 956f58d0204a3-63ccb90ae22mr7823351d50.25.1760083463910; Fri, 10 Oct 2025
 01:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20251003150251.520624-1-ulf.hansson@linaro.org>
 <20251003150251.520624-3-ulf.hansson@linaro.org> <20251006-manipulative-urban-antelope-31101f@sudeepholla>
 <CAPDyKFoz4P6cZWNA-omNtF3XqKKciC07aVXBTVQp8ueyyYxmxA@mail.gmail.com> <20251006-spiked-beige-gecko-6d8748@sudeepholla>
In-Reply-To: <20251006-spiked-beige-gecko-6d8748@sudeepholla>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 Oct 2025 10:03:47 +0200
X-Gm-Features: AS18NWC0yHpFVuf7m0XvJ_onIcbcboSuQo-XWvaukKreqMILTAM4kGmbpyMFXbg
Message-ID: <CAPDyKFrGbeAzSTA+05ZLern-tBKq150Odo4Oi6tvLAWV6R9iYw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: smp: Implement cpus_has_pending_ipi()
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Maulik Shah <quic_mkshah@quicinc.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_010425_048149_32FAA911 
X-CRM114-Status: GOOD (  20.81  )
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

On Mon, 6 Oct 2025 at 16:41, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Mon, Oct 06, 2025 at 02:22:49PM +0200, Ulf Hansson wrote:
> > On Mon, 6 Oct 2025 at 12:54, Sudeep Holla <sudeep.holla@arm.com> wrote:
> > >
> > > 2. I understand this is intended for the DragonBoard 410c, where the =
firmware
> > >    can=E2=80=99t be updated. However, ideally, the PSCI firmware shou=
ld handle checking
> > >    for pending IPIs if that=E2=80=99s important for the platform. The=
 firmware could
> > >    perform this check at the CPU PPU/HW level and prevent entering th=
e
> > >    state if needed.
> >
> > I think this is exactly what is happening on Dragonboard 410c (see the
> > stats I shared in the commit message in patch3).
> >
> > The PSCI FW refuses to enter the suggested idlestate and the call fails=
.
> >
>
> Ah OK, the PSCI FW is doing the job correctly, we are just attempting to
> reduce the failures by catching few cases earlier in the OSPM itself ?

Correct!

> Sure it only reduces the failures but it can't eliminate those as IPI mig=
ht
> be issued after this check in the OSPM. I understand the call to firmware
> can be prevented.

Yes!

Although, it seems we are ending up doing a ping-pong game with the
FW. Note that, if the FW responds with an error because we have tried
to enter an idlestate for a group of CPUs, nothing prevents idling the
CPU again and hence we might re-try with the same idlestate (at least
until the pending IPI gets delivered).

My point is, this problem seems not negligible, as you can see from
the stats I have shared in the commit message of patch3.

Kind regards
Uffe

