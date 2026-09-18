Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D27C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CO8Oyn7IYG3ALHbSi2USsgfJ+x51TV4uRFx8m850/a0=; b=3XKjGR4bnZaCRfRovAEhvFm7qp
	r+ZXOosqDp66Z2j4ZD0LXAkO4n+2UqkVYozRbq5aXF3ivNsTxIpQbW4+q97w+DzX8jwljqFeVa7P6
	PXRyt2gM7EfD8vwqY0sdjSJYArI934xr9BGqs7vr0Kir3iHdz9d7jUBY5EHsvKfxpWXk6i+50K+j7
	yWdlWZPS5K0GlQoFSzBqdSvIesENkCTBhdQE9oDxANUnMh1J6/XnIXZfVoGRKLt58nTAlxraLfPNW
	PvhYddK4HdMIphG0X+5XtdedstIS5MEP5DvLiRWkWr1BLNqHrnldM/GpJ3ljJ940efJn8phj+0xwY
	QaMIV1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bpo-0000000F5ph-49uf;
	Fri, 18 Sep 2026 16:53:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bpn-0000000F5pK-3kWd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:53:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57E7443D8F;
	Fri, 18 Sep 2026 16:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F0F1F00898;
	Fri, 18 Sep 2026 16:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789750391;
	bh=CO8Oyn7IYG3ALHbSi2USsgfJ+x51TV4uRFx8m850/a0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oCmOzlMaU9LSgu7TIKoQ2y7qM1hLwOxCnq9YWg2zNeO0TnU9K+w+1VutCGeJu0Pxg
	 z02M3v1d5f7J7usx/Gc4e8BBxkOBZRSzXO9hCA8GwikMrL3yyE/QrJDgODf29z0ye0
	 aSvVEM1o/DGn8rGUJBR72LF+e5mx48MZjNqWOiqsx6IGfnLmVnkwVTz+3Vgl/+TZcK
	 MYEaqUdRR0tvr7MzAOnY3ou5vB6/o5pZjBvUxeW/siNUaTPJKmdPSuUYn64gVa8YNT
	 BRlCTsUAmZgqa04TmSzMjWHjXLUAwRzqFvfQ4Y0NXjs5f+UpyiAv8RCo6VbDNi9Pig
	 MxwJm2DK7gmMQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/9] firmware: arm_scmi: Refactoring and enablement of ACPI PCC transport
Date: Fri, 18 Sep 2026 17:53:06 +0100
Message-ID: <178975035598.1810996.12105754539479601199.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
References: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 15 Sep 2026 18:03:34 +0100, Sudeep Holla wrote:
> The SCMI can be utilized in systems using either the FDT or ACPI specification.
> While FDT-based systems can natively use SCMI, ACPI-based systems often
> need to abstract the functionality provided by SCMI under ASL methods.
> So far, there has been no need to support SCMI natively on ACPI systems.
> 
> However, with the addition of a few new protocols such as Powercap and Telemetry,
> which lack abstractions in the ACPI specification, there is now a need to
> run SCMI natively for those use cases. ACPI for System Control and Management
> Interface document[1] provides a mechanism which allows ACPI-based systems to
> discover whether a platform supports SCMI and to natively use SCMI for
> selected/limited subset of SCMI protocols.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/9] firmware: arm_scmi: Set generated device fwnode with platform helpers
      https://git.kernel.org/sudeep.holla/c/146af926951d
[2/9] firmware: arm_scmi: Extend transport driver macro to support ACPI
      https://git.kernel.org/sudeep.holla/c/8bac2642a97a
[3/9] firmware: arm_scmi: Convert OF-only paths to generic fwnode in SCMI core
      https://git.kernel.org/sudeep.holla/c/16276ab69678
[4/9] firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent
      https://git.kernel.org/sudeep.holla/c/17b3cdaa7ab4
[5/9] firmware: arm_scmi: Pass protocol ID to transport chan_available()
      https://git.kernel.org/sudeep.holla/c/f35ee1a26795
[6/9] firmware: arm_scmi: Refactor protocol device creation logic
      https://git.kernel.org/sudeep.holla/c/48339595cbd3
[7/9] firmware: arm_scmi: Add ACPI PCC transport
      https://git.kernel.org/sudeep.holla/c/b42e73fa118f
[8/9] firmware: arm_scmi: Initialise known ACPI protocol devices and channels
      https://git.kernel.org/sudeep.holla/c/4f5f291a5704
[9/9] firmware: arm_scmi: Validate PCC shared memory signature
      https://git.kernel.org/sudeep.holla/c/60a89ec8d8f5
-- 
Regards,
Sudeep


