Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4313CCD1B9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 02:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5n0B2RsLs10RONEsKYshZ66umgt/mNFNyqb6vFixnsU=; b=HySc88GhgZSh1bDxigYzd15Wqq
	hpU+yHW0W5E16CZy2aDSCDDw5oBoSNH8/fv3r0v5IcGIhe8l721biZi1G6RBWLiWdm+guSk4HvygN
	AOdnPgAjOK6huMq9rt0cwPCwBbWGE5+7f3dB60pOIeO5vQwioHsCtwAvTAAOim4bo9NT50QIMK7bF
	UUW5ywzKVPJNvOoW9500A28BAQQwd+4u96KhVb+8Qqc7I8qTRNkDeA84PYBiQq7UxIeO8e4sIRbsM
	9KWHzv1DYP+xqm7bx/iqJqD8gchAj8wlKT8mJV1I+CfQ7QCgzEee+PPryUr/Bf5JQbWZzEMyCqfVy
	owVtWpDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBOj9-00000001FlZ-1fxS;
	Wed, 22 Oct 2025 02:37:27 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBOj5-00000001Fiq-34Q7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 02:37:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5n0B2RsLs10RONEsKYshZ66umgt/mNFNyqb6vFixnsU=;
	b=hX8VbUshRg3DZ4q6x48tQ5ypzt33D2WMIsQ9qspL35DA53e8cSL7FPGXJ8pOVfzLcCgT9NQTY
	frbZQ9kfFEwih4GxbQWeeDveRhi2X90Cuof9ySUAdIvK3hrBYHVvFdmxXRoSMD4i4/dIdfWrcwp
	N6Z9W8p2Eu6RCQmdtxSSTd4=
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4crtZN5bBFzcb1W;
	Wed, 22 Oct 2025 10:35:56 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 618C3140292;
	Wed, 22 Oct 2025 10:37:07 +0800 (CST)
Received: from kwepemq200011.china.huawei.com (7.202.195.155) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Oct 2025 10:37:07 +0800
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemq200011.china.huawei.com (7.202.195.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Oct 2025 10:37:06 +0800
Message-ID: <0e885995-c85e-4f0f-b0e6-edac9928d854@huawei.com>
Date: Wed, 22 Oct 2025 10:37:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Add kernel parameter to disable trap EL0 accesses
 to IMPDEF regs
To: Marc Zyngier <maz@kernel.org>
CC: <corbet@lwn.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<akpm@linux-foundation.org>, <paulmck@kernel.org>,
	<pawan.kumar.gupta@linux.intel.com>, <mingo@kernel.org>, <bp@alien8.de>,
	<kees@kernel.org>, <arnd@arndb.de>, <fvdl@google.com>, <broonie@kernel.org>,
	<oliver.upton@linux.dev>, <yeoreum.yun@arm.com>, <yangyicong@hisilicon.com>,
	<james.morse@arm.com>, <ardb@kernel.org>,
	<hardevsinh.palaniya@siliconsignals.io>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20251021115428.557084-1-liaochang1@huawei.com>
 <86ecqwwig3.wl-maz@kernel.org>
From: "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <86ecqwwig3.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq200011.china.huawei.com (7.202.195.155)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_193723_918967_E76109C0 
X-CRM114-Status: GOOD (  12.28  )
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

Hi Marc,

在 2025/10/21 20:25, Marc Zyngier 写道:
> On Tue, 21 Oct 2025 12:54:28 +0100,
> Liao Chang <liaochang1@huawei.com> wrote:
>>
>> Add kernel parameter to allow system-wide EL0 access to IMPDEF system
>> regregisters and instructions without trapping to EL1/EL2. Since trap
>> overhead will compromises benefits, and it's even worse in
>> virtualization on CPU where certain IMPDEF registers and instructions
>> are designed for EL0 performance use.
> 
> Since you mention virtualisation, I want to be clear: there is no way
> I will consider anything like this for KVM. KVM will always trap and
> UNDEF such register accesses, no matter where they come from (EL0 or
> EL1).
> 
> Allowing such registers to be accessed from within a guest would make
> it impossible to context-switch or save/restore the guest correctly.
> 
> You can of course do what you want in your downstream kernel or your
> own hypervisor, but I wanted to set the expectations on the upstream
> side.

Does it make sense to allow EL0 access IMPDEF without trapping for some
special vendor CPUID, instead of forbidding it as the default setting on
the upstream code?

BR
Liao, Chang

> 
> 	M.
> 


