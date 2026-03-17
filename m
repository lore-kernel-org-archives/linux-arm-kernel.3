Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D56FD8741
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ab/stIJUaq9Ro4pVe+PaqBWMX4RQ8nB/K7zdbBiBO34=; b=p4luAi6X5LCEPrZGg2QxcAyVTJ
	wZRZh7wZZ9HWeL+mJ7DiR5zITZJ6Cqx7yWz3DSUWBj7GyoR/J3B16TksyYZwbm9I5IJI8l9Xu4WF9
	9K1pSQaW7yHxvkD9BjUKpJVzxSbfcBsJuFf+qdx9aA0JVtY9yaUQPxoJdZAA3uK62LNpjBY3pPKHr
	lAHlnefIykPCUiGH2Ly3bzDOHT8djL2rpuKHZh8oTcY9LhBjGBffN7X1ssAsoDUvL9lpJbQJFo2Kz
	Lwp1vczfzm2sk1cHuxKu+MxKEnU5r8Kyn0O5KBu2467G/wgCa69HS6RA766JDdZgp1xvH1MWesWxF
	EX9RazHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sah-000000068EP-2rgk;
	Tue, 17 Mar 2026 11:28:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sab-000000068CW-0UTq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF64843903;
	Tue, 17 Mar 2026 11:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18A5C19425;
	Tue, 17 Mar 2026 11:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773746876;
	bh=mpYHC4wU3qrnV+HjBcRQYWYiODu50oiRnnFlM8r8a+w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s6zhV+nW5bvq9foYc1GnDgnUk5Yvu//WGAWengYH/ZKXf9SlP9cY4RYBN1F7CAIwx
	 ioDfSnQQc3aH5a8P2P0zovfm2Ywy+ijK5jqYV69KikH5yIXFhAV59Qe4w3neAE+P4g
	 s1kFrgs0AP1aK4yxxSFmKwONyfk8PEQPpOfuuaAKCSz81VjETMCU9Ze3X/xw16npG/
	 GskneFVwyblNE7LCt7ql00iJV07WyfQRQdTDyln5ipvkMTNdJxf/0bUT0ZjC/NUs4R
	 TIlei5algTssuND3bVuWYRT5ncDhbAkcyKf/AU2wOoHEu0ve70ats+9koAs4ex7x8y
	 OYO47Crh/XCxg==
From: Vinod Koul <vkoul@kernel.org>
To: Michal Simek <michal.simek@amd.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Vishal Sagar <vishal.sagar@amd.com>, 
 Suraj Gupta <Suraj.Gupta2@amd.com>
In-Reply-To: <20260311-xilinx-dma-fix-v2-1-a725abb66e3c@ideasonboard.com>
References: <20260311-xilinx-dma-fix-v2-1-a725abb66e3c@ideasonboard.com>
Subject: Re: [PATCH v2] dmaengine: xilinx_dma: Fix reset related timeout
 with two-channel AXIDMA
Message-Id: <177374687441.337094.12896533285530975701.b4-ty@kernel.org>
Date: Tue, 17 Mar 2026 16:57:54 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_042758_320402_F8332918 
X-CRM114-Status: UNSURE (   7.95  )
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


On Wed, 11 Mar 2026 07:34:46 +0200, Tomi Valkeinen wrote:
> A single AXIDMA controller can have one or two channels. When it has two
> channels, the reset for both are tied together: resetting one channel
> resets the other as well. This creates a problem where resetting one
> channel will reset the registers for both channels, including clearing
> interrupt enable bits for the other channel, which can then lead  to
> timeouts as the driver is waiting for an interrupt which never comes.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: xilinx_dma: Fix reset related timeout with two-channel AXIDMA
      commit: a17ce4bc6f4f9acf77ba416c36791a15602e53aa

Best regards,
-- 
~Vinod



