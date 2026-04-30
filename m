Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D33FF887E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 00:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+22Vew3O7NYuCAbB+MpAlEjTY5hterfUj3xJsaAyHE8=; b=LGP4TA0bpQVhKmol8KvIOy1UFu
	wA3EfNkBNA7uxLT+wMyuImr/L7gCWh3WH5NtFWSPnRxS/tvi+S5zGje+F0GcGwuHS07pladzbZlOx
	P49QYNwJLTfK9TUvGaakhJyVjWxNXXZD4xlnBcyFdO/OJQ4PRvF7th0OJapZhlDTx7b2o6bchth0I
	5X+kEWOigmNlDjfrq+gvDd1nYh4R6CPfDC/uKTq+isGxUr05NbiN+Q7aYxmnesDMO+M1dDeo3sr+/
	W5+7CDIpZ/T81HGvQYuMmJBiY0NjWzMpDdOKq8wOqGqPg8NQ5mmZXOa8isNMfLmJZkelDMiBw5P7b
	OicYeBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIFUx-00000004Lu4-2pgG;
	Thu, 30 Apr 2026 00:43:23 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIFUs-00000004Ltf-48ou
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 00:43:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so349011a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 17:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777509798; cv=none;
        d=google.com; s=arc-20240605;
        b=NRYGGosv0NWclf0BZBGFhMbgZ8OZwEzZeHbzPB1Ba/IGwnfBG7aHXfJdilDWsbFgNP
         MMJU9JjVgtLJpnRpttHJklSeKGkabWoJTMl7Elli1zxR1aKWmz+xKFlP2A3PK/L1Em9r
         KngoUg3mtgTDlRsaMqI4+und90nufTlclC8KcNrolDarMa20/mEvOE2VuAAlHvmVhX31
         3CLaPl2ilSK8luzmB9NihphCbSPlHgufN+AW0s67vMOGK6elZdS0NPnNgSobQTZ482Wq
         6uAc+aoVm1Xsujsbrqmk6+aLf8sxe82y+b+7QQREVTbvZVCnzpdBcyBTtSVlkTYh1Eq1
         neCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+22Vew3O7NYuCAbB+MpAlEjTY5hterfUj3xJsaAyHE8=;
        fh=qDdOI41jdxxCVKXDGlP5Q6VjaLZN2brriBOGs/8cE84=;
        b=YzWWOQu3EwT4ZqRB/UdF1SFtHAW0svI6ph6kp4IL/5VP/7rNIuT0ftj5+sFLetAxcp
         EOtG5G6KxMGeUQZHGr1P2tHgHKfXkIr/CdMr6BYvSoUTqEZtNDd9HfG+QkEujiJeGGox
         vmkyvrQpCNsVL24l6RYiPvLPLySlGl3xWfXV3f5I1ZrEJdh+rfhozIW6eW+2qLZdlZ8C
         Eq06Kwr/gXyDGYoXemvpJ8sUmG35Ci7m8kTkVi7nKEk2qutv63RkqJKw0Bn8VhBdhH6w
         535z82mqVoiFB/6vPmrAmlI4wpolIKbF5+hMDKAC01/g8Dmvx5QK7TJQkVCGxe3tmuqO
         j98A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1777509798; x=1778114598; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+22Vew3O7NYuCAbB+MpAlEjTY5hterfUj3xJsaAyHE8=;
        b=fjzlaw/WZEON0UUtKDwjf5UGM64DZXr0TDlromuIjVXCdOROWUJN+xBzBLMzVipUI1
         sTiyD7joYYAdsTYeEE9NG00JxLbX8d8boBusEU7GkodTTlcjYMJ6p7ZzOCmZgEOM3WjO
         LrQGWbsKPhhu3gqDpdM8nt5RaxeV+2bV7+NxAXMQtLjFSpTmgqtqI/fhd67lMUjgZkum
         WCFrZ3kPx5LeEXhfhnfg+p3xMr0hg6UlN5G9hu5IHpUDiW4jDfC4bitKN9BQ2hE5zm0A
         t90g2Zz7sY3AESJMt11ZcoORDeKKt3HV8LMussxGqKJPv++H8wylnCOcreOOWA1gV59n
         MbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777509798; x=1778114598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+22Vew3O7NYuCAbB+MpAlEjTY5hterfUj3xJsaAyHE8=;
        b=cAHJELxZIv6CSY0owT2igA0J1/zBMq/Mm8btzRPbgxUY3YbnRo79rlOFV9Y+UbqZ8i
         hRvq+skbtbwjmA/rZU7EG/GebU9V6YgRTMh8jfFVruZlChnNJ4Chu2TQOy1fZe+0+YT6
         oA51R13Lwf4VOUHkY0fztqa7m5yz+v3DrLOfsuLpP2gAotvwqMiItn9j/W73F5f66Dd1
         n+8MVSJv3QxONpQaMEpLa14DHsCDEapWe4eJhJuxSlh5pryFQVd5R1E2wQ4uEa6Ls+PQ
         CeI91UbjKJAES1I9+KMWlV7Tw2vdm41dN0eMjqCnj//KX7Thm65yx0YgTd8UAsanJZwV
         a/0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/X0mo9tMuCAPoj364vRrPyywvLHhWeF5JJeba7mYeIdZigpYWjQlP4j8KL6Z5TgKneC4StVYwZb8lg7K8hTvUL@lists.infradead.org
X-Gm-Message-State: AOJu0YwGhLHO9flu4kE3qndbhcdggee+Vahznc6JM+Svg2KQ9IE01zOo
	gYv/jG3uZjHDc4lMup1CK+LkFiQWc6PUVvNK8PEHw06+FhFBddVMvVxkPI05Yfk4lCbTNmCbgeq
	nkiPN+h/g8NxVa5WPVxH56KSM3QKKn00KwJiqqxAc
X-Gm-Gg: AeBDietr/oRdHeS3bsAPjJpa0u2MpSPexr0iIHwN+fO9EQuKqkS9cqMcgsp67eWVobi
	z/MNIr0tDxlf+61tVL5ldm4O0FYTWx92kuh9irtwLLXX1f6rJY0SyCTSPUk162xIu1vnMYQ0NbM
	NzK9Is3oGf7kDuBvXvHEW2ONFrk1eos5msskWE9IHKeJJMsPv3WCsiYNgdvG5j2rdFqQNw52g7j
	4fa2xQJOqWdF4tuSx/0V5mc2WGHyYNShKzEKn9FjpiHHzz4DO2FNUq6joWZEEiLtGMGIluIClYk
	BCKlPze+OmJpE5OiIw==
X-Received: by 2002:a17:90b:3b8c:b0:35f:b5df:450 with SMTP id
 98e67ed59e1d1-364c309b046mr561429a91.19.1777509797729; Wed, 29 Apr 2026
 17:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <aeoAlVEwzRUPrlVe@e129823.arm.com> <aeoRxWPyOHGJd+Jh@e129823.arm.com>
 <aeoWO2Cwo04YYu2l@earth.li> <bd908e28298d968740d03c97bc7e441de188b7b4.camel@linux.ibm.com>
 <aeokwrC86WI7uT+K@e129823.arm.com> <aeomlp3I0eVE5mce@earth.li>
 <aeotq8nPVu4wvEx5@e129823.arm.com> <e4e242ae5533d5762a3647186a178764881bf9ff.camel@linux.ibm.com>
 <aephL3MzYoqFGaT5@e129823.arm.com> <CAHC9VhRQWHEWQ5NzOPiu8jtYv6UsRm8WVS4fd74AbkOcAd4y_g@mail.gmail.com>
 <aesGU8a3mbVzvteH@e129823.arm.com> <CAHC9VhSaT_quKYnpFjAfqvL07JNbWMgM6c4pB9F46NHawX3DCA@mail.gmail.com>
 <014cf39aa8d6a0bcfa1a95c069675977ac67b843.camel@linux.ibm.com>
 <CAHC9VhTW3=RJ8L91RWXYYA9tFjfSXGN-DMEEwdiD6big9H57Ew@mail.gmail.com>
 <1f78fc75b2e95239973612a4b6c4cc782960b7ac.camel@linux.ibm.com>
 <CAHC9VhS4JmPmCJrYTdbjxb3TO-uK6cB3Zij-ef=wswGce2BGzg@mail.gmail.com>
 <1e51c2fd090e5ceb07b1d09e50650c70fd3ccdb1.camel@linux.ibm.com>
 <CAHC9VhS_WgwhW_NDO91LoTeSzdieGqbwqnwPq8KpavH1_Lwi7g@mail.gmail.com> <e325b7a8041b7122e8415de9193f4fe1be04bb02.camel@huaweicloud.com>
In-Reply-To: <e325b7a8041b7122e8415de9193f4fe1be04bb02.camel@huaweicloud.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 Apr 2026 20:43:05 -0400
X-Gm-Features: AVHnY4LHifXVy7YvtGHgR9F7kahKzv5vW_Z8KfHyWJ-dvateuzzdMLdc0MOzfBY
Message-ID: <CAHC9VhTqYgc6fE2v+ZY4QXuCDkvNMKZcM4Wi+7Vkxspff08K0A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] security: ima: call ima_init() again at
 late_initcall_sync for defered TPM
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, roberto.sassu@huawei.com, 
	Jonathan McDowell <noodles@earth.li>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	jmorris@namei.org, serge@hallyn.com, dmitry.kasatkin@gmail.com, 
	eric.snowberg@oracle.com, jarkko@kernel.org, jgg@ziepe.ca, 
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com, 
	sebastianene@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_174319_340613_07C17A65 
X-CRM114-Status: GOOD (  31.35  )
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

On Wed, Apr 29, 2026 at 9:33=E2=80=AFAM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
> On Mon, 2026-04-27 at 21:31 -0400, Paul Moore wrote:
> > On Fri, Apr 24, 2026 at 6:49=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com=
> wrote:
> > > On Fri, 2026-04-24 at 18:10 -0400, Paul Moore wrote:
> > > > (I'm assuming you meant initcall and not syscall above, but if you'=
re
> > > > talking about something else, please let me know.)
> > > >
> > > > Saying that you aren't comfortable moving IMA initialization to
> > > > late-sync is inconsistent with allowing IMA initialization to be
> > > > deferred to late-sync.  Either it is okay to initialize IMA in
> > > > late-sync or it isn't.  You must pick one.
> > >
> > > Yes, we're discussing late_initcall and late_initcall_sync.
> > >
> > > I prefer to look at it as being pragmatic. I'd rather err on the side=
 of caution
> > > and not move the syscall to late_initcall_sync, than move it.
> >
> > If you were truly erring on the side of caution you wouldn't allow
> > late-sync initialization without knowing if it was safe or not.
> > Determine whether IMA initialization is safe at late-sync.  If it is
> > safe, move the init to late-sync; if not, keep it at late and figure
> > out another mechanism to sync with the TPM availability.  If needed,
> > you could probably use the LSM notifier to enable the TPM driver to
> > signal when it is up and running.
>
> Yes, I agree with you, or transition or not.
>
> However, all of this looks very fragile and easy to be broken. If we
> want to be on the safe side, we can use any notification mechanism that
> is suitable, but at the same time from IMA side we need to deny any
> file access that would require a measurement until the TPM comes up.
>
> If you accept this, I don't have any problem to move to late_sync.

To be perfectly honest, I don't care what the solution to the IMA/TPM
dependency issue looks like as long as it doesn't involve simply
trying to initialize IMA multiple times hoping that at one of those
times all of the dependencies have been satisfied and it isn't too
late.

If the notifier helps you solve this, great.  If the notifier isn't
helpful, that's fine too.

If you need to decompose IMA initialization into a multi-step process
spread across multiple initcall levels, that's okay; we do that with
other LSMs.  However, calling into the same init code across multiple
initcall levels is not okay; you need to figure out what is needed
when, and establish some synchronization mechanisms to provide some
assurance that the system will boot up correctly.

--=20
paul-moore.com

