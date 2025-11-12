Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A7ECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D73MWA8ka8aEIE+w9e4D2DgNs2P+08G82s04OupWhnA=; b=ukZrBXSWUSkLuFK0LWfTw0AsW8
	ChF/d039plfP9NSYCjuZ7hC9xQJSylbp+MdrJzz/yxIIErCMcUU2W3QJBIdTRXeEItJzeHIZ8d9Ld
	j/5iV/ZX4hu/G49EG3gbcBLJUyETPUMz8KDx88Y3KFKgQN2rhHzSWK58s0JwZ67ld/6AMQyX/P1Ry
	gDH5Lul2vzd0VeHG2Q6fJXyoKQUCVsME2aHNg2DyMCdsd6s39l3xWNyvpuaHVi0sW0Y3wQeAHc1fn
	URJ+ZvvGp0QSxO0RXhfN3sSbpcEfNhoERtuAkf3oUQZRVDHK5e2RIYDuwRYyFJQBtTWnmK+YdHU+9
	cv3JwJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8Gx-00000008b3h-2Nyb;
	Wed, 12 Nov 2025 10:40:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8Gw-00000008b3Z-0UmW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C76F60211;
	Wed, 12 Nov 2025 10:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6A7C4CEF5;
	Wed, 12 Nov 2025 10:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762944016;
	bh=fArjS5d1VGJyoJlpK8/kTVa4co5DDb54sPzWb1uYDc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jAlWKDOpXUvGtie/QpUH+R5pbt+HZLKyo1ngtEYsp9M7sLAx0VkhBTqkXBZX78u/N
	 FRidhlc2r+Q9D5wm+9z+UosLMufqhdAedmRaXwY1wAyfAft6MkuY9INsucXOimoFxs
	 7Bj9sFmD6QV/1jJcGsn9wZUW6jeHovuREBQZ5MqzN9W0uyeQCMRqvgZMDgDrYFHxeE
	 hCr0tKZOoCRWGVTe+GimUKc//n0iPDFy3QMDjmFjRqGWylh7zeiOQu+wKKraA0piYi
	 D7Z9spKmDIxyDukveDYhUsjIOtWDKffJgqa4WIsB20xtbkjy8GAwqN9Ke/vu4NkF3s
	 FQjeQIEpmtISg==
Date: Wed, 12 Nov 2025 02:40:15 -0800
From: Oliver Upton <oupton@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH] KVM: arm64: VHE: Compute fgt traps before activating them
Message-ID: <aRRkD8tAVcGp5zsY@kernel.org>
References: <20251112102853.47759-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112102853.47759-1-alexandru.elisei@arm.com>
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

Hi Alex,

On Wed, Nov 12, 2025 at 10:28:53AM +0000, Alexandru Elisei wrote:
> On VHE, the Fine Grain Traps registers are written to hardware in
> kvm_arch_vcpu_load()->..->__activate_traps_hfgxtr(), but the fgt array is
> computed later, in kvm_vcpu_load_fgt(). This can lead to zero being written
> to the FGT registers the first time a VCPU is loaded.

Yikes! This is no good, thank you for spotting it.

> Also, any changes to
> the fgt array will be visible only after the VCPU is scheduled out, and
> then back in, which is not the intended behaviour.
> 
> Fix it by computing the fgt array just before the fgt traps are written
> to hardware.
> 
> Fixes: fb10ddf35c1c ("KVM: arm64: Compute per-vCPU FGTs at vcpu_load()")
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Oliver Upton <oupton@kernel.org>

> ---
> 
> Stumbled upon this when running a Linux guest on FVP with FEAT_S1PIE
> enabled.  Linux touches PIRE0_EL1 very early during boot, in __cpu_setup().
> HFGWTR_EL2 was 0 the first time the VCPU was run, KVM would then trap
> the access to PIR0_EL1 (PIRE0_EL1 is an inverted trap) and trigger the
> BUG_ON(!r->access) from perform_access().
> 
> I hacked __activate_traps_hfgxtr() to print the register value for
> HFGWTR_EL2. Before this patch, during the first vcpu_load(),
> HFGWTR_EL2 is 0, then it has the correct value. After this patch, it
> always has the correct value.
> 
> If I were to venture a shot in the dark, it might be that the name is a bit
> misleading - it's kvm_vpcu_load_fgt(), but it doesn't load anything onto
> hardware, it just computes values. Might be worth renaming to avoid
> similar ordering issues in the future.

Ack, naming isn't quite the best here. The idea was for the name to make
it obvious that it is meant to be used at vcpu_load().

Thanks,
Oliver

