Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFC5C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSE0JYRQj4NzmdA+7zDUjSEatmRf5Q356HFaN2jwssg=; b=rx/56HQNhqALeu
	ywPLZbdAw3tdXMLDEfgkNR9qXOTvRKIMiSdBooGkaBkTs13MMTle44SWb2Tg/d4GVnHKUaPZW+iLs
	1gltjY9/Zp83zVVCC1Hu5NsjFp/dBlTD0urZy8U/M1Sjsu6cEjZ6dgXqt/85IjOUkv79gJyPWOrHX
	U4rOV5w0wiCvGRPnPVtBKe1ys5TFfxLz5nnzRnHeuL0eM7OMBKW/VLwRdDrpWBVzWYCrOwLha4DAE
	QcCCZVruHReg36NFwLo6nuhpC85Nk/V0DdcK2EVPF5h5d4gWRmeeuZIbVUyJD5l5NEeE6VdNgP9xi
	9dBWSOQDsWgTLSXuGfRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZJm-0000000EfxK-34Kx;
	Fri, 18 Sep 2026 14:11:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZJg-0000000Eftj-2TE2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 14:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CSE0JYRQj4NzmdA+7zDUjSEatmRf5Q356HFaN2jwssg=; b=gsv9RbYsiO+PzriUQ99YNx/TM/
	a+pHUOYWFOBY8iF7uGRBEiDQM/mP0pG54Alv4/yzIQsHp9rL1Lg8+wotX7HLiym/GRn+sH4HxTBu6
	AD9i8dxNj5iHbmb88MLkui8ZSXRWecUDqSbFMmWD8vLLpNGrjbPbmT7AoQoTE2x1Y3yMUsvqOAo2Q
	exFWS2HCBBtdzxZlhdU4jePMcA6mB6aYXzwR6ml+S/7WIrQ/PyQnf5xwlocjokNDlkJpDnukO1AmG
	u5QrMLeGU3IVivZO9n7ZWMqLdry2O/rOB/hN3nK1qNOehsrBvIOdjKUkoAxHI4R3W58aRkS9jKcj1
	7O4KWwmA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7ZJd-0000000ABfM-2mnb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:11:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF94F1D14;
	Fri, 18 Sep 2026 07:11:44 -0700 (PDT)
Received: from e142021.Arm.com (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6D673F86C;
	Fri, 18 Sep 2026 07:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740708; bh=h3MfiV0woiOCQI6Gw/byJn2fJjYmiAn1DfvOYZgNqro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U9bvvXF6jmRsyhz8nEU6QFc31N3ZiSYUbdjdttMs+pbLAuDkT1znSBQoHYBjbLq9Z
	 gzMvjG1K522CWrnMwQAU+Z0ud/pY3cbRJzBvBKDBBoj1ThSuQ7XOj5IwCHddc/+Bi2
	 M8nRY8fwe7qnwLpEXSaZu0WX01m4LsW1fzaZg3yQ=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v4 8/8] firmware: smccc: lfa: add sysfs ABI documentation
Date: Fri, 18 Sep 2026 16:11:11 +0200
Message-ID: <20260918141112.2115555-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918141112.2115555-1-andre.przywara@arm.com>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_151150_061300_4D179D1F 
X-CRM114-Status: GOOD (  22.33  )
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
index 0000000000000..afd349af9cf14
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
+		via any existing explicit firmware update mechanisms), then,
+		if supported, can be activated immediately, without rebooting
+		the system.
+		This directory contains one directory for each of the LFA
+		capable firmware images supported by the agent, identified by
+		its GUID. Within each directory, the same set of sysfs files
+		provides access to the properties and actions for this
+		particular firmware image.
+
+What:		/sys/firmware/lfa/<GUID>/activate
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(WO) Write a boolean 'true' value to trigger the
+		activation of that firmware component. An update must be
+		pending for this to be successful.
+
+What:		/sys/firmware/lfa/<GUID>/activation_capable
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) A boolean value to show whether this firmware image is
+		capable of being activated.
+
+What:		/sys/firmware/lfa/<GUID>/auto_activate
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RW) Write a boolean 'true' value to allow a firmware image
+		to be automatically activated once a new firmware update
+		becomes available ("pending"). This depends on a working
+		notification scheme, for instance via an ACPI notification
+		or an interrupt to notify the kernel.
+
+What:		/sys/firmware/lfa/<GUID>/cancel
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(WO) Write a boolean 'true' value to cancel a recently
+		triggered activation, if that has not finished yet.
+
+What:		/sys/firmware/lfa/<GUID>/cpu_rendezvous
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) A boolean value to show whether this image requires
+		a CPU rendezvous in firmware to be activated. If true, this
+		means all CPUs will enter the firmware during the activation
+		process, so will not be able to execute kernel code or
+		handle interrupts for a brief moment.
+
+What:		/sys/firmware/lfa/<GUID>/current_version
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) Shows the currently running version of that firmware
+		image, as reported by the agent (if supported).
+
+What:		/sys/firmware/lfa/<GUID>/force_cpu_rendezvous
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RW) Write a boolean 'true' value to force whether the kernel
+		will perform a CPU rendezvous during activation. This has no
+		effect if the firmware already *requires* a CPU rendezvous.
+		Firmware images might provide services to the kernel, at which
+		point is might be unsafe to continue running the kernel while
+		the activation is performed. Sending all CPUs into firmware
+		provides the safest option for the kernel. If you know for
+		certain that there are no services provides by that component
+		or the firmware component can handle requests during the
+		activation, you can write a 0 in here to avoid the brief
+		kernel downtime.
+
+What:		/sys/firmware/lfa/<GUID>/may_reset_cpu
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) A boolean value to show whether this firmware image
+		requires a CPU reset during the activation.
+		Currently this type of firmware image is not supported by
+		the kernel driver, as we cannot handle a CPU reset yet.
+
+What:		/sys/firmware/lfa/<GUID>/name
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) Shows a human readable name for that firmware image, if
+		known. Depends on the kernel driver knowing this particular
+		GUID, via a built-in list.
+
+What:		/sys/firmware/lfa/<GUID>/pending_version
+Date:		May 2026
+Contact:	Andre Przywara <andre.przywara@arm.com>
+Description:
+		(RO) Shows the version number of a pending firmware update
+		image, as reported by the agent (if supported).
-- 
2.43.0


