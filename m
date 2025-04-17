Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BE2C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcWbypf707Zl7QWJCsSlB38aot0OMwqYsFSqZEvgXDA=; b=rgakc0pytJDyycPWy5gmsUW4N9
	9hcxdmiD8zH/YAxjCL/c8fJ/JJST4TxSouLx7jbZIwEls7b7eeCDpSkqX/WyexRgaiDbnP+Ktzf+T
	aimLSnIKLNxQ8r0IcedXyjfctnclJnCaAQ03DUvBfr4dUDTBaH3pPkGMqJTc/pKoDYF4Zo3JDdXq7
	AGT0YDgHoc6lMgnFsVsy2lUlb+4ByeM+ZzEokaNN9PiJiaYxA+8vBzyki3YY1X/iVsnVUiIg+0dSc
	JpIwAiQmEgYAxYyOmAfrOUTUoHxW4+C9wfepyEeArjG/JEgnqt66Nf2PDb++Nt/QsY86F4mTTizp/
	6IiA3IUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RcE-0000000Dao4-0YpB;
	Thu, 17 Apr 2025 15:57:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5R0w-0000000DTbl-1lSF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 15:18:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7804D5C550A;
	Thu, 17 Apr 2025 15:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200C6C4CEE4;
	Thu, 17 Apr 2025 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744903133;
	bh=WPJ5t440FCFjkOmrLoMu0Nkxq9gxCd0wbnYIq6mNJoM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=V0QzjTbV3MUOoU0Oah4Q6GMSDmxFNd+j3umaAKyLwI6bjhNzS5HdatIqDHiGWSZ/P
	 hmH+WQrh53czQTMk6sUZB7scHvYZjLS4RGwCX46nBL/1jfbUpl6quhmLgDpN+O8cH/
	 APT1sCmgt+Slry7mHKUGKmFNQ4J7ByvIGso5hZpXaOjI1pRLr928z3nUvCRWDRT1bY
	 83W8saxB2+yQDF/blWYPD/QWavBM/qfU3Qb0UCkUx3MNXdtRXLijQZ1CrfZoBhRZef
	 M5UtHgic6C3P5TNoFR5OLCkVemuYV7ezMNcKRdXlB6yqpZJTlepl33Go69rg2xCI+H
	 i5ydfTYxmM/YA==
From: Vinod Koul <vkoul@kernel.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org
In-Reply-To: <20250410065804.3676582-1-sakari.ailus@linux.intel.com>
References: <20250410065804.3676582-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] dmaengine: at_xdmac: Use pm_runtime_put_noidle()
 with many usage_counts
Message-Id: <174490313175.238725.14166684249182201848.b4-ty@kernel.org>
Date: Thu, 17 Apr 2025 20:48:51 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_081854_506074_C6515D5F 
X-CRM114-Status: UNSURE (   5.83  )
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


On Thu, 10 Apr 2025 09:58:04 +0300, Sakari Ailus wrote:
> We're holding more than one Runtime PM usage_counts in
> at_xdmac_device_terminate_all(). This makes pm_runtime_mark_last_busy()
> redundant and pm_runtime_put_autosuspend() misleading. Drop
> pm_runtime_mark_last_busy() and use pm_runtime_put_noidle() to decrement
> the usage_count, except in the case it may be the last.
> 
> 
> [...]

Applied, thanks!

[1/1] dmaengine: at_xdmac: Use pm_runtime_put_noidle() with many usage_counts
      commit: 99b201481f3fe44eac5cc05238a715b05bca4df5

Best regards,
-- 
~Vinod



