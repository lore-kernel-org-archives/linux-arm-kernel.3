Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6A3C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwDBQNykuRmYGFu70OonIbUlNhBkjHVpvttegaysgv8=; b=bv8ZiCcEGV86iDNosQG2UucRvn
	jWtFRRyvzfhx8Dj/CpuJXENym21oOUoYCgn26ppLe5JYdAM/fOUWOGhn+ewkmfIGM4NUoobkIQz7B
	9IAhVsj4hxWMlT29zAfX3AYJywGwMOhMxst9L9KkNNTMsvodnnyoM3IT9S0k2rtwghzVtU2h96eqM
	SGWiZHGVrgPfYw+dnnFGkbhLhQxA/WlfhIph6Xiz7aQElFYrSNnDpOkca76hXVyR1qe4OTEASQmz0
	CpWsa8YcfbSW+mc71spx/WZ50jdYRJXgr9u9uulNg3XUooAANLosx5IvIlCVj95TeE3lRWU5WD03V
	ETzk3esA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLYn-00000002skn-2Vb6;
	Mon, 27 Jul 2026 13:40:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLYd-00000002shm-2hDj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:39:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE8B9601DE;
	Mon, 27 Jul 2026 13:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291471F000E9;
	Mon, 27 Jul 2026 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785159590;
	bh=VwDBQNykuRmYGFu70OonIbUlNhBkjHVpvttegaysgv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TFO4GhTEu55l/gxs6ZO7F5k0XBouUZVcY8Wnv12bbamRwLLNatQPHWATnWdL9HxFd
	 r+VAoaAgTR21b/eHvUDcETfFbIwCWGnUXKje8g4PFPR8/RZ0UpILnp2Hky4wLfbkbw
	 0aWdtUxPsphaMtgoWLvGAZFZwmjICdWz9bHglTwWH05uGMIWVk49BeL4WSsism85SN
	 pwTuRW1HUxX5BU1Qdcso1OIYwny4WZDn/iIptKCZtH1qKcpSwnCXPmrsJT9qIYEswH
	 ZN/Z3DL7PXOWzItQHPt/nRfEq1vBLi9GLZV0I5HRxzO5kY7IvnYyrZ5/LuS7v84ITB
	 Mq4krSTIKuoYQ==
Date: Mon, 27 Jul 2026 14:39:45 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/10] arm_mpam: detect and enable MPAM-Fb PCC support
Message-ID: <20260727-apricot-spider-of-jest-7a03dd@sudeepholla>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-11-andre.przywara@arm.com>
 <20260724-finicky-knowing-foxhound-df1e56@sudeepholla>
 <amdTr8Sxw9024CN7@lpieralisi>
 <20260727-knowing-bittern-of-tempest-6deb54@sudeepholla>
 <amdeITt0wL4FG2Am@red-moon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amdeITt0wL4FG2Am@red-moon>
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

On Mon, Jul 27, 2026 at 03:33:21PM +0200, Lorenzo Pieralisi wrote:
> On Mon, Jul 27, 2026 at 02:20:02PM +0100, Sudeep Holla wrote:
> > On Mon, Jul 27, 2026 at 02:48:47PM +0200, Lorenzo Pieralisi wrote:

[...]

> > > 
> > > I suppose it is to have properties parity between OF and ACPI without
> > > having to change the driver property parsing path.
> > > 
> > 
> > Yes, that was my initial thought as well. However, after looking into it
> > further, I could not find any device tree bindings in the upstream tree.
> > I am therefore unsure whether MPAM is supported on DT platforms.
> > 
> > The use of these device properties appears to have been based on DT bindings
> > that may never have been upstreamed. As [1] suggests, the bindings were
> > dropped before the initial merge.
> > 
> > Although we could rename these properties later to align with any DT bindings
> > that are introduced, I think it would be preferable to avoid adding new
> > properties unless they are strictly necessary.
> 
> Ah. That makes sense, if DT bindings get published the driver can be
> reworked accordingly (if we want to improve how the code looks), this is
> just Linux kernel internals anyway.
> 
> As it stands the "msc-id" property is churn, that's what you are saying.
> 

Indeed why add more property with names that may need to be changed with
DT bindings in the future especially if we don't need it(IIUC it is already
there in pdev->id unless I am missing something.

-- 
Regards,
Sudeep

> > 
> > [1] https://lore.kernel.org/all/20251107123450.664001-1-ben.horgan@arm.com/


