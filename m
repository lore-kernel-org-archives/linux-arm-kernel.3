Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492EEFF884F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1d+xjduzAM/MSTs6YplaFj6vz27O1vUoV9FGHND4Bg=; b=AMHbxPWPd68hmz8gCc8ArFe2T7
	o/O6IrlY3elJGIB4KdRWxrW8nu0pxKGmEDmDuZkL7WoR9way75HgT/l1Ftnwc1MOzXk4Omy62SsjA
	N1dMUHzZ/hvuTSuJh3+5SFRxMqtDvgD2hgg3mx/ICChM6Xf80tK9iq7k/E9RaOo4iuRWh3UCuor/g
	sRmYXmH/N3c9x4ROBY/tQprOtAbeZnuQfUV09Sc7BUl7Dg8HKq/cSLvgv2y9ZQu08EGrWb0b742t4
	i59H/oKBQfejbTdpiYASo8feVv4nRHTC1zPfKSIsW27KhtU9E85CegItxbNMZO7AgZkAxMrnDT4A8
	Vj3URrOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGNlr-0000000Dl5q-3HJ6;
	Fri, 24 Apr 2026 21:09:07 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGNlo-0000000Dl5V-3Elf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 21:09:06 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8296dabef74so6976704b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 14:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777064944; cv=none;
        d=google.com; s=arc-20240605;
        b=bTR7XTj+suIkJ41ElXezsp1p8ASbLo/HY3n1JkWLYyZe/Yo1+GpMjyk9Zbbl0iR1Jc
         9tTk5+kTye3mZDJURjjo98SSCm4TUBSsF8zMCompP5EVXoBSqvMmmgByS3OeFtxiIQb+
         cW9iLkDd81s2aW7QHCYpe4jB41Ykqrsrs27Xfl6Vqs1pcTXREZhY+1mAhSJdGaSUpVUs
         NYBT0oDdyvqPMbeEhqDKke28jXOLpNdT6pqCgyu2LgWzZYWzmrNRw1I2JI82mGNopknY
         f8489QbhsP2Xn/4+BEXeou7FOrEvzrK9saZp37T9kONFQT2oC5hhHLYy6cBIy+bdSp9L
         5jng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n1d+xjduzAM/MSTs6YplaFj6vz27O1vUoV9FGHND4Bg=;
        fh=PlEvm+KwHL5dhafpiIa57jSkDBsU7/WQCkWe6cB6zeA=;
        b=RM394pW80J6kktWW8WctmGNuua6yuZmcktF20UunTo1jUNu/jbnyFu5esFkzi7UVIp
         mEmpZI5Wwge/ntpvIgAtzHX0VoctYt5xHztR5Uqeh8eft9JguSCfA9j1n8bLrWCgD5F+
         VLCPF5YHSyamCETr+HGRwqonckKPPYZ2ql9t5yy3ko2Zt8FPpKx9Qd2VLd98dLmjioAi
         81QldfCc5ZslLYRfhbOyiyzyP42bQBxCDIiyVWRNG01E3bsnB0zQByuJOKilANpxO3Gk
         P2Nbw1X3f3QZ5VPTZ7RzIEV6RcKY3eKV2zDKudJnbjUOdVYC/Lr6CzrYl40yt/e3pbDP
         +c3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1777064944; x=1777669744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1d+xjduzAM/MSTs6YplaFj6vz27O1vUoV9FGHND4Bg=;
        b=VGMk/VUtBk5+ZvKPdUPxpNtUCmAkzSbB91Z4Tbp+LUkPQ5qZxZrKwnARRx7Yc5kpPp
         Ta1lD/Kgv+TzTPnvzZM1B4RRxb9GSJlmeMET000Gcl0SRtumSCfpQVVj/wEvN4PWLdQw
         yPpe27mvKyJ8DpdgIQbVjpGhBDRZbIuKUPn8iSC2J03qgPwyZ1UntMbLskndH6TTW+x3
         ST3vQ/ihiCzEsQNwfckqw+3EePod5BnJ3Bt3l6ewE5ZCmcwqOyWziAtvAdPTpItf4PpH
         Y7U0HS6rFh0G79NmpPFVifooxLV3zAT/73ACvfU9ACQYIIuMjJNOc/sO8AGtieOcmjY1
         vF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064944; x=1777669744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n1d+xjduzAM/MSTs6YplaFj6vz27O1vUoV9FGHND4Bg=;
        b=cmPIgR6ZxVjH/AhVp1YuFOWdVk0f3iT+K+jORn9Z4SqqFzVmqebngO1KplPnKeF0fm
         eoEHqknwHTHlTTSG+w1eUUFBbDw8sZGbnl9t4RW1ijzi7vr+e+aBEcT0sU9nzY9W3z2M
         se0xtS2kCHYbx0MT2E2LzpHTCZ48LVvH3vo2AnBoCdwBAWe8icD7Gu9WORIIUxhF81IH
         m+dqMJhp+IQA+qrcYnfcsFjWewcEIblZeE+GMqlh8qVBtvFjCR99E05kUotsigGUC3hS
         TX5Tie+A8Ugs2lUA1gYGThdpeODlUO9YcTcjvLsHdxJrMOpSM0R2x8BcHBfwbRA3hCqw
         0sfA==
X-Forwarded-Encrypted: i=1; AFNElJ8V+LEAkyYfYvv/GwVlIFJBRZWk7yb/nOU+9RbbsTLv82LO+S/s8mE1VrZhPvDFq/4n16Ch71HhkyhtUSmMJt2/@lists.infradead.org
X-Gm-Message-State: AOJu0YwzotCdS1IpGidvZyJ3wyQvvLPrkLy/YxgT7TwSnoJ8EFYdsEOo
	dZZhzBnyU5YRgDfw413x8v6YEraOePaAzpUEp5zTytjHxFbfVrQ3Ye2wzUV6DISdE8n4p3aFmpa
	MjnDs55d6PyrIJGNt0EMLQHxQNR7FBnmB6Lh/0mdn
X-Gm-Gg: AeBDietYHgLz8HjO/Ik+OanvSd//dkR3aJ9vitFf5j44A4KbLBJt91Mu/IbNKHxTzhk
	ozDz95t7JtQy1a5TvAad041UjfYSSljBIc62S7nZCdflSHxhSxPCmX9cWPyDPMRxwzVIsvRlICi
	6jwAAavKze1JwBGuJ1vl4FazXZXCyHP1eLoHjVI1iRxZ4u2NYlXLv7emKJ50z9Y4aX8koWPXxI8
	Y1t9sgmQC9+a+BCeuuXMPUX/omL+vfK0grFFfygWMNx2ZCNMp/VtmOt8R7xY8nDGsjWjdeh/nOq
	tkCUXTVhQ2KEdTug2g==
X-Received: by 2002:a05:6a00:b4b:b0:81f:3f03:6846 with SMTP id
 d2e1a72fcca58-82f8c97b854mr34295308b3a.47.1777064943538; Fri, 24 Apr 2026
 14:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <aeoAlVEwzRUPrlVe@e129823.arm.com> <aeoRxWPyOHGJd+Jh@e129823.arm.com>
 <aeoWO2Cwo04YYu2l@earth.li> <bd908e28298d968740d03c97bc7e441de188b7b4.camel@linux.ibm.com>
 <aeokwrC86WI7uT+K@e129823.arm.com> <aeomlp3I0eVE5mce@earth.li>
 <aeotq8nPVu4wvEx5@e129823.arm.com> <e4e242ae5533d5762a3647186a178764881bf9ff.camel@linux.ibm.com>
 <aephL3MzYoqFGaT5@e129823.arm.com> <CAHC9VhRQWHEWQ5NzOPiu8jtYv6UsRm8WVS4fd74AbkOcAd4y_g@mail.gmail.com>
 <aesGU8a3mbVzvteH@e129823.arm.com> <CAHC9VhSaT_quKYnpFjAfqvL07JNbWMgM6c4pB9F46NHawX3DCA@mail.gmail.com>
 <014cf39aa8d6a0bcfa1a95c069675977ac67b843.camel@linux.ibm.com>
In-Reply-To: <014cf39aa8d6a0bcfa1a95c069675977ac67b843.camel@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 24 Apr 2026 17:08:51 -0400
X-Gm-Features: AQROBzD9P2TWOpZi4hSjY4N4Nov3CnXh30sPXe4h_cg3LpJPQQpo1U__Q_DVo84
Message-ID: <CAHC9VhTW3=RJ8L91RWXYYA9tFjfSXGN-DMEEwdiD6big9H57Ew@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] security: ima: call ima_init() again at
 late_initcall_sync for defered TPM
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, roberto.sassu@huawei.com, 
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
X-CRM114-CacheID: sfid-20260424_140904_821604_0B53BC32 
X-CRM114-Status: GOOD (  39.68  )
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

On Fri, Apr 24, 2026 at 4:58=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com> wr=
ote:
> On Fri, 2026-04-24 at 16:15 -0400, Paul Moore wrote:
> > On Fri, Apr 24, 2026 at 1:57=E2=80=AFAM Yeoreum Yun <yeoreum.yun@arm.co=
m> wrote:
> > > > On Thu, Apr 23, 2026 at 2:13=E2=80=AFPM Yeoreum Yun <yeoreum.yun@ar=
m.com> wrote:
> > > > >
> > > > > Sounds good. Once the patch is posted, I=E2=80=99ll review it as =
well.
> > > > > Sorry again for the noise, and thanks for your patience ;)
> > > >
> > > > My apologies for not getting a chance to look at this patchset soon=
er.
> > > >
> > > > This seems like an obvious, perhaps even stupid, question, but I ha=
ve
> > > > to ask: if IMA can be properly initialized via late_initcall_sync()=
,
> > > > why not simply do the initialization in late_initcall_sync() and dr=
op
> > > > the late_initcall() initialization?
> > > >
> > > > Does any IMA functionality suffer if initialization waits until
> > > > late_initcall_sync()?  If so, it seems non-critical if waiting unti=
l
> > > > _sync() is acceptable, as it appears in these patches/comments.
> > >
> > > This is the way first patch did, and here is some discussion for this
> > > (Might you have seen, but in case of you missed):
> > >   - https://lore.kernel.org/all/a6a0e15286c983d720de227c6827adbe976c5=
b9b.camel@linux.ibm.com/
> >
> > Thanks for the pointer.
> >
> > Unfortunately, my concern remains the same: it's either "safe" to
> > initialize IMA at late_initcall_sync() or it isn't.  Attempting to
> > initialize IMA twice seems both odd and wrong.
>
> Agreed.  However, IMA should be initialized as soon as the TPM becomes
> available, not delayed.
>
> In patch 2/4 patch description, Jonathan describes the reasoning:
>
> Unfortunately some TPM drivers (such as Arm FF-A, or SPI attached TPM
> devices) are not reliably available during the initcall_late stage,
> resulting in a log error:
>
>   ima: No TPM chip found, activating TPM-bypass!
>
> and no measurements into the TPM by IMA. We can avoid this by doing IMA
> init in the initcall_late_sync stage, after the drivers have completed
> their init + registration.
>
> Rather than do this everywhere, and needlessly delay the initialisation
> of IMA when there is no need to do so, we continue to try to initialise
> at the earlier stage, only deferring to the later point if the TPM is
> not available yet.

Once again, that heavily implies that it is safe to initialize IMA in late-=
sync.

Put another way, what breaks if IMA's initialization is delayed to
late-sync?  If the answer is nothing, just move the initialization to
late-sync.  However, if something *is* broken and we are just doing
this because of TPM delays at boot, this patchset just creates
additional problems and we need a different solution.  I can't
envision a scenario where it makes sense to attempt initialization
twice.

> > I understand the need to ensure that the TPM is available, but if it
> > isn't safe to wait to initialize IMA at late_initcall_sync() then it
> > would seem like this is a bad option and we need another mechanism to
> > synchronize IMA with TPM devices.  If it is safe to initalize IMA in
> > late_initcall_sync(), just do that and be done with it.
>
> Within the same initcall level there is no way of ordering the initializa=
tion.
> Yeorum attempted to address the ordering issue in commit 0e0546eabcd6
> ("firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initca=
ll"),
> which is being reverted in this patch set.
>
> Ordering within an initcall level needs to be fixed, but for now retrying=
 at
> late_initcall_sync works for some, hopefully most, cases.

That's not a good answer.  Ignoring the TPM issue for a moment, can
you confirm that moving IMA's initialization to late-sync is safe?  If
not, why is this approach being considered?

--=20
paul-moore.com

