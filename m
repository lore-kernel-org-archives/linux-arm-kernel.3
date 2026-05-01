Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11080CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 15:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zc/yqiuFI8zLs6WNwYRHDaX4KurA8TMA/7iu8L3wyVY=; b=OHhxVulg0Itcjc5MfZ+mN2IoP7
	OOcl0ebcxUicD4j52p2C2ElSD3q8i7vsGGVYEGVr3q1wqUHqCDQmJdEvIlqJvUMJQfibIaipjT8vt
	zp9o3/G9h5s9QwXK+UTEUNpqt9Brl67u/bIbg1BNBx5PmKDgAJUcjSXWs2AeFz2QXrvRaWtj08uC2
	8fWs9L/FtoN0zn/HB4Q+OWTC9U3iVQc6y8HCA2KoV4ngJd8iyZDdR+auehetYZQ01m/Y3z6g/WahF
	+5ZOuzx55as0du+OSTQn5yZblGBPGWe/vVG8SuR6FyAEpBbTalHutPv3TnWlnf47MbwsGabV22C0c
	KN+pJ+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpNW-00000007Jfc-3ZUM;
	Fri, 01 May 2026 15:02:06 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpNU-00000007Jf8-2ClF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 15:02:05 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50d864c23bdso557291cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 08:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777647720; cv=none;
        d=google.com; s=arc-20240605;
        b=fbZWPsn1MODcp7hLl6r/hFup0DslqAQ62psBdIB7KU4XaGNsjprMIvzVuchfiZKHj6
         Jd6QH5FygK8/bvwSQeMWrYM7+qkPNBXkQ5fe8gE8N+EApXQxhMeUxNDc4wy390vdr7n0
         pCPyEoEv/kfCifUCb9/yPF5yxu5lrx9PnQVLd253xMYHloZ+XeQlHnl3iwA7vCyW5pqG
         A0rOWBeV7aAN8jVXQk84IpyP2ip/sjC3PHADODILX40KQ8ugk3VhrrkIFWlAOEMZDUlg
         3/O6HVj0qu/LvslOxbvhWZvd0orULAGxy2/p5Y4CvNbqFl8RDutoi091HmN2z+JIP1Cx
         IuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zc/yqiuFI8zLs6WNwYRHDaX4KurA8TMA/7iu8L3wyVY=;
        fh=OZsQHd2HYOI41sjpHirw6lkvruexlQ3BT2hu23/o6rw=;
        b=ZeROdMsPurivSTmGzXXhG6WhFE1G3GZleDL+66Zp7C5okaC9V3qi7pxf0HfOaF1Ecf
         MIltNQi3fPQnbn0XxcYFQedkouaOHukukZQ84BLDKtrEgQGZATGGF+UXdqUa1EgMYgiT
         kLqTgCPXg9DPBo9aE1I0bM+F9D8QchBrXGNC0JH8Pac7cLOVDjgHAPUOs9iwjvdTw3LC
         EWfkhPZB1mjxTQQttZOaNM0LXEDCkPrKIDMOxZNA66dz7vYrnGn8bPE30s4Aroc/dWN7
         bV2h1Oul96E5rF6CMdW9QHrpYkHXVatEEZdUcp8khg9VgJoJMLwfbrz3FFHcZ3L5VduR
         lQyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777647720; x=1778252520; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zc/yqiuFI8zLs6WNwYRHDaX4KurA8TMA/7iu8L3wyVY=;
        b=bAcF9uXDLPSBfol2pvc6TOAGL6mIKBqerthOQL7eURPDDHxcZYKAyExqWunoGRZMkd
         ASBaxejUhQK1VdPS7cdoUemB/HGoDumSO3+6C1vazipScPlxN15rXbrhMYAi2a/SOh6Q
         s+BBElRX9FwKTXYfoS96OOmZ3Kyj00jXqpwOPi92Adwbb/xfPmgJ54iHJm2WGhkxkY7H
         Zrjq4G09U1mrg2DVHsf91Jw64qfjut8KeusCQe3ty5CFzrJ74iwpWuiE2ENUdrESKH9C
         /cCg9WDr9No1tZv+s0kbyRbl0dz0aLV5eAaWGzhFFhi+eWd9azrDBADgYqiszhSlMRAV
         sSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777647720; x=1778252520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zc/yqiuFI8zLs6WNwYRHDaX4KurA8TMA/7iu8L3wyVY=;
        b=OY3TjlPBdrKJaM7e6I8VVdmHcawzmqhypp9nnDc8uc5xInGYjFQbll/aLBITHrBAlu
         hX8jK19sEb07ATJg87JXSLDXnERZ2WPGODOaV30hHVetsjH2xSn19Kvqu0ds5YVXq4sK
         owbhnGLzlrAI6bwdUXz5BQnieCk/201lkeRB1tfUPFWEws+0Hde51itgBV/kveghpcAE
         R11i8mzZuRwg9C/fagQJBYYkwjvGq9MP0JUFXW2zwFewVYiT40NUbd0RyHr+GeSo5FiM
         FYuk2z3VyLVFM3xqwd+OIW1k/4VnaudoNlEgrESI9Gq6iNjVv+03WEx1SaepGgih78QU
         cHfg==
X-Forwarded-Encrypted: i=1; AFNElJ8Kl7yA4oCq8YzhWU+pwlPijXHwmUl7iq7uvB1jpVu2oMIV+yPcPd9X/Eu4B0szLsNzMZP09AYJudwn/pUVHJJa@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk31rZvIhqQEAYnxUFCcLJEpeuI5QFyG6qcLLanbbZ41f3OWh0
	1FxG5yiiajifG33mqmUq6KNjUhRRAYRlWZ9Q7wsA/2vqk+g0RYOmkaU6+/msTdV5Rr9DlDQV6Wv
	MG91z+VpBw7M0lYxF3MMTcH7bFa0/HoduvCTSWybZ
X-Gm-Gg: AeBDiesJCXrKk0jl4XSILjd5lGN1PMuMNL1sxug70AoDPcf2ZUtPRSCls9JAofS3mha
	N/Ipuw6ngDhklpmUazHqa2iEXaIoM6xFJJDcnEByC10YXXu1/oWsjZJzLGlkKmwrEK6nq+NSDEn
	ArHgvgi93DUpJaahxLuHwfDzkK01OrLTuFp5UOVH8qcYiz0x/NMRCCvxufdRitg2UytrdfuTnPS
	ghSCEk+etmWXW2uRtFKitNDbVyvgCxUrHBOZs4GeQlonieFISsXEQ2hsyGu1UWV83SU/AgvY37b
	793WA55vqNwE1mv3kYzos2Z7903wuqKBikQEvpFPkTnueVpoKWkid6+WuBOiLg==
X-Received: by 2002:a05:622a:5e17:b0:510:fa1:73c5 with SMTP id
 d75a77b69052e-5103da47567mr15438331cf.16.1777647719224; Fri, 01 May 2026
 08:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260501112149.2824881-1-tabba@google.com> <20260501112149.2824881-2-tabba@google.com>
 <a7e2ac96-b710-40e5-a159-b49555bcf518@arm.com>
In-Reply-To: <a7e2ac96-b710-40e5-a159-b49555bcf518@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 1 May 2026 16:01:22 +0100
X-Gm-Features: AVHnY4INmeFm8QA4K3bkZ03la2-U8rDh6s5g7fQg4Z1xuyOvTM6dsAqgNAaZVmc
Message-ID: <CA+EHjTwgUF4AEw6WvxPiwMTtrTUEs1NjjuKso+VBChon2cdozQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] KVM: arm64: Make EL2 exception entry and exit
 context-synchronization events
To: Ben Horgan <ben.horgan@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, 
	vdonnefort@google.com, catalin.marinas@arm.com, will@kernel.org, 
	yaoyuan@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_080204_579470_5BE4C394 
X-CRM114-Status: GOOD (  33.26  )
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

Hi Ben,

On Fri, 1 May 2026 at 14:47, Ben Horgan <ben.horgan@arm.com> wrote:
>
> Hi Fuad,
>
> On 5/1/26 12:21, Fuad Tabba wrote:
> > SCTLR_EL2.EIS and SCTLR_EL2.EOS control whether exception entry and
> > exit at EL2 are Context Synchronisation Events (CSEs). Per ARM DDI
> > 0487 M.b D24.2.175 (p. D24-9754):
> >
> >   - !FEAT_ExS: the bit is RES1, so the entry/exit is unconditionally
> >     a CSE.
> >   - FEAT_ExS: the reset value is architecturally UNKNOWN; software
> >     must set the bit to make the entry/exit a CSE.
> >
> > INIT_SCTLR_EL2_MMU_ON in arch/arm64/include/asm/sysreg.h sets neither
> > bit. KVM/arm64 hot paths rely on ERET from EL2 being a CSE, and on
> > synchronous EL1->EL2 entry being a CSE, to elide explicit ISBs after
> > MSRs to context-switching system registers (HCR_EL2, ZCR_EL2,
> > ptrauth keys, etc.). On FEAT_ExS hardware those reliances are not
> > architecturally backed unless EOS=1 (and, for entry, EIS=1).
> >
> > Until commit 0a35bd285f43 ("arm64: Convert SCTLR_EL2 to sysreg
> > infrastructure"), SCTLR_EL2_RES1 was a hand-rolled mask that
> > included BIT(11) (EOS) and BIT(22) (EIS), so INIT_SCTLR_EL2_MMU_ON
> > was setting both unconditionally. The conversion made
> > SCTLR_EL2_RES1 auto-generated; because the sysreg tooling only
> > models unconditionally-RES1 fields and EIS/EOS are RES1 only when
> > FEAT_ExS is absent, the auto-generated mask is UL(0). The seven
> > other bits dropped from the old mask (positions 4, 5, 16, 18, 23,
> > 28, 29) are unconditionally RES1 in the E2H=0 SCTLR_EL2 layout per
> > DDI 0487 M.b D24.2.175, so dropping them is harmless. EIS and EOS
> > are the only bits whose semantics changed for FEAT_ExS hardware
> > and where the kernel relies on the value being 1.
> >
> > Make the guarantee explicit: include SCTLR_ELx_EIS | SCTLR_ELx_EOS in
> > INIT_SCTLR_EL2_MMU_ON so that EL2 exception entry and exit are
> > unconditionally CSEs regardless of whether FEAT_ExS is implemented.
> > This matches the pairing in arch/arm64/kvm/config.c which treats EIS
> > and EOS together as RES1 under !FEAT_ExS.
>
> In v1 you also had this sentence:
>
> "INIT_SCTLR_EL2_MMU_OFF is left unchanged: that path is used during
> very early EL2 init and the EL2 MMU-off transition, neither of which
> relies on these bits in the same way."
>
> To me, it seems useful to keep that sentence as it makes it clear that INIT_SCTLR_EL2_MMU_OFF is purposely not changed.
> Or is there a reason why you dropped it? Perhaps it's just obvious to people more familiar with this code.

To be honest, I thought the commit message was quite long, and I
wanted to make it a bit more concise. I could re-introduce it if you
think it's helpful.

Cheers,
/fuad

> Thanks,
>
> Ben
>
> >
> > Fixes: 0a35bd285f43 ("arm64: Convert SCTLR_EL2 to sysreg infrastructure")
> > Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
> > Assisted-by: Gemini:gemini-3.1-pro review-prompts
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/sysreg.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> > index 736561480f36..7aa08d59d494 100644
> > --- a/arch/arm64/include/asm/sysreg.h
> > +++ b/arch/arm64/include/asm/sysreg.h
> > @@ -844,7 +844,7 @@
> >  #define INIT_SCTLR_EL2_MMU_ON                                                \
> >       (SCTLR_ELx_M  | SCTLR_ELx_C | SCTLR_ELx_SA | SCTLR_ELx_I |      \
> >        SCTLR_ELx_IESB | SCTLR_ELx_WXN | ENDIAN_SET_EL2 |              \
> > -      SCTLR_ELx_ITFSB | SCTLR_EL2_RES1)
> > +      SCTLR_ELx_ITFSB | SCTLR_ELx_EIS | SCTLR_ELx_EOS | SCTLR_EL2_RES1)
> >
> >  #define INIT_SCTLR_EL2_MMU_OFF \
> >       (SCTLR_EL2_RES1 | ENDIAN_SET_EL2)
>

