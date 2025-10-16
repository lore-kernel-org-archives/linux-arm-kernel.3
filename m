Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4FACCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3+afGU40xdr29MkFmOPxUqojfCJhAIMCVotoQbOKUU=; b=ZeGT6VRCJ7SAJ1hJDzro2i0Uio
	RsB6qIddhPrUUuGhub6xJx9pmpsiHfS+DmPJh80CBenj6mJTLV1YV09sbd5IYBj5IYy5Yi3gmgWLW
	FAxF86vTugTujCn02dYtXOv7p80R/mCXDeoPYnJ/ZdsFcGX94XpWuasnkqHA/aMTENJvzreUwkNqk
	LsOWtUO8fEL70VVSGufJs+cDddH3icdxG729gY624z4DGCFcIcBs41cIcczFzI8IUMorB9IjEli+E
	R5Nd3XGnX18pz5T7/y8l7BMmdlEOZyVcy5PuuR5pl33zc3wkKbJlB2VvUIyMo+N8c+uMwY9Bxamj/
	KBezK6wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9NWY-00000004nc3-0kzY;
	Thu, 16 Oct 2025 12:56:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9NWV-00000004nb9-3PSQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 12:56:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 052874A961;
	Thu, 16 Oct 2025 12:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59A8C4CEFE;
	Thu, 16 Oct 2025 12:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760619361;
	bh=zoapc+7QyCxB1b9d8Cgr+h25xaMbmomS/mn0JcTKFVw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EMO5bhvJgf3IggIxXuLwqvecRE2Lleg70q8JPZqqVFwGEoR4v8jw+WdQ+7Q+gLBJY
	 uclLqsqjIQvXi/2CVy3ZJMUVUNhZALlfY2R63rnOslH87gOZ6aoRiKCy57ZNAXXmW7
	 wajwWhTY/OAajNJtS4vcMhvB4hvNlVpeY5UgQxStPbkzUIWr2r1xFhIgE11AHwDXPG
	 mUz8J6fCZX89pExtv6W28IA7SobaOwB2pwOFD5LibE1QxGYKUxchK6T0v/Fce1rbDd
	 YmD0ogFuFN20qapyyAyaI31Av/98iWxuYys2YPiYnv9xST3yCaPUyQs31iVCjPF1ML
	 45wGpCTfACP2g==
From: Vinod Koul <vkoul@kernel.org>
To: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>, 
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Sonal Santan <sonal.santan@amd.com>, 
 Max Zhen <max.zhen@amd.com>, Anthony Brandon <anthony@amarulasolutions.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20251013-xdma-max-reg-v5-1-83efeedce19d@amarulasolutions.com>
References: <20251013-xdma-max-reg-v5-1-83efeedce19d@amarulasolutions.com>
Subject: Re: [PATCH v5] dmaengine: xilinx: xdma: Fix regmap max_register
Message-Id: <176061935845.510550.12282030175889296984.b4-ty@kernel.org>
Date: Thu, 16 Oct 2025 18:25:58 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_055603_899193_50C922B2 
X-CRM114-Status: UNSURE (   7.98  )
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


On Mon, 13 Oct 2025 17:48:49 +0200, Anthony Brandon wrote:
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
> [...]

Applied, thanks!

[1/1] dmaengine: xilinx: xdma: Fix regmap max_register
      commit: 81935b90b6fc9cd2dbef823a1fc0a92c00f0c6ea

Best regards,
-- 
~Vinod



