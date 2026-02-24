Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8C3EFB7F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 08:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUrX13PQ6bQW6WoHt4Jnc2qdmn6Z6cdBK26JSTbUSDc=; b=A3KsDChLKQ/r1E74shm5D53YT9
	WMTX9K3Opc6Xotq+7LxbtM9ruFNJpuP61BIJGPwsl+3GT2O1iHi0Y8YG9mvtVkwmVinjoIzr2cN4m
	Wf9X9lxn7E62lGy7rIL32WevFwZRngYeeM4MBcCyEyJSQpcq9gyqpyKzqwTm9blM2626sBNbPuNxF
	9DCCWMUNzKxP/Yj3Sijfr4l6jp17PgwXylETeS8xT6f6GJOiVC8m2CnDHl4cyW94TtpWlNJFqbx/+
	lmKIpXqpUMfjC0AUwdO6+a2tWbdHGU52tNxN7EivZBiY4GnLVKHTqHjnNfsvI+YmPpr2nTwchi7Dg
	qPbo2GNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunVQ-00000001cZl-1kpC;
	Tue, 24 Feb 2026 08:10:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vunVN-00000001cZ1-0joo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 08:10:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3983339;
	Tue, 24 Feb 2026 00:10:42 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1046D3F62B;
	Tue, 24 Feb 2026 00:10:47 -0800 (PST)
Date: Tue, 24 Feb 2026 08:10:45 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Zeng Heng <zengheng4@huawei.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/2] arm64: io: Rename ioremap_prot() to __ioremap_prot()
Message-ID: <aZ1dBTpUdJm_-gES@arm.com>
References: <20260223221012.31962-1-will@kernel.org>
 <20260223221012.31962-2-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223221012.31962-2-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_001053_274116_FD6B17BF 
X-CRM114-Status: UNSURE (   8.13  )
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

On Mon, Feb 23, 2026 at 10:10:10PM +0000, Will Deacon wrote:
> Rename our ioremap_prot() implementation to __ioremap_prot() and convert
> all arch-internal callers over to the new function.
> 
> ioremap_prot() remains as a #define to __ioremap_prot() for
> generic_access_phys() and will be subsequently extended to handle user
> permissions in 'prot'.
> 
> Cc: Zeng Heng <zengheng4@huawei.com>
> Cc: Jinjiang Tu <tujinjiang@huawei.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

