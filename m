Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0EFCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmZ+yRiWydGoYjrz8pZQR3/Gfo31OK0B6qcPe+UWQ+Y=; b=VbPmBKM8xHM0BBrv92XfC3/u3b
	QGA1Iw95N1m8IvuqY+I/PE3c349L2YcMnlQdittY5WpiBQDspgLKXEs80ZF8sg++1k3F/DVzMF9W3
	z++E71jpKNcyIGY5EF5/kNDr1JcJaPUBSRhYK3NE7O4QubpGc6Uk0/M6oRELkCszfjqU7VFLQGsrz
	wxXgfxE5hEWXTYStpZbp/K/yszMlfdoJIF59wH/tDFK+JL6cZI1+s5FNFHn2mCZB1ZYQpRBA3v0dl
	KgzvDZ08QcgAmjfeRzAND1MCX3giFIWTWRO6wwurlRKMt5dOpKQlOp6YO7rLb31NVvTCxl3onryIN
	H991doBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDlx-0000000G1sd-3QVw;
	Tue, 05 May 2026 11:17:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDlu-0000000G1sG-3Vip
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:17:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0851A28FA;
	Tue,  5 May 2026 04:16:55 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49B5F3F836;
	Tue,  5 May 2026 04:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777979820; bh=0zBd8wva2lIq2UG6LFH51+kY22Y+m/b1XM8Xt6AEgUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TgXY4NXhIx2uDQtS0+FeUAocTNO/hz/3iB1TpIUaaRDIUIEFp3/HJJkl0ejwC72QX
	 9cP5IiB+uC8oCB2nihgKqV/IctWHgVbGec1iw5QPPe4UAjjLb5iGXgMDxY0jk2hmL2
	 WSNQ2ZVG7uXjr3eR1SnEOGFhGx6V09e/ChdG1Z74=
Date: Tue, 5 May 2026 12:16:54 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	jarkko@kernel.org, zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, sudeep.holla@kernel.org
Subject: Re: [RFC PATCH 0/3] initalise ff-a after finalising pKVM
Message-ID: <afnRptWilWr7nABJ@e129823.arm.com>
References: <20260505095409.1948371-1-yeoreum.yun@arm.com>
 <8942c12e-6315-493e-98c5-d55f4e6341f4@arm.com>
 <afnLpG4osopTzpip@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afnLpG4osopTzpip@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_041702_972185_9A5499B7 
X-CRM114-Status: GOOD (  32.80  )
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

> Hi Ben,
> 
> > Hi Levi,
> > 
> > On 5/5/26 10:54, Yeoreum Yun wrote:
> > > This patch is split out from the patchset [0] --
> > > fix FF-A call failure with pKVM when the FF-A driver is built-in,
> > > specifically the IMA-related part.
> > > 
> > > When pKVM is enabled, the FF-A driver must be initialised after pKVM.
> > > Otherwise, pKVM cannot negotiate the FF-A version or obtain the RX/TX
> > > buffer information, leading to failures in FF-A calls.
> > > 
> > > Currently, pKVM initialisation completes at device_initcall_sync,
> > > while ffa_init() runs at the device_initcall level.
> > > 
> > > So far, linker deployes kvm_arm_init() before ffa_init(), and SMCs can
> > > still be trapped even before finalise_pkvm() is invoked.
> > > As a result, this issue has not been observed.
> > > 
> > > However, relying on above stuff is fragile.
> > > Therefore, when pKVM is enabled, the FF-A infrastructure should be
> > > initialised only after pKVM initialisation has been fully finalised.
> > > 
> > > To achieve this, introduce an ffa_root_dev ("arm-ffa") and
> > > a corresponding driver to defer initialisation of the FF-A infrastructure
> > > until pKVM initialisation is complete, and to defer probing of all FF-A devices until then
> > > when pKVM is enabled.
> > > 
> > > This patch is based on v7.1-rc2
> > > 
> > > Question:
> > > 
> > > FF-A initialisation can occur at late_initcall. Because it may be deferred,
> > > some FF-A requests cannot be serviced at that stage.
> > > A typical example is the EFI runtime variable service using DIRECT_MSG_REQ.
> > > 
> > > Depending on the platform, the EFI runtime variable service runs with StandaloneMm
> > > and uses FF-A DIRECT_REQ. However, when pKVM is enabled, FF-A initialisation
> > > may be deferred to late_initcall. In this case, load_uefi_certs()
> > > can fail if it is invoked before the FF-A driver is initialised
> > > via deferred_probe_initcall().
> > > 
> > > Moving load_uefi_certs() to late_initcall_sync, as in the third patch,
> > > seems not to have any problem since late_initcall and
> > > late_initcall_sync are both of do_basic_setup() and it's before loading
> > > init process. However, it is still unclear whether
> > > it would be better to allow DIRECT_MSG_REQ in kvm_host_ffa_handler()
> > 
> > The spec doesn't allow this. Looking at DEN0077A 1.2 REL0:
> > 
> > Section 13.2.2 says:
> > 
> > "If they are compatible, it enables them to determine which Framework functionalities can be used. Hence, negotiation of
> > the version must happen before an invocation of any other FF-A ABI."
> > 
> > and a bit further down
> > 
> > "Once the caller invokes any FF-A ABI other than FFA_VERSION, the version negotiation phase is complete."
> > 
> > I would have thought that an SP would only go into the waiting state once the version negotiation is done.
> 
> I mean the negotiation between hypervisor and ff-a driver.
> actually the version negotiation is done with SPMC in
> hyp_ffa_init() but the negotiaion between hypervisor and ff-a driver
> just choose the lower version between version requested from ff-a driver
> and negotiated version with hypervisor and SPMC.

Sorry. re-parse the word, not choose "re-negotiate" when
FF-A driver request lowever version.

> 
> So, the version negotiation is already done with SPMC
> but with FF-A driver with hypervisor is not yet.
> However, DIRECT_MSG_REQ has supported from v1.0 
> In this situation, is there any reason not to send DIRECT_REQ_MSG?

IOW, question is that some of ff-a request can be allowed
before version negotiation with FF-A driver but
using negotiated version via hyp_ffa_init() first or not.

[...]

Thanks.

-- 
Sincerely,
Yeoreum Yun

