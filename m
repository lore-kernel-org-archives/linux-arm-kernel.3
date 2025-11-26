Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79405D10F57
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 14:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pR02NLkjcqSBv+hssgOqUiqo/JjphFyxgTapA6P7TzI=; b=2OxA06fIh5uU7yt20BBPMkZdiq
	rkVQS5E8C1xjyA/nozT8ORM7mgu2rT54vO6vKmdpfomDJS3gxvydYc0py1G9+3QQVrAL5vTGgyqxz
	dGuaO5etTba0YTbPV8NXBaJMtCq2EBN1/2dX50dTJZmQRKV/3NulsHeZgDqphnd9A1rYA8whCcAH+
	DnKsuXCKggWhF8Ql9uHRX7uymhUfuuZDj5C1PlfCduu3XKcAlSY4r2QdyVNO2XSXCh+rXzSvQP4ZD
	EYuLFJ1KEIFjYZOUavVJEaZ3EdNroutTdUw3AdAg53gFc5J/Yyx9MA1BsKc4iD/xS+QpzTyLoCbLl
	KlNK/6iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGYU-0000000F79V-0w0g;
	Wed, 26 Nov 2025 14:31:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGYR-0000000F796-3LqV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 14:31:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0096A168F;
	Wed, 26 Nov 2025 06:31:27 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A2D83F73B;
	Wed, 26 Nov 2025 06:31:33 -0800 (PST)
Date: Wed, 26 Nov 2025 14:31:30 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] firmware: arm_scmi: Refactoring and enablement of
 ACPI PCC transport
Message-ID: <20251126-camouflaged-delightful-cuckoo-ddeac8@sudeepholla>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <87wm44aect.fsf@stealth>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wm44aect.fsf@stealth>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_063135_910647_BEB9D909 
X-CRM114-Status: GOOD (  27.50  )
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

On Wed, Nov 05, 2025 at 11:49:38AM +0000, Punit Agrawal wrote:
> Hi Sudeep,
> 
> Sudeep Holla <sudeep.holla@arm.com> writes:
> 
> > The SCMI can be utilized in systems using either the FDT or ACPI specification.
> > While FDT-based systems can natively use SCMI, ACPI-based systems often
> > need to abstract the functionality provided by SCMI under ASL methods.
> > So far, there has been no need to support SCMI natively on ACPI systems.
> >
> > However, with the addition of a few new protocols such as Powercap and Telemetry,
> > which lack abstractions in the ACPI specification, there is now a need to
> > run SCMI natively for those use cases.
> >
> > This patch series introduces ACPI PCC transport support for the Arm SCMI
> > framework, alongside several foundational refactors and enhancements to
> > achieve firmware-node neutrality between Device Tree (DT) and ACPI systems.
> >
> > The key changes include:
> >
> > 1. ACPI/DT abstraction and fwnode transition
> >
> >    Converted the core SCMI code to use `fwnode_handle` instead of DT-specific
> >    structures, ensuring seamless operation across both ACPI and DT
> >    environments. All property lookups, child enumeration, and device
> >    association paths have been updated accordingly.
> >
> > 2. Unified transport registration for ACPI and DT
> >
> >    Extended the SCMI transport driver macros to support ACPI match tables,
> >    enabling transports to probe using ACPI device IDs while maintaining
> >    backward compatibility with DT-only systems.
> >
> > 3. Protocol device initialization and refactoring
> >
> >    Refactored the protocol device creation and validation logic into a new
> >    helper for improved readability and maintainability. Enhanced the
> >    initialization logic to handle ACPI-based SCMI devices without explicit
> >    child fwnodes.
> >
> > 4. Introduction of ACPI PCC transport
> >
> >    Added a new SCMI transport driver leveraging ACPI PCCT (Platform
> >    Communications Channel Table) subspaces via the Linux PCC mailbox
> >    framework. This enables SCMI communication over PCC on ACPI-based
> >    platforms.
> >
> > Collectively, these changes lay the groundwork for robust SCMI operation on
> > ACPI platforms, achieving near parity with DT systems where applicable,
> > while enabling the new PCC transport path for firmware communication.
> 
> I was interested in taking a closer look at the patches here but they
> have a dependency on support for the telemetry protocol patches. I get a
> compile error.
> 
> I was wondering if you have a branch with the dependencies included. Are
> the v1 telemetry support patches[0] the right version to be using?
>

I can create one but that is not strictly necessary. As mentioned in the
cover letter, the only dependency is on value of SCMI_PROTOCOL_TELEMETRY
ins `scmi_std_protocol` enumeration. Just add one and you must be able to
compile the series independent of Cristian series.

-- 
Regards,
Sudeep

