Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF7BCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Uuv8oceQ5V16SKxprCAkG9sIZe7FyXEiMnVrbqOp6Q=; b=agR50E/Kv4Bp+xWhmjnal1aqlG
	DV7F+uTHdA2zTW6G0kZvUgz37cUmN5axIdSwuU03yvqEYn1/uLn1yqE+bjqu1Zn4SUBQS6Ds56V72
	jlkzhVPrkQUPx9XpEtla9L+vO2Nzl0ab977LMOtpCJf8Yj7Na+pYlyHKxOiRdMrjG3dyicx8PzWxj
	1+CD5qslGPd3VsAq+b/mVNHbzLcUB35WEEZjtTGxWmWZU6MKMdf2Rf5cN6g1zQJnGMmOQRfQ4MXuu
	JGcVy4fYOWclShAbxkLVMwV3T6PEIhOF3o0v0n9rqbhDT/jnEaab5O1sLN3JBDyPz+d/pnTzvfUgk
	6OJd1GzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKuf-00000000A8s-3bXZ;
	Thu, 15 Oct 2026 12:50:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKue-00000000A8C-1lKr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:50:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F50E43DDF;
	Thu, 15 Oct 2026 12:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD471F000C4;
	Thu, 15 Oct 2026 12:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792068624;
	bh=7Uuv8oceQ5V16SKxprCAkG9sIZe7FyXEiMnVrbqOp6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dWzPLxc9NQjdkysD/upQJDiHcjxi2Jsn8Rts1ELBMd0oE7adXWYHG2ta4n+CWHeWt
	 2T2HhmCuCWrfareXUveGJpyf4exzODx+B20sl1x4vZAnJzaRGnzWG+znmFJ1ryYVph
	 Wj8WTa/7KxzIReHWBXIYSdAsDd53Nzy4cgeTe4YZHKOK05ACs2NLiUY8tHaYFxybk7
	 30PfG5nU9vvoUGYuChw95G/3Y6QYt0E7eKTInhau7qN+u3fwc5wjrxhk1TpZi/J3Vt
	 PO/8td+TkeundvyMSGWO1HbrFbHxOHRbk2zia2VrJq9/adrei6OCKy+kGc4iRcF618
	 /Tr/JZgTo/fQA==
Date: Thu, 15 Oct 2026 13:50:18 +0100
From: Will Deacon <will@kernel.org>
To: Koba Ko <kobak@nvidia.com>
Cc: Breno Leitao <leitao@debian.org>, catalin.marinas@arm.com,
	robh@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	fenghuay@nvidia.com, tdave@nvidia.com, kaihengf@nvidia.com,
	rupakr@nvidia.com, mohammedk@nvidia.com
Subject: Re: [RFC PATCH v2 1/3] arm64: add CPU prefetch and cache modulation
 sysfs interface
Message-ID: <atDMCsj4yVnwhocf@willie-the-truck>
References: <20260825181701.3-1-kobak@nvidia.com>
 <20260825181701.3-2-kobak@nvidia.com>
 <aru9Rf7BzW3-vcm0@willie-the-truck>
 <20261014061745.40032-1-kobak@nvidia.com>
 <as9HWuAhOGMfH1Ty@gmail.com>
 <179206734688.387067.11244555739178101423@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179206734688.387067.11244555739178101423@nvidia.com>
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

On Thu, Oct 15, 2026 at 08:29:06PM +0800, Koba Ko wrote:
> Thanks for explaining the rebase, rollout and debugging costs of carrying
> this out of tree. That's useful context from someone using the patchset.
> 
> CONFIG_EXPERT plus tainting on use could make experimental use more
> explicit. Those safeguards alone would not establish that firmware
> access, virtualization and runtime register updates are handled safely;
> the local restrictions still need validation against the hardware and
> firmware requirements.
> 
> I'd like to hear Will's view on whether this opt-in approach could be
> acceptable in principle, and what requirements it would need to meet.
> I'm not planning to submit v3.

No, this isn't something we should be maintaining in the upstream kernel
and if we take this then we'll suddenly grow a zoo full of this stuff.

If Nvidia has imp-def controls that they believe are useful to expose to
userspace, then I suggest working with Arm to get something architectural
that we can support across different pieces of hardware and which would
integrate properly with the rest of the architecture (including things
like virtualisation and debug).

Will

