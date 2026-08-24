Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C46EC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 22:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMg2aNicO0aB4QTFjgM7IykBRV4mduECWJB/Q/hH7A8=; b=uZjmoaobZrvRKUkLrf6Nh5IupN
	lFSXPncStlAKc7lQT/9kdMx/z48zv+t+6Fwzoxj+gxlP6nLfQz8+dduXW6KXa2bju4SvGiYClPOGd
	tHcIJbhM+XxyeX6mqXX3Wskkwqz9CeGpvLoHDDT9fwIfZYQWDnERi1yKhllJPEY5CapII3fW1fRBq
	4VzWwahe4rApkbYe4fbVuCwndl0ibhphksqjc7KOYX2urTLAOBsXm4og2NE0pHyjoHfNEyvNqVkm3
	+0Y6tzUEq0AZBnEjEoFKIj0zdXKcsDrfRQ+X5+0ok5O+CrWl//jVpOKFYsDpf9KtvYsD/EKuYABPp
	SldvtCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wydBi-0000000HSM6-0FZK;
	Mon, 24 Aug 2026 22:30:42 +0000
Received: from out-9.mta1.migadu.com ([2001:41d0:203:375::9] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wydBe-0000000HSKJ-2HW5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 22:30:40 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=C+tpSL7TVsBh+8q3t9TH1pAT+xgr21uNVTJjRSpvMQQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787610636; v=1; x=1788215436;
 b=sxyvxy/2PjurScy+WmlNVkeSh3yS2+0KhcXYqbFwZ04JZ+TqS1wrdrHPr9TtdVDrnLDtEZ7m
 lczVK75MJa5Zp/cZ9m51ig3cqjb3Vxfgy/3+43E/bW0Jp64fIRho6V6VXrd2FDX7kQMIvheOBXK
 y6bFPQ90xNEfhSH/cAg92dVU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f52.google.com (209.85.167.52)
	by smtp.migadu.com with ESMTPS id b0a1aecb9f4d6d88;
	Mon, 24 Aug 2026 22:30:36 +0000
X-Mizu-Trace-ID: b0a1aecb9f4d6d88
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so3546e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 15:30:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpYvsC0DnirYaqMRJKetAP5NIkVENTGjZHHs87+SprgDVNyohXCjNNCZZZW4sXy8VqCZuc1WLTxpFu0e7qXaDsd@lists.infradead.org
X-Gm-Message-State: AFuF++kQkMvzUfDJiH4HVYWJE5mT0QvxR/ZAS7dsYpmt1CcrbBx3iz8m
	QMj3SlFbHVwe95KVwDiSPGzknWkg9636AJokps6RGFdZeQjwZh7Zun5bWuhSMUNnsqWsu9AuYrM
	KIsaDWpdJRS0eL9aEn6ItQeVCOtQnmqhlOXRKG62I
X-Received: by 2002:a05:6512:68c:b0:5b2:a5e9:3aba with SMTP id
 2adb3069b0e04-5b49cf97240mr50807e87.6.1787610631348; Mon, 24 Aug 2026
 15:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260824184155.2644646-1-fuad.tabba@linux.dev> <aoypji6EJ8zToWvh@arm.com>
In-Reply-To: <aoypji6EJ8zToWvh@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 24 Aug 2026 23:29:54 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwueqEAVq-7_ioRN+1h3LNPAqHX3rTqbXODViJJM-D_pQ@mail.gmail.com>
X-Gm-Features: AcwNN1V5iZSXwG_fjN9lRaKeKRg6baF9PCHCMd29lA92d-wgYEEVof0B_z2gkoM
Message-ID: <CA+EHjTwueqEAVq-7_ioRN+1h3LNPAqHX3rTqbXODViJJM-D_pQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: Don't read GMID_EL1 when MTE is disabled
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_153038_784008_91F613F2 
X-CRM114-Status: GOOD (  21.45  )
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

On Mon, 24 Aug 2026 at 21:29, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Mon, Aug 24, 2026 at 07:41:55PM +0100, Fuad Tabba wrote:
> > +/*
> > + * Reading GMID_EL1 when the kernel has disabled MTE traps to EL2, and the raw
> > + * ID_AA64PFR1_EL1 reflects neither CONFIG_ARM64_MTE nor the cmdline override.
> > + */
> > +static inline bool gmid_el1_accessible(u64 pfr1)
> > +{
> > +     if (!IS_ENABLED(CONFIG_ARM64_MTE))
> > +             return false;
> > +
> > +     pfr1 &= ~id_aa64pfr1_override.mask;
> > +     pfr1 |= id_aa64pfr1_override.val;
> > +
> > +     return id_aa64pfr1_mte(pfr1);
> > +}
>
> Can this function not use __read_sysreg_by_encoding() directly and not
> get an argument at all? We'd get the override from that function rather
> than open-coding it here.

Like this?

      static inline bool gmid_el1_accessible(void)
      {
              if (!IS_ENABLED(CONFIG_ARM64_MTE))
                      return false;

              return
id_aa64pfr1_mte(__read_sysreg_by_encoding(SYS_ID_AA64PFR1_EL1));
      }

> Eventually, once we get Suzuki's clamping fix,
> it also ensures we won't be able to bump the MTE version to unsafe
> values (but that's a different fix from this one).

Agreed it's separate, but v3 applies the override without checking
that the CPU has MTE2, so id_aa64pfr1.mte=2 on a CPU without it reads
a GMID_EL1 that isn't there. On the boot CPU that's before the
override is sanitised. Should I check the raw register before applying
the override, until the clamp lands?

>
> If you are worried about additional trapping of the MRS, we should go
> for Will's improvement to always read the cached values in
> __read_sysreg_by_encoding().

Not worried :) __cpuinfo_store_cpu() has already read ID_AA64PFR1_EL1
a few lines up.

Cheers,
/fuad


>
> --
> Catalin

