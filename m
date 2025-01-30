Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522F0C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 11:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqdmj7uhEzqf7ljYhJFX5I6dkb0WCFRAkCt7KoDiP6A=; b=TNszXloc1/Di2aadg4AfYtm7dm
	P9XI0WIzGOYL0WXEBX6jQlY+RCNFTcXrfluRp/OzJlI3EBCjjgUtPUgjnaho3N0v7FEiiXzFRpFkW
	PgU34jfeKWVAGsPEmHSvLgINHEkSRi4vfIHOiVxLqwf9R3oCk/CHy9NcBqrm2wgQ1yXx3Wozd7fiF
	RBcU89SZ7OLTuyLxVWTYE0cxxdq87eg88BkaMJH2bTwBK8nglDlGEDPpm6HZLqfZptmRX1nQmYLZ2
	WDrqKwzdyKLtGH1kESqSSDEdNy3+0IeSLYTE6luNx91F2zK1S1WefFjJFdyCnBAfQEqiIfP6gRjCu
	5zb0thow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdSso-00000008iZ6-3J4h;
	Thu, 30 Jan 2025 11:38:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdSrU-00000008iQn-2BIl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 11:37:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0090A41DE7;
	Thu, 30 Jan 2025 11:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3641C4CED2;
	Thu, 30 Jan 2025 11:37:29 +0000 (UTC)
Date: Thu, 30 Jan 2025 11:37:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, krzk@kernel.org, vigneshr@ti.com,
	p-mantena@ti.com, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] arm64: defconfig: Enable SPI NAND flashes
Message-ID: <Z5tkd4e-4n80gs5F@arm.com>
References: <20250116035145.370734-1-s-k6@ti.com>
 <c00ae17b-b006-4b28-86e8-e82d1067e7d3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c00ae17b-b006-4b28-86e8-e82d1067e7d3@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_033732_620491_D679B595 
X-CRM114-Status: GOOD (  10.33  )
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

On Thu, Jan 30, 2025 at 11:53:58AM +0530, Santhosh Kumar K wrote:
> On 16/01/25 09:21, Santhosh Kumar K wrote:
> > Add support for SPI NAND flashes on ARM64 boards/EVMs such as:
> > 
> > 1. W35N01JW on AM62x LP SK, AM62A7 SK, J721S2 EVM, J784S4 EVM,
> >     J722S EVM, J742S2 EVM
> > 2. W25N01JW on AM62Lx EVM
> > 
> > by enabling the MTD_SPI_NAND config as a module.
> > 
> > Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> > ---
> 
> Gentle ping.

It's usually Arnd or specific SoC maintainers picking up defconfig
changes (the arm64 maintainers just go for the Kconfig directly ;)).

-- 
Catalin

