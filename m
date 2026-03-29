Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722B5FC97EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 20:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXAROxKREcBa1g6JdEUgIJSPmTK4GN4PSywsZ7HTgFo=; b=C6/e7sDoIefmc2KKfzuyn4T9WV
	jW94El59o3DpW97oA34JhYSJdB3E2CFM+S/+s1TJiL7EZKM0zWiUqcA+V2mNk4qhhBvsAFPfjhk8V
	I+sn0Nr1uMy91oMXQP8TUYjxtuhgZP7AcZsjo3yd42pcwUXas9XlBXiP37J6C5oijm68vsKQQOWlu
	tUTNF0snqnp02ieufwlMzxsHPcUu9bmUnLiTLUfra1tBbhUustAVPF2mCW3Ap0I154hSP9d3TWAtB
	rjshYCq8liHXYnfFZowUT6+diFCJDeKoYF44+dcjP+C+CBV8sWIejljllnFzrGALirCVhNPLN4Rtb
	F1Yd4jUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6wu3-0000000AJcK-0jOY;
	Sun, 29 Mar 2026 20:38:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6wu0-0000000AJbz-3JrS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 20:38:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 817F4401C3;
	Sun, 29 Mar 2026 20:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E00C116C6;
	Sun, 29 Mar 2026 20:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774816711;
	bh=yYaQyjAQ+oTlcnhhYfdkv5KRzeJYgZ4/wQYablCPVRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XGq9cyzkihOvqpYwGMfsey8DxUJr4Z433YDhfv2hD0kW3+dYM8hW+dz8+3CIOEDPc
	 24sR2qhfx1p4ACjwTPWlwAFbPt/upIUvegheuBd4DBwyOnRzRXkisBunjttTpeq+m6
	 RBMWb6RA8znTgKcYcxxiwxW78V53CpBr8wiZqEJ7SX+f39G4GM81Jk/7T+shNaDTyE
	 JtfcVppFIfPKe054mpLMrqtQtbKvu3/JnJnd1nFpqN11h20ffXLF3leNtRQAIrcbI9
	 VWxIWeKZryV3B60yuk7mvEk+0Y1cXyOh/wTjyE2Bwb9I1GrNg/cwtLTT3//KpzKXJy
	 35YJ7vhf2ZUdQ==
Date: Sun, 29 Mar 2026 13:38:29 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Demian Shulhan <demyansh@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ardb@kernel.org
Subject: Re: [PATCH v3] lib/crc: arm64: add NEON accelerated CRC64-NVMe
 implementation
Message-ID: <20260329203829.GA2746@quark>
References: <20260317065425.2684093-1-demyansh@gmail.com>
 <20260329074338.1053550-1-demyansh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329074338.1053550-1-demyansh@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_133832_850444_B4C85E9C 
X-CRM114-Status: GOOD (  10.94  )
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

On Sun, Mar 29, 2026 at 07:43:38AM +0000, Demian Shulhan wrote:
> Implement an optimized CRC64 (NVMe) algorithm for ARM64 using NEON
> Polynomial Multiply Long (PMULL) instructions. The generic shift-and-XOR
> software implementation is slow, which creates a bottleneck in NVMe and
> other storage subsystems.
> 
> The acceleration is implemented using C intrinsics (<arm_neon.h>) rather
> than raw assembly for better readability and maintainability.
> 
> Key highlights of this implementation:
> - Uses 4KB chunking inside scoped_ksimd() to avoid preemption latency
>   spikes on large buffers.
> - Pre-calculates and loads fold constants via vld1q_u64() to minimize
>   register spilling.
> - Benchmarks show the break-even point against the generic implementation
>   is around 128 bytes. The PMULL path is enabled only for len >= 128.
> 
> Performance results (kunit crc_benchmark on Cortex-A72):
> - Generic (len=4096): ~268 MB/s
> - PMULL (len=4096): ~1556 MB/s (nearly 6x improvement)
> 
> Signed-off-by: Demian Shulhan <demyansh@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

Thanks!

- Eric

