Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08978FC5936
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 11:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXNjXmlJuaXJ3/KWcjpycRdtonyfAccPdluhmX0qK3o=; b=sFlSX7kfMmLDdiVmgl3Mn0Jpf1
	m1tRuAf0+ybMy/eASo0oEpNuSMd9zh3+1qG4qUXG4fEZmDCyeliMG58AmxHZn9U8FdTbXUkovjYgn
	SUASS+GwxrF3oCxVgG3zcjKiF+fh2kR7zjJ9E7WzZVdNLvzKH+uDqaIrN52UO89oyW0JCZXNZES9D
	mJmz/QzsIFVZUL1j6pQbZ/kE+dJ9fLBi4cQhIQp4fGO7tH6NqLJp4m10kWl8+KO5UHzQ9TpPR6Y9w
	p310WFNtmjTkRh36UCR1LBFlCJOwm2U4oHX6ggCfY37NtShQerM8Px/3B4JVxHXZm+Wllk3YyZB4u
	iCm/3IBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZhR-000000063XI-3PMk;
	Thu, 26 Feb 2026 11:38:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZhQ-000000063XB-46hN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 11:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E7CE60054;
	Thu, 26 Feb 2026 11:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7972BC116C6;
	Thu, 26 Feb 2026 11:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772105911;
	bh=h0LXqcIKOrvxUgaaQZFhxxdHYHkQ0+ABx+hsGmP7jz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WBnlrRXsE6ZbQPudY3I0xHS7hZGfQ4B0Ogf5rz6MH/MzklysmhGRoocHOedAKhRSw
	 Zb9o0R1J4owSQcmJPaAoUxoPXPrJ9L51DXP2Ki820buN+4xv/he7cSfs0Loegg0lWG
	 k5HUmYffeRYsyfoOcKyrEhPtHYQjAI+3Pz4iWJ++CGqjOVzTpwDPB3sJVzyzo0q8QF
	 D+lYVWYxk6L1tAfK0zIyHoYOf1uSnEPlo3BUmV3IPkVOxVmWvxrQYmG0m10yztN8el
	 XdUAtCTmMoAW/8jMWLDx6DOFOdGgbRqD5IQpON49sXYnQF3p0xZkGn5qeIilqrZHpw
	 s/ByNyn5Zycpg==
Date: Thu, 26 Feb 2026 03:38:30 -0800
From: Oliver Upton <oupton@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, catalin.marinas@arm.com,
	will@kernel.org, maz@kernel.org, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, broonie@kernel.org, ardb@kernel.org,
	suzuki.poulose@arm.com, lpieralisi@kernel.org, joey.gouly@arm.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v14 7/8] KVM: arm64: use CASLT instruction for swapping
 guest descriptor
Message-ID: <aaAwtrrJ-qFrqktX@kernel.org>
References: <20260225182708.3225211-1-yeoreum.yun@arm.com>
 <20260225182708.3225211-8-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225182708.3225211-8-yeoreum.yun@arm.com>
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

On Wed, Feb 25, 2026 at 06:27:07PM +0000, Yeoreum Yun wrote:
> +	asm volatile(__LSUI_PREAMBLE
> +		     "1: caslt	%[old], %[new], %[addr]\n"

The other two flavors of this use relaxed ordering, why can't we do the
same with LSUI?

Thanks,
Oliver

