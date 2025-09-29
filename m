Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764A0CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 18:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyvWU/6k00+EZklkcFWWGVBjA8nmkgWQzE24+MqgiAU=; b=2zxGsGee7Sd2WFqC5jUoVOYgIN
	ewzWHg7oRtx17kK29H+jO6EXogde4+naQpBqQu7DsodsSWyRP5lJCV//VVO1zNLp/hV4ux8BzSG9u
	2/TcDNceLSWQJzJv4KMJPbYTcoORocCIonXeCVmWVurQNqIb+oOCqyZw60Vvu6cX+dLzso28JIdVp
	W5H+9bmJ0q8cNJfrjLCixJe1j4/kXPKfA9fVzD1dS5VYX+qIMwfIQysBONOe1ab3JBa1ctHBXldPr
	LfavEVbWO/jOKILqST1cG7NETlFPLh0zKyeVQUeXQiIFb825JAKAfWZjzz9cqyBDzmAA7IxyDhlO8
	qD5zPKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3IM4-00000003DdO-10a0;
	Mon, 29 Sep 2025 18:12:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3IM3-00000003Dd1-146O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 18:12:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD9B26269E;
	Mon, 29 Sep 2025 18:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B91AC4CEF4;
	Mon, 29 Sep 2025 18:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759169526;
	bh=E7HxvpD4V+N42NMQeOiwvjvpti75ReuRn7JHmnzFtTA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gCq1ym8kyN82Q0bVIvzNZUHFJ1XIM7xc6eq0G54qgg36pZUEoAFqfSqu9UFUnT+vC
	 4C699rWCPpkWQqtEdT4G2STeA+0sVXW2N6DfYdpjq69C7VpUtbtqP7oWxHb0+LJRWZ
	 fE9TFxL3gnSByrDC49DJn6NAnfq7k3R5OePwFKHaBJ6ZO9oYzk9gkKorfJnJq55kbY
	 p8IMms2tdUL6aBoM/bYl8GYGRnz7TD7UrdPeD6jeUDWc5TD9IlIaqD9B3kFQlh7XnG
	 3uqvNlI1xainyyf1HomM3arS/L4jfAmNBfF1n+/dtjO90ku47W2asIfIXH3aLB/7Sy
	 trxL3SmH/AORQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: bhelgaas@google.com, michal.simek@amd.com, thippeswamy.havalige@amd.com, 
 kwilczynski@kernel.org, lpieralisi@kernel.org, robh@kernel.org, 
 Jani Nurminen <jani.nurminen@windriver.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <e83a2af2-af0b-4670-bcf5-ad408571c2b0@windriver.com>
References: <e83a2af2-af0b-4670-bcf5-ad408571c2b0@windriver.com>
Subject: Re: [PATCH] PCI: xilinx-nwl: Fix ECAM programming
Message-Id: <175916952065.22239.10260112301115518368.b4-ty@kernel.org>
Date: Mon, 29 Sep 2025 23:42:00 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Fri, 12 Sep 2025 11:09:48 +0200, Jani Nurminen wrote:
> When PCIe has been set up by the bootloader, the ecam_size field in the
> E_ECAM_CONTROL register already contains a value.
> 
> The value used to be 0xc (for 16 busses; 16 MB), but was bumped to 0x10
> (for 256 busses; 256 MB) by the commit 2fccd11518f1 ("PCI: xilinx-nwl:
> Modify ECAM size to enable support for 256 buses").
> 
> [...]

Applied, thanks!

[1/1] PCI: xilinx-nwl: Fix ECAM programming
      commit: 9f0fd0b2f7a4aa1925ddfa4aed537a195879e0fa

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


