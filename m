Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3869FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 04:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OS4rNn1ilR8uhwWfGrNuWfXN5QsSPqnhCVKlr89XwtA=; b=2syfmSrR/clpws+nTwe8Wb+ynI
	N6p85OHffnl42KmqRtJYJ+KZLpSSo3FJyFgw5Sufig3znckI5rAIgRysUt5ijPnhpHAozrUPYdFj2
	u0ZyCxHHzbkkXkqL23FBHIDfEzS51fmt9Oc7SubNdk9xblZDQkJ+sb+1++xsUNIyiWrC3WnjxWscZ
	MUOPzCTjtpO0aJeUaPOgSleFLCgmMuRspOP4+lYlv1C26RGDJszSH6xA2ZIVaO8YKe+6FzkiVW67/
	JCZJzJpFR6fMv8bcCafzjIEE25V5SC7cvjfDqK6kikr3wkjPRVyza1DCdH+uGhnHKIYOcyqzgi1wx
	lllLRTEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGV1M-0000000E5C7-3sDI;
	Sat, 25 Apr 2026 04:53:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGV1J-0000000E5Bm-155S
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 04:53:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F16E335AB;
	Fri, 24 Apr 2026 21:53:21 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 597DE3F62B;
	Fri, 24 Apr 2026 21:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777092807; bh=+9u7EK2Y/HhdgOEE30vcAjodDpWFlSP0b0+cZVFApXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpyx+TbMIq+ior7LsPTIlyZk8u/VbsgXRov22WCh+KdsLt06ArcEHlBUHXOlw+5tP
	 zoH8OS46iFTYFpYFWcrsJrw3oFSPduaM14w1BBFJd/fUg7AujO/atqUP3oPa8LMf2A
	 NS6wirQcjTnwHLgYLDMgefazm5Gmke6C/JKNzV4w=
Date: Sat, 25 Apr 2026 05:53:20 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Paul Moore <paul@paul-moore.com>, roberto.sassu@huawei.com,
	Jonathan McDowell <noodles@earth.li>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	jmorris@namei.org, serge@hallyn.com, dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com, jarkko@kernel.org, jgg@ziepe.ca,
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com
Subject: Re: [RFC PATCH v2 1/4] security: ima: call ima_init() again at
 late_initcall_sync for defered TPM
Message-ID: <aexIwJpno3iPIdRD@e129823.arm.com>
References: <bd908e28298d968740d03c97bc7e441de188b7b4.camel@linux.ibm.com>
 <aeokwrC86WI7uT+K@e129823.arm.com>
 <aeomlp3I0eVE5mce@earth.li>
 <aeotq8nPVu4wvEx5@e129823.arm.com>
 <e4e242ae5533d5762a3647186a178764881bf9ff.camel@linux.ibm.com>
 <aephL3MzYoqFGaT5@e129823.arm.com>
 <CAHC9VhRQWHEWQ5NzOPiu8jtYv6UsRm8WVS4fd74AbkOcAd4y_g@mail.gmail.com>
 <aesGU8a3mbVzvteH@e129823.arm.com>
 <CAHC9VhSaT_quKYnpFjAfqvL07JNbWMgM6c4pB9F46NHawX3DCA@mail.gmail.com>
 <014cf39aa8d6a0bcfa1a95c069675977ac67b843.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <014cf39aa8d6a0bcfa1a95c069675977ac67b843.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_215333_525323_6194F005 
X-CRM114-Status: GOOD (  15.67  )
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

[...]
> > I understand the need to ensure that the TPM is available, but if it
> > isn't safe to wait to initialize IMA at late_initcall_sync() then it
> > would seem like this is a bad option and we need another mechanism to
> > synchronize IMA with TPM devices.  If it is safe to initalize IMA in
> > late_initcall_sync(), just do that and be done with it.
>
> Within the same initcall level there is no way of ordering the initialization.
> Yeorum attempted to address the ordering issue in commit 0e0546eabcd6
> ("firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall"),
> which is being reverted in this patch set.
>
> Ordering within an initcall level needs to be fixed, but for now retrying at
> late_initcall_sync works for some, hopefully most, cases.

Ordering within an initcall level is not good idea.

Though it came to my mind first long ago,
It also goes against existing mechanisms like deferred probe, and
can cause the driver model’s dependency handling to harden
in the wrong direction. So this I think it wouldn't be an option.

--
Sincerely,
Yeoreum Yun

