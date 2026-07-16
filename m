Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDA7C44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xc5ThQMHryU1Ipvo5TSCt9FTpHI5kXdKxf3yESYTO2o=; b=XHTw2oHHLsd5jSud+hpWQcRE+3
	Bu6rtnD+lsbsmav6XriuuSKN6m5Susg5TEVHKhEzk1q73vKmVq+Ir5J1qE2eCZm0nsCJnmpVKh4/A
	gX8/hfRnMkJFhtVmiYcVD6/qPYvObrN82pZMOHXrXI7dYqTku8Q+GY07pERxhAHdqrhfeR0N7Kioz
	2P2O+wxKeYgR2wX0AAoMfVd8ZQguoneZgfU4f5uKAAlf/wpkrX1NByMSHQybOysVHChj2P4TWKooo
	TCN2Xkztm5ygGWQCjJwfTunpWcvNUbKQclZQ0U13xqwu2f9fQNKlODRGEMgHe1+0eE2cD4Ir9MUbZ
	EaZ+nWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPFq-00000000CbG-224N;
	Thu, 16 Jul 2026 16:48:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPFp-00000000Cay-23rS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:48:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6FB460A5E;
	Thu, 16 Jul 2026 16:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C743D1F00A3A;
	Thu, 16 Jul 2026 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784220488;
	bh=Xc5ThQMHryU1Ipvo5TSCt9FTpHI5kXdKxf3yESYTO2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AUJL2plsSnlHVkA++gOsR70ld8MyFB3UQTvJnOGbD+pAnfn/LKL/BGQKeO9VsH1FL
	 Nai2rgEJ8qbJnsKJOUHY0uYBCWvahhzgr88p8REL55Y0BtFvIXdwiunqIbRmCYymoD
	 OLvOmb+OANCYVvMEeOcsFHPHUmAhmxuTTt5hbE+JU/IsB8BrnkH1fQoFKnmrA7/sBc
	 ZMth56PfU2MAVo/hNc2n0/szTRewyoAsNYelxK0xDY0DGYadR0TnYYUYmEokkEMiAK
	 97mYF+q3Bes2nM4u6ZANDqsKSlJgclzkC+dKpXzl5QsmjopUTmvKYInGkWcQKob7Zp
	 jjMouL/v3w9bg==
From: Will Deacon <will@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm_mpam: Fix software reset values of MPAMCFG_PRI
Date: Thu, 16 Jul 2026 17:47:56 +0100
Message-ID: <178420945293.36085.2697955489302440125.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260515085825.1157812-1-ben.horgan@arm.com>
References: <20260515085825.1157812-1-ben.horgan@arm.com>
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

On Fri, 15 May 2026 09:58:25 +0100, Ben Horgan wrote:
> Priority partitioning is not supported other than to set the per-PARTID
> defaults in MPAMCFG_PRI, INTPRI and DSPRI, to the highest priority. When 0
> is the lowest priority, all ones is the highest priority. However, these
> values are calculated with an extra higher bit set.
> 
> Luckily, there is still no chance of setting functional bits incorrectly.
> When the priority widths are maximal, this is ensured as the fields have
> width 16 and a u16 holds the value for each field. When the widths are
> smaller, the higher order bits beyond the advertised widths,
> MPAMF_PRI_IDR.DSPRI_WD and MPAMF_PRI_IDR.INTPRI_WD, in the priority fields
> INTPRI and DSPRI are not used to calculate the priority.  It is not
> specified whether these higher order bits are RAZ/WI or Res0 and so it is
> desirable not to set them to avoid the chance of misleading reads.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm_mpam: Fix software reset values of MPAMCFG_PRI
      https://git.kernel.org/arm64/c/9469764292e0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

