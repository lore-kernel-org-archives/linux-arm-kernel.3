Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAE6C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/Vf4JqZOlRdkDX86iTvbq09jgwXW+/RtBV9DIZvhmE=; b=WdB6fUumh8aIpP3vLg8BzbRQME
	iobmzy66fO6abbZce83qGnZOHqi3ziafK1Gvj8em72wyFJLagNIcxvKaFOKNZ75ca/xR7AUdHlXnb
	ryrIU4BVZgkd4e/ksWSTye9IwnJrDhXv3yF5b9scGIwOX2XhRCKA8tddBz90pri1xdbswanDlI8X+
	CsunE+RW8EsdD7pskznofwwtz46p6T6fkv1RRiJw2dKsuoJyShO82No/YA093hcmilSzKs3RxeKE9
	n/kfm8xkj8YzxnJFIEpeB3JV7D3crX2hCqyrEkV7kLT1aDF59WI3YnARQd4UGXsiSCZn6DRaHiMC9
	ZdwF7l8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJMv-00000002YUr-40nA;
	Tue, 04 Aug 2026 17:56:02 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJMs-00000002YUJ-2YsU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:56:00 +0000
X-Forwarded-Encrypted: i=1; AHgh+RpW+fMzKk6iFIqnoU36Teot3HWjBeJPNfxypPEA2NnETDRo4VnBWKPVuBJ1WQGI6C41wZqIW5yPzriHHmc8Yzmt@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785866154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F/Vf4JqZOlRdkDX86iTvbq09jgwXW+/RtBV9DIZvhmE=;
	b=SBBXRUYdG8VXNZPOiUQYtqDfN3ohFdTmiZeqsIrFovYmvEzo5xQGUgepoVP07oxfyn6hhj
	uvVE/RFLkB5Jxpan6RUUb/P899nR6EaUNq+52+3TTSzk9Z6qTYXa+nw4wsq0sdaq7VHWoR
	KfyaT2M0WYE2A75y3RzPbE45yCYb9Ns=
X-Gm-Message-State: AOJu0Yz8Rr/YSyHRtMJRjawZavIxbI4thWwkM5IETZHhI1EUzYsTEpfx
	642vFmhJ8GmmPXQwntzCcfHcquz+aeqYIMYnb7gCCeXQJGp2TJSQ6v0fPZ9A9YHd7iCr03A8zc/
	9BJrQr3u1jWc+rO22JweGaObcCMPz5FhH6eqM6Vdr
X-Received: by 2002:ac8:6903:0:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-52ce6b25dcamr686141cf.10.1785866120314; Tue, 04 Aug 2026
 10:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260804092421.1728880-1-fuad.tabba@linux.dev> <599f665d-7474-4f17-a044-cc92b03d02aa@sirena.org.uk>
In-Reply-To: <599f665d-7474-4f17-a044-cc92b03d02aa@sirena.org.uk>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 4 Aug 2026 18:54:43 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzHSJnZ7YpJCVCvsHrvS0WtFmOEHUPST_+A9_0i7MXkow@mail.gmail.com>
X-Gm-Features: AUfX_mw54sYeUiJsXvDxqF1B0irs3Zmjh1gV7CnF488RmUDI8wbKkK8_cW6kwgw
Message-ID: <CA+EHjTzHSJnZ7YpJCVCvsHrvS0WtFmOEHUPST_+A9_0i7MXkow@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: selftests: Check ID regs are immutable after
 a failed run
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_105559_428140_2E6954B9 
X-CRM114-Status: GOOD (  15.70  )
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

On Tue, 4 Aug 2026 at 17:14, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Aug 04, 2026 at 10:24:21AM +0100, Fuad Tabba wrote:
> > Add a set_id_regs case covering ID register immutability when a vCPU's
> > first KVM_RUN fails after finalization but before
> > KVM_ARCH_FLAG_HAS_RAN_ONCE is set. The test provokes such a failure with
> > a PMUv3-enabled vCPU whose PMU is left uninitialized, then checks that
> > KVM_SET_ONE_REG on an ID register and KVM_CREATE_DEVICE for a vGIC are
> > both rejected with -EBUSY.
>
> > +     for (int i = 0; i < ARRAY_SIZE(test_regs) && !found; i++) {
> > +             const struct reg_ftr_bits *ftr_bits = test_regs[i].ftr_bits;
> > +
> > +             reg = KVM_ARM64_SYS_REG(test_regs[i].reg);
> > +             val = vcpu_get_reg(vcpu, reg);
>
> If we're doing a focused test for the specific issue there's the VM ID
> registers as well as the general ID registers and adding an irqchip.

Sure, I'll expand it and send something out tomorrow.

Cheers,
/fuad

