Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4585607B44B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RN5WwOqD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JD9u9Lpf;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CkMNFUcL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ymID8oqHCFAIWyYfqk6ucVD1Jsgmc6jMBtt8WzDyRFw=; b=RN5WwOqDGDtbCw3cMmFdihmSMP
	FyVUbCbK+uKQndMuJWe5T6qbWjMjnbEgBMChEqjjSrN/mN9JzZnr3oMsHZoPpsksraTxpIWzRUstk
	Hs7ZbqtB5HVvKZ/jMvUZYjhA2L3D2iMQP+VktSGWopSMgxzz+JniI7WEcdmcy798ZoiwF9rcgbY21
	OTpb2Xy8AUZKVE+kX19DG5F2qMQnS7AsfhFDYHUVzrd7ukuU7LHBrCDoIBFBSFPj+wK0flJrEf7kz
	HIzn29XKDz4c1//+4My/pul+e53t5/cD1lZGsbqeb/QEbZR/paxt0aSlUozwjSWABYdmeuXaR02gX
	/x7lAviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvJG-0000000HM3E-336a;
	Mon, 02 Nov 2026 16:55:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvJE-0000000HM0z-3mIw
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 16:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ymID8oqHCFAIWyYfqk6ucVD1Jsgmc6jMBtt8WzDyRFw=; b=JD9u9Lpf9APzN14fG7V8OpggTr
	xgTTs5xZge9Pq7XJEfU3Nis8dRlgZYVUO8Ojr/ECSZD+xqU2PfadTdPA4VZJ9UGzX4vLrR+eM1Fzo
	uLNAN2ojCZvWx06bLxK7zW4prWDLFImL94Rymbgg+78rhQ1bmNfxHUfPjF6QjuExG0JkvBsemSFJ7
	Ikt50O9MQDnAdwSRbGyHMLZ63M80Dd+2ek4jRAt5LsGIXd4RdKIQbek6itQSDpgCSutdWxqm3M7HH
	2SIZpjK2zNOMHjSgmiZDkfMjZP9MceQjh7HF8Ur+QuIDLewJXKE/nb4UDcxnwo/ZqzbDKRzWPKb3Q
	57/nq+wg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvJ8-00000002qVk-3mMd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:54:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DC3016F3;
	Mon,  2 Nov 2026 08:54:46 -0800 (PST)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98CEA3F871;
	Mon,  2 Nov 2026 08:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793638489; bh=eXLo4l00IuxcldPkqFxylRH7Wps8yF41ZAkJADgaRHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CkMNFUcLyKKS7hFmChYHo7hyq6fTPx4zFHYNUemvl3FwrUGKiLuSknrczYGFwkSHd
	 kLGyZ//v5qh4KUF7Tk0KhNKCc6WK+DYHpiO73M7NIY4xy8/xDfGqXF9KlgjwQRl0EP
	 az4/kOSU9iShP6Gn8aHHc3YvDIiPm3pPbKEukSuI=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v5 RESEND 6/6] firmware: smccc: lfa: add sysfs ABI documentation
Date: Mon,  2 Nov 2026 17:54:20 +0100
Message-ID: <20261102165421.3651202-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102165421.3651202-1-andre.przywara@arm.com>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_165457_939961_7B2E0DF7 
X-CRM114-Status: GOOD (  22.99  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


