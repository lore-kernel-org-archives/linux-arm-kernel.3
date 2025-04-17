Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3735DC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsHRz0SpsIyJdPd7Zq94sbZSII8ACmkTkOYzqLGbAG8=; b=2cdsCRolzMlHL3rfDSYhflrl97
	Tw3VMTWX+hc9QCBHTZBbtapoSopCcYuJlQJaOId5HItR3RV5TwbtoNXddBBs/BSgzNRibcbs6mwUy
	CS9fIShWyFrFuwTPeiHIuCpoVdVH2Hn2eC+fDBh5xC1/q46YpkocEBGv9s+MeX6YJZw9YwQbIOJ0g
	iJ5HPAeghbXhbzigC3XKuTuBX/oahQzhrbG0dU3qfP1dlxxaIedfpMiQdrkVESdMXuo2yW8jWb+ED
	win8mCpE5Bcx7qyq6f6z2V9Hh4fVJNEvB95jPm122Vw5/GI8Y0A0MGntXNtEDnhRqeq8S58I1RneU
	KRbtEuVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Re3-0000000Db6F-3QFz;
	Thu, 17 Apr 2025 15:59:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5R10-0000000DTd5-2IQL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 15:18:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC3AB4A4FD;
	Thu, 17 Apr 2025 15:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5402C4CEE4;
	Thu, 17 Apr 2025 15:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744903138;
	bh=EHyKrvw9U4B5SWdJLt0Is0EeLwfWjVJZGYvKDtb/oog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CsmvlMPfL4lc9L3iDqVYx7P/NnvyOFnkgghBJ26XFmrCBvnEaUt6KYDUW0YY5DU1E
	 6Fmo9NA5mu3d8J9QOyprKAxBGL9oGYzjr1ZBoJ+tggH7CmY1vxXpnektQWhEih9tBa
	 evNd88HsMdYQACQerJQcfjf9EsH9hM5VzG6m/VJk3uPfobOfxPixOs7J5Km8vQK/FJ
	 qMLQnT6vzJOs/rKVPq6WVVLg+1hChdY7tgolgpfvmnr4aeGvYQ7RTKuS5wNbewjpMz
	 AfAhWVQ/C/JDzAkrFJA58L+MmdKFLgvMJU3IbYiOsfy48y0dOr8jLypyNi0Iz4mtvN
	 SVoSlyGS4Yo8Q==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, 
 Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>
Cc: Michal Simek <michal.simek@amd.com>, Marek Vasut <marex@denx.de>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250314134717.703287-1-thomas.gessler@brueckmann-gmbh.de>
References: <20250314134717.703287-1-thomas.gessler@brueckmann-gmbh.de>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Set max segment size
Message-Id: <174490313549.238725.11612673810296671348.b4-ty@kernel.org>
Date: Thu, 17 Apr 2025 20:48:55 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_081858_607572_0681E7DD 
X-CRM114-Status: UNSURE (   5.17  )
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


On Fri, 14 Mar 2025 14:47:15 +0100, Thomas Gessler wrote:
> Set the maximumg DMA segment size from the actual core configuration
> value. Without this setting, the default value of 64 KiB is reported,
> and larger sizes cannot be used for IIO DMAEngine buffers.
> 
> 

Applied, thanks!

[1/1] dmaengine: xilinx_dma: Set max segment size
      commit: ebf744fdc080763a243ea6b1a719b1857474a977

Best regards,
-- 
~Vinod



