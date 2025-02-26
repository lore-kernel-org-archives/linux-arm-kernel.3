Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCABAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 18:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/V8Jj9rYZChtFzsP4NciMXPlW80o7eEp6Sp5AawXIs=; b=FxySMp4i5EvP8xIFlbZKOnGmEu
	tRj8/qGYKE0r5v2cAY975C85dqiR5fXeYHeFpJvftClkoK6+82PdSBzgOksYncm8UiRQ+iplnG1fM
	CSO2nnIIrm6QFmorQ2CK5MDJXJheBbW9uIxWAZEkitIU8NavUtFPBvmtvIhVj5NC4/JpI2wnSDsum
	v0siEWJCkmuE+gme7Zo0S0Zx41/LzkT503RhRFiU3KDEeED5Wleb6O4uwKs4qNfkMxul8+I+AK6GG
	efsDG4l8OTjn05fH+uqGnhsX3invlOuUWT9+jyHmUKhPM6eSPHD6mMqMXJ0DQHHxKW8pIxgrs9v+2
	JYbLWk0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLuk-00000004stD-2QXl;
	Wed, 26 Feb 2025 18:13:46 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLrx-00000004rJL-3DNB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 18:10:58 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e0373c7f55so7958a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 10:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740593452; x=1741198252; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V/V8Jj9rYZChtFzsP4NciMXPlW80o7eEp6Sp5AawXIs=;
        b=RoyMvI/0ry4WnjpdZEt72BNhHi699maajjasqYrZPo42+X2hFfeslsMjfTfHbSy6nH
         aexeDhhBxInL/TLF7dpO6O0HazhPtRsaGw47LI3fxrVXQK8n+GlguOLiRUgbgJJV5/Z/
         fvp1lr4/sH6g2WegIM6hhs1EnwX2U4+pnSjMF5oL4aEJV26nptdOBmy59TG6uQYgbbrZ
         PUhHo/+nwgZSQDKGwvp/paiJ//mblfJdJ71B/Sr6cczQY5N7VWIFFF8t4D+Paqnd2mZb
         IuCp6J7h56+Q7qdpob62yqcQeHp1unmpO6UcFaz53afMNXCAcDhzMGNL+3IXCuGA4r33
         KedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740593452; x=1741198252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/V8Jj9rYZChtFzsP4NciMXPlW80o7eEp6Sp5AawXIs=;
        b=QGO4gAXaKZpYTJikwXI+e7zqwv/3Pj53BKM/e8JnBzmoW/la2ze6rEumWK0S7nvS84
         wRs6l74u7+lvWuunSLdjrILNYCeVDbJPY17qISxg/5lMXGgzeBZxow0r3tqSUdehOPBo
         LiSSzzvH+2exJfOSx8/tUQgei30uOTyNLL0xLMNeWG3FRgC29nvcc5cLxGtlgV8Ppo/I
         54Boi1IAXojnREJmeV0AcCle3irBI3YHgKVBvOLWkvWzpZnmoUyHZLiM4s51pGmPyEGu
         537vQYRKKJdhVSccX+i1DADWaaY3EnswCN44wuhN8V0DowvbdEtFyBImKbo6RojJtlnB
         aiZw==
X-Forwarded-Encrypted: i=1; AJvYcCV3t9tbBfe4o39QOLyEBLQUVBLg1u9HI5MHsnTMfENFMqz23wxY7DzB7EdZMCYa/nIHCYE9Exz+tZJ82wIe0oYr@lists.infradead.org
X-Gm-Message-State: AOJu0YxB1n9j+H3X6aYjjU0/15oV7jaP2zM7kI3UjSPCJ6GBA8vNWmlQ
	x8VDPHNYHE65DMc5aoDFxeKM5RwgkhOE5AtPRIWphjHEOtzOtlV2nRSokRfdkg==
X-Gm-Gg: ASbGncviK7HSmLcF9VRgByiSPwgs8wg591tu3CZUTyagRtxSII4dCEOllOBgLkfdX+7
	ZqKQI8N6r2Z1CSrtOL4MqXcFT0NdwA3EFf79aJ5OHcl1KDquuOBeTlVKKU17F2B7a4VjJ683eMx
	THkl+bq+8MzGc5ykXkNRQer0o5G9aKLmWlmuXTH0ieuMBoLBkX0Q4gmJHpJyT7hayxfjQy++4gh
	MMpbkT20qXO62dpI3RJCJlQ3CDtdNqcnMzD9XRbuW+1xyC/YN4BHqVPu2ZpaqCwgYssNE6JrA3+
	Ym2+eILQB7qL1nRYYGkGR3uDVMjpJ6Z3oFnijotIMNlu/xZkGk0XxnjKV6n9ec0=
X-Google-Smtp-Source: AGHT+IFSemQuFVxhcR1OJIBHEWyJQf2Hjrc2hP3J/LbxvQX6+WX1I3uywZ6yJMAv4hfkJ2aaAYgxNQ==
X-Received: by 2002:a05:6402:501a:b0:5de:a6a8:5ecc with SMTP id 4fb4d7f45d1cf-5e4a0d490aamr5970613a12.5.1740593451852;
        Wed, 26 Feb 2025 10:10:51 -0800 (PST)
Received: from google.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e45a8b8c4esm3155601a12.26.2025.02.26.10.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 10:10:50 -0800 (PST)
Date: Wed, 26 Feb 2025 18:10:45 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] KVM: arm64: Selftest for pKVM transitions
Message-ID: <Z79ZJVOHtNu6YsVt@google.com>
References: <20250225015327.3708420-1-qperret@google.com>
 <20250225015327.3708420-4-qperret@google.com>
 <867c5crd2j.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867c5crd2j.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_101053_844779_E4DCD211 
X-CRM114-Status: GOOD (  24.46  )
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

On Wednesday 26 Feb 2025 at 14:32:52 (+0000), Marc Zyngier wrote:
> On Tue, 25 Feb 2025 01:53:26 +0000,
> Quentin Perret <qperret@google.com> wrote:
> > 
> > We have recently found a bug [1] in the pKVM memory ownership
> > transitions by code inspection, but it could have been caught with a
> > test.
> > 
> > Introduce a boot-time selftest exercising all the known pKVM memory
> > transitions and importantly checks the rejection of illegal transitions.
> > 
> > The new test is hidden behind a new Kconfig option separate from
> > CONFIG_EL2_NVHE_DEBUG on purpose as that has side effects on the
> > transition checks ([1] doesn't reproduce with EL2 debug enabled).
> 
> That's a bit annoying, isn't it? Without EL2_DEBUG selected, you won't
> get any stacktrace, and the WARN_ON()s are a guaranteed panic. Yes,
> this is better than nothing, but I'm a bit worried this is going to be
> hard to use.

Right, so you _can_ enable EL2_DEBUG on top of the selftest stuff, and
if you're not hitting one of those hard-to-find bugs described in the
commit message above, then you're golden. In practice I suspect that if
enabling the selftest alone leads to a panic, the next logical step is
to enable EL2_DEBUG and see what you get. If enabling EL2_DEBUG makes
the issue go away, then that'll require digging a bit deeper, but that
should be pretty rare I presume.

> Is there a way to reduce the impact the EL2 debug has on the rest of
> the code? It feels like it is more invasive than it should be...

Turns out I have a WiP series that moves the hypervisor ownership state
to the hyp_vmemmap, similar to what we did for the host ownership. A
nice property of that is that hyp state lookups become really cheap, no
page-table walks required. So we could probably afford to drop the
EL2_DEBUG ifdefery in host_share_hyp() and friends, and just
unconditionally cross-check the hyp state on all transitions where it is
involved. And with that we should probably just fold the pkvm selftest
under EL2_DEBUG and call it a day. Would that work?

Thanks,
Quentin

