Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B4DCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 15:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTElWOP//wMhXImGNO1nqFzyqj+EmTCOLKS9BkzlFDs=; b=bXH1KgeKsZID7m7xJzZ8PQe2ve
	Ee7+2x7QbP9f4IV5g25PVgnJwDh/VQoo06YskuhYpuv9wWt3ZBsKSzXXQU4t1PzNj47tRix5W7xry
	pX1//U8kzOf6+spIipJ0mrPrSiCKt/8d2lfjeTHxHlURPDus982RTEYRPlEzz7SYaSkKlKk8Md8fm
	4HwCKGfOQEgN/U5Oi6BaM+nEUBJKjKmfSNSa8e/bnzT8DI9dHJwE3ks9/PMGrYb1nEDL0J4vbHTiQ
	CX1LwHxziK5P0tnQlvBXBlBuuDBe2Ruu9HWfABQegCE/z4XeZZdAPVXqHaH9IR1isT4J/owkR3YZy
	K4Lwtpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOmy-0000000016J-3wAU;
	Fri, 07 Nov 2025 15:54:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOmv-0000000013P-0v9X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 15:54:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6058C6191F;
	Fri,  7 Nov 2025 15:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678FAC113D0;
	Fri,  7 Nov 2025 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762530848;
	bh=8V/Rlq9/emBvp82XL/vpoXH1hrY7KN0fNkz7ZVVTsiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GCpR6oVdx2RahJnXstUMQW7fUedg6p0LY6Nocw+1KCly83qX2zmhqp3dDy2L+bmwG
	 S5NGNcWxiPaSYI9n9L59M57ZOPFfaRs1Q3RU1zmZoHkyZQnYQUfBf3MsR+qSGLezxq
	 DyRRPXRl+OTb3DrvJ4xbqasTpszRaX0zVOLaHDdcq6GNWs8msaN5v7EcSuZNivCuUt
	 nf4BTIGA//dFo8XAi9XpqyZR+q8KxQLg+2/wv0Z4TbAfsJucqCGXSlDRNgIj6uLL3w
	 hwdlLSm/7/4uVau+w6i9sTCXLYopB2rmoUGLm0OUBI/pCYmYpCxjK06BJNViWtIGjz
	 muz7VSTVxHeiA==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	yang@os.amperecomputing.com,
	david@redhat.com,
	ardb@kernel.org,
	dev.jain@arm.com,
	scott@os.amperecomputing.com,
	cl@gentwo.org,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Don't sleep in split_kernel_leaf_mapping() when in atomic context
Date: Fri,  7 Nov 2025 15:53:46 +0000
Message-Id: <176252659699.596695.10001449481948666856.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251106160945.3182799-1-ryan.roberts@arm.com>
References: <20251106160945.3182799-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 06 Nov 2025 16:09:40 +0000, Ryan Roberts wrote:
> This is v2 of the fix for split_kernel_leaf_mapping(). I've expanded it into 3
> patches based on feedback from v1 [1].
> 
> Once happy with the content, patch 1 is needed urgently for next -rc to fix
> regression since 6.18-rc1. The other patches could wait until 6.19, but I'd
> prefer they all go together into 6.18.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/3] arm64: mm: Don't sleep in split_kernel_leaf_mapping() when in atomic context
      https://git.kernel.org/arm64/c/ce2b3a50ad92
[2/3] arm64: mm: Optimize range_split_to_ptes()
      https://git.kernel.org/arm64/c/40a292f70147
[3/3] arm64: mm: Tidy up force_pte_mapping()
      https://git.kernel.org/arm64/c/53357f14f924

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

