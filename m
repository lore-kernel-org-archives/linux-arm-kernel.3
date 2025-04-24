Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E6AC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdkOb1u6SKbn2gaJXEDTdzG7KsYlIXTHUx1hrfh1asA=; b=nI/3PPoKIjO9YBnKeopKKatG13
	aKREvDfe41O/LJr8TA7fOufy0DLuV9r2UHdQKPI544/dsSyzjG97w1nDIvTo5diPU18mBXBbmpnss
	V3ogrEWb+VclyDT9lAMnEvw4ZDhesJDDnyQHBmtXiRGRP58okvVxfsPoGVOO9/UdCRbIZgZCKRBL6
	xXhJtIwsLy8O04YKzA7G0RC+UtaW4jt71B2t3MrqVqlrNXDf5dGGYwCaVIJIolXGU0Vp/qI2PmXa0
	gow7A2TaEC0Lr/LR+McuWdp2OjW1wmZNXwWqxMUpEA+oV5Huc6xtyjpHn0i4h2r2/BDHwZBMTI9Qx
	m0w5H3nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uhP-0000000DqXx-3tQY;
	Thu, 24 Apr 2025 11:24:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tel-0000000DeEU-3bG7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:18:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D0531063;
	Thu, 24 Apr 2025 03:18:04 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED32D3F66E;
	Thu, 24 Apr 2025 03:18:07 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:18:03 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: broonie@kernel.org, daniel.kiss@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tamas.petz@arm.com, yury.khrustalev@arm.com
Subject: Re: [PATCH] arm64/fpsimd: signal: Clear TPIDR2 when delivering
 signals
Message-ID: <aAoP288ud5HDsu9O@J2N7QTR9R3>
References: <20250417190113.3778111-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417190113.3778111-1-mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_031811_941956_74AB7BBC 
X-CRM114-Status: UNSURE (   9.24  )
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

On Thu, Apr 17, 2025 at 08:01:13PM +0100, Mark Rutland wrote:
> Hi Catalin, Will,
> 
> This patch fixes a pretty nasty ABI issue with SME. As noted below, Arm
> folk are working on updates to the relevant ABI specifications and
> libraries.

> Folk on CC are working on fixes for the remaining userspace issues,
> including updates/fixes to the AAPCS64 specification and glibc.

For reference, Richard Sandiford has posted the proposed AAPCS64
updates:

https://github.com/ARM-software/abi-aa/pull/325

Mark.

