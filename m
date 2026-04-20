Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214A6F588E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I53+Jlg3kdlGg/Rj+8bJhpj0apdT2P0ZlMXr6W2UZ4E=; b=1Qeh6bcFFOK4l4KyQjkn0ddzEr
	nSb+euhD24yrhmOcOUs+8rG/EXjoG2FId12xJsmOWyHZEoUY5ihitwJy8bv8P7emxmtldR34lGFTV
	I2VYPP0EoBBFmIKJLMpN4hGW4X9BtZlTsyE1RvxNegNoJHWd9FQbG21jFD9jHqDx/nVyYxrZSMfqe
	0xtiPXlPfxrhYKs1Egoi/pSgN4FjwXPCojjBJ7z3+Fcdrtk1FU2OjQIE25/6PvMePqvE5EfnB74eT
	08Tt9ryS7DnIn2lIhfBMBOG/2U0uN6tsaHN6XalJ/S7SrkHZu7MAPdIXG7AUtNNbPoWtQmYjXPcYu
	hCjzbDCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqBK-00000007DXK-43Ls;
	Mon, 20 Apr 2026 15:05:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqBI-00000007DWU-2IxU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 15:05:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 015FF16F2;
	Mon, 20 Apr 2026 08:04:53 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DDA93F915;
	Mon, 20 Apr 2026 08:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776697498; bh=I53+Jlg3kdlGg/Rj+8bJhpj0apdT2P0ZlMXr6W2UZ4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiT8otpw/0GZmJVXuQDMx/xztcku9UYtGTjLlIS1HUYrELacmhj9huNRj0gz4l4Je
	 CuFVeQ8NnZ1FDFu7n0gS7HszvrOGrnamm6HHA/Mi6oMRnWYXF3I6pixSugO2Qa1Yr9
	 tZKmNoQt0x8S2BzUYHNR4G/NgdTMfbieI95nvFZg=
Date: Mon, 20 Apr 2026 16:04:51 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca,
	sudeep.holla@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 4/4] firmware: arm_ffa: check pkvm initailised when
 initailise ffa driver
Message-ID: <aeZAkzdUd+A99rbF@e129823.arm.com>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-5-yeoreum.yun@arm.com>
 <aeYbdmshGZJ4GhXd@google.com>
 <86mryx2408.wl-maz@kernel.org>
 <aeY2M3v97c00JjFe@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeY2M3v97c00JjFe@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_080500_714532_C209AB41 
X-CRM114-Status: GOOD (  28.68  )
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

On Mon, Apr 20, 2026 at 02:20:35PM +0000, Sebastian Ene wrote:
> On Mon, Apr 20, 2026 at 01:46:47PM +0100, Marc Zyngier wrote:
> > On Mon, 20 Apr 2026 13:32:32 +0100,
> > Sebastian Ene <sebastianene@google.com> wrote:
> > >
> > > On Fri, Apr 17, 2026 at 06:57:59PM +0100, Yeoreum Yun wrote:
> > >
> > > Hello Yeoreum,
> > >
> > >
> > > > When pKVM is enabled, the FF-A driver must be initialized after pKVM.
> > > > Otherwise, pKVM cannot negotiate the FF-A version or
> > > > obtain RX/TX buffer information, leading to failures in FF-A calls.
> > >
> > > At the moment this already happens after you move back ffa_init() to
> > > device_initcall().
> >
> > But relying on this sort of ordering is just making things more
> > fragile.
> >
>
> Thanks for letting me know. Since this is not a solid construct we will have
> to change the driver init code to come after pKVM in this case.
>
> > >
> > > >
> > > > During FF-A driver initialization, check whether pKVM has been initialized.
> > > > If not, defer probing of the FF-A driver.
> > > >
> > >
> > > I don't think you need to add this dependency. pKVM is
> > > installed through KVM's module_init() which ends up calling hyp_ffa_init() to
> > > do the proxy initialization. The ARM-FFA driver comes after it (since
> > > pKVM is arch specific code). We don't have to call finalize_pkvm(..) to
> > > be able to handle smc(FF-A) calls in the hyp-proxy.
> >
> > You do. Without the finalisation, SMCs are not trapped by EL2.
> >
> > And even if it did, relying on such hack is just wrong.
> >
>
> That makes it an even stronger argument to move the driver init at a
> later stage. I was relying on this to trap early ff-a when the
> ARM FF-A driver was used.


I don’t think moving the FF-A driver initialization to a later stage is
a viable solution. For example, even if it is moved to device_initcall_sync,
it still relies on fragile ordering.

Similarly, moving it to late_initcall is problematic.
Since deferred_probe_initcall() runs at the same level, if it is invoked first,
devices that depend on FF-A (e.g. tpm_ffa_crb) may not be probed correctly,
leading to deferred devices not being handled properly.

Therefore, the FF-A driver should be able to detect when pKVM has been
initialized and perform its initialization accordingly otherwise,
just relying on the trap after kvm_arm_initialised.

--
Sincerely,
Yeoreum Yun

