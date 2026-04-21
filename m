Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A6DF327CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 09:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUki7691gF6PAdgoVdG4YA6Jl/b0UXzAgcjElizpR2c=; b=T2usH62CJ8FQ9iBLq3VWJdpCbI
	vmGRn6A3wsrjFwDbBRqWb5quRfKrUnaxgbvdPQp/JP1GLSOCckTawOxV6B5N8gBXdbopjxpRHC1Wu
	2K4Jd4wTcgPTLTszAMo9Rdpl2oNREr/3WgGWnga4ZOIpHZUMtxrOetZfTtK4o8R/iMLEMpvNkyDtT
	CLfgdMmdfzF1t8XWxPDdRyOnk1sG8QQWOS2TlANbCCdGAWCm5mS/qZRByDh00RunJkS36+kDgiIAs
	V3RwPEFFkesfQORUci7RdatuZCqcX9lsU+In69FJBFezLMpDI8LLgBNtC5rY/pgbc8sznYynUJG58
	V237zpNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF79Q-00000008J9X-0HXu;
	Tue, 21 Apr 2026 09:12:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF79O-00000008J97-0O2b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 09:12:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB80625E0;
	Tue, 21 Apr 2026 02:12:02 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF5C93F641;
	Tue, 21 Apr 2026 02:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776762728; bh=bUki7691gF6PAdgoVdG4YA6Jl/b0UXzAgcjElizpR2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGniPLsiAh0DSyvAQ5HMjlIYa15Nz9Y+R15H0PhXbZ+6i7lwFWMIo2fK1tBXZmc6c
	 CJDGh1w13rrXBujXV81XH+KUHfoFW8C30GmjcKXD7XDvf6xppKXyTPQ8qpdwEnv14Z
	 U33+LK267IvzFlZkJIbw7cpxCc+Ho2cIdtbjqz9o=
Date: Tue, 21 Apr 2026 10:12:01 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca,
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 4/4] firmware: arm_ffa: check pkvm initailised when
 initailise ffa driver
Message-ID: <aec/YSxYO1bOhXhn@e129823.arm.com>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-5-yeoreum.yun@arm.com>
 <87se8sbozv.wl-maz@kernel.org>
 <aeNeNjfO7i128TIP@e129823.arm.com>
 <87pl3vb5bm.wl-maz@kernel.org>
 <aecf57rWloQwDh6v@e129823.arm.com>
 <20260421-married-liberal-ammonite-dffda8@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-married-liberal-ammonite-dffda8@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_021210_175528_B448E33E 
X-CRM114-Status: GOOD (  15.14  )
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

> On Tue, Apr 21, 2026 at 07:57:43AM +0100, Yeoreum Yun wrote:
>
> [...]
>
> >
> > Also, the FF-A initialization is not driven by a device probe, but rather
> > happens as part of the bus registration itself,
> > so it does not fit well with a device_link or probe deferral based approach.
> >
> > Instead, perhaps we could go with the idea I mentioned previously:
> > either introduce a notifier, or create a pseudo ffa_device
> > once pKVM initialization has completed, and
> > then let the ffa driver perform the additional initialization from there.
> >
> > Am I missing something?
> >
>
> In order to handle/cleanup some ugliness in interrupt management in the
> FF-A driver, we may introduce DT node eventually. But it will take sometime.

Unfortunately, I think this DT node wouldn't be helpful to solve
this situation for dependency with the kvm misc device...

IMHO, current situation, the notifier seems to good option. unless
we make the initcall to recongise this dependency.

--
Sincerely,
Yeoreum Yun

