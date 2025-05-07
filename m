Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA04C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sS0llExS1eXxyFgw4+Gpjgkw6K/xV+LT7FYdS3MPFFs=; b=rkQbY+qjVcjf+UhXQVrsA2HoVd
	PEtdzR5XQOQA6U0FFe+/T15NJDE95hLoq8f1VBcoctyueIft0OwdgobVaE0XqNkGd6v7uMQzAUuSw
	GcguXP9H5FtLMtBKqo/IStKs7u1MhPN2He5jJSHrfuMpROEJ+1bcb5KDnkKW8qD4XfnjqqIChnHMu
	eUXSTmRP+b/xe08DvJJdfZ66NYO/52/OAI/r2ZYPy0Z0rJqfn35krJUFNXKGc1/Da5Os/JAxuoaMw
	ogCMMS55L94+hJyf9jHcXm7m4BoLF+Y6yaCP3ZOEuIE7DRsRFtDQudUCViZgkNfKvWvK2WWVl4n9R
	zHhCl1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaUZ-0000000Ep0C-3jsO;
	Wed, 07 May 2025 08:51:07 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZeQ-0000000EcsI-1WBI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:57:12 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746604624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sS0llExS1eXxyFgw4+Gpjgkw6K/xV+LT7FYdS3MPFFs=;
	b=f9Q/+hSUFnHY6a+pp1lBG1/y48EqELsSn4GeRn0uLg21uAFTFPwitAR0GaDz5s4y4kAakC
	ZUQoK9ZKS7bs2S8KuQu1zdWRYLZ639cPwjrz8JMumYG24Oq7T1Xy8P/3Nch4Ym0LY0ZOpG
	2BP5MgRKbgWY4/Smo0PkxzAyJ4eMn6U=
From: Oliver Upton <oliver.upton@linux.dev>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/2] KVM: arm64: Fix HCRX_EL2.GCSEn handling
Date: Wed,  7 May 2025 00:56:48 -0700
Message-Id: <174660459090.2542293.10603043906149596192.b4-ty@linux.dev>
In-Reply-To: <20250430105916.3815157-1-maz@kernel.org>
References: <20250430105916.3815157-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_005710_722103_2AB0CB9E 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

On Wed, 30 Apr 2025 11:59:14 +0100, Marc Zyngier wrote:
> Will points out[1] that GCS is completely busted on the host if we
> ever run a guest, as HCRX_EL2 gets set to a fixed value on vcpu exit,
> value that doesn't include the GCSEn bit. This is likely to kaboom on
> a nVHE/hVHE setup.
> 
> Obviously, nobody ever tested this.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: Properly save/restore HCRX_EL2
      https://git.kernel.org/kvmarm/kvmarm/c/ffea7c73d181
[2/2] KVM: arm64: Kill HCRX_HOST_FLAGS
      https://git.kernel.org/kvmarm/kvmarm/c/ef296ee98bb1

--
Best,
Oliver

