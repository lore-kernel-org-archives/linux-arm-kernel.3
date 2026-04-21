Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6B1F8FA78
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 14:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQrzwZGSkR5vX/uACt1liWVGs7KuLly+P/lvsUKBvfc=; b=p2sydbB5PuAKSak7mIPocysHMl
	u6RuSZeaMPHfDcbSHk0F7VPTPliLG+vhS5Z5XP+Xj8IO8lf/YQEIKc12FJwbp81QNu5QiOLRSpWbW
	eqSp6cXxoHTIIrQcAUPi1Sgc85dWFsR5PzDO/KYXUYG/3vClu6wmeRIhXSVdIaoeH/KXmV5A60wPd
	mPuosN9cNidIFQ5E+Vvd16vymrkngf/Y2m7vVAWITgcSNNCuEpIin53xz6n3VZBYVL11BUfIpST0R
	6KEZvxCcugpciVmPFhseGX4TbuPfynBiDfTUATzriqoctGVVWUYfKb2F7k+VYPbtaUAPV4nlc5cOh
	gs56JYIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBw7-00000008j7F-0GAb;
	Tue, 21 Apr 2026 14:18:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBw4-00000008j6i-3jgi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 14:18:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0D1825DC;
	Tue, 21 Apr 2026 07:18:34 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28ACA3F915;
	Tue, 21 Apr 2026 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776781120; bh=vAu2TZe4KLTTnExsF79HZ16TqzLObTuSThMNMoqwYmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DU2TyQmQAdeK7LaY99ERkB/P2rD92ghDuIBKbHU6l8oH8aVSyeuqUaXTzQZZME4pS
	 3Cma8C6BrCfnkUqZx1mWuRt1mElr+RuJm0OJoKWjz0NS+id2zVAQUoRqox3MEZXy2j
	 +eYt99Ev0UEajRaFBOa6mkGWCp0dShOF6OHK89AU=
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
Date: Tue, 21 Apr 2026 15:18:28 +0100
Message-ID: <aeeHNMqDx5Yipt_K@devkitleo>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <acpfD3YjMpEdL5KZ@devkitleo>
References: <20260225040421.2683931-1-zhengtian10@huawei.com> <20260225040421.2683931-5-zhengtian10@huawei.com> <acQj5grOdZT8LUGp@devkitleo> <e3253959-0340-4c13-a980-a599e090a6de@huawei.com> <acabezCO4B5BE40Q@devkitleo> <4e800c1e-25db-4aa2-b100-63434973de93@huawei.com> <acpfD3YjMpEdL5KZ@devkitleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_071844_966164_7761793A 
X-CRM114-Status: GOOD (  14.64  )
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

On Mon, Mar 30, 2026 at 12:31:28PM +0100, Leonardo Bras wrote:
> On Sat, Mar 28, 2026 at 02:05:25PM +0800, Tian Zheng wrote:
> > 
> > On 3/27/2026 11:00 PM, Leonardo Bras wrote:
> > > On Fri, Mar 27, 2026 at 03:35:29PM +0800, Tian Zheng wrote:
> > > > On 3/26/2026 2:05 AM, Leonardo Bras wrote:
> > > > > Hello Tian,
> > > > > 
> > > > > I am currently working on HACDBS enablement(which will be rebased on top of
> > > > > this patchset) and due to the fact HACDBS and HDBSS are kind of
> > > > > complementary I will sometimes come with some questions for issues I have
> > > > > faced myself on that part. :)
> > > > > 
> > > > > (see below)
> > > > 
> > > > Of course! Happy to exchange ideas and learn together.
> > > :)

Hello Tian,

On the above, HACDBS depends on HACDBSIRQ which can be announced by either 
device-tree or ACPI. 

Do you think it's ok for it to be ACPI only, for now?

Thanks!
Leo

