Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7405AFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPr8SIHHDGstuiF5ICNUeeXE2QFucMn1fnRTY2itK50=; b=RvUmiphDLIabFXzq4TxncspT/k
	YZaZgjP4t1G7aMVKcL9ejKRkIRNz99uyrosvNBjF+TErRywcRfBe7GPywJaat7lVinjktkUQCShZa
	5nt31vUschgm4Adi/Gm07RdCb7W21jUl9lv/s3cCa+SBh/UeKq+kp/I03Y2rEa9mckLB7XebSd9YW
	/52yKP/6+wcjW9rsFnPVJQyUYfDE0HJfRWcLhv0qJUoJtmN7v5H2CH7T07yN82noqVocL6eT9iB29
	Isqlx0ZITAQLAebcdmZVUehNBBEUex0MKdsu7hGVIOK1q4q4vHYiKmID6d1oNh0zKpAtsTRGRNZ2y
	0s98BAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGvz-0000000GXWA-1CxE;
	Tue, 05 May 2026 14:39:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGvu-0000000GXTL-3Si2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:39:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0242419BB;
	Tue,  5 May 2026 14:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2880C2BCB4;
	Tue,  5 May 2026 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777991973;
	bh=NgwaOYYhwkJoidvqP9ynAMiAuhZHiTJ5mxPCuvHYbM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvYfCPdEURheb7BU5RKgPvIL+Vd0jex98+FTp1gb0vtK2vTkS8ONmY2bBZDIshbB9
	 z2FEbM5CHxGKeDHpIl/bU28tnETNo8/UupR8KVhyLLEzi0LkCW99D9wh8WAhak/pFo
	 zfaxYthB9lMPsbzd20eSvu2+0A+IhuJAmaHwO/XQLh57NsDpPxBED3q3tWggEIt2cC
	 U1S7jFYiUt1Lz6hu5sQDX3ra2cAI0KVEc7c8CbrfoGdMLFRlLN0CFkMJLHt0K9+Tov
	 o2+fcoWTCpsacPoeehvuyfcDGsXMr6CWbkJAtkD2vJKx/CDY+kB9dMjVblusWkL7Kc
	 Zbi+jt7w3hYTA==
Date: Tue, 5 May 2026 15:39:27 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	jarkko@kernel.org, zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 2/3] firmware: arm_ffa: initialise ff-a after
 finalising pKVM initialisation
Message-ID: <20260505-super-gecko-of-argument-655030@sudeepholla>
References: <20260505095409.1948371-1-yeoreum.yun@arm.com>
 <20260505095409.1948371-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505095409.1948371-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_073934_898614_C90FF6E1 
X-CRM114-Status: GOOD (  14.87  )
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

On Tue, May 05, 2026 at 10:54:08AM +0100, Yeoreum Yun wrote:
> When pKVM is enabled, the FF-A driver must be initialised after pKVM.
> Otherwise, pKVM cannot negotiate the FF-A version or obtain the RX/TX
> buffer information, leading to failures in FF-A calls.
> 
> Currently, pKVM initialisation completes at device_initcall_sync,
> while ffa_init() runs at the device_initcall level.
> 
> So far, linker deployes kvm_arm_init() before ffa_init(), and SMCs can
> still be trapped even before finalise_pkvm() is invoked.
> As a result, this issue has not been observed.
> 
> However, relying on above stuff is fragile.
> Therefore, when pKVM is enabled, the FF-A infrastructure should be
> initialised only after pKVM initialisation has been fully finalised.
> 
> To achieve this, introduce an ffa_root_dev ("arm-ffa") and
> a corresponding driver to defer initialisation of the FF-A infrastructure
> until pKVM initialisation is complete, and to defer probing of all FF-A devices until then
> when pKVM is enabled.
> 

I don't like this whole ffa root device design.
Two question for now:
1. Can FF-A be a module on systems with pKVM which removes the need for all
   this dance done here ?
2. If it is a requirement to have this built-in, I prefer to add a probe
   and defer it instead of this root ffa device.

-- 
Regards,
Sudeep

