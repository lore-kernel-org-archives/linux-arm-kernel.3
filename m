Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246FFE9D402
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 15:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ecRcTEb92SQtM1u7QEFcSjYxtfBOvhj4/oRNwY0DAI=; b=Wfja13hMlCH7HHhxaMB/5pJRSu
	+ZKORo6alWfQxmO/ZuOn6REGvK32fGqK4fnbHFoZbwv3Z9v89ClzZn+8lZ258NGV8K+7qEskfxiH5
	b1ficb6fdIODdFMYDyYk0R1KGbRQsbQLWWdOPuIwSU61uiJZOp41x4q7VUE6lsUOldI/Om1pVqFlb
	RCGKLUWJi+Uu+Bes8jyU+P8AWSic1oWqwcEHAVnnqJYbSvpjKgU88Aa7kcKLZFEmBqfG4PHALIaiQ
	NId57vhfHd3FVr47JgTqeSCWDWcyH/eKeEWrz69sS1X27JSaPBdW7scQ4wnRYZE8lA5P0b/NBFdC2
	xWCpSPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfCw-00000008hq2-2u73;
	Wed, 04 Feb 2026 15:54:22 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfCu-00000008hoz-3tzz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 15:54:22 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-7927b1620ddso359327b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 07:54:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770220457; cv=none;
        d=google.com; s=arc-20240605;
        b=O9jeA7dxp25RUqwQGEYPzYHz1Pc9++00AGLVRAERcElnoDW1VIvA5ST9d9e1x29LYN
         ZdhcB6MqS/tOgrQXI8+egu1VVakK5SiK7pJfsDAGe4kG4ZvHB0mA4zHYMictT5Q3SFBq
         OsQLLZzaJWU8FANewScoblE39qPYiglVJvQ2bGk6FKp+gmmHWMsxzoIia3r0THfJrMzY
         csbdNOb3N/D46N41Q1u1W8PwJuHM8H2VKEcDvx4cNGBRaXiWPgYbA+gv22VbmIK4Yfve
         iMBfzxPPgpsxPgGuh/nBvFY61s+Slh40kEcMOIKiaMqcXkmleFb/aNlNof7IcCvYMgcM
         de6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3ecRcTEb92SQtM1u7QEFcSjYxtfBOvhj4/oRNwY0DAI=;
        fh=A2BxkCDcGhUw+a/oRkRnhZ37gvnG9ImawULy0R10Yvw=;
        b=Yw5WrgeYyTTz5gTImk9QKVCuDpWOH4Eyu6MNMDrvcuCdmIZYH11yKkdA29agDqJ5RZ
         v7lhdZpYZh3NlRTjpAHwElYRyUC2SRZWjWACCFLtHW2tnqjwklTZm0jCT9yQm00c6yWk
         MssMKK8BTgj6ZOVEZ8WZXNk2At2rUQFFdePZ/FNYkmf1yVrOhwnfNF6pFATJk2lppcPj
         gdk7g0KiQGktaxNVu8JUlba0dNCA4olbdoE4/yv/1iunY92E793FPqaffBUrBXCfBBcq
         T0QHD3TlyhqR9XLWV2OViW/INLmcnMGRczlIkzLQfkCW9yNl3IrPeJ4paqeqp2r6SYbD
         lVnw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770220457; x=1770825257; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3ecRcTEb92SQtM1u7QEFcSjYxtfBOvhj4/oRNwY0DAI=;
        b=cgWajtqfVFopAGAm3CnK8JvMHVIXeWY984WjNMpWOPMAKmOFlXIM5pmO53T7xPwZGm
         l0TngCTsgLC3+kG/LLMI0Y77YBV15EV9+qtuPSMVX3pCdHuMOnvBrUMvI/IhVp64R65j
         octhgxNgQR47NNbFbp7BD1dQABFkPO/h7gky//OwUSy0nURvrsQqV4c8YsPybplVV6AR
         pDGtmq/SjJASe4QrmAZbZfMHHpC+n4ET5pEuTaZGLrJ5vO02j0dQz4AIj+L+2jVMR6CX
         d8qsfPuRqNGNJpc6YzeJ2VNa/jjxsC2f6WXnV/pKrFOdsnKaNi1Jw8gn0C74FIXR9eus
         a4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770220457; x=1770825257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ecRcTEb92SQtM1u7QEFcSjYxtfBOvhj4/oRNwY0DAI=;
        b=Za4zZz5+6dpJFKU2bOfFw+podTcr/r/MFWFB8xMhyB84Ncevcz0UfD+IBM8OX4O8WR
         OciaakNCACXgffXV3F4mtadEuTX0NP8x56Uz/OaTtq/ecXpXePwlbMgixfVI4nwSTsM/
         4A4NidhbZG6kyQZVMj0aDhMHXIWcNygKRTAD+pHLQ4/7hxjD9oivpfP3Uin+sO5tacnL
         xtaMxzGJMiMYvOg3is0z+uEk6gNgqJ8pdNaBLaiy51Y7GYg0r5qzBMJoXA7MjpV8C1tv
         Ik3DT/OIbS58jGuIVMFjYof4yKR43QwGQyVCRpT7TmKRWjSbKCbLUxEXrQ8AaH1evVyT
         54cQ==
X-Gm-Message-State: AOJu0YwO0D1kpSIFe2Xr2rUlaoAZZxhrGArxVpKosgMOFESm4QT09WJg
	0X6UfrofZxCLnJtOcUF1Jby3eY/7mw+Ge0U2dQLDvTAJvtoroYrFff1j4p1qpeUA4+WHUXLf2EU
	Pbqm2wenXuPjuZyUvZCGD5MMGTwAXE/IjtQ4HyZYiIA==
X-Gm-Gg: AZuq6aLpmV5vHryDOrzKjNEnAgI7ld5qgssm3qtkvqso3y8k1aWFk+9+s33Zjf5a1oi
	FNTfb/cEI1q9pssjBZOHc+Sx/Npcvk8n5ZDvdr238dlB8jbqHBVU0i42xMhFLz6hAbhZpMKZme8
	DMMotndVZVVA0Cr3EsZV8qyFh5Qfbx7S0DsFx9w7/xbZrYsbATVB8G6vr3QK82uzfcGkeeNN9JA
	iSemzScWYYvFEEswWi6UUF+t+aBTWhrjTddFcD6hGcdnD520RxIy31/GmZtHyUasGVWmg==
X-Received: by 2002:a05:690c:9691:b0:793:ad45:8e8b with SMTP id
 00721157ae682-794fecf1c80mr29710177b3.19.1770220456832; Wed, 04 Feb 2026
 07:54:16 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9yyLBa1Hp-2CrSsHBOBcGKSg6Rr3uvfZPckcRsTXDC8w@mail.gmail.com>
 <6731ba86-cd65-4d5c-9ee2-55aa59094eaa@sirena.org.uk>
In-Reply-To: <6731ba86-cd65-4d5c-9ee2-55aa59094eaa@sirena.org.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Feb 2026 15:54:05 +0000
X-Gm-Features: AZwV_QhJZSbLmNNQ5Kx7wqjpSWyx330ssW6_6cLfQfoN5RByk9_89tjQ-C91PYc
Message-ID: <CAFEAcA-FhJtBerdCwHoL5F3nuN5beC=44ZfK24xzVDENRMFfkA@mail.gmail.com>
Subject: Re: inconsistent SME2 ID register fields confuse kernel into
 reporting but not enabling it
To: Mark Brown <broonie@kernel.org>
Cc: arm-mail-list <linux-arm-kernel@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_075420_985112_390B03B8 
X-CRM114-Status: GOOD (  19.57  )
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

On Mon, 2 Feb 2026 at 18:01, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Feb 02, 2026 at 11:37:46AM +0000, Peter Maydell wrote:
>
> > I noticed that if the CPU reports an inconsistent set of SME2 related
> > ID register fields, this confuses the kernel into reporting it in
> > hwcaps and /proc/cpuinfo but not actually enabling it (so userspace
> > programs fall over with SIGILL).
>
> > The immediate cause of this is a QEMU bug, but Marc suggested that
> > you'd be interested in this report for potentially making the
> > kernel more robust against it.
>
> We do have some cross checking of ID registers in the kernel, though
> other than big.LITTLE consistency it's fairly limited - mainly for cases
> that are architecturally valid but unhelpful (ID_AA64ZFR0_EL1 indicating
> SME features on a SME only system)

Hmm, what do you have in mind there? I ask because I was just
working on this for QEMU and am wondering if I misinterpreted
the Arm ARM. My reading of the definition of ID_AA64ZFR0_EL1
is that there are some features that an SME-only system
*must* report there, as well as some fields which are SVE-only
and which an SME-only system will report as 0. (I agree with
the description of this as "unhelpful" -- it would have been
clearer if SME features and feature levels were exclusively
in AA64SMFR0, so that an SME-no-SVE CPU reported ZFR0 as 0.)

thanks
-- PMM

