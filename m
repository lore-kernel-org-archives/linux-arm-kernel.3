Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF505E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0a9uVHj0MFII1RtSBeG+K+r0Fep1zBrIePBFN8AAic=; b=DogNTB+8R0cmyZU6sp9A/UCmgv
	ujF0OfBEt9frnBzmFozQsjc4+xtSmXtX2xfdcp+05udPY1NdozDbviGmGtBMlnAAHcjsPZ5CpAL5I
	3tOVuFLFLMHWi+DzzO07O7sm7NUTfATJ5IzvHAAJF/HA/Sx24ziNSwxDTjj8UjufWOLayni93lvvY
	s3onOP/PzUZfk2jLCjuNiB+mx1VCmqsFzf1shM0DHEITEUbyD/Dd/+XVEjH7Tcra4QgdNPAItYxxa
	ClljRJRjaafjBRInnxk1CL54+UAiRhQbrAUrGJSzH+uz7kXCDICIELKYDHTxdEF+nBNIzu6qZBl03
	DswfUnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfO8-0000000HT94-3OME;
	Thu, 12 Dec 2024 09:21:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfLi-0000000HSLg-25Uw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 09:19:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361815b96cso2241075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 01:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733995148; x=1734599948; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0a9uVHj0MFII1RtSBeG+K+r0Fep1zBrIePBFN8AAic=;
        b=QwpIH3dXHZcd8wQbmVN1giM86rkUq464PC3NatBzGGqTT4i6MOqgYUWpcCmxcMETGF
         UVSV++eD2V6g81c0eIqNKJh28Qs1TrWtg955/NrtI1oDyaq+uBAYom9qcBuqf25UAMZ6
         dHYP4HeVnI0peBDTjNfiVAetHiM6fFZXxlHgZdCQRwsrSMguT/IJLlJwkGcbf2qBzAob
         cfvd2h9nJUKnpzSD1i2P4LqdwWKabI/v5WqaJqx7cjDM6Y8ky2BfiRvClHOv05UZNrX2
         icmYWgdQK98tIrxpW64rcIV3GppLU/NsMlUpJYWVxur1QhxgPZ0pksPqR8gdIhS8C3tv
         a9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733995148; x=1734599948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0a9uVHj0MFII1RtSBeG+K+r0Fep1zBrIePBFN8AAic=;
        b=ZeMO4kLjRne5XQt38s79XeqTuHiS1PdA5qS3GAXA0CvtG9n/rQxZcSeymJcgVhR/Jw
         M/DxTKi0oztr5IGnZQ6OkBHBZpkbsKd4xvAhT7X01awxxlNJ06ulw5naTFW5UKmGLdfV
         KXSj50k1cf+bOfWWMScDPV/IC2Dg8BdtYewuH/lXZ/1PShyWGu8ZHGWU4KXuAdCzWjW0
         CxJe6r1yheAHHVcSeVVXu0MF8Nz0iTqDD6aW7yIxb8Qu3m/T9iQhd9XbrZXWQUyLXNf9
         476WvG6QCrwJ7ZspO2m5lvw4676AheJFHXU12rup6+LJ+KtdyqQ7DvSVPoHJCbm+ihwJ
         DEzg==
X-Gm-Message-State: AOJu0YxWSR3HYy0wiEQ+U5DOl8YjSnWcCcV8Qdh2U8/BiC4OObgx1gJW
	raL5zFbFUOCm1ki6V0RDWo8Gh4/56fxxm4NFdGIf1QDmJ4GXPQR3JWkf4/2SnFzO6gtS7s9FSXV
	XeZJmHrj+KqMnZdSBJSHg3clt75g=
X-Gm-Gg: ASbGncunEDJqBzVzoJr4rIcr88NJw6ffS7kWfXr+7T+yWph4a/jCm4yQH82fC9nfd/+
	f+sL3M/v9XZ2g6Wp9trQfZgEVDrpJ3RNGPJpYKuw=
X-Google-Smtp-Source: AGHT+IHgSIGyFnE08dyyP5NFrnFmPIIBGih2q0tSX3ULomU1UQVEgWDpmRj4F49p7i9YNu4ESNPLZDHhphuv4WV+WZs=
X-Received: by 2002:a5d:47c6:0:b0:385:f062:c2df with SMTP id
 ffacd0b85a97d-3864ce4968emr5512699f8f.11.1733995148067; Thu, 12 Dec 2024
 01:19:08 -0800 (PST)
MIME-Version: 1.0
References: <CAJNi4rMfhZOCT+7Ki14vUs+dZbv9cxCZ0s+jgn6=_om4NTgo_A@mail.gmail.com>
 <86cyi5tanz.wl-maz@kernel.org>
In-Reply-To: <86cyi5tanz.wl-maz@kernel.org>
From: richard clark <richard.xnu.clark@gmail.com>
Date: Thu, 12 Dec 2024 17:18:56 +0800
Message-ID: <CAJNi4rPDVXS3Ft3nHLXvMzHmn9d10Nz4Pxeduoe+v5HaK=CEAg@mail.gmail.com>
Subject: Re: Question about interrupt prioriyt of ARM GICv3/4
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	will@kernel.org, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Mark Rutland <mark.rutland@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	richard clark <richard.xnu.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_011910_535639_868B836A 
X-CRM114-Status: GOOD (  38.37  )
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

Hi M,

On Fri, Dec 6, 2024 at 5:37=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 06 Dec 2024 08:33:11 +0000,
> richard clark <richard.xnu.clark@gmail.com> wrote:
> >
> > Hi,
> > Currently seems the GICv3/4 irqchip configures all the interrupts as
> > the same priority, I am thinking about to minimize the latency of the
> > interrupt for a particular device, e.g, the arm arch_timer in the RTL
> > system. The question is,
> > 1. Why don't we provide a /proc or /sys interface for the enduser to
> > set the priority of a specific interrupt(SPI/PPI)?
>
> I'm afraid this really has nothing to do with any particular interrupt
> architecture.
>
> Before thinking of exposing the interrupt priority to userspace, you
> should look at what this translates into for the kernel once you allow
> interrupts to be preempted by another one with a higher priority.
>
Interrupt priority doesn't necessarily mean the preemption, seems
you're talking about the interrupt preemption harm according to your
statement followed.Frankly I am just thinking higher priority will win
the lower ones in case massive external interrupts received in the GIC
level (you see I am still talking about GIC, not kernel)
>
> This means that at every point where you would normally see a
> local_irq_save(), spinlock_irqsave() or equivalent, you would need to
> explicitly specify the priority that you allow for preemption. You
> should then make sure that any code that can be run during an
> interrupt is reentrant. You need to define which data structures can
> be manipulated at which priority level... The list goes on.
>
irqsave just masks the interrupt from the point of cpu, I don't think
it will mess things up if preemption really happens (no? then what the
side-effect is for the nested interrupt handling in the softirq part.
damage the semantic of the lock primitives?)
>
> If you want a small taste of the complexity, just look at what
> handling NMIs (or even pseudo-NMIs in the case of GICv3) means, and
> generalise it to not just two, but an arbitrary range of priorities.
>
> If you want the full blown experience, look at the BSDs and their use
> of spl*(). I don't think anyone has any plan to get there, and the RT
> patches have shown that there is little need for it.
>
As supplement=EF=BC=8Cthe fiq is suggested to be used as an alternative to =
the
higher priority in the RT area...
>
> > 2. Is there any way to verify the higher priority interrupt will have
> > more dominant to be selected to the CPU (IOW, the priority is really
> > working) in case of multiple different interrupts asserted to the GIC
> > at the same time(some debug registers of GIC like GICD_REEMPT_CNT :-)
> > to record higher priority wins)?
>
> The GIC architecture makes no promise that the interrupt you
> acknowledge is the highest priority pending interrupt, because this is
> by definition a very racy process.
>
> Also, even on busy systems, you will very rarely see two interrupts
> targeting the same CPU being made pending at the same time, so that
> the interrupt delivery system would have to arbitrate between the two.
> That's because interrupts are vanishingly rare in the grand scheme of
> things.
>
1. I am trying to stress the external interrupts to the core#0 via the
stress-ng tool with one of interrupt being configured as higher
priority to see the benchmark data, it's time consuming as you can
image, still is in progress(BTW, I can't see any lockup similar hang
in the system with a higher priority configured)
2. This raises a very interesting question and I am also very curious
about is, what is the purpose for the GIC to introduce the interrupt
priority features, a placeholder feature reserved for the future? Ah,
hardware prefer to provide more functionalities than its being
actually used by software, any other justification except that?
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

