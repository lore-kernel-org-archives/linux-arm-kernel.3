Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CD2CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEqNt/+ao/gTJBdF0+NXGKTXYzKL+8Jvqheq+IJLDJE=; b=bsDNuOZpOsTpNwkyRUzsKubwVv
	LY8XS1rhH6seCni4dI/+mYB3/4XGX2UDTlihyFUmltwQjfQ8nT3UY/lNSXo/n1JH6gMyHx3CPRCUm
	xQMKzsHUEhTQWqC5lgGHcZAndVls7REJaQNpZL48ZaMSnvTYw43F2gXPhNHWO+FfwnbiE4zGPFzEJ
	FEG5MMm9thQ6mdrXzdKPJ6GjE/ZSK5q7tz9dt0r+1guGfHZJGp+aowKztJG9+VbB4vER+7O1nPI8S
	1nxHCmHjAhi3CFydhYFRJCqFKi2S3apXasuUF5Zg9YdGDNeORIaVglnAPh4AA7lIs1VgJMi+1YbVv
	u7Z9kjBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBY4S-00000002ouW-1J9v;
	Wed, 22 Oct 2025 12:36:04 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBY4M-00000002oso-365M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:36:00 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-87c11268b97so99752356d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 05:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761136557; x=1761741357; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QEqNt/+ao/gTJBdF0+NXGKTXYzKL+8Jvqheq+IJLDJE=;
        b=ZZjsOGpT2Y87eokJUuNDQQ/hlGVUCVL/FzJDGQhUJUv/MC8LankkDpDIsR8bLwKuHw
         yH36fzXXrPYKX0yHjn1XBYKeHlziUeRVmtQm37vgEgkXJxGxt94O4KhjKJUkwwv+MgYw
         GDDDIqARnyc1noKbKoQvqGWoNwPNUwMqWtZtos2+rHnu/2pBTfZPLi5Pxf3l3xs9QGH+
         kEXpetpKgX1YtCgDrTre/ZnGsxt0pZcnwETWoqX7UjohZGP+OBi96hki3kw0C6lN1TYN
         mivlSHB0R70BoDkkbUIEUFuwqqOgz1xZvrm2TlAFPGIx/5MuSPOau+S0vuN8C1V65skX
         BBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761136557; x=1761741357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEqNt/+ao/gTJBdF0+NXGKTXYzKL+8Jvqheq+IJLDJE=;
        b=C97z1bZd6BKyK0py81pAm8L9naAlE7UMEyFj8DG0J+uJc5tgOgRX/jrhkVGbG8xcQZ
         7v6TW6VcDsRPIdY27xWGvxjk6xg7UUhZ/IiKQRgbVoor1W15JLdGoScn183y/g09zSYw
         q0kVdhmTgrqQnDplCu+o1zNLsuWbNwyg90C4YhEZu3yeCvF9jpRRxmaq1XUZ4DgxSYXG
         rhcM6yVQCXEWJFfaLV3eVzL9ELjPjW6A4jDzRzEhKaX7M9p66DwIWUiyAbWWSqCW8ZSz
         lpmh+4KReWHXOaitSKZIKpymxdBBI1OJDTUX5nYXydKqC0t+z5g1XiCAJvsWo54yjyn8
         kyuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI+mbOKZYbIDdYDVc8H1dW03Us3VP3K/B8cELLqVRMuTRkZGXgIzFmB0b8cAf0gXH9j/ETm46CfL44JzFIq0QT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2M8pL0Q6v3uH1xgolAbnDtyIMydoxI5rSRL/Wa5l7rujlTDW6
	VmFCKpsG+3oOf7lkXdhriDaW7r/zkWwxEs5Awd6Reiy5Q3t4PCjecdE1E7mtdXzlEmXOduNZjVy
	yrlG/0dkLJhSxR2ChfBz/mBZXx2K33GTW1JU6Urz/7g==
X-Gm-Gg: ASbGncuVSyrmO4KYTRufaN+y0iuJilIQLIntPEvikuO5Sj9neEYJRxdecdjBXy8qUSm
	XZ/woGxsm2MIu5nE43SRvbFS3w0KAz45XLG/p7IKb5UYHMNbIcNufofw9uTFK0Oj2k9rj27Djyb
	Zm/fwwnxxGrp2cnhObRbEVHPUQmWXkYGvjMNmJryaycdWHLTXjeSDUnZN7I2B6n/VzBLlfJ3Tyx
	c2R/1tWJxLj5u1fV653fec3s6BpekygtIR0dcZU3Jvxp1yrqfmtIH2Paqh+Onqna01MdauEHP3t
	y+uHi69APBfW7LyBCsCVxJ+9riKi
X-Google-Smtp-Source: AGHT+IH7JGEMGpygwX6/uhEgxtQ7L6U5hDBowTCRaOx0iT0Qi0sOgs5c5C19JMyMWTGH62mvocMghuMDJSwmqlWfDhA=
X-Received: by 2002:a05:6214:8006:b0:7cd:91ff:6215 with SMTP id
 6a1803df08f44-87c20824c74mr226324176d6.61.1761136557306; Wed, 22 Oct 2025
 05:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20251021234520.3355-1-mike.leach@linaro.org> <20251021234520.3355-2-mike.leach@linaro.org>
 <20251022092958.GQ281971@e132581.arm.com>
In-Reply-To: <20251022092958.GQ281971@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 22 Oct 2025 13:35:46 +0100
X-Gm-Features: AS18NWBuh7X2EdT2ACmWcHMWER71d1F1K6PHqDwZ8lOLPAaG8TyZVWGaJ3MvXUc
Message-ID: <CAJ9a7Vi+Oq3Zma0Cs+w8m0kRE0pG6ax3=26EQK=u7d=vQfNFQw@mail.gmail.com>
Subject: Re: [PATCH 1/1] coresight: fix issue where coresight component has no claimtags
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, james.clark@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_053558_816215_7E9031DC 
X-CRM114-Status: GOOD (  33.86  )
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

On Wed, 22 Oct 2025 at 10:30, Leo Yan <leo.yan@arm.com> wrote:
>
> On Wed, Oct 22, 2025 at 12:45:20AM +0100, Mike Leach wrote:
>
> [...]
>
> > +/*
> > + * Reading CLIAMSET returns  a bitfield representing the number of claim tags
> > + * implemented from bit 0 to bit nTag-1, valid bits set to 1.
> > + *
> > + * Claim protocol requires 2 bits so test for highest bit required,
> > + * bit 1 -  CORESIGHT_CLAIM_SELF_HOSTED_BIT
> > + *
> > + * return true if sufficient claim tags implemented for protocol
> > + */
> > +static bool coresight_claim_tags_implemented_unlocked(struct csdev_access *csa)
> > +{
> > +     u32 claim_bits_impl = FIELD_GET(CORESIGHT_CLAIM_BITS_MAX_MASK,
> > +                      csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));
> > +     return ((claim_bits_impl & CORESIGHT_CLAIM_SELF_HOSTED_BIT) != 0);
> > +}
> > +
>
> The logic looks good to me.
>
> Can we improve a bit with a cached flag to avoid every time checking the
> CLAIMSET, we can read it only once at init time instead.
>

When I considered how often we use the claim tags - compared to all
the other programming of devices, a single extra read did not seem
excessive.

> - We can add a new flag ("bool claim_impl" in the struct csdev_access),
>   by default the field will be zero.
>

I considered a bool - but the correct place for this would be
coresight_device - where we keep all the information about the
hardware features.

> - The drivers support claim tags call coresight_clear_self_claim_tag()
>   in probe (see __catu_probe() as an example), we can call a new
>   function coresight_init_claim_tag() to replace it, this function sets
>   "claim_impl" properly and clear the tag if supported.
>

I considered moving this initialisation to the common coresight code
where we create the coresight_device. Certainly with the new check for
number of claim tags it is safe for all devices, and there would
appear to be no reason to do it as early as it appears in some of the
drivers. However that would be a larger change.

> - Afterwards, simply check the "claim_impl" flag.


>
> [...]
>
> > +/*
> > + * Coresight specification defines a maximum of 8 claim tag bits.
> > + * The precise number is implementation defined, and may be obtained by
> > + * reading the CLAIMSET register.
> > + */
> > +#define CORESIGHT_CLAIM_BITS_MAX_MASK        GENMASK(7, 0)
> > +#define CORESIGHT_CLAIM_SELF_HOSTED_BIT      BIT(1)
>
> Now we only care about the self-host bit. Can reuse existed macros ?
>

I feel that drivers should be written to match the specification - the
macros above are a correct mask value per specification and the
correct bitfield comparison for the MSBit of the protocol.

The ones below are a protocol masks field, and a specific protocol
value that is used in value rather than bit comparisons in the
claimtag code. I felt it clearer to differentiate between the uses
when reading the code.

>   CORESIGHT_CLAIM_MASK
>   CORESIGHT_CLAIM_SELF_HOSTED
>
> I don't mind if extend CORESIGHT_CLAIM_MASK to 8 bits and even remove
> CORESIGHT_CLAIM_INVALID (as it cannot cover other invalid values). Or we
> can defer the extension as needed later.
>

The invalid value is used to as a value comparison to check for a race
condition with both protocol bits set.

Thanks

Mike


> Thanks,
> Leo



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

