Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29179C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPXOvooyWouOdL/A4WYaSuaAb3OzwtFv0NRk9ELsiGA=; b=Y8BYnTtzAFI4bhrjGeUtSJV/t/
	/yQzY0CPQOAcFjNxCS9MU5PHd4Uiy723gEOZUudLVGfkMKhcAeKHp8QPUF/QIKAeCZbP5OxF/d52Z
	oQB2DyHzZnGc2H+5CIk0Cqn5fNs9oF0DMjIsfTth2I1pZFUJ0MKnV07RyBWpeBNknVlQc7DCg1rvL
	48EucNMDDrUIqEecuoCunTZWWOK06sYbTSS/iItTi86M/XwegfbZ0i4dbPHpbN5SXPGNY6FjMGwdq
	k9wD2KuqlrWSUenSjKB1fhTVpvGWENADaqHTNk4N2Q38O7Sw5xf3BLT2muEgIPXYj7YMqvzZTcWGK
	HNEX3QRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXJu-00000003p84-0sld;
	Thu, 27 Aug 2026 10:26:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXJr-00000003p7f-3HnL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 10:26:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1B561688;
	Thu, 27 Aug 2026 03:26:46 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7709E3F85F;
	Thu, 27 Aug 2026 03:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787826410; bh=YnYMulZPGu41LR1PNsZBIVg2v4O5Tm82x/NaKiQ8XdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Waq1y0lXQXQliUWthqaocKtWOkHSZ13e9mwpO/K6qwap81T+gguibmGGTQ6ATFvCf
	 bQmYTUJbQelvTi0WplSxnQsGS9igHYRJC9JeB89MbaX+d+j5HKBEVNeQmAB0Yahvx5
	 yDkhFXYW2oCb+GmSxOlApsaw4KoU/pwo8UKCYTNQ=
Date: Thu, 27 Aug 2026 11:26:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: asid: Do not replace active_asids if already 0
Message-ID: <apAQ4gc71DiGmDO2@arm.com>
References: <20260809180600.6049-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809180600.6049-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_032651_871649_5A44A83E 
X-CRM114-Status: GOOD (  12.04  )
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

On Sun, Aug 09, 2026 at 08:06:00PM +0200, Karl Mehltretter wrote:
> This is similar to the arm64 patch [1], with the difference that
> non-relaxed (cmp)xchg is used as in the existing ARM code.

The patch is still valid. It's safe to use the relaxed accessors here if
you want or maybe do it as a separate patch for other atomic ops in this
code. I think at the time we added the ASID allocator, there were no
relaxed accessors in the kernel.

You can send it to Russell's patch system.

-- 
Catalin

