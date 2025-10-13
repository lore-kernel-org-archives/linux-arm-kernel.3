Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C809CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyXrVVygqMhn5Bif81+tF99rIVbrn5Q3omrjq9+Xlzs=; b=NXKA6FxyH8P+miVo3X5M96gXko
	5GxMT4CjGFYeYmvl3cV/u9/Ip2KzUqDTmwKh+y16maBhAXiicAkIZAa8WVvVpfb4rVK8ds0T+l04r
	fW5wBFAE2xMv/jxKipeeRJceyIbTfAWQ50odgRtD/qLh8wCcULOI7R8sSzZa55WQdnPAboM71QgRm
	zTMXL0tfuNt5pSrCi47s2T54GkmJRRkStiddUfdrl/CsosY3OGg/XB7JSZhkngep4n9T85GAx2bo8
	kCVhhbZdDjHLmooewBbwQ1sMtC2Dbw5GB5dwqlThubiwnjueYDk3WT0QBFjwtd8U7b7cjiydEhECD
	vfyya+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JNX-0000000DMzc-2uSa;
	Mon, 13 Oct 2025 14:18:23 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JNS-0000000DMyt-3fXO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 14:18:22 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=vyXrVVygqMhn5Bif81+tF99rIVbrn5Q3omrjq9+Xlzs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760365087;
 b=ERo+fY0tN26mCNmYlk2MMFIDzATvD5ENrRlOP60OnkYRPaGJx1lDKdaZSZwt6IDc+PmX16pv
 5dqS/N2g1l8ermFLrgdUVfQwwh/6NgYcFzMQTsPmNDQaVBsxNszLRqm9Rsf+HgnhGfrlvKK1oyZ
 fS0udZp4O0mH21UegpDzA+suP4KmmjOQlQuFrWR5cCDA42KPeHVVO11BgHigEwzRVcTlz6NbSwO
 ziUUpV6XK14sVGrJfKMOxBtu8X1h/HL6dLLns+aH6/6j3b0VNtxjtNbf7HA/ABwpyGyMG9mfix1
 raiVzGDCSqPeZuqLStWx4x7BW2fdf5L78LKptRUHZ7Rxw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760365087;
 b=HtEiMZdNbPbufsQCtmyf9IJedNmwNU/FPeJPz34M3adGJBBlTpmbn3owzC0cUdJNcGB8xR06
 6aob16QI5R4awlCIkBHI9m1Y36nW8146ksBckXxUbSfJCQOX6U3oO3/0Ho9/Rx/1uOWWAn6JfVK
 x+q98ONHSSpMqJ8T5VsY7l1EqrH4MdeaU2U4fqSQoN3ofCEw9TCOxVNOk7FWlfuRbkicaKk2IE5
 7dp6sOW9l7doZWDYtYW7ML1YSXDJM+zHxoIKj7feccpLjuMU/T1VIj0CT/cf1xGHbpOFy+X9DoT
 Nz7eXdjVTsO97kwAYXra1kpNzkFQy1SwLEfK2M9OM4mYw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Mon, 13 Oct 2025 16:18:06 +0200
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 43C43220CFE;
	Mon, 13 Oct 2025 16:17:57 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
 Vinod Koul <vkoul@kernel.org>, Michal Simek <michal.simek@amd.com>,
 anthony@amarulasolutions.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anthony Brandon <anthony@amarulasolutions.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: Re: [PATCH v4] dmaengine: xilinx: xdma: Fix regmap max_register
Date: Mon, 13 Oct 2025 16:17:56 +0200
Message-ID: <2389383.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250903-xdma-max-reg-v4-1-894721175025@amarulasolutions.com>
References: <20250903-xdma-max-reg-v4-1-894721175025@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4clfZY5vRpz2nH1K
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: ce6e0c546d8b9a92df42d712c97e6124
X-cloud-security: scantime:2.191
DKIM-Signature: a=rsa-sha256;
 bh=vyXrVVygqMhn5Bif81+tF99rIVbrn5Q3omrjq9+Xlzs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760365086; v=1;
 b=Bik8Dq4QV4fuQ0pbFBBbEWAeXink59b7SAP3fak4vpgCj7BF7IvgRClUV8vOjWE9WwS0XeCe
 jKHigVwFcXol9CcV7cqODS2RQ5kNKXGlUJHauBd1WH9wc4VdWqSlCa6r8CcerjbbJnnCg8+4A7U
 I9NTnjW4lVYcmKBMQUusBGbOhQxM8EmzleGyoMkMlVKCHtcdr36so0a2D9N8e/6u2V8iT/mUkXZ
 0sG2tG5x0o1tEkVD3BMmfETAmVKs5XVOW0xN1Cx8qfH6zln6A7/NKLpn8cYZI1AHQaW07AaEZmM
 RVEC79fBTelqeKdW6LhP//m+KP0qXRTUPyGQtqK/vUGtg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_071819_165074_BC4133CA 
X-CRM114-Status: GOOD (  22.21  )
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

Am Mittwoch, 3. September 2025, 10:56:13 CEST schrieb Anthony Brandon via B4 Relay:
> From: Anthony Brandon <anthony@amarulasolutions.com>
> 
> The max_register field is assigned the size of the register memory
> region instead of the offset of the last register.
> The result is that reading from the regmap via debugfs can cause
> a segmentation fault:
> 
> tail /sys/kernel/debug/regmap/xdma.1.auto/registers
> Unable to handle kernel paging request at virtual address ffff800082f70000
> Mem abort info:
>   ESR = 0x0000000096000007
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
>   FSC = 0x07: level 3 translation fault
> [...]
> Call trace:
>  regmap_mmio_read32le+0x10/0x30
>  _regmap_bus_reg_read+0x74/0xc0
>  _regmap_read+0x68/0x198
>  regmap_read+0x54/0x88
>  regmap_read_debugfs+0x140/0x380
>  regmap_map_read_file+0x30/0x48
>  full_proxy_read+0x68/0xc8
>  vfs_read+0xcc/0x310
>  ksys_read+0x7c/0x120
>  __arm64_sys_read+0x24/0x40
>  invoke_syscall.constprop.0+0x64/0x108
>  do_el0_svc+0xb0/0xd8
>  el0_svc+0x38/0x130
>  el0t_64_sync_handler+0x120/0x138
>  el0t_64_sync+0x194/0x198
> Code: aa1e03e9 d503201f f9400000 8b214000 (b9400000)
> ---[ end trace 0000000000000000 ]---
> note: tail[1217] exited with irqs disabled
> note: tail[1217] exited with preempt_count 1
> Segmentation fault
> 
> Fixes: 17ce252266c7 ("dmaengine: xilinx: xdma: Add xilinx xdma driver")
> Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Changes in v4:
> - Reorder Reviewed-by
> - Link to v3: https://lore.kernel.org/r/20250902-xdma-max-reg-v3-1-5fa37b8d2b15@amarulasolutions.com
> 
> Changes in v3:
> - Add Fixes tag
> - Link to v2: https://lore.kernel.org/r/20250901-xdma-max-reg-v2-1-fa3723a718cd@amarulasolutions.com
> 
> Changes in v2:
> - Define new constant XDMA_MAX_REG_OFFSET and use that.
> - Link to v1: https://lore.kernel.org/r/20250901-xdma-max-reg-v1-1-b6a04561edb1@amarulasolutions.com
> ---
>  drivers/dma/xilinx/xdma-regs.h | 1 +
>  drivers/dma/xilinx/xdma.c      | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/xilinx/xdma-regs.h b/drivers/dma/xilinx/xdma-regs.h
> index 6ad08878e93862b770febb71b8bc85e66813428e..70bca92621aa41b0367d1e236b3e276344a26320 100644
> --- a/drivers/dma/xilinx/xdma-regs.h
> +++ b/drivers/dma/xilinx/xdma-regs.h
> @@ -9,6 +9,7 @@
>  
>  /* The length of register space exposed to host */
>  #define XDMA_REG_SPACE_LEN	65536
> +#define XDMA_MAX_REG_OFFSET	(XDMA_REG_SPACE_LEN - 4)
>  
>  /*
>   * maximum number of DMA channels for each direction:
> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
> index 0d88b1a670e142dac90d09c515809faa2476a816..5ecf8223c112e468c79ce635398ba393a535b9e0 100644
> --- a/drivers/dma/xilinx/xdma.c
> +++ b/drivers/dma/xilinx/xdma.c
> @@ -38,7 +38,7 @@ static const struct regmap_config xdma_regmap_config = {
>  	.reg_bits = 32,
>  	.val_bits = 32,
>  	.reg_stride = 4,
> -	.max_register = XDMA_REG_SPACE_LEN,
> +	.max_register = XDMA_MAX_REG_OFFSET,
>  };
>  
>  /**
> 
> ---
> base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
> change-id: 20250901-xdma-max-reg-1649c6459358
> 
> Best regards,
> 





