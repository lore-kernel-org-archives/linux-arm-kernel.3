Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB12C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+8oVML2NrBbNu6T1OiR5HS57Y0ejNxUZksaivZAZ8c=; b=4t/n3pYhXKM9q7j8eSm4DMbbi3
	dDy64phdWthnzjuaUm4CQsTyYtHENo4cKNPxHBVfvqWnsWCGyDLYHbdRClhgWKQgE2yp3yoL9Nm8j
	bsscWn9bjtWHt+Kkpnhv4JIi1M+WQ/Fxs4c5RDMPneBNBcPFalBRPzU0Fbt1yJXHh4zxXEUm0pwWi
	o4MhRC6FoWUaABSmfU0sn45ZDyn/nuoL1PgtGTcfaaEPkVdZVg+DbWXUvGDW9PFlqxx8z0ZSpB6kR
	4QJmEteOyCSgj8548/eJxArKXa24gKi0X4o3XC7uxpD4WFTDf1VIhGJ3/PAJh1V+lTgshlDx6c3cz
	9OYye5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5sfx-00000000E6W-2U0l;
	Fri, 18 Apr 2025 20:51:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5se1-00000000DXC-1UPN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 20:49:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAACF61120;
	Fri, 18 Apr 2025 20:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E07CC4CEE2;
	Fri, 18 Apr 2025 20:49:02 +0000 (UTC)
Date: Fri, 18 Apr 2025 21:49:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2] arm64: Rework checks for broken Cavium HW in the PI
 code
Message-ID: <aAK6vPL0pizysMtH@arm.com>
References: <20250418093129.1755739-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250418093129.1755739-1-maz@kernel.org>
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
Cc: Oliver Upton <oliver.upton@linux.dev>, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, kvmarm@lists.linux.dev, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Apr 18, 2025 at 10:31:29AM +0100, Marc Zyngier wrote:
> Calling into the MIDR checking framework from the PI code has recently
> become much harder, due to the new fancy "multi-MIDR" support that
> relies on tables being populated at boot time, but not that early that
> they are available to the PI code. There are additional issues with
> this framework, as the code really isn't position independend *at all*.
> 
> This leads to some ugly breakages, as reported by Ada.
> 
> It so appears that the only reason for the PI code to call into the
> MIDR checking code is to cope with The Most Broken ARM64 System Ever,
> aka Cavium ThunderX, which cannot deal with nG attributes that result
> of the combination of KASLR and KPTI as a consequence of Erratum 27456.
> 
> Duplicate the check for the erratum in the PI code, removing the
> dependency on the bulk of the MIDR checking framework. This allows
> dropping that same check from kaslr_requires_kpti(), as the KPTI code
> already relies on the ARM64_WORKAROUND_CAVIUM_27456 cap.
> 
> Fixes: c8c2647e69bed ("arm64: Make  _midr_in_range_list() an exported function")
> Reported-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/3d97e45a-23cf-419b-9b6f-140b4d88de7b@arm.com
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: Oliver Upton <oliver.upton@linux.dev>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Oliver, if you are in a timezone where you are still working, please
pick it up. I might not have time until Monday otherwise.

Thanks.

-- 
Catalin

