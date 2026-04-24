Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A518FE51FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gC6970Y1MeIuXuHT2JeKUrc3G8Igo7GpHCqjGiNyIYI=; b=SnN2tbpOfD10apmD0OOmbjwe46
	uTMEdwRwhUav+7HAXla50R7pZT4sMOPDUxMneBaODvL1YvQPfUlRAbIdFdkVnlOy0o8HZyNbpopbS
	y/eC5XWiWLj2OmfN435fXoTtdFtrsgmUjuC4Y/ajd4tMHoCu4wDXbONt4U7jp7XcK0kVeuXfDPgir
	/zmq7naLLbKK/8BoW9od7Pb+mdieImxegq6unl/vooT7kukZYN1WmXmJLDkUrQzZlGLD01e4idzen
	U0jnlFiePW8kbIaNJI4CJFepUBKYJpuSRkCmXQlog+kOxCOcpwOad6s9ipzWBZiJrhVqdFqVXZlPc
	plZgtMIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDSh-0000000Czli-3heH;
	Fri, 24 Apr 2026 10:08:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDSf-0000000CzlM-1Ou5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 10:08:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 343E71BC0;
	Fri, 24 Apr 2026 03:08:28 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 358933F641;
	Fri, 24 Apr 2026 03:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777025313; bh=x20Ic161sKUwYRA6ryFZm4hIWfUOKk542S8QeGSaRlw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RO/fAHz4w6tvV0tSr5IiP9uY7Vpvlt8ixeEw8Een+yh4bUys4r8C/Y9PL6dsRTgnI
	 At4+HDGbiLUoAT3XFkrO0n7AEEritCUqh/AVLOwsAswJ9HEztUYiEhAtWKQpnMwLky
	 g411WdNzZ6wH5t9Q5l/U80d9VZdfG9tUyFijm8jE=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	pbonzini@redhat.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	liuyonglong@huawei.com,
	Jonathan.Cameron@huawei.com,
	yezhenyu2@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v3 4/5] KVM: arm64: Enable HDBSS support and handle HDBSSF events
Date: Fri, 24 Apr 2026 11:08:25 +0100
Message-ID: <aetBGXkIbHaHm0L6@devkitleo>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <0403d30d-e75e-4922-b8c1-8cae349f3dc2@huawei.com>
References: <20260225040421.2683931-1-zhengtian10@huawei.com> <20260225040421.2683931-5-zhengtian10@huawei.com> <acQj5grOdZT8LUGp@devkitleo> <e3253959-0340-4c13-a980-a599e090a6de@huawei.com> <acabezCO4B5BE40Q@devkitleo> <4e800c1e-25db-4aa2-b100-63434973de93@huawei.com> <acpfD3YjMpEdL5KZ@devkitleo> <aeeHNMqDx5Yipt_K@devkitleo> <0403d30d-e75e-4922-b8c1-8cae349f3dc2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_030837_498015_E097E051 
X-CRM114-Status: GOOD (  19.26  )
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

On Fri, Apr 24, 2026 at 02:48:26PM +0800, Tian Zheng wrote:
> 
> On 4/21/2026 10:18 PM, Leonardo Bras wrote:
> > On Mon, Mar 30, 2026 at 12:31:28PM +0100, Leonardo Bras wrote:
> > > On Sat, Mar 28, 2026 at 02:05:25PM +0800, Tian Zheng wrote:
> > > > On 3/27/2026 11:00 PM, Leonardo Bras wrote:
> > > > > On Fri, Mar 27, 2026 at 03:35:29PM +0800, Tian Zheng wrote:
> > > > > > On 3/26/2026 2:05 AM, Leonardo Bras wrote:
> > > > > > > Hello Tian,
> > > > > > > 
> > > > > > > I am currently working on HACDBS enablement(which will be rebased on top of
> > > > > > > this patchset) and due to the fact HACDBS and HDBSS are kind of
> > > > > > > complementary I will sometimes come with some questions for issues I have
> > > > > > > faced myself on that part. :)
> > > > > > > 
> > > > > > > (see below)
> > > > > > Of course! Happy to exchange ideas and learn together.
> > > > > :)
> > Hello Tian,
> > 
> > On the above, HACDBS depends on HACDBSIRQ which can be announced by either
> > device-tree or ACPI.
> > 
> > Do you think it's ok for it to be ACPI only, for now?
> > 
> > Thanks!
> > Leo
> 
> Hi Leo,
> 
> No problem with ACPI-only for HACDBSIRQ for now.

Awesome!
I got it all working on my side, so I will try to send a freestanding patch 
with the required needs from HDBSS :)

> 
> Feel free to let me know if you have any questions while working
> on HACDBS on top of HDBSS.
> 

Will do:)

Thanks!
Leo


> Tian
> 

