Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAB5CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 10:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXaKzPuY7hDEIHBnLF+JF/acdhEojaX6RXVp8mU6D7U=; b=iLDAjLKhffkoJ4KH4qXMazqacq
	L0gKwKFo4ilZLd/ZEgRPVHD8ItwbnPKf8TCIbsYAB6S4HwV3I+uo0fJutXDM2Nm3GB6QER2Z1oGWi
	qRzGhZF9+Tje6GkQklf4+HENQm8I+cbb6af4HEjqO01mMTLXKXA3zGXjgL4ZcVbfHQSeClYE+QeHI
	2MFo+yf0vXWMRnuBMHknhG+9jRk9qIQphDtwv9eIndu/D2dDJGlwD5u/RWq2kOny3QAHWgAw2Wn0B
	xgD0Dk4y4VVG5O3x7TPO5LfoB00UEr/GAyzfU2ARfo7HbGw5D5kcuRrc88+1HvZTvXAgl5yQLBebc
	XIf+OuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zrM-0000000D0sQ-23qU;
	Tue, 23 Sep 2025 10:02:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zrK-0000000D0rM-1uOb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 10:02:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7B72497;
	Tue, 23 Sep 2025 03:02:44 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96CEC3F694;
	Tue, 23 Sep 2025 03:02:50 -0700 (PDT)
Date: Tue, 23 Sep 2025 11:02:47 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, mario.limonciello@amd.com,
	Sudeep Holla <sudeep.holla@arm.com>, beata.michalska@arm.com,
	sumitg@nvidia.com, ptsm@linux.microsoft.com,
	yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/1] arch_topology: move parse_acpi_topology() to
 common code
Message-ID: <20250923-marvellous-tuscan-lemming-f13fca@sudeepholla>
References: <20250923015409.15983-1-cuiyunhui@bytedance.com>
 <20250923015409.15983-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923015409.15983-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_030254_557221_2BE61D41 
X-CRM114-Status: UNSURE (   7.59  )
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

On Tue, Sep 23, 2025 at 09:54:09AM +0800, Yunhui Cui wrote:
> Currently, RISC-V lacks arch-specific registers for CPU topology
> properties and must get them from ACPI. Thus, parse_acpi_topology()
> is moved from arm64/ to drivers/ for RISC-V reuse.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

