Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA45D3A696
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 19:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wF8AVBE566042dEisFc0/QOULIDtd917EPRX8LpaS4Q=; b=ytBP3GaXpE80N2zdXzOS/V4e6L
	FDMpPLgMRbd9ntR4Y/terBhxhfJVLP4ic8fhheEAnxktOE0Obl2HDQReBBDMtpl+6yaQ4P5JHXy/4
	E8SatO9vQqDQ4dTovZg637u2b8/2+bxtFRNiQIgNd8bNXC+l8Y1+GaBZ6lQAN1joPp3ww7uuz8ZTK
	wk1S/dTiSNPmshvvWHfpuTFdVd9guThgGorBzd5N29ePo2l4ih7Vuz4/bT33JqC86apMXTDZQMeeo
	yMgUMKFPhpvv9978oaVIJ6DkmsmD+UoeZh45+3KlMmewK6t+PY0SdFTwmaakbOpDkSTDxJREPmyAJ
	M/neM5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sJY-0000000FhzW-2mII;
	Tue, 29 Oct 2024 19:55:40 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sHt-0000000FhoX-2Amk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 19:53:58 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-4a46fee3b16so96625137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 12:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730231636; x=1730836436; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wF8AVBE566042dEisFc0/QOULIDtd917EPRX8LpaS4Q=;
        b=rVRzMwP/fo/ICiI7eWY+hq6BVWmZBas+Wspi80zJCnaxyEWcCmRpOhy6J4Q6F9I0R/
         Rmo9Qb7ibL8L9avU/o5GqiVfJFFK0iiRj8SgzoTy+vULg64hjJMQ/M5YS7Aad+uMV0zn
         JbxFB8Uk0YOXoIk6WHqq0E8D4NXKIiVIhFaYh93HtlKicLhGrxIaBoibdTLmRBX35b0a
         LScyV1SGfO9mnS7Wzk2vmEWO1QiBAMgJK+Hne7TFDsso6oJDOtedLlNbPg7laeK3M7pa
         r7VlN6WXujrsuXRyPsaya715ifTion4MAtktu/pOSWiMwqb8CDtZXQO/vVU1rUmZ83kB
         Fawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730231636; x=1730836436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wF8AVBE566042dEisFc0/QOULIDtd917EPRX8LpaS4Q=;
        b=U0kTSpDQNnATu5H8mm0L1dVyvHCMZVozqTQHbRrS/mjG5x8Ch/Y9hB5R+6LTJNGg8Y
         8po0bERzJNNP3W51fbeea+5mSZ2D4EpMoaH7b6UZZig6ZdRSITsbQAKPcgreZLoR5ysb
         fxMij7sc2ZKM5/8KhnqqVGr0YptNBixA972H2Zuc8/9HFuFdPKo2nwe1j0j0Oa46C3bS
         K3beAe2oinj4wLEsfqWC4La4vQH9LUlUUDdhp9ZLs9cYE2I6kY9LTyTLujj85gVoyXAg
         xc6L7w/ZSdPNr4lpFuWVpKlze7jeUPeQKAUEa+bepW2fonBMDRb627eFhmdUGcPpKoUJ
         KywQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEmMAEmGOsIZrZmPxoNoCYiku7pYBXCEx3bw7poXQSKn3292qq2T6Yz2T6RFG6fvFCyEqc6IEhPGFT/mzRKK7F@lists.infradead.org
X-Gm-Message-State: AOJu0YwrlvkjocPDuODTe3/3XsI6x1YzBOTl+9YgXfLUVnk4LZFzkKhj
	RxHguUf8L/XFSi0YpDsSBUkxgo4DxSh6xfowyNUqyygzWszVmK1nisRlg42tiCmJ20fquyoe764
	C1v9ebkYbi51KmCB0Mg2zvf3ZAP2SJuLX4tJpc9zWYLTEIyla8Q==
X-Google-Smtp-Source: AGHT+IGiqS8zkowA0hhH1G9zpWHqiGgjCkwEqm4HQq3vuHcJXKhYb0OieWP/5MMHrb/rtD2no9MHT8oFzOwREShVmNE=
X-Received: by 2002:a05:6102:a52:b0:4a4:77c7:9471 with SMTP id
 ada2fe7eead31-4a8f67c4340mr2620516137.5.1730231635771; Tue, 29 Oct 2024
 12:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241021042218.746659-1-yuzhao@google.com> <20241021042218.746659-4-yuzhao@google.com>
 <86a5ew41tp.wl-maz@kernel.org> <CAOUHufanq2_nbNiU_=mCgWufoSGDOS3EpAz+4xB5kB=PV2ECVA@mail.gmail.com>
 <86h6902m7y.wl-maz@kernel.org> <CAOUHufbEadyAn0WVdJqYKkUjvMfGXXiLjaApjhaHKg93P8Rymg@mail.gmail.com>
 <864j4u3f7l.wl-maz@kernel.org>
In-Reply-To: <864j4u3f7l.wl-maz@kernel.org>
From: Yu Zhao <yuzhao@google.com>
Date: Tue, 29 Oct 2024 13:53:17 -0600
Message-ID: <CAOUHufZFQ+RrSRiSw00Gv8bjn04hAg92eAbdp-tRoKM36R7uVQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] irqchip/gic-v3: support SGI broadcast
To: Marc Zyngier <maz@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_125357_580197_AD4228E2 
X-CRM114-Status: GOOD (  25.35  )
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

On Tue, Oct 29, 2024 at 1:02=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Fri, 25 Oct 2024 18:31:01 +0100,
> Yu Zhao <yuzhao@google.com> wrote:
> >
> > On Fri, Oct 25, 2024 at 10:15=E2=80=AFAM Marc Zyngier <maz@kernel.org> =
wrote:
> > >
> > > On Fri, 25 Oct 2024 06:07:45 +0100,
> > > Yu Zhao <yuzhao@google.com> wrote:
> > > >
> > > > Hi Marc,
> > > >
> > > > On Tue, Oct 22, 2024 at 9:03=E2=80=AFAM Marc Zyngier <maz@kernel.or=
g> wrote:
> > > > >
> > > > > On Mon, 21 Oct 2024 05:22:15 +0100,
> > > > > Yu Zhao <yuzhao@google.com> wrote:
> > > > > >
> > > > > > @@ -1407,6 +1418,13 @@ static void gic_ipi_send_mask(struct irq=
_data *d, const struct cpumask *mask)
> > > > > >        */
> > > > > >       dsb(ishst);
> > > > > >
> > > > > > +     cpumask_copy(&broadcast, cpu_present_mask);
> > > > >
> > > > > Why cpu_present_mask? I'd expect that cpu_online_mask should be t=
he
> > > > > correct mask to use -- we don't IPI offline CPUs, in general.
> > > >
> > > > This is exactly because "we don't IPI offline CPUs, in general",
> > > > assuming "we" means the kernel, not GIC.
> > > >
> > > > My interpretation of what the GIC spec says ("0b1: Interrupts route=
d
> > > > to all PEs in the system, excluding self") is that it broadcasts IP=
Is to
> > > > "cpu_present_mask" (minus the local one). So if the kernel uses
> > > > "cpu_online_mask" here, GIC would send IPIs to offline CPUs
> > > > (cpu_present_mask ^ cpu_online_mask), which I don't know whether it=
's
> > > > a defined behavior.
> >
> > Thanks for clarifying.
> >
> > > Offline CPUs are not known to the kernel.
> >
> > I assume it wouldn't matter to firmware either, correct? IOW, we
>
> Firmware is on the secure side of the stack.
>
> > wouldn't cause firmware any trouble by letting GIC send IPIs to
> > (cpu_present_mask ^ cpu_online_mask), assuming those two masks can be
> > different on arm64 when hotplug is enabled?
>
> You can't send SGIs from non-secure to secure using ICC_SGI1R_EL1.

Right, this makes sense now.

> You
> would need to use ICC_ASGI1R_EL1, and have secure to allow such
> brokenness via a configuration of GICR_NSACR. Linux doesn't use the
> former, and no sane software touches the latter.
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

