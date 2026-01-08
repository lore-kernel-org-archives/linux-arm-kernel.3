Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CE4D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwmKkVXSip/S40O81aRXL9QdzJwbud5lWPyLOxwiQv8=; b=ldsDJ2ecs+O+DUdfhY6zWSHsoF
	q9AcNAIwmqpzM17Bx/WJNwS3xl8YEHUCUHqlGkP3bIgWzf7aKHc0NLl5Rx6qHJGOevZm9G6SoP3wd
	8lBsL6WTGVLTJOWhiBy4cqbcWOWr3DohAgi0ut54s1UtzD+GLwzKt9zwCQHzP7WEQJeD/Z5Y+Ijg2
	mhDi3aM2hCs1pXbQC2LYSnpmaEkCDp4+A0bl77+WPk2G0RLUcn5to1dvGy/1O3GhMb8BX/zL59Yj4
	ewwC4VYPfUDYYSsbRBvzvaKefICnq14UjmS9yewcWOrcqnPlGaiYjzHtBjLQvaILrD3fFAParoQlN
	NuWi4gtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdskC-000000006Dp-1nby;
	Thu, 08 Jan 2026 16:20:16 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsk9-000000006Cp-3uSR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:20:15 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4ffbaaafac4so823971cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 08:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767889212; cv=none;
        d=google.com; s=arc-20240605;
        b=i9WEbizxaUCS1SybzAXxEnYsQIxqdCy58ckkgJAhJT1FMGerEaXCBElCtME3/NslJk
         Z4YabjBQoO6ZNJ28WvSrDWc7UR4lI4hmg05vkn8vBAR95AiMdSgU/PVjB0HsuSJOhz1q
         95/kMRSV7lhSRZwXAzANthrkuOs8mKQImbHERqEAQhmVglR9cjzgCiok6brDXx1y3n5q
         737t3Qb27IP8t2kPveqHDMKjzRAEZ2NVPp9lkPfv8fYzYsa5jtd2rcjpnxn5Zs7IyKnv
         QM0300a2dTYqFbzfGAvoBKHAMGnUSSYFM4+L2iV+j12W+5M5atXvNiUjJh52X7+WqL7S
         B4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vwmKkVXSip/S40O81aRXL9QdzJwbud5lWPyLOxwiQv8=;
        fh=pped/8QzN9D2dV0Krj7cm57VEjkp/nJb3pRt2a/ouxM=;
        b=Psn7IhMhwtwX9lMcY7BtOm25ySJZPLj22kl000iIe5F43/dQd9wtHp24ChRJ6LXk08
         ft+ui27++EH2T+fgWKnRIZbWIr4javjVrN3Bo1TUWlVRt+1pJiQ+yUbyf/2Vj6w9O+Ri
         zS92W6v9zlH+FHzUVKlIJcQH16ZauAeMWChJGPVTUo7EHLPSEJB8HvQMw7zM2gZPzr0H
         h/mC5Xfq05pW3klOPwEzjafHyJqqGtgI9DLI82HN9iNo61qFGr7HsCvNhJrtxyub4+f3
         wgUBYSra33S0N6VcZtz2x/F2/izU+mqmx75QLbMf0NkOzziDFzXA3lR4n+kqhwDlEEb2
         DXHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767889212; x=1768494012; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vwmKkVXSip/S40O81aRXL9QdzJwbud5lWPyLOxwiQv8=;
        b=iqKszwIrmHUq+9YI4qXFGdQEl5MeTenOY+pid3wPmn9+yN34uzwm4BAmZdPmhEOE6F
         jRfqPjrZUlH1YMgsKUMOoM7cba6im1lLtCfQVoGH6Z/D4tTAPhlWx230tytboHt+xpsH
         wcE/00Jqx12UgVCjqdA0KNrIhJyJf4CTMEebKkOI5vj4dxx2PMngwM5dPLdyEc858tPk
         eiNyZn6zHlAx+Wl1L0uAfu+bMbxZTnRhq/Gy9p0kutUzrScnPtCDho1R6dYBst3jLn8K
         ej+QfeEcB+E4sq2vknnuXO1hTpXdtVStx8v24fh8Qivsf8rqcOHpbnGAGAS/hHdFgvqG
         nFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767889212; x=1768494012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwmKkVXSip/S40O81aRXL9QdzJwbud5lWPyLOxwiQv8=;
        b=eEgMtxUSsqRrzTxGyQgu8HSA/PPQsk5vLM6IuG7iMMFFLHeHTvBwofWmhAOZyUl1uq
         QKJK9z+mSfyjE1O5gMZF3yKw75xzU++rPVup7EmCrc4uOlhn3bCjvcp5HUJyGbx2+6wp
         tHWV54lJbzCsm0tT506iRdcS75WTaQHnid67cqLIUfl4P6Gq0FKkUvefiDBQEZtYRUjB
         nAt4SXbx2sW6jMvy4FNaTLmVlkYvahwmZ17osgNaJt1khAHMu5bDd2bftxzzuvkWQ9Uo
         qiyenzcpcUGe/cDmgGtOvTa4EYvK/NTpSbxRcgbh1OOcaeMCiAl7yc2oOk9J4Y2hF627
         mzgg==
X-Forwarded-Encrypted: i=1; AJvYcCXMpRHHwZkvR7fCshLtH7dTGD4yB5PhasABaC2lQtd26NaxY7CrT6N3rzXWhWokVSFTu9P1No2Y2bD/GBq591af@lists.infradead.org
X-Gm-Message-State: AOJu0YzvRT9zzSobSKVFJHNiLi7mi0RDkZLFZH3xXBp3KlgV04k6V1Ks
	PukpjqDTliTq2Vzfgi9BayiJVfJq9o5dxQn9HCkIWv7AfWLVcSMaBGtSr0HneuE40Baj3GYD4/B
	9ythRtqu8O14NcNHOjZ+hM7fu61x3O9/uaxC9epOO
X-Gm-Gg: AY/fxX7QiOFZXZP+orDoaqh2Igedf0VBIDYJy5E/DYL2CiGsZywfT29u5u0sX0946Fs
	eXayRgMkffuwnEFQnmvfDmC8qxxQAb7bYoycy/SAuGVJSqzka79teHr5sfbdgsDugNlo8rdW/u9
	Bd/CXRp9qEJj9LtuLhEcootVB7eQoBr9yVuL4m+LuKHOqdfx0j9acsMG91ghrM//KtiQxtU+Ya7
	y0n/ehqyaSq/uwqAZ9Hju7WQKWj60Kb5GWKe2KF4/lBEvtEBcBgE99PXywmIU0ljUMGdcbipqiY
	YREktM0=
X-Received: by 2002:ac8:6a1a:0:b0:4ff:c103:49f1 with SMTP id
 d75a77b69052e-4ffc1034cd3mr7852131cf.6.1767889212251; Thu, 08 Jan 2026
 08:20:12 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-2-8be3867cb883@kernel.org> <CA+EHjTxdSnpFHkm6o85EtjQjAWemBfcv9Oq6omWyrrMdkOuuVA@mail.gmail.com>
 <3c8b4a5e-89f4-47e0-9a5d-24399407db0c@sirena.org.uk> <CA+EHjTxLkLjPj=1vwDqROXOUXi2LhOQb90WP6dFaTiYG1nWovA@mail.gmail.com>
 <e50b4923-ee45-43de-9d4e-344546c635bb@sirena.org.uk>
In-Reply-To: <e50b4923-ee45-43de-9d4e-344546c635bb@sirena.org.uk>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 8 Jan 2026 16:19:34 +0000
X-Gm-Features: AQt7F2qnUAAJolhK9_-R6BxIXN3MEwPRzr3Wsfe1tbgWe2D8WrIhfrxwTrYHhW4
Message-ID: <CA+EHjTybF+aq2b2vhcEqi6U_sJjtt7ngzMZ9UcJ15G-Kqj=A9A@mail.gmail.com>
Subject: Re: [PATCH v9 02/30] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_082014_012935_DC8B5DEB 
X-CRM114-Status: GOOD (  31.41  )
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

On Thu, 8 Jan 2026 at 15:57, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jan 08, 2026 at 02:09:34PM +0000, Fuad Tabba wrote:
> > On Thu, 8 Jan 2026 at 11:54, Mark Brown <broonie@kernel.org> wrote:
> > > On Wed, Jan 07, 2026 at 07:25:04PM +0000, Fuad Tabba wrote:
> > > > On Tue, 23 Dec 2025 at 01:21, Mark Brown <broonie@kernel.org> wrote:
>
> > > > Should we also preserve the remaining old bits from SMCR_EL1, i.e.,
> > > > copy over the bits that aren't
> > > > SMCR_ELx_LEN_MASK|SMCR_ELx_FA64|SMCR_ELx_EZT0? For now they are RES0,
> > > > but that could change.
>
> > > My thinking here is that any new bits are almost certainly going to need
> > > explicit support (like with the addition of ZT0) and that copying them
> > > forward without understanding is more likely to lead to a bug like
> > > exposing state we didn't mean to than clearing them will.
>
> > I understand the 'secure by default' intent for enable bits, but I'm
> > concerned that this implementation changes the current behavior of the
> > host kernel, which isn't mentioned in the commit message. Previously,
> > both the feature enablement code (cpu_enable_fa64) and the vector
> > length setting code (sme_set_vq/write_vl) performed a RMW, preserving
> > existing bits in SMCR_EL1. This new macro zeroes out any bits not
> > explicitly tracked here.
>
> The behaviour is unchanged since we're always choosing the same value in
> the end, it's just a question of rearranging when do it which is the
> explicit goal of the change.  There won't be a change in behaviour until
> later on in the series when we start potentially choosing other settings
> for KVM guests.
>
> > In terms of copying them over, if they were set from the beginning,
> > doesn't that mean that that explicit support was already added?
>
> That's a bit circular, with the new interface if someone updates the
> kernel to set some new bits they're going to have to update this code as
> part of that.  A part of the goal here is to make it harder to make a
> mistake with remembering what needs to be updatd when.

Fair point. If the intent is to enforce a strict known state and force
updates here when new features are added, that makes sense.

Would it be worth adding a comment above the macro noting this
difference from sve_cond_update_zcr_vq()? Something along the lines of
'Intentionally overwrites to ensure strict control of enable bits', to
save future readers from getting confused...

Thanks,
/fuad

