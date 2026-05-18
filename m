Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02662CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntPcgXuiijPtNcQjvJZDG1WYIL2yByzBhpdDgns3eLM=; b=inyrbaav/NlRSGXr4IfWx/F5Ld
	SOB4h9rySA1qjYeUDB7r8h8IXU6nJlpGZ5f/159vBKHETRkc72u53gUq+pn79aMGFK9oNnRIYzI0d
	oyM6xB/7/CWMfix9VrEwOyQ1raBzI9h/Z/V18Es2ytrf6z0cDT5m0yVD/1jozrr5frk45mjbl107E
	sRoUdUtBIgMXz8W84ZpWMskpwzDVZfyBHT1Iila6bfzkUnL1YmT8UanMxpSS35ukyVyBKABfR0/Ut
	i9D90nIbr1gaB74BHwcDh0P5PJkENf8bsQ5DGJL2g2TB4SPwOMdPN+epN4bWoZjE9wjo2mMaJnzyo
	gVp9bCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyIE-0000000Fqyg-2jEh;
	Mon, 18 May 2026 13:46:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyIB-0000000Fqy4-3YWJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 13:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C1E143C9D;
	Mon, 18 May 2026 13:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC738C2BCB8;
	Mon, 18 May 2026 13:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779111958;
	bh=75yRSP2IEDju9uSJUM5mcUQkVTRaXUsmfsv1K2TMIPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4dnHL8iK3ErA20o/kJ5NoQ3Hl3LZ05nbGlKx0sywbn27A12YzQRvH36tNFS9q9LY
	 tsFcH/mBIh4iVIpMvtQXwZEQioYhVRnprWCe1o1E122IJSnhHcSFaPx4CEjgTggtZ2
	 z0QiAQ7hM0o/b4JcqFmR/7um/MOGzAZK3dXoH7WxxS/e7BmXCWfDus+B9JRCkT8J6Y
	 XFaD7Q7F7hLEm0cMdJ81/mHqzLhk/JWDhhWubYYZ59nJnzpYYZ6E5ITKyU3Z2oi32i
	 hbGDtL/8okaPEtPFKdLxndLHIBYAfF/4RsBEobWYZS4vdETBL/Cid4N48jsoznz7K9
	 LiBvXPZq1LZAQ==
Date: Mon, 18 May 2026 14:45:53 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, will@kernel.org,
	joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v3 0/2] arm_ffa, KVM: Fix FF-A emad offset calculations
Message-ID: <20260518-heavy-intelligent-partridge-ddc80b@sudeepholla>
References: <20260512124442.1899107-1-sebastianene@google.com>
 <20260513-ludicrous-beautiful-cuttlefish-34271d@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-ludicrous-beautiful-cuttlefish-34271d@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_064559_908023_12BD7CF5 
X-CRM114-Status: GOOD (  21.42  )
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

On Wed, May 13, 2026 at 06:23:43PM +0100, Sudeep Holla wrote:
> On Tue, May 12, 2026 at 12:44:40PM +0000, Sebastian Ene wrote:
> > Hi all,
> > 
> > This series fixes the Endpoint Memory Access Descriptor (EMAD) offset calculations
> > and adds the necessary bounds checks for both the core FF-A driver and the pKVM
> > hypervisor.
> > 
> > Prior to FF-A version 1.1, the memory region header didn't specify an explicit offset
> > for the EMADs, leading to the assumption that they immediately follow the header.
> > However, from v1.1 onwards, the specification dictates using the `ep_mem_offset` field
> > to determine the start of the memory access array.
> > 
> > The patches in this series address this by:
> > 1. Updating the core `arm_ffa` firmware driver to correctly calculate the descriptor
> >    offset using `ep_mem_offset` rather than defaulting to `sizeof(struct ffa_mem_region)`.
> >    It also introduces bounds checking against `max_fragsize`.
> > 2. Enhancing the pKVM hypervisor validation logic to no longer strictly enforce that
> >    the descriptor strictly follows the header, aligning it with the driver behavior
> >    and the FF-A specification, while also ensuring the offset falls within the mailbox
> >    buffer bounds.
> >
> 
> Looks good apart from the minor nits, but how do you plan to route these
> changes as they are dependent for functionality but not for the build IIUC.
>

You can add (with minor nit fixed) my

Reviewed-by:  Sudeep Holla <sudeep.holla@kernel.org>

if it is routed via KVM or other tree.

-- 
Regards,
Sudeep

