Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192DCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 00:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bs9njDxfO/UPuD4IumQI6a3fniuB7rskHCC70+8QjJ8=; b=mf7jy6GGP8ZSC2Glib8Lsoc5TY
	p6vscwmGHYr12Je7TLdbU8823CEOfJO5QWLLc3ca8jJdYTUI6ZjYsv2tQqzkDV3c2uGvNep2dhPRk
	LUXU2EI1H0A38a33uZtHORnz+1DmOEFcxbfsOuEjmiq+ljxn09jFZh6fPiNy5lAvBZJqu3gpsamys
	Jhfj4NJCz3XQbvM2xoju8uAQVNDPzKsFw/VoyCY3fyYRR4WQdemWcbAFFsXbLeGOFnaIkNJ8ZRL9o
	qxNxad7u3wdMyUoIvNWu6dLpay2xvPvB7vwvHey+vzCxphASG9jCCtiEjZvazq/b/B/M0lCvwd8PO
	eVkngGvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0r0P-0000000D8jQ-42Hy;
	Sat, 05 Apr 2025 00:03:25 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0qyf-0000000D8W5-2cH4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 00:01:38 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-47666573242so163741cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 17:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743811294; x=1744416094; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bs9njDxfO/UPuD4IumQI6a3fniuB7rskHCC70+8QjJ8=;
        b=D2toPXLv5DgSkgXwftu/ICdmbhqhUv4sV6xZPxC6Glhn8z3OmMw94FU8NIjT9sjHjc
         og6qkFU/tUfC3au9MXUm0Am2ndMBg5YU3kK9m5GZSgXF1S1UAy8jjmgGww7KzswXisW7
         3IhaNwtzz5wOeKQLwl2FK76siWob/+NbGGt3QYEVYWmSeSvkP/LYveRag2bmXHcmzw2b
         haS+bXux/bCrKS3iUCwXXyp3TpVKgYfE/LoOIdfPalattm9rBdtvcMus0xQSH7b0ambQ
         n7gtBLsVyDjxGs6Z4Cl3I+VDRFAvKtgp+WcIMX57x+VNc+n0vBysm3FsDC75YIapVwxl
         Wp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743811294; x=1744416094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bs9njDxfO/UPuD4IumQI6a3fniuB7rskHCC70+8QjJ8=;
        b=AXnnM/B1JYApF5T+PAlsTNRjoQiGPrBFNFWOqs//NnBH1deBUJy6hNdDmQtZ3drf/A
         ktyEuXlsj6cZYRn7usvJQjiqgkC6euSxl6kgJnHBw3doq7Bf0zsWpg8z7BTxOlCAdxY1
         wTZ9MtODRzpIuNELsp5NxA4ntiAgSvCUIokc/abnttyXcdRK89212DKb04V8/OFRYHyx
         Qaz97/gftnXqSD6chPcUPnppTi5y6a94M8QcQOjIAYw17ZBV6yLLyWzwV6jaR0R14I2Z
         Mq7TqMj0d6y2ubtGf7h1/r4hCBjNmSNvCfmC65rrnWJLex3Fzj1JLgbhuWnohqhoFKMM
         +wfw==
X-Forwarded-Encrypted: i=1; AJvYcCWa/xmkBuwIZj9ZrLF0Y3C4fzC0vqucvUhUG2nqZFAEoQwZ1h08rbcSxLVFdyIEO6pNPdEv0LcvwZbvcXNyT6yh@lists.infradead.org
X-Gm-Message-State: AOJu0YwAxcIc2IJdMgt8FKklUDjkCmPiizeiWWB65J00UV0zMGlTS1ub
	qJ2/AwKyqU8SgRQIZueeC3gRftaluknRPlalz5CBfo+B3M6eM51zZlqWb+d2SsqwJy5AqGEo1zk
	pGkB42LisC31kx1i/Le9+itCf97ZHryqFjMUicX9H91Du6AB8NiF+QV0=
X-Gm-Gg: ASbGncumgHOXipda+vMdNkaL5sKLUYpj99mKTQ4ZY0lPjZwbvrG9gDZ2DlSdKCyOeiE
	dWMPavrEQDSbNuUYuXSC1eyAUjPUCCGrWaEzA3mVrrk/DP71MxSGTKNzVgPGrfncCj/9nfRsQ7F
	3vbMUfhSnHCcWgGTJWFwe+j4CBPTZ9ejU6rhm9v6+g/yp6Tk+qLIJcvgyJt/I=
X-Google-Smtp-Source: AGHT+IG31MySeEuDpRESn7yDe70KztZLDYHNiWJTHLqTScxeoaWWTA9NWscHpg9wUOdriSga5X/vaYScrXoyeoYYsl4=
X-Received: by 2002:ac8:7e82:0:b0:467:8416:d99e with SMTP id
 d75a77b69052e-479333a2c5bmr745071cf.21.1743811294445; Fri, 04 Apr 2025
 17:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250404220659.1312465-1-rananta@google.com> <20250404220659.1312465-3-rananta@google.com>
 <Z_BksUn4JiPPGc4G@linux.dev>
In-Reply-To: <Z_BksUn4JiPPGc4G@linux.dev>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Fri, 4 Apr 2025 17:01:23 -0700
X-Gm-Features: AQ5f1Jq0s70hCQMi54jnhNNYSQm6SIED-nce3BxiWWVuRKa9bdstap1Vc309pC4
Message-ID: <CAJHc60y6pTCS+4qtQmT0ttMK1ZOH36tCXpU+yc2DytgKc=AiPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: arm64: Explicitly set the page attrs
 to Inner-Shareable
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Oliver Upton <oupton@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_170137_676713_C37BDC3D 
X-CRM114-Status: GOOD (  19.79  )
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

Hi Oliver


On Fri, Apr 4, 2025 at 4:01=E2=80=AFPM Oliver Upton <oliver.upton@linux.dev=
> wrote:
>
> On Fri, Apr 04, 2025 at 10:06:59PM +0000, Raghavendra Rao Ananta wrote:
> > Atomic instructions such as 'ldset' over (global) variables in the gues=
t
> > is observed to cause an EL1 data abort with FSC 0x35 (IMPLEMENTATION
> > DEFINED fault (Unsupported Exclusive or Atomic access)). The observatio=
n
> > was particularly apparent on Neoverse-N3.
> >
> > According to DDI0487L.a C3.2.6 (Single-copy atomic 64-byte load/store),
> > it is implementation defined that a data abort with the mentioned FSC
> > is reported for the first stage of translation that provides an
> > inappropriate memory type. It's likely that the same rule also applies
> > to memory attribute mismatch. When the guest loads the memory location =
of
> > the variable that was already cached during the host userspace's copyin=
g
> > of the ELF into the memory, the core is likely running into a mismatch
> > of memory attrs that's checked in stage-1 itself, and thus causing the
> > abort in EL1.
>
> Sorry, my index of the ARM ARM was trashed when we were discussing this
> before.
>
> DDI0487L.a B2.2.6 describes the exact situation you encountered, where
> atomics are only guaranteed to work on Inner/Outer Shareable MT_NORMAL
> memory.
>
> What's a bit more explicit for other memory attribute aborts (like the
> one you've cited) is whether or not the implementation can generate the
> abort solely on the stage-1 attributes vs. the combined stage-1/stage-2
> attributes at the end of translation.
>
> Either way, let's correct the citation to point at the right section.
>
Ah yes, DDI0487L.a B2.2.6 seems to be very close. OTOH DDI0487L.a
C3.2.6 explains why we see an abort in EL1. I can cite both to get a
full picture.

Thank you.
Raghavendra

> Thanks,
> Oliver

