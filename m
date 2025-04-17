Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62E3C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDVEBVIzvfRFWAdQWbnUaREzPF1CmNi5UQ8YQ5mRS0Y=; b=X4dcCE+MbH/DRGNHGh4tIKLsHH
	L0iVtVxmyZ/xpbSHRuHctzi7fgv3MsFz9/8YQQ4hVNy40l/JLzmG6IgCnWzK2NbhRS77VsBXYfQpg
	POgjNX32XNZ4v4kSXP5oyBkk6L/MBcODjKbbsLrsILK1QQzSZW1ipQ9EKThchtHfC7d20NXieqY07
	Q+sY73EemDSavcAEGn00+ww6JuAPLvPiMQ8CNaxr0XW83ObURmEqxWOrY0y1itSOuuUNB7GCxSv5e
	3x1TEFWUSGRbkoYRCk1HjjIL3XpPmx4rqS/YmHAiwcW64pamc/IyUvD5FMB2oE0f4vk/4Xao8/0wo
	iEu/zJlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Qw2-0000000DSeo-1nW8;
	Thu, 17 Apr 2025 15:13:50 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QIT-0000000DKiG-2LiG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:32:58 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 88463485A8;
	Thu, 17 Apr 2025 16:32:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744900376;
	bh=Q+mwj/32JuAHr63URsZEX8BOgZe7uZgNegyO6iLCpxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1Zg4cd7MxwEdWaonBkKbZ8IizWLchUrGZSIFOk0sieuDy4nHgapkB672p67b0/oao
	 Vv/kl6eXUjaWmnlpAw/5jT9+YUY+a0CbtCGfX4bZWy+mr+mjGSWjxo2H66a+aWYQ2r
	 5DmtIWZnLMl9Z6PIeTiLgfZNSkpoKZXmnAQtFgVTPMzuNh5SoRYt+hmFNpE//ziG+V
	 +a/O3u5vUYWgh6WyYxJjjtXEC3uS8TXl3XBu9mM/wdQqrfD0cTMmlAkOcbr+UL7Ivj
	 u2KCydHWmfFAV0DXkiE8tFJ/FASNCTq7rFSMPWTlkOjker13cqoC7r+PlrZy4Pv2zE
	 E+KlFh2Tlx5JQ==
Date: Thu, 17 Apr 2025 16:32:53 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rolf Eike Beer <eb@emlix.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Bert Karwatzki <spasswolf@web.de>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Nick Kossifidis <mick@ics.forth.gr>,
	Sebastien Boeuf <seb@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCHv2 0/6] make vendor specific subdirectory inclusion
 conditional
Message-ID: <aAERFUJj_6NuxAv3@8bytes.org>
References: <12652899.O9o76ZdvQC@devpool47.emlix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12652899.O9o76ZdvQC@devpool47.emlix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_073257_739816_7124A0A0 
X-CRM114-Status: UNSURE (   6.99  )
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

On Thu, Mar 20, 2025 at 10:01:45AM +0100, Rolf Eike Beer wrote:
> Changes in v2:
> - clean up subdirectory Makefiles to use obj-y now
> - add arm/arm-smmu-v3 and iommufd patches

This conflicts with the core branch, can you please rebase once I pushed
the updated tree?

Thanks,

	Joerg

