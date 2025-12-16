Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5D0D609D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 16:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ctvUzM5y87AIAxwUgyX8CdNFojl6FqoWYM3Q00H/OY=; b=CZGHradtyv4z8JSpMS0VzFum7T
	ZhYdfA9pmHVmNbg3nvLWdkpKSRJGX+uYFgH9KDeuxM7Gdto3ze3+eNtXUBKes3AZRXvUTU6bnki2N
	thOwgjw1NxPl6g++XKo7UWbVrA73zezF5+qa9xs48SGZDHkC/VULjdayLNEUzxjSI+hHdmnAlFbn/
	gRZld96w8CPsAwn3LR6i7wnIQj5G9LjrIqtFzBBb1LVO9Ld4lh6+tOlhEC4OvFtSt9XhuCQYfDIxV
	1Zg56NAZ4ibXd3Vvz678XS6QCrmD07UV65sJ/c5FMJFRpyONmdtPKGRaZQdqrNaU2vhoqLr60TW9k
	RW+ed6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYLh-00000005ZFQ-0NWs;
	Tue, 16 Dec 2025 16:56:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYLc-00000005ZEJ-36Dd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 16:56:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C8B9444E0;
	Tue, 16 Dec 2025 16:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EC3C4CEF1;
	Tue, 16 Dec 2025 16:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765904188;
	bh=4C+PIkTMFYRa2XqQ2KK0/ciIESaCrmvl0r0Ji4+puoE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h/+gXz3xsDpqQv5g+n31H6zOzx+Wyz3VdnU+pbrWnZ3fWgJm/x3HYRry2p9GIBcJZ
	 VojuUSWl9LW9xJXwuK+4oHLBT5iTxYUmKDfXk5pwVpo5cgz3PJ6sYwfPZGxKmseuSf
	 wezUceTeUxMPuM+xZ+t2A3PmOom0Eane64SI7OQ2wGu/55EOkaECv/Hk55TXwGyZWL
	 2Od5yb6qgS44g8kszwd6k4ucPEpXqBoF/UTOwvmF/zpzjydAGCIEJXnxmA+LCH9LOa
	 sDQzke3P/yBRvTZfnNPzV9/+xeptmD1PC4rQ6cAwrzMNL+tg/gYPY7T7tc/Snt1v2C
	 yy9zADTiB1BNQ==
From: Vinod Koul <vkoul@kernel.org>
To: radhey.shyam.pandey@amd.com, michal.simek@amd.com, 
 Suraj Gupta <suraj.gupta2@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251021183006.3434495-1-suraj.gupta2@amd.com>
References: <20251021183006.3434495-1-suraj.gupta2@amd.com>
Subject: Re: [PATCH RESEND] dmaengine: xilinx_dma: Fix uninitialized
 addr_width when "xlnx,addrwidth" property is missing
Message-Id: <176590418615.422798.3456929870875820677.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 22:26:26 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_085631_830569_4BBE8D2F 
X-CRM114-Status: UNSURE (   5.71  )
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


On Wed, 22 Oct 2025 00:00:06 +0530, Suraj Gupta wrote:
> When device tree lacks optional "xlnx,addrwidth" property, the addr_width
> variable remained uninitialized with garbage values, causing incorrect
> DMA mask configuration and subsequent probe failure. The fix ensures a
> fallback to the default 32-bit address width when this property is missing.
> 
> 

Applied, thanks!

[1/1] dmaengine: xilinx_dma: Fix uninitialized addr_width when "xlnx,addrwidth" property is missing
      commit: c0732fe78728718c853ef8e7af5bbb05262acbd1

Best regards,
-- 
~Vinod



