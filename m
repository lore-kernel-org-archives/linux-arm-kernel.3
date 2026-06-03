Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC0FCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 23:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63lWd/7ABwncvEN5kcTFLVuVMpSwlY9NkS59RGzcqao=; b=GRjO9oQaFIgX6+lQJ9huYb60l9
	tdI6dveVbBkuCp07BN1Zv2w2HmKPmYYsQagum+kqKLKICtLOoDOzVridbfrA7ZbNZBt9E550Vd4YS
	D4v8+uZgZMCO181QCzrqle/SQ53cj9UUhsZEfBctvGZkiD7cPs2ZBpb94rBnINKfD3m6Xw2s3uRBP
	6XdlrRNrGz3Xj/+CpDvWlKXG0h4cYz2EsqVEBlvLUp+jDc5jVxvS/qY/4FQPcOYVx5Eoj6wwxgFtK
	xDzn28S7ONdMWjHvHfpAGThg0sVS8w5csojs+1UnqjYyf5q6Vm6Z4VX5RZYvwWEnN/wUa/gLw0AKh
	Iy/OAcXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUugk-0000000Fuva-3P90;
	Wed, 03 Jun 2026 23:07:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUugj-0000000FuvU-0RdG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 23:07:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 79486601DF;
	Wed,  3 Jun 2026 23:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1132E1F00893;
	Wed,  3 Jun 2026 23:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780528072;
	bh=63lWd/7ABwncvEN5kcTFLVuVMpSwlY9NkS59RGzcqao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DW5uNPvyZjZ3q6AmHxFScbM9FiVEry5AAQP4Fh4Ks3HzceTFm+/lg74OMFoPOI6vn
	 jDLWZWbwBdMspHtldQMuH0+/L0ToqXNHUxdD5XmNLG56KmR6t1V+fSAo5doTLW25re
	 3E8ucZhFVZqWJUe4IVHBBMf0ICkLw4qZq+y9pfl8bHICWw4fpC/nEwCxZa3WwB298h
	 AhoOWO+IzMCBXrXGhISsLOjtM2YW7cUWQme/XxVgLd5dD9S69u19o8188+kjeIwb9A
	 6pWuR8OeDQ8QrZYzLoe0D6RvJzRfYpL4CeeuEMuvnH0NRh/GyKIvurQbKVADzJSZTb
	 xdkqibzBjLoNA==
Date: Wed, 3 Jun 2026 16:07:50 -0700
From: Oliver Upton <oupton@kernel.org>
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: maz@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Take the SRCU lock for page table walks
 in fault injection and AT emulation
Message-ID: <aiCzxtzmx1BIw3RE@kernel.org>
References: <aiAZfdeyanIvP8SD@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiAZfdeyanIvP8SD@v4bel>
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

On Wed, Jun 03, 2026 at 09:09:33PM +0900, Hyunwoo Kim wrote:
> walk_s1() and kvm_walk_nested_s2() expect to be called while holding
> kvm->srcu to guard against memslot changes. While this is generally
> the case, __kvm_at_s12() and __kvm_find_s1_desc_level() call into the
> respective walkers without taking kvm->srcu.
> 
> Fix by acquiring kvm->srcu prior to the table walk in both instances.
> 
> Cc: stable@vger.kernel.org
> Fixes: 50f77dc87f13 ("KVM: arm64: Populate level on S1PTW SEA injection")
> Fixes: be04cebf3e78 ("KVM: arm64: nv: Add emulation of AT S12E{0,1}{R,W}")
> Suggested-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>

Reviewed-by: Oliver Upton <oupton@kernel.org>

-- 
Thanks,
Oliver

