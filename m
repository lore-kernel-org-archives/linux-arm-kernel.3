Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE95ECCF2C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ymID8oqHCFAIWyYfqk6ucVD1Jsgmc6jMBtt8WzDyRFw=; b=HwhFINmfVTz8V+
	43JJuwXkeL7g75r6ZsqqEGMlt0wJouwcr7OmcHNaZFS4Uv7pdl39R60Tfn4QHZWjkao9Sq4rF5Yh9
	PHPT9Ktkl3pZLLbwSvHu3MkMqM63qAeB2QvLilGJS7tT48qdY8TvhJ9g+tlCbNh84G6gIpMZPDJhW
	HKxrUJFNdoOHr6ctFEfxCfjui9ZWJnI/OetTeI1mzaNdEobm1KV696xtxBYEdNHZUsA430QEOT/Su
	S5PXDqBRaB25K4bMY5k4lasAeYo+yhe+VHREnVo69D1DIZo+zuBYpqQkBvy8BcqNC1nby34WiNr38
	cS+siQY0ErTRp/RKwJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmer-00000003fKh-3EDA;
	Fri, 16 Oct 2026 18:27:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmek-00000003fFP-3uXr
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 18:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ymID8oqHCFAIWyYfqk6ucVD1Jsgmc6jMBtt8WzDyRFw=; b=hc661I475A79ckhfKXVN6rRLHL
	70iBmBBAdHY+mOgAzBx3PVPHANk1XnqIbsvRbkgUgZYhQ5LugSwbe4OmWpTNwYdLMYLWXiH9g9uR2
	stPcKhkIeE/z60rMDj92gFdcSOcglfmQyf3VqHNUmhkTixYWZITnpUmKkIIyvrI357ehHUxljIf+A
	mcjvhxf1RgjT92sCF6AJYWzRiCE8O5/lmO6BZOBYpHzDS98ztbtSN4hxnWhMwRlleFkuweWWmUPwv
	QnLwbJwYqfU7LWRQL4+2ONgWtvnw1jV6iZBxk4MrE79MfWu6p+QkmE2nzmNBsUcRonN29Go90Q8HM
	oJ3/TfiQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHmei-00000001qFb-09YS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:27:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A92031516;
	Fri, 16 Oct 2026 11:27:43 -0700 (PDT)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B68B3F7B4;
	Fri, 16 Oct 2026 11:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792175266; bh=eXLo4l00IuxcldPkqFxylRH7Wps8yF41ZAkJADgaRHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U9oPvj8XoObuD+WeGmW/awIze3MNcps1VBQP7WKlpK3oui9Isgen1bES+kKFi2okS
	 iwtfuedTFUCfHN9qMuctoHYlAqfEGgk7N7vt5x/pOsY1mBa589VpGoTY95QdDTqH5R
	 v4EUHkpwPfOKfn0uu1fmck+5VBGUkVMcceYAy6FM=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v5 8/8] firmware: smccc: lfa: add sysfs ABI documentation
Date: Fri, 16 Oct 2026 19:27:12 +0100
Message-ID: <20261016182714.1835813-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016182714.1835813-1-andre.przywara@arm.com>
References: <20261016182714.1835813-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_192748_411689_3C50395F 
X-CRM114-Status: GOOD (  22.55  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Document the sysfs attribute files as exported by the LFA driver.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/ABI/testing/sysfs-firmware-lfa | 106 +++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-lfa

diff --git a/Documentation/ABI/testing/sysfs-firmware-lfa b/Documentation/ABI/testing/sysfs-firmware-lfa
new file mode 100644
index 0000000000000..4e93a1aea91f7
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-lfa
@@ -0,0 +1,106 @@
+What:		/sys/firmware/lfa
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		The Arm Live Firmware Activation (LFA) spec describes an
+		interface between platform firmware (an agent) and any user
+		on the non-secure side (like the Linux kernel) to activate
+		pending firmware updates at runtime. The actual firmware
+		update would be provided independently (out-of-band, or
+		via any existing explicit firmware update mechanism), then,
+		if supported, can be activated immediately, without rebooting
+		the system.
+		This directory contains one subdirectory for each of the LFA
+		capable firmware components supported by the agent, identified
+		by its UUID. Within each directory, the same set of sysfs files
+		provides access to the properties and actions for this
+		particular firmware component.
+
+What:		/sys/firmware/lfa/<UUID>/activate
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(WO) Write a boolean 'true' value to trigger the
+		activation of that firmware component. An update must be
+		pending for this to be successful.
+
+What:		/sys/firmware/lfa/<UUID>/activation_capable
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) A boolean value to show whether this firmware component is
+		capable of being activated.
+
+What:		/sys/firmware/lfa/<UUID>/activation_pending
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) A boolean value to show whether this firmware component
+		has an updated image ready to be activated.
+
+What:		/sys/firmware/lfa/<UUID>/auto_activate
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RW) Write a boolean 'true' value to allow this firmware
+		component to be automatically activated once a new firmware
+		update becomes available ("pending"). This depends on a working
+		notification scheme, for instance via an ACPI notification
+		or an interrupt to notify the kernel.
+
+What:		/sys/firmware/lfa/<UUID>/cancel
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(WO) Write a boolean 'true' value to cancel a recently
+		triggered activation, if that has not finished yet.
+
+What:		/sys/firmware/lfa/<UUID>/cpu_rendezvous
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) A boolean value to show whether this component requires
+		a CPU rendezvous in firmware to be activated. If true, this
+		means all CPUs will enter the firmware during the activation
+		process, so will not be able to execute kernel code or
+		handle interrupts for a brief moment.
+
+What:		/sys/firmware/lfa/<UUID>/current_version
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) Shows the currently running version of that firmware
+		component, as reported by the agent (if supported).
+
+What:		/sys/firmware/lfa/<UUID>/force_cpu_rendezvous
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RW) Write a boolean 'true' value to force whether the kernel
+		will perform a CPU rendezvous during activation. This has no
+		effect if the firmware already *requires* a CPU rendezvous.
+		Firmware components might provide services to the kernel, at
+		which point is might be unsafe to continue running the kernel
+		while the activation is performed. Sending all CPUs into
+		firmware provides the safest option for the kernel. If you know
+		for certain that there are no services provides by that
+		component or the firmware component can handle requests during
+		the activation, you can write a 0 in here to avoid the brief
+		kernel downtime.
+
+What:		/sys/firmware/lfa/<UUID>/may_reset_cpu
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) A boolean value to show whether this firmware component
+		requires a CPU reset during the activation.
+		Currently this type of firmware component is not supported by
+		the kernel driver, as we cannot handle a CPU reset.
+
+What:		/sys/firmware/lfa/<UUID>/pending_version
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) Shows the version number of a pending firmware update
+		image, as reported by the LFA agent (if supported).
+		If not update image is provided, this returns zero bytes.
-- 
2.43.0


