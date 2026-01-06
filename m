Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF58C47BF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhDxtEMCF99Iy036TyYgHBb3c8cA1WOjZ8ZQ+/LmbVw=; b=IODwo6MbDtovLqteKXh2RaB7KD
	tIe/dAX3yfvZ3nFyyBB9u6V/9cAPRFpf1X+U+qViqk1B9+dEAov8Capi/mV9wGOi4WJ0eMd7TGhIN
	rm/IU67F+Zomj9USA2MkfMv0zqdjwhPKIQpUbkojv/Jjo/iwcXBAjMIfUeUzwWm2CB0oRN8UnCn9N
	z+3g0AewLOq2VCkw9IuYRTvgUnj+zgiUysTbkYpbmBMz+rVr+/mPjXj/x9fXvW1NZTmg6XluX0srT
	WHc7Gbi6Y6hDKrSClJuCVU52YaRDABTjBsCwV3XvJu8twHXImw5EVyoAEytC0AXP78w+N7RmSsBET
	qX5AaYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd86h-0000000DI7F-3kHu;
	Tue, 06 Jan 2026 14:32:23 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd86e-0000000DI6u-2yZN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:32:21 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59577c4c7c1so3042461e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 06:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767709938; x=1768314738; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hhDxtEMCF99Iy036TyYgHBb3c8cA1WOjZ8ZQ+/LmbVw=;
        b=gtXVeOSwvasgLV3LZYIZHV3PitOrBBKLSC89FtJEXgTayQxVTfKVAMS/LO+iZqJPLz
         Fq9vEnJw5U8LoPG0nz4GgOp4JlSDRH8nm8X5hlT9aL289xKoZyhxeNTw75qp5XB5edm1
         oGQh0ZKu+RoHd8wv1wykdO9AroAiIXV9AC32HcZJb/nH0PdnZa/+iYe/2iQWmM8mG4Di
         RGyqLURtjAkp63nR24nIS6dTaTU8TkweXMfsqYoVU8UUrjO6c8zDzlKaRnGyNzF5Jd6a
         YGztsATA+59Fkj0WL2ymL1MvPj/Y3FI/BjKcmcuiTMDCW8yJh40ZRGf2gbGyYh/pxpDR
         aZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767709938; x=1768314738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhDxtEMCF99Iy036TyYgHBb3c8cA1WOjZ8ZQ+/LmbVw=;
        b=thcJNuwR9AC2led0bOEihv513xFueRgEIc/KYWrQvuCoGk2WUBqIVJAWSxAko/pNqF
         T38e4dFgNOHU6i8YwIVejD/+LHdEvn5FZcVPeJKRZaAUxKiSyiGbb+j1tKi5HOWwP/tG
         Z803y8tLApIo3FzqPFbF4Ic/jrre3okBLXEjzk+sowzvriy6PRWkSh+EDnxvQNldbLxt
         eP9pTGxOV8eElxTxMiUZC0FJf1ew9kNccw2WJs8yRYbKRUWMhOes0l0XpcACfgFBviX1
         Snztr80OYRRRtd9LGHSvcmjyey45/PAPRzByesgLILVI0E8FYMWjiX6kbaZFo7k0VdL9
         vmxw==
X-Forwarded-Encrypted: i=1; AJvYcCV+YU3Wco+hZxWinN43SqsI8dndeyi0EqP3MUYmma2g3cT1ATdYxkLUZYlyyfCYyh+JfW5pCfH+9RGjLDn9H801@lists.infradead.org
X-Gm-Message-State: AOJu0YyVYMR1xbwg/DepQfH3HxUL/4Nu4iAQvGT0YD7rKFhRE1CgGAHB
	QLAuG1pN+gRD0/BSpGdmP7VIFKatjye3q9YqZ+O0jUKlCyt1Kt+q8ntcHo97HPYWXj4kCdHqPx7
	37M/qtQ==
X-Gm-Gg: AY/fxX5H6OivZevgUlfJlGkdoYHcCkuUD0Xx6I3h32+8zsnDk+UkLWbiFPWLumZBULM
	AEPSYrw/jllS7Y7Rc3AITwYtJGFUAGCwKdBJBg81323qAlxHpqzm8eOimo3Y2LzhxC3q18vGiyg
	jJ8zJoZiOT+ziSw+NoPkLpTX+J4/2kMryQbLTy2vKgQVXrPRzAKWQtaeZm7igSEmBie8nflon1H
	BepUWevU9zfPwYwkC3DI3MBBGJS/CPtyoQ1s4E17qnCB+an9Kt/dbYMm6gkbW9zUKInkfMuDX3E
	P6hQQDdm1/77bIyKsffxXH6wjie+eUNGlD1+Eoq/AJP0IKO0ndphdHKuq33IvacFy0Br538V+fF
	jB9a22lfaQ7xm2MtsE25xoj2Sz+lS9xtIqDb6ZtgOZIrR6AoSZNPRcDbBECzOPT2qpcLml3kW88
	INL6UzA1Czrx0IwIiNRhiDFdUHgXKLbdhkKCW3luoft9GrJYR4
X-Google-Smtp-Source: AGHT+IF9zm6QFdTZmWZWktW5iQ+vqNveJ/W6BDUFaPSdFRGdLXQLnJOaUT86qC22O5ZLKg1ItVuekQ==
X-Received: by 2002:a05:651c:41c1:b0:37e:508f:81d4 with SMTP id 38308e7fff4ca-382eaf717b8mr6454811fa.10.1767709937339;
        Tue, 06 Jan 2026 06:32:17 -0800 (PST)
Received: from google.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382fd34bc69sm3571fa.19.2026.01.06.06.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:32:16 -0800 (PST)
Date: Tue, 6 Jan 2026 14:32:12 +0000
From: Quentin Perret <qperret@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 02/30] KVM: arm64: Remove redundant 'pgt' pointer checks
 from MMU notifiers
Message-ID: <7g66xbfmfqf67qcowjuu725h3l33ecxhkffmlzxsjtbusk5eor@khlpkp7jdfzr>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-3-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-3-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_063220_795583_6D4E6D3D 
X-CRM114-Status: GOOD (  11.00  )
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

Hey Will,

On Monday 05 Jan 2026 at 15:49:10 (+0000), Will Deacon wrote:
> The MMU notifiers are registered by kvm_init_mmu_notifier() only after
> kvm_arch_init_vm() has returned successfully. Since the latter function
> initialises the 'kvm->arch.mmu.pgt' pointer (and allocates the VM handle
> when pKVM is enabled), the initialisation checks in the MMU notifiers
> are not required.

It took me a while to remember, but I think these checks are needed for
the free path rather than init. In particular, the doc for
mmu_notifier_ops::release() (from which we free the pgt) says that it
"can run concurrently with other mmu notifier" (see mmu_notifier.h), which
is fun.

Had you considered that path? If so, probably worth expanding in the
commit description why this is safe?

Cheers,
Quentin

