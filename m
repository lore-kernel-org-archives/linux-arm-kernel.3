Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB9AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzNaGB8Hfxj5ga0lrrF2gw5290N0YJXY5MbNqRAaxYc=; b=vlfLNkpvdsDXffOoLTP/MFsV3n
	5KZ4oHsBpXAJ+ZF4/PUhsv44soJMJlINWc77vOV7Kenk/i2YoobtkMNGY9kb1ZFeDTeTF4P+N7wUG
	f04+TBDeIKemsNM6QIiN7PU5PUSBjj+D2k0bnTA7//40qRTNw76BgE/AW2KOxVvDZ1+2Y4WDFqefm
	CG8DkOnxVjNXUpt6GAML+CmFXTlLn/jAFJvUflz3HGgu8Dd5e5Ez71+VPsFYQ84ukn/r40P8toidI
	5BJliV0JkgVe2TWGAs5v4FBDF26ayziG39Dr0NSr1nNDrPbyZpcxF8hdSI7v9nf4EO7afUh09sZ19
	C92NiS7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAnH-00000005uRQ-0ZQ6;
	Tue, 08 Jul 2025 16:03:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAAH-00000005mqT-0zRy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 15:23:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0727B153B;
	Tue,  8 Jul 2025 08:23:12 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C45B3F738;
	Tue,  8 Jul 2025 08:23:22 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Philip Radford <philip.radford@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	cristian.marussi@arm.com,
	luke.parkin@arm.com
Subject: Re: [PATCH v2 0/3] firmware: arm_scmi: Add xfer inflight debug and trace
Date: Tue,  8 Jul 2025 16:23:16 +0100
Message-Id: <175198812770.785521.16973338281288215979.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630105544.531723-1-philip.radford@arm.com>
References: <20250630105544.531723-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_082325_324445_8113AADA 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

On Mon, 30 Jun 2025 10:55:40 +0000, Philip Radford wrote:
> This series adds a new counter to the Arm SCMI firmware driver to track
> the number of in-flight message transfers during debug and trace. This
> will be useful for examining behaviour under a large load with regards
> to concurrent messages being sent and received. As the counter only gives
> a live value, printing the value in trace allows logging of the in-flight
> xfers.
> 
> [...]

Applied to sudeep.holla/linux (for-linux-next), thanks!
(with some commit message changes)

[1/3] firmware: arm_scmi: Add debug decrement counter
      https://git.kernel.org/sudeep.holla/c/555e9174ef06
[2/3] firmware: arm_scmi: Add xfer_inflight counter
      https://git.kernel.org/sudeep.holla/c/a9cd861e61ae
[3/3] include: trace: Add inflight_xfer counter tracepoint
      https://git.kernel.org/sudeep.holla/c/f8e656382b4a
--
Regards,
Sudeep


