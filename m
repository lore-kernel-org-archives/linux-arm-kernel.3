Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6EEF588DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6q3FLtE0M6J2F/PfEuR3infOq1/jMGGhvYKqZy6+Xo=; b=DgRL7kPrPkxm487ElFb4LYC+Sy
	T5p1C4Q29ShiIo+BG7U1oat6KEaAI1tfEaPFpOX4yV1qEqNrz73GkobgtChGZOTTctvXfDwAn5iq0
	GoP3YnYkXC3lpcC7jX7N5j4r+PcZzrp0CgydgWIv0lwFWSEa3KTKzzXJYbmuogrgCnumTXblR+pU+
	h2fWM3fQfE9RmJo39vICyViLZgSTAaEBxDH8FVdtqGGn5SDKO9ZTGu4ZZpknAjM6SmNTdUKVb/NVu
	RplOIGIV21MIoBs8fWRYG/xWl5YTywtE84a3Dcj9TxGSBHBMsQdGLkKCY6oij1U5Jgr4+SYhfTsNg
	kcuNxwIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpFn-000000078IT-12eu;
	Mon, 20 Apr 2026 14:05:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpFj-000000078GE-1q6t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 14:05:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so94605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776693929; x=1777298729; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6q3FLtE0M6J2F/PfEuR3infOq1/jMGGhvYKqZy6+Xo=;
        b=QSp6S+jsTzyMjlRcx9cipKbSTeTaIIETOtyH6PTaaaTHF2JsG/r5YxIm8Y/KAu+AR8
         5WyqqoQun3F+WJ0J4IUEBThpjGC0JiN6Q9zoSHdLs3ipMIVUG+g9nRSbNJKYs4VVrtRu
         3WxFIyPdc/ucXufyQDxodTNyqOlqU2383yxGoOiRpRelDGKvGpC/5QVMjDrwwcrh2aN3
         awC5Zde3W0DNBX6iyr1BFPeMGwSGsEvFI2aLY2VQgAU7JBuZf6ZdimTgqzvwZlwWGojd
         8UDwMyqxipUflsKePTCrVN/1IslgPUWo3Wp3c8ZAYGNUIUz8M/5MXSMdvzZXyk6P/lsN
         F36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693929; x=1777298729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6q3FLtE0M6J2F/PfEuR3infOq1/jMGGhvYKqZy6+Xo=;
        b=icfGMmQGgz3SVy+l+2yxC+s70/zplbFiVe2pM/lkmgwY7EtYuMZwnPb8e9VqYPtO0Y
         ljTNtXnMkZ05h89wPESTH/rfqWZCgBtnAhQB+4oeTitGfFdcbIEHlpiQNLqIURd+Qt7m
         dXpMZQozXfc6WVB7uncRH05IQNxzA3k20ynwds0upFKaGf7tWSJfyDvr0R7hNxTsuMqC
         OjpcYLGmnTEAyEydHak1T0eH/O44Wy5YyAvK7YNwF/xgKKyUEIW9Gte1Zid/72vMHg81
         6ZOjGEFeDx5htqmMoGOqn2mQ0zVarbbVKT8FoaarB38IYGnJm1dr8M/VVnt+TnU1F+Th
         ww9w==
X-Forwarded-Encrypted: i=1; AFNElJ8e8/LDWA3kpWKhDHun/adgWmZbItLw9yAEIT/K5XWqRRFMxsy122VAKmG1DmqxaFnwm+PD+yPooWll2aJgw+lC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm3MSAn5m7tvgS666ft3s7S0+BJQ//yJ/JcWAjHNtTS0e9Pfd0
	34zjoIVH2RQUbNzk34MBw+DoqkQXDjWcI81kZb7Q5JAZIoy2ugtxe/Nsg0OEQrwbJA==
X-Gm-Gg: AeBDiev7957GFZFjfzJi68BPAQMcYjmvOxPygFvob0xet+bIIXN6ZA5TbWRYWidcVyY
	Noq6sNVKcIZ/9OnM2dYxYMSxgsCioL1yXYAJtwmrDZvWx8b3muZ+u1op17ORkejepwuImTRRrB8
	g7YpXf1s3fwWsIYbX9vfnMLuWdJaYpL7RtRTEsOjdqghBoUmDcnvpv8xcPuxGlLTbBYquPcyUvy
	GvG/v1iigUXWF4o4qvMVg73xuycFpq9wJydeE5GCnBC7sI407BGi8QZ5VfO27RgYpE6JMVcgv7k
	U+MkSv7FtcXKfL6aGSt7mtqmjPOmm+9qKrew36qH22YgYR0zRuCUU+8zS4/nFB0TEfbMCQT5X/+
	1L4AbxjunH18SmBv8LXDKOI2dGGSZW0JtcIkZCLFKgtpn109/OW9NaldJclZx8za3lPXNhc1xhW
	BUHURhvmtpqpetDeMAqx6FL88sIGKfHdM3o8e/hloCokf8SYSzon4bfZwBXpw66C0+x5p/k16wf
	eAIa2oMV2rDmY3g7Ng=
X-Received: by 2002:a05:600c:55cc:b0:475:d905:9f12 with SMTP id 5b1f17b1804b1-4890095cc81mr2067335e9.4.1776693929074;
        Mon, 20 Apr 2026 07:05:29 -0700 (PDT)
Received: from google.com (117.15.199.104.bc.googleusercontent.com. [104.199.15.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm32798494f8f.24.2026.04.20.07.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:05:28 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:05:24 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca,
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 4/4] firmware: arm_ffa: check pkvm initailised when
 initailise ffa driver
Message-ID: <aeYypF4lv6LMH2ch@google.com>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-5-yeoreum.yun@arm.com>
 <aeYbdmshGZJ4GhXd@google.com>
 <aeYjiaPtAl7SMVkL@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeYjiaPtAl7SMVkL@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_070531_514264_8CF78F06 
X-CRM114-Status: GOOD (  27.66  )
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

On Mon, Apr 20, 2026 at 02:00:57PM +0100, Yeoreum Yun wrote:

Hi,

> 
> Hi Sebastian,
> > On Fri, Apr 17, 2026 at 06:57:59PM +0100, Yeoreum Yun wrote:
> >
> > Hello Yeoreum,
> >
> >
> > > When pKVM is enabled, the FF-A driver must be initialized after pKVM.
> > > Otherwise, pKVM cannot negotiate the FF-A version or
> > > obtain RX/TX buffer information, leading to failures in FF-A calls.
> >
> > At the moment this already happens after you move back ffa_init() to
> > device_initcall().
> 
> How? the kvm_arm_init() is device_initcall() if both built as built-in.
> 
> >
> > >
> > > During FF-A driver initialization, check whether pKVM has been initialized.
> > > If not, defer probing of the FF-A driver.
> > >
> >
> > I don't think you need to add this dependency. pKVM is
> > installed through KVM's module_init() which ends up calling hyp_ffa_init() to
> > do the proxy initialization. The ARM-FFA driver comes after it (since
> > pKVM is arch specific code). We don't have to call finalize_pkvm(..) to
> > be able to handle smc(FF-A) calls in the hyp-proxy.
> >
> 
> As Marc said, the before finalised_pkvm(), smc wouldn't be trapped
> to pKVM. IOW, in case when both built as built-in,

They are, I tested before replying to this thread. The HCR_EL2 is
0x480080000 so HCR_EL2 TSC bit is set so SMC/FF-A and trapping is enabled.

In __pkvm_prot_finalize it sets the HCR_VM bit which enables stage-2 and
then write the HCR_EL2 from params->hcr_el2. However I wasn't sure that
this is seen as a 'hack' and not expected to work.

> if ffa_init() is called before finalised_pkvm(),
> it couldn't proxy the FFA_VERSION, FFA_RXTX_MAP and FFA_PARTITION_INFO_GET
> called by ffa_init().
> 
> How can you gurantee hyp_ffa_init() which is called by kvm_arm_init()
> comes first even kvm_arm_init() and ffa_init() are on device_initcall?
> 

While they are both on device_initcall, the only difference is that
kvm_arm_init is arch code which appears before the driver/ code in the
linker. That's why Marc said it is not a solid construct to rely on
this. 


Thanks,
Sebastian 

> [...]
> 
> Thanks
> 
> 
> --
> Sincerely,
> Yeoreum Yun

