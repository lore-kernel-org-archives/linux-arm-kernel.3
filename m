Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEB6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lulY/imNSY4kViCEFvXo2yMu2/ktyqgptsFx/K/KoVU=; b=XkbRwiCu8AC7y6KbCXhsnLGnxh
	E7n9RlEfHVsnfk+h/ZzJqGrcRiCS9sBcljTcKJG+KlxSwNGJbm2mWyTjhopClSoNmYbUj1RjYdxsB
	OlhtCJFwLHp6OWQhQv6vSFmNA42ClhBM8afPPzOS9KgSPbMuZT7P9Z2gvz+vqLF4n19yyapEzVC9f
	z+KjLe7zxnCx+a9MDNgQ5uWgIBlnajTNpwJJYXD+rv3e33RFY1P20MgswEJEIdcI7/fmGyjT9aDAk
	lmwxxENE6rKRl+2Xdd0z70374bH9uvNrdpvUtN61iDkOzajwyEWts89KPoVcVDB94cQOPmz++QSVP
	+5XI3nlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBwO-0000000Gb8b-0SMf;
	Wed, 12 Aug 2026 16:36:32 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBwL-0000000Gb8D-1uK7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 16:36:30 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so1035132b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786552587; x=1787157387; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lulY/imNSY4kViCEFvXo2yMu2/ktyqgptsFx/K/KoVU=;
        b=Jtmz0qX9V0zRfFnJocqlNFG1YGlKOKvaYU2g/XQwHAO/5M/+G2PaeWjxYzF8p9Bf8K
         V6eqAqA1kKVTdR0AAkCTfxVwEPAKf56IZwtFjryeTelthMsBTtfVVLLFwoSzdWXy+5Cp
         e2I8QmSKLuW86W2moh5Nykja4+sk5vCKrdz6lebJ+SqhHtXg3WZg0Mm0bM01rN8jnQ4+
         e1E3E6ws5mfc98O5BWOCMbxIFa8+a2zm3dIU4RiRPaSUwFw9ETj3r4lH5lF1R0gs+mVv
         S36Tt6bUmLMF5lCtMwB20F9/NeGc8kK9dZvFsGoea8MkT7F6eQcRf6bnH9iloMKJVy1D
         +9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552587; x=1787157387;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lulY/imNSY4kViCEFvXo2yMu2/ktyqgptsFx/K/KoVU=;
        b=LUSWjBAuLF3eMxlqd1kj4A4cZ91nBSkp8yYGOOqg9EWXpK7DH2HGUKqAiEUeoJiGPP
         5ccQ29JW1okyOq6TcK5TAcejRrfA/v1+eOys4JTvM4Bgs4ZgMkq+T8m0Q25qk17lHykY
         5GESb8HI2rpXP87a9KRTy8t3VDJc/Vzd1Y6DlJmNmIjV/wfjpfSIaWMW/4XwBLzyHbUx
         uU3jioyxl3ErY6i5t8fN5U4BH8Nb7wVd2S6I5qjqBQ+OeU4ceDNEcE0F70pOdHl9Hb0/
         aJwrNd53QYlUol6MxiKGBX/X9cNMVQln6OcK736tiIzWgIKtIW42agDIQHdmkv/1eBpB
         mbrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSowtpoxaN+mW1Bj7Sauwq03UGXRn1lJ4EVQsvbER5sWhgbK5cXtgsY0rqR8Ins5eTkdoeBydKcu3x0FPYtnfr@lists.infradead.org
X-Gm-Message-State: AOJu0YxdIU0nVAQUJP8ctxc6nWSjx/viFv/ihPR5Cow4M7SLEebZtFPg
	6wK+gkf6VxGcEO6dvnHn55ofyOYrnlLNgDEIwGNc3spXfac7NErGiSclWtLGdXMo6alNEDl/vea
	ix7fgBA==
X-Received: from pgkz26.prod.google.com ([2002:a63:a5a:0:b0:cbe:df3b:e024])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:b98:b0:3c3:a9e1:a819
 with SMTP id adf61e73a8af0-3cc3f73ea48mr8503628637.24.1786552587302; Wed, 12
 Aug 2026 09:36:27 -0700 (PDT)
Date: Wed, 12 Aug 2026 09:36:26 -0700
In-Reply-To: <cdb8b0bd-a15a-440b-9d7c-b532aeee6eb9@linux.ibm.com>
Mime-Version: 1.0
References: <20260812153631.3376090-1-seiden@linux.ibm.com> <cdb8b0bd-a15a-440b-9d7c-b532aeee6eb9@linux.ibm.com>
Message-ID: <anyhChQlOs37se4B@google.com>
Subject: Re: [PATCH v6 00/33] KVM: s390: Introduce arm64 KVM
From: Sean Christopherson <seanjc@google.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@kernel.org>, Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_093629_498026_E2EC24B6 
X-CRM114-Status: GOOD (  13.47  )
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

On Wed, Aug 12, 2026, Christian Borntraeger wrote:
> Am 12.08.26 um 17:35 schrieb Steffen Eiden:
> 
> > C) KVM/s390 reorganization (patches 12-22):
> >     Prepare s390 for a second KVM module. Move existing s390 KVM code into
> >     dedicated s390 and gmap subdirectories to make room for a second KVM
> >     implementation. Refactor gmap to better integrate with the second KVM
> >     implementation. GMAP hides a few features only required when managing s390
> >     guests: Storage keys, CMMA, and prefix handling. Those are guarded behind an
> >     #if KVM_S390_MANAGES_S390_GUEST. Only features which implementation would
> >     break kvm-arm64 code are guarded. I leave the non-breaking stuff (like
> >     shadow-gmaps or ucontrol) for the LTO.
> 
> I will likely take 12-21 for the next merge window so that we can minimize this
> patch set.  sashiko and claude are happy. Mostly mechanical moves. I will review
> those first and might do small fixups myself if necessary.

Speaking of trimming down the patch set...

Steffen, can you post patch 1, "vfio: Use file-based reference counting for KVM",
separately?  I'd love to get that merged sooner than later.

