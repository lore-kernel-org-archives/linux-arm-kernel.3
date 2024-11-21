Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0D1D63959
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 09:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rP8Da8s2wnevMi29j7d8+2oFJbj2lRWCCDSZ4S6BMjE=; b=tYvTVsQixgovmipD/mdPDq0tSf
	6UmncoEBntM3eNKBMkMK2iCRVsg/0GyruO6BVA5rEwDK91/i5A4O0wFl2cb6HfwqWjCknlKW3lFpl
	FIHjLl3swlLz/uxZF0n8KqzPeermByjuyHeBJ7pJ7s403xvAiHrs+3AbHSv9V/xDeOi3ujgi3Gz/6
	xS+9Zli0hmiS0FN0Plye4hptQgHpVc0bFZQigG9mkVNm7l/8ZpNo1dpcQexmP24rtjgXL0gGohAXr
	hh1uaCMdABV/XjxUpM2lyEfs3lNEudTpaYklJ9h1OQM7BNUFfqB//AzS6vFBSb6NmjZiPQdF4yKmH
	+mRpND6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE3ie-0000000HGpn-3RKI;
	Thu, 21 Nov 2024 09:43:24 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE3hj-0000000HGn6-0BTu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 09:42:28 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-460969c49f2so225081cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 01:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732182145; x=1732786945; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rP8Da8s2wnevMi29j7d8+2oFJbj2lRWCCDSZ4S6BMjE=;
        b=sxvOyA9mBl/Xper+YDQHnw3+nnd2hxL8kX8bGfc/NILjkag5palWUiwJhFwBWSyOh0
         od+Um27krB4Mg9x370UeuikzMRDtTkoNi/PD1Ept/tOLaxfONwtdl1Vkht2SNnDDrowv
         LHWBln8LleY5jdiL6Q6y+0ph1If1glym7RS9wv0gdPwrwugwXmv4HBY8bsm7Y4smBfzA
         Fd+Jov9bw5z6bcQiNwER8rFr2E8SS4qEIl6PDRsoHlx16pLnCOt/BYhwTewYcz2hvQdw
         e+Qv+dHRXGOPpUfD6XHX6LqfDoH55g2rPainDI1+SCS/0IwRKHGQyZl2pSg+7a/Fo8Q0
         LRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732182145; x=1732786945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rP8Da8s2wnevMi29j7d8+2oFJbj2lRWCCDSZ4S6BMjE=;
        b=spdr929XagMVQvWkY/l6YIwpImp+2XWLrrnyW6K5LfaKNTdyKosaoKm9KvOYkE3Cmr
         luNIa2/Hse9Pthi1OQbmh025YXCsNOnmWfIRmhIk+nvKWovHntATb5HJ01bcnhcRpYtc
         Gt89u/u00cwJ2cUZ/jnyZEpzVtFZzJElaoTI1X4PAXAV0Mlz+Ge3UpW+X3phUos30rUM
         3jLSa1b+M5NQVVRH76ePBjiM84X7DAxnWP4TDsZFCDBqXV1DwvFYszJgZk/YMUI2x0rp
         UtlMjEbooBWw/46lcG0OjBt9oJySAaRCqFFgSP/S8Q1lnNaJuWUQ1rhME/Fu5L63S8Hv
         5qBg==
X-Forwarded-Encrypted: i=1; AJvYcCVqcTcc/K/qSAORO9DLiy/tUjbK+1LEIHTMSi+n6cmQ94IuJ93EHvxthmotwxZfU8B54kkYmMkEqEzIt5frh2NH@lists.infradead.org
X-Gm-Message-State: AOJu0YyZEoYvTts1E0tPGChUPmvap1miF90z0cDIBDfQ6yRvNnMY2q1t
	TuuJN6N3Lda5l5QMRCrcbkkjoehu9AMDBuGLLf0u8EzcXfGDK9yI9nPOPXgmlBYfDZzYW57Z5DE
	aD7EVeme7HpvvCMfhoxWezhfCC42AyG202pka
X-Gm-Gg: ASbGncvQaGKMmQpQxjluxh6KleNnrXL1eLHRycHesIECPe864ywXYXTsBvBfF5nU/0M
	qkQ2UIQ98zfxh/hC0SFSV0e4bdhId6MAX4HXWKrIGyNyDkLFKQ8Im2Jr7Oej8
X-Google-Smtp-Source: AGHT+IFz6PCHpbrIIj+vbX5fqVx29xCyDAikIqlQtMrrnG5d6xsAZ47MPsinRyCZ06YWTiincJIRrcrRSIzCHKH7CHI=
X-Received: by 2002:ac8:5989:0:b0:461:6e0a:6a27 with SMTP id
 d75a77b69052e-465300d14cfmr2591491cf.20.1732182144485; Thu, 21 Nov 2024
 01:42:24 -0800 (PST)
MIME-Version: 1.0
References: <20241120105254.2842020-1-tabba@google.com> <20241120105254.2842020-11-tabba@google.com>
 <Zz7wBU3BHW-XNnbr@google.com>
In-Reply-To: <Zz7wBU3BHW-XNnbr@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 Nov 2024 09:41:46 +0000
Message-ID: <CA+EHjTyGzjOnVnyqfS6LO5=_EhQY3CS18HyrnSmnfNF483yz6w@mail.gmail.com>
Subject: Re: [PATCH v1 10/12] KVM: arm64: Calculate cptr_el2 traps on
 activating traps
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_014227_099770_80683AF4 
X-CRM114-Status: GOOD (  11.30  )
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

Hi Quentin,

On Thu, 21 Nov 2024 at 08:32, Quentin Perret <qperret@google.com> wrote:
>
> Hi Fuad,
>
> On Wednesday 20 Nov 2024 at 10:52:52 (+0000), Fuad Tabba wrote:
> > -static void pvm_init_traps_cptr(struct kvm_vcpu *vcpu)
> > -{
> > -     struct kvm *kvm = vcpu->kvm;
> > -     u64 val = vcpu->arch.cptr_el2;
> > -
> > -     if (!has_hvhe()) {
> > -             val |= CPTR_NVHE_EL2_RES1;
> > -             val &= ~(CPTR_NVHE_EL2_RES0);
> > -     }
>
> To be on the safe side, should keep the RES1 stuff for nVHE?

Sure. My thinking in removing this is that, once consolidated, it
would be easy to spot whether we could be clearing the wrong bit. But
I could reintroduce this when I respin.

Thanks!
/fuad

> Thanks,
> Quentin

