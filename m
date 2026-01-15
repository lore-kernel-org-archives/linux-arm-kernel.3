Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A45D41170
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9QgFKu4POEbqThOG7MbWJaVLVaPAmiu24tvkBHAhEE=; b=jGuRoWfV3qzPqPx/QRP3Pic8TR
	DAgON9VRE5KMMkL1x3fG+BbjoymOXRgeRzEkfiIuJ1d0SsoY/N2nUEJgSYNkrqpto+yGYg2v/1Rfc
	zJPGkJBXYE6jhEk9cvWC+jyxFYaE1UCWygHXnbXCdMCl4t62kJ+z4ercELQv96Z5L95+LQG/mnLJg
	RfU/ULrYbAJZxYeAoPk+ilcaJASNawbDMzTbLCYHcqQZr5yN8K4bWZ1YSzvOdNYBs/p1rbrd6VHv3
	dweC5pTHv35JYPoY+qOoFS/HL1upT/kPAqGwe6F9ub2FBvozFynW/9WMW28zeakcKisHkKq7RU610
	j42Q8SAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgL6I-0000000CBaN-2B3N;
	Thu, 15 Jan 2026 11:01:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgL6G-0000000CBaH-0Ofa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:01:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E735601B2;
	Thu, 15 Jan 2026 11:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23A1C116D0;
	Thu, 15 Jan 2026 11:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768474870;
	bh=d0Vzuczske8axf2UyF1IUpB7lCBCclkqh2MRNLD0Cdo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=E2NGhJvzPH5ATDgD0v9reZeQkr9u7NU9g4CBTx518gShlhujAhOpU8d2o3xh6eYOH
	 /HYuW9l9QKiqiVMcyJ1yRb3b+X1SFIcnNWHjCDo0ey1U7SYY7wM82LhKLgXodVm+/f
	 0maJyth99RpO3KUJvEo8BRO9HWymU1F/BWFtnlAbWdw6vAcJpzE7a9Q17EDy1KvxEb
	 7klTFtMV+X2urQz27kF2BznUSjTic2opZ0m+E/mkWpWHQRsheH92hDxjbSkGrpgGox
	 sfOKzjOXMlwA5ccd7ojTmTqm9GmaLSnvJIcuPbQKpxA1okj5aVxX2ogBiEW5x8X3cE
	 LOWoqJ+/Pvohg==
From: Srinivas Kandagatla <srini@kernel.org>
To: linux-arm-kernel@lists.infradead.org, michal.simek@amd.com, 
 Harsh Jain <h.jain@amd.com>
Cc: Ivan Vera <ivanverasantos@gmail.com>, 
 Ivan Vera <ivan.vera@enclustra.com>, Harish Ediga <harish.ediga@amd.com>
In-Reply-To: <20260106103748.3993455-1-h.jain@amd.com>
References: <20260106103748.3993455-1-h.jain@amd.com>
Subject: Re: [PATCH] nvmem: zynqmp_nvmem: Fix buffer size in DMA and memcpy
Message-Id: <176847486942.51768.18380774096253426400.b4-ty@kernel.org>
Date: Thu, 15 Jan 2026 11:01:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Tue, 06 Jan 2026 16:07:48 +0530, Harsh Jain wrote:
> Buffer size used in dma allocation and memcpy is wrong.
> It can lead to undersized DMA buffer access and possible
> memory corruption. use correct buffer size in dma_alloc_coherent
> and memcpy.
> 
> 

Applied, thanks!

[1/1] nvmem: zynqmp_nvmem: Fix buffer size in DMA and memcpy
      commit: 7b08445cc7da049e66189d6d2dbc3cf37f9788d9

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


