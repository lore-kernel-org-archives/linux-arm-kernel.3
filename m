Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597C6FD2D9D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AGeRe5PSkn3N5Fwl9pfU07UQ6u6yNXf5YcgOi5jExA=; b=cyFu4EcQGQXV0vkh+oBLDc2fJb
	lCodm+J0eLAjCVPUN0CD0MHzFnJSKX42EtQD3jInWSdlRZJKFGpYwC3Tmy9121s+JgnVD4AnnBmhz
	EYwPSmyUB61xpE9+mvzJOMaD0VAgbLNHNy/fpFCMcswyGfOJXvibNdn9VX2CJN5feU9NBw3hKk611
	HowDVBqlgT0NUtmwtJ8+SI3pJBqyEjC5dkI7475uUdMz7MjrIQ+iEEsge7PVN6DKylS++QzrI0Eum
	bWqq03D5odjdY6jR3rSYVzIaeuYzXl89LR3gYIys+PxFi/9aDzmne78dQhxCOP43Zag4y5jT2xYQj
	QpXgLyrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FP4-0000000BDFV-0RSw;
	Wed, 11 Mar 2026 08:58:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FP1-0000000BDEb-2iVZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 08:58:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 358AF435E3;
	Wed, 11 Mar 2026 08:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11627C4CEF7;
	Wed, 11 Mar 2026 08:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773219530;
	bh=WO0BNQjNxV78n5IOyPU7x3leCM/hYOPwVQjiO409PJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uRgaZoj0FnzpUgGHuwMPA5AzG7DJ9T31YUKxsV5DFlbsT6HcCuMCpov9wGC9GdriK
	 wmGucz1pqSSYZIwnAFkyRi6D0OkGVX45FShxzC3ewEbGyOVfqFXTFghap2XXM93NuY
	 xu9hdfr3mDN+tzVpYyS8kduc3QeU3TLVfihS63TitOLlgYCDI3vDWsxY1DxFy8O24W
	 R3+M8ejtK8Y5jCqFKV6n9eUyKa3Wo536wOG5N+f2M60C+84Tg7ncqkyaCEzSkJMVPl
	 aYvZIq9qDnatDR7n1CcxV47Bjm+EPuYe7N44dcPeQoi0Vc9xoI17pV9IM8UA/79tj0
	 /z1TqkYVOTDDA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w0FOx-00000000mOj-2xfu;
	Wed, 11 Mar 2026 08:58:47 +0000
From: Marc Zyngier <maz@kernel.org>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	Oliver Upton <oupton@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	jstultz@google.com,
	qperret@google.com,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v14 00/30] Tracefs support for pKVM
Date: Wed, 11 Mar 2026 08:58:44 +0000
Message-ID: <177321950220.58730.2900926663831637604.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
References: <20260309162516.2623589-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, oupton@kernel.org, vdonnefort@google.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, jstultz@google.com, qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org, kernel-team@android.com, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_015851_735054_831580A0 
X-CRM114-Status: GOOD (  12.48  )
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

On Mon, 09 Mar 2026 16:24:46 +0000, Vincent Donnefort wrote:
> The growing set of features supported by the hypervisor in protected
> mode necessitates debugging and profiling tools. Tracefs is the
> ideal candidate for this task:
> 
>   * It is simple to use and to script.
> 
>   * It is supported by various tools, from the trace-cmd CLI to the
>     Android web-based perfetto.
> 
> [...]

Applied to next, thanks!

[19/30] KVM: arm64: Add PKVM_DISABLE_STAGE2_ON_PANIC
        commit: 9019e82c7e46c03c37e8b108473d02b543222d9f
[20/30] KVM: arm64: Add clock support to nVHE/pKVM hyp
        commit: 405df5b55748d93d44666fd6005c60981094a077
[21/30] KVM: arm64: Initialise hyp_nr_cpus for nVHE hyp
        commit: 8bbeb4d1698fb0945107c69019c15207bbe605c9
[22/30] KVM: arm64: Support unaligned fixmap in the pKVM hyp
        commit: 4cdf8dec8c115d9531f80519db69846c32c580a5
[23/30] KVM: arm64: Add tracing capability for the nVHE/pKVM hyp
        commit: 680a04c333fa29bf92007efe11431be005e8c4bb
[24/30] KVM: arm64: Add trace remote for the nVHE/pKVM hyp
        commit: 3aed038aac8d897016a2b6e1935f16c7640918d4
[25/30] KVM: arm64: Sync boot clock with the nVHE/pKVM hyp
        commit: b22888917fa411d100339ef9d418b4eb86aba962
[26/30] KVM: arm64: Add trace reset to the nVHE/pKVM hyp
        commit: 2194d317e07d169efc113344c531621ce31afe64
[27/30] KVM: arm64: Add event support to the nVHE/pKVM hyp and trace remote
        commit: 0a90fbc8a1709f682e0196c2632027cdedae5e94
[28/30] KVM: arm64: Add hyp_enter/hyp_exit events to nVHE/pKVM hyp
        commit: 696dfec22b8e4ac57cc90558af2b6be2b37f4b95
[29/30] KVM: arm64: Add selftest event support to nVHE/pKVM hyp
        commit: 5bbbed42f71f771a70e974e3726d283690ecd589
[30/30] tracing: selftests: Add hypervisor trace remote tests
        commit: 39d5ca62a3dab7d162d49eb60b14cdd46138590f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



