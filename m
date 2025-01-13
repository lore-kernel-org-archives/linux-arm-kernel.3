Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED922E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 10:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUjut5G7ewo0W3DwgvTi4atJ8dPOpW5TupiydsaLSXg=; b=a6Qli/wrYWgpPIkMPmEDfkRFjy
	YFnwplBvGbwAAAyRyTsyii0BlFBSeYGkY1wLMnGW3LiGErnwcEFk0pGb1SjbQoFH50zJVojFqrJoI
	zf9sCg9t5JumwChhIdxmYOPZ4OlwAfajvEooMbSZHi6zKxyfEF3dI/K4KU35IJF5DsWsH2LhmcpML
	CpE0Q9Di/Mk7j8WuLbr59+Po7kct2AJaZqA/btLhtC558gBeTFguNWOzGxN+MhhFuj7RDUCTUt2UL
	O0xBIgQ3rdlTEY2of7MS4WDIP8pbgHcOaWc9WaSeMrM0uOV5gAocAJlVJrRZbeNobmqNgXqpxo96k
	lupT6kpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHkR-00000004nX2-2AkI;
	Mon, 13 Jan 2025 10:32:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHjD-00000004nNL-2sJ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 10:31:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CB371424;
	Mon, 13 Jan 2025 02:31:53 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5B243F66E;
	Mon, 13 Jan 2025 02:31:23 -0800 (PST)
Date: Mon, 13 Jan 2025 10:31:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: <cristian.marussi@arm.com>, <ulf.hansson@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <ranjani.vaidyanathan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize state as off
Message-ID: <Z4TreQ5bA9qiMTgC@bogus>
References: <20250110061346.2440772-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110061346.2440772-1-peng.fan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_023127_763978_E475D58D 
X-CRM114-Status: GOOD (  10.85  )
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

On Fri, Jan 10, 2025 at 02:13:46PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Per ARM SCMI Spec DEN0056E, page 16, "The platform may disable a resource
> if no agent has requested to use that resource."
>

True, but ...

> Linux Kernel should not rely on a state that it has not requested, so
> make state as off during initialization.
>

IIUC, this was done to avoid any transitions if the bootloader like U-Boot
has turned on the resource and OS can just rely on that stay. Anyways if
the resource is not used by any driver/device in the kernel, won't it be
turned off anyways ? What am I missing ?

I need to dig details, but I remember doing what this patch does and
reverting to what we have based on the feedback IIRC.

--
Regards,
Sudeep

