Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9682CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPrN/no3DffduP2sEm94iiYCvuk5y36LiSEgg/HYSWY=; b=MselGXvjOj1bzhzLQbBgUj1yoT
	65JB/SOgzNE1hNA3VD4nIxCtv7u5dmovXs34/0pf/O/aLw3tjqMl9AYhNu1on2d3wia+vkU8vzllR
	yGazgbxBfgiq82vHg4oVUs1gIS1tuzolvn9XCmG0qduBqV7SnnXUE50X0sjz9sqj4tJa39XHw4Hyj
	JR7hWsXaaw0Jj22NcBYAXruEJhVuhFqZGtn6ppdWurXEU46QpLP+AH8Xg+JFXehJwbk71rxF6oEkB
	UYqanP7qaxxeFpmnk4jyLLaIL0olwxltf2XBGF34+Mp5AtS9fvwPtOf1TBGW2yL2zK65GgikgFTN8
	5x3ADL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMIx-00000000LiS-0U7P;
	Thu, 15 Oct 2026 14:19:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMIu-00000000Lhf-1XfY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:19:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABE2F1477;
	Thu, 15 Oct 2026 07:19:25 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C8BF3F871;
	Thu, 15 Oct 2026 07:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792073968; bh=toY2d+nKnmDfOpFRB7kB9FTOmrbPE2iy1wkw0IypruA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3vi/qaGwlAMS6V2VrtigNi/Q0VFTsR5SvFAE1qOc5LJDFUg0KwzQ5o4ZY7d7aoXX
	 c6oCRN7lw7xuowVJbfbIVt4snSN2EfAzZVhhsM1O1xgdggk2ZbjoUtMYtaebVcBZFd
	 PVaIFnaZCRoisRwYZpfOTVYNcRuljdGFUMaL+nB4=
Date: Thu, 15 Oct 2026 15:19:26 +0100
From: Leo Yan <leo.yan@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: "Johnny.Fan" <johnny.fan@cixtech.com>, will@kernel.org,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	james.clark@linaro.org, jeremy.linton@arm.com,
	cix-kernel-upstream@cixtech.com, bob.zhang@cixtech.com,
	jie.fu@cixtech.com, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH] perf: arm_spe: Support heterogeneous ACPI systems
Message-ID: <20261015141926.GC26205@e132581.arm.com>
References: <20261015062908.3565761-1-johnny.fan@cixtech.com>
 <86mrsf1bnv.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86mrsf1bnv.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_071932_598764_6222A01E 
X-CRM114-Status: GOOD (  24.31  )
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

On Thu, Oct 15, 2026 at 11:49:24AM +0100, Marc Zyngier wrote:

[...]

> > The CPUs without SPE are trimmed from the PMU supported CPUs by
> > probing PMSVer on each CPU, both at probe time (for online CPUs) and
> > from the hotplug callback (for CPUs that were offline at probe), as
> > ACPI conveys no affinity information and the PPI otherwise defaults
> > to all possible CPUs.
> 
> This is a bit odd: at the beginning, you are stating that the SPE
> interrupt being 0 is an indication of SPE not being supported. Then
> you check for PMSVer for the same properly. This seems pretty wrong.
> 
> It should be possible to build the mask of SPE-enabled CPUs without
> IPI-ing the other CPUs, and only rely on the firmware table.

Agreed.

The SPE driver probes its capabilities on one CPU selected by
smp_call_function_any(), then performs local setup on every CPU in
supported_cpus. It therefore relies on that mask being accurate;
including a CPU without SPE could lead to accesses to unimplemented
SPE system registers.

> > @@ -97,6 +100,20 @@ arm_acpi_register_pmu_device(struct platform_device *pdev, u8 len,
> >  			return gsi ? -ENXIO : 0;
> >  
> >  		this_gsi = parse_gsi(gicc);
> > +
> > +		if (optional) {
> > +			if (!this_gsi)
> > +				continue;
> > +
> > +			if (gsi && gsi != this_gsi) {
> > +				pr_warn("ACPI: %s: CPU%d: inconsistent interrupt %u/%u\n",
> > +					pdev->name, cpu, gsi, this_gsi);
> > +				return -ENXIO;
> > +			}
> > +			gsi = this_gsi;
> > +			continue;
> > +		}
> > +
> 
> This "optional" parameter feels very wrong. We now have an
> infrastructure to get a set of affinities for an interrupt (see
> 5324fe21ba9b7 and following patches). What this needs is ACPI to be
> plumbed into this.
> 
> Unfortunately, ACPI is awkward and very badly abstracted in this area,
> but that doesn't mean we should make the driver code more bizarre.
> 
> Treating SPE and TRBE differently is just as odd, and there is no
> reason to do other than suiting your particular platform.

Yes, SPE and TRBE should be consistent.

There is also a grouping question for SPE and TRBE. If all participating
CPUs implement the feature, but have different capabilities, should ACPI
registration create separate platform devices for the compatible CPU
groups? DT can describe separate CPU subsets using PPI partitions [1].

Thanks,
Leo

[1] https://github.com/torvalds/linux/blob/0fcb05b72344f40806cbe810de8872f1698bf053/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml#L139
[2] https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/refs/heads/master/fdts/tc-base.dtsi#328

