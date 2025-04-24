Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEEEC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfEwDuiOAr3oJL0dKpdxV6jviCLEENbulDwj3RUNusk=; b=TlpCrEHAlTqInrKL9/CvcdcRsY
	NPWb8Di2aBxEmINChGZDtg0oQxvMVzBsj6nVJYRncbvy/OvSOab+cDczGsmWVwNtXUT/wSlcCmCot
	WEc+qtTlef45aD4a8BXpr5i2gVeDg8t9Y2rrQYw1Qi9upqSVrKAfV0O+Svptmx4jAx92HEvCiw7ge
	xWESs08grnXQRuEuWdbIPXomztK7Z1FiDNp94R/h3t/2Ez/ua54UJlx/uc3qMyC7YmCOPkglZlV3w
	+TSRSWsUyxRci5gQ0qoaMnF6ayNGQPEVA3NzmiuKb+xynwMo544rbvIPafCjsAw5rUDwAfrp9DnRb
	Z7mCVd3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7u4y-0000000DjVF-1kJx;
	Thu, 24 Apr 2025 10:45:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t8C-0000000DYV2-0xMr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:44:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 789FD1063;
	Thu, 24 Apr 2025 02:44:26 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 820FE3F66E;
	Thu, 24 Apr 2025 02:44:30 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH v2 0/5] firmware: arm_scmi: Minor cleanups in the scmi bus layer
Date: Thu, 24 Apr 2025 10:44:25 +0100
Message-Id: <174548781195.775370.18358240370266528264.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
References: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_024432_314955_B21023C5 
X-CRM114-Status: UNSURE (   8.22  )
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

On Mon, 17 Mar 2025 10:31:20 +0000, Sudeep Holla wrote:
> These cleanup centralizes error logging for SCMI device creation into a
> single helper function, _scmi_device_create(), consolidates the device
> matching logic into a single function, and ensures that devices must
> have a name for registration, removing support for unnamed devices while
> matching the devices and drivers for probing. It ensures the transport
> devices are excluded from the bus matching and the correct assignment
> of parent device for the arm-scmi platform device created in the
> transport drivers.
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/5] firmware: arm_scmi: Ensure scmi_devices are always matched by name as well
      https://git.kernel.org/sudeep.holla/c/db28d02c4017
[2/5] firmware: arm_scmi: Refactor device matching logic to eliminate duplication
      https://git.kernel.org/sudeep.holla/c/3da2859ee5c9
[3/5] firmware: arm_scmi: Refactor error logging from SCMI device creation to single helper
      https://git.kernel.org/sudeep.holla/c/c69a31c1ad74
[4/5] firmware: arm_scmi: Assign correct parent to arm-scmi platform device
      https://git.kernel.org/sudeep.holla/c/953f4ce0a8d3
[5/5] firmware: arm_scmi: Exclude transport devices from bus matching
      https://git.kernel.org/sudeep.holla/c/9593804c44c2
--
Regards,
Sudeep


